unit UR_CadPesHabVencida;

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
  TfrmRelCadPesHabVen = class(TForm)
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
    frxDBPessoal: TfrxDBDataset;
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
    sqlTab: TZQuery;
    dspTab: TDataSetProvider;
    cliTab: TClientDataSet;
    dsTab: TDataSource;
    sqlTabdias: TFloatField;
    sqlTabpss_codigo: TIntegerField;
    sqlTabpss_nome: TWideStringField;
    sqlTabpss_apelido: TWideStringField;
    sqlTabpss_codcgo: TIntegerField;
    sqlTabpss_codltd: TIntegerField;
    sqlTabpss_datnas: TDateField;
    sqlTabpss_sexo: TWideStringField;
    sqlTabpss_ecivil: TWideStringField;
    sqlTabpss_tpsangue: TWideStringField;
    sqlTabpss_nompal: TWideStringField;
    sqlTabpss_nommae: TWideStringField;
    sqlTabpss_cpf: TWideStringField;
    sqlTabpss_rg: TWideStringField;
    sqlTabpss_rgexped: TWideStringField;
    sqlTabpss_rgdata: TDateField;
    sqlTabpss_pispasep: TWideStringField;
    sqlTabpss_numctps: TWideStringField;
    sqlTabpss_habilitac: TWideStringField;
    sqlTabpss_hbemite: TDateField;
    sqlTabpss_hbvalid: TDateField;
    sqlTabpss_hbcateg: TWideStringField;
    sqlTabpss_nrtitulo: TWideStringField;
    sqlTabpss_nrreserv: TWideStringField;
    sqlTabpss_cep: TWideStringField;
    sqlTabpss_endereco: TWideStringField;
    sqlTabpss_complem: TWideStringField;
    sqlTabpss_numres: TWideStringField;
    sqlTabpss_bairro: TWideStringField;
    sqlTabpss_codcid: TIntegerField;
    sqlTabpss_tpimove: TWideStringField;
    sqlTabpss_tpresid: TWideStringField;
    sqlTabpss_telef01: TWideStringField;
    sqlTabpss_telef02: TWideStringField;
    sqlTabpss_celular: TWideStringField;
    sqlTabpss_email: TWideStringField;
    sqlTabpss_status: TWideStringField;
    sqlTabpss_foto: TBlobField;
    sqlTabpss_obs: TWideMemoField;
    sqlTabpss_vlrrenda: TFloatField;
    sqlTabpss_vlrvale: TFloatField;
    sqlTabpss_datcmp: TDateField;
    sqlTabpss_nfecmp: TWideStringField;
    sqlTabpss_codpcv: TWideStringField;
    sqlTabpss_codpcr: TWideStringField;
    sqlTabpss_usuinc: TWideStringField;
    sqlTabpss_datinc: TDateField;
    sqlTabpss_horinc: TWideStringField;
    sqlTabpss_usualt: TWideStringField;
    sqlTabpss_datalt: TDateField;
    sqlTabpss_horalt: TWideStringField;
    cliTabdias: TFloatField;
    cliTabpss_codigo: TIntegerField;
    cliTabpss_nome: TWideStringField;
    cliTabpss_apelido: TWideStringField;
    cliTabpss_codcgo: TIntegerField;
    cliTabpss_codltd: TIntegerField;
    cliTabpss_datnas: TDateField;
    cliTabpss_sexo: TWideStringField;
    cliTabpss_ecivil: TWideStringField;
    cliTabpss_tpsangue: TWideStringField;
    cliTabpss_nompal: TWideStringField;
    cliTabpss_nommae: TWideStringField;
    cliTabpss_cpf: TWideStringField;
    cliTabpss_rg: TWideStringField;
    cliTabpss_rgexped: TWideStringField;
    cliTabpss_rgdata: TDateField;
    cliTabpss_pispasep: TWideStringField;
    cliTabpss_numctps: TWideStringField;
    cliTabpss_habilitac: TWideStringField;
    cliTabpss_hbemite: TDateField;
    cliTabpss_hbvalid: TDateField;
    cliTabpss_hbcateg: TWideStringField;
    cliTabpss_nrtitulo: TWideStringField;
    cliTabpss_nrreserv: TWideStringField;
    cliTabpss_cep: TWideStringField;
    cliTabpss_endereco: TWideStringField;
    cliTabpss_complem: TWideStringField;
    cliTabpss_numres: TWideStringField;
    cliTabpss_bairro: TWideStringField;
    cliTabpss_codcid: TIntegerField;
    cliTabpss_tpimove: TWideStringField;
    cliTabpss_tpresid: TWideStringField;
    cliTabpss_telef01: TWideStringField;
    cliTabpss_telef02: TWideStringField;
    cliTabpss_celular: TWideStringField;
    cliTabpss_email: TWideStringField;
    cliTabpss_status: TWideStringField;
    cliTabpss_foto: TBlobField;
    cliTabpss_obs: TWideMemoField;
    cliTabpss_vlrrenda: TFloatField;
    cliTabpss_vlrvale: TFloatField;
    cliTabpss_datcmp: TDateField;
    cliTabpss_nfecmp: TWideStringField;
    cliTabpss_codpcv: TWideStringField;
    cliTabpss_codpcr: TWideStringField;
    cliTabpss_usuinc: TWideStringField;
    cliTabpss_datinc: TDateField;
    cliTabpss_horinc: TWideStringField;
    cliTabpss_usualt: TWideStringField;
    cliTabpss_datalt: TDateField;
    cliTabpss_horalt: TWideStringField;
    mdl_codmrc: TButtonedEdit;
    Label2: TLabel;
    edNomMrc: TEdit;
    Label3: TLabel;
    sqlTabltd_codigo: TIntegerField;
    sqlTabltd_nome: TWideStringField;
    sqlTabltd_sigla: TWideStringField;
    sqlTabltd_endereco: TWideStringField;
    sqlTabltd_numend: TWideStringField;
    sqlTabltd_complem: TWideStringField;
    sqlTabltd_bairro: TWideStringField;
    sqlTabltd_cep: TWideStringField;
    sqlTabltd_codcid: TIntegerField;
    sqlTabltd_telef1: TWideStringField;
    sqlTabltd_telef2: TWideStringField;
    sqlTabltd_celula: TWideStringField;
    sqlTabltd_usuinc: TWideStringField;
    sqlTabltd_datinc: TDateField;
    sqlTabltd_horinc: TWideStringField;
    sqlTabltd_usualt: TWideStringField;
    sqlTabltd_datalt: TDateField;
    sqlTabltd_horalt: TWideStringField;
    cliTabltd_codigo: TIntegerField;
    cliTabltd_nome: TWideStringField;
    cliTabltd_sigla: TWideStringField;
    cliTabltd_endereco: TWideStringField;
    cliTabltd_numend: TWideStringField;
    cliTabltd_complem: TWideStringField;
    cliTabltd_bairro: TWideStringField;
    cliTabltd_cep: TWideStringField;
    cliTabltd_codcid: TIntegerField;
    cliTabltd_telef1: TWideStringField;
    cliTabltd_telef2: TWideStringField;
    cliTabltd_celula: TWideStringField;
    cliTabltd_usuinc: TWideStringField;
    cliTabltd_datinc: TDateField;
    cliTabltd_horinc: TWideStringField;
    cliTabltd_usualt: TWideStringField;
    cliTabltd_datalt: TDateField;
    cliTabltd_horalt: TWideStringField;
    sqlTabcgo_codigo: TIntegerField;
    sqlTabcgo_nome: TWideStringField;
    sqlTabcgo_usuinc: TWideStringField;
    sqlTabcgo_datinc: TDateField;
    sqlTabcgo_horinc: TWideStringField;
    sqlTabcgo_usualt: TWideStringField;
    sqlTabcgo_datalt: TDateField;
    sqlTabcgo_horalt: TWideStringField;
    cliTabcgo_codigo: TIntegerField;
    cliTabcgo_nome: TWideStringField;
    cliTabcgo_usuinc: TWideStringField;
    cliTabcgo_datinc: TDateField;
    cliTabcgo_horinc: TWideStringField;
    cliTabcgo_usualt: TWideStringField;
    cliTabcgo_datalt: TDateField;
    cliTabcgo_horalt: TWideStringField;
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
  frmRelCadPesHabVen: TfrmRelCadPesHabVen;

implementation

{$R *.dfm}

uses U_funcao, U_dmEmp, uSistema, U_ClassconsContas,
  U_ClassConsMotorista, U_ClasseUtil;

procedure TfrmRelCadPesHabVen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    dmEmp.sqlMarca.Close   ;
    frmRelCadPesHabVen           := nil    ;
    action                       := cafree ;
end;

procedure TfrmRelCadPesHabVen.FormShow(Sender: TObject);
begin
  // Cor do banner
  Banner.ParentBackGround := False;
  Banner.ParentColor      := False;
  Banner.Brush.Color      := u_funcao.Bronze_Escuro ;

  // Titulos do Banner
  lbCabeca01.Caption    := 'Listagem de Motoristas com Habilitação Vencida';
  lbCabeca02.Caption    := u_funcao.nmSistema ;
  // Cores - Titulos do Banner
  lbCabeca01.Font.Color := u_funcao.clTit_BCad ;
  lbCabeca02.Font.Color := u_funcao.clTit_BCad ;
  rbAlfa.Checked        := True;
end;

procedure TfrmRelCadPesHabVen.CheckItem(Sender: TObject);
Begin
{}
End;

procedure TfrmRelCadPesHabVen.Impressao(nTipo: integer);
Var
cTitulo : String;
begin
  { Formulando o tipo de impressao }
  cTitulo := 'LISTAGEM DE MOTORISTA COM HABILITAÇÃO VENCIDA: '+fIIF( mdl_codmrc.Text ='','', ' POR LOTAÇÃO: '+Trim( mdl_codmrc.Text)+' - '+Trim(edNomMrc.Text ) )+' ORDENADO POR '+U_funcao.fIIF( rbAlfa.Checked, 'NOME','CÓDIGO' );

    // Gerando os Turnos
  with sqlTab do
     begin
       Close;
       Sql.Text :=' SELECT extract(DAY FROM (now()- pss_hbvalid) ) Dias, * FROM '+U_funcao.SelSchema('pessoal')
                +'  LEFT JOIN '+U_funcao.SelSchema('lotado')+' on ltd_codigo = pss_codltd '
                +'  LEFT JOIN '+U_funcao.SelSchema('cargo')+' on cgo_codigo = pss_codcgo '
                +'  where  pss_hbvalid <= now() '
                +fIIF( mdl_codmrc.Text ='','',' and pss_codltd = '+ mdl_codmrc.Text )
                +' order by pss_codltd, '+fIIF( rbAlfa.Checked ,' pss_nome ', ' pss_codigo ' );
       Open;
  end;
  // Cabeçalho do relatorio
  CabReports( frxReportTab, cTitulo, 'RelPesHabVencida.fr3' );

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



procedure TfrmRelCadPesHabVen.mdl_codmrcExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlLotado ;
  edNomMrc.Text :=  Pesquisa.Relacao('lotado',mdl_codmrc,'ltd_codigo','ltd_nome');

end;

procedure TfrmRelCadPesHabVen.mdl_codmrcKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmRelCadPesHabVen.mdl_codmrcRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsLotado ;
  Pesquisa.sqlTabela :=  dmEmp.sqlLotado ;
  Pesquisa.cliTabela :=  dmEmp.cliLotado ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela Lotações de Funcionário';
  Pesquisa.nmTabela  := 'lotado';
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('ltd_codigo','Código'             ,'mdl_codmrc' ,5  ,'por Código' );
  Pesquisa.AddReg('ltd_nome'  ,'Lotado'             ,'edNomMrc'   ,25 ,'por Lotação' );

  Pesquisa.acessa(mdl_codmrc);
  mdl_codmrc.text   :=  Pesquisa.RecReg('ltd_codigo');
  edNomMrc.text     :=  Pesquisa.RecReg('ltd_nome');
  Pesquisa.Destroy;

end;

procedure TfrmRelCadPesHabVen.mnImprimeExecute(Sender: TObject);
begin
 Impressao(2);
end;

procedure TfrmRelCadPesHabVen.mnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelCadPesHabVen.mnVizualExecute(Sender: TObject);
begin
 Impressao(1);
end;

end.
