unit u_lotadoinc;

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
  Vcl.Imaging.pngimage, Vcl.Mask, U_Classcons, EditTuning, u_funcao, U_dmEmp;

type
  TfrmLotado = class(T_frmModeloCrud)
    Label1: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    ltd_nome: TEdit;
    ltd_codcid: TButtonedEdit;
    edNomCid: TEdit;
    ltd_sigla: TEdit;
    ltd_cep: TMaskEdit;
    ltd_endereco: TEdit;
    ltd_numend: TEdit;
    ltd_complem: TEdit;
    ltd_bairro: TEdit;
    edNomUf: TEdit;
    ltd_telef1: TMaskEdit;
    ltd_telef2: TMaskEdit;
    ltd_celula: TMaskEdit;
    ltd_codigo: TEdit;
    procedure ltd_codcidRightButtonClick(Sender: TObject);
    procedure ltd_codcidKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ltd_codcidExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLotado: TfrmLotado;
  Pesquisa: TClasConsulta;

implementation

{$R *.dfm}

procedure TfrmLotado.ltd_codcidExit(Sender: TObject);
begin
  inherited;
  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlcidade ;
  edNomCid.Text :=  Pesquisa.Relacao('cidade',ltd_codcid,'cid_codigo','cid_nome');
  edNomUf.Text  :=  Pesquisa.Relacao('cidade',ltd_codcid,'cid_codigo','est_uf'  );

end;

procedure TfrmLotado.ltd_codcidKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 Try
case key of
    VK_END:
      ltd_codcidRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmLotado.ltd_codcidRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  inherited;
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dscidade ;
  Pesquisa.sqlTabela :=  dmEmp.sqlCidade ;
  Pesquisa.cliTabela :=  dmEmp.clicidade ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Cidades';
  Pesquisa.nmTabela  := 'cidade' ;
  Pesquisa.NovoCad   := 'cidade' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('cid_codigo','Código'             ,'ltd_codcid' ,5  ,'por Código' );
  Pesquisa.AddReg('cid_nome'  ,'Cidade'             ,'edNomCid'   ,25 ,'por cidade' );
  Pesquisa.AddReg('est_uf'    ,'Uf'                 ,'edNomUf'    ,2  ,'por Estado' );

  Pesquisa.acessa(ltd_codcid);
  ltd_codcid.text   :=  Pesquisa.RecReg('cid_codigo');
  edNomCid.text     :=  Pesquisa.RecReg('cid_nome');
  edNomUf.text      :=  Pesquisa.RecReg('est_uf');
  Pesquisa.Destroy;

end;

end.
