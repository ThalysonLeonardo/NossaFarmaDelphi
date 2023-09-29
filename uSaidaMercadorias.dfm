object fSaidaMercadorias: TfSaidaMercadorias
  Left = 0
  Top = 0
  Caption = 'Saida de Mercadorias'
  ClientHeight = 531
  ClientWidth = 738
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 41
    Width = 738
    Height = 490
    Align = alClient
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenuHighlight
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 56
      Top = 32
      Width = 171
      Height = 21
      Caption = 'SELECIONE O PRODUTO'
    end
    object Label2: TLabel
      Left = 304
      Top = 32
      Width = 141
      Height = 21
      Caption = 'LOCAL DE ESTOQUE'
    end
    object btnRetirada: TSpeedButton
      Left = 176
      Top = 428
      Width = 161
      Height = 37
      Caption = 'FAZER RETIRADA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnRetiradaClick
    end
    object btnVoltar: TSpeedButton
      Left = 409
      Top = 428
      Width = 129
      Height = 37
      Caption = 'VOLTAR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnVoltarClick
    end
    object btnConsultar: TSpeedButton
      Left = 548
      Top = 51
      Width = 129
      Height = 37
      Caption = 'CONSULTAR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnConsultarClick
    end
    object cbProduto: TComboBox
      Left = 56
      Top = 59
      Width = 171
      Height = 29
      TabOrder = 0
    end
    object cbLocalEstoque: TComboBox
      Left = 304
      Top = 59
      Width = 171
      Height = 29
      TabOrder = 1
    end
    object gridLotes: TDBGrid
      Left = 56
      Top = 112
      Width = 621
      Height = 281
      DataSource = DM.UniDataSource1
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clMenuHighlight
      TitleFont.Height = -16
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 738
    Height = 41
    Align = alTop
    Caption = 'SAIDA DE MERCADORIAS'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMenuHighlight
    Font.Height = -19
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
end
