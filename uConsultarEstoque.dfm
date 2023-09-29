object fConsultarEstoque: TfConsultarEstoque
  Left = 0
  Top = 0
  Caption = 'Consultar Estoque'
  ClientHeight = 565
  ClientWidth = 739
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
    Width = 739
    Height = 524
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
    ExplicitWidth = 748
    ExplicitHeight = 346
    object Label1: TLabel
      Left = 32
      Top = 32
      Width = 171
      Height = 21
      Caption = 'SELECIONE O PRODUTO'
    end
    object Label2: TLabel
      Left = 232
      Top = 32
      Width = 141
      Height = 21
      Caption = 'LOCAL DE ESTOQUE'
    end
    object Label3: TLabel
      Left = 32
      Top = 110
      Width = 156
      Height = 21
      Caption = 'ESTOQUE MAIOR QUE'
    end
    object Label4: TLabel
      Left = 232
      Top = 110
      Width = 162
      Height = 21
      Caption = 'ESTOQUE MENOR QUE'
    end
    object btnConsultar: TSpeedButton
      Left = 580
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
    object btnVoltar: TSpeedButton
      Left = 580
      Top = 129
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
    object cbProduto: TComboBox
      Left = 32
      Top = 59
      Width = 171
      Height = 29
      TabOrder = 0
    end
    object cbLocalEstoque: TComboBox
      Left = 232
      Top = 59
      Width = 171
      Height = 29
      TabOrder = 1
    end
    object chkEstoqueZerado: TCheckBox
      Left = 432
      Top = 65
      Width = 129
      Height = 17
      Caption = 'Estoque zerado'
      TabOrder = 2
    end
    object eEstoqueMaior: TEdit
      Left = 32
      Top = 137
      Width = 156
      Height = 29
      TabOrder = 3
    end
    object eEstoqueMenor: TEdit
      Left = 232
      Top = 137
      Width = 156
      Height = 29
      TabOrder = 4
    end
    object stEstoque: TStringGrid
      Left = 32
      Top = 200
      Width = 677
      Height = 289
      TabOrder = 5
    end
  end
  object pnlTopp: TPanel
    Left = 0
    Top = 0
    Width = 739
    Height = 41
    Align = alTop
    Caption = 'ENTRADA DE MERCADORIAS'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMenuHighlight
    Font.Height = -19
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    ExplicitLeft = 1
    ExplicitTop = 1
    ExplicitWidth = 863
  end
end
