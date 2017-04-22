unit U_baixacnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, ImgList, ExtCtrls, ComCtrls, xmldom,
  XMLIntf, IdHTTP, msxmldom, XMLDoc, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, ExtDlgs, RibbonLunaStyleActnCtrls,
  ToolWin, ActnMan, ActnCtrls, jpeg, edittuning, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, U_ClasseUtil,U_Classcons, ZDataset, ZDatasetUtils,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, U_ClassCad, Datasnap.DBClient,
  Datasnap.Provider, ZAbstractRODataset, ZAbstractDataset, System.DateUtils,
  System.ImageList, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client ;


type
  TfrmBaixaCnt = class(TForm)
    StatusBar1: TStatusBar;
    Banner: TPanel;
    imgLogo: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edNomCxa: TEdit;
    Label7: TLabel;
    Label2: TLabel;
    btnAbr: TButton;
    btnFch: TButton;
    edSenha: TEdit;
    edCodCxa: TEdit;
    grupo01: TGroupBox;
    cmbMod: TComboBox;
    cmbOpe: TComboBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edCodBco: TEdit;
    Label12: TLabel;
    edNomBco: TEdit;
    Label13: TLabel;
    edNomAge: TEdit;
    Label14: TLabel;
    edNomCta: TEdit;
    Label15: TLabel;
    ImageList1: TImageList;
    cct_codcct: TButtonedEdit;
    cmbPesqui: TComboBox;
    Label16: TLabel;
    edPesq: TEdit;
    Label3: TLabel;
    edDatIni: TEdit;
    edDatFin: TEdit;
    edHorFin: TEdit;
    edHorIni: TEdit;
    edSaldoAtu: TEdit;
    edSaldoAnt: TEdit;
    gridBaixa: TDBGrid;
    dspParcela: TDataSetProvider;
    cliParcela: TClientDataSet;
    dsParcela: TDataSource;
    datini: TDateTimePicker;
    Label18: TLabel;
    datfin: TDateTimePicker;
    Label5: TLabel;
    Label6: TLabel;
    GroupBox2: TGroupBox;
    btnBaixa: TButton;
    edVlrBaixar: TEdit;
    Label4: TLabel;
    Label8: TLabel;
    dDatEms: TLabel;
    cFavore: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    cCodPct: TLabel;
    cDescri: TLabel;
    Label25: TLabel;
    dDatVen: TLabel;
    Label27: TLabel;
    nVlrApg: TLabel;
    Label29: TLabel;
    nVlrPag: TLabel;
    Label31: TLabel;
    nJuros: TLabel;
    Label33: TLabel;
    nDesco: TLabel;
    Label35: TLabel;
    cTipCnt: TLabel;
    nNumDoc: TLabel;
    Label19: TLabel;
    Label17: TLabel;
    cBanco: TLabel;
    Label23: TLabel;
    cAgencia: TLabel;
    cConta: TLabel;
    Label28: TLabel;
    Label22: TLabel;
    cStatus: TLabel;
    btnSelAll: TButton;
    Label24: TLabel;
    cBoleto: TLabel;
    sqlParcela: TFDQuery;
    sqlParcelafcr_codigo: TIntegerField;
    sqlParcelafcr_codcfr: TIntegerField;
    sqlParcelafcr_codcxa: TIntegerField;
    sqlParcelafcr_codabc: TIntegerField;
    sqlParcelafcr_codcct: TIntegerField;
    sqlParcelafcr_codfpg: TIntegerField;
    sqlParcelafcr_datpag: TDateField;
    sqlParcelafcr_datven: TDateField;
    sqlParcelafcr_numpar: TStringField;
    sqlParcelafcr_descri: TStringField;
    sqlParcelafcr_status: TStringField;
    sqlParcelafcr_tippro: TStringField;
    sqlParcelafcr_vlrapg: TBCDField;
    sqlParcelafcr_vlrpag: TBCDField;
    sqlParcelafcr_check: TBooleanField;
    sqlParcelafcr_numbol: TStringField;
    sqlParcelafcr_usuinc: TStringField;
    sqlParcelafcr_datinc: TDateField;
    sqlParcelafcr_horinc: TStringField;
    sqlParcelafcr_usualt: TStringField;
    sqlParcelafcr_datalt: TDateField;
    sqlParcelafcr_horalt: TStringField;
    sqlParcelacxa_codigo: TIntegerField;
    sqlParcelacxa_codcct: TIntegerField;
    sqlParcelacxa_codusu: TIntegerField;
    sqlParcelacxa_ativo: TStringField;
    sqlParcelacxa_usuinc: TStringField;
    sqlParcelacxa_datinc: TDateField;
    sqlParcelacxa_horinc: TStringField;
    sqlParcelacxa_usualt: TStringField;
    sqlParcelacxa_datalt: TDateField;
    sqlParcelacxa_horalt: TStringField;
    sqlParcelaabc_codigo: TIntegerField;
    sqlParcelaabc_codcxa: TIntegerField;
    sqlParcelaabc_codcct: TIntegerField;
    sqlParcelaabc_databr: TDateField;
    sqlParcelaabc_datfch: TDateField;
    sqlParcelaabc_vlrini: TBCDField;
    sqlParcelaabc_vlrant: TBCDField;
    sqlParcelaabc_vlratu: TBCDField;
    sqlParcelaabc_usuinc: TStringField;
    sqlParcelaabc_datinc: TDateField;
    sqlParcelaabc_horinc: TStringField;
    sqlParcelaabc_usualt: TStringField;
    sqlParcelaabc_datalt: TDateField;
    sqlParcelaabc_horalt: TStringField;
    sqlParcelacct_codigo: TIntegerField;
    sqlParcelacct_codbco: TStringField;
    sqlParcelacct_agencia: TStringField;
    sqlParcelacct_nrconta: TStringField;
    sqlParcelacct_codpcd: TStringField;
    sqlParcelacct_codpcc: TStringField;
    sqlParcelacct_telef1: TStringField;
    sqlParcelacct_telef2: TStringField;
    sqlParcelacct_celula: TStringField;
    sqlParcelacct_usuinc: TStringField;
    sqlParcelacct_datinc: TDateField;
    sqlParcelacct_horinc: TStringField;
    sqlParcelacct_usualt: TStringField;
    sqlParcelacct_datalt: TDateField;
    sqlParcelacct_horalt: TStringField;
    sqlParcelabco_codigo: TStringField;
    sqlParcelabco_nome: TStringField;
    sqlParcelabco_usuinc: TStringField;
    sqlParcelabco_datinc: TDateField;
    sqlParcelabco_horinc: TStringField;
    sqlParcelabco_usualt: TStringField;
    sqlParcelabco_datalt: TDateField;
    sqlParcelabco_horalt: TStringField;
    sqlParcelafpg_codigo: TIntegerField;
    sqlParcelafpg_nome: TStringField;
    sqlParcelafpg_codpct: TStringField;
    sqlParcelafpg_acao: TStringField;
    sqlParcelafpg_parcela: TStringField;
    sqlParcelafpg_pctdesc: TBCDField;
    sqlParcelafpg_pctacre: TBCDField;
    sqlParcelafpg_usuinc: TStringField;
    sqlParcelafpg_datinc: TDateField;
    sqlParcelafpg_horinc: TStringField;
    sqlParcelafpg_usualt: TStringField;
    sqlParcelafpg_datalt: TDateField;
    sqlParcelafpg_horalt: TStringField;
    sqlParcelacfr_codigo: TIntegerField;
    sqlParcelacfr_numdoc: TStringField;
    sqlParcelacfr_codant: TIntegerField;
    sqlParcelacfr_codfnd: TIntegerField;
    sqlParcelacfr_codpss: TIntegerField;
    sqlParcelacfr_codcli: TIntegerField;
    sqlParcelacfr_codpct: TStringField;
    sqlParcelacfr_descri: TStringField;
    sqlParcelacfr_datems: TDateField;
    sqlParcelacfr_datven: TDateField;
    sqlParcelacfr_totpar: TStringField;
    sqlParcelacfr_vlrapg: TBCDField;
    sqlParcelacfr_vlrdes: TBCDField;
    sqlParcelacfr_vlracr: TBCDField;
    sqlParcelacfr_vlrtot: TBCDField;
    sqlParcelacfr_period: TStringField;
    sqlParcelacfr_tipdoc: TStringField;
    sqlParcelacfr_usuinc: TStringField;
    sqlParcelacfr_datinc: TDateField;
    sqlParcelacfr_horinc: TStringField;
    sqlParcelacfr_usualt: TStringField;
    sqlParcelacfr_datalt: TDateField;
    sqlParcelacfr_horalt: TStringField;
    sqlParcelafnd_codigo: TIntegerField;
    sqlParcelafnd_ativo: TStringField;
    sqlParcelafnd_nome: TStringField;
    sqlParcelafnd_rsocial: TStringField;
    sqlParcelafnd_tipopes: TStringField;
    sqlParcelafnd_cpfcnpj: TStringField;
    sqlParcelafnd_codpct: TStringField;
    sqlParcelafnd_endereco: TStringField;
    sqlParcelafnd_numend: TStringField;
    sqlParcelafnd_complem: TStringField;
    sqlParcelafnd_bairro: TStringField;
    sqlParcelafnd_cep: TStringField;
    sqlParcelafnd_codcid: TIntegerField;
    sqlParcelafnd_telef1: TStringField;
    sqlParcelafnd_telef2: TStringField;
    sqlParcelafnd_celula: TStringField;
    sqlParcelafnd_obs: TMemoField;
    sqlParcelafnd_usuinc: TStringField;
    sqlParcelafnd_datinc: TDateField;
    sqlParcelafnd_horinc: TStringField;
    sqlParcelafnd_usualt: TStringField;
    sqlParcelafnd_datalt: TDateField;
    sqlParcelafnd_horalt: TStringField;
    sqlParcelapss_codigo: TIntegerField;
    sqlParcelapss_nome: TStringField;
    sqlParcelapss_apelido: TStringField;
    sqlParcelapss_codcgo: TIntegerField;
    sqlParcelapss_codltd: TIntegerField;
    sqlParcelapss_datnas: TDateField;
    sqlParcelapss_sexo: TStringField;
    sqlParcelapss_ecivil: TStringField;
    sqlParcelapss_tpsangue: TStringField;
    sqlParcelapss_nompal: TStringField;
    sqlParcelapss_nommae: TStringField;
    sqlParcelapss_cpf: TStringField;
    sqlParcelapss_rg: TStringField;
    sqlParcelapss_rgexped: TStringField;
    sqlParcelapss_rgdata: TDateField;
    sqlParcelapss_pispasep: TStringField;
    sqlParcelapss_numctps: TStringField;
    sqlParcelapss_habilitac: TStringField;
    sqlParcelapss_hbemite: TDateField;
    sqlParcelapss_hbvalid: TDateField;
    sqlParcelapss_hbcateg: TStringField;
    sqlParcelapss_nrtitulo: TStringField;
    sqlParcelapss_nrreserv: TStringField;
    sqlParcelapss_cep: TStringField;
    sqlParcelapss_endereco: TStringField;
    sqlParcelapss_complem: TStringField;
    sqlParcelapss_numres: TStringField;
    sqlParcelapss_bairro: TStringField;
    sqlParcelapss_codcid: TIntegerField;
    sqlParcelapss_tpimove: TStringField;
    sqlParcelapss_tpresid: TStringField;
    sqlParcelapss_telef01: TStringField;
    sqlParcelapss_telef02: TStringField;
    sqlParcelapss_celular: TStringField;
    sqlParcelapss_email: TStringField;
    sqlParcelapss_status: TStringField;
    sqlParcelapss_foto: TBlobField;
    sqlParcelapss_obs: TMemoField;
    sqlParcelapss_vlrrenda: TBCDField;
    sqlParcelapss_vlrvale: TBCDField;
    sqlParcelapss_datcmp: TDateField;
    sqlParcelapss_nfecmp: TStringField;
    sqlParcelapss_codpcv: TStringField;
    sqlParcelapss_codpcr: TStringField;
    sqlParcelapss_usuinc: TStringField;
    sqlParcelapss_datinc: TDateField;
    sqlParcelapss_horinc: TStringField;
    sqlParcelapss_usualt: TStringField;
    sqlParcelapss_datalt: TDateField;
    sqlParcelapss_horalt: TStringField;
    sqlParcelapct_codigo: TStringField;
    sqlParcelapct_cntmae: TStringField;
    sqlParcelapct_nome: TStringField;
    sqlParcelapct_natureza: TStringField;
    sqlParcelapct_tipo: TStringField;
    sqlParcelapct_limite: TBCDField;
    sqlParcelapct_meta: TBCDField;
    sqlParcelapct_ord: TBCDField;
    sqlParcelapct_usuinc: TStringField;
    sqlParcelapct_datinc: TDateField;
    sqlParcelapct_horinc: TStringField;
    sqlParcelapct_usualt: TStringField;
    sqlParcelapct_datalt: TDateField;
    sqlParcelapct_horalt: TStringField;
    sqlParcelaparcelas: TMemoField;
    cliParcelafcr_codigo: TIntegerField;
    cliParcelafcr_codcfr: TIntegerField;
    cliParcelafcr_codcxa: TIntegerField;
    cliParcelafcr_codabc: TIntegerField;
    cliParcelafcr_codcct: TIntegerField;
    cliParcelafcr_codfpg: TIntegerField;
    cliParcelafcr_datpag: TDateField;
    cliParcelafcr_datven: TDateField;
    cliParcelafcr_numpar: TStringField;
    cliParcelafcr_descri: TStringField;
    cliParcelafcr_status: TStringField;
    cliParcelafcr_tippro: TStringField;
    cliParcelafcr_vlrapg: TBCDField;
    cliParcelafcr_vlrpag: TBCDField;
    cliParcelafcr_check: TBooleanField;
    cliParcelafcr_numbol: TStringField;
    cliParcelafcr_usuinc: TStringField;
    cliParcelafcr_datinc: TDateField;
    cliParcelafcr_horinc: TStringField;
    cliParcelafcr_usualt: TStringField;
    cliParcelafcr_datalt: TDateField;
    cliParcelafcr_horalt: TStringField;
    cliParcelacxa_codigo: TIntegerField;
    cliParcelacxa_codcct: TIntegerField;
    cliParcelacxa_codusu: TIntegerField;
    cliParcelacxa_ativo: TStringField;
    cliParcelacxa_usuinc: TStringField;
    cliParcelacxa_datinc: TDateField;
    cliParcelacxa_horinc: TStringField;
    cliParcelacxa_usualt: TStringField;
    cliParcelacxa_datalt: TDateField;
    cliParcelacxa_horalt: TStringField;
    cliParcelaabc_codigo: TIntegerField;
    cliParcelaabc_codcxa: TIntegerField;
    cliParcelaabc_codcct: TIntegerField;
    cliParcelaabc_databr: TDateField;
    cliParcelaabc_datfch: TDateField;
    cliParcelaabc_vlrini: TBCDField;
    cliParcelaabc_vlrant: TBCDField;
    cliParcelaabc_vlratu: TBCDField;
    cliParcelaabc_usuinc: TStringField;
    cliParcelaabc_datinc: TDateField;
    cliParcelaabc_horinc: TStringField;
    cliParcelaabc_usualt: TStringField;
    cliParcelaabc_datalt: TDateField;
    cliParcelaabc_horalt: TStringField;
    cliParcelacct_codigo: TIntegerField;
    cliParcelacct_codbco: TStringField;
    cliParcelacct_agencia: TStringField;
    cliParcelacct_nrconta: TStringField;
    cliParcelacct_codpcd: TStringField;
    cliParcelacct_codpcc: TStringField;
    cliParcelacct_telef1: TStringField;
    cliParcelacct_telef2: TStringField;
    cliParcelacct_celula: TStringField;
    cliParcelacct_usuinc: TStringField;
    cliParcelacct_datinc: TDateField;
    cliParcelacct_horinc: TStringField;
    cliParcelacct_usualt: TStringField;
    cliParcelacct_datalt: TDateField;
    cliParcelacct_horalt: TStringField;
    cliParcelabco_codigo: TStringField;
    cliParcelabco_nome: TStringField;
    cliParcelabco_usuinc: TStringField;
    cliParcelabco_datinc: TDateField;
    cliParcelabco_horinc: TStringField;
    cliParcelabco_usualt: TStringField;
    cliParcelabco_datalt: TDateField;
    cliParcelabco_horalt: TStringField;
    cliParcelafpg_codigo: TIntegerField;
    cliParcelafpg_nome: TStringField;
    cliParcelafpg_codpct: TStringField;
    cliParcelafpg_acao: TStringField;
    cliParcelafpg_parcela: TStringField;
    cliParcelafpg_pctdesc: TBCDField;
    cliParcelafpg_pctacre: TBCDField;
    cliParcelafpg_usuinc: TStringField;
    cliParcelafpg_datinc: TDateField;
    cliParcelafpg_horinc: TStringField;
    cliParcelafpg_usualt: TStringField;
    cliParcelafpg_datalt: TDateField;
    cliParcelafpg_horalt: TStringField;
    cliParcelacfr_codigo: TIntegerField;
    cliParcelacfr_numdoc: TStringField;
    cliParcelacfr_codant: TIntegerField;
    cliParcelacfr_codfnd: TIntegerField;
    cliParcelacfr_codpss: TIntegerField;
    cliParcelacfr_codcli: TIntegerField;
    cliParcelacfr_codpct: TStringField;
    cliParcelacfr_descri: TStringField;
    cliParcelacfr_datems: TDateField;
    cliParcelacfr_datven: TDateField;
    cliParcelacfr_totpar: TStringField;
    cliParcelacfr_vlrapg: TBCDField;
    cliParcelacfr_vlrdes: TBCDField;
    cliParcelacfr_vlracr: TBCDField;
    cliParcelacfr_vlrtot: TBCDField;
    cliParcelacfr_period: TStringField;
    cliParcelacfr_tipdoc: TStringField;
    cliParcelacfr_usuinc: TStringField;
    cliParcelacfr_datinc: TDateField;
    cliParcelacfr_horinc: TStringField;
    cliParcelacfr_usualt: TStringField;
    cliParcelacfr_datalt: TDateField;
    cliParcelacfr_horalt: TStringField;
    cliParcelafnd_codigo: TIntegerField;
    cliParcelafnd_ativo: TStringField;
    cliParcelafnd_nome: TStringField;
    cliParcelafnd_rsocial: TStringField;
    cliParcelafnd_tipopes: TStringField;
    cliParcelafnd_cpfcnpj: TStringField;
    cliParcelafnd_codpct: TStringField;
    cliParcelafnd_endereco: TStringField;
    cliParcelafnd_numend: TStringField;
    cliParcelafnd_complem: TStringField;
    cliParcelafnd_bairro: TStringField;
    cliParcelafnd_cep: TStringField;
    cliParcelafnd_codcid: TIntegerField;
    cliParcelafnd_telef1: TStringField;
    cliParcelafnd_telef2: TStringField;
    cliParcelafnd_celula: TStringField;
    cliParcelafnd_obs: TMemoField;
    cliParcelafnd_usuinc: TStringField;
    cliParcelafnd_datinc: TDateField;
    cliParcelafnd_horinc: TStringField;
    cliParcelafnd_usualt: TStringField;
    cliParcelafnd_datalt: TDateField;
    cliParcelafnd_horalt: TStringField;
    cliParcelapss_codigo: TIntegerField;
    cliParcelapss_nome: TStringField;
    cliParcelapss_apelido: TStringField;
    cliParcelapss_codcgo: TIntegerField;
    cliParcelapss_codltd: TIntegerField;
    cliParcelapss_datnas: TDateField;
    cliParcelapss_sexo: TStringField;
    cliParcelapss_ecivil: TStringField;
    cliParcelapss_tpsangue: TStringField;
    cliParcelapss_nompal: TStringField;
    cliParcelapss_nommae: TStringField;
    cliParcelapss_cpf: TStringField;
    cliParcelapss_rg: TStringField;
    cliParcelapss_rgexped: TStringField;
    cliParcelapss_rgdata: TDateField;
    cliParcelapss_pispasep: TStringField;
    cliParcelapss_numctps: TStringField;
    cliParcelapss_habilitac: TStringField;
    cliParcelapss_hbemite: TDateField;
    cliParcelapss_hbvalid: TDateField;
    cliParcelapss_hbcateg: TStringField;
    cliParcelapss_nrtitulo: TStringField;
    cliParcelapss_nrreserv: TStringField;
    cliParcelapss_cep: TStringField;
    cliParcelapss_endereco: TStringField;
    cliParcelapss_complem: TStringField;
    cliParcelapss_numres: TStringField;
    cliParcelapss_bairro: TStringField;
    cliParcelapss_codcid: TIntegerField;
    cliParcelapss_tpimove: TStringField;
    cliParcelapss_tpresid: TStringField;
    cliParcelapss_telef01: TStringField;
    cliParcelapss_telef02: TStringField;
    cliParcelapss_celular: TStringField;
    cliParcelapss_email: TStringField;
    cliParcelapss_status: TStringField;
    cliParcelapss_foto: TBlobField;
    cliParcelapss_obs: TMemoField;
    cliParcelapss_vlrrenda: TBCDField;
    cliParcelapss_vlrvale: TBCDField;
    cliParcelapss_datcmp: TDateField;
    cliParcelapss_nfecmp: TStringField;
    cliParcelapss_codpcv: TStringField;
    cliParcelapss_codpcr: TStringField;
    cliParcelapss_usuinc: TStringField;
    cliParcelapss_datinc: TDateField;
    cliParcelapss_horinc: TStringField;
    cliParcelapss_usualt: TStringField;
    cliParcelapss_datalt: TDateField;
    cliParcelapss_horalt: TStringField;
    cliParcelapct_codigo: TStringField;
    cliParcelapct_cntmae: TStringField;
    cliParcelapct_nome: TStringField;
    cliParcelapct_natureza: TStringField;
    cliParcelapct_tipo: TStringField;
    cliParcelapct_limite: TBCDField;
    cliParcelapct_meta: TBCDField;
    cliParcelapct_ord: TBCDField;
    cliParcelapct_usuinc: TStringField;
    cliParcelapct_datinc: TDateField;
    cliParcelapct_horinc: TStringField;
    cliParcelapct_usualt: TStringField;
    cliParcelapct_datalt: TDateField;
    cliParcelapct_horalt: TStringField;
    cliParcelaparcelas: TMemoField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure limpatela;
    procedure gridBaixaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure refrescagrids;
    procedure edCodCxaExit(Sender: TObject);
    procedure refrescaGrupo;
    procedure btnAbrClick(Sender: TObject);
    procedure btnFchClick(Sender: TObject);
    PROCEDURE PegaQuery;
    procedure cmbModChange(Sender: TObject);
    procedure cmbOpeChange(Sender: TObject);
    procedure datiniChange(Sender: TObject);
    procedure datfinChange(Sender: TObject);
    procedure cct_codcctRightButtonClick(Sender: TObject);
    procedure cct_codcctKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cct_codcctExit(Sender: TObject);
    procedure edPesqChange(Sender: TObject);
    procedure btnBaixaClick(Sender: TObject);
    procedure gridBaixaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsParcelaDataChange(Sender: TObject; Field: TField);
    procedure btnSelAllClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    wEmpresa, wUsuInc, wHorInc, wUsuAlt, wHorAlt : string ;
    wDatInc, wDatAlt : Tdate;
    nNew, nRecno:  Integer;
  public
    acampo, nTrans: integer;
    aberto, lMostra: Boolean;
    Util: TClasseUtil;
    Pesquisa : TClasConsulta;
    sqlNew    : TFDQuery;
    cQueryPad : String;
    aEdits : TArrayComp;
    cPre, cTabela,cWhere, cPesq, cCodAbc: String;


    { Public declarations }
  end;

var
  frmBaixaCnt: TfrmBaixaCnt;
  modConsulta, nOrdem : integer;
  cCodUsu, cSqlGridMov,cSqlGridCxa  : String;
  nVlrAnt, nVlrAtu : Real;
  lSelTodos: Boolean;



implementation

uses  UCalculadora,  u_DmEmp, uSistema, U_funcao, U_CnpjClass;

{$R *.dfm}


procedure TfrmBaixaCnt.btnAbrClick(Sender: TObject);
begin
    if Not ValidaUsu(cCodUsu,edSenha.Text) then Begin
       ShowMessage('Senha Invalida' );
       edSenha.SetFocus;
       Exit;
    End;
    btnFch.enabled := True;
    btnabr.Enabled := False;
    refrescaGrupo;
    refrescagrids;
    cmbOpe.SetFocus;

end;

procedure TfrmBaixaCnt.btnFchClick(Sender: TObject);
begin
  btnFch.Enabled := False;
  btnAbr.Enabled := True;
  refrescaGrupo;
  limpatela;
end;

procedure TfrmBaixaCnt.btnSelAllClick(Sender: TObject);
Var
qSql : TFDQuery;
begin
      if lSelTodos then Begin
          lSelTodos             := False;
          btnSelAll.Caption     := 'Marcar Todos' ;
          btnSelAll.ImageIndex  :=  855 ;
      End Else Begin
          lSelTodos := True;
          btnSelAll.Caption := 'Desm. Todos';
          btnSelAll.ImageIndex  :=  290 ;
      End;
      btnSelAll.Realign;

      qSql := TFDQuery.Create(Nil);
      qSql.Connection := dmEmp.SqlConSis;

      if nTrans <> 1 then Begin
         nTrans := 1;
         IniTransacao;
      End;
      gridBaixa.DataSource.DataSet.First;
      While Not gridBaixa.DataSource.DataSet.Eof Do Begin
            qSql.Close;
            if Not lSelTodos then begin
               qSql.SQL.Text := 'Update '+U_funcao.SelSchema('financeiro')+' Set fcr_check = False WHERE fcr_codigo = '+gridBaixa.DataSource.DataSet.FieldByName('fcr_codigo').Text;
               edVlrBaixar.Text  := FormatCurr('R$ #,###,###0.00',RetMoeda(edVlrBaixar.Text)-RetMoeda(gridBaixa.DataSource.DataSet.FieldByName('fcr_vlrapg').Text));
            end else  begin
               qSql.SQL.Text := 'Update '+U_funcao.SelSchema('financeiro')+' Set fcr_check = True  WHERE fcr_codigo = '+gridBaixa.DataSource.DataSet.FieldByName('fcr_codigo').Text;
               edVlrBaixar.Text  := FormatCurr('R$ #,###,###0.00',RetMoeda(edVlrBaixar.Text)+RetMoeda(gridBaixa.DataSource.DataSet.FieldByName('fcr_vlrapg').Text));
            end;
            qSql.ExecSQL;
            cliParcela.Refresh;


        gridBaixa.DataSource.DataSet.Next
      End;
      btnBaixa.Enabled := (RetMoeda(edVlrBaixar.Text)>0);

end;

procedure TfrmBaixaCnt.btnBaixaClick(Sender: TObject);
Var
i: Integer;
zQry,xQry, qSql2, qSql1  : TFDQuery;
cOpe : String;
begin
  if cct_codcct.Text = '' then begin
     ShowMessage('não há caixa selecionado para baixar esta(s) conta(s)');
     exit;

  end;

   // Pega dados da abertura de caixa
   qSql2 := TFDQuery.Create(Nil);
   qSql1 := TFDQuery.Create(Nil);
   qSql2.Connection := dmemp.SqlConSis;
   qSql2.Close;
   qSql2.SQL.Text := ' Select * From  '+U_funcao.SelSchema('abrcaixa')+
                              ' LEFT Join  '+U_funcao.SelSchema('caixa')+'  on cxa_codigo = abc_codcxa '+
                              ' LEFT Join  '+U_funcao.SelSchema('ccorrente')+'  on cct_codigo = cxa_codcct '+
                              ' LEFT Join  '+U_funcao.SelSchema('banco')+'  on bco_codigo = cct_codbco '+
                              ' LEFT Join  '+U_funcao.SelSchema('usuario')+'  on usu_codusu = cxa_codusu '+
                      ' where abc_codcxa = '+edCodCxa.Text+
                      ' And   abc_databr is not NULL '+
                      ' And   abc_datfch is NULL ';
   qSql2.Open;

  if Not qSql2.IsEmpty then begin

     zQry := TFDQuery.Create(Nil);
     zQry.Connection := dmEmp.SqlConSis;

     xQry := TFDQuery.Create(Nil);
     xQry.Connection := dmEmp.SqlConSis;

     cliParcela.First;
     while not cliParcela.Eof do Begin
        if cliParcela.FieldByName('fcr_check').AsBoolean then Begin
          // Consulta o Caixa
           qSql2.Close;
           qSql2.SQL.Text := ' Select * From  '+U_funcao.SelSchema('abrcaixa')+
                                      ' LEFT Join  '+U_funcao.SelSchema('caixa')+'  on cxa_codigo = abc_codcxa '+
                                      ' LEFT Join  '+U_funcao.SelSchema('ccorrente')+'  on cct_codigo = cxa_codcct '+
                                      ' LEFT Join  '+U_funcao.SelSchema('banco')+'  on bco_codigo = cct_codbco '+
                                      ' LEFT Join  '+U_funcao.SelSchema('usuario')+'  on usu_codusu = cxa_codusu '+
                              ' where abc_codcxa = '+edCodCxa.Text+
                              ' And   abc_databr is not NULL '+
                              ' And   abc_datfch is NULL ';
           qSql2.Open;



          if ((cmbOpe.ItemIndex = 0 ) and ( cmbMod.ItemIndex = 0 )) or
             ((cmbOpe.ItemIndex = 1 ) and ( cmbMod.ItemIndex = 1 )) Then
              cOpe := 'C';

          if ((cmbOpe.ItemIndex = 1 ) and ( cmbMod.ItemIndex = 0 )) or
             ((cmbOpe.ItemIndex = 0 ) and ( cmbMod.ItemIndex = 1 )) Then
              cOpe := 'D';


          // Alimenta os valores do caixa
          zQry.Close;
          zQry.SQL.Text   := 'update '+U_funcao.SelSchema('abrcaixa')+
                             ' Set  abc_vlratu = :abc_vlratu,  abc_usualt = :abc_usualt,  abc_datalt = :abc_datalt,  abc_horalt = :abc_horalt '+
                             ' where abc_codigo = '+qSql2.FieldByName('abc_codigo').Text;

          //qSql.ParamByName('abc_vlratu').AsFloat:= RetMoeda(edValor.text) ;
          If cOpe = 'C' Then Begin
             zQry.ParamByName('abc_vlratu').AsFloat := qSql2.FieldByName('abc_vlratu').AsFloat + cliParcela.FieldByName('fcr_vlrapg').AsFloat;
          End Else Begin
             zQry.ParamByName('abc_vlratu').AsFloat := qSql2.FieldByName('abc_vlratu').AsFloat - cliParcela.FieldByName('fcr_vlrapg').AsFloat;
          End;
          zQry.ParamByName('abc_usualt').Text    :=  sysUsuario;
          zQry.ParamByName('abc_datalt').AsDate  := Now;
          zQry.ParamByName('abc_horalt').Text    := TimeToStr(Now);
          zQry.ExecSQL;


            // fazendo abertura de Caixa e enviando Valores para o Caixa
            zQry.Close;
            zQry.SQL.Text   := 'Insert Into '+U_funcao.SelSchema('abrcxamov')+
                                            '( abm_codabc, abm_codcxa, abm_datmov, abm_hormov, abm_tipdoc, abm_descri, abm_numdoc, '+
                                            ' abm_vlrlan, abm_vlrant, abm_vlratu, abm_usuinc, abm_datinc, abm_horinc, abm_usualt, abm_datalt, abm_horalt ) Values  '+
                                            '( :abm_codabc, :abm_codcxa, :abm_datmov, :abm_hormov, :abm_tipdoc, :abm_descri, :abm_numdoc,'+
                                            ' :abm_vlrlan, :abm_vlrant, :abm_vlratu, :abm_usuinc, :abm_datinc, :abm_horinc, :abm_usualt, :abm_datalt, :abm_horalt ) ';
            zQry.ParamByName('abm_codabc').AsInteger:= qSql2.FieldByName('abc_codigo').AsInteger;
            zQry.ParamByName('abm_codcxa').AsInteger:= qSql2.FieldByName('abc_codcxa').AsInteger;
            zQry.ParamByName('abm_numdoc').Text     := cliParcela.FieldByName('cfr_numdoc').Text;
            zQry.ParamByName('abm_datmov').AsDate   := Now;
            zQry.ParamByName('abm_hormov').Text     := TimeToStr(Now);
            zQry.ParamByName('abm_tipdoc').Text     := cOpe;
            if cmbOpe.ItemIndex = 0 then begin
               zQry.ParamByName('abm_descri').Text     := Fiif(cmbMod.ItemIndex = 0, 'REC:','EXT:' )+cliParcela.FieldByName('fcr_descri').Text;
            end else begin
               zQry.ParamByName('abm_descri').Text     := Fiif(cmbMod.ItemIndex = 0, 'PAG:','EXT:' )+cliParcela.FieldByName('fcr_descri').Text;
            end;
            zQry.ParamByName('abm_vlrlan').AsFloat  := cliParcela.FieldByName('fcr_vlrapg').AsFloat;
            zQry.ParamByName('abm_vlrant').AsFloat  := qSql2.FieldByName('abc_vlratu').AsFloat;
            If  cOpe = 'C' Then Begin
                zQry.ParamByName('abm_vlratu').AsFloat  := qSql2.FieldByName('abc_vlratu').AsFloat + cliParcela.FieldByName('fcr_vlrapg').AsFloat ;
            End Else Begin
                zQry.ParamByName('abm_vlratu').AsFloat  := qSql2.FieldByName('abc_vlratu').AsFloat - cliParcela.FieldByName('fcr_vlrapg').AsFloat ;
            End;
            zQry.ParamByName('abm_usuinc').Text     := TimeToStr(Now);
            zQry.ParamByName('abm_UsuAlt').Text     :=  sysUsuario;
            zQry.ParamByName('abm_DatAlt').AsDate   := Now;
            zQry.ParamByName('abm_HorAlt').Text     := TimeToStr(Now);
            zQry.ParamByName('abm_usuinc').Text     :=  sysUsuario;
            zQry.ParamByName('abm_datinc').AsDate   := Now;
            zQry.ParamByName('abm_horinc').Text     := TimeToStr(Now);
            zQry.ExecSQL;

            // Executa Baixa nas duplicatas
            zQry.close;
            zQry.SQL.Text := 'Update '+U_funcao.SelSchema('financeiro')+
                               ' Set   fcr_check  = ''false'', '+
                                     ' fcr_codcxa = '+Fiif(cmbMod.ItemIndex = 0, edCodCxa.Text,' Null ')+', '+
                                     ' fcr_codcct = '+Fiif(cmbMod.ItemIndex = 0, cct_codcct.text,' Null ')+', '+
                                     ' fcr_codabc = '+Fiif(cmbMod.ItemIndex = 0, qSql2.FieldByName('abc_codigo').Text,'Null')+', '+
                                     ' fcr_datpag = '+Fiif(cmbMod.ItemIndex = 0, QuotedStr( DateToStr(Now) ),'Null')+', '+
                                     ' fcr_status = '+Fiif(cmbMod.ItemIndex = 0, QuotedStr( 'LIQ' ),QuotedStr( 'CXA' ) )+', '+
                                     ' fcr_vlrpag = '+Fiif(cmbMod.ItemIndex = 0, RmCharValor( cliParcela.FieldByName('fcr_vlrapg').Text ), QuotedStr( '0' ) )+' '+
                                     ' WHERE fcr_codigo = '+cliParcela.FieldByName('fcr_codigo').Text;

            zQry.ExecSQL;

            // Verifica se a conta é períodica e faz autozalvamento
            If cliParcela.FieldByName('cfr_period').AsBoolean then begin
                // Grava nova parcela
                        qSql1.Connection := dmEmp.SqlConSis;
                        qSql1.Close;
                        qSql1.SQL.Text   := 'Insert Into '+U_funcao.SelSchema('financeiro')+
                                                        '( fcr_descri,  fcr_DatVen,  fcr_NumPar,  fcr_Status,  fcr_tippro,  fcr_codcfr, '+
                                                        '  fcr_vlrApg,  fcr_UsuInc,  fcr_DatInc,  fcr_HorInc ) Values  '+
                                                       '( :fcr_descri, :fcr_DatVen, :fcr_NumPar, :fcr_Status, :fcr_tippro, :fcr_codcfr, '+
                                                        ' :fcr_vlrApg, :fcr_UsuInc, :fcr_DatInc, :fcr_HorInc ) ';
                        qSql1.ParamByName('fcr_descri').Text     := '[Pc 1/1] '+cliParcela.FieldByName('cfr_descri').Text ;
                        qSql1.ParamByName('fcr_DatVen').AsDate   := IncMonth(cliParcela.FieldByName('fcr_DatVen').AsDateTime,1);   ;
                        qSql1.ParamByName('fcr_NumPar').Text     := IntToStr(cliParcela.FieldByName('fcr_NumPar').AsInteger+1);
                        qSql1.ParamByName('fcr_Status').Text     := 'CXA';
                        qSql1.ParamByName('fcr_tippro').Text     := 'LAN';
                        qSql1.ParamByName('fcr_codcfr').AsInteger:= cliParcela.FieldByName('cfr_codigo').AsInteger ;
                        qSql1.ParamByName('fcr_vlrApg').AsFloat  := cliParcela.FieldByName('fcr_vlrApg').AsFloat ;
                        qSql1.ParamByName('fcr_UsuInc').Text     :=  sysUsuario;
                        qSql1.ParamByName('fcr_DatInc').AsDate   := Now;
                        qSql1.ParamByName('fcr_HorInc').Text     := TimeToStr(Now);
                        qSql1.ExecSQL;

            end;


        End;
        cliParcela.Next;
     End;
     FimTransacao;
     nTrans := 0;
     edVlrBaixar.Text  := FormatCurr('R$ #,###,###0.00',0);
     edCodCxaExit(Nil);
     refrescagrids;
     btnBaixa.Enabled := (RetMoeda(edVlrBaixar.Text)>0);;
  end;
end;

procedure TfrmBaixaCnt.cmbModChange(Sender: TObject);
begin
PegaQuery;
refrescagrids;
  if cmbMod.ItemIndex = 0 then Begin
     gridBaixa.Columns[1].Title.caption := 'Dt Vencimento' ;
     gridBaixa.Columns[1].FieldName     := 'fcr_datven' ;
     gridBaixa.Columns[7].Title.caption := 'Valor a Pagar' ;
     gridBaixa.Columns[7].FieldName     := 'fcr_vlrapg' ;
  End Else Begin
     gridBaixa.Columns[1].Title.caption := 'Dt Baixa' ;
     gridBaixa.Columns[1].FieldName     := 'fcr_datpag' ;
     gridBaixa.Columns[7].Title.caption := 'Valor Baixado' ;
     gridBaixa.Columns[7].FieldName     := 'fcr_vlrpag' ;
  End;

end;

procedure TfrmBaixaCnt.cmbOpeChange(Sender: TObject);
begin
PegaQuery;
refrescagrids;
end;

procedure TfrmBaixaCnt.cct_codcctExit(Sender: TObject);
begin
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlcaixa ;
  edCodBco.Text :=  Pesquisa.Relacao('caixa',cct_codcct,'cxa_codcct','cct_codbco');
  edNomBco.Text :=  Pesquisa.Relacao('caixa',cct_codcct,'cxa_codcct','bco_nome');
  edNomage.Text :=  Pesquisa.Relacao('caixa',cct_codcct,'cxa_codcct','cct_agencia');
  edNomcta.Text :=  Pesquisa.Relacao('caixa',cct_codcct,'cxa_codcct','cct_nrconta');
  btnBaixa.Enabled := (RetMoeda(edVlrBaixar.Text)>0);;
  PegaQuery;
  refrescagrids;
  DatIni.SetFocus;

end;

end;

procedure TfrmBaixaCnt.cct_codcctKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      cct_codcctRightButtonClick(Self);
  end;
Finally

End;


end;

procedure TfrmBaixaCnt.cct_codcctRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsCaixa ;
  Pesquisa.sqlTabela :=  dmEmp.sqlCaixa ;
  Pesquisa.cliTabela :=  dmEmp.cliCaixa ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Conta Corrente';
  Pesquisa.nmTabela  := 'caixa' ;
  Pesquisa.QuerySql  := 'cxa_codigo = '+edCodCxa.Text;
  //Pesquisa.NovoCad   := 'Banco' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('cct_codigo'  ,'Cd Conta'      ,'cct_codcct' ,5  ,'por Código' );
  Pesquisa.AddReg('cct_codbco'  ,'Nr Banco'      ,'edCodBco'   ,5  ,'por Nr Banco' );
  Pesquisa.AddReg('bco_nome'    ,'Banco'         ,'edNomBco'   ,25 ,'por Banco' );
  Pesquisa.AddReg('cct_agencia' ,'Agencia'       ,'edNomAge'   ,6  ,'por Agencia' );
  Pesquisa.AddReg('cct_nrconta' ,'Nr Conta'      ,'edNomCta'   ,6  ,'por Conta' );


  Pesquisa.acessa(cct_codcct);
  cct_codcct.text   :=  Pesquisa.RecReg('cct_codigo');
  Pesquisa.Destroy;

 end;


procedure TfrmBaixaCnt.datfinChange(Sender: TObject);
begin
  PegaQuery;
  refrescagrids;
end;

procedure TfrmBaixaCnt.datiniChange(Sender: TObject);
begin
  PegaQuery;
  refrescagrids;
end;

procedure TfrmBaixaCnt.dsParcelaDataChange(Sender: TObject; Field: TField);
begin
  If gridBaixa.DataSource.DataSet.IsEmpty Then Begin
      nNumDoc.Caption := '';
      dDatEms.Caption := '';
      nVlrApg.Caption := '';
      nJuros.Caption  := '';
      nDesco.Caption  := '';
      dDatVen.Caption := '';
      nVlrPag.Caption := '';
      cTipCnt.Caption := '';
      cStatus.Caption := '';
      cFavore.Caption := '';
      cCodPct.Caption := '';
      cDescri.Caption := '';
      cBanco.Caption  := '';
      cBoleto.Caption := '';
      cAgencia.Caption:= '';
      cConta.Caption  := '';
  End Else Begin
      nNumDoc.Caption := gridBaixa.DataSource.DataSet.FieldByName('cfr_numdoc').Text ;
      dDatEms.Caption := DateToStr( gridBaixa.DataSource.DataSet.FieldByName('fcr_datven').AsDateTime );
      nVlrApg.Caption := FormatCurr('R$ #,###,###0.00',gridBaixa.DataSource.DataSet.FieldByName('fcr_vlrapg').AsFloat ) ;
      nJuros.Caption  := FormatCurr('R$ #,###,###0.00',gridBaixa.DataSource.DataSet.FieldByName('cfr_vlracr').AsFloat ) ;
      nDesco.Caption  := FormatCurr('R$ #,###,###0.00',gridBaixa.DataSource.DataSet.FieldByName('cfr_vlracr').AsFloat ) ;
      dDatVen.Caption := DateToStr( gridBaixa.DataSource.DataSet.FieldByName('fcr_datven').AsDateTime );
      nVlrPag.Caption := FormatCurr('R$ #,###,###0.00',gridBaixa.DataSource.DataSet.FieldByName('fcr_vlrpag').AsFloat ) ;
      cTipCnt.Caption := fIIF(gridBaixa.DataSource.DataSet.FieldByName('cfr_tipdoc').Text = 'D', 'Débito','Crédito') ;
      cStatus.Caption := UpperCase( fIIF(gridBaixa.DataSource.DataSet.FieldByName('fcr_status').Text = 'LIQ', 'Pago','Á Pagar') );
      cFavore.Caption := fIIF(gridBaixa.DataSource.DataSet.FieldByName('cfr_codfnd').Text = '' , gridBaixa.DataSource.DataSet.FieldByName('fnd_nome').Text,'Sem Favorecido') ;
      if Not gridBaixa.DataSource.DataSet.FieldByName('cfr_codpct').IsNull then
         cCodPct.Caption := FormatCurr('##.##.##.####',gridBaixa.DataSource.DataSet.FieldByName('cfr_codpct').AsInteger  ) ;

      cDescri.Caption := gridBaixa.DataSource.DataSet.FieldByName('fcr_descri').Text ;
      cBanco.Caption  := Trim( gridBaixa.DataSource.DataSet.FieldByName('cct_codbco').Text )+'-'+gridBaixa.DataSource.DataSet.FieldByName('bco_nome').Text ;
      cAgencia.Caption:= gridBaixa.DataSource.DataSet.FieldByName('cct_agencia').Text ;
      cConta.Caption  := gridBaixa.DataSource.DataSet.FieldByName('cct_nrconta').Text ;
      cBoleto.Caption := gridBaixa.DataSource.DataSet.FieldByName('fcr_numbol').Text ;;

  End;
end;

procedure TfrmBaixaCnt.edCodCxaExit(Sender: TObject);
Var
qSql, qSql2 : TFDQuery;
begin
  qSql  := TFDQuery.Create(Nil);
  qSql.Connection := dmemp.SqlConSis;
  qSql.Close;
  qSql.SQL.Text := 'Select * From '+U_funcao.SelSchema('caixa')+
                   ' Inner Join '+U_funcao.SelSchema('usuario')+' on usu_codusu = cxa_codusu '+
                   ' where cxa_codigo = '+edCodCxa.Text;
  qSql.Open;
  if qSql.IsEmpty then Begin
     ShowMessage('Caixa não existe');
     edCodCxa.SetFocus ;
  End Else Begin
     edNomCxa.Text  := qSql.FieldByName('usu_nome').Text;
     cCodUsu        := qSql.FieldByName('usu_codusu').Text ;
     qSql2 := TFDQuery.Create(Nil);
     qSql2.Connection := dmemp.SqlConSis;
     qSql2.Close;
     qSql2.SQL.Text := ' Select * From  '+U_funcao.SelSchema('abrcaixa')+
                                ' LEFT Join  '+U_funcao.SelSchema('caixa')+'  on cxa_codigo = abc_codcxa '+
                                ' LEFT Join  '+U_funcao.SelSchema('ccorrente')+'  on cct_codigo = cxa_codcct '+
                                ' LEFT Join  '+U_funcao.SelSchema('banco')+'  on bco_codigo = cct_codbco '+
                                ' LEFT Join  '+U_funcao.SelSchema('usuario')+'  on usu_codusu = cxa_codusu '+
                        ' where abc_codcxa = '+edCodCxa.Text+
                        ' And   abc_databr is not NULL '+
                        ' And   abc_datfch is NULL ';
     qSql2.Open;

     if qSql2.IsEmpty Then Begin
         qSql2.Close;
         qSql2.SQL.Text := ' Select * From  '+U_funcao.SelSchema('abrcaixa')+
                                    ' LEFT Join  '+U_funcao.SelSchema('caixa')+'  on cxa_codigo = abc_codcxa '+
                                    ' LEFT Join  '+U_funcao.SelSchema('ccorrente')+'  on cct_codigo = cxa_codcct '+
                                    ' LEFT Join  '+U_funcao.SelSchema('banco')+'  on bco_codigo = cct_codbco '+
                                    ' LEFT Join  '+U_funcao.SelSchema('usuario')+'  on usu_codusu = cxa_codusu '+
                            ' where abc_codcxa = '+edCodCxa.Text+
                            ' And   abc_databr is not NULL '+
                            ' And   abc_datfch is Not NULL '+
                            ' And   abc_codigo = (Select Max(abc_codigo) From  '+U_funcao.SelSchema('abrcaixa')+
                                  ' where abc_codcxa =  '+edCodCxa.Text+
                                  ' And   abc_databr is not NULL '+
                                  ' And   abc_datfch is not NULL )';
         qSql2.Open;
         ShowMessage('Caixa Fechado');
         edCodCxa.SetFocus ;

     End Else Begin
         btnAbr.Enabled  := (Not btnFch.enabled)
     End;
     edDatIni.Text    := qSql2.FieldByName('abc_databr').Text;
     edHorIni.Text    := qSql2.FieldByName('abc_HorInc').Text;
     edDatFin.Text    := qSql2.FieldByName('abc_datFch').Text;
     edHorFin.Text    := qSql2.FieldByName('abc_HorAlt').Text;
     edSaldoAnt.Text  := FormatCurr('R$ #,###,###0.00',qSql2.FieldByName( 'abc_vlrant' ).AsFloat);
     edSaldoAtu.Text  := FormatCurr('R$ #,###,###0.00',qSql2.FieldByName( 'abc_vlratu' ).AsFloat);
     refrescaGrupo;
     refrescagrids;


  End;



end;

procedure TfrmBaixaCnt.edPesqChange(Sender: TObject);
begin
  case cmbPesqui.ItemIndex of
    0: cPesq := (' and UPPER(fcr_numdoc) like UPPER('+QuotedStr('%'+edPesq.Text+'%')+') ');
    1: cPesq := (' and UPPER(fcr_descri) like UPPER('+QuotedStr('%'+edPesq.Text+'%')+') ');
  end;
  refrescagrids;
end;

procedure TfrmBaixaCnt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sqlNew.Close;
    dmEmp.clicaixa.Close;
    frmBaixaCnt                   := nil ;
    action                        := cafree;
    fPrincipal.btnbaixacnt.Enabled:= True;
end;



procedure TfrmBaixaCnt.FormCreate(Sender: TObject);
Var
i: Integer;
begin
  cPre                        := 'abc_';
  cTabela                     := 'btnbaixacnt';
  acampo                      := 1;
  sqlNew                      := TFDQuery.Create(nil);
  sqlNew.Connection           := dmEmp.SqlConSis;
  fPrincipal.btnbaixacnt.Enabled  := False;
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;
  datini.Date := StartOfTheMonth( Now );
  datfin.Date := EndOfTheMonth( Now );
  cSqlGridMov := sqlParcela.SQL.Text;
  cSqlGridMov := StringReplace( cSqlGridMov, #$D#$A, ' ', [rfReplaceAll, rfIgnoreCase]);
  PegaQuery;

  cmbPesqui.Items.Add('Nº Documento');
  cmbPesqui.Items.Add('Deciminação ');
  cmbPesqui.ItemIndex := 0;

end;

procedure TfrmBaixaCnt.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
      VK_F5 :
        btnBaixaClick(nil);
      VK_F12:
        btnSelAllClick(Nil);

  end;
end;

procedure TfrmBaixaCnt.FormKeyPress(Sender: TObject; var Key: Char);
Begin
  //verifica se a tecla pressionada é a tecla ENTER, conhecida como #13
  If key = #13 then Begin
    //se for, passa o foco para o próximo campo, zerando o valor da variável Key
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  End Else
    If key = #27 then Begin
       Close;
    End;
end;
procedure TfrmBaixaCnt.FormShow(Sender: TObject);
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
  lbCabeca01.Caption    := 'Abertura de Caixa';
  lbCabeca02.Caption    := u_funcao.nmSistema ;
  // Cores - Titulos do Banner
  lbCabeca01.Font.Color := u_funcao.clTit_BCad ;
  lbCabeca02.Font.Color := u_funcao.clTit_BCad ;
  limpatela;
  refrescagrids;
  refrescaGrupo;
  btnBaixa.Enabled := (RetMoeda(edVlrBaixar.Text)>0);;
  lSelTodos := False;
end;



procedure TfrmBaixaCnt.gridBaixaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
Check: Integer;
R: TRect;
begin
  inherited;

  if gridBaixa.DataSource.DataSet.FieldByName('fcr_check').AsBoolean  then
  begin
    if gdFocused in State then
    begin
      gridBaixa.Canvas.Brush.Color  := Verde_Floresta_Medio;
      gridBaixa.Canvas.Font.Color   := Branco;
      gridBaixa.Canvas.FillRect(Rect);
      gridBaixa.DefaultDrawDataCell(Rect, Column.Field, State);
    end
    else
    begin
      gridBaixa.Canvas.Brush.Color  := Ouro_Velho;
      gridBaixa.Canvas.Font.Color   := Preto;
      gridBaixa.Canvas.FillRect(Rect);
      gridBaixa.DefaultDrawDataCell(Rect, Column.Field, State);
    end;
  End Else Begin
    if gdFocused in State then
    begin
      gridBaixa.Canvas.Brush.Color  := Azul_Escuro;
      gridBaixa.Canvas.Font.Color   := Branco;
      gridBaixa.Canvas.FillRect(Rect);
      gridBaixa.DefaultDrawDataCell(Rect, Column.Field, State);
    end
    else
    begin
      gridBaixa.Canvas.Brush.Color  := Cinza_Sintilante;
      gridBaixa.Canvas.Font.Color   := Preto;
      gridBaixa.Canvas.FillRect(Rect);
      gridBaixa.DefaultDrawDataCell(Rect, Column.Field, State);
    end;

  end;
  //Desenha um checkbox no dbgrid
  if Column.FieldName = 'fcr_check' then begin
    gridBaixa.Canvas.FillRect(Rect);
    Check := 0;
    if gridBaixa.DataSource.DataSet.FieldByName('fcr_check').AsBoolean = True then Begin
        Check := DFCS_CHECKED
    End else Begin
        Check := 0;
    End;
    R:=Rect;
    InflateRect(R,-2,-2); {Diminue o tamanho do CheckBox}
    DrawFrameControl(gridBaixa.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;



procedure TfrmBaixaCnt.gridBaixaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
qSql : TFDQuery;
begin
  if Key = VK_SPACE then Begin

      qSql := TFDQuery.Create(Nil);

      if nTrans <> 1 then Begin
         nTrans := 1;
         IniTransacao;
      End;

      qSql.Connection := dmEmp.SqlConSis;
      qSql.Close;
      if gridBaixa.DataSource.DataSet.FieldByName('fcr_check').AsBoolean then begin
         qSql.SQL.Text := 'Update '+U_funcao.SelSchema('financeiro')+' Set fcr_check = False WHERE fcr_codigo = '+gridBaixa.DataSource.DataSet.FieldByName('fcr_codigo').Text;
         edVlrBaixar.Text  := FormatCurr('R$ #,###,###0.00',RetMoeda(edVlrBaixar.Text)-RetMoeda(gridBaixa.DataSource.DataSet.FieldByName('fcr_vlrapg').Text));
      end else  begin
         qSql.SQL.Text := 'Update '+U_funcao.SelSchema('financeiro')+' Set fcr_check = True  WHERE fcr_codigo = '+gridBaixa.DataSource.DataSet.FieldByName('fcr_codigo').Text;
         edVlrBaixar.Text  := FormatCurr('R$ #,###,###0.00',RetMoeda(edVlrBaixar.Text)+RetMoeda(gridBaixa.DataSource.DataSet.FieldByName('fcr_vlrapg').Text));
      end;
      qSql.ExecSQL;
      cliParcela.Refresh;
      btnBaixa.Enabled := (RetMoeda(edVlrBaixar.Text)>0);

  End;


end;

procedure TfrmBaixaCnt.limpatela;
begin
  edCodCxa.Clear;
  edNomCxa.Clear;
  edSenha.Clear;
  edDatIni.Clear;
  edHorIni.Clear;
  edDatFin.Clear;
  edHorFin.Clear;
  edSaldoAnt.Text  := FormatCurr('R$ #,###,###0.00',0);
  edSaldoAtu.Text  := FormatCurr('R$ #,###,###0.00',0);
  edVlrBaixar.Text  := FormatCurr('R$ #,###,###0.00',0);

  btnAbr.Enabled := False;
  btnfch.Enabled := False;
  edCodCxa.SetFocus;

end;

procedure TfrmBaixaCnt.PegaQuery;
begin
  cWhere := 'where fcr_datven >= '+QuotedStr( DateToStr(datini.Date) )+' and  fcr_datven <= '+QuotedStr( DateToStr(datfin.Date) );
  case cmbOpe.ItemIndex of
    0: cWhere := cWhere + ' and cfr_tipdoc = ''C'' ';
    1: cWhere := cWhere + ' and cfr_tipdoc = ''D'' ';
  end;

  case cmbMod.ItemIndex of
    0: cWhere := cWhere + ' and fcr_status = ''CXA'' ';
    1: cWhere := cWhere + ' and fcr_status = ''LIQ'' and fcr_codcxa = '+edCodCxa.Text+' and fcr_codcct = '+cct_codcct.text;
  end;

  case cmbMod.ItemIndex of
    0: btnBaixa.Caption := 'Baixar';
    1: btnBaixa.Caption := 'Extorno';
  end;
  case cmbMod.ItemIndex of
    0: btnBaixa.ImageIndex := 525;
    1: btnBaixa.ImageIndex := 738;
  end;


end;

procedure TfrmBaixaCnt.refrescagrids;
begin
  sqlParcela.Close;
  CliParcela.Close;
  sqlParcela.SQL.Text := cSqlGridMov+cWhere+cPesq+' Order By fcr_datven, fcr_codigo';
  sqlParcela.Open;
  cliParcela.Active := True;
  btnSelAll.Enabled := ( gridBaixa.DataSource.DataSet.RecordCount > 0 );


end;



procedure TfrmBaixaCnt.refrescaGrupo;
Var
i : Integer;
begin
     grupo01.Enabled    := btnFch.Enabled;
     gridBaixa.Visible  := btnFch.Enabled;

end;

initialization
  RegisterClass(TfrmBaixaCnt);


end.
