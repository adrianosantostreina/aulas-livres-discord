unit App.View.Clientes;

interface

uses
  RESTRequest4D,
  DataSet.Serialize,
  REST.Json,
  System.JSON,

  App.View.Listagem,

  Data.DB,

  FMX.Controls,
  FMX.Controls.Presentation,
  FMX.Dialogs,
  FMX.Forms,
  FMX.Graphics,
  FMX.Grid,
  FMX.Grid.Style,
  FMX.Layouts,
  FMX.Memo,
  FMX.Memo.Types,
  FMX.ScrollBox,
  FMX.StdCtrls,
  FMX.Types,

  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.DApt.Intf,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Error,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,

  System.Classes,
  System.Rtti,
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Variants, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope;

type
  TFrmClientes = class(TFrmTemplate)
    Label1: TLabel;
    Button1: TButton;
    Layout1: TLayout;
    lytInfo: TLayout;
    Memo1: TMemo;
    Request: TButton;
    StringGrid1: TStringGrid;
    MemUsuarios: TFDMemTable;
    MemUsuariosid: TIntegerField;
    MemUsuariosusuario: TStringField;
    MemUsuariossenha: TStringField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Button2: TButton;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure RequestClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    procedure DoClickLimite(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmClientes: TFrmClientes;

implementation

uses
  App.View.Limite;

{$R *.fmx}

procedure TFrmClientes.Button1Click(Sender: TObject);
begin
  inherited;
  lytInfo
    .AddObject(
      TComponentLimite.Create(Self)
      .Cor(TAlphaColorRec.Red)
      .OnClickButton(DoClickLimite)
      .Valor(150)
      .Component
    );

  lytInfo
    .AddObject(
      TComponentLimite.Create(Self)
      .Cor(TAlphaColorRec.Green)
      .OnClickButton(DoClickLimite)
      .Valor(1545.56)
      .Component
    );
end;

procedure TFrmClientes.Button2Click(Sender: TObject);
var
  LJ : TJSONValue;
begin
  inherited;
  LJ := TJSONObject.ParseJSONValue(MemUsuarios.ToJSONArrayString);
  Memo2.Lines.Clear;
  Memo2.Lines.Add(TJson.Format(LJ));
end;

procedure TFrmClientes.DoClickLimite(Sender: TObject);
begin
  ShowMessage('Clicou no botão');
end;

procedure TFrmClientes.RequestClick(Sender: TObject);
var
  LResponse : IResponse;
  LJSON     : TJSONValue;
begin
  LResponse :=
    TRequest.New.BaseURL('http://localhost:9000/')
    .Resource('usuarios')
    .ContentType('application/json')
    .Get;

  LJSON := TJSONObject.ParseJSONValue(LResponse.Content);

  Memo1.Lines.Clear;
  Memo1.Lines.Add(TJson.Format(LJSON));

  if not MemUsuarios.Active then
    MemUsuarios.Active := True;

  if not MemUsuarios.IsEmpty then
    MemUsuarios.EmptyDataSet;

  MemUsuarios.LoadFromJSON(LResponse.Content);
end;

end.
