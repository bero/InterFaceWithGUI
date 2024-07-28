unit Dialog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  uInterfaces;

type
  TDialogForm = class(TForm, ITestDlg)
    btnOk: TButton;
    btnCancel: TButton;
    lblName: TLabel;
    txtName: TEdit;
  public
    function Execute(const AName: string): string;
  end;

implementation

{$R *.dfm}

uses
  GUIAsInterface;

function TDialogForm.Execute(const AName: string): string;
begin
  txtName.Text := AName;
  if ShowModal = mrOk then
  begin
    Result := txtName.text;
  end;
end;

initialization
  Gui.RegisterForm(ITestDlg, TDialogForm);

end.
