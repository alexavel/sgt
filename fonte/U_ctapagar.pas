unit U_ctapagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, ImgList, ExtCtrls, ComCtrls, xmldom,
  XMLIntf, IdHTTP, msxmldom, XMLDoc, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, ExtDlgs, RibbonLunaStyleActnCtrls,
  ToolWin, ActnMan, ActnCtrls, jpeg, edittuning, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, U_ClasseUtil,U_Classcons, ZDataset, ZDatasetUtils,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, U_ClassCad, Datasnap.DBClient,
  Datasnap.Provider, ZAbstractRODataset, ZAbstractDataset, System.ImageList, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client ;


type
  Tfrmctapg = class(TForm)
    StatusBar1: TStatusBar;
    Banner: TPanel;
    imgLogo: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    cfr_codigo: TButtonedEdit;
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
    cfr_period: TCheckBox;
    cfr_codfnd: TButtonedEdit;
    Label9: TLabel;
    edNomFnd: TEdit;
    Label10: TLabel;
    cfr_datems: TDateTimePicker;
    Label27: TLabel;
    cfr_numdoc: TEdit;
    Label11: TLabel;
    cfr_vlrapg: TMaskEdit;
    Label26: TLabel;
    cfr_datven: TDateTimePicker;
    Label12: TLabel;
    cfr_codpct: TButtonedEdit;
    Label16: TLabel;
    Label17: TLabel;
    cfr_descri: TEdit;
    cfr_codpss: TButtonedEdit;
    Label13: TLabel;
    edNomPss: TEdit;
    Label14: TLabel;
    cfr_totpar: TComboBox;
    Label2: TLabel;
    sqlParcela: TZQuery;
    dspParcela: TDataSetProvider;
    cliParcela: TClientDataSet;
    dsParcela: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    sqlParcelafcr_codigo: TIntegerField;
    sqlParcelafcr_codcfr: TIntegerField;
    sqlParcelafcr_codcxa: TIntegerField;
    sqlParcelafcr_codabc: TIntegerField;
    sqlParcelafcr_codcct: TIntegerField;
    sqlParcelafcr_codfpg: TIntegerField;
    sqlParcelafcr_datpag: TDateField;
    sqlParcelafcr_datven: TDateField;
    sqlParcelafcr_numpar: TWideStringField;
    sqlParcelafcr_descri: TWideStringField;
    sqlParcelafcr_status: TWideStringField;
    sqlParcelafcr_tippro: TWideStringField;
    sqlParcelafcr_vlrapg: TFloatField;
    sqlParcelafcr_vlrpag: TFloatField;
    sqlParcelafcr_check: TBooleanField;
    sqlParcelafcr_usuinc: TWideStringField;
    sqlParcelafcr_datinc: TDateField;
    sqlParcelafcr_horinc: TWideStringField;
    sqlParcelafcr_usualt: TWideStringField;
    sqlParcelafcr_datalt: TDateField;
    sqlParcelafcr_horalt: TWideStringField;
    sqlParcelacxa_codigo: TIntegerField;
    sqlParcelacxa_codcct: TIntegerField;
    sqlParcelacxa_codusu: TIntegerField;
    sqlParcelacxa_ativo: TWideStringField;
    sqlParcelacxa_usuinc: TWideStringField;
    sqlParcelacxa_datinc: TDateField;
    sqlParcelacxa_horinc: TWideStringField;
    sqlParcelacxa_usualt: TWideStringField;
    sqlParcelacxa_datalt: TDateField;
    sqlParcelacxa_horalt: TWideStringField;
    sqlParcelaabc_codigo: TIntegerField;
    sqlParcelaabc_codcxa: TIntegerField;
    sqlParcelaabc_databr: TDateField;
    sqlParcelaabc_datfch: TDateField;
    sqlParcelaabc_vlrini: TFloatField;
    sqlParcelaabc_vlrant: TFloatField;
    sqlParcelaabc_vlratu: TFloatField;
    sqlParcelaabc_usuinc: TWideStringField;
    sqlParcelaabc_datinc: TDateField;
    sqlParcelaabc_horinc: TWideStringField;
    sqlParcelaabc_usualt: TWideStringField;
    sqlParcelaabc_datalt: TDateField;
    sqlParcelaabc_horalt: TWideStringField;
    sqlParcelacct_codigo: TIntegerField;
    sqlParcelacct_codbco: TWideStringField;
    sqlParcelacct_agencia: TWideStringField;
    sqlParcelacct_nrconta: TWideStringField;
    sqlParcelacct_telef1: TWideStringField;
    sqlParcelacct_telef2: TWideStringField;
    sqlParcelacct_celula: TWideStringField;
    sqlParcelacct_usuinc: TWideStringField;
    sqlParcelacct_datinc: TDateField;
    sqlParcelacct_horinc: TWideStringField;
    sqlParcelacct_usualt: TWideStringField;
    sqlParcelacct_datalt: TDateField;
    sqlParcelacct_horalt: TWideStringField;
    sqlParcelafpg_codigo: TIntegerField;
    sqlParcelafpg_nome: TWideStringField;
    sqlParcelafpg_codpct: TWideStringField;
    sqlParcelafpg_acao: TWideStringField;
    sqlParcelafpg_parcela: TWideStringField;
    sqlParcelafpg_pctdesc: TFloatField;
    sqlParcelafpg_pctacre: TFloatField;
    sqlParcelafpg_usuinc: TWideStringField;
    sqlParcelafpg_datinc: TDateField;
    sqlParcelafpg_horinc: TWideStringField;
    sqlParcelafpg_usualt: TWideStringField;
    sqlParcelafpg_datalt: TDateField;
    sqlParcelafpg_horalt: TWideStringField;
    sqlParcelacfr_codigo: TIntegerField;
    sqlParcelacfr_numdoc: TWideStringField;
    sqlParcelacfr_codant: TIntegerField;
    sqlParcelacfr_codfnd: TIntegerField;
    sqlParcelacfr_codpss: TIntegerField;
    sqlParcelacfr_codcli: TIntegerField;
    sqlParcelacfr_codpct: TWideStringField;
    sqlParcelacfr_descri: TWideStringField;
    sqlParcelacfr_datems: TDateField;
    sqlParcelacfr_datven: TDateField;
    sqlParcelacfr_totpar: TWideStringField;
    sqlParcelacfr_vlrapg: TFloatField;
    sqlParcelacfr_vlrdes: TFloatField;
    sqlParcelacfr_vlracr: TFloatField;
    sqlParcelacfr_period: TWideStringField;
    sqlParcelacfr_tipdoc: TWideStringField;
    sqlParcelacfr_usuinc: TWideStringField;
    sqlParcelacfr_datinc: TDateField;
    sqlParcelacfr_horinc: TWideStringField;
    sqlParcelacfr_usualt: TWideStringField;
    sqlParcelacfr_datalt: TDateField;
    sqlParcelacfr_horalt: TWideStringField;
    sqlParcelafnd_codigo: TIntegerField;
    sqlParcelafnd_ativo: TWideStringField;
    sqlParcelafnd_nome: TWideStringField;
    sqlParcelafnd_rsocial: TWideStringField;
    sqlParcelafnd_tipopes: TWideStringField;
    sqlParcelafnd_cpfcnpj: TWideStringField;
    sqlParcelafnd_codpct: TWideStringField;
    sqlParcelafnd_endereco: TWideStringField;
    sqlParcelafnd_numend: TWideStringField;
    sqlParcelafnd_complem: TWideStringField;
    sqlParcelafnd_bairro: TWideStringField;
    sqlParcelafnd_cep: TWideStringField;
    sqlParcelafnd_codcid: TIntegerField;
    sqlParcelafnd_telef1: TWideStringField;
    sqlParcelafnd_telef2: TWideStringField;
    sqlParcelafnd_celula: TWideStringField;
    sqlParcelafnd_obs: TWideMemoField;
    sqlParcelafnd_usuinc: TWideStringField;
    sqlParcelafnd_datinc: TDateField;
    sqlParcelafnd_horinc: TWideStringField;
    sqlParcelafnd_usualt: TWideStringField;
    sqlParcelafnd_datalt: TDateField;
    sqlParcelafnd_horalt: TWideStringField;
    sqlParcelapss_codigo: TIntegerField;
    sqlParcelapss_nome: TWideStringField;
    sqlParcelapss_apelido: TWideStringField;
    sqlParcelapss_codcgo: TIntegerField;
    sqlParcelapss_datnas: TDateField;
    sqlParcelapss_sexo: TWideStringField;
    sqlParcelapss_ecivil: TWideStringField;
    sqlParcelapss_tpsangue: TWideStringField;
    sqlParcelapss_nompal: TWideStringField;
    sqlParcelapss_nommae: TWideStringField;
    sqlParcelapss_cpf: TWideStringField;
    sqlParcelapss_rg: TWideStringField;
    sqlParcelapss_rgexped: TWideStringField;
    sqlParcelapss_rgdata: TDateField;
    sqlParcelapss_pispasep: TWideStringField;
    sqlParcelapss_numctps: TWideStringField;
    sqlParcelapss_habilitac: TWideStringField;
    sqlParcelapss_hbemite: TDateField;
    sqlParcelapss_hbvalid: TDateField;
    sqlParcelapss_hbcateg: TWideStringField;
    sqlParcelapss_nrtitulo: TWideStringField;
    sqlParcelapss_nrreserv: TWideStringField;
    sqlParcelapss_cep: TWideStringField;
    sqlParcelapss_endereco: TWideStringField;
    sqlParcelapss_complem: TWideStringField;
    sqlParcelapss_numres: TWideStringField;
    sqlParcelapss_bairro: TWideStringField;
    sqlParcelapss_codcid: TIntegerField;
    sqlParcelapss_tpimove: TWideStringField;
    sqlParcelapss_tpresid: TWideStringField;
    sqlParcelapss_telef01: TWideStringField;
    sqlParcelapss_telef02: TWideStringField;
    sqlParcelapss_celular: TWideStringField;
    sqlParcelapss_email: TWideStringField;
    sqlParcelapss_status: TWideStringField;
    sqlParcelapss_foto: TBlobField;
    sqlParcelapss_obs: TWideMemoField;
    sqlParcelapss_vlrrenda: TFloatField;
    sqlParcelapss_vlrvale: TFloatField;
    sqlParcelapss_datcmp: TDateField;
    sqlParcelapss_nfecmp: TWideStringField;
    sqlParcelapss_usuinc: TWideStringField;
    sqlParcelapss_datinc: TDateField;
    sqlParcelapss_horinc: TWideStringField;
    sqlParcelapss_usualt: TWideStringField;
    sqlParcelapss_datalt: TDateField;
    sqlParcelapss_horalt: TWideStringField;
    sqlParcelapct_codigo: TWideStringField;
    sqlParcelapct_cntmae: TWideStringField;
    sqlParcelapct_nome: TWideStringField;
    sqlParcelapct_natureza: TWideStringField;
    sqlParcelapct_tipo: TWideStringField;
    sqlParcelapct_limite: TFloatField;
    sqlParcelapct_meta: TFloatField;
    sqlParcelapct_ord: TFloatField;
    sqlParcelapct_usuinc: TWideStringField;
    sqlParcelapct_datinc: TDateField;
    sqlParcelapct_horinc: TWideStringField;
    sqlParcelapct_usualt: TWideStringField;
    sqlParcelapct_datalt: TDateField;
    sqlParcelapct_horalt: TWideStringField;
    cliParcelafcr_codigo: TIntegerField;
    cliParcelafcr_codcfr: TIntegerField;
    cliParcelafcr_codcxa: TIntegerField;
    cliParcelafcr_codabc: TIntegerField;
    cliParcelafcr_codcct: TIntegerField;
    cliParcelafcr_codfpg: TIntegerField;
    cliParcelafcr_datpag: TDateField;
    cliParcelafcr_datven: TDateField;
    cliParcelafcr_numpar: TWideStringField;
    cliParcelafcr_descri: TWideStringField;
    cliParcelafcr_status: TWideStringField;
    cliParcelafcr_tippro: TWideStringField;
    cliParcelafcr_vlrapg: TFloatField;
    cliParcelafcr_vlrpag: TFloatField;
    cliParcelafcr_check: TBooleanField;
    cliParcelafcr_usuinc: TWideStringField;
    cliParcelafcr_datinc: TDateField;
    cliParcelafcr_horinc: TWideStringField;
    cliParcelafcr_usualt: TWideStringField;
    cliParcelafcr_datalt: TDateField;
    cliParcelafcr_horalt: TWideStringField;
    cliParcelacxa_codigo: TIntegerField;
    cliParcelacxa_codcct: TIntegerField;
    cliParcelacxa_codusu: TIntegerField;
    cliParcelacxa_ativo: TWideStringField;
    cliParcelacxa_usuinc: TWideStringField;
    cliParcelacxa_datinc: TDateField;
    cliParcelacxa_horinc: TWideStringField;
    cliParcelacxa_usualt: TWideStringField;
    cliParcelacxa_datalt: TDateField;
    cliParcelacxa_horalt: TWideStringField;
    cliParcelaabc_codigo: TIntegerField;
    cliParcelaabc_codcxa: TIntegerField;
    cliParcelaabc_databr: TDateField;
    cliParcelaabc_datfch: TDateField;
    cliParcelaabc_vlrini: TFloatField;
    cliParcelaabc_vlrant: TFloatField;
    cliParcelaabc_vlratu: TFloatField;
    cliParcelaabc_usuinc: TWideStringField;
    cliParcelaabc_datinc: TDateField;
    cliParcelaabc_horinc: TWideStringField;
    cliParcelaabc_usualt: TWideStringField;
    cliParcelaabc_datalt: TDateField;
    cliParcelaabc_horalt: TWideStringField;
    cliParcelacct_codigo: TIntegerField;
    cliParcelacct_codbco: TWideStringField;
    cliParcelacct_agencia: TWideStringField;
    cliParcelacct_nrconta: TWideStringField;
    cliParcelacct_telef1: TWideStringField;
    cliParcelacct_telef2: TWideStringField;
    cliParcelacct_celula: TWideStringField;
    cliParcelacct_usuinc: TWideStringField;
    cliParcelacct_datinc: TDateField;
    cliParcelacct_horinc: TWideStringField;
    cliParcelacct_usualt: TWideStringField;
    cliParcelacct_datalt: TDateField;
    cliParcelacct_horalt: TWideStringField;
    cliParcelafpg_codigo: TIntegerField;
    cliParcelafpg_nome: TWideStringField;
    cliParcelafpg_codpct: TWideStringField;
    cliParcelafpg_acao: TWideStringField;
    cliParcelafpg_parcela: TWideStringField;
    cliParcelafpg_pctdesc: TFloatField;
    cliParcelafpg_pctacre: TFloatField;
    cliParcelafpg_usuinc: TWideStringField;
    cliParcelafpg_datinc: TDateField;
    cliParcelafpg_horinc: TWideStringField;
    cliParcelafpg_usualt: TWideStringField;
    cliParcelafpg_datalt: TDateField;
    cliParcelafpg_horalt: TWideStringField;
    cliParcelacfr_codigo: TIntegerField;
    cliParcelacfr_numdoc: TWideStringField;
    cliParcelacfr_codant: TIntegerField;
    cliParcelacfr_codfnd: TIntegerField;
    cliParcelacfr_codpss: TIntegerField;
    cliParcelacfr_codcli: TIntegerField;
    cliParcelacfr_codpct: TWideStringField;
    cliParcelacfr_descri: TWideStringField;
    cliParcelacfr_datems: TDateField;
    cliParcelacfr_datven: TDateField;
    cliParcelacfr_totpar: TWideStringField;
    cliParcelacfr_vlrapg: TFloatField;
    cliParcelacfr_vlrdes: TFloatField;
    cliParcelacfr_vlracr: TFloatField;
    cliParcelacfr_period: TWideStringField;
    cliParcelacfr_tipdoc: TWideStringField;
    cliParcelacfr_usuinc: TWideStringField;
    cliParcelacfr_datinc: TDateField;
    cliParcelacfr_horinc: TWideStringField;
    cliParcelacfr_usualt: TWideStringField;
    cliParcelacfr_datalt: TDateField;
    cliParcelacfr_horalt: TWideStringField;
    cliParcelafnd_codigo: TIntegerField;
    cliParcelafnd_ativo: TWideStringField;
    cliParcelafnd_nome: TWideStringField;
    cliParcelafnd_rsocial: TWideStringField;
    cliParcelafnd_tipopes: TWideStringField;
    cliParcelafnd_cpfcnpj: TWideStringField;
    cliParcelafnd_codpct: TWideStringField;
    cliParcelafnd_endereco: TWideStringField;
    cliParcelafnd_numend: TWideStringField;
    cliParcelafnd_complem: TWideStringField;
    cliParcelafnd_bairro: TWideStringField;
    cliParcelafnd_cep: TWideStringField;
    cliParcelafnd_codcid: TIntegerField;
    cliParcelafnd_telef1: TWideStringField;
    cliParcelafnd_telef2: TWideStringField;
    cliParcelafnd_celula: TWideStringField;
    cliParcelafnd_obs: TWideMemoField;
    cliParcelafnd_usuinc: TWideStringField;
    cliParcelafnd_datinc: TDateField;
    cliParcelafnd_horinc: TWideStringField;
    cliParcelafnd_usualt: TWideStringField;
    cliParcelafnd_datalt: TDateField;
    cliParcelafnd_horalt: TWideStringField;
    cliParcelapss_codigo: TIntegerField;
    cliParcelapss_nome: TWideStringField;
    cliParcelapss_apelido: TWideStringField;
    cliParcelapss_codcgo: TIntegerField;
    cliParcelapss_datnas: TDateField;
    cliParcelapss_sexo: TWideStringField;
    cliParcelapss_ecivil: TWideStringField;
    cliParcelapss_tpsangue: TWideStringField;
    cliParcelapss_nompal: TWideStringField;
    cliParcelapss_nommae: TWideStringField;
    cliParcelapss_cpf: TWideStringField;
    cliParcelapss_rg: TWideStringField;
    cliParcelapss_rgexped: TWideStringField;
    cliParcelapss_rgdata: TDateField;
    cliParcelapss_pispasep: TWideStringField;
    cliParcelapss_numctps: TWideStringField;
    cliParcelapss_habilitac: TWideStringField;
    cliParcelapss_hbemite: TDateField;
    cliParcelapss_hbvalid: TDateField;
    cliParcelapss_hbcateg: TWideStringField;
    cliParcelapss_nrtitulo: TWideStringField;
    cliParcelapss_nrreserv: TWideStringField;
    cliParcelapss_cep: TWideStringField;
    cliParcelapss_endereco: TWideStringField;
    cliParcelapss_complem: TWideStringField;
    cliParcelapss_numres: TWideStringField;
    cliParcelapss_bairro: TWideStringField;
    cliParcelapss_codcid: TIntegerField;
    cliParcelapss_tpimove: TWideStringField;
    cliParcelapss_tpresid: TWideStringField;
    cliParcelapss_telef01: TWideStringField;
    cliParcelapss_telef02: TWideStringField;
    cliParcelapss_celular: TWideStringField;
    cliParcelapss_email: TWideStringField;
    cliParcelapss_status: TWideStringField;
    cliParcelapss_foto: TBlobField;
    cliParcelapss_obs: TWideMemoField;
    cliParcelapss_vlrrenda: TFloatField;
    cliParcelapss_vlrvale: TFloatField;
    cliParcelapss_datcmp: TDateField;
    cliParcelapss_nfecmp: TWideStringField;
    cliParcelapss_usuinc: TWideStringField;
    cliParcelapss_datinc: TDateField;
    cliParcelapss_horinc: TWideStringField;
    cliParcelapss_usualt: TWideStringField;
    cliParcelapss_datalt: TDateField;
    cliParcelapss_horalt: TWideStringField;
    cliParcelapct_codigo: TWideStringField;
    cliParcelapct_cntmae: TWideStringField;
    cliParcelapct_nome: TWideStringField;
    cliParcelapct_natureza: TWideStringField;
    cliParcelapct_tipo: TWideStringField;
    cliParcelapct_limite: TFloatField;
    cliParcelapct_meta: TFloatField;
    cliParcelapct_ord: TFloatField;
    cliParcelapct_usuinc: TWideStringField;
    cliParcelapct_datinc: TDateField;
    cliParcelapct_horinc: TWideStringField;
    cliParcelapct_usualt: TWideStringField;
    cliParcelapct_datalt: TDateField;
    cliParcelapct_horalt: TWideStringField;
    cfr_tipdoc: TComboBox;
    Label3: TLabel;
    cfr_codcli: TButtonedEdit;
    Label4: TLabel;
    edNomcli: TEdit;
    Label5: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure RefreshDialog;
    Procedure RefreshDados(tipo: String);
    procedure cfr_codigoExit(Sender: TObject);
    procedure cfr_codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cfr_codigoRightButtonClick(Sender: TObject);
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
    procedure cfr_vlrapgKeyPress(Sender: TObject; var Key: Char);
    procedure cfr_codfndRightButtonClick(Sender: TObject);
    procedure cfr_codfndKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cfr_codfndExit(Sender: TObject);
    procedure cfr_codpssRightButtonClick(Sender: TObject);
    procedure cfr_codpssKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cfr_codpssExit(Sender: TObject);
    procedure cfr_codpctRightButtonClick(Sender: TObject);
    procedure cfr_codpctKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cfr_codpctExit(Sender: TObject);
    procedure regrehgrid;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cfr_tipdocChange(Sender: TObject);
    procedure cfr_codcliRightButtonClick(Sender: TObject);
    procedure cfr_codcliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cfr_codcliExit(Sender: TObject);
    procedure cfr_codpctChange(Sender: TObject);
  private
    { Private declarations }
    wEmpresa, wUsuInc, wHorInc, wUsuAlt, wHorAlt : string ;
    wDatInc, wDatAlt : Tdate;
    nNew, nRecno:  Integer;
    procedure pegatpcnt;
    procedure ativaconta;
    Function chkcontas: Boolean;
  public
    acampo: integer;
    aberto, lMostra: Boolean;
    Util: TClasseUtil;
    Pesquisa : TClasConsulta;
    sqlNew    : TFDQuery;
    cQueryPad : String;
    aEdits : TArrayComp;
    cPre, cTabela, cSqlGridMov: String;


    { Public declarations }
  end;

var
  frmctapg: Tfrmctapg;
  modConsulta, nOrdem : integer;


implementation

uses  UCalculadora,  u_DmEmp, uSistema, U_funcao, U_CnpjClass, U_ClassconsContas, U_ClassAutoriza;

{$R *.dfm}


procedure Tfrmctapg.cfr_codfndExit(Sender: TObject);
begin
  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlfornecedor ;
  edNomFnd.Text      :=  Pesquisa.Relacao('fornecedor',cfr_codfnd,'fnd_codigo','fnd_nome'   );
  cfr_codpct.Text    :=  Pesquisa.Relacao('fornecedor',cfr_codfnd,'fnd_codigo','fnd_codpct' );
  cfr_codcli.Enabled := ( cfr_codfnd.Text = '');

end;

procedure Tfrmctapg.cfr_codfndKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      cfr_codfndRightButtonClick(Self);
  end;
Finally

End;

end;

procedure Tfrmctapg.cfr_codfndRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsfornecedor ;
  Pesquisa.sqlTabela :=  dmEmp.sqlFornecedor ;
  Pesquisa.cliTabela :=  dmEmp.clifornecedor ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de fornecedores';
  Pesquisa.nmTabela  := 'fornecedor' ;
  Pesquisa.NovoCad   := 'fornecedor' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('fnd_codigo','Código'             ,'cfr_codfnd' ,5  ,'por Código' );
  Pesquisa.AddReg('fnd_nome'  ,'fornecedor'         ,'edNomFnd'   ,25 ,'por fornecedor' );


  Pesquisa.acessa(cfr_codfnd);
  cfr_codfnd.text   :=  Pesquisa.RecReg('fnd_codigo');
  edNomFnd.text     :=  Pesquisa.RecReg('fnd_nome');
  Pesquisa.Destroy;

 end;

procedure Tfrmctapg.cfr_codigoExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados

  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlctapg ;
  navegacao(5);


end;

procedure Tfrmctapg.cfr_codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END    : cfr_codigoRightButtonClick(Self);
    VK_UP     : navegacao(1);
    VK_LEFT   : navegacao(2);
    VK_RIGHT  : navegacao(3);
    VK_DOWN   : navegacao(4);

  end;
Finally

End;

end;

procedure Tfrmctapg.cfr_codigoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
if btnGrava.Enabled then
   Exit;

  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsCtapg ;
  Pesquisa.sqlTabela :=  dmEmp.sqlCtapg ;
  Pesquisa.cliTabela :=  dmEmp.cliCtapg ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Contas a Pagar';
  Pesquisa.nmTabela  := 'caixa';
//  Pesquisa.NovoCad   := 'caixa' ;
  // Display        campo   cabecalho                     get         tan  indices
  Pesquisa.AddReg('fcr_codigo'  ,'Nosso Cod'              ,'fcr_codigo' ,7  ,'por Código'         );
  Pesquisa.AddReg('fcr_numdoc'  ,'Documento'              ,'fcr_numdoc' ,10 ,'por Numero CT'      );
  Pesquisa.AddReg('fcr_datven'  ,'Vencimento'             ,'fcr_datven' ,7  ,'por Dt Vencimento'  );
  Pesquisa.AddReg('fcr_datems'  ,'Emissão'                ,'fcr_datems' ,7  ,'por Dt Emissão'     );
  Pesquisa.AddReg('fcr_descri'  ,'Descriminação'          ,'fcr_descri' ,25 ,'por Descriminação'  );
  Pesquisa.AddReg('fcr_vlrapg'  ,'Valor a Pagar'          ,'fcr_vlrapg' ,15 ,'por Valor a Pagar'  );
  Pesquisa.AddReg('pss_nome'    ,'Nome do Banco'          ,'pss_nome'   ,25 ,'por Nome'           );


  Pesquisa.acessa(cfr_codigo);
  cfr_codigo.text   :=  Pesquisa.RecReg('cfr_codigo');
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



procedure Tfrmctapg.cfr_codpctChange(Sender: TObject);
begin
 cfr_codpct.Enabled := ( Length(cfr_codpct.Text) = 0 ) ;

end;

procedure Tfrmctapg.cfr_codpctExit(Sender: TObject);
Var
  Pesquisa : TClasConsultaConta;
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsultaConta.Create;
  cfr_descri.Text :=  Pesquisa.Relacao('pct_nome',cfr_codpct.Text);

end;

procedure Tfrmctapg.cfr_codpctKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      cfr_codpctRightButtonClick(Self);
  end;
Finally

End;

end;

procedure Tfrmctapg.cfr_codpctRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsultaConta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsultaConta.Create;
   if cfr_tipdoc.ItemIndex = 0 then begin
        Pesquisa.acessa(cfr_codpct,'D');
   end Else
   if cfr_tipdoc.ItemIndex = 1 then begin
        Pesquisa.acessa(cfr_codpct,'C');
   end;


  cfr_descri.Text :=  Pesquisa.Relacao('pct_nome',cfr_codpct.Text);
  Pesquisa.Destroy;

end;

procedure Tfrmctapg.cfr_codpssExit(Sender: TObject);
begin
  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlPessoal ;
  edNomPss.Text      :=  Pesquisa.Relacao('pessoal',cfr_codpss,'pss_codigo','pss_nome');

end;

procedure Tfrmctapg.cfr_codpssKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      cfr_codpssRightButtonClick(Self);
  end;
Finally

End;

end;

procedure Tfrmctapg.cfr_codpssRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dspessoal ;
  Pesquisa.sqlTabela :=  dmEmp.sqlpessoal ;
  Pesquisa.cliTabela :=  dmEmp.clipessoal ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Pessoal';
  Pesquisa.nmTabela  := 'pessoal' ;
  Pesquisa.NovoCad   := 'pessoal' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('pss_codigo','Código'             ,'cfr_codpss' ,5  ,'por Código' );
  Pesquisa.AddReg('pss_nome'  ,'Nome Completo'      ,'edNomPss'   ,25 ,'por Nome' );

  Pesquisa.acessa(cfr_codpss);
  cfr_codpss.text   :=  Pesquisa.RecReg('pss_codigo');
  edNomPss.text     :=  Pesquisa.RecReg('pss_nome');
  Pesquisa.Destroy;

end;

procedure Tfrmctapg.cfr_tipdocChange(Sender: TObject);
begin
  cfr_codpct.Clear;
end;

procedure Tfrmctapg.cfr_vlrapgKeyPress(Sender: TObject; var Key: Char);
vAR
  cKey: String;
begin
  cKey:=Key;
  MoedaKeyEdit( Key, cfr_vlrapg );
  Key := #0 ;
end;

procedure Tfrmctapg.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    if gdFocused in State then  begin
      DbGrid1.Canvas.Brush.Color  := Azul_Escuro;
      DbGrid1.Canvas.Font.Color   := Branco;
      DbGrid1.Canvas.FillRect(Rect);
      DbGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
    end else begin
      if UpperCase( DBGrid1.DataSource.DataSet.FieldByName('fcr_status').Text ) = 'LIQ' then begin
          DbGrid1.Canvas.Brush.Color  := Marrom_Escuro;
          DbGrid1.Canvas.Font.Color   := Branco;
          DbGrid1.Canvas.FillRect(Rect);
          DbGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
      end Else Begin

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

end;

procedure Tfrmctapg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sqlNew.Close;
    dmEmp.clicaixa.Close;
    frmctapg                     := nil ;
    action                       := cafree;
    fPrincipal.btnctapg.Enabled  := True;
end;



procedure Tfrmctapg.FormCreate(Sender: TObject);
Var
i, nPar: Integer;
fcr_tipdoc: TEdit;

begin

  cPre                        := 'cfr_';
  cTabela                     := 'financecab';
  acampo                      := 1;
  sqlNew                      := TFDQuery.Create(nil);
  sqlNew.Connection           := dmEmp.SqlConSis;
  fPrincipal.btnctapg.Enabled := False;
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;
  cfr_totpar.Clear;
  if Length( cfgTOTPAR ) <= 0 then Begin
     ShowMessage('Necessário Configurar numero de parcelas');
     cfr_totpar.Items.Add('1');
  End
  Else Begin

      for i := 1 to StrToInt(cfgTOTPAR) do begin
          cfr_totpar.Items.Add(IntToStr(i))
      end;
  End;

  cfr_totpar.ItemIndex := 0;
  cSqlGridMov := sqlParcela.SQL.Text;

end;
procedure Tfrmctapg.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure Tfrmctapg.FormShow(Sender: TObject);
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
  lbCabeca01.Caption    := 'Contas à Pagar';
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
  regrehgrid;

end;

procedure Tfrmctapg.gravadados;
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, ctip_horalt,cCodSql, cIteSql,cValSql,cCodMnt : string ;
dData, dtip_datalt : TDate ;
i, tmp: Integer;
qSql1, qSql2 : TFDQuery ;
cTipLan, cTipPro, cNumPar, cNumAnt : String;
valor : Double;

begin
    if nNew = 0 then Begin
        gravadados2(cTabela,cPre,cPre+'codigo','X','', nNew, frmctapg, dmEmp.SqlConSis, aEdits );
    End Else Begin
        Try
          IniTransacao;
          cTipLan := 'LAN';
          cTipPro := 'CXA';
          cNumPar := cfr_totpar.Text;
          cNumAnt  := IntToStr( strtoint( PegaUltCodSalvo( cTabela, 'cfr_codigo', 'cfr_' ) ) + 1 );
          if StrToInt( cfr_totpar.Text ) > 1 then Begin
              cTipLan := 'PRC';
              cTipPro := 'CAB';
              cNumPar := '0';
          End;

          qSql1 := TFDQuery.Create(nil);
          qSql2 := TFDQuery.Create(nil);
          qSql2.Connection := dmEmp.SqlConSis;
          qSql1.Connection := dmEmp.SqlConSis;
          qSql1.Close;
          qSql1.SQL.Text   := 'Insert Into '+U_funcao.SelSchema('financecab')+
                                          '( cfr_NumDoc, cfr_codant, cfr_codfnd, cfr_codpss, cfr_codpct, cfr_codcli, '+
                                          '  cfr_descri, cfr_DatEms, cfr_DatVen, cfr_TotPar, cfr_TipDoc, cfr_period, '+
                                          '  cfr_vlrApg, cfr_vlrDes, cfr_vlrAcr, cfr_vlrTot, cfr_UsuInc, cfr_DatInc, cfr_HorInc ) Values  '+
                                         '( :cfr_NumDoc, :cfr_codant, :cfr_codfnd, :cfr_codpss, :cfr_codpct, :cfr_codcli, '+
                                          ' :cfr_descri, :cfr_DatEms, :cfr_DatVen, :cfr_TotPar, :cfr_TipDoc, :cfr_period,  '+
                                          ' :cfr_vlrApg, :cfr_vlrDes, :cfr_vlrAcr, :cfr_vlrTot, :cfr_UsuInc, :cfr_DatInc, :cfr_HorInc ) ';
          qSql1.ParamByName('cfr_NumDoc').Text     := cfr_NumDoc.Text ;
          qSql1.ParamByName('cfr_codant').Text     := '0' ;
          qSql1.ParamByName('cfr_codfnd').Value    := fIIF( cfr_codfnd.Enabled, cfr_codfnd.Text, NULL );
          qSql1.ParamByName('cfr_codcli').Value    := fIIF( cfr_codcli.Enabled, cfr_codcli.Text, NULL );
          qSql1.ParamByName('cfr_codpss').Value    := fIIF( cfr_codpss.Text <>'', cfr_codpss.Text, NULL );
          qSql1.ParamByName('cfr_codpct').Value    := cfr_codpct.Text ;
          qSql1.ParamByName('cfr_descri').Text     := cfr_descri.Text ;
          qSql1.ParamByName('cfr_DatEms').AsDate   := cfr_DatEms.Date ;
          qSql1.ParamByName('cfr_DatVen').AsDate   := cfr_DatVen.Date ;
          qSql1.ParamByName('cfr_TotPar').Text     := cfr_totpar.Text ;
          qSql1.ParamByName('cfr_TipDoc').Text     := fIIF(cfr_tipdoc.ItemIndex = 0, 'D','C' ) ;
          qSql1.ParamByName('cfr_period').Text     := Copy( BoolToStr( cfr_period.Checked ),1,1);
          qSql1.ParamByName('cfr_vlrApg').Text     := RmCharValor( cfr_vlrApg.Text );
          qSql1.ParamByName('cfr_vlrDes').Text     := '0';
          qSql1.ParamByName('cfr_vlrAcr').Text     := '0';
          qSql1.ParamByName('cfr_vlrTot').Text     := RmCharValor( cfr_vlrApg.Text );
          qSql1.ParamByName('cfr_UsuInc').Text     := sysUsuario;
          qSql1.ParamByName('cfr_DatInc').AsDate   := Now;
          qSql1.ParamByName('cfr_HorInc').Text     := TimeToStr(Now);
          qSql1.ExecSQL;

            // Grava as parcelas
           cNumAnt  := PegaUltCodSalvo( cTabela, 'cfr_codigo', 'cfr_' );
           cTipLan  := 'LAN';
           cTipPro  := 'CXA';
           For i := 1 to StrToInt(cfr_totpar.Text) do begin
                    qSql1.Connection := dmEmp.SqlConSis;
                    qSql1.Close;
                    qSql1.SQL.Text   := 'Insert Into '+U_funcao.SelSchema('financeiro')+
                                                    '( fcr_descri,  fcr_DatVen,  fcr_NumPar,  fcr_Status,  fcr_tippro,  fcr_codcfr, '+
                                                    '  fcr_vlrApg,  fcr_UsuInc,  fcr_DatInc,  fcr_HorInc ) Values  '+
                                                   '( :fcr_descri, :fcr_DatVen, :fcr_NumPar, :fcr_Status, :fcr_tippro, :fcr_codcfr, '+
                                                    ' :fcr_vlrApg, :fcr_UsuInc, :fcr_DatInc, :fcr_HorInc ) ';
                    qSql1.ParamByName('fcr_descri').Text     := '[Pc '+Trim(IntToStr(i))+'/'+Trim(cfr_totpar.Text)+'] '+cfr_descri.Text ;
                    qSql1.ParamByName('fcr_DatVen').AsDate   := IncMonth(cfr_DatVen.Date,(i-1));   ;
                    qSql1.ParamByName('fcr_NumPar').Text     := IntToStr(i);
                    qSql1.ParamByName('fcr_Status').Text     := cTipPro;
                    qSql1.ParamByName('fcr_tippro').Text     := cTipLan;
                    qSql1.ParamByName('fcr_codcfr').Text     := cNumAnt;
                    qSql1.ParamByName('fcr_vlrApg').AsFloat  := ( RetMoeda( cfr_vlrApg.Text ) / strtoint( cfr_totpar.Text ) ) ;
                    qSql1.ParamByName('fcr_UsuInc').Text     :=  sysUsuario;
                    qSql1.ParamByName('fcr_DatInc').AsDate   := Now;
                    qSql1.ParamByName('fcr_HorInc').Text     := TimeToStr(Now);
                    qSql1.ExecSQL;

           end;

          FimTransacao

        except
          on E : Exception do begin
              RollBack;
              ShowMessage('Erro '+E.Message);
          end;
        End;

    End;
end;

procedure Tfrmctapg.limpaget;
Var
i: Integer;
begin
  limpaget2(aEdits);
end;

procedure Tfrmctapg.navegacao(Ord: Integer);
begin
  if btnGrava.Enabled then
     Exit;

  navegacao2( Ord, acampo, btnIni, btnAnt, btnProx, btnUlt, sqlNew, dmemp.sqlctapg, cfr_codigo,'' );
  acampo := 0;
  RefreshDialog2(cPre,acampo, frmctapg, sqlNew, aEdits);
  acampo := 1;
  regrehgrid;
  pegatpcnt;
  ativaconta;

end;
procedure Tfrmctapg.ativaconta;
begin
  btnAlterar.Enabled := chkcontas;
  btnExcluir.Enabled := chkcontas;
end;

Function Tfrmctapg.chkcontas: Boolean;
Var
c: String;
qrStr :TFDQuery;
begin
  c :=' SELECT cfr_codigo, (Select count(*) from '+U_funcao.SelSchema('financeiro')+' where fcr_codcfr = cfr_codigo ) as reg, '
     +' cfr_vlrtot as apagar, (Select sum(fcr_vlrpag) from '+U_funcao.SelSchema('financeiro')+' where fcr_codcfr = cfr_codigo ) as pago from '+U_funcao.SelSchema('financecab')
     +' where cfr_codigo = '+cfr_codigo.Text;

  qrStr := TFDQuery.Create(nil);
  qrStr.Close;
  qrStr.Connection := dmEmp.SqlConSis;
  qrStr.SQL.Text   := c;
  qrStr.Open;
  Result := qrStr.FieldByName('pago').IsNull;

end;

procedure Tfrmctapg.RefreshDados(tipo: String);
var
  i: integer;
  cWhere, cQuery, cOrder: String;

begin
  RefreshDados2(acampo, tipo, '', cfr_codigo, sqlNew, dmEmp.sqlctapg );
end;

procedure Tfrmctapg.RefreshDialog;
var
  i, tmp: Integer;
  frmx : TForm ;
begin
  RefreshDialog2(cPre,acampo, frmctapg, sqlNew, aEdits);
end;

procedure Tfrmctapg.regrehgrid;
begin
  sqlParcela.Close;
  cliParcela.Close;
  sqlParcela.Close;
  sqlParcela.SQL.Text := cSqlGridMov+' Where  fcr_tippro <> '+QuotedStr('PRC')+' and fcr_codcfr = '+ fIIF( Length( trim(cfr_codigo.Text)) > 0, cfr_codigo.Text, '0')+' order by fcr_codigo ';
  sqlParcela.Open;
  CliParcela.Active := True;
end;

procedure Tfrmctapg.ToolButton9Click(Sender: TObject);
begin
  frmCalculadora := TfrmCalculadora.Create(Self);
  frmCalculadora.Show;

end;

procedure Tfrmctapg.ativaButoes(tipo:Integer);
begin
  ativaButoes2(Tipo,  btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt, sqlNew);
end;

procedure Tfrmctapg.ativaget;
begin
  ativaget2(aEdits,cPre+'codigo',cTabela, btnGrava.Enabled, lMostra );
end;


procedure Tfrmctapg.btnAlterarExecute(Sender: TObject);
begin
   btnNovo.Enabled    := False;
   btnAlterar.Enabled := False;
   btnGrava.Enabled   := True;
   ativaButoes(1);
   lMostra := True;
   ativaget;
   acampo := 0;
   nNew   := acampo;
   RefreshDialog;
   cfr_datems.SetFocus;
   navegacao(0);

end;

procedure Tfrmctapg.btnAntExecute(Sender: TObject);
begin
  navegacao(2);
end;

procedure Tfrmctapg.btnCancelaExecute(Sender: TObject);
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

   cfr_codigo.SetFocus;

end;

procedure Tfrmctapg.btnExcluirExecute(Sender: TObject);
Var
aSubTab : TArrayDim2;
n: Integer;
Autoriza: TfrmAutoiza;
begin
   Autoriza  := TfrmAutoiza.Create;
   iF Autoriza.Autorizar(Screen.ActiveForm.Caption, cfr_codigo.Text, 'Excluir' ) then Begin
       SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'financeiro';     aSubTab[n][1] := 'fcr_codcfr';
       If Exclui2(cTabela, aSubTab,  cfr_codigo, btnExcluir) Then Begin;
           RefreshDados('T');
           ativaButoes(1);
           limpaget;
           lMostra := True;
           ativaget;
           navegacao(4);
           acampo := 1;
           nNew   := acampo;
       End;
   End;
end;

procedure Tfrmctapg.btnGravaExecute(Sender: TObject);
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
   cfr_codigo.SetFocus;
end;

procedure Tfrmctapg.btnIniExecute(Sender: TObject);
begin
  navegacao(1);
end;

procedure Tfrmctapg.btnNovoExecute(Sender: TObject);
begin
   acampo := 1;
   nNew   := acampo;
   btnGrava.Enabled := True;
   RefreshDados('S');
   limpaget;
   ativaButoes(1);
   lMostra := False;
   ativaget;
   cfr_tipdoc.SetFocus;
   regrehgrid;
end;

procedure Tfrmctapg.btnProxExecute(Sender: TObject);
begin
  navegacao(3);
end;

procedure Tfrmctapg.btnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure Tfrmctapg.btnUltExecute(Sender: TObject);
begin
  navegacao(4);
end;

procedure Tfrmctapg.cfr_codcliExit(Sender: TObject);
begin
  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlcliente ;
  edNomCli.Text      :=  Pesquisa.Relacao('cliente',cfr_codcli,'cli_codigo','cli_nome');
  cfr_codfnd.Enabled := ( cfr_codcli.Text = '');
end;

procedure Tfrmctapg.cfr_codcliKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      cfr_codcliRightButtonClick(Self);
  end;
Finally

End;

end;

procedure Tfrmctapg.cfr_codcliRightButtonClick(Sender: TObject);
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

  Pesquisa.acessa(cfr_codcli);
  cfr_codcli.text   :=  Pesquisa.RecReg('cli_codigo');
  edNomCli.text     :=  Pesquisa.RecReg('cli_nome');
  Pesquisa.Destroy;


end;

procedure Tfrmctapg.pegatpcnt;
begin
  If Copy(cfr_tipdoc.text,1,1) = 'D' Then begin
     cfr_tipdoc.ItemIndex := 0;
  end Else
  If Copy(cfr_tipdoc.text,1,1) = 'C' Then begin
     cfr_tipdoc.ItemIndex := 1;
  end Else begin
     cfr_tipdoc.ItemIndex := 0;
  end;

end;

initialization
  RegisterClass(Tfrmctapg);


end.
