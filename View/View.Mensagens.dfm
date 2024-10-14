object frmMensagens: TfrmMensagens
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 254
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 254
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitHeight = 194
    object shpFundo: TShape
      Left = 0
      Top = 0
      Width = 624
      Height = 254
      Align = alClient
      ExplicitLeft = 576
      ExplicitTop = 280
      ExplicitWidth = 65
      ExplicitHeight = 65
    end
    object lblTituloJanela: TLabel
      Left = 14
      Top = 18
      Width = 74
      Height = 21
      Caption = 'ATEN'#199#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object imgIcone: TImage
      Left = 29
      Top = 86
      Width = 72
      Height = 72
      AutoSize = True
      Center = True
    end
    object lblTituloMensagem: TLabel
      Left = 115
      Top = 76
      Width = 55
      Height = 21
      Caption = 'T'#205'TULO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblMensagem: TLabel
      Left = 115
      Top = 101
      Width = 484
      Height = 20
      Caption = 
        'Mensagem Para o Usu'#225'rio                                         ' +
        '                                     '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Panel1: TPanel
      Left = 0
      Top = 54
      Width = 625
      Height = 1
      BevelOuter = bvNone
      Color = clBlack
      ParentBackground = False
      TabOrder = 0
    end
    object Panel6: TPanel
      Left = 415
      Top = 194
      Width = 190
      Height = 44
      BevelOuter = bvNone
      TabOrder = 1
      object pnlBtSim: TPanel
        Left = 91
        Top = 3
        Width = 94
        Height = 41
        BevelOuter = bvNone
        Color = clHighlight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object btnSim: TSpeedButton
          Left = 0
          Top = 0
          Width = 94
          Height = 41
          Cursor = crHandPoint
          Align = alClient
          Caption = 'SIM ( ENTER )'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnSimClick
          ExplicitLeft = 8
          ExplicitWidth = 110
        end
      end
      object pnlBtNao: TPanel
        Left = 3
        Top = 3
        Width = 88
        Height = 41
        BevelOuter = bvNone
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        object btnNao: TSpeedButton
          Left = 0
          Top = 0
          Width = 88
          Height = 41
          Cursor = crHandPoint
          Align = alClient
          Caption = 'N'#195'O ( ESC )'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnNaoClick
          ExplicitTop = -1
        end
      end
    end
  end
end
