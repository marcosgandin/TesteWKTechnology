object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'WK Techology - Pedido de Vendas'
  ClientHeight = 518
  ClientWidth = 739
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  TextHeight = 15
  object shpFundo: TShape
    Left = 0
    Top = 0
    Width = 739
    Height = 518
    Align = alClient
    Brush.Color = clCream
    ExplicitTop = 1
  end
  object lblPedidoVenda: TLabel
    Left = 22
    Top = 16
    Width = 123
    Height = 20
    Caption = 'Pedido de Vendas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblCliente: TLabel
    Left = 22
    Top = 99
    Width = 40
    Height = 15
    Caption = 'Cliente:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblCodProduto: TLabel
    Left = 28
    Top = 160
    Width = 71
    Height = 15
    Caption = 'C'#243'd. Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblDescProduto: TLabel
    Left = 107
    Top = 160
    Width = 51
    Height = 15
    Caption = 'Descri'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblQuantidade: TLabel
    Left = 28
    Top = 208
    Width = 62
    Height = 15
    Caption = 'Quantidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblTotal: TLabel
    Left = 454
    Top = 468
    Width = 56
    Height = 32
    Caption = 'Total'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblPedido: TLabel
    Left = 22
    Top = 59
    Width = 40
    Height = 15
    Caption = 'Pedido:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Panel2: TPanel
    Left = 22
    Top = 142
    Width = 689
    Height = 1
    BevelOuter = bvNone
    Color = clGray
    ParentBackground = False
    TabOrder = 8
  end
  object edtCodProduto: TEdit
    Tag = 5
    Left = 28
    Top = 179
    Width = 71
    Height = 23
    TabOrder = 3
    OnExit = edtCodProdutoExit
  end
  object edtDescProduto: TEdit
    Left = 107
    Top = 179
    Width = 590
    Height = 23
    TabStop = False
    ReadOnly = True
    TabOrder = 4
  end
  object edtQuantidade: TEdit
    Tag = 5
    Left = 28
    Top = 227
    Width = 71
    Height = 23
    TabOrder = 5
  end
  object edtTotal: TEdit
    Left = 519
    Top = 464
    Width = 178
    Height = 40
    TabStop = False
    Alignment = taRightJustify
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
  end
  object Panel1: TPanel
    Left = 28
    Top = 262
    Width = 669
    Height = 189
    BevelOuter = bvNone
    TabOrder = 7
    object grdItems: TStringGrid
      Left = 0
      Top = 0
      Width = 669
      Height = 189
      Align = alClient
      ColCount = 7
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
      TabOrder = 0
      ColWidths = (
        61
        52
        181
        88
        77
        64
        64)
    end
  end
  object Panel4: TPanel
    Left = 28
    Top = 467
    Width = 110
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
    TabOrder = 10
    object btnGravarPedido: TSpeedButton
      Left = 0
      Top = 0
      Width = 110
      Height = 41
      Cursor = crHandPoint
      Align = alClient
      Caption = 'Gravar Pedido'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = btnGravarPedidoClick
      ExplicitWidth = 83
    end
  end
  object Panel3: TPanel
    Left = 587
    Top = 211
    Width = 110
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
    TabOrder = 9
    object btnInsereProduto: TSpeedButton
      Left = 0
      Top = 0
      Width = 110
      Height = 41
      Cursor = crHandPoint
      Align = alClient
      Caption = 'Inserir Produto'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = btnInsereProdutoClick
      ExplicitTop = 4
    end
  end
  object edtPedido: TEdit
    Tag = 5
    Left = 68
    Top = 56
    Width = 71
    Height = 23
    TabOrder = 0
    OnExit = edtPedidoExit
  end
  object edtCodCliente: TEdit
    Tag = 5
    Left = 68
    Top = 96
    Width = 71
    Height = 23
    TabOrder = 1
    OnExit = edtCodClienteExit
  end
  object edtNomeCliente: TEdit
    Left = 147
    Top = 96
    Width = 550
    Height = 23
    TabStop = False
    ReadOnly = True
    TabOrder = 2
  end
end
