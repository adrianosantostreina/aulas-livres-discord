object DM: TDM
  Height = 480
  Width = 640
  object fdConn: TFDConnection
    Params.Strings = (
      
        'Database=D:\1. Exemplos Cursos\Comanda Eletronica - 2.0\Database' +
        '\COMANDA20.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=localhost'
      'Port=3050'
      'DriverID=FB')
    Left = 72
    Top = 24
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 'C:\fbclient.dll'
    Left = 224
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Console'
    Left = 392
    Top = 24
  end
  object QryUsuarios: TFDQuery
    Connection = fdConn
    SQL.Strings = (
      'SELECT * FROM USUARIOS')
    Left = 72
    Top = 112
  end
end
