unit uServerThread;

interface

uses
  windows, scktcomp, SysUtils, Classes, Forms;

type
  TServerStates = (notInitialized, Ready, Processing, ProcessingDone);

type
  EServerThread = class(Exception);

  TServerThread = class(TServerClientThread)
  private
    fSocketStream: TWinSocketStream;
    fServerState: TServerStates;
    internalMessage: string;
    function ArrayToString(const a: array of Char): string;
    function GetState: string;
    function Init: string;
    function Run: string;
    function GetMessage: string;
  public
    procedure InitServer;
    procedure ClientExecute; override;
  end;

implementation

function TServerThread.ArrayToString(const a: array of Char): string;
begin
  if Length(a) > 0 then
    SetString(Result, PChar(@a[0]), Length(a))
  else
    Result := '';
end;

procedure TServerThread.ClientExecute;
var
  Data: array[0..1023] of char;
  RecText: string;
  SocketStream: TWinSocketStream;
  Buffer: array[0..4096] of Char;
begin
  while not Terminated and ClientSocket.Connected do
  try
    SocketStream := TWinSocketStream.Create(ClientSocket, 100000);
    if (not Terminated) then
    try
      try
        FillChar(Data, SizeOf(Data), 0);
        if SocketStream.Read(Data, SizeOf(Data)) <> 0 then
        begin
          RecText := '';
          RecText := Data;
          if ClientSocket.Connected then
          begin
            if RecText = 'GetState' then
            begin
              ClientSocket.SendText(GetState);
            end;
            if RecText = 'Init' then
            begin
              ClientSocket.SendText(Init);
            end;
            if Pos('Run', RecText) <> 0 then
            begin
              internalMessage := Copy(RecText, Pos('Run', RecText) + 4, length(RecText) - 1);
              ClientSocket.SendText(Run);
            end;
            if RecText = 'GetMessage' then
            begin
              ClientSocket.SendText(GetMessage);
            end
          end;
        end
      except
        on e: exception do
        begin
          ClientSocket.Close;
          Terminate;
        end;
      end;
    finally
      SocketStream.Free;
    end;
  except
    HandleException;
  end;
end;

function TServerThread.GetMessage: string;
begin
  if fServerState <> Processing then
    result := 'Неверный статус!'
  else
  begin
    fServerState := ProcessingDone;
    result := internalMessage;
    fServerState := notInitialized;
    internalMessage := '';
  end;
end;

function TServerThread.GetState: string;
begin
  if fServerState = notInitialized then
    result := 'не нинициализирован!';
  if fServerState = Ready then
    result := 'Готов к работе';
  if fServerState = Processing then
    result := 'Обработка команды';
  if fServerState = ProcessingDone then
    result := 'Команда обработана'
end;

function TServerThread.Init: string;
begin
  if fServerState <> notInitialized then
    result := 'Неверный статус!'
  else
  begin
    sleep(30000);
    fServerState := Ready;
    result := 'Инициализарованно';
  end;
end;

procedure TServerThread.InitServer;
begin
  fServerState := notInitialized;
end;

function TServerThread.Run: string;
begin
  if fServerState <> Ready then
    result := 'Неверный статус!'
  else
  begin
    sleep(30000);
    fServerState := Processing;
    result := 'Выполнено';
  end;
end;

end.

