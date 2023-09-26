object fEditarProduto: TfEditarProduto
  Left = 0
  Top = 0
  Caption = 'Editar Produto'
  ClientHeight = 577
  ClientWidth = 397
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
    Width = 397
    Height = 577
    Align = alClient
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object Label3: TLabel
      Left = 53
      Top = 78
      Width = 46
      Height = 21
      Caption = 'NOME'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 53
      Top = 153
      Width = 84
      Height = 21
      Caption = 'DESCRI'#199#195'O'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 53
      Top = 260
      Width = 49
      Height = 21
      Caption = 'PRE'#199'O'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 128
      Top = 428
      Width = 141
      Height = 21
      Caption = 'ESTOQUE NEGATVO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 53
      Top = 340
      Width = 69
      Height = 21
      Caption = 'ENTRADA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 285
      Top = 340
      Width = 44
      Height = 21
      Caption = 'SAIDA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object btnSalvar: TSpeedButton
      Left = 32
      Top = 512
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
      Left = 224
      Top = 512
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
    object Panel2: TPanel
      Left = 0
      Top = 8
      Width = 397
      Height = 41
      Caption = 'PRODUTO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object eNome: TEdit
      Left = 53
      Top = 105
      Width = 276
      Height = 29
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object eDescricao: TMemo
      Left = 53
      Top = 180
      Width = 276
      Height = 58
      TabOrder = 2
    end
    object ePreco: TEdit
      Left = 53
      Top = 287
      Width = 276
      Height = 29
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object cbEstoqueNegativo: TComboBox
      Left = 136
      Top = 455
      Width = 117
      Height = 29
      TabOrder = 4
      Items.Strings = (
        'Sim'
        'N'#227'o')
    end
    object cbEntrada: TComboBox
      Left = 53
      Top = 367
      Width = 108
      Height = 29
      TabOrder = 5
      Items.Strings = (
        'Sim'
        'N'#227'o')
    end
    object cbSaida: TComboBox
      Left = 224
      Top = 367
      Width = 105
      Height = 29
      TabOrder = 6
      Items.Strings = (
        'Sim'
        'N'#227'o')
    end
  end
end
