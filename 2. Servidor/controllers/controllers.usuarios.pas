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

  System.Classes,
  System.JSON,
  System.StrUtils,
  System.SysUtils;

procedure DoList(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LDAO    : TADRConnDAOUsuario;
  LConn   : IADRConnection;
  LResult : TJSONArray;
begin
  LConn := TADRConnModelFactory.GetConnectionIniFile();
  LConn.Connect;
  LDAO := TADRConnDAOUsuario.Create(LConn);
  try
    LResult := LDAO.List;
    if LResult.Count > 0 then
      Res
        .Send<TJSONArray>(LResult)
        .Status(THTTPStatus.OK)
    else
      Res
        .Send<TJSONArray>(LResult)
        .Status(THTTPStatus.NotFound)
  finally
    LDao.Free;
  end;
end;

procedure DoFind(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LDAO    : TADRConnDAOUsuario;
  LConn   : IADRConnection;
  LID     : Integer;
  LResult : TJSONObject;
begin
  if not TryStrToInt(Req.Params['id'] , LID) then
    raise Exception.Create('ID inválido. Envie um número inteiro.');

  LConn := TADRConnModelFactory.GetConnectionIniFile;
  LConn.Connect;
  LDAO := TADRConnDAOUsuario.Create(LConn);
  try
    LResult := LDAO.Find(LID);
    if LResult.Count > 0 then
      Res
        .Send<TJSONObject>(LResult)
        .Status(THTTPStatus.OK)
    else
      Res
        .Send<TJSONObject>(LResult)
        .Status(THTTPStatus.NotFound);
  finally
    LDao.Free;
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

procedure DoDelete(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin
  //
end;

procedure Registry;
begin
  THorse.Get   ('/usuarios'     , DoList);
  THorse.Get   ('/usuarios/:id' , DoFind);
  THorse.Post  ('/usuarios'     , DoInsert);
  THorse.Put   ('/usuarios/:id' , DoUpdate);
end;

end.

