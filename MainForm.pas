unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TMain = class(TForm)
    lblResult: TLabel;
    btnResult: TButton;
    txtResult: TEdit;
    procedure btnResultClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

{$R *.dfm}

uses
  Dialog;

procedure TMain.btnResultClick(Sender: TObject);
var
  sName: string;
begin
  sName := TDialogForm.Execute(txtResult.Text);
  if sName <> '' then
  begin
    txtResult.Text := sName;
  end;
end;

end.
