unit controllers.usuarios;

interface

uses
  Horse;

procedure Registry;

implementation

uses
  Service.Connection,
  DataSet.Serialize,

  System.JSON,
  System.Classes,
  System.StrUtils,
  System.SysUtils;

procedure DoList(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  DM : TDM;
  LJson: TJSONArray;
begin
  try
    DM := TDM.Create(nil);
    DM.QryUsuarios.Active := False;
    DM.QryUsuarios.SQL.Clear;
    DM.QryUsuarios.SQL.Text := 'SELECT * FROM USUARIOS';
    DM.QryUsuarios.Active := True;

    LJson := DM.QryUsuarios.ToJSONArray();

    Res.Send(LJson);
  finally
    DM.Free;
  end;
end;

procedure DoFind(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  DM : TDM;
  LJson: TJSONArray;
  LID: Integer;
begin
  try
    if not TryStrToInt(Req.Params['id'] , LID) then
      raise Exception.Create('ID inválido. Envie um número inteiro.');

    DM := TDM.Create(nil);
    DM.QryUsuarios.Active := False;
    DM.QryUsuarios.SQL.Clear;
    DM.QryUsuarios.SQL.Text := 'SELECT * FROM USUARIOS WHERE ID =:pID';
    DM.QryUsuarios.Params.ParamByName('pID').AsInteger := LID;
    DM.QryUsuarios.Active := True;

    LJson := DM.QryUsuarios.ToJSONArray();

    Res.Send(LJson);
  finally
    DM.Free;
  end;
end;

procedure Registry;
begin
  THorse.Get   ('/usuarios', DoList);
  THorse.Get   ('/usuarios/:id', DoFind);

//  THorse.Post  ('/usuarios', DoList);
//  THorse.Put   ('/usuarios', DoList);
//  THorse.Delete('/usuarios', DoList);

end;

end.
