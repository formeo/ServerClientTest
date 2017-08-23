program Server;

uses
  Forms,
  uMain in 'uMain.pas' {frmMain},
  uServerThread in 'uServerThread.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
