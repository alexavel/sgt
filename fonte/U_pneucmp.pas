unit U_pneucmp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, ImgList, ExtCtrls, ComCtrls, xmldom,
  XMLIntf, IdHTTP, msxmldom, XMLDoc, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, ExtDlgs, RibbonLunaStyleActnCtrls,
  ToolWin, ActnMan, ActnCtrls, jpeg, edittuning, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, U_ClasseUtil,U_Classcons, ZDataset, ZDatasetUtils,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, U_ClassCad, Datasnap.DBClient,
  Datasnap.Provider, ZAbstractRODataset, ZAbstractDataset, frxClass, frxDBSet,
  System.ImageList, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client ;


type
  Tfrmpneucmp = class(TForm)
    StatusBar1: TStatusBar;
    Banner: TPanel;
    imgLogo: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ActDlg: TActionManager;
    btnNovo: TAction;
    SpeedButton1: TSpeedButton;
    btnAlterar: TAction;
    btnExcluir: TAction;
    btnGrava: TAction;
    btnCancela: TAction;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    btnIni: TAction;
    btnAnt: TAction;
    btnProx: TAction;
    btnUlt: TAction;
    btnSair: TAction;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    actionsub: TActionManager;
    CmbBtnInc: TAction;
    cmbBtnExc: TAction;
    grbCabec: TGroupBox;
    Label1: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label27: TLabel;
    Label11: TLabel;
    Label26: TLabel;
    Label12: TLabel;
    pcp_codigo: TButtonedEdit;
    pcp_codfnd: TButtonedEdit;
    edNomFnd: TEdit;
    pcp_datems: TDateTimePicker;
    pcp_chelet: TEdit;
    pcp_numnfe: TMaskEdit;
    pcp_datent: TDateTimePicker;
    Label2: TLabel;
    pcp_sernfe: TMaskEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GrbItens: TGroupBox;
    Label16: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    edNomPne: TEdit;
    edNomdim: TEdit;
    edqtdcmp: TMaskEdit;
    edvlrunt: TMaskEdit;
    edpctdes: TMaskEdit;
    edvlrdes: TMaskEdit;
    edvlrenc: TMaskEdit;
    edVlrTot: TEdit;
    edcodpne: TButtonedEdit;
    sqlItemPneu: TZQuery;
    dspItemPneu: TDataSetProvider;
    cliItemPneu: TClientDataSet;
    dsItemPneu: TDataSource;
    btnIncItem: TButton;
    edCodCst: TButtonedEdit;
    Label17: TLabel;
    edCodCfo: TButtonedEdit;
    Label19: TLabel;
    edpctbicm: TMaskEdit;
    Label20: TLabel;
    Label21: TLabel;
    edVlrbicm: TMaskEdit;
    edpctipi: TMaskEdit;
    Label22: TLabel;
    edvlripi: TMaskEdit;
    Label23: TLabel;
    edpctbicmst: TMaskEdit;
    Label24: TLabel;
    edvlrbicmst: TMaskEdit;
    Label25: TLabel;
    GroupBox2: TGroupBox;
    lbTotal: TLabel;
    GroupBox3: TGroupBox;
    lbTotaldesc: TLabel;
    GroupBox4: TGroupBox;
    lbQtdItens: TLabel;
    btnCancekItem: TButton;
    btnExcluItem: TButton;
    GroupBox5: TGroupBox;
    Label3: TLabel;
    btnFaturar: TAction;
    btnImpNotra: TAction;
    btnCalc: TAction;
    btnCalend: TAction;
    ImpNota: TfrxReport;
    frxDBCabeca: TfrxDBDataset;
    TabSheet2: TTabSheet;
    GrbFatura: TGroupBox;
    DBGrid2: TDBGrid;
    edDatvnc: TDateTimePicker;
    Label28: TLabel;
    edvlrpar: TMaskEdit;
    Label29: TLabel;
    btnIncFat: TButton;
    btnCanFat: TButton;
    btnExcFat: TButton;
    GroupBox6: TGroupBox;
    lbVlrFrete: TLabel;
    sqlPneuFin: TZQuery;
    dspPneuFin: TDataSetProvider;
    cliPneuFin: TClientDataSet;
    dsPneuFin: TDataSource;
    GroupBox8: TGroupBox;
    lbVlrLiq: TLabel;
    GroupBox9: TGroupBox;
    lbVlrFat: TLabel;
    Label30: TLabel;
    NroBol: TEdit;
    grbTaxas: TGroupBox;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    pcp_vlrfrt: TMaskEdit;
    pcp_vlrseg: TMaskEdit;
    pcp_vlrfac: TMaskEdit;
    pcp_codfpg: TButtonedEdit;
    Label31: TLabel;
    edNomFpg: TEdit;
    Label32: TLabel;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    frxDBDataset3: TfrxDBDataset;
    pcp_qtdpct: TMaskEdit;
    Label33: TLabel;
    edVlrPrc: TEdit;
    Label37: TLabel;
    DBGrid1: TDBGrid;
    sqlItemPneupci_codigo: TIntegerField;
    sqlItemPneupci_codpcp: TIntegerField;
    sqlItemPneupci_codcst: TWideStringField;
    sqlItemPneupci_codpmd: TIntegerField;
    sqlItemPneupci_qtdcmp: TFloatField;
    sqlItemPneupci_vlrunt: TFloatField;
    sqlItemPneupci_pctdes: TFloatField;
    sqlItemPneupci_vlrenc: TFloatField;
    sqlItemPneupci_vlrdes: TFloatField;
    sqlItemPneupci_vlrenf: TFloatField;
    sqlItemPneupci_codcfo: TWideStringField;
    sqlItemPneupci_pctbicm: TFloatField;
    sqlItemPneupci_vlrbicm: TFloatField;
    sqlItemPneupci_pctipi: TFloatField;
    sqlItemPneupci_vlripi: TFloatField;
    sqlItemPneupci_pctbicmst: TFloatField;
    sqlItemPneupci_vlrbicmst: TFloatField;
    sqlItemPneupci_usuinc: TWideStringField;
    sqlItemPneupci_datinc: TDateField;
    sqlItemPneupci_horinc: TWideStringField;
    sqlItemPneupci_usualt: TWideStringField;
    sqlItemPneupci_datalt: TDateField;
    sqlItemPneupci_horalt: TWideStringField;
    sqlItemPneupmd_codigo: TIntegerField;
    sqlItemPneupmd_nome: TWideStringField;
    sqlItemPneupmd_sucref: TWideStringField;
    sqlItemPneupmd_sucnov: TWideStringField;
    sqlItemPneupmd_codpds: TIntegerField;
    sqlItemPneupmd_codpdm: TIntegerField;
    sqlItemPneupmd_codpfb: TIntegerField;
    sqlItemPneupmd_kmvid1: TFloatField;
    sqlItemPneupmd_kmvid2: TFloatField;
    sqlItemPneupmd_kmvid3: TFloatField;
    sqlItemPneupmd_kmvid4: TFloatField;
    sqlItemPneupmd_kmvid5: TFloatField;
    sqlItemPneupmd_kmvid6: TFloatField;
    sqlItemPneupmd_kmvid7: TFloatField;
    sqlItemPneupmd_kmvid8: TFloatField;
    sqlItemPneupmd_kmvid9: TFloatField;
    sqlItemPneupmd_usuinc: TWideStringField;
    sqlItemPneupmd_datinc: TDateField;
    sqlItemPneupmd_horinc: TWideStringField;
    sqlItemPneupmd_usualt: TWideStringField;
    sqlItemPneupmd_datalt: TDateField;
    sqlItemPneupmd_horalt: TWideStringField;
    sqlItemPneutotal: TFloatField;
    cliItemPneupci_codigo: TIntegerField;
    cliItemPneupci_codpcp: TIntegerField;
    cliItemPneupci_codcst: TWideStringField;
    cliItemPneupci_codpmd: TIntegerField;
    cliItemPneupci_qtdcmp: TFloatField;
    cliItemPneupci_vlrunt: TFloatField;
    cliItemPneupci_pctdes: TFloatField;
    cliItemPneupci_vlrenc: TFloatField;
    cliItemPneupci_vlrdes: TFloatField;
    cliItemPneupci_vlrenf: TFloatField;
    cliItemPneupci_codcfo: TWideStringField;
    cliItemPneupci_pctbicm: TFloatField;
    cliItemPneupci_vlrbicm: TFloatField;
    cliItemPneupci_pctipi: TFloatField;
    cliItemPneupci_vlripi: TFloatField;
    cliItemPneupci_pctbicmst: TFloatField;
    cliItemPneupci_vlrbicmst: TFloatField;
    cliItemPneupci_usuinc: TWideStringField;
    cliItemPneupci_datinc: TDateField;
    cliItemPneupci_horinc: TWideStringField;
    cliItemPneupci_usualt: TWideStringField;
    cliItemPneupci_datalt: TDateField;
    cliItemPneupci_horalt: TWideStringField;
    cliItemPneupmd_codigo: TIntegerField;
    cliItemPneupmd_nome: TWideStringField;
    cliItemPneupmd_sucref: TWideStringField;
    cliItemPneupmd_sucnov: TWideStringField;
    cliItemPneupmd_codpds: TIntegerField;
    cliItemPneupmd_codpdm: TIntegerField;
    cliItemPneupmd_codpfb: TIntegerField;
    cliItemPneupmd_kmvid1: TFloatField;
    cliItemPneupmd_kmvid2: TFloatField;
    cliItemPneupmd_kmvid3: TFloatField;
    cliItemPneupmd_kmvid4: TFloatField;
    cliItemPneupmd_kmvid5: TFloatField;
    cliItemPneupmd_kmvid6: TFloatField;
    cliItemPneupmd_kmvid7: TFloatField;
    cliItemPneupmd_kmvid8: TFloatField;
    cliItemPneupmd_kmvid9: TFloatField;
    cliItemPneupmd_usuinc: TWideStringField;
    cliItemPneupmd_datinc: TDateField;
    cliItemPneupmd_horinc: TWideStringField;
    cliItemPneupmd_usualt: TWideStringField;
    cliItemPneupmd_datalt: TDateField;
    cliItemPneupmd_horalt: TWideStringField;
    cliItemPneutotal: TFloatField;
    sqlPneuFinpcf_codigo: TIntegerField;
    sqlPneuFinpcf_codpcp: TIntegerField;
    sqlPneuFinpcf_codcfr: TIntegerField;
    sqlPneuFinpcf_numbol: TWideStringField;
    sqlPneuFinpcf_datvnc: TDateField;
    sqlPneuFinpcf_vlrpar: TFloatField;
    sqlPneuFinpcf_usuinc: TWideStringField;
    sqlPneuFinpcf_datinc: TDateField;
    sqlPneuFinpcf_horinc: TWideStringField;
    sqlPneuFinpcf_usualt: TWideStringField;
    sqlPneuFinpcf_datalt: TDateField;
    sqlPneuFinpcf_horalt: TWideStringField;
    cliPneuFinpcf_codigo: TIntegerField;
    cliPneuFinpcf_codpcp: TIntegerField;
    cliPneuFinpcf_codcfr: TIntegerField;
    cliPneuFinpcf_numbol: TWideStringField;
    cliPneuFinpcf_datvnc: TDateField;
    cliPneuFinpcf_vlrpar: TFloatField;
    cliPneuFinpcf_usuinc: TWideStringField;
    cliPneuFinpcf_datinc: TDateField;
    cliPneuFinpcf_horinc: TWideStringField;
    cliPneuFinpcf_usualt: TWideStringField;
    cliPneuFinpcf_datalt: TDateField;
    cliPneuFinpcf_horalt: TWideStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure RefreshDialog;
    Procedure RefreshDados(tipo: String);
    procedure pcp_codigoExit(Sender: TObject);
    procedure pcp_codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pcp_codigoRightButtonClick(Sender: TObject);
    procedure ativaget;
    procedure limpaget;
    procedure ativaButoes(tipo:Integer);
    procedure FormCreate(Sender: TObject);
    procedure gravadados;
    procedure navegacao(Ord: Integer);
    procedure btnNovoExecute(Sender: TObject);
    procedure btnAlterarExecute(Sender: TObject);
    procedure btnExcluirExecute(Sender: TObject);
    procedure btnGravaExecute(Sender: TObject);
    procedure btnCancelaExecute(Sender: TObject);
    procedure btnIniExecute(Sender: TObject);
    procedure btnAntExecute(Sender: TObject);
    procedure btnProxExecute(Sender: TObject);
    procedure btnUltExecute(Sender: TObject);
    procedure btnSairExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure pcp_codfndRightButtonClick(Sender: TObject);
    procedure pcp_codfndKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pcp_codfndExit(Sender: TObject);
    procedure campositens;
    procedure edvlruntKeyPress(Sender: TObject; var Key: Char);
    procedure edvlrdesKeyPress(Sender: TObject; var Key: Char);
    procedure edvlrencKeyPress(Sender: TObject; var Key: Char);
    procedure edqtdcmpKeyPress(Sender: TObject; var Key: Char);
    procedure edpctdesKeyPress(Sender: TObject; var Key: Char);
    procedure edCodPneRightButtonClick(Sender: TObject);
    procedure edCodPneKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure Ativador;
    procedure calcule;
    procedure edqtdcmpExit(Sender: TObject);
    procedure edvlruntExit(Sender: TObject);
    procedure btninc;
    procedure edCodPneExit(Sender: TObject);
    procedure btnGravarExecute(Sender: TObject);
    procedure btnGravarUpdate(Sender: TObject);
    procedure edpctdesExit(Sender: TObject);
    procedure edvlrdesExit(Sender: TObject);
    procedure edvlrencExit(Sender: TObject);
    procedure btnIncItemClick(Sender: TObject);
    procedure RefreshGrid;
    procedure edCodCstRightButtonClick(Sender: TObject);
    procedure edCodCstKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCodCfoRightButtonClick(Sender: TObject);
    procedure edCodCfoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edpctbicmKeyPress(Sender: TObject; var Key: Char);
    procedure edpctipiKeyPress(Sender: TObject; var Key: Char);
    procedure edpctbicmstKeyPress(Sender: TObject; var Key: Char);
    procedure edVlrbicmKeyPress(Sender: TObject; var Key: Char);
    procedure edvlripiKeyPress(Sender: TObject; var Key: Char);
    procedure edvlrbicmstKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancekItemClick(Sender: TObject);
    procedure btnExcluItemClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure pcp_vlrfrtKeyPress(Sender: TObject; var Key: Char);
    procedure pcp_vlrsegKeyPress(Sender: TObject; var Key: Char);
    procedure pcp_vlrfacKeyPress(Sender: TObject; var Key: Char);
    procedure pcp_vlrfrtExit(Sender: TObject);
    procedure pcp_vlrsegExit(Sender: TObject);
    procedure pcp_vlrfacExit(Sender: TObject);
    procedure RefreshValores;
    procedure btnIncFatClick(Sender: TObject);
    procedure RefreshGridF;
    procedure edvlrparKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnExcFatClick(Sender: TObject);
    procedure btnCanFatClick(Sender: TObject);
    procedure pcp_codfpgRightButtonClick(Sender: TObject);
    procedure pcp_codfpgKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pcp_codfpgExit(Sender: TObject);
    function chkfatura: Boolean;
    procedure btnFaturarExecute(Sender: TObject);
    procedure btnImpNotraExecute(Sender: TObject);
    Function pgParcelas: String;
  private
    { Private declarations }
    wEmpresa, wUsuInc, wHorInc, wUsuAlt, wHorAlt : string ;
    wDatInc, wDatAlt : Tdate;
    nNew, nRecno:  Integer;
  public
    acampo, nRecPct: integer;
    aberto, lMostra: Boolean;
    Util: TClasseUtil;
    Pesquisa : TClasConsulta;
    sqlNew    : TFDQuery;
    cQueryPad, CodPct : String;
    aEdits : TArrayComp;
    cPre, cTabela, cSqlGridMov: String;


    { Public declarations }
  end;

var
  frmpneucmp: Tfrmpneucmp;
  modConsulta, nOrdem : integer;


implementation

uses  UCalculadora,  u_dmEmp, uSistema, U_funcao, U_CnpjClass, U_ClassconsContas;

{$R *.dfm}


procedure Tfrmpneucmp.calcule;
Var
num, pctc, pctd, Encargos  : Double;
begin
  num               :=  (  FormataNum(edvlrunt.Text) * FormataNum(edQtdcmp.Text) ) ;
  pctd              :=  FormataNum(edpctdes.Text) ;

  if pctd <> 0 then
     edvlrdes.Text  := FormatCurr('R$ #,##0.00', Pegavlrporcento(num, pctd) );

  num               := ( ( num - FormataNum(edvlrdes.Text) ) + FormataNum(edvlrenc.Text) );
  edvlrtot.Text     := FormatCurr('R$ #,###,##0.00',( num  ) );
  RefreshValores;

end;

procedure Tfrmpneucmp.campositens;
begin
  edcodpne.Clear;
  edcodcst.clear;
  edCodCfo.clear;
  ednomPne.Clear;
  ednomDim.Clear;
  NroBol.Clear;
  edQtdcmp.Text   := FormatCurr('###,###,##0',0);
  ednomDim.Text   := FormatCurr('###,##0.000',0);
  edvlrunt.Text   := FormatCurr('R$ ###,##0.00',0);
  edpctdes.Text   := FormatCurr('##0.00',0);
  edvlrdes.Text   := FormatCurr('R$ #,###,##0.00',0);
  edvlrenc.Text   := FormatCurr('R$ #,###,##0.00',0);
  edvlrtot.Text   := FormatCurr('R$ #,###,##0.00',0);
  edpctbicm.Text  := FormatCurr('##0.00',0);
  edvlrbicm.Text  := FormatCurr('R$ #,###,##0.00',0);
  edpctipi.Text   := FormatCurr('##0.00',0);
  edvlripi.Text   := FormatCurr('R$ #,###,##0.00',0);
  edpctbicmst.Text:= FormatCurr('##0.00',0);
  edvlrbicmst.Text:= FormatCurr('R$ #,###,##0.00',0);
  edvlrpar.Text   := FormatCurr('R$ #,###,##0.00',0);
  edvlrprc.Text   := FormatCurr('R$ ###,##0.00',0);
  edDatvnc.Date   := now;
end;

function Tfrmpneucmp.chkfatura: Boolean;
Var
edCfo, edCst: String;
qDel, qDel1 : TFDQuery;
Encargos : Double;
begin

  qDel            := TFDQuery.Create(Nil);
  qDel1           := TFDQuery.Create(Nil);
  // Fazendo a Exclusão de Itens relacionandos nas SubTabelas
  qDel1.Connection  := dmEmp.SqlConSis;
  qDel1.Close;
  qDel1.SQl.Text    :='Select COALESCE( sum( pcf_vlrpar ),0) as totpar FROM '+U_funcao.SelSchema('pneucmpf')+' WHERE pcf_codpcp = :codpcp ';
  qDel1.ParamByName('codpcp').Text  := fIIF( pcp_codigo.Text <> '',pcp_codigo.Text,'0') ;
  qDel1.Open;

  if  qDel1.FieldByName('totpar').Value = FormataNum( lbTotal.Caption )  then begin
      Result := True;
  end else
      Result := False;

end;

procedure Tfrmpneucmp.pcp_codfndExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlfornecedor ;
  edNomFnd.Text      :=  masc_cnpj_cpf( Pesquisa.Relacao('fornecedor',pcp_codfnd,'fnd_codigo','fnd_cpfcnpj') ) +'-'+
                         Pesquisa.Relacao('fornecedor',pcp_codfnd,'fnd_codigo','fnd_nome')    ;
  CodPct             :=  Pesquisa.Relacao('fornecedor',pcp_codfnd,'fnd_codigo','fnd_codpct')    ;

end;

procedure Tfrmpneucmp.pcp_codfndKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      pcp_codfndRightButtonClick(Self);
  end;
Finally

End;

end;

procedure Tfrmpneucmp.pcp_codfndRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsfornecedor ;
  Pesquisa.sqlTabela :=  dmEmp.sqlfornecedor ;
  Pesquisa.cliTabela :=  dmEmp.clifornecedor ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Fornecedor';
  Pesquisa.nmTabela  := 'fornecedor' ;
  Pesquisa.NovoCad   := 'fornecedor' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('fnd_codigo','Código'             ,'pcp_codfnd' ,5  ,'por Código' );
  Pesquisa.AddReg('fnd_nome'  ,'Fornecedor'         ,'edNomFnd'   ,25 ,'por pneucmp' );


  Pesquisa.acessa(pcp_codfnd);
  pcp_codfnd.text   :=  Pesquisa.RecReg('fnd_codigo');
  edNomFnd.text     :=  Pesquisa.RecReg('fnd_nome');
  Pesquisa.Destroy;

 end;

procedure Tfrmpneucmp.pcp_codfpgExit(Sender: TObject);
begin
  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlformapgm ;
  edNomFpg.Text      :=  Pesquisa.Relacao('formapgm',pcp_codfpg,'fpg_codigo','fpg_nome') ;

end;

procedure Tfrmpneucmp.pcp_codfpgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Begin
 Try
case key of
    VK_END:
      pcp_codfpgRightButtonClick(Self);
  end;
Finally

End;

end;

procedure Tfrmpneucmp.pcp_codfpgRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsformapgm ;
  Pesquisa.sqlTabela :=  dmEmp.sqlformapgm ;
  Pesquisa.cliTabela :=  dmEmp.cliformapgm ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Formas de Pagamento';
  Pesquisa.nmTabela  := 'formapgm' ;
  Pesquisa.NovoCad   := 'formapgm' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('fpg_codigo','Código'             ,'pcp_codfpg' ,5  ,'por Código' );
  Pesquisa.AddReg('fpg_nome'  ,'Forma de Pagamento' ,'edNomFpg'   ,30 ,'por Descrição' );


  Pesquisa.acessa(pcp_codfpg);
  pcp_codfpg.text   :=  Pesquisa.RecReg('fpg_codigo');
  edNomFpg.text     :=  Pesquisa.RecReg('fpg_nome');
  Pesquisa.Destroy;

 end;

procedure Tfrmpneucmp.pcp_codigoExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados

  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlpneucmp ;
  navegacao(5);


end;

procedure Tfrmpneucmp.pcp_codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END    : pcp_codigoRightButtonClick(Self);
    VK_UP     : navegacao(1);
    VK_LEFT   : navegacao(2);
    VK_RIGHT  : navegacao(3);
    VK_DOWN   : navegacao(4);

  end;
Finally

End;

end;

procedure Tfrmpneucmp.pcp_codigoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
if btnGrava.Enabled then
   Exit;

  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dspneucmp ;
  Pesquisa.sqlTabela :=  dmEmp.sqlpneucmp ;
  Pesquisa.cliTabela :=  dmEmp.clipneucmp ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Compra de Pneus';
  Pesquisa.nmTabela  := 'pneucmp';
//  Pesquisa.NovoCad   := 'caixa' ;
  // Display        campo   cabecalho                     get         tan  indices
  Pesquisa.AddReg('pcp_codigo'  ,'Nosso Cod'              ,'pcp_codigo' ,7   ,'por Código'         );
  Pesquisa.AddReg('pcp_numnfe'  ,'Nº Nota'                ,'pcp_numnfe' ,10  ,'por Nº Nota'        );
  Pesquisa.AddReg('pcp_sernfe'  ,'Série'                  ,'pcp_sernfe' ,5   ,'por Série'        );
  Pesquisa.AddReg('pcp_datems'  ,'Emissão'                ,'pcp_datems' ,10  ,'por Dt de Emissão'  );
  Pesquisa.AddReg('pcp_datent'  ,'Entrada'                ,'pcp_datent' ,10  ,'por Dt de Entrada'  );
  Pesquisa.AddReg('pcp_chelet'  ,'Chave Eletrônico'       ,'pcp_chelet' ,35  ,'por Descriminação'  );
  Pesquisa.AddReg('fnd_nome'    ,'Nome do Fornecedor'     ,'fnd_nome'   ,35  ,'por Fornecedor'     );


  Pesquisa.acessa(pcp_codigo);
  pcp_codigo.text   :=  Pesquisa.RecReg('pcp_codigo');
  Pesquisa.Destroy;

  if Pesquisa.lOk then Begin
     acampo             := 0;
     RefreshDados('S');
     btnNovo.Enabled    := False;
     btnAlterar.Enabled := True;
     ativaButoes(1);
     ativaget;
     navegacao(5);
  End;

 end;





procedure Tfrmpneucmp.pcp_vlrfacExit(Sender: TObject);
begin
calcule;
end;

procedure Tfrmpneucmp.pcp_vlrfacKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  MoedaKeyEdit( Key, pcp_vlrfac );
  Key := #0 ;
end;


procedure Tfrmpneucmp.pcp_vlrfrtExit(Sender: TObject);
begin
calcule;
end;

procedure Tfrmpneucmp.pcp_vlrfrtKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  MoedaKeyEdit( Key, pcp_vlrfrt);
  Key := #0 ;
end;

procedure Tfrmpneucmp.pcp_vlrsegExit(Sender: TObject);
begin
calcule;
end;

procedure Tfrmpneucmp.pcp_vlrsegKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  MoedaKeyEdit( Key, pcp_vlrseg );
  Key := #0 ;
end;


procedure Tfrmpneucmp.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    if gdFocused in State then  begin
      DbGrid1.Canvas.Brush.Color  := Azul_Escuro;
      DbGrid1.Canvas.Font.Color   := Branco;
      DbGrid1.Canvas.FillRect(Rect);
      DbGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
    end else begin

        if Odd(DBGrid1.DataSource.DataSet.RecNo) then begin
          DbGrid1.Canvas.Brush.Color  := Branco;
          DbGrid1.Canvas.Font.Color   := Preto;
          DbGrid1.Canvas.FillRect(Rect);
          DbGrid1.DefaultDrawDataCell(Rect, Column.Field, State);

        End else Begin
          DbGrid1.Canvas.Brush.Color  := Cinza_Sintilante;
          DbGrid1.Canvas.Font.Color   := Preto;
          DbGrid1.Canvas.FillRect(Rect);
          DbGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
        End;

    end;

end;

procedure Tfrmpneucmp.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    if gdFocused in State then  begin
      DbGrid2.Canvas.Brush.Color  := Azul_Escuro;
      DbGrid2.Canvas.Font.Color   := Branco;
      DbGrid2.Canvas.FillRect(Rect);
      DbGrid2.DefaultDrawDataCell(Rect, Column.Field, State);
    end else begin

        if Odd(DBGrid2.DataSource.DataSet.RecNo) then begin
          DbGrid2.Canvas.Brush.Color  := Branco;
          DbGrid2.Canvas.Font.Color   := Preto;
          DbGrid2.Canvas.FillRect(Rect);
          DbGrid2.DefaultDrawDataCell(Rect, Column.Field, State);

        End else Begin
          DbGrid2.Canvas.Brush.Color  := Cinza_Sintilante;
          DbGrid2.Canvas.Font.Color   := Preto;
          DbGrid2.Canvas.FillRect(Rect);
          DbGrid2.DefaultDrawDataCell(Rect, Column.Field, State);
        End;

    end;

end;

procedure Tfrmpneucmp.edcodpneExit(Sender: TObject);
Var
qDel, qDel1 : TFDQuery;
Encargos : Double;
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlpneumod ;
  edNomPne.text     :=  Pesquisa.Relacao('pneumod',edcodpne,'pds_codigo','pmd_nome') ;
  edNomDim.text     :=  Pesquisa.Relacao('pneumod',edcodpne,'pds_codigo','pdm_nome') ;
  btninc;
end;

procedure Tfrmpneucmp.edcodpneKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      edcodpneRightButtonClick(Self);
  end;
Finally

End;

end;

procedure Tfrmpneucmp.edcodpneRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dspneumod ;
  Pesquisa.sqlTabela :=  dmEmp.Sqlpneumod ;
  Pesquisa.cliTabela :=  dmEmp.clipneumod ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Modelos de Pneus';
  Pesquisa.nmTabela  := 'pneumod';
//  Pesquisa.NovoCad   := 'pneumod' ;
  // Display        campo   cabecalho                     get         tan  indices
  Pesquisa.AddReg('pmd_codigo'  ,'Código'                 ,'edcodpne' ,   5  ,'por Código'        );
  Pesquisa.AddReg('pmd_nome'    ,'Modelo'                 ,'pmd_nome'   ,30 ,'por Modelo'        );
  Pesquisa.AddReg('pds_nome'    ,'Desenho'                ,'pds_nome'   ,15 ,'por Desenho'       );
  Pesquisa.AddReg('pdm_nome'    ,'Dimensões'              ,'pdm_nome'   ,15 ,'por Dimensão'      );
  Pesquisa.acessa(edcodpne);
  edcodpne.text   :=  Pesquisa.RecReg('pmd_codigo');
  edNompne.text   :=  Pesquisa.RecReg('pmd_nome');
  edNomDim.text   :=  Pesquisa.RecReg('pdm_nome');
  Pesquisa.Destroy;

 end;

procedure Tfrmpneucmp.edCodCstKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      edcodcstRightButtonClick(Self);
  end;
Finally

End;

end;

procedure Tfrmpneucmp.edCodCstRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dscst ;
  Pesquisa.sqlTabela :=  dmEmp.sqlcst ;
  Pesquisa.cliTabela :=  dmEmp.clicst ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de CST';
  Pesquisa.nmTabela  := 'cst' ;
  Pesquisa.NovoCad   := 'cst' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('cst_codigo','Código'             ,'edCodcst' ,5  ,'por Código' );
  Pesquisa.AddReg('cst_descri','Descrição'          ,'ednomPne' ,50 ,'por Descrição' );

  Pesquisa.acessa(edCodcst);
  edCodcst.text   :=  Pesquisa.RecReg('cst_codigo');
  Pesquisa.Destroy;

 end;


procedure Tfrmpneucmp.edqtdcmpExit(Sender: TObject);
begin
calcule;
end;

procedure Tfrmpneucmp.edqtdcmpKeyPress(Sender: TObject; var Key: Char);
begin
  ChkQtd2( Sender, Key );
end;


procedure Tfrmpneucmp.edpctbicmKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  PorcentoKeyEdit( Key, edpctbicm );
  Key := #0 ;
end;

procedure Tfrmpneucmp.edpctbicmstKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  PorcentoKeyEdit( Key, edpctbicmst );
  Key := #0 ;
end;
procedure Tfrmpneucmp.edpctdesExit(Sender: TObject);
begin
calcule;
end;

procedure Tfrmpneucmp.edpctdesKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  PorcentoKeyEdit( Key, edpctdes );
  Key := #0 ;
end;

procedure Tfrmpneucmp.edpctipiKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  PorcentoKeyEdit( Key, edpctipi );
  Key := #0 ;
end;

procedure Tfrmpneucmp.edVlrbicmKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  MoedaKeyEdit( Key, edVlrbicm );
  Key := #0 ;
end;

procedure Tfrmpneucmp.edvlrbicmstKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  MoedaKeyEdit( Key, edvlrbicmst );
  Key := #0 ;
end;

procedure Tfrmpneucmp.edvlrdesExit(Sender: TObject);
begin
calcule;
end;

procedure Tfrmpneucmp.edvlrdesKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  MoedaKeyEdit( Key, edvlrdes );
  Key := #0 ;
end;

procedure Tfrmpneucmp.edvlrencExit(Sender: TObject);
begin
calcule;

end;

procedure Tfrmpneucmp.edvlrencKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  MoedaKeyEdit( Key, edvlrenc );
  Key := #0 ;
end;


procedure Tfrmpneucmp.edvlripiKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  MoedaKeyEdit( Key, edvlripi );
  Key := #0 ;
end;

procedure Tfrmpneucmp.edvlruntExit(Sender: TObject);
begin
  calcule;
  btninc
end;

procedure Tfrmpneucmp.edvlruntKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  MoedaKeyEdit( Key, edvlrunt );
  Key := #0 ;
end;


procedure Tfrmpneucmp.edvlrparKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  MoedaKeyEdit( Key, edvlrpar);
  Key := #0 ;
end;

procedure Tfrmpneucmp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sqlNew.Close;
    dmEmp.clicaixa.Close;
    frmpneucmp                     := nil ;
    action                       := cafree;
    fPrincipal.btnpneucmp.Enabled := True;
end;



procedure Tfrmpneucmp.FormCreate(Sender: TObject);
Var
i, nPar: Integer;
pcp_tipdoc: TEdit;

begin

  cPre                        := 'pcp_';
  cTabela                     := 'pneucmp';
  acampo                      := 1;
  sqlNew                      := TFDQuery.Create(nil);
  sqlNew.Connection           := dmEmp.SqlConSis;
  fPrincipal.btnpneucmp.Enabled  := False;
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;

end;

procedure Tfrmpneucmp.FormKeyPress(Sender: TObject; var Key: Char);
Begin
  //verifica se a tecla pressionada é a tecla ENTER, conhecida como #13
  If key = #13 then Begin
    //se for, passa o foco para o próximo campo, zerando o valor da variável Key
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  End Else
    If key = #27 then Begin
       if Not btnGrava.Enabled then begin
          Close;
       end else begin
          btnCancelaExecute(nil);
          key := #0;
       end;

  End Else
    If key = #37 then Begin
       navegacao(3);
  End Else
    If key = #39 then Begin
       navegacao(2);

  end;
end;
procedure Tfrmpneucmp.FormShow(Sender: TObject);
var
i, tmp: Integer;
Pesquisa : TClasConsulta;
begin

  Util:= TClasseUtil.Create;
  Pesquisa := TClasConsulta.Create;

  // Cor do banner
  Banner.ParentBackGround := False;
  Banner.ParentColor      := False;
  Banner.Brush.Color      := u_funcao.Bronze_Escuro ;

  // Titulos do Banner
  lbCabeca01.Caption    := 'Compra de Pneus';
  lbCabeca02.Caption    := u_funcao.nmSistema ;
  // Cores - Titulos do Banner
  lbCabeca01.Font.Color := u_funcao.clTit_BCad ;
  lbCabeca02.Font.Color := u_funcao.clTit_BCad ;
  RefreshDados('T');
  btnGrava.Enabled := False;
  ativaButoes(1);
  RefreshDialog;
  lMostra := True;
  ativaget;
  navegacao(1);
  btnNovo.Caption    := 'Novo'+#13 +'[F3]';
  btnAlterar.Caption := 'Editar'+#13 +'[F4]';
  btnGrava.Caption   := 'Salvar'+#13 +'[F5]';
  btnExcluir.Caption := 'Excluir'+#13 +'[Alt+Del]';
  btnCancela.Caption := 'Cancelar'+#13 +'[F12]';
  campositens;
  RefreshGrid ;
  RefreshGridF;
  campositens ;
  btninc;

end;

procedure Tfrmpneucmp.gravadados;
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, ctip_horalt,cCodSql, cIteSql,cValSql,cCodMnt : string ;
dData, dtip_datalt : TDate ;
i, tmp: Integer;
SQLQ : TFDQuery ;
begin
   gravadados2(cTabela,cPre,cPre+'codigo','X','', nNew, frmpneucmp, dmEmp.SqlConSis, aEdits );
end;

procedure Tfrmpneucmp.limpaget;
Var
i: Integer;
begin
  limpaget2(aEdits);
end;

procedure Tfrmpneucmp.navegacao(Ord: Integer);
begin
  if btnGrava.Enabled then
     Exit;

  navegacao2( Ord, acampo, btnIni, btnAnt, btnProx, btnUlt, sqlNew, dmemp.sqlpneucmp, pcp_codigo,'' );
  acampo := 0;
  RefreshDialog2(cPre,acampo, frmpneucmp, sqlNew, aEdits);
  acampo := 1;
  RefreshGrid ;
  RefreshGridf ;
  btninc;


end;

function Tfrmpneucmp.pgParcelas: String;
Var
  qDel: TFDQuery;
begin
   qDel             := TFDQuery.Create(Nil);
   qDel.Connection  := dmEmp.SqlConSis;
   qDel.Close;
   qDel.SQl.Text    :='Select count(*) as Parc From '+U_funcao.SelSchema('pneucmpf')+' WHERE pcf_codpcp = :codpcp ';
   qDel.ParamByName('codpcp').Text       := pcp_codigo.Text;
   qDel.Open;
   Result           := qDel.FieldByName('Parc').Text;
end;






procedure Tfrmpneucmp.RefreshDados(tipo: String);
var
  i: integer;
  cWhere, cQuery, cOrder: String;

begin
  RefreshDados2(acampo, tipo,'',  pcp_codigo, sqlNew, dmEmp.sqlpneucmp );
  RefreshGrid;
end;

procedure Tfrmpneucmp.RefreshDialog;
var
  i, tmp: Integer;
  frmx : TForm ;
begin
  RefreshDialog2(cPre,acampo, frmpneucmp, sqlNew, aEdits);
end;

procedure Tfrmpneucmp.ToolButton9Click(Sender: TObject);
begin
  frmCalculadora := TfrmCalculadora.Create(Self);
  frmCalculadora.Show;

end;

procedure Tfrmpneucmp.ativaButoes(tipo:Integer);
begin
  ativaButoes2(Tipo,  btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt, sqlNew);
  Ativador;
end;

procedure Tfrmpneucmp.Ativador;
begin
 GrbItens.Enabled   := btnGrava.Enabled;
 GrbFatura.Enabled  := btnGrava.Enabled;     // btnFaturar
 btnFaturar.Enabled := ( btnGrava.Enabled  and ( Not sqlNew.FieldByName('pcp_fatura').AsBoolean ) ) ;
 btnImpNotra.Enabled:= ( btnGrava.Enabled   and ( sqlNew.FieldByName('pcp_fatura').AsBoolean ) );
end;

procedure Tfrmpneucmp.ativaget;
begin
  ativaget2(aEdits,cPre+'codigo',cTabela, btnGrava.Enabled, lMostra );
  RefreshGrid ;
end;


procedure Tfrmpneucmp.btnAlterarExecute(Sender: TObject);
begin
   btnNovo.Enabled    := False;
   btnAlterar.Enabled := False;
   btnGrava.Enabled   := True;
   acampo := 0;
   nNew   := acampo;
   ativaButoes(1);
   lMostra := True;
   ativaget;
   RefreshDialog;
   navegacao(0);
   btninc;
   if grbCabec.Enabled then
      pcp_datems.SetFocus;


end;

procedure Tfrmpneucmp.btnAntExecute(Sender: TObject);
begin
  navegacao(2);
end;

procedure Tfrmpneucmp.btnCancekItemClick(Sender: TObject);
begin
{ Cancelamento}
  if MESSAGEBOX(Application.Handle, 'Deseja Cancelar este item?', 'Confirma...', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin
     RefreshGrid ;
     campositens ;
     btninc;
     edCodPne.SetFocus;
  end;
end;

procedure Tfrmpneucmp.btnCancelaExecute(Sender: TObject);
begin
   RollBack;
   acampo := 1;
   nNew             := acampo;
   btnNovo.Enabled  := True;
   btnGrava.Enabled := False;
   RefreshDados('T');
   ativaButoes(1);
   lMostra := True;
   ativaget;
   navegacao(4);

   pcp_codigo.SetFocus;
   btninc;

end;

procedure Tfrmpneucmp.btnCanFatClick(Sender: TObject);
Var
  qDel : TFDQuery;
begin

{ Cancelamento}
  if LowerCase( btnCanFat.Caption ) = 'modificar' then begin
      nRecPct := DBGrid2.DataSource.DataSet.FieldByName('pcf_codigo').AsInteger;
      if MESSAGEBOX(Application.Handle, 'Deseja Modificar a parcela item?', 'Confirma...', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin
         btnCanFat.Caption    := 'Gravar';
         btnCanFat.ImageIndex :=  1185 ;
         btninc;
         NroBol.Text    := DBGrid2.DataSource.DataSet.FieldByName('pcf_numbol').Text;
         edDatvnc.Date  := DBGrid2.DataSource.DataSet.FieldByName('pcf_datvnc').AsDateTime;
         edvlrpar.Text  := FormatCurr('R$ ###,##0.00', DBGrid2.DataSource.DataSet.FieldByName('pcf_vlrpar').AsFloat );
         NroBol.SetFocus;
      end;

  end Else begin
     if MESSAGEBOX(Application.Handle, 'Deseja Modificar a parcela item?', 'Confirma...', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin


            //Atualiza valores
            IniTransacao;
            qDel            := TFDQuery.Create(Nil);
            qDel.Connection  := dmEmp.SqlConSis;
            qDel.Close;
            qDel.SQl.Text    :='UPDATE '+U_funcao.SelSchema('pneucmpf')+' Set pcf_numbol = :pcf_numbol, pcf_datvnc = :pcf_datvnc, pcf_vlrpar = :pcf_vlrpar, '+
                             '  pcf_usualt = :pcf_usualt, pcf_datalt = :pcf_datalt, pcf_horalt = :pcf_horalt '+
                             ' WHERE  pcf_codigo = :pcf_codigo ';
            qDel.ParamByName('pcf_numbol').Text       := NroBol.Text;
            qDel.ParamByName('pcf_datvnc').AsDate     := edDatvnc.Date;
            qDel.ParamByName('pcf_vlrpar').AsFloat    := FormataNum( edvlrpar.Text );
            qDel.ParamByName('pcf_usualt').Text       :=  sysUsuario ;
            qDel.ParamByName('pcf_datalt').AsDate     := now ;
            qDel.ParamByName('pcf_horalt').Text       := TimeToStr(time) ;
            qDel.ParamByName('pcf_codigo').AsInteger  := nRecPct;
            qDel.ExecSQL;

         btnCanFat.Caption    := 'Modificar';
         btnCanFat.ImageIndex :=  1092 ;
         NroBol.Clear;
         edDatvnc.Date  := now;
         edvlrpar.Text  := FormatCurr('R$ ###,##0.00', 0 );

         nRecPct := 0 ;
         RefreshGridf ;
         campositens ;
         btninc;

     end;

  end;
end;

procedure Tfrmpneucmp.btnExcFatClick(Sender: TObject);
Var
  qDel : TFDQuery;

begin
{ Exclusão }
  if MESSAGEBOX(Application.Handle, 'Deseja Excluir este item?', 'Confirma...', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin
    IniTransacao;
    qDel            := TFDQuery.Create(Nil);
    // Fazendo a Exclusão de Itens relacionandos nas SubTabelas
    qDel.Connection  := dmEmp.SqlConSis;
    qDel.Close;
    qDel.SQl.Text    :='DELETE FROM   '+U_funcao.SelSchema('pneucmpf')+' WHERE pcf_codpcp = :codpcp and pcf_codigo = :codccf';
    qDel.ParamByName('codpcp').Text  :=  pcp_codigo.Text ;
    qDel.ParamByName('codccf').Text  :=  DBGrid2.DataSource.DataSet.FieldByName('pcf_codigo').Text ;
    qDel.ExecSQL;
    RefreshGridf ;
    campositens ;
    btninc;
    DBGrid2.SetFocus;

  end;

end;

procedure Tfrmpneucmp.btnExcluirExecute(Sender: TObject);
Var
  aSubTab : TArrayDim2;
  n: Integer;
  qDel : TFDQuery;
begin
   SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'pneucmpi';     aSubTab[n][1] := 'pci_codpcp';
   If Exclui2(cTabela, aSubTab,  pcp_codigo, btnExcluir) Then Begin;

        RefreshDados('T');
        ativaButoes(1);
        limpaget;
        lMostra := True;
        ativaget;
        navegacao(4);
        acampo := 1;
        nNew   := acampo;
   End;
   btninc;
end;

procedure Tfrmpneucmp.btnExcluItemClick(Sender: TObject);
Var
  qDel : TFDQuery;

begin
{ Exclusão }
  if MESSAGEBOX(Application.Handle, 'Deseja Excluir este item?', 'Confirma...', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin
    IniTransacao;
    qDel            := TFDQuery.Create(Nil);
    // Fazendo a Exclusão de Itens relacionandos nas SubTabelas
    qDel.Connection  := dmEmp.SqlConSis;
    qDel.Close;
    qDel.SQl.Text    :='DELETE FROM   '+U_funcao.SelSchema('pneucmpi')+' WHERE pci_codpcp = :codpcp and pci_codigo = :codcci';
    qDel.ParamByName('codpcp').Text  :=  pcp_codigo.Text ;
    qDel.ParamByName('codcci').Text  :=  DBGrid1.DataSource.DataSet.FieldByName('pci_codigo').Text ;
    qDel.ExecSQL;


    RefreshGrid ;
    campositens ;
    btninc;
    edCodPne.SetFocus;
  end;

end;

procedure Tfrmpneucmp.btnFaturarExecute(Sender: TObject);
Var
  qDel, qDel1, qDel2, qSql1 : TFDQuery;
  cTipLan, cTipPro, cNumPar, cNumAnt, cDescri, mrFogo : String;
  i: Integer;

begin
{ Cancelamento}
  if MESSAGEBOX(Application.Handle, 'Deseja Faturar essa nota?', 'Confirma...', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin
      IniTransacao;
      qDel            := TFDQuery.Create(Nil);
      qDel1           := TFDQuery.Create(Nil);
      qDel2           := TFDQuery.Create(Nil);
      qSql1           := TFDQuery.Create(Nil);

      cDescri         := 'REF. COMPRA DE PNEUS';
      // Gerando Estoque
      qDel.Connection  := dmEmp.SqlConSis;
      qDel.Close;
      qDel.SQl.Text    :='Select * From '+U_funcao.SelSchema('pneucmpi')+' WHERE pci_codpcp = :codpcp ';
      qDel.ParamByName('codpcp').Text       := pcp_codigo.Text;
      qDel.Open;
      qDel.First;
      while Not qDel.Eof do begin

            for I := 1 to qDel.FieldByName('pci_qtdcmp').AsInteger do begin
                mrFogo := pgMarcaFogo ;
                // Gerando a Movimentação do Estoque
                qDel1.Connection  := dmEmp.SqlConSis;
                qDel1.Close;
                qDel1.SQl.Text   :='insert into '+U_funcao.SelSchema('pneuive')
                                                +' ( piv_numser, piv_numnfe, piv_vlrCto, piv_mfogo, '
                                                  +' piv_numdot, piv_codpmd, piv_codpds, piv_mlmsc1, '
                                                  +' piv_mlmsc2, piv_mlmsc3, piv_mlmsc4, piv_mlmsc5, piv_mlmsc6, '
                                                  +' piv_kmvda1, piv_kmvda2, piv_kmvda3, piv_kmvda4, piv_kmvda5, '
                                                  +' piv_kmvda6, piv_kmvda7, piv_kmvda8, piv_kmvda9, piv_status, '
                                                  +' piv_DatCmp, piv_locpne, piv_nrvida, piv_UsuInc, piv_DatInc, piv_HorInc ) values  '
                                                +' ( :piv_numser, :piv_numnfe, :piv_vlrCto, :piv_mfogo, '
                                                  +' :piv_numdot, :piv_codpmd, :piv_codpds, :piv_mlmsc1,'
                                                  +' :piv_mlmsc2, :piv_mlmsc3, :piv_mlmsc4, :piv_mlmsc5, :piv_mlmsc6, '
                                                  +' :piv_kmvda1, :piv_kmvda2, :piv_kmvda3, :piv_kmvda4, :piv_kmvda5, '
                                                  +' :piv_kmvda6, :piv_kmvda7, :piv_kmvda8, :piv_kmvda9, :piv_status, '
                                                  +' :piv_DatCmp, :piv_locpne, :piv_nrvida, :piv_UsuInc, :piv_DatInc, :piv_HorInc  )';

                qDel1.ParamByName('piv_numser').Text    := pcp_sernfe.Text ;
                qDel1.ParamByName('piv_numnfe').Text    := pcp_numnfe.Text ;
                qDel1.ParamByName('piv_vlrCto').AsFloat := qDel.FieldByName('pci_vlrunt').AsFloat ;
                qDel1.ParamByName('piv_mfogo').Text     := mrFogo ;
                qDel1.ParamByName('piv_numdot').Text    := '' ;
                qDel1.ParamByName('piv_codpmd').Text    := qDel.FieldByName('pci_codpmd').Text;

                  // Pega dados do modelo
                  qDel2.Connection  := dmEmp.SqlConSis;
                  qDel2.Close;
                  qDel2.SQl.Text    :='Select * From '+U_funcao.SelSchema('pneumod')
                                      +' LEFT JOIN '+U_funcao.SelSchema('pneudes')+' on pds_codigo = pmd_codpds '
                                      +' LEFT JOIN '+U_funcao.SelSchema('pneudim')+' on pdm_codigo = pmd_codpdm '
                                      +' LEFT JOIN '+U_funcao.SelSchema('pneufab')+' on pfb_codigo = pmd_codpfb '
                                      +' WHERE pmd_codigo = :codpmd ';
                  qDel2.ParamByName('codpmd').Text       := qDel.FieldByName('pci_codpmd').Text;
                  qDel2.Open;

                qDel1.ParamByName('piv_codpds').Text    := qDel2.FieldByName('pmd_codpds').Text;
                qDel1.ParamByName('piv_mlmsc1').Text    := fIIF( StrToInt( qDel2.FieldByName('pds_sucos').Text ) >= 1,qDel2.FieldByName('pmd_sucnov').Text,'0');
                qDel1.ParamByName('piv_mlmsc2').Text    := fIIF( StrToInt( qDel2.FieldByName('pds_sucos').Text ) >= 2,qDel2.FieldByName('pmd_sucnov').Text,'0');
                qDel1.ParamByName('piv_mlmsc3').Text    := fIIF( StrToInt( qDel2.FieldByName('pds_sucos').Text ) >= 3,qDel2.FieldByName('pmd_sucnov').Text,'0');
                qDel1.ParamByName('piv_mlmsc4').Text    := fIIF( StrToInt( qDel2.FieldByName('pds_sucos').Text ) >= 4,qDel2.FieldByName('pmd_sucnov').Text,'0');
                qDel1.ParamByName('piv_mlmsc5').Text    := fIIF( StrToInt( qDel2.FieldByName('pds_sucos').Text ) >= 5,qDel2.FieldByName('pmd_sucnov').Text,'0');
                qDel1.ParamByName('piv_mlmsc6').Text    := fIIF( StrToInt( qDel2.FieldByName('pds_sucos').Text ) >= 6,qDel2.FieldByName('pmd_sucnov').Text,'0');
                qDel1.ParamByName('piv_kmvda1').Text    := '0';
                qDel1.ParamByName('piv_kmvda2').Text    := '0';
                qDel1.ParamByName('piv_kmvda3').Text    := '0';
                qDel1.ParamByName('piv_kmvda4').Text    := '0';
                qDel1.ParamByName('piv_kmvda5').Text    := '0';
                qDel1.ParamByName('piv_kmvda6').Text    := '0';
                qDel1.ParamByName('piv_kmvda7').Text    := '0';
                qDel1.ParamByName('piv_kmvda8').Text    := '0';
                qDel1.ParamByName('piv_kmvda9').Text    := '0';
                qDel1.ParamByName('piv_status').Text    := 'ESTOQUE';
                qDel1.ParamByName('piv_nrvida').Text    := '1';
                qDel1.ParamByName('piv_DatCmp').AsDate  := pcp_datent.Date;
                qDel1.ParamByName('piv_locpne').Text    := '';
                qDel1.ParamByName('piv_UsuInc').Text    :=  sysUsuario ;
                qDel1.ParamByName('piv_DatInc').AsDate  := now ;
                qDel1.ParamByName('piv_HorInc').Text    := TimeToStr(time) ;
                qDel1.ExecSQL;

                // Pega o codigo salvo do Pneu
                cNumAnt  := PegaUltCodSalvo( 'pneuive', 'piv_codigo', 'piv_' );

                // Grava a Movimentação da Compra
                qDel1.Connection  := dmEmp.SqlConSis;
                qDel1.Close;
                qDel1.SQl.Text   :='insert into '+U_funcao.SelSchema('pneumnt')
                                                +' ( pmt_codpiv, pmt_DatEve, pmt_HorEve, pmt_mfogo,    pmt_evento, ' //{pmt_codplc,
                                                +'   pmt_objeto, pmt_posic,  pmt_vlrcst,  pmt_kmrodiz, pmt_kmatual,  '
                                                +'   pmt_libras, pmt_mlmsc1, pmt_mlmsc2,  pmt_mlmsc3,  pmt_mlmsc4,    '
                                                +'   pmt_mlmsc5, pmt_mlmsc6, pmt_mrvida,  pmt_kmvida,  pmt_codfnd,    '
                                                +'   pmt_UsuInc, pmt_DatInc, pmt_HorInc ) values '
                                                +' ( :pmt_codpiv, :pmt_DatEve, :pmt_HorEve, :pmt_mfogo,   :pmt_evento, ' // :pmt_codplc,
                                                +'   :pmt_objeto, :pmt_posic,  :pmt_vlrcst, :pmt_kmrodiz, :pmt_kmatual,  '
                                                +'   :pmt_libras, :pmt_mlmsc1, :pmt_mlmsc2, :pmt_mlmsc3,  :pmt_mlmsc4,   '
                                                +'   :pmt_mlmsc5, :pmt_mlmsc6, :pmt_mrvida, :pmt_kmvida,  :pmt_codfnd,   '
                                                +'   :pmt_UsuInc, :pmt_DatInc, :pmt_HorInc ) ';
                qDel1.ParamByName('pmt_codpiv').Text    := cNumAnt;
                qDel1.ParamByName('pmt_DatEve').AsDate  := now ;
                qDel1.ParamByName('pmt_HorEve').Text    := TimeToStr(time) ;
                qDel1.ParamByName('pmt_mfogo').Text     := mrFogo  ;
                //qDel1.ParamByName('pmt_codplc').Text    := '''NULL'''  ;
                qDel1.ParamByName('pmt_evento').Text    := 'COMPRA';
                qDel1.ParamByName('pmt_objeto').Text    := '-';
                qDel1.ParamByName('pmt_posic').Text     := ''  ;
                qDel1.ParamByName('pmt_vlrcst').AsFloat := qDel.FieldByName('pci_vlrunt').AsFloat ;
                qDel1.ParamByName('pmt_kmrodiz').Text   := '0';
                qDel1.ParamByName('pmt_kmatual').Text   := '0';
                qDel1.ParamByName('pmt_libras').Text    := '0';
                qDel1.ParamByName('pmt_mlmsc1').Text    := fIIF( StrToInt( qDel2.FieldByName('pds_sucos').Text ) >= 1,qDel2.FieldByName('pmd_sucnov').Text,'0');
                qDel1.ParamByName('pmt_mlmsc2').Text    := fIIF( StrToInt( qDel2.FieldByName('pds_sucos').Text ) >= 2,qDel2.FieldByName('pmd_sucnov').Text,'0');
                qDel1.ParamByName('pmt_mlmsc3').Text    := fIIF( StrToInt( qDel2.FieldByName('pds_sucos').Text ) >= 3,qDel2.FieldByName('pmd_sucnov').Text,'0');
                qDel1.ParamByName('pmt_mlmsc4').Text    := fIIF( StrToInt( qDel2.FieldByName('pds_sucos').Text ) >= 4,qDel2.FieldByName('pmd_sucnov').Text,'0');
                qDel1.ParamByName('pmt_mlmsc5').Text    := fIIF( StrToInt( qDel2.FieldByName('pds_sucos').Text ) >= 5,qDel2.FieldByName('pmd_sucnov').Text,'0');
                qDel1.ParamByName('pmt_mlmsc6').Text    := fIIF( StrToInt( qDel2.FieldByName('pds_sucos').Text ) >= 6,qDel2.FieldByName('pmd_sucnov').Text,'0');
                qDel1.ParamByName('pmt_mrvida').Text    := '1';
                qDel1.ParamByName('pmt_kmvida').Text    := qDel2.FieldByName('pmd_kmvid1').Text;
                qDel1.ParamByName('pmt_codfnd').Text    := pcp_codfnd.Text ;
                qDel1.ParamByName('pmt_UsuInc').Text    :=  sysUsuario ;
                qDel1.ParamByName('pmt_DatInc').AsDate  := now ;
                qDel1.ParamByName('pmt_HorInc').Text    := TimeToStr(time) ;
                qDel1.ExecSQL;

            end;
          qDel.Next
      end;

      // Gerando contas a Pagar  - Cabeçalho
      qSql1.Connection := dmEmp.SqlConSis;
      qSql1.Close;
      qSql1.SQL.Text   := 'Insert Into '+U_funcao.SelSchema('financecab')+
                                      '( cfr_NumDoc, cfr_codant, cfr_codfnd, cfr_codpct, '+
                                      '  cfr_descri, cfr_DatEms, cfr_DatVen, cfr_TotPar, cfr_TipDoc,  '+
                                      '  cfr_vlrApg, cfr_vlrDes, cfr_vlrAcr, cfr_vlrTot, cfr_UsuInc, cfr_DatInc, cfr_HorInc ) Values  '+
                                     '( :cfr_NumDoc, :cfr_codant, :cfr_codfnd, :cfr_codpct, '+
                                      ' :cfr_descri, :cfr_DatEms, :cfr_DatVen, :cfr_TotPar, :cfr_TipDoc,  '+
                                      ' :cfr_vlrApg, :cfr_vlrDes, :cfr_vlrAcr, :cfr_vlrTot, :cfr_UsuInc, :cfr_DatInc, :cfr_HorInc ) ';
      qSql1.ParamByName('cfr_NumDoc').Text     := pcp_numnfe.Text ;
      qSql1.ParamByName('cfr_codant').Text     := pcp_codigo.Text ;
      qSql1.ParamByName('cfr_codfnd').Text     := pcp_codfnd.Text ;
      qSql1.ParamByName('cfr_codpct').Text     := CodPct ;
      qSql1.ParamByName('cfr_descri').Text     := cDescri ;
      qSql1.ParamByName('cfr_DatEms').AsDate   := pcp_DatEms.Date ;
      qSql1.ParamByName('cfr_DatVen').AsDate   := pcp_DatEms.Date ;
      qSql1.ParamByName('cfr_TotPar').Text     := pgParcelas;
      qSql1.ParamByName('cfr_TipDoc').Text     := 'D';
      qSql1.ParamByName('cfr_vlrApg').Text     := RmCharValor( lbTotal.Caption );
      qSql1.ParamByName('cfr_vlrDes').Text     := RmCharValor( lbTotaldesc.Caption );
      qSql1.ParamByName('cfr_vlrAcr').Text     := RmCharValor( lbVlrFrete.Caption );;
      qSql1.ParamByName('cfr_vlrTot').Text     := RmCharValor( lbVlrFat.Caption );
      qSql1.ParamByName('cfr_UsuInc').Text     :=  sysUsuario;
      qSql1.ParamByName('cfr_DatInc').AsDate   := Now;
      qSql1.ParamByName('cfr_HorInc').Text     := TimeToStr(Now);
      qSql1.ExecSQL;
      cNumAnt  := PegaUltCodSalvo( 'financecab', 'cfr_codigo', 'cfr_' );


      qDel.Connection  := dmEmp.SqlConSis;
      qDel.Close;
      qDel.SQl.Text    :='Select * From '+U_funcao.SelSchema('pneucmpf')+' WHERE pcf_codpcp = :codpcp ';
      qDel.ParamByName('codpcp').Text       := pcp_codigo.Text;
      qDel.Open;
      qDel.First;
      i  := 0;
      while Not qDel.Eof do begin
            // Grava as parcelas
            i        := (i+1);
            cTipLan  := 'LAN';
            cTipPro  := 'CXA';
            qSql1.Connection := dmEmp.SqlConSis;
            qSql1.Close;
            qSql1.SQL.Text   := 'Insert Into '+U_funcao.SelSchema('financeiro')+
                                            '( fcr_descri,  fcr_DatVen,  fcr_NumPar,  fcr_Status,  fcr_tippro,  fcr_codcfr, '+
                                            '  fcr_vlrApg,  fcr_NumBol,  fcr_UsuInc,  fcr_DatInc,  fcr_HorInc ) Values  '+
                                           '( :fcr_descri, :fcr_DatVen, :fcr_NumPar, :fcr_Status, :fcr_tippro, :fcr_codcfr, '+
                                            ' :fcr_vlrApg, :fcr_NumBol,  :fcr_UsuInc, :fcr_DatInc, :fcr_HorInc ) ';
            qSql1.ParamByName('fcr_descri').Text     := '[Pc '+Trim(IntToStr(i))+'/'+Trim(IntToStr(qDel.RecordCount))+'] '+cDescri ;
            qSql1.ParamByName('fcr_DatVen').AsDate   := qDel.FieldByName('pcf_datvnc').AsDateTime;
            qSql1.ParamByName('fcr_NumPar').Text     := IntToStr(i);
            qSql1.ParamByName('fcr_Status').Text     := cTipPro;
            qSql1.ParamByName('fcr_tippro').Text     := cTipLan;
            qSql1.ParamByName('fcr_codcfr').Text     := cNumAnt;
            qSql1.ParamByName('fcr_vlrApg').AsFloat  := qDel.FieldByName('pcf_vlrpar').AsFloat ;
            qSql1.ParamByName('fcr_NumBol').Text     := qDel.FieldByName('pcf_numbol').Text    ;
            qSql1.ParamByName('fcr_UsuInc').Text     :=  sysUsuario;
            qSql1.ParamByName('fcr_DatInc').AsDate   := Now;
            qSql1.ParamByName('fcr_HorInc').Text     := TimeToStr(Now);
            qSql1.ExecSQL;


          // Gerando a Movimentação do Estoque
          qDel.Next
      end;



      // Fechadndo a fatura
      qDel.Connection  := dmEmp.SqlConSis;
      qDel.Close;
      qDel.SQl.Text    :='UPDATE '+U_funcao.SelSchema('pneucmp')+' '+
                         ' Set pcp_fatura = :fatura, pcp_usualt = :pcp_usualt, pcp_datalt = :pcp_datalt, pcp_horalt = :pcp_horalt '+
                         ' WHERE pcp_codigo = :codpcp ';
      qDel.ParamByName('codpcp').Text       := pcp_codigo.Text;
      qDel.ParamByName('fatura').AsBoolean  := True;
      qDel.ParamByName('pcp_usualt').Text   :=  sysUsuario ;
      qDel.ParamByName('pcp_datalt').AsDate := now ;
      qDel.ParamByName('pcp_horalt').Text   := TimeToStr(time) ;
      qDel.ExecSQl;
      btnFaturar.Enabled := False;
      btnGravaExecute(Self);

  end;

end;

procedure Tfrmpneucmp.btnGravaExecute(Sender: TObject);
begin
   gravadados;
   if FechaSubFrm(cTabela) then Close;

   acampo := 1;
   nNew   := acampo;
   btnNovo.Enabled := True;
   btnGrava.Enabled:= False;
   RefreshDados('T');
   ativaButoes(0);
   Case lMostra of
      False  : navegacao(4);
      True   : navegacao(5);
   end;
   lMostra := False;
   ativaget;

   if grbCabec.Enabled then
      pcp_codigo.SetFocus;

   btninc;

end;

procedure Tfrmpneucmp.btnGravarExecute(Sender: TObject);
begin
 ShowMessage('teste');
end;

procedure Tfrmpneucmp.btnGravarUpdate(Sender: TObject);
begin
  btninc;
end;

procedure Tfrmpneucmp.btnImpNotraExecute(Sender: TObject);
begin
  ImpNota.LoadFromFile(cPathExe+'reports\'+'nfpneucmp.fr3');
  ImpNota.ShowReport();
  {
  if nTipo = 3 then Begin
     ImpNota.DesignReport();
  End Else
  if nTipo = 1 then Begin
     ImpNota.ShowReport();
  End Else
  if nTipo = 2 then Begin
     ImpNota.PrepareReport;
     ImpNota.Print;
  End;
   }
end;

procedure Tfrmpneucmp.btninc;
begin
  btnIncItem.Enabled    := ( edCodPne.Text <> '' )  ;
  btnExcluItem.Enabled  := (  Not btnIncItem.Enabled  and ( sqlItemPneu.RecordCount > 0 ) and  btnGrava.Enabled ) ;
  btnCancekItem.Enabled := ( ( edCodPne.Text <> '' )  and ( Not btnIncItem.Enabled ) ) ;
  btnIncFat.Enabled     := ( ( DBGrid1.DataSource.DataSet.RecordCount > 0 ) and DBGrid2.DataSource.DataSet.Eof and ( Not sqlNew.FieldByName('pcp_fatura').AsBoolean ) ) ;
  btnCanFat.Enabled     := ( ( DBGrid1.DataSource.DataSet.RecordCount > 0 ) and ( Not sqlNew.FieldByName('pcp_fatura').AsBoolean ) );
  btnExcFat.Enabled     := ( ( Not DBGrid2.DataSource.DataSet.Eof ) and
                             ( DBGrid1.DataSource.DataSet.RecordCount > 0 ) and
                             ( LowerCase( btnCanFat.Caption ) = 'modificar' ) and
                             ( Not sqlNew.FieldByName('pcp_fatura').AsBoolean ));

   NroBol.Enabled     := ( LowerCase( btnCanFat.Caption ) <> 'modificar' ) ;
   edDatvnc.Enabled   := ( LowerCase( btnCanFat.Caption ) <> 'modificar' ) ;
   edvlrpar.Enabled   := ( LowerCase( btnCanFat.Caption ) <> 'modificar' ) ;
   pcp_codfpg.Enabled := ( Not sqlNew.FieldByName('pcp_fatura').AsBoolean ) ;
   pcp_qtdpct.Enabled := ( Not sqlNew.FieldByName('pcp_fatura').AsBoolean ) ;

   grbTaxas.Enabled := (( Not sqlNew.FieldByName('pcp_fatura').AsBoolean ) OR (nNew = 1) );
   GrbItens.Enabled := (( Not sqlNew.FieldByName('pcp_fatura').AsBoolean ) OR (nNew = 1) );
   grbCabec.Enabled := (( Not sqlNew.FieldByName('pcp_fatura').AsBoolean ) OR (nNew = 1) );

end;

procedure Tfrmpneucmp.btnIncFatClick(Sender: TObject);
Var
edCfo, edCst: String;
qDel, qDel1 : TFDQuery;
Encargos : Double;
i: integer;
begin

  qDel            := TFDQuery.Create(Nil);
  qDel1           := TFDQuery.Create(Nil);
  // Fazendo a Exclusão de Itens relacionandos nas SubTabelas
  qDel1.Connection  := dmEmp.SqlConSis;
  qDel1.Close;
  qDel1.SQl.Text    :='Select COALESCE( sum( pcf_vlrpar ),0) as totpar FROM '+U_funcao.SelSchema('pneucmpf')+' WHERE pcf_codpcp = :codpcp ';
  qDel1.ParamByName('codpcp').Text  := fIIF( pcp_codigo.Text <> '',pcp_codigo.Text,'0') ;
  qDel1.Open;

  if  (  qDel1.FieldByName('totpar').Value + FormataNum( edvlrpar.Text ) )  >   FormataNum( lbTotal.Caption )   then begin
      ShowMessage('A soma do(s) valo(res) faturado(s) é superior ao da Nota '+#13+'Não é possível incluir este valor '+#13+#13+'Necesário correção! ');

      edvlrpar.SetFocus;
  end else begin
      IniTransacao;
      qDel            := TFDQuery.Create(Nil);
      // Fazendo a Exclusão de Itens relacionandos nas SubTabelas
      qDel.Connection  := dmEmp.SqlConSis;
      For i := 1 to StrToInt(pcp_qtdpct.Text) do begin
          qDel.Close;
          qDel.SQl.Text   :='insert into '+U_funcao.SelSchema('pneucmpf')+' ( pcf_codpcp,   pcf_NumBol, pcf_datvnc,  pcf_vlrpar,  pcf_usuinc,  pcf_datinc,  pcf_horinc ) values  '+
                                                                            ' ( :pcf_codpcp, :pcf_NumBol, :pcf_datvnc, :pcf_vlrpar, :pcf_usuinc, :pcf_datinc, :pcf_horinc )  ';
          qDel.ParamByName('pcf_codpcp').Text     := pcp_codigo.Text;
          qDel.ParamByName('pcf_NumBol').Text     := StrZero( StrToInt(pcp_codigo.Text),10 )+FormatDateTime('yyyymmdd',now)+StrZero( PgQtdPrcFatura( pcp_codigo.Text ) ,27 );
          qDel.ParamByName('pcf_datvnc').AsDate   := IncMonth(now,i);   //;edDatvnc.Date  ;
          qDel.ParamByName('pcf_vlrpar').Text     := RmCharValor( edVlrPrc.Text ) ;
          qDel.ParamByName('pcf_usuinc').Text     :=  sysUsuario ;
          qDel.ParamByName('pcf_datinc').AsDate   := now ;
          qDel.ParamByName('pcf_horinc').Text     := TimeToStr(time) ;
          qDel.ExecSQL;
          RefreshGridf ;
      end;
      campositens ;
      btninc;
      DBGrid2.SetFocus;
  end;


end;


procedure Tfrmpneucmp.btnIncItemClick(Sender: TObject);
Var
edCfo, edCst: String;
begin

 if nNew > 0 then begin
    pcp_codfpg.Text := PgFormaPgAtu;
    nNew := GravarSub(cTabela,cPre,cPre+'codigo','X','', nNew, aCampo, frmpneucmp, dmEmp.SqlConSis, aEdits, sqlNew, dmEmp.sqlpneucmp, pcp_codigo );
 End;

{ Rotina para guardar as informações}
 cliItemPneu.Close;
 SqlItemPneu.Close;
 with SqlItemPneu do
   begin
     Close;
     SQL.Text :='insert into '+U_funcao.SelSchema('pneucmpi')+' ( pci_codpcp, pci_codcst, pci_codpmd, pci_qtdcmp, '+
                                                                  ' pci_vlrunt, pci_pctdes, pci_vlrenc, pci_vlrdes, pci_vlrenf, '+
                                                                  ' pci_pctbicm,pci_vlrbicm, pci_pctipi, pci_vlripi, pci_pctbicmst, pci_vlrbicmst, '+
                                                                  ' pci_codcfo, pci_usuinc, pci_datinc, pci_horinc ) values     '+
                                                                ' ( :pci_codpcp, :pci_codcst, :pci_codpmd, :pci_qtdcmp, '+
                                                                  ' :pci_vlrunt, :pci_pctdes, :pci_vlrenc, :pci_vlrdes, :pci_vlrenf, '+
                                                                  ' :pci_pctbicm, :pci_vlrbicm, :pci_pctipi, :pci_vlripi, :pci_pctbicmst, :pci_vlrbicmst, '+
                                                                  ' :pci_codcfo, :pci_usuinc, :pci_datinc, :pci_horinc )  ';


     edCfo   := fIIF( edCodCfo.Text <> '', edCodCfo.Text, 'NULL' );
     edCst   := fIIF( edCodCst.Text <> '', edCodCst.Text, 'NULL' );

     ParamByName('pci_codpcp').Text       := pcp_codigo.Text ;
     ParamByName('pci_codpmd').Text       := edcodpne.Text ;
     ParamByName('pci_qtdcmp').AsFloat    := FormataNum( edqtdcmp.Text ) ;
     ParamByName('pci_vlrunt').AsFloat    := FormataNum( edvlrunt.Text ) ;
     ParamByName('pci_pctdes').AsFloat    := FormataNum( edvlrunt.Text ) ;
     ParamByName('pci_vlrenc').AsFloat    := FormataNum( edvlrenc.Text ) ;
     ParamByName('pci_vlrdes').AsFloat    := FormataNum( edvlrdes.Text ) ;
     ParamByName('pci_vlrenf').Text       := '0' ;
     ParamByName('pci_codcfo').Text       := edCfo;
     ParamByName('pci_codcst').Text       := edCst;
     ParamByName('pci_pctbicm').AsFloat   := FormataNum( edpctbicm.Text ) ;
     ParamByName('pci_vlrbicm').AsFloat   := FormataNum( edvlrbicm.Text ) ;
     ParamByName('pci_pctipi').AsFloat    := FormataNum( edpctipi.Text ) ;
     ParamByName('pci_vlripi').AsFloat    := FormataNum( edvlripi.Text ) ;
     ParamByName('pci_pctbicmst').AsFloat := FormataNum( edpctbicmst.Text ) ;
     ParamByName('pci_vlrbicmst').AsFloat := FormataNum( edvlrbicmst.Text ) ;
     ParamByName('pci_usuinc').Text       :=  sysUsuario ;
     ParamByName('pci_datinc').AsDate     := now ;
     ParamByName('pci_horinc').Text       := TimeToStr(time) ;
     IniTransacao;
     ExecSQL;
 end;
 RefreshGrid ;
 campositens ;
 btninc;
 edcodpne.SetFocus;

end;

procedure Tfrmpneucmp.RefreshGrid;
Var
  qDel : TFDQuery;
  Encargos : Double;
begin
  Encargos          :=  ( FormataNum( pcp_vlrfrt.Text ) + FormataNum( pcp_vlrfac.Text ) + FormataNum( pcp_vlrseg.Text ) );
  SqlItemPneu.Close;
  cliItemPneu.Close;
  with SqlItemPneu do
    begin
      SQL.Text :=' Select *, ( (( pci_vlrunt * pci_qtdcmp ) + pci_vlrenc) - pci_vlrdes ) as total  from '+U_funcao.SelSchema('pneucmpi')+' '+
                 ' LEFT JOIN '+U_funcao.SelSchema('pneumod')+' on pmd_codigo = pci_codpmd '+
                 ' where pci_codpcp = '+fIIf( Length( trim(pcp_codigo.Text)) > 0, QuotedStr(pcp_codigo.Text),'0' ) ;
      Open;
  end;
  cliItemPneu.Active := True;
  DBGrid1.Refresh;
  RefreshValores;

end;

procedure Tfrmpneucmp.RefreshGridF;
Var
  qDel : TFDQuery;
  Encargos : Double;
begin
  Encargos          :=  ( FormataNum( pcp_vlrfrt.Text ) + FormataNum( pcp_vlrfac.Text ) + FormataNum( pcp_vlrseg.Text ) );
  SqlPneuFin.Close;
  cliPneuFin.Close;
  with SqlPneuFin do
    begin
      SQL.Text :=' Select * from '+U_funcao.SelSchema('pneucmpf')+' '+
                 ' where pcf_codpcp = '+U_funcao.fIIf( Length( trim(pcp_codigo.Text)) > 0, QuotedStr(pcp_codigo.Text),QuotedStr('0') )
                 +' order by pcf_datvnc' ;
      Open;
  end;
  cliPneuFin.Active := True;
  DBGrid2.Refresh;
  RefreshValores;

end;

procedure Tfrmpneucmp.RefreshValores;
Var
  qDel, qDel1 : TFDQuery;
  Encargos : Double;
begin
  Encargos          :=  ( FormataNum( pcp_vlrfrt.Text ) + FormataNum( pcp_vlrfac.Text ) + FormataNum( pcp_vlrseg.Text ) );

  qDel            := TFDQuery.Create(Nil);
  qDel1           := TFDQuery.Create(Nil);
  // Fazendo a Exclusão de Itens relacionandos nas SubTabelas
  qDel.Connection  := dmEmp.SqlConSis;
  qDel.Close;
  qDel.SQl.Text    :='Select count(*) as itens, COALESCE( sum( pci_vlrdes ),0) as desconto, '+
                      'COALESCE( sum( (( pci_vlrunt * pci_qtdcmp ) + pci_vlrenc) - pci_vlrdes ),0) as total, '+
                      'COALESCE( sum( ( pci_vlrunt * pci_qtdcmp ) ), 0) as totliq  FROM '+U_funcao.SelSchema('pneucmpi')+' WHERE pci_codpcp = :codpcp ';
  qDel.ParamByName('codpcp').Text  := fIIF( pcp_codigo.Text <> '',pcp_codigo.Text,'0') ;
  qDel.Open;

  // Fazendo a Exclusão de Itens relacionandos nas SubTabelas
  qDel1.Connection  := dmEmp.SqlConSis;
  qDel1.Close;
  qDel1.SQl.Text    :='Select count(*) as parcela, COALESCE( sum( pcf_vlrpar ),0) as totpar FROM '+U_funcao.SelSchema('pneucmpf')+' WHERE pcf_codpcp = :codpcp ';
  qDel1.ParamByName('codpcp').Text  := fIIF( pcp_codigo.Text <> '',pcp_codigo.Text,'0') ;
  qDel1.Open;


  lbTotal.Caption     := FormatCurr('R$ #,###,##0.00', qDel.FieldByName('total').Value + Encargos);
  lbTotaldesc.Caption := FormatCurr('R$ #,###,##0.00', qDel.FieldByName('desconto').Value);
  lbVlrLiq.Caption    := FormatCurr('R$ #,###,##0.00', qDel.FieldByName('totliq').Value);
  lbVlrFat.Caption    := FormatCurr('R$ #,###,##0.00', qDel1.FieldByName('totpar').Value);

  lbVlrFrete.Caption  := FormatCurr('R$ #,###,##0.00', ( FormataNum( pcp_vlrfrt.Text ) + FormataNum( pcp_vlrseg.Text ) + FormataNum( pcp_vlrfac.Text ) ) );
  lbQtdItens.Caption  := FormatCurr('#,###,##0', qDel.FieldByName('itens').Value);

  if ( FormataNum(pcp_qtdpct.Text) > 0 ) and ( FormataNum(lbTotal.Caption) > 0 ) then
      edvlrprc.Text       := FormatCurr('R$ #,###,##0.00', (  ( FormataNum(lbTotal.Caption) / FormataNum( pcp_qtdpct.Text ) ) ) );

end;




procedure Tfrmpneucmp.btnIniExecute(Sender: TObject);
begin
  navegacao(1);
end;

procedure Tfrmpneucmp.btnNovoExecute(Sender: TObject);
begin
   acampo := 1;
   nNew   := acampo;
   btnGrava.Enabled := True;
   RefreshDados('S');
   limpaget;
   ativaButoes(1);
   lMostra := False;
   ativaget;
   RefreshGrid;
   RefreshGridF;
   btninc;
   pcp_datems.SetFocus;
end;

procedure Tfrmpneucmp.btnProxExecute(Sender: TObject);
begin
  navegacao(3);
end;

procedure Tfrmpneucmp.btnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure Tfrmpneucmp.btnUltExecute(Sender: TObject);
begin
  navegacao(4);
end;

procedure Tfrmpneucmp.edCodCfoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      edcodcfoRightButtonClick(Self);
  end;
Finally

End;

end;

procedure Tfrmpneucmp.edCodCfoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dscfop ;
  Pesquisa.sqlTabela :=  dmEmp.sqlcfop ;
  Pesquisa.cliTabela :=  dmEmp.clicfop ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de CFOP';
  Pesquisa.nmTabela  := 'cfop' ;
  Pesquisa.NovoCad   := 'cfop' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('cfo_codigo','Código'             ,'edCodcfo' ,5  ,'por Código' );
  Pesquisa.AddReg('cfo_nome'  ,'Descrição'          ,'ednomPne' ,50 ,'por Descrição' );

  Pesquisa.acessa(edCodcfo);
  edCodcfo.text   :=  Pesquisa.RecReg('cfo_codigo');
  Pesquisa.Destroy;

 end;


initialization
  RegisterClass(Tfrmpneucmp);


end.
