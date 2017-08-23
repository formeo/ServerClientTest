unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ScktComp, StdCtrls, ExtCtrls;

type
  TfrmMain = class(TForm)
    grpButtons: TGroupBox;
    spl1: TSplitter;
    mmoLog: TMemo;
    lb1: TLabel;
    edtPort: TEdit;
    btnGetState: TButton;
    btnInit: TButton;
    btnExeCommad: TButton;
    btnGetResult: TButton;
    lb2: TLabel;
    edtMessage: TEdit;
    btnConnect: TButton;
    btnDisconnect: TButton;
    clSock: TClientSocket;
    procedure btnConnectClick(Sender: TObject);
    procedure clSockConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure btnDisconnectClick(Sender: TObject);
    procedure btnGetStateClick(Sender: TObject);
    procedure clSockDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure clSockRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure clSockError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure btnInitClick(Sender: TObject);
    procedure btnExeCommadClick(Sender: TObject);
    procedure btnGetResultClick(Sender: TObject);
  private
    { Private declarations }
    procedure blockButtons(const state:boolean);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnConnectClick(Sender: TObject);
begin
  mmoLog.Lines.Clear;
  try
    clSock.Host:='127.0.0.1';
    clSock.Port:=StrToIntDef(edtPort.Text,7777);
    clSock.Active:=true;
    mmoLog.Lines.add('Сервер подключен');
    Application.ProcessMessages;
  except
    on e:Exception do
    begin
      mmoLog.Lines.add('Ошибка соединения - '+e.Message);
    end;
  end
end;

procedure TfrmMain.clSockConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  btnGetState.Enabled:=true;
  btnInit.Enabled:=true;
end;

procedure TfrmMain.btnDisconnectClick(Sender: TObject);
begin
  clSock.Active:=False;
end;

procedure TfrmMain.btnGetStateClick(Sender: TObject);
begin
  blockButtons(true);
  mmoLog.Lines.Clear;
  if clSock.Socket.Connected then

  begin
    mmoLog.Lines.add('Отправка команды GetState');
    clSock.Socket.SendText('GetState');
  end
  else
    mmoLog.Lines.add('Сервер отключен');
end;

procedure TfrmMain.clSockDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  mmoLog.Lines.add('Сервер отключен');
end;

procedure TfrmMain.clSockRead(Sender: TObject; Socket: TCustomWinSocket);
begin
  blockButtons(false);
  mmoLog.Lines.Clear;
  mmoLog.Lines.add('Ответ сервера: '+ clSock.Socket.ReceiveText);
end;

procedure TfrmMain.clSockError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  mmoLog.Lines.Add('Ошибка связи: '+ inttostr(ErrorCode))
end;

procedure TfrmMain.btnInitClick(Sender: TObject);
begin
  blockButtons(true);
  mmoLog.Lines.Clear;
  if  clSock.Socket.Connected then
  begin
    mmoLog.Lines.add('Отправка команды Init');
    clSock.Socket.SendText('Init');
  end
  else
    mmoLog.Lines.add('Сервер отключен');
end;

procedure TfrmMain.btnExeCommadClick(Sender: TObject);
begin
  blockButtons(true);
  mmoLog.Lines.Clear;
  if  clSock.Socket.Connected then
  begin
    mmoLog.Lines.add('Отправка команды Run');
    clSock.Socket.SendText('Run,'+edtMessage.Text);
  end
  else
    mmoLog.Lines.add('Сервер отключен');
end;

procedure TfrmMain.btnGetResultClick(Sender: TObject);
begin
  blockButtons(true);
  mmoLog.Lines.Clear;
  if  clSock.Socket.Connected then
  begin
    mmoLog.Lines.add('Отправка команды GetMessage');
    clSock.Socket.SendText('GetMessage');

  end
  else
    mmoLog.Lines.add('Сервер отключен');
end;

procedure TfrmMain.blockButtons(const state: boolean);
begin
  if state then
  begin
    btnGetState.Enabled:=false;
    btnExeCommad.Enabled:=false;
    btnInit.Enabled:=false;
    btnGetResult.Enabled:=false;
    btnConnect.Enabled:=false;
    btnDisconnect.Enabled:=false;
  end
  else
  begin
    btnGetState.Enabled:=true;
    btnExeCommad.Enabled:=true;
    btnInit.Enabled:=true;
    btnGetResult.Enabled:=true;
    btnConnect.Enabled:=true;
    btnDisconnect.Enabled:=true;
  end;
end;

end.
