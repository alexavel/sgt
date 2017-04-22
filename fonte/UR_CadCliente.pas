unit UR_CadCliente;

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
  TfrmRelCadCliente = class(TForm)
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
    frxDBCliente: TfrxDBDataset;
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
    sqlTabcli_codigo: TIntegerField;
    sqlTabcli_tipo: TWideStringField;
    sqlTabcli_ativo: TBooleanField;
    sqlTabcli_nome: TWideStringField;
    sqlTabcli_fantasia: TWideStringField;
    sqlTabcli_codgcl: TIntegerField;
    sqlTabcli_codcgo: TIntegerField;
    sqlTabcli_datnas: TDateField;
    sqlTabcli_diapag: TWideStringField;
    sqlTabcli_ecivil: TWideStringField;
    sqlTabcli_nompal: TWideStringField;
    sqlTabcli_nommae: TWideStringField;
    sqlTabcli_cpfcnpj: TWideStringField;
    sqlTabcli_rgiest: TWideStringField;
    sqlTabcli_imunic: TWideStringField;
    sqlTabcli_rgexped: TWideStringField;
    sqlTabcli_rgdata: TDateField;
    sqlTabcli_cep: TWideStringField;
    sqlTabcli_endereco: TWideStringField;
    sqlTabcli_complem: TWideStringField;
    sqlTabcli_numres: TWideStringField;
    sqlTabcli_bairro: TWideStringField;
    sqlTabcli_codcid: TIntegerField;
    sqlTabcli_cepcob: TWideStringField;
    sqlTabcli_endcob: TWideStringField;
    sqlTabcli_comcob: TWideStringField;
    sqlTabcli_numcob: TWideStringField;
    sqlTabcli_baicob: TWideStringField;
    sqlTabcli_codcdc: TIntegerField;
    sqlTabcli_repend: TBooleanField;
    sqlTabcli_telef01: TWideStringField;
    sqlTabcli_telef02: TWideStringField;
    sqlTabcli_celular: TWideStringField;
    sqlTabcli_email: TWideStringField;
    sqlTabcli_emailsped: TWideStringField;
    sqlTabcli_status: TWideStringField;
    sqlTabcli_foto: TBlobField;
    sqlTabcli_obs: TWideMemoField;
    sqlTabcli_vlrlim: TFloatField;
    sqlTabcli_vlrcre: TFloatField;
    sqlTabcli_datcmp: TDateField;
    sqlTabcli_usuinc: TWideStringField;
    sqlTabcli_datinc: TDateField;
    sqlTabcli_horinc: TWideStringField;
    sqlTabcli_usualt: TWideStringField;
    sqlTabcli_datalt: TDateField;
    sqlTabcli_horalt: TWideStringField;
    sqlTabcgo_codigo: TIntegerField;
    sqlTabcgo_nome: TWideStringField;
    sqlTabcgo_usuinc: TWideStringField;
    sqlTabcgo_datinc: TDateField;
    sqlTabcgo_horinc: TWideStringField;
    sqlTabcgo_usualt: TWideStringField;
    sqlTabcgo_datalt: TDateField;
    sqlTabcgo_horalt: TWideStringField;
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
    sqlTabgcl_codigo: TIntegerField;
    sqlTabgcl_nome: TWideStringField;
    sqlTabgcl_usuinc: TWideStringField;
    sqlTabgcl_datinc: TDateField;
    sqlTabgcl_horinc: TWideStringField;
    sqlTabgcl_usualt: TWideStringField;
    sqlTabgcl_datalt: TDateField;
    sqlTabgcl_horalt: TWideStringField;
    cliTabcli_codigo: TIntegerField;
    cliTabcli_tipo: TWideStringField;
    cliTabcli_ativo: TBooleanField;
    cliTabcli_nome: TWideStringField;
    cliTabcli_fantasia: TWideStringField;
    cliTabcli_codgcl: TIntegerField;
    cliTabcli_codcgo: TIntegerField;
    cliTabcli_datnas: TDateField;
    cliTabcli_diapag: TWideStringField;
    cliTabcli_ecivil: TWideStringField;
    cliTabcli_nompal: TWideStringField;
    cliTabcli_nommae: TWideStringField;
    cliTabcli_cpfcnpj: TWideStringField;
    cliTabcli_rgiest: TWideStringField;
    cliTabcli_imunic: TWideStringField;
    cliTabcli_rgexped: TWideStringField;
    cliTabcli_rgdata: TDateField;
    cliTabcli_cep: TWideStringField;
    cliTabcli_endereco: TWideStringField;
    cliTabcli_complem: TWideStringField;
    cliTabcli_numres: TWideStringField;
    cliTabcli_bairro: TWideStringField;
    cliTabcli_codcid: TIntegerField;
    cliTabcli_cepcob: TWideStringField;
    cliTabcli_endcob: TWideStringField;
    cliTabcli_comcob: TWideStringField;
    cliTabcli_numcob: TWideStringField;
    cliTabcli_baicob: TWideStringField;
    cliTabcli_codcdc: TIntegerField;
    cliTabcli_repend: TBooleanField;
    cliTabcli_telef01: TWideStringField;
    cliTabcli_telef02: TWideStringField;
    cliTabcli_celular: TWideStringField;
    cliTabcli_email: TWideStringField;
    cliTabcli_emailsped: TWideStringField;
    cliTabcli_status: TWideStringField;
    cliTabcli_foto: TBlobField;
    cliTabcli_obs: TWideMemoField;
    cliTabcli_vlrlim: TFloatField;
    cliTabcli_vlrcre: TFloatField;
    cliTabcli_datcmp: TDateField;
    cliTabcli_usuinc: TWideStringField;
    cliTabcli_datinc: TDateField;
    cliTabcli_horinc: TWideStringField;
    cliTabcli_usualt: TWideStringField;
    cliTabcli_datalt: TDateField;
    cliTabcli_horalt: TWideStringField;
    cliTabcgo_codigo: TIntegerField;
    cliTabcgo_nome: TWideStringField;
    cliTabcgo_usuinc: TWideStringField;
    cliTabcgo_datinc: TDateField;
    cliTabcgo_horinc: TWideStringField;
    cliTabcgo_usualt: TWideStringField;
    cliTabcgo_datalt: TDateField;
    cliTabcgo_horalt: TWideStringField;
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
    cliTabgcl_codigo: TIntegerField;
    cliTabgcl_nome: TWideStringField;
    cliTabgcl_usuinc: TWideStringField;
    cliTabgcl_datinc: TDateField;
    cliTabgcl_horinc: TWideStringField;
    cliTabgcl_usualt: TWideStringField;
    cliTabgcl_datalt: TDateField;
    cliTabgcl_horalt: TWideStringField;
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
    procedure edCodigoRightButtonClick(Sender: TObject);
    procedure edCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure CheckItem(Sender: TObject);
    procedure Impressao(nTipo: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCadCliente: TfrmRelCadCliente;

implementation

{$R *.dfm}

uses U_funcao, U_dmEmp, uSistema, U_ClassConsMotorista,
  U_ClasseUtil, U_Pesquisa, U_Classcons;

procedure TfrmRelCadCliente.edCodigoKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmRelCadCliente.edCodigoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dscliente ;
  Pesquisa.sqlTabela :=  dmEmp.sqlcliente ;
  Pesquisa.cliTabela :=  dmEmp.clicliente ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Clientes';
  Pesquisa.nmTabela  := 'cliente';
  // Display        campo   cabecalho              get            tan  indices
  Pesquisa.AddReg('cli_codigo'  ,'Código'         ,'cli_codigo'   ,5  ,'por Código'    );
  Pesquisa.AddReg('cli_cpfcnpj' ,'CPF/CNPJ'       ,'cli_cpfcnpj'  ,14 ,'por CPF/CNPJ'  );
  Pesquisa.AddReg('cli_nome'    ,'Nome Completo'  ,'cli_nome'     ,35 ,'por Nome'      );
  Pesquisa.AddReg('cli_endereco','Endereço'       ,'cli_endereco' ,25 ,'por Endereço'  );
  Pesquisa.AddReg('cli_bairro'  ,'Endereço'       ,'cli_bairro'   ,25 ,'por Bairro'    );
  Pesquisa.AddReg('cid_nome'    ,'Cidade'         ,'cid_nome'     ,25 ,'por Cidade'    );
  Pesquisa.AddReg('cli_telef01' ,'Telefone 01'    ,'cli_telef01'  ,10 ,'por Tel 01'    );
  Pesquisa.AddReg('cli_telef02' ,'Telefone 02'    ,'cli_telef02'  ,10 ,'por Tel 02'    );
  Pesquisa.AddReg('cli_celular' ,'Celular'        ,'cli_celular'  ,10 ,'por Tel 01'    );

  Pesquisa.acessa(edCodigo);
  edCodigo.text   :=  Pesquisa.RecReg('cli_codigo');
  edNome.text     :=  Pesquisa.RecReg('cli_nome');
  Pesquisa.Destroy;

 end;
procedure TfrmRelCadCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    dmEmp.sqlPessoal.Close   ;
    frmRelCadCliente             := nil    ;
    action                       := cafree ;
end;

procedure TfrmRelCadCliente.FormShow(Sender: TObject);
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

procedure TfrmRelCadCliente.CheckItem(Sender: TObject);
Begin
{}
End;

procedure TfrmRelCadCliente.Impressao(nTipo: integer);
Var
cTitulo : String;
begin
  { Formulando o tipo de impressao }
  cTitulo := 'FICHA DE REGISTRO DE CLIENTE: ORDENADO POR '+U_funcao.fIIF( rbAlfa.Checked, 'DESCRIÇÃO','CÓDIGO' );

    // Gerando os Turnos
  with sqlTab do
     begin
       Close;
       Sql.Text := 'select * from  '+U_funcao.SelSchema('cliente')
                +' LEFT JOIN '+U_funcao.SelSchema('cargo')+' on cgo_codigo = cli_codcgo '
                +' LEFT JOIN '+U_funcao.SelSchema('cidade')+' on cid_codigo = cli_codcid '
                +' LEFT JOIN '+U_funcao.SelSchema('estado')+' on est_codigo = cid_codest '
                +' LEFT JOIN '+U_funcao.SelSchema('grupocli')+'  on gcl_codigo = cli_codgcl '
                +' '+fIIF(edCodigo.Text <>'', ' where cli_codigo = '+edCodigo.Text,'' )
                +' order by '+fIIF(rbAlfa.Checked, ' cli_nome ', ' cli_codigo ' );
       Open;
  end;
  // Cabeçalho do relatorio
  CabReports( frxReportTab, cTitulo, 'RelClienteFicha.fr3' );

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



procedure TfrmRelCadCliente.mnImprimeExecute(Sender: TObject);
begin
 Impressao(2);
end;

procedure TfrmRelCadCliente.mnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelCadCliente.mnVizualExecute(Sender: TObject);
begin
 Impressao(1);
end;

end.
