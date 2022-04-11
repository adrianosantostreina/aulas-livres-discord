unit App.View.Home;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  App.View.Listagem, FMX.Objects, FMX.Layouts, FMX.Controls.Presentation;

type
  TFrmHome = class(TFrmTemplate)
    Rectangle1: TRectangle;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmHome: TFrmHome;

implementation

{$R *.fmx}

end.
