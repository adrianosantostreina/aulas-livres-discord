unit App.View.Fornecedores;

interface

uses
  RESTRequest4D,

  App.View.Listagem,

  FMX.Controls,
  FMX.Controls.Presentation,
  FMX.Dialogs,
  FMX.Forms,
  FMX.Graphics,
  FMX.Layouts,
  FMX.StdCtrls,
  FMX.Types,

  System.Classes,
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Variants;

type
  TFrmFornecedores = class(TFrmTemplate)
    Label1: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFornecedores: TFrmFornecedores;

implementation

{$R *.fmx}

procedure TFrmFornecedores.Button1Click(Sender: TObject);
var
  LResponse : IResponse;
begin
  inherited;
  //
  LResponse :=
    TRequest.New.BaseUrl('http://localhost:9000/')
      .Resource('ping')
      .ContentType('application/json')
      .Get;

  if LResponse.StatusCode = 200 then
    ShowMessage('Acessou');

end;

end.
