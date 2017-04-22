unit UR_CadPessoal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, System.Actions, Vcl.ActnList, Vcl.ImgList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.Buttons, frxClass,
  frxDBSet, frxExportImage, frxExportRTF, frxExportPDF, frxExportMail,
  frxExportXML, frxExportXLS, frxExportDBF, frxExportDOCX, frxExportText,
  frxExportCSV, System.ImageList;

type
  TfrmRelCadPessoal = class(TForm)
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
    frxDBMarca: TfrxDBDataset;
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
  frmRelCadPessoal: TfrmRelCadPessoal;

implementation

{$R *.dfm}

uses U_funcao, U_dmEmp, uSistema, U_ClassConsMotorista,
  U_ClasseUtil, U_Pesquisa, U_Classcons;

procedure TfrmRelCadPessoal.edCodigoKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmRelCadPessoal.edCodigoRightButtonClick(Sender: TObject);
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
procedure TfrmRelCadPessoal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    dmEmp.sqlPessoal.Close   ;
    frmRelCadPessoal             := nil    ;
    action                       := cafree ;
end;

procedure TfrmRelCadPessoal.FormShow(Sender: TObject);
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

procedure TfrmRelCadPessoal.CheckItem(Sender: TObject);
Begin
{}
End;

procedure TfrmRelCadPessoal.Impressao(nTipo: integer);
Var
cTitulo : String;
begin
  { Formulando o tipo de impressao }
  cTitulo := 'FICHA DE REGISTRO DE CLIENTE: ORDENADO POR '+U_funcao.fIIF( rbAlfa.Checked, 'DESCRIÇÃO','CÓDIGO' );

    // Gerando os Turnos
  with dmEmp.sqlPessoal do
     begin
       Close;
       Sql.Text :='SELECT * FROM '+U_funcao.SelSchema('pessoal')
                +' left join  '+U_funcao.SelSchema('cidade')+' on cid_codigo = pss_codcid '
                +' left join  '+U_funcao.SelSchema('lotado')+' on ltd_codigo = pss_codltd '
                +' left join  '+U_funcao.SelSchema('cargo')+'  on cgo_codigo = pss_codcgo '
                +' left join  '+U_funcao.SelSchema('estado')+' on est_codigo = cid_codest '
                +' '+fIIF(edCodigo.Text <>'', ' where pss_codigo = '+edCodigo.Text,'' )
                +' order by '+fIIF(rbAlfa.Checked, ' pss_nome ', ' pss_codigo ' );
       Open;
  end;
  // Cabeçalho do relatorio
  CabReports( frxReportTab, cTitulo, 'RelPessoalFicha.fr3' );

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



procedure TfrmRelCadPessoal.mnImprimeExecute(Sender: TObject);
begin
 Impressao(2);
end;

procedure TfrmRelCadPessoal.mnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelCadPessoal.mnVizualExecute(Sender: TObject);
begin
 Impressao(1);
end;

end.
