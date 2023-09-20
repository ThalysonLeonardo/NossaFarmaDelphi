object fOperadores: TfOperadores
  Left = 0
  Top = 0
  Caption = 'Operadores'
  ClientHeight = 389
  ClientWidth = 994
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
    Left = 454
    Top = 16
    Width = 122
    Height = 24
    Caption = 'OPERADORES'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 32
    Top = 46
    Width = 929
    Height = 217
    DataSource = UniDataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object UniConnection1: TUniConnection
    ProviderName = 'PostgreSQL'
    Port = 5432
    Username = 'postgres'
    Server = 'localhost'
    Connected = True
    Left = 792
    Top = 336
    EncryptedPassword = '87FFC7FFCDFF87FFCBFFCAFF8CFF8CFF'
  end
  object UniQuery1: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'SELECT id, nome, login FROM operadores;')
    Left = 872
    Top = 336
  end
  object UniDataSource1: TUniDataSource
    DataSet = UniQuery1
    Left = 944
    Top = 336
  end
end
