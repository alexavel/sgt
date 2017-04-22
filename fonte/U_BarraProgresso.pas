unit U_BarraProgresso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Imaging.jpeg;

type
  TfrmProgresso = class(TForm)
    ProgressBar1: TProgressBar;
    lTabela: TLabel;
    lcontador: TLabel;
    bnPrincipal: TImage;
    Image2: TImage;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProgresso: TfrmProgresso;

implementation

{$R *.dfm}

end.
