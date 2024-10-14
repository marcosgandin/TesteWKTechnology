object DataModule1: TDataModule1
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 150
  Width = 411
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=testewk'
      'User_Name=root'
      'Server=localhost'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 56
    Top = 40
  end
  object FDWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 288
    Top = 40
  end
  object FDMySQLDriver: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Projetos\TesteWKTechnology\Win32\Debug\libmysql.dll'
    Left = 176
    Top = 40
  end
end
