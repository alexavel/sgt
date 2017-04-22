unit UR_CadFornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, System.Actions, Vcl.ActnList, Vcl.ImgList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.Buttons, frxClass,
  frxDBSet, frxExportImage, frxExportRTF, frxExportPDF, frxExportMail,
  frxExportXML, frxExportXLS, frxExportDBF, frxExportDOCX, frxExportText,
  frxExportCSV, U_Classcons, Data.DB, Datasnap.DBClient, Datasnap.Provider,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, System.ImageList;

type
  TfrmRelCadFornecedores = class(TForm)
    Banner: TPanel;
    imgLogo: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    Image1: TImage;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    ActRel: TActionManager;
    imgList_Rel: TImageList;
    mnVizual: TAction;
    mnImprime: TAction;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    mnSair: TAction;
    rbAlfa: TRadioButton;
    rbNume: TRadioButton;
    frxReportTab: TfrxReport;
    frxDBFornecedor: TfrxDBDataset;
    frxDBEmpresa: TfrxDBDataset;
    frxXLSExport1: TfrxXLSExport;
    frxXMLExport1: TfrxXMLExport;
    frxMailExport1: TfrxMailExport;
    frxPDFExport1: TfrxPDFExport;
    frxRTFExport1: TfrxRTFExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxDBConfigura: TfrxDBDataset;
    frxCSVExport1: TfrxCSVExport;
    frxSimpleTextExport1: TfrxSimpleTextExport;
    frxDOCXExport1: TfrxDOCXExport;
    frxDBFExport1: TfrxDBFExport;
    mdl_codmrc: TButtonedEdit;
    Label2: TLabel;
    edNomMrc: TEdit;
    Label3: TLabel;
    sqlTab: TZQuery;
    dspTab: TDataSetProvider;
    cliTab: TClientDataSet;
    dsTab: TDataSource;
    sqlTabfnd_codigo: TIntegerField;
    sqlTabfnd_ativo: TWideStringField;
    sqlTabfnd_nome: TWideStringField;
    sqlTabfnd_rsocial: TWideStringField;
    sqlTabfnd_tipopes: TWideStringField;
    sqlTabfnd_cpfcnpj: TWideStringField;
    sqlTabfnd_codpct: TWideStringField;
    sqlTabfnd_endereco: TWideStringField;
    sqlTabfnd_numend: TWideStringField;
    sqlTabfnd_complem: TWideStringField;
    sqlTabfnd_bairro: TWideStringField;
    sqlTabfnd_cep: TWideStringField;
    sqlTabfnd_codcid: TIntegerField;
    sqlTabfnd_telef1: TWideStringField;
    sqlTabfnd_telef2: TWideStringField;
    sqlTabfnd_celula: TWideStringField;
    sqlTabfnd_obs: TWideMemoField;
    sqlTabfnd_usuinc: TWideStringField;
    sqlTabfnd_datinc: TDateField;
    sqlTabfnd_horinc: TWideStringField;
    sqlTabfnd_usualt: TWideStringField;
    sqlTabfnd_datalt: TDateField;
    sqlTabfnd_horalt: TWideStringField;
    sqlTabcid_codigo: TIntegerField;
    sqlTabcid_cidnum: TWideStringField;
    sqlTabcid_nome: TWideStringField;
    sqlTabcid_codest: TIntegerField;
    sqlTabcid_codpai: TIntegerField;
    sqlTabcid_usuinc: TWideStringField;
    sqlTabcid_datinc: TDateField;
    sqlTabcid_horinc: TWideStringField;
    sqlTabcid_usualt: TWideStringField;
    sqlTabcid_datalt: TDateField;
    sqlTabcid_horalt: TWideStringField;
    sqlTabpct_codigo: TWideStringField;
    sqlTabpct_cntmae: TWideStringField;
    sqlTabpct_nome: TWideStringField;
    sqlTabpct_natureza: TWideStringField;
    sqlTabpct_tipo: TWideStringField;
    sqlTabpct_limite: TFloatField;
    sqlTabpct_meta: TFloatField;
    sqlTabpct_ord: TFloatField;
    sqlTabpct_usuinc: TWideStringField;
    sqlTabpct_datinc: TDateField;
    sqlTabpct_horinc: TWideStringField;
    sqlTabpct_usualt: TWideStringField;
    sqlTabpct_datalt: TDateField;
    sqlTabpct_horalt: TWideStringField;
    cliTabfnd_codigo: TIntegerField;
    cliTabfnd_ativo: TWideStringField;
    cliTabfnd_nome: TWideStringField;
    cliTabfnd_rsocial: TWideStringField;
    cliTabfnd_tipopes: TWideStringField;
    cliTabfnd_cpfcnpj: TWideStringField;
    cliTabfnd_codpct: TWideStringField;
    cliTabfnd_endereco: TWideStringField;
    cliTabfnd_numend: TWideStringField;
    cliTabfnd_complem: TWideStringField;
    cliTabfnd_bairro: TWideStringField;
    cliTabfnd_cep: TWideStringField;
    cliTabfnd_codcid: TIntegerField;
    cliTabfnd_telef1: TWideStringField;
    cliTabfnd_telef2: TWideStringField;
    cliTabfnd_celula: TWideStringField;
    cliTabfnd_obs: TWideMemoField;
    cliTabfnd_usuinc: TWideStringField;
    cliTabfnd_datinc: TDateField;
    cliTabfnd_horinc: TWideStringField;
    cliTabfnd_usualt: TWideStringField;
    cliTabfnd_datalt: TDateField;
    cliTabfnd_horalt: TWideStringField;
    cliTabcid_codigo: TIntegerField;
    cliTabcid_cidnum: TWideStringField;
    cliTabcid_nome: TWideStringField;
    cliTabcid_codest: TIntegerField;
    cliTabcid_codpai: TIntegerField;
    cliTabcid_usuinc: TWideStringField;
    cliTabcid_datinc: TDateField;
    cliTabcid_horinc: TWideStringField;
    cliTabcid_usualt: TWideStringField;
    cliTabcid_datalt: TDateField;
    cliTabcid_horalt: TWideStringField;
    cliTabpct_codigo: TWideStringField;
    cliTabpct_cntmae: TWideStringField;
    cliTabpct_nome: TWideStringField;
    cliTabpct_natureza: TWideStringField;
    cliTabpct_tipo: TWideStringField;
    cliTabpct_limite: TFloatField;
    cliTabpct_meta: TFloatField;
    cliTabpct_ord: TFloatField;
    cliTabpct_usuinc: TWideStringField;
    cliTabpct_datinc: TDateField;
    cliTabpct_horinc: TWideStringField;
    cliTabpct_usualt: TWideStringField;
    cliTabpct_datalt: TDateField;
    cliTabpct_horalt: TWideStringField;
    sqlTabest_codigo: TIntegerField;
    sqlTabest_nome: TWideStringField;
    sqlTabest_uf: TWideStringField;
    sqlTabest_codpai: TIntegerField;
    sqlTabest_usuinc: TWideStringField;
    sqlTabest_datinc: TDateField;
    sqlTabest_horinc: TWideStringField;
    sqlTabest_usualt: TWideStringField;
    sqlTabest_datalt: TDateField;
    sqlTabest_horalt: TWideStringField;
    cliTabest_codigo: TIntegerField;
    cliTabest_nome: TWideStringField;
    cliTabest_uf: TWideStringField;
    cliTabest_codpai: TIntegerField;
    cliTabest_usuinc: TWideStringField;
    cliTabest_datinc: TDateField;
    cliTabest_horinc: TWideStringField;
    cliTabest_usualt: TWideStringField;
    cliTabest_datalt: TDateField;
    cliTabest_horalt: TWideStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure mnVizualExecute(Sender: TObject);
    procedure mnImprimeExecute(Sender: TObject);
    procedure mnSairExecute(Sender: TObject);
    procedure mdl_codmrcRightButtonClick(Sender: TObject);
    procedure mdl_codmrcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mdl_codmrcExit(Sender: TObject);
  private
    procedure CheckItem(Sender: TObject);
    procedure Impressao(nTipo: integer);
    { Private declarations }
  public
    Pesquisa : TClasConsulta;
    { Public declarations }
  end;

var
  frmRelCadFornecedores: TfrmRelCadFornecedores;

implementation

{$R *.dfm}

uses U_funcao, U_dmEmp, uSistema, U_ClassconsContas,
  U_ClassConsMotorista, U_ClasseUtil;

procedure TfrmRelCadFornecedores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    dmEmp.sqlMarca.Close   ;
    frmRelCadFornecedores        := nil    ;
    action                       := cafree ;
end;

procedure TfrmRelCadFornecedores.FormShow(Sender: TObject);
begin
  // Cor do banner
  Banner.ParentBackGround := False;
  Banner.ParentColor      := False;
  Banner.Brush.Color      := u_funcao.Bronze_Escuro ;

  // Titulos do Banner
  lbCabeca01.Caption    := 'Listagem de Fornecedores';
  lbCabeca02.Caption    := u_funcao.nmSistema ;
  // Cores - Titulos do Banner
  lbCabeca01.Font.Color := u_funcao.clTit_BCad ;
  lbCabeca02.Font.Color := u_funcao.clTit_BCad ;
  rbAlfa.Checked        := True;
end;

procedure TfrmRelCadFornecedores.CheckItem(Sender: TObject);
Begin
{}
End;

procedure TfrmRelCadFornecedores.Impressao(nTipo: integer);
Var
cTitulo : String;
begin
{ Formulando o tipo de impressao }
cTitulo := 'LISTAGEM DE FORNECEDORES :'+fIIF( mdl_codmrc.Text ='','', ' POR FORNECEDOR: '+Trim( mdl_codmrc.Text)+' - '+Trim(edNomMrc.Text ) )+' ORDENADO POR '+U_funcao.fIIF( rbAlfa.Checked, 'DESCRIÇÃO','CÓDIGO' );

    // Gerando os Turnos
  with sqlTab do
     begin
       Close;
       Sql.Text :='SELECT * FROM '+U_funcao.SelSchema('fornecedor')
                +' left JOIN  '+U_funcao.SelSchema('cidade')+' on cid_codigo = fnd_codcid '
                +' left JOIN  '+U_funcao.SelSchema('estado')+' on est_codigo = cid_codest '
                +' left JOIN  '+U_funcao.SelSchema('pconta')+' on pct_codigo = fnd_codpct '
                +fIIF( mdl_codmrc.Text ='','', ' where fnd_codigo = '+ mdl_codmrc.Text )+' order by '+fIIF(rbAlfa.Checked, ' fnd_nome ', ' fnd_codigo ' );
       Open;
  end;
  // Cabeçalho do relatorio
  CabReports( frxReportTab, cTitulo, 'RelFornecedor.fr3' );

  if nTipo = 3 then Begin
     frxReportTab.DesignReport();
  End Else
  if nTipo = 1 then Begin
     frxReportTab.ShowReport();
  End Else
  if nTipo = 2 then Begin
     frxReportTab.PrepareReport;
     frxReportTab.Print;
  End;
  sqlTab.Close;
  cliTab.Close;
end;



procedure TfrmRelCadFornecedores.mdl_codmrcExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlFornecedor ;
  edNomMrc.Text :=  Pesquisa.Relacao('fornecedor',mdl_codmrc,'fnd_codigo','fnd_nome');

end;

procedure TfrmRelCadFornecedores.mdl_codmrcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      mdl_codmrcRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmRelCadFornecedores.mdl_codmrcRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsFornecedor ;
  Pesquisa.sqlTabela :=  dmEmp.sqlFornecedor ;
  Pesquisa.cliTabela :=  dmEmp.cliFornecedor ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Fornecedores';
  Pesquisa.nmTabela  := 'fornecedor';
  Pesquisa.NovoCad   := 'fornecedor' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('fnd_codigo', 'Código'             ,'mdl_codmrc'  ,5  ,'por Código' );
  Pesquisa.AddReg('fnd_cpfcnpj','Cpf/Cnpj'           ,'fnd_cpfcnpj' ,15 ,'por Cpf/Cnpj' );
  Pesquisa.AddReg('fnd_nome',   'Marca de Modleo'    ,'edNomMrc'    ,25 ,'por Nome' );

  Pesquisa.acessa(mdl_codmrc);
  mdl_codmrc.text   :=  Pesquisa.RecReg('fnd_codigo');
  edNomMrc.text     :=  Pesquisa.RecReg('fnd_nome');
  Pesquisa.Destroy;

end;

procedure TfrmRelCadFornecedores.mnImprimeExecute(Sender: TObject);
begin
 Impressao(2);
end;

procedure TfrmRelCadFornecedores.mnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelCadFornecedores.mnVizualExecute(Sender: TObject);
begin
 Impressao(1);
end;

end.
