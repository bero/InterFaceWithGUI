program InterfaceDemo;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {Main},
  Dialog in 'Dialog.pas' {DialogForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
