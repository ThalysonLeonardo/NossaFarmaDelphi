object fEditarOperador: TfEditarOperador
  Left = 0
  Top = 0
  Caption = 'fEditarOperador'
  ClientHeight = 362
  ClientWidth = 360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 80
    Top = 134
    Width = 15
    Height = 21
    Caption = 'ID'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMenuHighlight
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 360
    Height = 362
    Align = alClient
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    ExplicitHeight = 423
    object Label3: TLabel
      Left = 53
      Top = 70
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
    object Label4: TLabel
      Left = 32
      Top = 126
      Width = 94
      Height = 21
      Caption = 'SOBRENOME'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 53
      Top = 182
      Width = 46
      Height = 21
      Caption = 'LOGIN'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 53
      Top = 235
      Width = 50
      Height = 21
      Caption = 'SENHA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object btnSalvar: TSpeedButton
      Left = 32
      Top = 296
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
      Left = 208
      Top = 296
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
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 360
      Height = 41
      Caption = 'OPERADOR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object eNome: TEdit
    Left = 144
    Top = 67
    Width = 177
    Height = 29
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object eSobrenome: TEdit
    Left = 144
    Top = 123
    Width = 177
    Height = 29
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object eLogin: TEdit
    Left = 144
    Top = 179
    Width = 177
    Height = 29
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object ePassword: TEdit
    Left = 144
    Top = 232
    Width = 177
    Height = 29
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
end
