unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ScktComp, StdCtrls;

type
  TfrmMain = class(TForm)
    btnStart: TButton;
    btnStop: TButton;
    mmoLog: TMemo;
    edtMessage: TEdit;
    srvMainSocket: TServerSocket;
    procedure srvMainSocketGetThread(Sender: TObject; ClientSocket: TServerClientWinSocket; var SocketThread: TServerClientThread);
    procedure btnStartClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses
  uServerThread;

{$R *.dfm}

procedure TfrmMain.srvMainSocketGetThread(Sender: TObject; ClientSocket: TServerClientWinSocket; var SocketThread: TServerClientThread);
begin
  mmoLog.Lines.Add('Подключен клиент: ' + ClientSocket.RemoteHost);
  SocketThread := TServerThread.Create(FALSE, ClientSocket);
end;

procedure TfrmMain.btnStartClick(Sender: TObject);
begin
  srvMainSocket.Port := 7777;
  srvMainSocket.Active := true;
  btnStart.Enabled := false;
  btnStop.Enabled := true;
  mmoLog.Lines.Clear;
  mmoLog.Lines.Add('Сервер запущен')
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  srvMainSocket.Active := false;
  btnStop.Enabled := false;
  mmoLog.Lines.Add('Остановлен')
end;

procedure TfrmMain.btnStopClick(Sender: TObject);
begin
  srvMainSocket.Active := false;
  btnStop.Enabled := false;
  btnStart.Enabled := true;
  mmoLog.Lines.Add('Остановлен')
end;

end.

