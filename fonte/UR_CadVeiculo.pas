unit UR_CadVeiculo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, System.Actions, Vcl.ActnList, Vcl.ImgList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.Buttons, frxClass,
  frxDBSet, frxExportImage, frxExportRTF, frxExportPDF, frxExportMail,
  frxExportXML, frxExportXLS, frxExportDBF, frxExportDOCX, frxExportText,
  frxExportCSV, Data.DB, Datasnap.DBClient, Datasnap.Provider,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, System.ImageList;

type
  TfrmRelCadVeiculo = class(TForm)
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
    frxReportTab: TfrxReport;
    frxDBVeiculo: TfrxDBDataset;
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
    ImageList1: TImageList;
    Label5: TLabel;
    Label1: TLabel;
    edNome: TEdit;
    edCodigo: TButtonedEdit;
    rbNume: TRadioButton;
    sqlTab: TZQuery;
    dspTab: TDataSetProvider;
    cliTab: TClientDataSet;
    dsTab: TDataSource;
    sqlTabvat_placa: TWideStringField;
    sqlTabvat_nrfrota: TWideStringField;
    sqlTabvat_pasta: TWideStringField;
    sqlTabvat_chip: TWideStringField;
    sqlTabvat_cartao: TWideStringField;
    sqlTabvat_chassi: TWideStringField;
    sqlTabvat_licenc: TWideStringField;
    sqlTabvat_renavan: TWideStringField;
    sqlTabvat_dut: TWideStringField;
    sqlTabvat_codltd: TIntegerField;
    sqlTabvat_codtip: TIntegerField;
    sqlTabvat_codmdl: TIntegerField;
    sqlTabvat_codmrc: TIntegerField;
    sqlTabvat_codcor: TIntegerField;
    sqlTabvat_codcid: TIntegerField;
    sqlTabvat_codgrm: TIntegerField;
    sqlTabvat_cor: TWideStringField;
    sqlTabvat_status: TWideStringField;
    sqlTabvat_tanque1: TFloatField;
    sqlTabvat_tanque2: TFloatField;
    sqlTabvat_tanque3: TFloatField;
    sqlTabvat_kmini: TFloatField;
    sqlTabvat_kmatu: TFloatField;
    sqlTabvat_anofbmd: TWideStringField;
    sqlTabvat_termo: TWideStringField;
    sqlTabvat_tombo: TWideStringField;
    sqlTabvat_estado: TWideStringField;
    sqlTabvat_qtdpass: TWideStringField;
    sqlTabvat_potenc: TWideStringField;
    sqlTabvat_kgbruto: TFloatField;
    sqlTabvat_kgcarga: TFloatField;
    sqlTabvat_clindad: TWideStringField;
    sqlTabvat_nrmotor: TWideStringField;
    sqlTabvat_cavalo: TWideStringField;
    sqlTabvat_foto: TBlobField;
    sqlTabvat_obs: TWideMemoField;
    sqlTabvat_vlrcmp: TFloatField;
    sqlTabvat_datcmp: TDateField;
    sqlTabvat_nfecmp: TWideStringField;
    sqlTabvat_usuinc: TWideStringField;
    sqlTabvat_datinc: TDateField;
    sqlTabvat_horinc: TWideStringField;
    sqlTabvat_usualt: TWideStringField;
    sqlTabvat_datalt: TDateField;
    sqlTabvat_horalt: TWideStringField;
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
    sqlTabmdl_codigo: TIntegerField;
    sqlTabmdl_nome: TWideStringField;
    sqlTabmdl_codfip: TWideStringField;
    sqlTabmdl_codmrc: TIntegerField;
    sqlTabmdl_codgrm: TIntegerField;
    sqlTabmdl_usuinc: TWideStringField;
    sqlTabmdl_datinc: TDateField;
    sqlTabmdl_horinc: TWideStringField;
    sqlTabmdl_usualt: TWideStringField;
    sqlTabmdl_datalt: TDateField;
    sqlTabmdl_horalt: TWideStringField;
    sqlTabmrc_codigo: TIntegerField;
    sqlTabmrc_nome: TWideStringField;
    sqlTabmrc_usuinc: TWideStringField;
    sqlTabmrc_datinc: TDateField;
    sqlTabmrc_horinc: TWideStringField;
    sqlTabmrc_usualt: TWideStringField;
    sqlTabmrc_datalt: TDateField;
    sqlTabmrc_horalt: TWideStringField;
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
    sqlTabtip_codigo: TIntegerField;
    sqlTabtip_nome: TWideStringField;
    sqlTabtip_teixo: TFloatField;
    sqlTabtip_usuinc: TWideStringField;
    sqlTabtip_step: TFloatField;
    sqlTabtip_tipo: TWideStringField;
    sqlTabtip_trac: TWideStringField;
    sqlTabtip_datinc: TDateField;
    sqlTabtip_horinc: TWideStringField;
    sqlTabtip_usualt: TWideStringField;
    sqlTabtip_datalt: TDateField;
    sqlTabtip_horalt: TWideStringField;
    sqlTabcor_codigo: TIntegerField;
    sqlTabcor_nome: TWideStringField;
    sqlTabcor_usuinc: TWideStringField;
    sqlTabcor_datinc: TDateField;
    sqlTabcor_horinc: TWideStringField;
    sqlTabcor_usualt: TWideStringField;
    sqlTabcor_datalt: TDateField;
    sqlTabcor_horalt: TWideStringField;
    sqlTabgrm_codigo: TIntegerField;
    sqlTabgrm_nome: TWideStringField;
    sqlTabgrm_usuinc: TWideStringField;
    sqlTabgrm_datinc: TDateField;
    sqlTabgrm_horinc: TWideStringField;
    sqlTabgrm_usualt: TWideStringField;
    sqlTabgrm_datalt: TDateField;
    sqlTabgrm_horalt: TWideStringField;
    cliTabvat_placa: TWideStringField;
    cliTabvat_nrfrota: TWideStringField;
    cliTabvat_pasta: TWideStringField;
    cliTabvat_chip: TWideStringField;
    cliTabvat_cartao: TWideStringField;
    cliTabvat_chassi: TWideStringField;
    cliTabvat_licenc: TWideStringField;
    cliTabvat_renavan: TWideStringField;
    cliTabvat_dut: TWideStringField;
    cliTabvat_codltd: TIntegerField;
    cliTabvat_codtip: TIntegerField;
    cliTabvat_codmdl: TIntegerField;
    cliTabvat_codmrc: TIntegerField;
    cliTabvat_codcor: TIntegerField;
    cliTabvat_codcid: TIntegerField;
    cliTabvat_codgrm: TIntegerField;
    cliTabvat_cor: TWideStringField;
    cliTabvat_status: TWideStringField;
    cliTabvat_tanque1: TFloatField;
    cliTabvat_tanque2: TFloatField;
    cliTabvat_tanque3: TFloatField;
    cliTabvat_kmini: TFloatField;
    cliTabvat_kmatu: TFloatField;
    cliTabvat_anofbmd: TWideStringField;
    cliTabvat_termo: TWideStringField;
    cliTabvat_tombo: TWideStringField;
    cliTabvat_estado: TWideStringField;
    cliTabvat_qtdpass: TWideStringField;
    cliTabvat_potenc: TWideStringField;
    cliTabvat_kgbruto: TFloatField;
    cliTabvat_kgcarga: TFloatField;
    cliTabvat_clindad: TWideStringField;
    cliTabvat_nrmotor: TWideStringField;
    cliTabvat_cavalo: TWideStringField;
    cliTabvat_foto: TBlobField;
    cliTabvat_obs: TWideMemoField;
    cliTabvat_vlrcmp: TFloatField;
    cliTabvat_datcmp: TDateField;
    cliTabvat_nfecmp: TWideStringField;
    cliTabvat_usuinc: TWideStringField;
    cliTabvat_datinc: TDateField;
    cliTabvat_horinc: TWideStringField;
    cliTabvat_usualt: TWideStringField;
    cliTabvat_datalt: TDateField;
    cliTabvat_horalt: TWideStringField;
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
    cliTabmdl_codigo: TIntegerField;
    cliTabmdl_nome: TWideStringField;
    cliTabmdl_codfip: TWideStringField;
    cliTabmdl_codmrc: TIntegerField;
    cliTabmdl_codgrm: TIntegerField;
    cliTabmdl_usuinc: TWideStringField;
    cliTabmdl_datinc: TDateField;
    cliTabmdl_horinc: TWideStringField;
    cliTabmdl_usualt: TWideStringField;
    cliTabmdl_datalt: TDateField;
    cliTabmdl_horalt: TWideStringField;
    cliTabmrc_codigo: TIntegerField;
    cliTabmrc_nome: TWideStringField;
    cliTabmrc_usuinc: TWideStringField;
    cliTabmrc_datinc: TDateField;
    cliTabmrc_horinc: TWideStringField;
    cliTabmrc_usualt: TWideStringField;
    cliTabmrc_datalt: TDateField;
    cliTabmrc_horalt: TWideStringField;
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
    cliTabtip_codigo: TIntegerField;
    cliTabtip_nome: TWideStringField;
    cliTabtip_teixo: TFloatField;
    cliTabtip_usuinc: TWideStringField;
    cliTabtip_step: TFloatField;
    cliTabtip_tipo: TWideStringField;
    cliTabtip_trac: TWideStringField;
    cliTabtip_datinc: TDateField;
    cliTabtip_horinc: TWideStringField;
    cliTabtip_usualt: TWideStringField;
    cliTabtip_datalt: TDateField;
    cliTabtip_horalt: TWideStringField;
    cliTabcor_codigo: TIntegerField;
    cliTabcor_nome: TWideStringField;
    cliTabcor_usuinc: TWideStringField;
    cliTabcor_datinc: TDateField;
    cliTabcor_horinc: TWideStringField;
    cliTabcor_usualt: TWideStringField;
    cliTabcor_datalt: TDateField;
    cliTabcor_horalt: TWideStringField;
    cliTabgrm_codigo: TIntegerField;
    cliTabgrm_nome: TWideStringField;
    cliTabgrm_usuinc: TWideStringField;
    cliTabgrm_datinc: TDateField;
    cliTabgrm_horinc: TWideStringField;
    cliTabgrm_usualt: TWideStringField;
    cliTabgrm_datalt: TDateField;
    cliTabgrm_horalt: TWideStringField;
    Label2: TLabel;
    Label3: TLabel;
    edNomPlc: TEdit;
    edPlaca: TButtonedEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure mnVizualExecute(Sender: TObject);
    procedure mnImprimeExecute(Sender: TObject);
    procedure mnSairExecute(Sender: TObject);
    procedure edCodigoRightButtonClick(Sender: TObject);
    procedure edCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edPlacaRightButtonClick(Sender: TObject);
    procedure edPlacaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure CheckItem(Sender: TObject);
    procedure Impressao(nTipo: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCadVeiculo: TfrmRelCadVeiculo;

implementation

{$R *.dfm}

uses U_funcao, U_dmEmp, uSistema, U_ClassConsMotorista,
  U_ClasseUtil, U_Pesquisa, U_Classcons;

procedure TfrmRelCadVeiculo.edCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      edCodigoRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmRelCadVeiculo.edCodigoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsLotado ;
  Pesquisa.sqlTabela :=  dmEmp.sqllotado ;
  Pesquisa.cliTabela :=  dmEmp.cliLotado ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Setores/Departamentos de Veículos';
  Pesquisa.nmTabela  := 'lotado' ;
  Pesquisa.NovoCad   := 'lotado' ;
  // Display        campo   cabecalho               get         tan  indices
  Pesquisa.AddReg('ltd_codigo','Código'             ,'vat_codltd' ,5  ,'por Código' );
  Pesquisa.AddReg('ltd_nome'  ,'Setor/Departamento' ,'edNomLtd'   ,20 ,'por Departamnento' );

  Pesquisa.acessa(edCodigo);
  edCodigo.text   :=  Pesquisa.RecReg('ltd_codigo');
  edNome.text     :=  Pesquisa.RecReg('ltd_nome');
  Pesquisa.Destroy;

 end;
procedure TfrmRelCadVeiculo.edPlacaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      edPlacaRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmRelCadVeiculo.edPlacaRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsveiculoatv ;
  Pesquisa.sqlTabela :=  dmEmp.sqlveiculoatv ;
  Pesquisa.cliTabela :=  dmEmp.cliveiculoatv ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Veículos';
  Pesquisa.nmTabela  := 'veiculoatv';
  if edCodigo.Text <> '' then
     Pesquisa.QuerySql   := ' VAT_CODLTD = '+QuotedStr( edCodigo.Text );

  // Display        campo   cabecalho           get         tan  indices
  Pesquisa.AddReg('vat_placa',  'Placa'         ,'vat_placa' ,     7  , 'por Placa'   );
  Pesquisa.AddReg('vat_nrfrota','Frota'         ,'vat_nrfrota' ,   7  , 'por Frota'   );
  Pesquisa.AddReg('mdl_nome',   'Modelo'        ,'edNomMdl' ,     25  , 'por Modelo'  );
  Pesquisa.AddReg('mrc_nome',   'Marca'         ,'' ,             25  , 'por Marca'   );
  Pesquisa.AddReg('ltd_nome',   'Lotado'        ,'' ,             25  , 'por Lotação' );
  Pesquisa.AddReg('vat_chassi', 'Chassi'        ,'' ,             17  , 'por Chassi'  );
  Pesquisa.AddReg('vat_renavan','Renavan'       ,'' ,             17  , 'por Renavan' );

  Pesquisa.acessa(edPlaca);
  edPlaca.text   :=  Pesquisa.RecReg('vat_placa');
  edNomPlc.text  :=  Pesquisa.RecReg('mdl_nome');
  Pesquisa.Destroy;

end;

procedure TfrmRelCadVeiculo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    dmEmp.sqlPessoal.Close   ;
    frmRelCadVeiculo             := nil    ;
    action                       := cafree ;
end;

procedure TfrmRelCadVeiculo.FormShow(Sender: TObject);
begin
  // Cor do banner
  Banner.ParentBackGround := False;
  Banner.ParentColor      := False;
  Banner.Brush.Color      := u_funcao.Bronze_Escuro ;

  // Titulos do Banner
  lbCabeca01.Caption    := 'Ficha de Registro de Cliente';
  lbCabeca02.Caption    := u_funcao.nmSistema ;
  // Cores - Titulos do Banner
  lbCabeca01.Font.Color := u_funcao.clTit_BCad ;
  lbCabeca02.Font.Color := u_funcao.clTit_BCad ;
  rbAlfa.Checked        := True;
end;

procedure TfrmRelCadVeiculo.CheckItem(Sender: TObject);
Begin
{}
End;

procedure TfrmRelCadVeiculo.Impressao(nTipo: integer);
Var
cTitulo, cWhere : String;
begin
cWhere :='';
if edCodigo.Text <> '' then
   cWhere := ' where vat_codltd = '+edCodigo.Text;

if edPlaca.Text <> '' then
   cWhere := ' where vat_placa = '+QuotedStr( edPlaca.Text );

if ( edCodigo.Text <> '' ) and ( edPlaca.Text <> '' ) then
   cWhere := ' where vat_placa = '+QuotedStr( edPlaca.Text )+' and vat_codltd = '+QuotedStr( edCodigo.Text );

  { Formulando o tipo de impressao }
  cTitulo := ' FICHA DE VEÍCULO ';

    // Gerando os Turnos
  with sqlTab do
     begin
       Close;
       Sql.Text :='Select * from  '+U_funcao.SelSchema('veiculoatv')
                +' left JOIN  '+U_funcao.SelSchema('lotado')+' on ltd_codigo = vat_codltd '
                +' left JOIN  '+U_funcao.SelSchema('modelo')+' on mdl_codigo = vat_codmdl '
                +' left JOIN  '+U_funcao.SelSchema('marca')+' on mrc_codigo = vat_codmrc   '
                +' left JOIN  '+U_funcao.SelSchema('cidade')+' on  cid_codigo    = vat_codcid  '
                +' left JOIN  '+U_funcao.SelSchema('tipo')+' on tip_codigo = vat_codtip '
                +' left JOIN  '+U_funcao.SelSchema('cor')+' on cor_codigo = vat_codcor  '
                +' left JOIN  '+U_funcao.SelSchema('grupomnt')+' on grm_codigo = vat_codgrm '
                +' '+cWhere
                +' order by '+fIIF(rbAlfa.Checked, ' vat_nrfrota ', ' vat_placa ' );
       Open;
  end;
  // Cabeçalho do relatorio
  CabReports( frxReportTab, cTitulo, 'RelVeiculoFicha.fr3' );

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

end;



procedure TfrmRelCadVeiculo.mnImprimeExecute(Sender: TObject);
begin
 Impressao(2);
end;

procedure TfrmRelCadVeiculo.mnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelCadVeiculo.mnVizualExecute(Sender: TObject);
begin
 Impressao(1);
end;

end.
