object fCadastroOperador: TfCadastroOperador
  Left = 0
  Top = 0
  Caption = 'Cadastro de Operador'
  ClientHeight = 321
  ClientWidth = 698
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCadastroOperador: TPanel
    Left = 0
    Top = 0
    Width = 698
    Height = 321
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 264
      Top = 16
      Width = 197
      Height = 25
      Caption = 'Cadastro de Operador'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 64
      Top = 63
      Width = 51
      Height = 25
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 64
      Top = 168
      Width = 47
      Height = 25
      Caption = 'Login'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 288
      Top = 168
      Width = 52
      Height = 25
      Caption = 'Senha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object btnSalvar: TSpeedButton
      Left = 538
      Top = 199
      Width = 113
      Height = 29
      Caption = 'Salvar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnSalvarClick
    end
    object btnCancelar: TSpeedButton
      Left = 288
      Top = 271
      Width = 113
      Height = 29
      Caption = 'Cancelar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnCancelarClick
    end
    object Label6: TLabel
      Left = 370
      Top = 63
      Width = 97
      Height = 25
      Caption = 'Sobrenome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object eNome: TEdit
      Left = 64
      Top = 94
      Width = 276
      Height = 29
      TabOrder = 0
    end
    object eLogin: TEdit
      Left = 64
      Top = 199
      Width = 193
      Height = 29
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object ePassword: TEdit
      Left = 288
      Top = 199
      Width = 217
      Height = 29
      TabOrder = 2
    end
    object eSobrenome: TEdit
      Left = 370
      Top = 94
      Width = 281
      Height = 29
      TabOrder = 3
    end
  end
end
