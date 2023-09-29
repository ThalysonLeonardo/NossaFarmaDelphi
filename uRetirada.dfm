object fRetirada: TfRetirada
  Left = 0
  Top = 0
  Caption = 'RETIRADA DE PRODUTO'
  ClientHeight = 548
  ClientWidth = 395
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
    Width = 395
    Height = 548
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
    ExplicitHeight = 229
    object Label3: TLabel
      Left = 38
      Top = 406
      Width = 306
      Height = 21
      Caption = 'INFORME A QUANTIDADE A SER RETIRADA:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object btnSalvar: TSpeedButton
      Left = 38
      Top = 488
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
      Left = 230
      Top = 488
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
    object Label1: TLabel
      Left = 38
      Top = 86
      Width = 132
      Height = 21
      Caption = 'N'#218'MERO DO LOTE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 38
      Top = 158
      Width = 161
      Height = 21
      Caption = 'DATA DE VENCIMENTO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 38
      Top = 230
      Width = 156
      Height = 21
      Caption = 'DATA DE FABRICA'#199#195'O'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 38
      Top = 302
      Width = 150
      Height = 21
      Caption = 'QUANTIDADE ATUAL:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Panel2: TPanel
      Left = 0
      Top = 8
      Width = 397
      Height = 41
      Caption = 'FAZER A RETIRADA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object eQuantidadeRetirada: TEdit
      Left = 38
      Top = 433
      Width = 321
      Height = 29
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object eNumLote: TEdit
      Left = 38
      Top = 113
      Width = 147
      Height = 29
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object dtVencimento: TDateTimePicker
      Left = 38
      Top = 185
      Width = 186
      Height = 29
      Date = 45198.413401886570000000
      Time = 45198.413401886570000000
      Enabled = False
      TabOrder = 3
    end
    object dtFabricacao: TDateTimePicker
      Left = 38
      Top = 257
      Width = 186
      Height = 29
      Date = 45198.413401886570000000
      Time = 45198.413401886570000000
      Enabled = False
      TabOrder = 4
    end
    object eQuantidadeAtual: TEdit
      Left = 38
      Top = 329
      Width = 147
      Height = 29
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
  end
end
