unit App.View.Listagem;

interface

uses
  Router4D,
  Router4D.Interfaces,

  FMX.Controls,
  FMX.Dialogs,
  FMX.Forms,
  FMX.Graphics,
  FMX.Layouts,
  FMX.Types,

  System.Classes,
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Variants;

type
  TFrmTemplate = class(TForm, iRouter4DComponent)
    LytGeral: TLayout;
  private
    { Private declarations }
  public
    { Public declarations }
    function Render: TFMXObject;
    procedure UnRender;
  end;

var
  FrmTemplate: TFrmTemplate;

implementation

{$R *.fmx}

{ TFrmTemplate }

function TFrmTemplate.Render: TFMXObject;
begin
  Result := LytGeral;
end;

procedure TFrmTemplate.UnRender;
begin

end;

end.
