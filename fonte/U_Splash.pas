{ Este exemplo foi baixado no site www.andrecelestino.com
  Passe por lá a qualquer momento para conferir os novos artigos! :)
  contato@andrecelestino.com }
  
unit U_Splash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls;

type
  TFrmSplash = class(TForm)
    Image: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSplash: TFrmSplash;

implementation

{$R *.dfm}

procedure TFrmSplash.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FrmSplash);
end;

end.
