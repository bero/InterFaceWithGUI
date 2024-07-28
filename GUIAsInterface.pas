unit GUIAsInterface;

interface

uses
  // VCL
  Classes,
  Forms,
  Controls,
  ExtCtrls,
  Dialogs;

type
  IInterfaceRegistry = interface
  ['{1F44813F-A8EA-4C5C-B7E9-34626108C171}']
    procedure RegisterClass(const IID: TGUID; aClass: TComponentClass);
  end;

  IGuiDialog = interface
  ['{22E22636-9312-4606-90CB-497D1E07FF2F}']
    function ShowModalForm(ACustomForm: TCustomForm): integer;
  end;

  IGUI = interface
    ['{49C1E5D8-92CE-486C-9082-FC257C1F2A6A}']
    function GuiDialog: IGuiDialog;
    procedure RegisterForm(const IID: TGUID; aClass: TComponentClass); overload;
  end;

function Gui: IGUI;

implementation

uses
  SysUtils;

type
  TInterfaceClassRegistryEntry = record
    IID: TGUID;
    ComponentClass: TComponentClass;
  end;

  TInterfaceInstanceRegistryEntry = record
    IID: TGUID;
    InstanceAsComponent: TComponent;
  end;

  TClassRegistryArray = array of TInterfaceClassRegistryEntry;
  TInterfaceRegistryArray = array of TInterfaceInstanceRegistryEntry;

  TInterfaceRegistry = class(TComponent, IInterfaceRegistry)
  private
    fClasses: TClassRegistryArray;
    fInstances: TInterfaceRegistryArray;
    class var _Instance: IInterfaceRegistry;
    procedure InternalRegisterInstance(const IID: TGUID; aComponent: TComponent; out Obj);
    function FindClass(const IID: TGUID): TComponentClass;
    procedure RegisterClass(const IID: TGUID; aClass: TComponentClass);
  protected
    function QueryInterface(const IID: TGUID; out Obj): HResult; override;
  public
    procedure BeforeDestruction; override;
  end;

  TGUI = class(TInterfaceRegistry, IGUI)
  private
    function GuiDialog: IGuiDialog;
    procedure RegisterForm(const IID: TGUID; aClass: TComponentClass); overload;
  end;

var
  _UnitFinalized: boolean;

function GUI: IGUI;
begin
  if not Assigned(TInterfaceRegistry._Instance) then
  begin
    if _UnitFinalized then
      Raise Exception.Create('Attempt to access Gui after finalization.')
    else
      TInterfaceRegistry._Instance := TGui.Create(Application);
  end;
  result := TInterfaceRegistry._Instance as IGUI;
end;

procedure TGui.RegisterForm(const IID: TGUID; aClass: TComponentClass);
begin
  RegisterClass(IID, aClass);
end;

function TGUI.GuiDialog: IGuiDialog;
begin
  result := GUI.GuiDialog;
end;

{ TGui }

function TInterfaceRegistry.FindClass(const IID: TGUID): TComponentClass;
var
  i: integer;
begin
  for I := 0 to length(fClasses) - 1 do
    if IsEqualGUID(fClasses[i].IID, IId) then
    begin
      Exit(fClasses[i].ComponentClass);
    end;
  result := nil;
end;

function TInterfaceRegistry.QueryInterface(const IID: TGUID; out Obj): HResult;
var
  vComponentClass: TComponentClass;
begin
  if _UnitFinalized then
    raise Exception.Create(ClassName + 'TInterfaceRegistry.QueryInterface: Unit AttracsGUI already finalized.');

  vComponentClass := FindClass(IID);
  if Assigned(vComponentClass) then
  begin
    // see if there is class registered for specified interface, if so create an instance
    InternalRegisterInstance(IID, vComponentClass.Create(Application), Obj);
    exit(S_OK);
  end;
  result := inherited QueryInterface(IID, Obj);
end;

procedure TInterfaceRegistry.RegisterClass(const IID: TGUID; aClass: TComponentClass);
var
  i: integer;
  vComponentClass: TComponentClass;
begin
  if aClass.GetInterfaceEntry(IID) = nil then
    raise Exception.Create(ClassName + '.RegisterClass: ' + aClass.ClassName + ' does not implement the specified interface.');

  vComponentClass := FindClass(IID);
  if Assigned(vComponentClass) then
    raise Exception.Create('Another class ' + vComponentClass.ClassName + ' already registered for specified interface.');

  i := Length(fClasses);
  SetLength(fClasses, i+1);
  fClasses[i].IID := IID;
  fClasses[i].ComponentClass := aClass;
end;

procedure TInterfaceRegistry.BeforeDestruction;
begin
  _Instance := nil;
  SetLength(fClasses, 0);
  SetLength(fInstances, 0);
  inherited;
end;

procedure TInterfaceRegistry.InternalRegisterInstance(const IID: TGUID; aComponent: TComponent; out Obj);
var
  i: integer;
begin
  aComponent.FreeNotification(self);
  if aComponent.GetInterface(IID, Obj) then
  begin
    i := Length(fInstances);
    SetLength(fInstances, i+1);
    fInstances[i].IID := IID;
    fInstances[i].InstanceAsComponent := aComponent;
  end
  else
    raise Exception.Create(AComponent.ClassName + ' does not implement specified interface');
end;

initialization

finalization
  _UnitFinalized := true;

end.
