unit U_compracmb;

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
  Tfrmcompracmb = class(TForm)
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
    cpc_codigo: TButtonedEdit;
    cpc_codfnd: TButtonedEdit;
    edNomFnd: TEdit;
    cpc_datems: TDateTimePicker;
    cpc_chelet: TEdit;
    cpc_numnfe: TMaskEdit;
    cpc_datent: TDateTimePicker;
    Label2: TLabel;
    cpc_sernfe: TMaskEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GrbItens: TGroupBox;
    Label5: TLabel;
    Label16: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    edcodtnq: TButtonedEdit;
    edNomCmb: TEdit;
    edLtsTnq: TEdit;
    edltscmp: TMaskEdit;
    edvlrlts: TMaskEdit;
    edpctdes: TMaskEdit;
    edvlrdes: TMaskEdit;
    edvlrenc: TMaskEdit;
    edVlrTot: TEdit;
    edcodcmb: TButtonedEdit;
    dspItemComb: TDataSetProvider;
    cliItemComb: TClientDataSet;
    dsItemComb: TDataSource;
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
    dspCpcFin: TDataSetProvider;
    cliCpcFin: TClientDataSet;
    dsCpcFin: TDataSource;
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
    cpc_vlrfrt: TMaskEdit;
    cpc_vlrseg: TMaskEdit;
    cpc_vlrfac: TMaskEdit;
    cpc_codfpg: TButtonedEdit;
    Label31: TLabel;
    edNomFpg: TEdit;
    Label32: TLabel;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    frxDBDataset3: TfrxDBDataset;
    cpc_qtdpct: TMaskEdit;
    Label33: TLabel;
    edVlrPrc: TEdit;
    Label37: TLabel;
    DBGrid1: TDBGrid;
    sqlItemComb: TFDQuery;
    sqlCpcFin: TFDQuery;
    sqlItemCombcci_codigo: TIntegerField;
    sqlItemCombcci_codcpc: TIntegerField;
    sqlItemCombcci_codcst: TStringField;
    sqlItemCombcci_codtnq: TIntegerField;
    sqlItemCombcci_codcmb: TIntegerField;
    sqlItemCombcci_ltscmp: TBCDField;
    sqlItemCombcci_vlrlts: TBCDField;
    sqlItemCombcci_pctdes: TBCDField;
    sqlItemCombcci_vlrenc: TBCDField;
    sqlItemCombcci_vlrdes: TBCDField;
    sqlItemCombcci_vlrenf: TBCDField;
    sqlItemCombcci_codcfo: TStringField;
    sqlItemCombcci_pctbicm: TBCDField;
    sqlItemCombcci_vlrbicm: TBCDField;
    sqlItemCombcci_pctipi: TBCDField;
    sqlItemCombcci_vlripi: TBCDField;
    sqlItemCombcci_pctbicmst: TBCDField;
    sqlItemCombcci_vlrbicmst: TBCDField;
    sqlItemCombcci_usuinc: TStringField;
    sqlItemCombcci_datinc: TDateField;
    sqlItemCombcci_horinc: TStringField;
    sqlItemCombcci_usualt: TStringField;
    sqlItemCombcci_datalt: TDateField;
    sqlItemCombcci_horalt: TStringField;
    sqlItemCombcmb_codigo: TIntegerField;
    sqlItemCombcmb_nome: TStringField;
    sqlItemCombcmb_usuinc: TStringField;
    sqlItemCombcmb_datinc: TDateField;
    sqlItemCombcmb_horinc: TStringField;
    sqlItemCombcmb_usualt: TStringField;
    sqlItemCombcmb_datalt: TDateField;
    sqlItemCombcmb_horalt: TStringField;
    sqlItemCombtotal: TFMTBCDField;
    cliItemCombcci_codigo: TIntegerField;
    cliItemCombcci_codcpc: TIntegerField;
    cliItemCombcci_codcst: TStringField;
    cliItemCombcci_codtnq: TIntegerField;
    cliItemCombcci_codcmb: TIntegerField;
    cliItemCombcci_ltscmp: TBCDField;
    cliItemCombcci_vlrlts: TBCDField;
    cliItemCombcci_pctdes: TBCDField;
    cliItemCombcci_vlrenc: TBCDField;
    cliItemCombcci_vlrdes: TBCDField;
    cliItemCombcci_vlrenf: TBCDField;
    cliItemCombcci_codcfo: TStringField;
    cliItemCombcci_pctbicm: TBCDField;
    cliItemCombcci_vlrbicm: TBCDField;
    cliItemCombcci_pctipi: TBCDField;
    cliItemCombcci_vlripi: TBCDField;
    cliItemCombcci_pctbicmst: TBCDField;
    cliItemCombcci_vlrbicmst: TBCDField;
    cliItemCombcci_usuinc: TStringField;
    cliItemCombcci_datinc: TDateField;
    cliItemCombcci_horinc: TStringField;
    cliItemCombcci_usualt: TStringField;
    cliItemCombcci_datalt: TDateField;
    cliItemCombcci_horalt: TStringField;
    cliItemCombcmb_codigo: TIntegerField;
    cliItemCombcmb_nome: TStringField;
    cliItemCombcmb_usuinc: TStringField;
    cliItemCombcmb_datinc: TDateField;
    cliItemCombcmb_horinc: TStringField;
    cliItemCombcmb_usualt: TStringField;
    cliItemCombcmb_datalt: TDateField;
    cliItemCombcmb_horalt: TStringField;
    cliItemCombtotal: TFMTBCDField;
    sqlCpcFinccf_codigo: TIntegerField;
    sqlCpcFinccf_codcpc: TIntegerField;
    sqlCpcFinccf_codcfr: TIntegerField;
    sqlCpcFinccf_numbol: TStringField;
    sqlCpcFinccf_datvnc: TDateField;
    sqlCpcFinccf_vlrpar: TBCDField;
    sqlCpcFinccf_usuinc: TStringField;
    sqlCpcFinccf_datinc: TDateField;
    sqlCpcFinccf_horinc: TStringField;
    sqlCpcFinccf_usualt: TStringField;
    sqlCpcFinccf_datalt: TDateField;
    sqlCpcFinccf_horalt: TStringField;
    cliCpcFinccf_codigo: TIntegerField;
    cliCpcFinccf_codcpc: TIntegerField;
    cliCpcFinccf_codcfr: TIntegerField;
    cliCpcFinccf_numbol: TStringField;
    cliCpcFinccf_datvnc: TDateField;
    cliCpcFinccf_vlrpar: TBCDField;
    cliCpcFinccf_usuinc: TStringField;
    cliCpcFinccf_datinc: TDateField;
    cliCpcFinccf_horinc: TStringField;
    cliCpcFinccf_usualt: TStringField;
    cliCpcFinccf_datalt: TDateField;
    cliCpcFinccf_horalt: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure RefreshDialog;
    Procedure RefreshDados(tipo: String);
    procedure cpc_codigoExit(Sender: TObject);
    procedure cpc_codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cpc_codigoRightButtonClick(Sender: TObject);
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
    procedure cpc_codfndRightButtonClick(Sender: TObject);
    procedure cpc_codfndKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cpc_codfndExit(Sender: TObject);
    procedure campositens;
    procedure edvlrltsKeyPress(Sender: TObject; var Key: Char);
    procedure edvlrdesKeyPress(Sender: TObject; var Key: Char);
    procedure edvlrencKeyPress(Sender: TObject; var Key: Char);
    procedure edltscmpKeyPress(Sender: TObject; var Key: Char);
    procedure edpctdesKeyPress(Sender: TObject; var Key: Char);
    procedure edcodtnqRightButtonClick(Sender: TObject);
    procedure edcodtnqKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure Ativador;
    procedure edcodcmbRightButtonClick(Sender: TObject);
    procedure edcodcmbKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure calcule;
    procedure edltscmpExit(Sender: TObject);
    procedure edvlrltsExit(Sender: TObject);
    procedure btninc;
    procedure edcodtnqExit(Sender: TObject);
    procedure edcodcmbExit(Sender: TObject);
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
    procedure cpc_vlrfrtKeyPress(Sender: TObject; var Key: Char);
    procedure cpc_vlrsegKeyPress(Sender: TObject; var Key: Char);
    procedure cpc_vlrfacKeyPress(Sender: TObject; var Key: Char);
    procedure cpc_vlrfrtExit(Sender: TObject);
    procedure cpc_vlrsegExit(Sender: TObject);
    procedure cpc_vlrfacExit(Sender: TObject);
    procedure RefreshValores;
    procedure btnIncFatClick(Sender: TObject);
    procedure RefreshGridF;
    procedure edvlrparKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnExcFatClick(Sender: TObject);
    procedure btnCanFatClick(Sender: TObject);
    procedure cpc_codfpgRightButtonClick(Sender: TObject);
    procedure cpc_codfpgKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cpc_codfpgExit(Sender: TObject);
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
  frmcompracmb: Tfrmcompracmb;
  modConsulta, nOrdem : integer;


implementation

uses  UCalculadora,  u_DmEmp, uSistema, U_funcao, U_CnpjClass, U_ClassconsContas;

{$R *.dfm}


procedure Tfrmcompracmb.calcule;
Var
num, pctc, pctd, Encargos  : Double;
begin
  num               :=  (  FormataNum(edvlrlts.Text) * FormataNum(edltscmp.Text) ) ;
  pctd              :=  FormataNum(edpctdes.Text) ;

  if pctd <> 0 then
     edvlrdes.Text  := FormatCurr('R$ #,##0.00', Pegavlrporcento(num, pctd) );

  num               := ( ( num - FormataNum(edvlrdes.Text) ) + FormataNum(edvlrenc.Text) );
  edvlrtot.Text     := FormatCurr('R$ #,###,##0.00',( num  ) );
  RefreshValores;

end;

procedure Tfrmcompracmb.campositens;
begin
  edcodtnq.Clear;
  edcodcmb.Clear;
  edcodcst.clear;
  edCodCfo.clear;
  edNomCmb.Clear;
  edLtsTnq.Clear;
  NroBol.Clear;
  edltscmp.Text   := FormatCurr('###,##0.000',0);
  edLtsTnq.Text   := FormatCurr('###,##0.000',0);
  edvlrlts.Text   := FormatCurr('R$ #,###,##0.000',0);
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

function Tfrmcompracmb.chkfatura: Boolean;
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
  qDel1.SQl.Text    :='Select COALESCE( sum( ccf_vlrpar ),0) as totpar FROM '+U_funcao.SelSchema('compracbmf')+' WHERE ccf_codcpc = :codcpc ';
  qDel1.ParamByName('codcpc').asInteger := StrToInt( fIIF( cpc_codigo.Text <> '',cpc_codigo.Text,'0') ) ;
  qDel1.Open;

  if  qDel1.FieldByName('totpar').Value = FormataNum( lbTotal.Caption )  then begin
      Result := True;
  end else
      Result := False;

end;

procedure Tfrmcompracmb.cpc_codfndExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlfornecedor ;
  edNomFnd.Text      :=  masc_cnpj_cpf( Pesquisa.Relacao('fornecedor',cpc_codfnd,'fnd_codigo','fnd_cpfcnpj') ) +'-'+
                         Pesquisa.Relacao('fornecedor',cpc_codfnd,'fnd_codigo','fnd_nome')    ;
  CodPct             :=  Pesquisa.Relacao('fornecedor',cpc_codfnd,'fnd_codigo','fnd_codpct')    ;

end;

procedure Tfrmcompracmb.cpc_codfndKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      cpc_codfndRightButtonClick(Self);
  end;
Finally

End;

end;

procedure Tfrmcompracmb.cpc_codfndRightButtonClick(Sender: TObject);
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
  Pesquisa.AddReg('fnd_codigo','Código'             ,'cpc_codfnd' ,5  ,'por Código' );
  Pesquisa.AddReg('fnd_nome'  ,'Fornecedor'         ,'edNomFnd'   ,25 ,'por compracmb' );


  Pesquisa.acessa(cpc_codfnd);
  cpc_codfnd.text   :=  Pesquisa.RecReg('fnd_codigo');
  edNomFnd.text     :=  Pesquisa.RecReg('fnd_nome');
  Pesquisa.Destroy;

 end;

procedure Tfrmcompracmb.cpc_codfpgExit(Sender: TObject);
begin
  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlformapgm ;
  edNomFpg.Text      :=  Pesquisa.Relacao('formapgm',cpc_codfpg,'fpg_codigo','fpg_nome') ;

end;

procedure Tfrmcompracmb.cpc_codfpgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Begin
 Try
case key of
    VK_END:
      cpc_codfpgRightButtonClick(Self);
  end;
Finally

End;

end;

procedure Tfrmcompracmb.cpc_codfpgRightButtonClick(Sender: TObject);
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
  Pesquisa.AddReg('fpg_codigo','Código'             ,'cpc_codfpg' ,5  ,'por Código' );
  Pesquisa.AddReg('fpg_nome'  ,'Forma de Pagamento' ,'edNomFpg'   ,30 ,'por Descrição' );


  Pesquisa.acessa(cpc_codfpg);
  cpc_codfpg.text   :=  Pesquisa.RecReg('fpg_codigo');
  edNomFpg.text     :=  Pesquisa.RecReg('fpg_nome');
  Pesquisa.Destroy;

 end;

procedure Tfrmcompracmb.cpc_codigoExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados

  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlcompracmb ;
  navegacao(5);


end;

procedure Tfrmcompracmb.cpc_codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END    : cpc_codigoRightButtonClick(Self);
    VK_UP     : navegacao(1);
    VK_LEFT   : navegacao(2);
    VK_RIGHT  : navegacao(3);
    VK_DOWN   : navegacao(4);

  end;
Finally

End;

end;

procedure Tfrmcompracmb.cpc_codigoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
if btnGrava.Enabled then
   Exit;

  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dscompracmb ;
  Pesquisa.sqlTabela :=  dmEmp.sqlcompracmb ;
  Pesquisa.cliTabela :=  dmEmp.clicompracmb ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Contas a Pagar';
  Pesquisa.nmTabela  := 'caixa';
//  Pesquisa.NovoCad   := 'caixa' ;
  // Display        campo   cabecalho                     get         tan  indices
  Pesquisa.AddReg('cpc_codigo'  ,'Nosso Cod'              ,'cpc_codigo' ,7   ,'por Código'         );
  Pesquisa.AddReg('cpc_numnfe'  ,'Nº Nota'                ,'cpc_numnfe' ,10  ,'por Nº Nota'        );
  Pesquisa.AddReg('cpc_sernfe'  ,'Série'                  ,'cpc_sernfe' ,5   ,'por Série'        );
  Pesquisa.AddReg('cpc_datems'  ,'Emissão'                ,'cpc_datems' ,10  ,'por Dt de Emissão'  );
  Pesquisa.AddReg('cpc_datent'  ,'Entrada'                ,'cpc_datent' ,10  ,'por Dt de Entrada'  );
  Pesquisa.AddReg('cpc_chelet'  ,'Chave Eletrônico'       ,'cpc_chelet' ,35  ,'por Descriminação'  );
  Pesquisa.AddReg('fnd_nome'    ,'Nome do Fornecedor'     ,'fnd_nome'   ,35  ,'por Fornecedor'     );


  Pesquisa.acessa(cpc_codigo);
  cpc_codigo.text   :=  Pesquisa.RecReg('cpc_codigo');
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





procedure Tfrmcompracmb.cpc_vlrfacExit(Sender: TObject);
begin
calcule;
end;

procedure Tfrmcompracmb.cpc_vlrfacKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  MoedaKeyEdit( Key, cpc_vlrfac );
  Key := #0 ;
end;


procedure Tfrmcompracmb.cpc_vlrfrtExit(Sender: TObject);
begin
calcule;
end;

procedure Tfrmcompracmb.cpc_vlrfrtKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  MoedaKeyEdit( Key, cpc_vlrfrt);
  Key := #0 ;
end;

procedure Tfrmcompracmb.cpc_vlrsegExit(Sender: TObject);
begin
calcule;
end;

procedure Tfrmcompracmb.cpc_vlrsegKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  MoedaKeyEdit( Key, cpc_vlrseg );
  Key := #0 ;
end;


procedure Tfrmcompracmb.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure Tfrmcompracmb.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure Tfrmcompracmb.edcodcmbExit(Sender: TObject);
Var
qDel, qDel1 : TFDQuery;
Encargos : Double;
begin
  if edcodcmb.Text <> '' then begin

      qDel            := TFDQuery.Create(Nil);
      qDel1           := TFDQuery.Create(Nil);

      // Fazendo a Exclusão de Itens relacionandos nas SubTabelas
      qDel1.Connection  := dmEmp.SqlConSis;
      qDel1.Close;
      qDel1.SQl.Text    :='Select * FROM '+U_funcao.SelSchema('tanque')+' WHERE tnq_codcmb = :tnq_codcmb  and tnq_codigo = :tnq_codtnq ';
      qDel1.ParamByName('tnq_codcmb').asInteger  := StrtoInt( fIIF( edcodcmb.Text <> '',edcodcmb.Text,'0') );
      qDel1.ParamByName('tnq_codtnq').asInteger  := StrtoInt( fIIF( edcodtnq.Text <> '',edcodtnq.Text,'0') );
      qDel1.Open;

      if  qDel1.Eof  then begin
          ShowMessage('Combustível não corresponde a este tanque!');
          edcodtnq.SetFocus;
      End else
          btninc;
  end;

end;

procedure Tfrmcompracmb.edcodcmbKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      edcodcmbRightButtonClick(Self);
  end;
Finally

End;

end;

procedure Tfrmcompracmb.edcodcmbRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dscomb ;
  Pesquisa.sqlTabela :=  dmEmp.sqlcomb ;
  Pesquisa.cliTabela :=  dmEmp.clicomb ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Combustivel';
  Pesquisa.nmTabela  := 'combustivel' ;
  Pesquisa.NovoCad   := 'combustivel' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('cmb_codigo','Código'             ,'edCodcmb' ,5  ,'por Código' );
  Pesquisa.AddReg('cmb_nome'  ,'Descrição'          ,'edNomCmb' ,25 ,'por Descrição' );

  Pesquisa.acessa(edCodcmb);
  edCodcmb.text   :=  Pesquisa.RecReg('cmb_codigo');
  edNomCmb.text   :=  Pesquisa.RecReg('cmb_nome');
  Pesquisa.Destroy;

 end;

procedure Tfrmcompracmb.edCodCstKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrmcompracmb.edCodCstRightButtonClick(Sender: TObject);
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
  Pesquisa.AddReg('cst_descri','Descrição'          ,'edNomCmb' ,50 ,'por Descrição' );

  Pesquisa.acessa(edCodcst);
  edCodcst.text   :=  Pesquisa.RecReg('cst_codigo');
  Pesquisa.Destroy;

 end;

procedure Tfrmcompracmb.edcodtnqExit(Sender: TObject);
begin
  btninc;
end;

procedure Tfrmcompracmb.edcodtnqKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Begin
 Try
case key of
    VK_END    : edcodtnqRightButtonClick(Self);
    VK_UP     : navegacao(1);
    VK_LEFT   : navegacao(2);
    VK_RIGHT  : navegacao(3);
    VK_DOWN   : navegacao(4);

  end;
Finally

End;

end;
procedure Tfrmcompracmb.edcodtnqRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dstanque ;
  Pesquisa.sqlTabela :=  dmEmp.sqltanque ;
  Pesquisa.cliTabela :=  dmEmp.clitanque ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Tanques';
  Pesquisa.nmTabela  := 'tanque' ;
  Pesquisa.NovoCad   := 'tanque' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('tnq_codigo','Código'             ,'edcodtnq' ,7  ,'por Código' );
  Pesquisa.AddReg('tnq_nome'  ,'Descrição'          ,'edNomCmb' ,25 ,'por Descrição' );
  Pesquisa.AddReg('tnq_ltsetq','Estoque'            ,'edLtsTnq' ,12 ,'por Estoque' );


  Pesquisa.acessa(edcodtnq);
  edcodtnq.text   :=  Pesquisa.RecReg('tnq_codigo');
  edLtsTnq.text   :=  FormatCurr('###,##0.000', StrToFloat( Pesquisa.RecReg('tnq_ltsetq') ) );  ;
  Pesquisa.Destroy;

 end;

procedure Tfrmcompracmb.edltscmpExit(Sender: TObject);
begin
calcule;
end;

procedure Tfrmcompracmb.edltscmpKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  TanqKeyEdit( Key, edltscmp );
  Key := #0 ;

end;


procedure Tfrmcompracmb.edpctbicmKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  PorcentoKeyEdit( Key, edpctbicm );
  Key := #0 ;
end;

procedure Tfrmcompracmb.edpctbicmstKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  PorcentoKeyEdit( Key, edpctbicmst );
  Key := #0 ;
end;
procedure Tfrmcompracmb.edpctdesExit(Sender: TObject);
begin
calcule;
end;

procedure Tfrmcompracmb.edpctdesKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  PorcentoKeyEdit( Key, edpctdes );
  Key := #0 ;
end;

procedure Tfrmcompracmb.edpctipiKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  PorcentoKeyEdit( Key, edpctipi );
  Key := #0 ;
end;

procedure Tfrmcompracmb.edVlrbicmKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  MoedaKeyEdit( Key, edVlrbicm );
  Key := #0 ;
end;

procedure Tfrmcompracmb.edvlrbicmstKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  MoedaKeyEdit( Key, edvlrbicmst );
  Key := #0 ;
end;

procedure Tfrmcompracmb.edvlrdesExit(Sender: TObject);
begin
calcule;
end;

procedure Tfrmcompracmb.edvlrdesKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  MoedaKeyEdit( Key, edvlrdes );
  Key := #0 ;
end;

procedure Tfrmcompracmb.edvlrencExit(Sender: TObject);
begin
calcule;

end;

procedure Tfrmcompracmb.edvlrencKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  MoedaKeyEdit( Key, edvlrenc );
  Key := #0 ;
end;


procedure Tfrmcompracmb.edvlripiKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  MoedaKeyEdit( Key, edvlripi );
  Key := #0 ;
end;

procedure Tfrmcompracmb.edvlrltsExit(Sender: TObject);
begin
  calcule;
end;

procedure Tfrmcompracmb.edvlrltsKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  MoedaKeyCEdit( Key, edvlrlts,0 );
  Key := #0 ;
end;


procedure Tfrmcompracmb.edvlrparKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  MoedaKeyEdit( Key, edvlrpar);
  Key := #0 ;
end;

procedure Tfrmcompracmb.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sqlNew.Close;
    dmEmp.clicaixa.Close;
    frmcompracmb                     := nil ;
    action                       := cafree;
    fPrincipal.btncompracmb.Enabled := True;
end;



procedure Tfrmcompracmb.FormCreate(Sender: TObject);
Var
i, nPar: Integer;
cpc_tipdoc: TEdit;

begin

  cPre                        := 'cpc_';
  cTabela                     := 'compracmb';
  acampo                      := 1;
  sqlNew                      := TFDQuery.Create(nil);
  sqlNew.Connection           := dmEmp.SqlConSis;
  fPrincipal.btncompracmb.Enabled  := False;
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;

end;

procedure Tfrmcompracmb.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure Tfrmcompracmb.FormShow(Sender: TObject);
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
  lbCabeca01.Caption    := 'Compra de Combustível';
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

procedure Tfrmcompracmb.gravadados;
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, ctip_horalt,cCodSql, cIteSql,cValSql,cCodMnt : string ;
dData, dtip_datalt : TDate ;
i, tmp: Integer;
SQLQ : TFDQuery ;
begin
   gravadados2(cTabela,cPre,cPre+'codigo','X','', nNew, frmCompracmb, dmEmp.SqlConSis, aEdits );
end;

procedure Tfrmcompracmb.limpaget;
Var
i: Integer;
begin
  limpaget2(aEdits);
end;

procedure Tfrmcompracmb.navegacao(Ord: Integer);
begin
  if btnGrava.Enabled then
     Exit;

  navegacao2( Ord, acampo, btnIni, btnAnt, btnProx, btnUlt, sqlNew, dmemp.sqlcompracmb, cpc_codigo,'' );
  acampo := 0;
  RefreshDialog2(cPre,acampo, frmcompracmb, sqlNew, aEdits);
  acampo := 1;
  RefreshGrid ;
  RefreshGridf ;
  btninc;


end;

function Tfrmcompracmb.pgParcelas: String;
Var
  qDel: TFDQuery;
begin
   qDel             := TFDQuery.Create(Nil);
   qDel.Connection  := dmEmp.SqlConSis;
   qDel.Close;
   qDel.SQl.Text    :='Select count(*) as Parc From '+U_funcao.SelSchema('compracbmf')+' WHERE ccf_codcpc = :codcpc ';
   qDel.ParamByName('codcpc').asInteger       := StrtoInt( cpc_codigo.Text );
   qDel.Open;
   Result           := qDel.FieldByName('Parc').Text;
end;






procedure Tfrmcompracmb.RefreshDados(tipo: String);
var
  i: integer;
  cWhere, cQuery, cOrder: String;

begin
  RefreshDados2(acampo, tipo,'',  cpc_codigo, sqlNew, dmEmp.sqlcompracmb );
  RefreshGrid;
end;

procedure Tfrmcompracmb.RefreshDialog;
var
  i, tmp: Integer;
  frmx : TForm ;
begin
  RefreshDialog2(cPre,acampo, frmcompracmb, sqlNew, aEdits);
end;

procedure Tfrmcompracmb.ToolButton9Click(Sender: TObject);
begin
  frmCalculadora := TfrmCalculadora.Create(Self);
  frmCalculadora.Show;

end;

procedure Tfrmcompracmb.ativaButoes(tipo:Integer);
begin
  ativaButoes2(Tipo,  btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt, sqlNew);
  Ativador;
end;

procedure Tfrmcompracmb.Ativador;
begin
 GrbItens.Enabled   := btnGrava.Enabled;
 GrbFatura.Enabled  := btnGrava.Enabled;
 btnFaturar.Enabled := ( ( btnGrava.Enabled  and ( chkfatura ) ) and ( Not sqlNew.FieldByName('cpc_fatura').AsBoolean ) );
 btnImpNotra.Enabled:= (  btnGrava.Enabled   and ( sqlNew.FieldByName('cpc_fatura').AsBoolean ) );
end;

procedure Tfrmcompracmb.ativaget;
begin
  ativaget2(aEdits,cPre+'codigo',cTabela, btnGrava.Enabled, lMostra );
  RefreshGrid ;
end;


procedure Tfrmcompracmb.btnAlterarExecute(Sender: TObject);
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
      cpc_datems.SetFocus;


end;

procedure Tfrmcompracmb.btnAntExecute(Sender: TObject);
begin
  navegacao(2);
end;

procedure Tfrmcompracmb.btnCancekItemClick(Sender: TObject);
begin
{ Cancelamento}
  if MESSAGEBOX(Application.Handle, 'Deseja Cancelar este item?', 'Confirma...', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin
     RefreshGrid ;
     campositens ;
     btninc;
     edcodtnq.SetFocus;
  end;
end;

procedure Tfrmcompracmb.btnCancelaExecute(Sender: TObject);
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

   cpc_codigo.SetFocus;
   btninc;

end;

procedure Tfrmcompracmb.btnCanFatClick(Sender: TObject);
Var
  qDel : TFDQuery;
begin

{ Cancelamento}
  if LowerCase( btnCanFat.Caption ) = 'modificar' then begin
      nRecPct := DBGrid2.DataSource.DataSet.FieldByName('ccf_codigo').AsInteger;
      if MESSAGEBOX(Application.Handle, 'Deseja Modificar a parcela item?', 'Confirma...', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin
         btnCanFat.Caption    := 'Gravar';
         btnCanFat.ImageIndex :=  1185 ;
         btninc;
         NroBol.Text    := DBGrid2.DataSource.DataSet.FieldByName('ccf_numbol').Text;
         edDatvnc.Date  := DBGrid2.DataSource.DataSet.FieldByName('ccf_datvnc').AsDateTime;
         edvlrpar.Text  := FormatCurr('R$ ###,##0.00', DBGrid2.DataSource.DataSet.FieldByName('ccf_vlrpar').AsFloat );
         NroBol.SetFocus;
      end;

  end Else begin
     if MESSAGEBOX(Application.Handle, 'Deseja Modificar a parcela item?', 'Confirma...', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin


            //Atualiza valores
            IniTransacao;
            qDel            := TFDQuery.Create(Nil);
            qDel.Connection  := dmEmp.SqlConSis;
            qDel.Close;
            qDel.SQl.Text    :='UPDATE '+U_funcao.SelSchema('compracbmf')+' Set ccf_numbol = :ccf_numbol, ccf_datvnc = :ccf_datvnc, ccf_vlrpar = :ccf_vlrpar, '+
                             '  ccf_usualt = :ccf_usualt, ccf_datalt = :ccf_datalt, ccf_horalt = :ccf_horalt '+
                             ' WHERE  ccf_codigo = :ccf_codigo ';
            qDel.ParamByName('ccf_numbol').Text       := NroBol.Text;
            qDel.ParamByName('ccf_datvnc').AsDate     := edDatvnc.Date;
            qDel.ParamByName('ccf_vlrpar').AsFloat    := FormataNum( edvlrpar.Text );
            qDel.ParamByName('ccf_usualt').Text       :=  sysUsuario ;
            qDel.ParamByName('ccf_datalt').AsDate     := now ;
            qDel.ParamByName('ccf_horalt').Text       := TimeToStr(time) ;
            qDel.ParamByName('ccf_codigo').AsInteger  := nRecPct;
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

procedure Tfrmcompracmb.btnExcFatClick(Sender: TObject);
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
    qDel.SQl.Text    :='DELETE FROM   '+U_funcao.SelSchema('compracbmf')+' WHERE ccf_codcpc = :codcpc and ccf_codigo = :codccf';
    qDel.ParamByName('codcpc').asInteger  := StrtoInt( cpc_codigo.Text ) ;
    qDel.ParamByName('codccf').asInteger  := DBGrid2.DataSource.DataSet.FieldByName('ccf_codigo').asInteger ;
    qDel.ExecSQL;
    RefreshGridf ;
    campositens ;
    btninc;
    DBGrid2.SetFocus;

  end;

end;

procedure Tfrmcompracmb.btnExcluirExecute(Sender: TObject);
Var
  aSubTab : TArrayDim2;
  n: Integer;
  qDel : TFDQuery;
begin
   SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'compracbmi';     aSubTab[n][1] := 'cci_codcpc';
   If Exclui2(cTabela, aSubTab,  cpc_codigo, btnExcluir) Then Begin;

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

procedure Tfrmcompracmb.btnExcluItemClick(Sender: TObject);
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
    qDel.SQl.Text    :='DELETE FROM   '+U_funcao.SelSchema('compracbmi')+' WHERE cci_codcpc = :codcpc and cci_codigo = :codcci';
    qDel.ParamByName('codcpc').asInteger :=  StrtoInt( cpc_codigo.Text );
    qDel.ParamByName('codcci').asInteger :=  DBGrid1.DataSource.DataSet.FieldByName('cci_codigo').asInteger ;
    qDel.ExecSQL;


    RefreshGrid ;
    campositens ;
    btninc;
    edcodtnq.SetFocus;
  end;

end;

procedure Tfrmcompracmb.btnFaturarExecute(Sender: TObject);
Var
  qDel, qDel1, qSql1 : TFDQuery;
  cTipLan, cTipPro, cNumPar, cNumAnt, cDescri : String;
  i: Integer;

begin
{ Cancelamento}
  if MESSAGEBOX(Application.Handle, 'Deseja Faturar essa nota?', 'Confirma...', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin
      IniTransacao;
      qDel            := TFDQuery.Create(Nil);
      qDel1           := TFDQuery.Create(Nil);
      qSql1           := TFDQuery.Create(Nil);

      cDescri         := 'REF. COMPRA DE COMBUSTIVEL';
      // Gerando Estoque
      qDel.Connection  := dmEmp.SqlConSis;
      qDel.Close;
      qDel.SQl.Text    :='Select * From '+U_funcao.SelSchema('compracbmi')+' WHERE cci_codcpc = :codcpc ';
      qDel.ParamByName('codcpc').asInteger     := StrtoInt( cpc_codigo.Text );
      qDel.Open;
      qDel.First;
      while Not qDel.Eof do begin
          // Gerando a Movimentação do Estoque
          qDel1.Connection  := dmEmp.SqlConSis;
          qDel1.Close;
          qDel1.SQl.Text   :='insert into '+U_funcao.SelSchema('combumovim')+' ( mab_codcmb,   mab_codtnq,  mab_codcpc,  mab_DatMov,  mab_HorMov,  mab_tipo,  mab_ltsIni,  mab_ltsmov, mab_ltsAtu, mab_usuinc, mab_datinc, mab_horinc  ) values  '+
                                                                            '  ( :mab_codcmb, :mab_codtnq,  :mab_codcpc,  :mab_DatMov,  :mab_HorMov,  :mab_tipo,  :mab_ltsIni,  :mab_ltsmov, :mab_ltsAtu, :mab_usuinc, :mab_datinc, :mab_horinc )  ';

          qDel1.ParamByName('mab_codcmb').asInteger := qDel.FieldByName('cci_codcmb').asInteger;
          qDel1.ParamByName('mab_codtnq').asInteger := qDel.FieldByName('cci_codtnq').asInteger;
          qDel1.ParamByName('mab_codcpc').asInteger := strtoint( cpc_codigo.Text );
          qDel1.ParamByName('mab_DatMov').AsDate  := now ;
          qDel1.ParamByName('mab_HorMov').Text    := TimeToStr(time) ;
          qDel1.ParamByName('mab_tipo').Text      := 'E';
          qDel1.ParamByName('mab_ltsIni').AsFloat := pgEstoqueComb( qDel.FieldByName('cci_codtnq').AsInteger );
          qDel1.ParamByName('mab_ltsmov').AsFloat := qDel.FieldByName('cci_ltscmp').AsFloat;
          qDel1.ParamByName('mab_ltsAtu').AsFloat := ( pgEstoqueComb( qDel.FieldByName('cci_codtnq').asinteger ) + qDel.FieldByName('cci_ltscmp').AsFloat );
          qDel1.ParamByName('mab_usuinc').Text    :=  sysUsuario ;
          qDel1.ParamByName('mab_datinc').AsDate  := now ;
          qDel1.ParamByName('mab_horinc').Text    := TimeToStr(time) ;
          qDel1.ExecSQL;

          // Atualizando estoque do tanque
          qDel1.Close;
          qDel1.SQl.Text    :='UPDATE '+U_funcao.SelSchema('tanque')+' Set tnq_ltsetq = ( tnq_ltsetq + :tnq_ltsetq ), tnq_vlrcst = :tnq_vlrcst, '+
                              ' tnq_usualt = :tnq_usualt, tnq_datalt = :tnq_datalt, tnq_horalt = :tnq_horalt  WHERE tnq_codigo = :codtnq ';
          qDel1.ParamByName('codtnq').asInteger       := qDel.FieldByName('cci_codtnq').asInteger;
          qDel1.ParamByName('tnq_ltsetq').AsFloat:= qDel.FieldByName('cci_ltscmp').AsFloat;
          qDel1.ParamByName('tnq_vlrcst').AsFloat:= qDel.FieldByName('cci_vlrlts').AsFloat;
          qDel1.ParamByName('tnq_usualt').Text   :=  sysUsuario ;
          qDel1.ParamByName('tnq_datalt').AsDate := now ;
          qDel1.ParamByName('tnq_horalt').Text   := TimeToStr(time) ;
          qDel1.ExecSQL;



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
      qSql1.ParamByName('cfr_NumDoc').Text     := cpc_numnfe.Text ;
      qSql1.ParamByName('cfr_codant').asInteger:= StrToInt( cpc_codigo.Text );
      qSql1.ParamByName('cfr_codfnd').asInteger:= StrToInt( cpc_codfnd.Text );
      qSql1.ParamByName('cfr_codpct').Text     :=  CodPct;
      qSql1.ParamByName('cfr_descri').Text     := cDescri ;
      qSql1.ParamByName('cfr_DatEms').AsDate   := cpc_DatEms.Date ;
      qSql1.ParamByName('cfr_DatVen').AsDate   := cpc_DatEms.Date ;
      qSql1.ParamByName('cfr_TotPar').Text     := pgParcelas;
      qSql1.ParamByName('cfr_TipDoc').Text     := 'D';
      qSql1.ParamByName('cfr_vlrApg').AsFloat  := FormataNum( lbTotal.Caption     );
      qSql1.ParamByName('cfr_vlrDes').AsFloat  := FormataNum( lbTotaldesc.Caption );
      qSql1.ParamByName('cfr_vlrAcr').AsFloat  := FormataNum( lbVlrFrete.Caption  );;
      qSql1.ParamByName('cfr_vlrTot').AsFloat  := FormataNum( lbVlrFat.Caption    );
      qSql1.ParamByName('cfr_UsuInc').Text     :=  sysUsuario;
      qSql1.ParamByName('cfr_DatInc').AsDate   := Now;
      qSql1.ParamByName('cfr_HorInc').Text     := TimeToStr(Now);
      qSql1.ExecSQL;
      cNumAnt  := PegaUltCodSalvo( 'financecab', 'cfr_codigo', 'cfr_' );


      qDel.Connection  := dmEmp.SqlConSis;
      qDel.Close;
      qDel.SQl.Text    :='Select * From '+U_funcao.SelSchema('compracbmf')+' WHERE ccf_codcpc = :codcpc ';
      qDel.ParamByName('codcpc').AsInteger   := StrToInt( cpc_codigo.Text );
      qDel.Open;
      qDel.First;
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
            qSql1.ParamByName('fcr_DatVen').AsDate   := qDel.FieldByName('ccf_datvnc').AsDateTime;
            qSql1.ParamByName('fcr_NumPar').Text     := IntToStr(i);
            qSql1.ParamByName('fcr_Status').Text     := cTipPro;
            qSql1.ParamByName('fcr_tippro').Text     := cTipLan;
            qSql1.ParamByName('fcr_codcfr').AsInteger:= StrToInt( cNumAnt );
            qSql1.ParamByName('fcr_vlrApg').AsFloat  := qDel.FieldByName('ccf_vlrpar').AsFloat ;
            qSql1.ParamByName('fcr_NumBol').Text     := qDel.FieldByName('ccf_numbol').Text    ;
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
      qDel.SQl.Text    :='UPDATE '+U_funcao.SelSchema('compracmb')+' '+
                         ' Set cpc_fatura = :fatura, cpc_usualt = :cpc_usualt, cpc_datalt = :cpc_datalt, cpc_horalt = :cpc_horalt '+
                         ' WHERE cpc_codigo = :codcpc ';
      qDel.ParamByName('codcpc').AsInteger  := StrToInt( cpc_codigo.Text );
      qDel.ParamByName('fatura').AsBoolean  := True;
      qDel.ParamByName('cpc_usualt').Text   :=  sysUsuario ;
      qDel.ParamByName('cpc_datalt').AsDate := now ;
      qDel.ParamByName('cpc_horalt').Text   := TimeToStr(time) ;
      qDel.ExecSQl;
      btnFaturar.Enabled := False;
      btnGravaExecute(Self);

  end;

end;

procedure Tfrmcompracmb.btnGravaExecute(Sender: TObject);
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
      cpc_codigo.SetFocus;

   btninc;

end;

procedure Tfrmcompracmb.btnGravarExecute(Sender: TObject);
begin
 ShowMessage('teste');
end;

procedure Tfrmcompracmb.btnGravarUpdate(Sender: TObject);
begin
  btninc;
end;

procedure Tfrmcompracmb.btnImpNotraExecute(Sender: TObject);
begin
  ImpNota.LoadFromFile(cPathExe+'reports\'+'nfcompracomb.fr3');
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

procedure Tfrmcompracmb.btninc;
begin
  btnIncItem.Enabled    := ( ( edcodtnq.Text <> '' ) and  ( edcodcmb.Text <> '' ) ) ;
  btnExcluItem.Enabled  := (  Not btnIncItem.Enabled  and ( sqlItemComb.RecordCount > 0 )) ;
  btnCancekItem.Enabled := ( ( ( edcodtnq.Text <> '' ) and  ( edcodcmb.Text <> '' ) ) and ( Not btnIncItem.Enabled )) ;
  btnIncFat.Enabled     := ( ( DBGrid1.DataSource.DataSet.RecordCount > 0 ) and DBGrid2.DataSource.DataSet.Eof and ( Not sqlNew.FieldByName('cpc_fatura').AsBoolean ) ) ;
  btnCanFat.Enabled     := ( ( DBGrid1.DataSource.DataSet.RecordCount > 0 ) and ( Not sqlNew.FieldByName('cpc_fatura').AsBoolean ) );
  btnExcFat.Enabled     := ( ( Not DBGrid2.DataSource.DataSet.Eof ) and
                             ( DBGrid1.DataSource.DataSet.RecordCount > 0 ) and
                             ( LowerCase( btnCanFat.Caption ) = 'modificar' ) and
                             ( Not sqlNew.FieldByName('cpc_fatura').AsBoolean ));

   NroBol.Enabled     := ( LowerCase( btnCanFat.Caption ) <> 'modificar' ) ;
   edDatvnc.Enabled   := ( LowerCase( btnCanFat.Caption ) <> 'modificar' ) ;
   edvlrpar.Enabled   := ( LowerCase( btnCanFat.Caption ) <> 'modificar' ) ;
   cpc_codfpg.Enabled := ( Not sqlNew.FieldByName('cpc_fatura').AsBoolean ) ;
   cpc_qtdpct.Enabled := ( Not sqlNew.FieldByName('cpc_fatura').AsBoolean ) ;

   grbTaxas.Enabled := (( Not sqlNew.FieldByName('cpc_fatura').AsBoolean ) OR (nNew = 1) );
   GrbItens.Enabled := (( Not sqlNew.FieldByName('cpc_fatura').AsBoolean ) OR (nNew = 1) );
   grbCabec.Enabled := (( Not sqlNew.FieldByName('cpc_fatura').AsBoolean ) OR (nNew = 1) );

end;

procedure Tfrmcompracmb.btnIncFatClick(Sender: TObject);
Var
edCfo, edCst: String;
qDel, qDel1 : TFDQuery;
Encargos : Double;
i: integer;
begin

  qDel            := TFDQuery.Create(Nil);
  qDel1           := TFDQuery.Create(Nil);
  // Fazendo a Exclusão de Itens relacionandos nas SubTabelas
  qDel1.Connection  := dmEmp.SqlConSis;;
  qDel1.Close;
  qDel1.SQl.Text    :='Select COALESCE( sum( ccf_vlrpar ),0) as totpar FROM '+U_funcao.SelSchema('compracbmf')+' WHERE ccf_codcpc = :codcpc ';
  qDel1.ParamByName('codcpc').AsInteger   := StrToInt( fIIF( cpc_codigo.Text <> '',cpc_codigo.Text,'0') );
  qDel1.Open;

  if  (  qDel1.FieldByName('totpar').Value + FormataNum( edvlrpar.Text ) )  >   FormataNum( lbTotal.Caption )   then begin
      ShowMessage('A soma do(s) valo(res) faturado(s) é superior ao da Nota '+#13+'Não é possível incluir este valor '+#13+#13+'Necesário correção! ');

      edvlrpar.SetFocus;
  end else begin
      IniTransacao;
      // Fazendo a Exclusão de Itens relacionandos nas SubTabelas
      qDel.Connection  := dmEmp.SqlConSis ;
      For i := 1 to StrToInt(cpc_qtdpct.Text) do begin
          qDel.Close;
          qDel.SQl.Text   :='insert into '+U_funcao.SelSchema('compracbmf')+' ( ccf_codcpc,   ccf_NumBol, ccf_datvnc,  ccf_vlrpar,  ccf_usuinc,  ccf_datinc,  ccf_horinc ) values  '+
                                                                            ' ( :ccf_codcpc, :ccf_NumBol, :ccf_datvnc, :ccf_vlrpar, :ccf_usuinc, :ccf_datinc, :ccf_horinc )  ';
          qDel.ParamByName('ccf_codcpc').AsInteger:= StrToInt( cpc_codigo.Text );
          qDel.ParamByName('ccf_NumBol').Text     := StrZero( StrToInt(cpc_codigo.Text),10 )+FormatDateTime('yyyymmdd',now)+StrZero( PgQtdPrcFatura( cpc_codigo.Text ) ,27 );
          qDel.ParamByName('ccf_datvnc').AsDate   := IncMonth(now,i);   //;edDatvnc.Date  ;
          qDel.ParamByName('ccf_vlrpar').AsFloat  := FormataNum( edVlrPrc.Text ) ;
          qDel.ParamByName('ccf_usuinc').Text     :=  sysUsuario ;
          qDel.ParamByName('ccf_datinc').AsDate   := now ;
          qDel.ParamByName('ccf_horinc').Text     := TimeToStr(time) ;
          qDel.ExecSQL;
          RefreshGridf ;
      end;
      campositens ;
      btninc;
      DBGrid2.SetFocus;

  end;
  FreeAndNil(qDel);
  FreeAndNil(qDel1);


end;


procedure Tfrmcompracmb.btnIncItemClick(Sender: TObject);
Var
edCfo, edCst: String;
begin

 if nNew > 0 then begin
    cpc_codfpg.Text := PgFormaPgAtu;
    nNew := GravarSub(cTabela,cPre,cPre+'codigo','X','', nNew, aCampo, frmcompracmb, dmEmp.SqlConSis, aEdits, sqlNew, dmEmp.sqlcompracmb, cpc_codigo );
 End;

{ Rotina para guardar as informações}
 cliItemComb.Close;
 SqlItemComb.Close;
 with SqlItemComb do
   begin
     Close;
     SQL.Text :='insert into '+U_funcao.SelSchema('compracbmi')+' ( cci_codcpc, cci_codcst, cci_codtnq, cci_codcmb, cci_ltscmp, '+
                                                                  ' cci_vlrlts, cci_pctdes, cci_vlrenc, cci_vlrdes, cci_vlrenf, '+
                                                                  ' cci_pctbicm,cci_vlrbicm, cci_pctipi, cci_vlripi, cci_pctbicmst, cci_vlrbicmst, '+
                                                                  ' cci_codcfo, cci_usuinc, cci_datinc, cci_horinc ) values     '+
                                                                ' ( :cci_codcpc, :cci_codcst, :cci_codtnq, :cci_codcmb, :cci_ltscmp, '+
                                                                  ' :cci_vlrlts, :cci_pctdes, :cci_vlrenc, :cci_vlrdes, :cci_vlrenf, '+
                                                                  ' :cci_pctbicm, :cci_vlrbicm, :cci_pctipi, :cci_vlripi, :cci_pctbicmst, :cci_vlrbicmst, '+
                                                                  ' :cci_codcfo, :cci_usuinc, :cci_datinc, :cci_horinc )  ';


     edCfo   := fIIF( edCodCfo.Text <> '', edCodCfo.Text, 'NULL' );
     edCst   := fIIF( edCodCst.Text <> '', edCodCst.Text, 'NULL' );

     ParamByName('cci_codcpc').AsInteger  := StrToInt( cpc_codigo.Text ) ;
     ParamByName('cci_codtnq').AsInteger  := StrToInt( edcodtnq.Text   );
     ParamByName('cci_codcmb').AsInteger  := StrToInt( edcodcmb.Text   );
     ParamByName('cci_ltscmp').AsFloat    := FormataNum( edltscmp.Text ) ;
     ParamByName('cci_vlrlts').AsFloat    := FormataNum( edvlrlts.Text ) ;
     ParamByName('cci_pctdes').AsFloat    := FormataNum( edvlrlts.Text ) ;
     ParamByName('cci_vlrenc').AsFloat    := FormataNum( edvlrenc.Text ) ;
     ParamByName('cci_vlrdes').AsFloat    := FormataNum( edvlrdes.Text ) ;
     ParamByName('cci_vlrenf').AsFloat    := 0 ;
     ParamByName('cci_codcfo').Text       := edCfo ;
     ParamByName('cci_codcst').Text       := edCst ;
     ParamByName('cci_pctbicm').AsFloat   := FormataNum( edpctbicm.Text ) ;
     ParamByName('cci_vlrbicm').AsFloat   := FormataNum( edvlrbicm.Text ) ;
     ParamByName('cci_pctipi').AsFloat    := FormataNum( edpctipi.Text ) ;
     ParamByName('cci_vlripi').AsFloat    := FormataNum( edvlripi.Text ) ;
     ParamByName('cci_pctbicmst').AsFloat := FormataNum( edpctbicmst.Text ) ;
     ParamByName('cci_vlrbicmst').AsFloat := FormataNum( edvlrbicmst.Text ) ;
     ParamByName('cci_usuinc').Text       :=  sysUsuario ;
     ParamByName('cci_datinc').AsDate     := now ;
     ParamByName('cci_horinc').Text       := TimeToStr(time) ;
     IniTransacao;
     ExecSQL;
 end;
 RefreshGrid ;
 campositens ;
 btninc;
 edcodtnq.SetFocus;

end;

procedure Tfrmcompracmb.RefreshGrid;
Var
  qDel : TFDQuery;
  Encargos : Double;
begin
  Encargos          :=  ( FormataNum( cpc_vlrfrt.Text ) + FormataNum( cpc_vlrfac.Text ) + FormataNum( cpc_vlrseg.Text ) );
  SqlItemComb.Close;
  cliItemComb.Close;
  with SqlItemComb do
    begin
      SQL.Text :=' Select *, ( (( cci_vlrlts * cci_ltscmp ) + cci_vlrenc) - cci_vlrdes ) as total  from '+U_funcao.SelSchema('compracbmi')+' '+
                 ' LEFT JOIN '+U_funcao.SelSchema('combustivel')+' on cmb_codigo = cci_codcmb '+
                 ' where cci_codcpc = '+fIIf( Length( trim(cpc_codigo.Text)) > 0, QuotedStr(cpc_codigo.Text),'0' ) ;
      Open;
  end;
  cliItemComb.Active := True;
  DBGrid1.Refresh;
  RefreshValores;

end;

procedure Tfrmcompracmb.RefreshGridF;
Var
  qDel : TFDQuery;
  Encargos : Double;
begin
  Encargos          :=  ( FormataNum( cpc_vlrfrt.Text ) + FormataNum( cpc_vlrfac.Text ) + FormataNum( cpc_vlrseg.Text ) );
  SqlCpcFin.Close;
  cliCpcFin.Close;
  with SqlCpcFin do
    begin
      SQL.Text :=' Select * from '+U_funcao.SelSchema('compracbmf')+' '+
                 ' where ccf_codcpc = '+U_funcao.fIIf( Length( trim(cpc_codigo.Text)) > 0, QuotedStr(cpc_codigo.Text),QuotedStr('0') )
                 +' order by ccf_datvnc' ;
      Open;
  end;
  cliCpcFin.Active := True;
  DBGrid2.Refresh;
  RefreshValores;

end;

procedure Tfrmcompracmb.RefreshValores;
Var
  qDel, qDel1 : TFDQuery;
  Encargos : Double;
begin
  Encargos          :=  ( FormataNum( cpc_vlrfrt.Text ) + FormataNum( cpc_vlrfac.Text ) + FormataNum( cpc_vlrseg.Text ) );

  qDel            := TFDQuery.Create(Nil);
  qDel1           := TFDQuery.Create(Nil);
  // Fazendo a Exclusão de Itens relacionandos nas SubTabelas
  qDel.Connection  := dmEmp.SqlConSis;
  qDel.Close;
  qDel.SQl.Text    :='Select count(*) as itens, COALESCE( sum( cci_vlrdes ),0) as desconto, '+
                      'COALESCE( sum( (( cci_vlrlts * cci_ltscmp ) + cci_vlrenc) - cci_vlrdes ),0) as total, '+
                      'COALESCE( sum( ( cci_vlrlts * cci_ltscmp ) ), 0) as totliq  FROM '+U_funcao.SelSchema('compracbmi')+' WHERE cci_codcpc = :codcpc ';
  qDel.ParamByName('codcpc').AsInteger  := StrToInt(  fIIF( cpc_codigo.Text <> '',cpc_codigo.Text,'0') ) ;
  qDel.Open;

  // Fazendo a Exclusão de Itens relacionandos nas SubTabelas
  qDel1.Connection  := dmEmp.SqlConSis;
  qDel1.Close;
  qDel1.SQl.Text    :='Select count(*) as parcela, COALESCE( sum( ccf_vlrpar ),0) as totpar FROM '+U_funcao.SelSchema('compracbmf')+' WHERE ccf_codcpc = :codcpc ';
  qDel1.ParamByName('codcpc').AsInteger   := StrToInt( fIIF( cpc_codigo.Text <> '',cpc_codigo.Text,'0') );
  qDel1.Open;


  lbTotal.Caption     := FormatCurr('R$ #,###,##0.00', qDel.FieldByName('total').Value + Encargos);
  lbTotaldesc.Caption := FormatCurr('R$ #,###,##0.00', qDel.FieldByName('desconto').Value);
  lbVlrLiq.Caption    := FormatCurr('R$ #,###,##0.00', qDel.FieldByName('totliq').Value);
  lbVlrFat.Caption    := FormatCurr('R$ #,###,##0.00', qDel1.FieldByName('totpar').Value);

  lbVlrFrete.Caption  := FormatCurr('R$ #,###,##0.00', ( FormataNum( cpc_vlrfrt.Text ) + FormataNum( cpc_vlrseg.Text ) + FormataNum( cpc_vlrfac.Text ) ) );
  lbQtdItens.Caption  := FormatCurr('#,###,##0', qDel.FieldByName('itens').Value);

  if ( FormataNum(cpc_qtdpct.Text) > 0 ) and ( FormataNum(lbTotal.Caption) > 0 ) then
      edvlrprc.Text       := FormatCurr('R$ #,###,##0.00', (  ( FormataNum(lbTotal.Caption) / FormataNum( cpc_qtdpct.Text ) ) ) );

end;




procedure Tfrmcompracmb.btnIniExecute(Sender: TObject);
begin
  navegacao(1);
end;

procedure Tfrmcompracmb.btnNovoExecute(Sender: TObject);
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
   cpc_datems.SetFocus;
end;

procedure Tfrmcompracmb.btnProxExecute(Sender: TObject);
begin
  navegacao(3);
end;

procedure Tfrmcompracmb.btnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure Tfrmcompracmb.btnUltExecute(Sender: TObject);
begin
  navegacao(4);
end;

procedure Tfrmcompracmb.edCodCfoKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrmcompracmb.edCodCfoRightButtonClick(Sender: TObject);
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
  Pesquisa.AddReg('cfo_nome'  ,'Descrição'          ,'edNomCmb' ,50 ,'por Descrição' );

  Pesquisa.acessa(edCodcfo);
  edCodcfo.text   :=  Pesquisa.RecReg('cfo_codigo');
  Pesquisa.Destroy;

 end;


initialization
  RegisterClass(Tfrmcompracmb);


end.
