program SrvHorseDiscord;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  DataSet.Serialize,
  Horse.Jhonson,
  Horse.Logger,
  Horse.Logger.Provider.Console,
  System.JSON,
  System.SysUtils,
  controllers.usuarios in 'controllers\controllers.usuarios.pas',
  dao.usuarios in 'dao\dao.usuarios.pas';

var
  LLogFileConfig: THorseLoggerConsoleConfig;

begin
  THorse
    .Use(Jhonson);

  LLogFileConfig := THorseLoggerConsoleConfig.New
    .SetLogFormat('${request_clientip} [${time}] ${response_status}');
  THorseLoggerManager.RegisterProvider(THorseLoggerProviderConsole.New());
  THorse.Use(THorseLoggerManager.HorseCallback);

  THorse.Get('/ping',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send('pong');
    end);

  THorse.Get('/healthcheck',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send('Running');
    end);

  controllers.usuarios.Registry;

  THorse.Listen(9000,
    procedure (Horse: THorse)
    begin
      WriteLn(Format('Servidor rodando na porta %d.', [Horse.Port]));
      WriteLn('Executando');
    end
  );

end.
