unit App.Resources;

interface

uses
  FMX.Objects,

  System.Classes,
  System.StrUtils,
  System.SysUtils,
  System.Types;

type
  TServiceUtils = class
    private

    public
      class procedure ResourceImage(AResource: string; AImage: TImage);
  end;

implementation

{ TServiceUtils }

class procedure TServiceUtils.ResourceImage(AResource: string; AImage: TImage);
var
  Resource : TResourceStream;
begin
  Resource := TResourceStream.Create(HInstance, AResource, RT_RCDATA);
  try
    AImage.Bitmap.LoadFromStream(Resource);
  finally
    Resource.Free;
  end;
end;

end.
