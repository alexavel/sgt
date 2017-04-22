unit UR_TabMarca;

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
  TfrmRelTabMarcas = class(TForm)
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
    { Public declarations }
  end;

var
  frmRelTabMarcas: TfrmRelTabMarcas;

implementation

{$R *.dfm}

uses U_funcao, U_dmEmp, uSistema;

procedure TfrmRelTabMarcas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    dmEmp.sqlMarca.Close   ;
    frmRelTabMarcas              := nil    ;
    action                       := cafree ;
end;

procedure TfrmRelTabMarcas.FormShow(Sender: TObject);
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

procedure TfrmRelTabMarcas.CheckItem(Sender: TObject);
Begin
{}
End;

procedure TfrmRelTabMarcas.Impressao(nTipo: integer);
Var
cTitulo : String;
begin
{ Formulando o tipo de impressao }
cTitulo := 'LISTAGEM DE MARCAS DE VEÍCULOS: ORDENADO POR '+U_funcao.fIIF( rbAlfa.Checked, 'DESCRIÇÃO','CÓDIGO' );

    // Gerando os Turnos
  with dmEmp.sqlMarca do
     begin
       Close;
       Sql.Text :='SELECT * FROM '+U_funcao.SelSchema('marca')+' order by '+fIIF(rbAlfa.Checked, ' mrc_nome ', ' mrc_codigo ' );
       Open;
  end;
  // Cabeçalho do relatorio
  CabReports( frxReportTab, cTitulo, 'RelMarca.fr3' );

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



procedure TfrmRelTabMarcas.mnImprimeExecute(Sender: TObject);
begin
 Impressao(2);
end;

procedure TfrmRelTabMarcas.mnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelTabMarcas.mnVizualExecute(Sender: TObject);
begin
 Impressao(1);
end;

end.
