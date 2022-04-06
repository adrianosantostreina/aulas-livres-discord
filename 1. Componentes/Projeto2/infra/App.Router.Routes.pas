unit App.Router.Routes;

interface

uses
  Router4D,
  App.Router.Consts,

  System.Classes,
  System.StrUtils,
  System.SysUtils;

type
  TRoutes = class
    private
      constructor Create;
      destructor Destroy;override;
    public

  end;

var
  Routers : TRoutes;

implementation

uses
  App.View.Clientes,
  App.View.Fornecedores,
  App.View.Home;

{ TRoutes }

constructor TRoutes.Create;
begin
  //Registra as rotas
  TRouter4D.Switch.Router('Clientes', TFrmClientes);
  TRouter4D.Switch.Router('Fornecedores', TFrmFornecedores);
  TRouter4D.Switch.Router('Home', TFrmHome);
end;

destructor TRoutes.Destroy;
begin
  inherited;
end;

initialization
  Routers := TRoutes.Create;

finalization
  Routers.Free;

end.
