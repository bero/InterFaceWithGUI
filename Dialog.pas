unit Dialog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TDialogForm = class(TForm)
    btnOk: TButton;
    btnCancel: TButton;
    lblName: TLabel;
    txtName: TEdit;
  public
    class function Execute(const AName: string): string;
  end;

implementation

{$R *.dfm}

{ TDialogForm }

class function TDialogForm.Execute(const AName: string): string;
var
  oDialog: TDialogForm;
begin
  oDialog := TDialogForm.Create(nil);
  oDialog.txtName.Text := AName;
  if oDialog.ShowModal = mrOk then
  begin
    Result := oDialog.txtName.text;
  end;
end;

end.
