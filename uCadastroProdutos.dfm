object fCadastroProdutos: TfCadastroProdutos
  Left = 0
  Top = 0
  Caption = 'Cadastro de Produtos'
  ClientHeight = 537
  ClientWidth = 519
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 519
    Height = 537
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
      Left = 80
      Top = 72
      Width = 43
      Height = 21
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 80
      Top = 144
      Width = 67
      Height = 21
      Caption = 'Descri'#231#227'o'
    end
    object Label3: TLabel
      Left = 80
      Top = 280
      Width = 122
      Height = 21
      Caption = 'Estoque Negativo'
    end
    object Label4: TLabel
      Left = 296
      Top = 280
      Width = 53
      Height = 21
      Caption = 'Entrada'
    end
    object Label5: TLabel
      Left = 80
      Top = 360
      Width = 38
      Height = 21
      Caption = 'Saida'
    end
    object btnSalvar: TSpeedButton
      Left = 104
      Top = 456
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
      Left = 280
      Top = 456
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
    object Label6: TLabel
      Left = 296
      Top = 360
      Width = 39
      Height = 21
      Caption = 'Pre'#231'o'
    end
    object pnlTopo: TPanel
      Left = 1
      Top = 1
      Width = 517
      Height = 41
      Align = alTop
      Caption = 'CADASTRO DE PRODUTO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object eNome: TEdit
      Left = 80
      Top = 99
      Width = 361
      Height = 29
      TabOrder = 1
    end
    object eDescrição: TMemo
      Left = 80
      Top = 171
      Width = 361
      Height = 89
      TabOrder = 2
    end
    object cbEstoqueNegativo: TComboBox
      Left = 80
      Top = 307
      Width = 145
      Height = 29
      TabOrder = 3
      Items.Strings = (
        'Sim'
        'N'#227'o')
    end
    object cbEntrada: TComboBox
      Left = 296
      Top = 307
      Width = 145
      Height = 29
      TabOrder = 4
      Items.Strings = (
        'Sim'
        'N'#227'o')
    end
    object cbSaida: TComboBox
      Left = 80
      Top = 387
      Width = 145
      Height = 29
      TabOrder = 5
      Items.Strings = (
        'Sim'
        'N'#227'o')
    end
    object ePreco: TEdit
      Left = 296
      Top = 387
      Width = 145
      Height = 29
      TabOrder = 6
    end
  end
end
