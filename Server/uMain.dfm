object frmMain: TfrmMain
  Left = 541
  Top = 232
  Width = 656
  Height = 514
  Caption = #1057#1077#1088#1074#1077#1088
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnStart: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = btnStartClick
  end
  object btnStop: TButton
    Left = 88
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 1
    OnClick = btnStopClick
  end
  object mmoLog: TMemo
    Left = 8
    Top = 40
    Width = 625
    Height = 425
    TabOrder = 2
  end
  object edtMessage: TEdit
    Left = 176
    Top = 8
    Width = 457
    Height = 21
    TabOrder = 3
  end
  object srvMainSocket: TServerSocket
    Active = False
    Port = 7777
    ServerType = stThreadBlocking
    OnGetThread = srvMainSocketGetThread
    Left = 384
    Top = 88
  end
end
