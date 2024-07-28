program InterfaceDemo;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {Main},
  Dialog in 'Dialog.pas' {DialogForm},
  uInterfaces in 'uInterfaces.pas',
  GUIAsInterface in 'GUIAsInterface.pas';

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := True;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
