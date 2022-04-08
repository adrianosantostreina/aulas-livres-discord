unit App.View.Clientes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  App.View.Listagem, FMX.Controls.Presentation, FMX.Layouts;

type
  TFrmClientes = class(TFrmTemplate)
    Label1: TLabel;
    Button1: TButton;
    Layout1: TLayout;
    lytInfo: TLayout;
    procedure Button1Click(Sender: TObject);
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

procedure TFrmClientes.DoClickLimite(Sender: TObject);
begin
  ShowMessage('Clicou no botão');
end;

end.
