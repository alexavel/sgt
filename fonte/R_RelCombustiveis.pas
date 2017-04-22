unit R_RelCombustiveis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  frxExportImage, frxExportRTF, frxExportPDF, frxExportMail, frxExportXML,
  frxClass, frxExportXLS, frxDBSet, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmRelComb = class(TForm)
    StbRelat: TStatusBar;
    Splitter1: TSplitter;
    GroupBox1: TGroupBox;
    RCod: TRadioButton;
    RDes: TRadioButton;
    Button1: TButton;
    btnDesign: TButton;
    Button3: TButton;
    Button4: TButton;
    frxReportTab: TfrxReport;
    frxXLSExport1: TfrxXLSExport;
    frxXMLExport1: TfrxXMLExport;
    frxMailExport1: TfrxMailExport;
    frxPDFExport1: TfrxPDFExport;
    frxRTFExport1: TfrxRTFExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxDBDatSetPrin: TfrxDBDataset;
    frxDBDatasetCfg: TfrxDBDataset;
    ZQPrim: TFDQuery;
    procedure FormShow(Sender: TObject);
    procedure RCodClick(Sender: TObject);
    procedure RDesClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    Procedure Impressao(nTipo: integer);
    procedure Button3Click(Sender: TObject);
    procedure btnDesignClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    cPathExe, cWhere, cOrder: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelComb: TfrmRelComb;

implementation
{$R *.dfm}

uses U_dmEmp, uSistema, U_funcao;

procedure TfrmRelComb.Button1Click(Sender: TObject);
begin
  Impressao(1);
end;

procedure TfrmRelComb.btnDesignClick(Sender: TObject);
begin
  Impressao(3)
end;

procedure TfrmRelComb.Button3Click(Sender: TObject);
begin
  Impressao(2)
end;

procedure TfrmRelComb.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelComb.FormShow(Sender: TObject);
begin
  if sysCodusu = 1 then Begin
     btnDesign.Show;
  End Else
     btnDesign.Hide;

  frmRelComb.Caption := 'Listagem de Combustiveis';
  cPathExe := ExtractFilePath(Application.ExeName) ;
  RCodClick(Nil);
end;

procedure TfrmRelComb.Impressao(nTipo: integer);
begin
{ Formulando o tipo de impressao }


    // Gerando os Turnos
  with ZQPrim do
     begin
       Close;
       Connection := dmEmp.SqlConSis ;
       Sql.Text :='SELECT * FROM '+U_funcao.SelSchema('combustivel')+' order by '+cOrder;
       Open;
  end;
  frxReportTab.LoadFromFile(cPathExe+'reports\'+'RelCombustivel.fr3');
  frxReportTab.Variables['CAB01']  := QuotedStr( UpperCase(U_funcao.nmSistema));
  frxReportTab.Variables['CAB02']  := QuotedStr( UpperCase(fPrincipal.Caption));
  frxReportTab.Variables['CAB03']  := QuotedStr( 'LISTAGEM DE COMBUSTÍVEIS: ORDENADO POR '+U_funcao.fIIF( RDes.Checked, 'DESCRIÇÃO','CÓDIGO' ));
  frxReportTab.Variables['CAB05']  := QuotedStr( sysUsuario);

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

procedure TfrmRelComb.RCodClick(Sender: TObject);
begin
 RDes.Checked := False;
 cOrder   := ' cmb_codigo '
end;

procedure TfrmRelComb.RDesClick(Sender: TObject);
begin
 RCod.Checked := False;
 cOrder   := ' cmb_nome '
end;

end.
