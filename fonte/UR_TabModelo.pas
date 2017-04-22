unit UR_TabModelo;

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
  TfrmRelTabModelo = class(TForm)
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
    frxDBModelo: TfrxDBDataset;
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
    sqlTabmdl_codigo: TIntegerField;
    sqlTabmdl_nome: TWideStringField;
    sqlTabmdl_codfip: TWideStringField;
    sqlTabmdl_codmrc: TIntegerField;
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
    sqlTabmdl_codgrm: TIntegerField;
    dspTab: TDataSetProvider;
    cliTab: TClientDataSet;
    cliTabmdl_codigo: TIntegerField;
    cliTabmdl_nome: TWideStringField;
    cliTabmdl_codfip: TWideStringField;
    cliTabmdl_codmrc: TIntegerField;
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
    cliTabmdl_codgrm: TIntegerField;
    dsTab: TDataSource;
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
  frmRelTabModelo: TfrmRelTabModelo;

implementation

{$R *.dfm}

uses U_funcao, U_dmEmp, uSistema, U_ClassconsContas,
  U_ClassConsMotorista, U_ClasseUtil;

procedure TfrmRelTabModelo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    dmEmp.sqlMarca.Close   ;
    frmRelTabModelo              := nil    ;
    action                       := cafree ;
end;

procedure TfrmRelTabModelo.FormShow(Sender: TObject);
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
end;

procedure TfrmRelTabModelo.CheckItem(Sender: TObject);
Begin
{}
End;

procedure TfrmRelTabModelo.Impressao(nTipo: integer);
Var
cTitulo : String;
begin
{ Formulando o tipo de impressao }
cTitulo := 'LISTAGEM DE MODELOS DE VEÍCULOS:'+fIIF( mdl_codmrc.Text ='','', ' POR MARCA: '+Trim( mdl_codmrc.Text)+' - '+Trim(edNomMrc.Text ) )+' ORDENADO POR '+U_funcao.fIIF( rbAlfa.Checked, 'DESCRIÇÃO','CÓDIGO' );

    // Gerando os Turnos
  with sqlTab do
     begin
       Close;
       Sql.Text :='SELECT * FROM '+U_funcao.SelSchema('Modelo')
                +' left JOIN  '+U_funcao.SelSchema('marca')+' on mrc_codigo = mdl_codmrc '
                +fIIF( mdl_codmrc.Text ='','', ' where mrc_codigo = '+ mdl_codmrc.Text )+' order by mrc_codigo,  '+fIIF(rbAlfa.Checked, ' mdl_nome ', ' mdl_codigo ' );
       Open;
  end;
  // Cabeçalho do relatorio
  CabReports( frxReportTab, cTitulo, 'RelModelo.fr3' );

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



procedure TfrmRelTabModelo.mdl_codmrcExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlMarca ;
  edNomMrc.Text :=  Pesquisa.Relacao('marca',mdl_codmrc,'mrc_codigo','mrc_nome');

end;

procedure TfrmRelTabModelo.mdl_codmrcKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmRelTabModelo.mdl_codmrcRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsMarca ;
  Pesquisa.sqlTabela :=  dmEmp.sqlMarca ;
  Pesquisa.cliTabela :=  dmEmp.cliMarca ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Marcas de Veículos';
  Pesquisa.nmTabela  := 'marca';
  Pesquisa.NovoCad   := 'marca' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('mrc_codigo','Código'             ,'mdl_codmrc' ,5  ,'por Código' );
  Pesquisa.AddReg('mrc_nome'  ,'Marca de Modleo'    ,'edNomMrc'   ,25 ,'por Marca' );

  Pesquisa.acessa(mdl_codmrc);
  mdl_codmrc.text   :=  Pesquisa.RecReg('mrc_codigo');
  edNomMrc.text     :=  Pesquisa.RecReg('mrc_nome');
  Pesquisa.Destroy;

end;

procedure TfrmRelTabModelo.mnImprimeExecute(Sender: TObject);
begin
 Impressao(2);
end;

procedure TfrmRelTabModelo.mnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelTabModelo.mnVizualExecute(Sender: TObject);
begin
 Impressao(1);
end;

end.
