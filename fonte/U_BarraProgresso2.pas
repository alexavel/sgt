unit U_BarraProgresso2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfrmProgd = class(TForm)
    ProgressBar1: TProgressBar;
    lTabela: TLabel;
    lcontador: TLabel;
    subtabela: TLabel;
    lsubcontador: TLabel;
    ProgressBar2: TProgressBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProgd: TfrmProgd;

implementation

{$R *.dfm}

end.
