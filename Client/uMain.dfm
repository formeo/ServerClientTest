object frmMain: TfrmMain
  Left = 600
  Top = 206
  Width = 879
  Height = 578
  Caption = #1050#1083#1080#1077#1085#1090
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object spl1: TSplitter
    Left = 393
    Top = 0
    Height = 539
  end
  object grpButtons: TGroupBox
    Left = 0
    Top = 0
    Width = 393
    Height = 539
    Align = alLeft
    Caption = #1054#1087#1077#1088#1072#1094#1080#1080
    TabOrder = 0
    object lb1: TLabel
      Left = 8
      Top = 24
      Width = 81
      Height = 13
      Caption = #1055#1086#1088#1090' '#1057#1077#1088#1074#1077#1088#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lb2: TLabel
      Left = 8
      Top = 64
      Width = 52
      Height = 13
      Caption = #1050#1086#1084#1072#1085#1076#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtPort: TEdit
      Left = 8
      Top = 40
      Width = 369
      Height = 21
      TabOrder = 0
      Text = '7777'
    end
    object btnGetState: TButton
      Left = 16
      Top = 144
      Width = 153
      Height = 25
      Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1090#1077#1082#1091#1097#1080#1081' '#1089#1090#1072#1090#1091#1089
      TabOrder = 1
      OnClick = btnGetStateClick
    end
    object btnInit: TButton
      Left = 16
      Top = 176
      Width = 153
      Height = 25
      Caption = #1048#1085#1080#1094#1080#1072#1083#1080#1079#1072#1094#1080#1103
      TabOrder = 2
      OnClick = btnInitClick
    end
    object btnExeCommad: TButton
      Left = 16
      Top = 208
      Width = 153
      Height = 25
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1082#1086#1084#1072#1085#1076#1091
      TabOrder = 3
      OnClick = btnExeCommadClick
    end
    object btnGetResult: TButton
      Left = 16
      Top = 240
      Width = 153
      Height = 25
      Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1082#1086#1084#1072#1085#1076#1091
      TabOrder = 4
      OnClick = btnGetResultClick
    end
    object edtMessage: TEdit
      Left = 8
      Top = 80
      Width = 369
      Height = 21
      TabOrder = 5
      Text = #1058#1077#1089#1090#1086#1074#1072#1103' '#1082#1086#1084#1072#1085#1076#1072'!'
    end
    object btnConnect: TButton
      Left = 16
      Top = 112
      Width = 153
      Height = 25
      Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1089#1103
      TabOrder = 6
      OnClick = btnConnectClick
    end
    object btnDisconnect: TButton
      Left = 208
      Top = 112
      Width = 97
      Height = 25
      Caption = #1054#1090#1082#1083#1102#1095#1080#1090#1089#1103
      TabOrder = 7
      OnClick = btnDisconnectClick
    end
  end
  object mmoLog: TMemo
    Left = 396
    Top = 0
    Width = 467
    Height = 539
    Align = alClient
    TabOrder = 1
  end
  object clSock: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnect = clSockConnect
    OnDisconnect = clSockDisconnect
    OnRead = clSockRead
    OnError = clSockError
    Left = 64
    Top = 296
  end
end
