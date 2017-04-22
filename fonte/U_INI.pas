unit U_INI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TfrmIni = class(TForm)
    Image1: TImage;
    lbInfo: TLabel;
    pgbSistema: TProgressBar;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    lbVersao: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIni: TfrmIni;
  Min, Max: Integer;

implementation

uses U_funcao;

{$R *.dfm}

procedure TfrmIni.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmIni := Nil ;
  action := cafree;
end;

procedure TfrmIni.FormShow(Sender: TObject);
begin
lbVersao.Caption := 'Versão: '+GetVersion;
Image1.Refresh;
end;

end.
