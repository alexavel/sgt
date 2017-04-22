unit UR_CadPesAniversariante;

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
  TfrmRelCadPesAniverario = class(TForm)
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
    Label2: TLabel;
    sqlTab: TZQuery;
    dspTab: TDataSetProvider;
    cliTab: TClientDataSet;
    dsTab: TDataSource;
    edCombMes: TComboBox;
    sqlTabmes: TWideMemoField;
    sqlTabdia: TWideMemoField;
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
    cliTabmes: TWideMemoField;
    cliTabdia: TWideMemoField;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure mnVizualExecute(Sender: TObject);
    procedure mnImprimeExecute(Sender: TObject);
    procedure mnSairExecute(Sender: TObject);
  private
    procedure CheckItem(Sender: TObject);
    procedure Impressao(nTipo: integer);
    { Private declarations }
  public
    Pesquisa : TClasConsulta;
    { Public declarations }
  end;

var
  frmRelCadPesAniverario: TfrmRelCadPesAniverario;

implementation

{$R *.dfm}

uses U_funcao, U_dmEmp, uSistema, U_ClassconsContas,
  U_ClassConsMotorista, U_ClasseUtil;

procedure TfrmRelCadPesAniverario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    dmEmp.sqlMarca.Close   ;
    frmRelCadPesAniverario       := nil    ;
    action                       := cafree ;
end;

procedure TfrmRelCadPesAniverario.FormShow(Sender: TObject);
Var
i: Integer;
begin
  // Cor do banner
  Banner.ParentBackGround := False;
  Banner.ParentColor      := False;
  Banner.Brush.Color      := u_funcao.Bronze_Escuro ;

  // Titulos do Banner
  lbCabeca01.Caption    := 'Listagem de Marcas de Veículos';
  lbCabeca02.Caption    := u_funcao.nmSistema ;
  // Cores - Titulos do Banner
  lbCabeca01.Font.Color := u_funcao.clTit_BCad ;
  lbCabeca02.Font.Color := u_funcao.clTit_BCad ;
  rbAlfa.Checked        := True;

  edCombMes.items.clear;
  edCombMes.items.add('Selecione o Mês');
  for i := 1 to Length( U_funcao.aMeses ) do
      edCombMes.items.add(U_funcao.aMeses[i]);

  edCombMes.ItemIndex := 0;

end;

procedure TfrmRelCadPesAniverario.CheckItem(Sender: TObject);
Begin
{}
End;

procedure TfrmRelCadPesAniverario.Impressao(nTipo: integer);
Var
cTitulo : String;
begin
  { Formulando o tipo de impressao }
  cTitulo := 'LISTAGEM DE ANIVERSARIANTES :'+fIIF( edCombMes.ItemIndex = 0,' TODOS OS MESES',' MÊS: '+Trim( edCombMes.Text) )+' ORDENADO POR '+U_funcao.fIIF( rbAlfa.Checked, 'NOME','DATA' );

    // Gerando os Turnos
  with sqlTab do
     begin
       Close;
       Sql.Text :=' SELECT CASE '
                +' 			 WHEN Extract(Month From pss_datnas) = 1 THEN ''Janeiro'' '
                +' 			 WHEN Extract(Month From pss_datnas) = 2 THEN ''Fevereiro'' '
                +' 			 WHEN Extract(Month From pss_datnas) = 3 THEN ''Março'' '
                +' 			 WHEN Extract(Month From pss_datnas) = 4 THEN ''Abril'' '
                +' 			 WHEN Extract(Month From pss_datnas) = 5 THEN ''Maio'' '
                +' 			 WHEN Extract(Month From pss_datnas) = 6 THEN ''Junho'' '
                +' 			 WHEN Extract(Month From pss_datnas) = 7 THEN ''Julho'' '
                +' 			 WHEN Extract(Month From pss_datnas) = 8 THEN ''Agosto'' '
                +' 			 WHEN Extract(Month From pss_datnas) = 9 THEN ''Setembro'' '
                +' 			 WHEN Extract(Month From pss_datnas) = 10 THEN ''Outubro'' '
                +' 			 WHEN Extract(Month From pss_datnas) = 11 THEN ''Novembro'' '
                +' 			 WHEN Extract(Month From pss_datnas) = 12 THEN ''Dezembro'' '
                +'       END Mes, Extract(Day From pss_datnas)||''/''||Extract(Month From pss_datnas) as Dia, * '
                +' FROM '+U_funcao.SelSchema('pessoal')
                +' '+fIIF( edCombMes.ItemIndex = 0, '',' where Extract(Month From pss_datnas) = '+IntToStr( edCombMes.ItemIndex ) )
                +' ORDER BY Mes, '+fIIF(rbAlfa.Checked, ' Dia ', ' pss_nome ' );
       Open;
  end;
  // Cabeçalho do relatorio
  CabReports( frxReportTab, cTitulo, 'RelPessoalAniversario.fr3' );

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



procedure TfrmRelCadPesAniverario.mnImprimeExecute(Sender: TObject);
begin
 Impressao(2);
end;

procedure TfrmRelCadPesAniverario.mnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelCadPesAniverario.mnVizualExecute(Sender: TObject);
begin
 Impressao(1);
end;

end.
