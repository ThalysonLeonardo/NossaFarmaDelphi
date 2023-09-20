object DM: TDM
  OldCreateOrder = False
  Height = 150
  Width = 492
  object UniConnection1: TUniConnection
    ProviderName = 'PostgreSQL'
    Port = 5432
    Database = 'NossaFarmaDB'
    Username = 'postgres'
    Server = 'localhost'
    Connected = True
    Left = 32
    Top = 32
    EncryptedPassword = '87FFC7FFCDFF87FFCBFFCAFF8CFF8CFF'
  end
  object UniQuery1: TUniQuery
    Connection = UniConnection1
    Left = 160
    Top = 40
  end
  object UniDataSource1: TUniDataSource
    DataSet = UniQuery1
    Left = 288
    Top = 40
  end
end
