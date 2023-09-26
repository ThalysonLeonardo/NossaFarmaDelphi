object fLocaisEstoque: TfLocaisEstoque
  Left = 0
  Top = 0
  Caption = 'Locais Estoque'
  ClientHeight = 420
  ClientWidth = 820
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 820
    Height = 420
    Align = alClient
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
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
    object btnNovoLocal: TSpeedButton
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
      OnClick = btnNovoLocalClick
    end
    object btnEditarLocal: TSpeedButton
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
      OnClick = btnEditarLocalClick
    end
    object btnExcluirLocal: TSpeedButton
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
      OnClick = btnExcluirLocalClick
    end
    object gridLocais: TDBGrid
      Left = 0
      Top = 40
      Width = 829
      Height = 289
      DataSource = DM.UniDataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object Panel2: TPanel
      Left = -9
      Top = 0
      Width = 829
      Height = 41
      Caption = 'LOCAIS DE ESTOQUE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -19
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
end
