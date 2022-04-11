unit UntMain;

interface

uses
  Router4D,
  Router4D.Props,

  FMX.Controls,
  FMX.Controls.Presentation,
  FMX.Dialogs,
  FMX.Forms,
  FMX.Graphics,
  FMX.Layouts,
  FMX.Objects,
  FMX.StdCtrls,
  FMX.Types,

  System.Classes,
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Variants;

type
  TMain = class(TForm)
    LytBarraLateral: TLayout;
    recBackBarra: TRectangle;
    LytNavegacao: TLayout;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations}
    procedure MountToolBar;
    procedure DoClickHome(Sender: TObject);
    procedure DoClickProdutos(Sender: TObject);
    procedure DoClickClientes(Sender: TObject);
    procedure DoClickConfig(Sender: TObject);
    procedure DoClickSair(Sender: TObject);
    procedure DoClickPedidos(Sender: TObject);
    procedure DoClickFornecedores(Sender: TObject);
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

uses
  App.Component.Button,
  App.View.Home,

  App.Router.Consts;

{$R *.fmx}

procedure TMain.DoClickClientes(Sender: TObject);
begin
  TRouter4D.Link.&To(C_Clientes);
  GlobalEventBus.Post(
    TProps
      .Create
        .PropString(TComponentButton(TFMXObject(Sender).Owner).Name)
        .Key('ButtomLateral')
  );
end;

procedure TMain.DoClickConfig(Sender: TObject);
begin
  //TRouter4D.Link.&To(C_Config);
  GlobalEventBus.Post(
    TProps
      .Create
        .PropString(TComponentButton(TFMXObject(Sender).Owner).Name)
        .Key('ButtomLateral')
  );
end;

procedure TMain.DoClickFornecedores(Sender: TObject);
begin
  //Fornecedores
  TRouter4D.Link.&To(C_Fornecedores);
  GlobalEventBus.Post(
    TProps
      .Create
        .PropString(TComponentButton(TFMXObject(Sender).Owner).Name)
        .Key('ButtomLateral')
  );
end;

procedure TMain.DoClickHome(Sender: TObject);
begin
  TRouter4D.Link.&To(C_Home);

  GlobalEventBus.Post(
    TProps
      .Create
        .PropString(TComponentButton(TFMXObject(Sender).Owner).Name)
        .Key('ButtomLateral')
  );
end;

procedure TMain.DoClickPedidos(Sender: TObject);
begin
  ShowMessage('Pedidos');
  GlobalEventBus.Post(
    TProps
      .Create
        .PropString(TComponentButton(TFMXObject(Sender).Owner).Name)
        .Key('ButtomLateral')
  );
end;

procedure TMain.DoClickProdutos(Sender: TObject);
begin
  //TRouter4D.Link.&To(C_Produtos);
  GlobalEventBus.Post(
    TProps
      .Create
        .PropString(TComponentButton(TFMXObject(Sender).Owner).Name)
        .Key('ButtomLateral')
  );
end;

procedure TMain.DoClickSair(Sender: TObject);
begin
  ShowMessage('Sair');
  GlobalEventBus.Post(
    TProps
      .Create
        .PropString(TComponentButton(TFMXObject(Sender).Owner).Name)
        .Key('ButtomLateral')
  );
end;

procedure TMain.FormShow(Sender: TObject);
begin
  MountToolBar;
  TRouter4D.Render<TFrmHome>.SetElement(LytNavegacao, LytNavegacao);
end;

procedure TMain.MountToolBar;
begin
  LytBarraLateral
    .AddObject(
      TComponentButton.Create(Self)
      .Text('Home')
      .OnClickButton(DoClickHome)
      .Icon('home')
      .Component
    );

  LytBarraLateral
    .AddObject(
      TComponentButton.Create(Self)
      .Text('Clientes')
      .OnClickButton(DoClickClientes)
      .Icon('clientes')
      .Component
    );

  LytBarraLateral
    .AddObject(
      TComponentButton.Create(Self)
      .Text('Produtos')
      .OnClickButton(DoClickProdutos)
      .Icon('produtos')
      .Component
    );

  LytBarraLateral
    .AddObject(
      TComponentButton.Create(Self)
      .Text('Pedidos')
      .Align(TAlignLayout.Top)
      .OnClickButton(DoClickPedidos)
      .Icon('pedidos')
      .Component
    );

  LytBarraLateral
    .AddObject(
      TComponentButton.Create(Self)
      .Text('Fornecedores')
      .Align(TAlignLayout.Top)
      .OnClickButton(DoClickFornecedores)
      .Icon('fornecedores')
      .Component
    );

  LytBarraLateral
    .AddObject(
      TComponentButton.Create(Self)
      .Text('Sair')
      .Align(TAlignLayout.Bottom)
      .OnClickButton(DoClickSair)
      .Icon('sair')
      .Component
    );

  LytBarraLateral
    .AddObject(
      TComponentButton.Create(Self)
      .Text('Config')
      .Align(TAlignLayout.Bottom)
      .OnClickButton(DoClickConfig)
      .Icon('config')
      .Component
    );

end;

end.
