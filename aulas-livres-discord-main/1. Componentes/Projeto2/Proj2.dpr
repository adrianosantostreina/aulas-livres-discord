program Proj2;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  UntMain in 'UntMain.pas' {Main},
  App.Component.Button in 'Views\Components\App.Component.Button.pas' {ComponentButton},
  App.Resources in 'service\App.Resources.pas',
  App.View.Listagem in 'Templates\App.View.Listagem.pas' {FrmTemplate},
  App.View.Clientes in 'Views\App.View.Clientes.pas' {FrmClientes},
  App.View.Fornecedores in 'Views\App.View.Fornecedores.pas' {FrmFornecedores},
  App.View.Home in 'Views\App.View.Home.pas' {FrmHome},
  App.Router.Consts in 'infra\App.Router.Consts.pas',
  App.Router.Routes in 'infra\App.Router.Routes.pas',
  App.View.Limite in 'Views\Components\App.View.Limite.pas' {ComponentLimite};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
