unit MainForm;

interface

uses
  System.Classes,
  System.SysUtils,
  System.Variants,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.StdCtrls,
  Winapi.Messages,
  Winapi.Windows;

type
  TMain = class(TForm)
    lblResult: TLabel;
    btnResult: TButton;
    txtResult: TEdit;
    btnName: TButton;
    procedure btnResultClick(Sender: TObject);
  end;

var
  Main: TMain;

implementation

{$R *.dfm}

uses
  GUIAsInterface,
  uInterfaces;

procedure TMain.btnResultClick(Sender: TObject);
var
  sName: string;
begin
  sName := (GUI as ITestDlg).Execute(txtResult.Text);
  if sName <> '' then
  begin
    txtResult.Text := sName;
  end;
end;

end.
