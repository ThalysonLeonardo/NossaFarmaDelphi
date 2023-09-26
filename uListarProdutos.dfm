object fListarProdutos: TfListarProdutos
  Left = 0
  Top = 0
  Caption = 'Listar Produtos'
  ClientHeight = 422
  ClientWidth = 824
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
    Top = 0
    Width = 824
    Height = 422
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object btnVoltar: TSpeedButton
      Left = 664
      Top = 352
      Width = 145
      Height = 38
      Caption = 'VOLTAR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnVoltarClick
    end
    object btnExcluirProduto: TSpeedButton
      Left = 336
      Top = 352
      Width = 145
      Height = 38
      Caption = 'EXCLUIR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnExcluirProdutoClick
    end
    object btnNovo: TSpeedButton
      Left = 16
      Top = 352
      Width = 113
      Height = 38
      Caption = 'NOVO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnNovoClick
    end
    object btnEditarProduto: TSpeedButton
      Left = 160
      Top = 352
      Width = 145
      Height = 38
      Caption = 'EDITAR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnEditarProdutoClick
    end
    object pnlTopo: TPanel
      Left = -5
      Top = 0
      Width = 829
      Height = 41
      Caption = 'LISTA DE PRODUTOS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -19
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object gridProdutos: TDBGrid
      Left = 0
      Top = 41
      Width = 824
      Height = 289
      DataSource = DM.UniDataSource1
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
end
