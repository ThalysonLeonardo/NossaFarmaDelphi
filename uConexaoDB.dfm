object fConexaoDB: TfConexaoDB
  Left = 0
  Top = 0
  Caption = 'ConexaoDB'
  ClientHeight = 261
  ClientWidth = 731
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 200
    Top = 23
    Width = 3
    Height = 13
  end
  object Label2: TLabel
    Left = 200
    Top = 23
    Width = 42
    Height = 13
    Caption = 'IPServer'
  end
  object Label3: TLabel
    Left = 200
    Top = 85
    Width = 22
    Height = 11
    Caption = 'User'
  end
  object Label4: TLabel
    Left = 200
    Top = 143
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object Label5: TLabel
    Left = 200
    Top = 205
    Width = 46
    Height = 13
    Caption = 'Database'
  end
  object Button1: TButton
    Left = 376
    Top = 40
    Width = 75
    Height = 25
    Caption = 'SALVAR'
    TabOrder = 0
    OnClick = Button1Click
  end
  object TXT_ipserver: TEdit
    Left = 200
    Top = 42
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object TXT_user: TEdit
    Left = 200
    Top = 102
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object TXT_password: TEdit
    Left = 200
    Top = 162
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object TXT_dbname: TEdit
    Left = 200
    Top = 224
    Width = 121
    Height = 21
    TabOrder = 4
  end
end
