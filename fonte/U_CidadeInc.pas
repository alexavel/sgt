unit U_CidadeInc;

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
  Vcl.Imaging.pngimage, EditTuning, U_Classcons, U_funcao, U_dmEmp;

type
  TfrmCidade = class(T_frmModeloCrud)
    Label1: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cid_nome: TEdit;
    cid_codest: TButtonedEdit;
    edNomEst: TEdit;
    edNomUf: TEdit;
    cid_cidnum: TEdit;
    cid_codpai: TButtonedEdit;
    edNomPai: TEdit;
    cid_codigo: TEdit;
    procedure cid_codestRightButtonClick(Sender: TObject);
    procedure cid_codestKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cid_codestExit(Sender: TObject);
    procedure cid_codpaiRightButtonClick(Sender: TObject);
    procedure cid_codpaiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cid_codpaiExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCidade: TfrmCidade;
  Pesquisa: TClasConsulta;
implementation

{$R *.dfm}

procedure TfrmCidade.cid_codestExit(Sender: TObject);
begin
  inherited;

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlEstado ;
  edNomEst.Text   :=  Pesquisa.Relacao('estado',cid_codest,'est_codigo','est_nome');
  edNomUf.Text    :=  Pesquisa.Relacao('estado',cid_codest,'est_codigo','est_Uf');
  cid_codpai.Text :=  Pesquisa.Relacao('estado',cid_codest,'est_codigo','est_codpai');

end;

procedure TfrmCidade.cid_codestKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 Try
case key of
    VK_END:
      cid_codestRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmCidade.cid_codestRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  inherited;

  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsestado ;
  Pesquisa.sqlTabela :=  dmEmp.Sqlestado ;
  Pesquisa.cliTabela :=  dmEmp.cliestado ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Estados';
  Pesquisa.nmTabela  := 'estado';
//  Pesquisa.NovoCad   := 'estado' ;
  // Display        campo   cabecalho                     get         tan  indices
  Pesquisa.AddReg('est_codigo'  ,'Código'                 ,'cid_codest' ,5  ,'por Código'   );
  Pesquisa.AddReg('est_nome'    ,'Estado'                 ,'edNomEst'   ,30 ,'por Estado'   );
  Pesquisa.AddReg('est_uf'      ,'Uf'                     ,'edNomUf'    ,5  ,'por UF'       );
  Pesquisa.AddReg('pai_nome'    ,'Pais'                   ,'pai_nome'   ,15 ,'por Pais'     );

  Pesquisa.acessa(cid_codest);
  cid_codest.text  :=  Pesquisa.RecReg('est_codigo');
  edNomEst.text    :=  Pesquisa.RecReg('est_nome');
  cid_codpai.text  :=  Pesquisa.RecReg('est_codpai');
  Pesquisa.Destroy;


end;

procedure TfrmCidade.cid_codpaiExit(Sender: TObject);
begin
  inherited;

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlpais ;
  edNomPai.Text   :=  Pesquisa.Relacao('pais',cid_codpai,'pai_codigo','pai_nome');

end;

procedure TfrmCidade.cid_codpaiKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 Try
case key of
    VK_END:
      cid_codpaiRightButtonClick(Self);
  end;
Finally

End;
end;

procedure TfrmCidade.cid_codpaiRightButtonClick(Sender: TObject);
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

  Pesquisa.acessa(cid_codpai);
  cid_codpai.text   :=  Pesquisa.RecReg('pai_codigo');
  edNompai.text     :=  Pesquisa.RecReg('pai_nome');

  Pesquisa.Destroy;

end;

end.
