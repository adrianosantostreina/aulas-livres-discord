unit controllers.usuarios;

interface

uses
  Horse,

  ADRConn.DAO.Base,
  ADRConn.Model.Factory,
  ADRConn.Model.Interfaces,

  dao.usuarios;

procedure Registry;

implementation

uses
  DataSet.Serialize,

  System.JSON,
  System.Classes,
  System.StrUtils,
  System.SysUtils;

procedure DoList(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LDAO    : TADRConnDAOUsuario;
  LConn   : IADRConnection;
begin
  LConn := TADRConnModelFactory.GetConnectionIniFile();
  LConn.Connect;
  LDAO := TADRConnDAOUsuario.Create(LConn);
  try
    Res
      .Send<TJSONArray>(LDAO.List)
      .Status(THTTPStatus.OK);
  finally
    LDAO.Free;
  end;
end;

procedure DoFind(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LDAO    : TADRConnDAOUsuario;
  LConn   : IADRConnection;
  LID: Integer;
begin
  try
    if not TryStrToInt(Req.Params['id'] , LID) then
      raise Exception.Create('ID inválido. Envie um número inteiro.');

    LConn := TADRConnModelFactory.GetConnectionIniFile();
    LConn.Connect;
    LDAO := TADRConnDAOUsuario.Create(LConn);
    try
      Res
        .Send<TJSONObject>(LDAO.Find(LID))
        .Status(THTTPStatus.OK);
    finally
      LDAO.Free;
    end;
  finally

  end;
end;

procedure DoInsert(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LDAO    : TADRConnDAOUsuario;
  LConn   : IADRConnection;
  LResult : TJSONObject;
  LID     : Integer;
begin
  //Testamos se recebemos um JSON no Body
  if Req.Body.IsEmpty then
    raise Exception.Create('Corpo da requisição inválido. Envie um JSONArray com os dados a serem inseridos.');

  LConn   := TADRConnModelFactory.GetConnectionIniFile;
  LConn.Connect;

  LDAO   := TADRConnDAOUsuario.Create(LConn);
  try
    LResult := LDAO.Insert(Req.Body);
    if LResult.Count > 0 then
      Res
        .Send<TJSONObject>(LResult)
        .Status(THTTPStatus.Created)
    else
      Res
        .Send<TJSONObject>(LResult)
        .Status(THTTPStatus.NoContent);
  finally
    LDao.Free;
  end;
end;

procedure DoUpdate(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LDAO    : TADRConnDAOUsuario;
  LConn   : IADRConnection;
  LResult : TJSONObject;
  LID     : Integer;
begin
  if not TryStrToInt(Req.Params['id'] , LID) then
    raise Exception.Create('ID inválido. Envie um número inteiro.');

  //Testamos se recebemos um JSON no Body
  if Req.Body.IsEmpty then
    raise Exception.Create('Corpo da requisição inválido. Envie um JSONArray com os dados a serem inseridos.');

  LConn   := TADRConnModelFactory.GetConnectionIniFile;
  LConn.Connect;
  LDAO   := TADRConnDAOUsuario.Create(LConn);
  try
    LResult := LDAO.Update(LID, Req.Body);
    if LResult.Count > 0 then
      Res
        .Send<TJSONObject>(LResult)
        .Status(THTTPStatus.Created)
    else
      Res
        .Send<TJSONObject>(LResult)
        .Status(THTTPStatus.NoContent);
  finally
    LDao.Free;
  end;
end;

procedure Registry;
begin
  THorse.Get   ('/usuarios'     , DoList);
  THorse.Get   ('/usuarios/:id' , DoFind);
  THorse.Post  ('/usuarios'     , DoInsert);
  THorse.Put   ('/usuarios/:id' , DoUpdate);
  //THorse.Delete('/usuarios/:id' , DoDelete);
end;


end.

