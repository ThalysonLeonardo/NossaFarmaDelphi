object fSaidaMercadorias: TfSaidaMercadorias
  Left = 0
  Top = 0
  Caption = 'Saida de Mercadorias'
  ClientHeight = 395
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
    Height = 354
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
      Left = 48
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
    object Label3: TLabel
      Left = 560
      Top = 32
      Width = 97
      Height = 21
      Caption = 'QUANTIDADE'
    end
    object btnSalvar: TSpeedButton
      Left = 176
      Top = 276
      Width = 129
      Height = 37
      Caption = 'SALVAR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnSalvarClick
    end
    object btnCancelar: TSpeedButton
      Left = 417
      Top = 276
      Width = 129
      Height = 37
      Caption = 'CANCELAR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnCancelarClick
    end
    object cbProduto: TComboBox
      Left = 48
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
    object pnlLote: TPanel
      Left = 280
      Top = 124
      Width = 209
      Height = 125
      ParentBackground = False
      TabOrder = 2
      object Label5: TLabel
        Left = 32
        Top = 40
        Width = 132
        Height = 21
        Caption = 'N'#218'MERO DO LOTE'
      end
      object Label4: TLabel
        Left = 16
        Top = 8
        Width = 29
        Height = 17
        Caption = 'LOTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMenuHighlight
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object eLote: TEdit
        Left = 40
        Top = 67
        Width = 121
        Height = 29
        TabOrder = 0
      end
    end
    object eQuantidade: TEdit
      Left = 560
      Top = 59
      Width = 137
      Height = 29
      TabOrder = 3
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
