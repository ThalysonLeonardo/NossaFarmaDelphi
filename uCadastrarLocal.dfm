object fCadastrarLocal: TfCadastrarLocal
  Left = 0
  Top = 0
  Caption = 'Cadastrar Local de Estoque'
  ClientHeight = 461
  ClientWidth = 464
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
    Width = 464
    Height = 461
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
    ExplicitTop = -20
    ExplicitWidth = 519
    ExplicitHeight = 537
    object Label1: TLabel
      Left = 56
      Top = 72
      Width = 43
      Height = 21
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 56
      Top = 144
      Width = 67
      Height = 21
      Caption = 'Descri'#231#227'o'
    end
    object Label3: TLabel
      Left = 56
      Top = 280
      Width = 123
      Height = 21
      Caption = 'Status do Estoque'
    end
    object btnSalvar: TSpeedButton
      Left = 80
      Top = 392
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
      Left = 256
      Top = 392
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
    object pnlTopo: TPanel
      Left = 1
      Top = 1
      Width = 462
      Height = 41
      Align = alTop
      Caption = 'CADASTRO LOCAL DE ESTOQUE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 517
    end
    object eNome: TEdit
      Left = 56
      Top = 99
      Width = 361
      Height = 29
      TabOrder = 1
    end
    object eDescrição: TMemo
      Left = 56
      Top = 171
      Width = 361
      Height = 89
      TabOrder = 2
    end
    object cbStatusEstoque: TComboBox
      Left = 56
      Top = 307
      Width = 145
      Height = 29
      TabOrder = 3
      Items.Strings = (
        'Ativo'
        'Inativo')
    end
  end
end
