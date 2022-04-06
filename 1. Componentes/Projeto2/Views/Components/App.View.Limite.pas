unit App.View.Limite;

interface

uses
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
  TComponentLimite = class(TForm)
    LytCard: TLayout;
    LytGeral: TLayout;
    recBack: TRectangle;
    Label1: TLabel;
    lblLimite: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Component: TFMXObject;
    function Text(AText: string): TComponentLimite;
    function Cor(ACor: TAlphaColor): TComponentLimite;
    function Valor(AValor: Double):TComponentLimite;
    function OnClickButton(AClickButton: TNotifyEvent):TComponentLimite;
  end;

var
  ComponentLimite: TComponentLimite;

implementation

{$R *.fmx}

{ TComponentLimite }

function TComponentLimite.Component: TFMXObject;
begin
  Result := LytCard;
end;

function TComponentLimite.Cor(ACor: TAlphaColor): TComponentLimite;
begin
  Result := Self;
  recBack.Fill.Color := ACor;
end;

procedure TComponentLimite.FormCreate(Sender: TObject);
begin
  LytCard.Align := TAlignLayout.Left;
end;

function TComponentLimite.OnClickButton(AClickButton: TNotifyEvent): TComponentLimite;
begin
  Result := Self;
  Button1.OnClick := AClickButton;
end;

function TComponentLimite.Text(AText: string): TComponentLimite;
begin
  Result := Self;

end;

function TComponentLimite.Valor(AValor: Double): TComponentLimite;
begin
  Result := Self;
  lblLimite.Text := FormatFloat('###,###.00', AValor);
end;

end.
