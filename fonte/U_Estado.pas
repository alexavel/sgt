unit U_Estado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_000MdlCrud, Data.DB,
  FireDAC.Phys.MySQLDef, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.ExtDlgs,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Bind.Components,
  Data.Bind.DBScope, FireDAC.Phys, FireDAC.Phys.MySQL, System.ImageList,
  Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, EditTuning, U_funcao, U_Classcons, U_dmEmp, Vcl.Mask;

type
  TfrmEstado = class(T_frmModeloCrud)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label26: TLabel;
    est_codpai: TButtonedEdit;
    edNomPai: TEdit;
    est_nome: TEdit;
    est_codigo: TEdit;
    est_uf: TEdit;
    procedure est_codpaiRightButtonClick(Sender: TObject);
    procedure est_codpaiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure est_codpaiExit(Sender: TObject);
    procedure est_codigoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstado: TfrmEstado;
  Pesquisa: TClasConsulta;

implementation

{$R *.dfm}

procedure TfrmEstado.est_codigoExit(Sender: TObject);
begin
  inherited;
  DupliCod(Sender);
end;

procedure TfrmEstado.est_codpaiExit(Sender: TObject);
begin
  inherited;
  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlpais ;
  edNomPai.Text   :=  Pesquisa.Relacao('pais',est_codpai,'pai_codigo','pai_nome');

end;

procedure TfrmEstado.est_codpaiKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 Try
case key of
    VK_END:
      est_codpaiRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmEstado.est_codpaiRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  inherited;
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dspais ;
  Pesquisa.sqlTabela :=  dmEmp.sqlpais ;
  Pesquisa.cliTabela :=  dmEmp.clipais ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Paises';
  Pesquisa.nmTabela  := 'pais' ;
  Pesquisa.NovoCad   := 'pais' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('pai_codigo','Código'            ,'pai_codigo' ,5  ,'por Código'       );
  Pesquisa.AddReg('pai_nome'  ,'pais'              ,'pai_nome'   ,30 ,'por Pais'         );

  Pesquisa.acessa(est_codpai);
  est_codpai.text   :=  Pesquisa.RecReg('pai_codigo');
  edNompai.text     :=  Pesquisa.RecReg('pai_nome');

  Pesquisa.Destroy;

end;

end.
