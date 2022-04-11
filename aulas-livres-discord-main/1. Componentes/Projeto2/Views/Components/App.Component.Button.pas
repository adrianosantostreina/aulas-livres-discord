unit App.Component.Button;

interface

uses
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
  TComponentButton = class(TForm)
    LytGeral: TLayout;
    recBtnRealce: TRectangle;
    LblText: TLabel;
    ImgIcon: TImage;
    SpeBtnLateral: TSpeedButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Component: TFMXObject;
    function Align(AAlign: TAlignLayout = TAlignLayout.Top): TComponentButton;
    function Text(AValue: string): TComponentButton;
    function Icon(AResource: string): TComponentButton;
    function OnClickButton(AOnClick: TNotifyEvent): TComponentButton;

    [Subscribe]
    procedure Props(AValue: TProps);
  end;

var
  ComponentButton: TComponentButton;

implementation

uses
  App.Resources;

{$R *.fmx}

{ TComponentButton }

function TComponentButton.Align(AAlign: TAlignLayout): TComponentButton;
begin
  Result := Self;
  LytGeral.Align := AAlign;
end;

function TComponentButton.Component: TFMXObject;
begin
  Result := LytGeral;
end;

procedure TComponentButton.FormCreate(Sender: TObject);
begin
  GlobalEventBus.RegisterSubscriber(Self);

  LytGeral.Align := TAlignLayout.Top;
  LytGeral.Margins.Left := 4;
  LytGeral.Margins.Top := 4;
  LytGeral.Margins.Bottom := 4;
  LytGeral.Margins.Right := 4;
  recBtnRealce.Visible := False;
end;

function TComponentButton.Icon(AResource: string): TComponentButton;
begin
  Result := Self;
  TServiceUtils.ResourceImage(AResource, ImgIcon);
end;

function TComponentButton.OnClickButton(
  AOnClick: TNotifyEvent): TComponentButton;
begin
  Result := Self;
  if Assigned(AOnClick) then
    SpeBtnLateral.OnClick := AOnClick;
end;

procedure TComponentButton.Props(AValue: TProps);
begin
  recBtnRealce.Visible := False;
  recBtnRealce.Visible := (AValue.Key = 'ButtomLateral') and (AValue.PropString = (TComponentButton(Self).Name));
end;

function TComponentButton.Text(AValue: string): TComponentButton;
begin
  Result := Self;
  LblText.Text := AValue;
end;

end.
