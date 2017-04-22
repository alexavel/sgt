unit U_manutencao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, ImgList, ExtCtrls, ComCtrls, xmldom,
  XMLIntf, IdHTTP, msxmldom, XMLDoc, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, ExtDlgs, RibbonLunaStyleActnCtrls,
  ToolWin, ActnMan, ActnCtrls, jpeg, edittuning, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, U_ClasseUtil,U_Classcons, ZDataset, ZDatasetUtils,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, U_ClassCad, frxClass, frxDBSet,
  Datasnap.DBClient, Datasnap.Provider, ZAbstractRODataset, ZAbstractDataset,
  System.ImageList, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;


type
  Tfrmmanutcab = class(TForm)
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
    PgControle: TPageControl;
    TbIniciais: TTabSheet;
    btnPegaFoto: TAction;
    btnExcluiFoto: TAction;
    OpenDialog01: TOpenPictureDialog;
    Tbcomplemento: TTabSheet;
    actionsub: TActionManager;
    AcsBtnInc: TAction;
    AcsBtnExc: TAction;
    CmbBtnInc: TAction;
    cmbBtnExc: TAction;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox8: TGroupBox;
    osc_codigo: TButtonedEdit;
    Label20: TLabel;
    osc_codplc: TButtonedEdit;
    Label15: TLabel;
    osc_datems: TDateTimePicker;
    Label45: TLabel;
    osc_horems: TMaskEdit;
    Label46: TLabel;
    osc_tipoos: TComboBox;
    Label47: TLabel;
    edNomMdl: TEdit;
    Label42: TLabel;
    edNomChas: TEdit;
    Label48: TLabel;
    edAno: TEdit;
    Label49: TLabel;
    osc_kmmnt: TMaskEdit;
    Label22: TLabel;
    osc_codfnd: TButtonedEdit;
    Label23: TLabel;
    edNomFnd: TEdit;
    Label50: TLabel;
    edCpnj: TEdit;
    Label51: TLabel;
    osc_datrea: TDateTimePicker;
    Label21: TLabel;
    osc_horrea: TMaskEdit;
    Label52: TLabel;
    osc_obs: TRichEdit;
    grbPecas: TGroupBox;
    dbgPecas: TDBGrid;
    edcodpec: TButtonedEdit;
    Label18: TLabel;
    edNompec: TEdit;
    Label16: TLabel;
    edqtdpec: TMaskEdit;
    Label6: TLabel;
    edvlrpec: TMaskEdit;
    Label7: TLabel;
    edpctpec: TMaskEdit;
    Label8: TLabel;
    edvlrdes: TMaskEdit;
    Label13: TLabel;
    edCodCst: TButtonedEdit;
    Label17: TLabel;
    edCodCfo: TButtonedEdit;
    Label19: TLabel;
    edVlricm: TMaskEdit;
    Label2: TLabel;
    edpctipi: TMaskEdit;
    Label3: TLabel;
    edvlripi: TMaskEdit;
    Label4: TLabel;
    edpcticmst: TMaskEdit;
    Label24: TLabel;
    edvlricmst: TMaskEdit;
    Label25: TLabel;
    edVlrTot: TEdit;
    Label5: TLabel;
    Label1: TLabel;
    edpcticm: TMaskEdit;
    btnIncItem: TButton;
    btnCancekItem: TButton;
    btnExcluItem: TButton;
    eddiagar: TMaskEdit;
    Label9: TLabel;
    edkmgtia: TMaskEdit;
    Label10: TLabel;
    grbVlrPec: TGroupBox;
    grbVlrSer: TGroupBox;
    grbVlrDsc: TGroupBox;
    GroupBox1: TGroupBox;
    lbTotalPec: TLabel;
    lbTotSer: TLabel;
    lbTotDesc: TLabel;
    lbTotGeral: TLabel;
    grbservico: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    dbgServico: TDBGrid;
    edCodSrv: TButtonedEdit;
    edNomSrv: TEdit;
    edQtdSrv: TMaskEdit;
    edVlrSrv: TMaskEdit;
    edPctDsc: TMaskEdit;
    edVlrDsc: TMaskEdit;
    edCdSCst: TButtonedEdit;
    edCdSCfo: TButtonedEdit;
    edSBVlrIcms: TMaskEdit;
    edTotSer: TEdit;
    edSBPctIcms: TMaskEdit;
    btnSIncItem: TButton;
    btnSCancelItem: TButton;
    btnSExcluItem: TButton;
    edkmSgtia: TMaskEdit;
    eddiasgar: TMaskEdit;
    GrbFatura: TGroupBox;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label43: TLabel;
    dbgFatura: TDBGrid;
    edDatvnc: TDateTimePicker;
    edvlrpar: TMaskEdit;
    btnIncFat: TButton;
    btnCanFat: TButton;
    btnExcFat: TButton;
    osc_chvnfe: TEdit;
    osc_codfpg: TButtonedEdit;
    edNomFpg: TEdit;
    osc_totpar: TMaskEdit;
    edVlrPrc: TEdit;
    osc_dtnemi: TDateTimePicker;
    Label44: TLabel;
    osc_numnfe: TMaskEdit;
    Label53: TLabel;
    Label54: TLabel;
    edNumBol: TEdit;
    btnFaturar: TAction;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    btnImpNotra: TAction;
    frxDBDataset2: TfrxDBDataset;
    ImpNota: TfrxReport;
    frxDBCabeca: TfrxDBDataset;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset3: TfrxDBDataset;
    frxDBDataset4: TfrxDBDataset;
    sqlmanutcab: TZQuery;
    sqlmanutcabosc_codigo: TIntegerField;
    sqlmanutcabosc_codplc: TWideStringField;
    sqlmanutcabosc_numord: TWideStringField;
    sqlmanutcabosc_datems: TDateField;
    sqlmanutcabosc_horems: TWideStringField;
    sqlmanutcabosc_datrea: TDateField;
    sqlmanutcabosc_horrea: TWideStringField;
    sqlmanutcabosc_kmmnt: TFloatField;
    sqlmanutcabosc_obs: TWideMemoField;
    sqlmanutcabosc_tipoos: TWideStringField;
    sqlmanutcabosc_codfnd: TIntegerField;
    sqlmanutcabosc_codpss: TIntegerField;
    sqlmanutcabosc_usuinc: TWideStringField;
    sqlmanutcabosc_datinc: TDateField;
    sqlmanutcabosc_horinc: TWideStringField;
    sqlmanutcabosc_usualt: TWideStringField;
    sqlmanutcabosc_datalt: TDateField;
    sqlmanutcabosc_horalt: TWideStringField;
    sqlmanutcabvat_placa: TWideStringField;
    sqlmanutcabvat_pasta: TWideStringField;
    sqlmanutcabvat_chip: TWideStringField;
    sqlmanutcabvat_cartao: TWideStringField;
    sqlmanutcabvat_chassi: TWideStringField;
    sqlmanutcabvat_licenc: TWideStringField;
    sqlmanutcabvat_renavan: TWideStringField;
    sqlmanutcabvat_dut: TWideStringField;
    sqlmanutcabvat_codltd: TIntegerField;
    sqlmanutcabvat_codtip: TIntegerField;
    sqlmanutcabvat_codmdl: TIntegerField;
    sqlmanutcabvat_codmrc: TIntegerField;
    sqlmanutcabvat_codcor: TIntegerField;
    sqlmanutcabvat_codcid: TIntegerField;
    sqlmanutcabvat_codgrm: TIntegerField;
    sqlmanutcabvat_cor: TWideStringField;
    sqlmanutcabvat_status: TWideStringField;
    sqlmanutcabvat_tanque1: TFloatField;
    sqlmanutcabvat_tanque2: TFloatField;
    sqlmanutcabvat_tanque3: TFloatField;
    sqlmanutcabvat_kmini: TFloatField;
    sqlmanutcabvat_kmatu: TFloatField;
    sqlmanutcabvat_anofbmd: TWideStringField;
    sqlmanutcabvat_termo: TWideStringField;
    sqlmanutcabvat_tombo: TWideStringField;
    sqlmanutcabvat_estado: TWideStringField;
    sqlmanutcabvat_qtdpass: TWideStringField;
    sqlmanutcabvat_potenc: TWideStringField;
    sqlmanutcabvat_kgbruto: TFloatField;
    sqlmanutcabvat_kgcarga: TFloatField;
    sqlmanutcabvat_clindad: TWideStringField;
    sqlmanutcabvat_nrmotor: TWideStringField;
    sqlmanutcabvat_foto: TBlobField;
    sqlmanutcabvat_obs: TWideMemoField;
    sqlmanutcabvat_vlrcmp: TFloatField;
    sqlmanutcabvat_datcmp: TDateField;
    sqlmanutcabvat_nfecmp: TWideStringField;
    sqlmanutcabvat_usuinc: TWideStringField;
    sqlmanutcabvat_datinc: TDateField;
    sqlmanutcabvat_horinc: TWideStringField;
    sqlmanutcabvat_usualt: TWideStringField;
    sqlmanutcabvat_datalt: TDateField;
    sqlmanutcabvat_horalt: TWideStringField;
    sqlmanutcabfnd_codigo: TIntegerField;
    sqlmanutcabfnd_ativo: TWideStringField;
    sqlmanutcabfnd_nome: TWideStringField;
    sqlmanutcabfnd_rsocial: TWideStringField;
    sqlmanutcabfnd_tipopes: TWideStringField;
    sqlmanutcabfnd_cpfcnpj: TWideStringField;
    sqlmanutcabfnd_codpct: TWideStringField;
    sqlmanutcabfnd_endereco: TWideStringField;
    sqlmanutcabfnd_numend: TWideStringField;
    sqlmanutcabfnd_complem: TWideStringField;
    sqlmanutcabfnd_bairro: TWideStringField;
    sqlmanutcabfnd_cep: TWideStringField;
    sqlmanutcabfnd_codcid: TIntegerField;
    sqlmanutcabfnd_telef1: TWideStringField;
    sqlmanutcabfnd_telef2: TWideStringField;
    sqlmanutcabfnd_celula: TWideStringField;
    sqlmanutcabfnd_obs: TWideMemoField;
    sqlmanutcabfnd_usuinc: TWideStringField;
    sqlmanutcabfnd_datinc: TDateField;
    sqlmanutcabfnd_horinc: TWideStringField;
    sqlmanutcabfnd_usualt: TWideStringField;
    sqlmanutcabfnd_datalt: TDateField;
    sqlmanutcabfnd_horalt: TWideStringField;
    sqlmanutcabmdl_codigo: TIntegerField;
    sqlmanutcabmdl_nome: TWideStringField;
    sqlmanutcabmdl_codfip: TWideStringField;
    sqlmanutcabmdl_codmrc: TIntegerField;
    sqlmanutcabmdl_codsgm: TIntegerField;
    sqlmanutcabmdl_usuinc: TWideStringField;
    sqlmanutcabmdl_datinc: TDateField;
    sqlmanutcabmdl_horinc: TWideStringField;
    sqlmanutcabmdl_usualt: TWideStringField;
    sqlmanutcabmdl_datalt: TDateField;
    sqlmanutcabmdl_horalt: TWideStringField;
    sqlmanutcabosc_codfpg: TIntegerField;
    sqlmanutcabosc_totpar: TFloatField;
    sqlmanutcabosc_numnfe: TWideStringField;
    sqlmanutcabosc_dtnemi: TDateField;
    sqlmanutcabosc_chvnfe: TWideStringField;
    sqlmanutcabfpg_codigo: TIntegerField;
    sqlmanutcabfpg_nome: TWideStringField;
    sqlmanutcabfpg_codpct: TWideStringField;
    sqlmanutcabfpg_acao: TWideStringField;
    sqlmanutcabfpg_parcela: TWideStringField;
    sqlmanutcabfpg_pctdesc: TFloatField;
    sqlmanutcabfpg_pctacre: TFloatField;
    sqlmanutcabfpg_usuinc: TWideStringField;
    sqlmanutcabfpg_datinc: TDateField;
    sqlmanutcabfpg_horinc: TWideStringField;
    sqlmanutcabfpg_usualt: TWideStringField;
    sqlmanutcabfpg_datalt: TDateField;
    sqlmanutcabfpg_horalt: TWideStringField;
    dspmanutcab: TDataSetProvider;
    climanutcab: TClientDataSet;
    climanutcabosc_codigo: TIntegerField;
    climanutcabosc_codplc: TWideStringField;
    climanutcabosc_numord: TWideStringField;
    climanutcabosc_datems: TDateField;
    climanutcabosc_horems: TWideStringField;
    climanutcabosc_datrea: TDateField;
    climanutcabosc_horrea: TWideStringField;
    climanutcabosc_kmmnt: TFloatField;
    climanutcabosc_obs: TWideMemoField;
    climanutcabosc_tipoos: TWideStringField;
    climanutcabosc_codfnd: TIntegerField;
    climanutcabosc_codpss: TIntegerField;
    climanutcabosc_usuinc: TWideStringField;
    climanutcabosc_datinc: TDateField;
    climanutcabosc_horinc: TWideStringField;
    climanutcabosc_usualt: TWideStringField;
    climanutcabosc_datalt: TDateField;
    climanutcabosc_horalt: TWideStringField;
    climanutcabvat_placa: TWideStringField;
    climanutcabvat_pasta: TWideStringField;
    climanutcabvat_chip: TWideStringField;
    climanutcabvat_cartao: TWideStringField;
    climanutcabvat_chassi: TWideStringField;
    climanutcabvat_licenc: TWideStringField;
    climanutcabvat_renavan: TWideStringField;
    climanutcabvat_dut: TWideStringField;
    climanutcabvat_codltd: TIntegerField;
    climanutcabvat_codtip: TIntegerField;
    climanutcabvat_codmdl: TIntegerField;
    climanutcabvat_codmrc: TIntegerField;
    climanutcabvat_codcor: TIntegerField;
    climanutcabvat_codcid: TIntegerField;
    climanutcabvat_codgrm: TIntegerField;
    climanutcabvat_cor: TWideStringField;
    climanutcabvat_status: TWideStringField;
    climanutcabvat_tanque1: TFloatField;
    climanutcabvat_tanque2: TFloatField;
    climanutcabvat_tanque3: TFloatField;
    climanutcabvat_kmini: TFloatField;
    climanutcabvat_kmatu: TFloatField;
    climanutcabvat_anofbmd: TWideStringField;
    climanutcabvat_termo: TWideStringField;
    climanutcabvat_tombo: TWideStringField;
    climanutcabvat_estado: TWideStringField;
    climanutcabvat_qtdpass: TWideStringField;
    climanutcabvat_potenc: TWideStringField;
    climanutcabvat_kgbruto: TFloatField;
    climanutcabvat_kgcarga: TFloatField;
    climanutcabvat_clindad: TWideStringField;
    climanutcabvat_nrmotor: TWideStringField;
    climanutcabvat_foto: TBlobField;
    climanutcabvat_obs: TWideMemoField;
    climanutcabvat_vlrcmp: TFloatField;
    climanutcabvat_datcmp: TDateField;
    climanutcabvat_nfecmp: TWideStringField;
    climanutcabvat_usuinc: TWideStringField;
    climanutcabvat_datinc: TDateField;
    climanutcabvat_horinc: TWideStringField;
    climanutcabvat_usualt: TWideStringField;
    climanutcabvat_datalt: TDateField;
    climanutcabvat_horalt: TWideStringField;
    climanutcabfnd_codigo: TIntegerField;
    climanutcabfnd_ativo: TWideStringField;
    climanutcabfnd_nome: TWideStringField;
    climanutcabfnd_rsocial: TWideStringField;
    climanutcabfnd_tipopes: TWideStringField;
    climanutcabfnd_cpfcnpj: TWideStringField;
    climanutcabfnd_codpct: TWideStringField;
    climanutcabfnd_endereco: TWideStringField;
    climanutcabfnd_numend: TWideStringField;
    climanutcabfnd_complem: TWideStringField;
    climanutcabfnd_bairro: TWideStringField;
    climanutcabfnd_cep: TWideStringField;
    climanutcabfnd_codcid: TIntegerField;
    climanutcabfnd_telef1: TWideStringField;
    climanutcabfnd_telef2: TWideStringField;
    climanutcabfnd_celula: TWideStringField;
    climanutcabfnd_obs: TWideMemoField;
    climanutcabfnd_usuinc: TWideStringField;
    climanutcabfnd_datinc: TDateField;
    climanutcabfnd_horinc: TWideStringField;
    climanutcabfnd_usualt: TWideStringField;
    climanutcabfnd_datalt: TDateField;
    climanutcabfnd_horalt: TWideStringField;
    climanutcabmdl_codigo: TIntegerField;
    climanutcabmdl_nome: TWideStringField;
    climanutcabmdl_codfip: TWideStringField;
    climanutcabmdl_codmrc: TIntegerField;
    climanutcabmdl_codsgm: TIntegerField;
    climanutcabmdl_usuinc: TWideStringField;
    climanutcabmdl_datinc: TDateField;
    climanutcabmdl_horinc: TWideStringField;
    climanutcabmdl_usualt: TWideStringField;
    climanutcabmdl_datalt: TDateField;
    climanutcabmdl_horalt: TWideStringField;
    climanutcabosc_codfpg: TIntegerField;
    climanutcabosc_totpar: TFloatField;
    climanutcabosc_numnfe: TWideStringField;
    climanutcabosc_dtnemi: TDateField;
    climanutcabosc_chvnfe: TWideStringField;
    climanutcabfpg_codigo: TIntegerField;
    climanutcabfpg_nome: TWideStringField;
    climanutcabfpg_codpct: TWideStringField;
    climanutcabfpg_acao: TWideStringField;
    climanutcabfpg_parcela: TWideStringField;
    climanutcabfpg_pctdesc: TFloatField;
    climanutcabfpg_pctacre: TFloatField;
    climanutcabfpg_usuinc: TWideStringField;
    climanutcabfpg_datinc: TDateField;
    climanutcabfpg_horinc: TWideStringField;
    climanutcabfpg_usualt: TWideStringField;
    climanutcabfpg_datalt: TDateField;
    climanutcabfpg_horalt: TWideStringField;
    dsmanutcab: TDataSource;
    sqlmanutpcs: TZQuery;
    sqlmanutpcsosp_codigo: TIntegerField;
    sqlmanutpcsosp_codosc: TIntegerField;
    sqlmanutpcsosp_codtpc: TIntegerField;
    sqlmanutpcsosp_codcst: TWideStringField;
    sqlmanutpcsosp_codcfo: TWideStringField;
    sqlmanutpcsosp_vlrpec: TFloatField;
    sqlmanutpcsosp_qtdpec: TFloatField;
    sqlmanutpcsosp_vlrdsc: TFloatField;
    sqlmanutpcsosp_pctdsc: TFloatField;
    sqlmanutpcsosp_kmgtia: TFloatField;
    sqlmanutpcsosp_diagar: TFloatField;
    sqlmanutpcsosp_pcticm: TFloatField;
    sqlmanutpcsosp_vlricm: TFloatField;
    sqlmanutpcsosp_pctipi: TFloatField;
    sqlmanutpcsosp_vlripi: TFloatField;
    sqlmanutpcsosp_pcticmst: TFloatField;
    sqlmanutpcsosp_vlricmst: TFloatField;
    sqlmanutpcsosp_usuinc: TWideStringField;
    sqlmanutpcsosp_datinc: TDateField;
    sqlmanutpcsosp_horinc: TWideStringField;
    sqlmanutpcsosp_usualt: TWideStringField;
    sqlmanutpcsosp_datalt: TDateField;
    sqlmanutpcsosp_horalt: TWideStringField;
    sqlmanutpcstpc_codigo: TIntegerField;
    sqlmanutpcstpc_codfbp: TIntegerField;
    sqlmanutpcstpc_codsgm: TIntegerField;
    sqlmanutpcstpc_codncm: TWideStringField;
    sqlmanutpcstpc_codcfo: TWideStringField;
    sqlmanutpcstpc_codcst: TWideStringField;
    sqlmanutpcstpc_cdbarra: TWideStringField;
    sqlmanutpcstpc_referen: TWideStringField;
    sqlmanutpcstpc_nome: TWideStringField;
    sqlmanutpcstpc_medida: TWideStringField;
    sqlmanutpcstpc_kgpeso: TFloatField;
    sqlmanutpcstpc_kgcubag: TFloatField;
    sqlmanutpcstpc_ativo: TBooleanField;
    sqlmanutpcstpc_datpro: TDateField;
    sqlmanutpcstpc_datems: TDateField;
    sqlmanutpcstpc_usuinc: TWideStringField;
    sqlmanutpcstpc_datinc: TDateField;
    sqlmanutpcstpc_horinc: TWideStringField;
    sqlmanutpcstpc_usualt: TWideStringField;
    sqlmanutpcstpc_datalt: TDateField;
    sqlmanutpcstpc_horalt: TWideStringField;
    sqlmanutpcscst_codigo: TWideStringField;
    sqlmanutpcscst_descri: TWideStringField;
    sqlmanutpcscst_clcicm: TBooleanField;
    sqlmanutpcscst_cf: TWideStringField;
    sqlmanutpcscst_usuinc: TWideStringField;
    sqlmanutpcscst_datinc: TDateField;
    sqlmanutpcscst_horinc: TWideStringField;
    sqlmanutpcscst_usualt: TWideStringField;
    sqlmanutpcscst_datalt: TDateField;
    sqlmanutpcscst_horalt: TWideStringField;
    sqlmanutpcscfo_codigo: TWideStringField;
    sqlmanutpcscfo_nome: TWideStringField;
    sqlmanutpcscfo_usuinc: TWideStringField;
    sqlmanutpcscfo_datinc: TDateField;
    sqlmanutpcscfo_horinc: TWideStringField;
    sqlmanutpcscfo_usualt: TWideStringField;
    sqlmanutpcscfo_datalt: TDateField;
    sqlmanutpcscfo_horalt: TWideStringField;
    sqlmanutpcstotal: TFloatField;
    sqlmanutpcsosp_kmatua: TFloatField;
    dspmanutpcs: TDataSetProvider;
    climanutpcs: TClientDataSet;
    climanutpcsosp_codigo: TIntegerField;
    climanutpcsosp_codosc: TIntegerField;
    climanutpcsosp_codtpc: TIntegerField;
    climanutpcsosp_codcst: TWideStringField;
    climanutpcsosp_codcfo: TWideStringField;
    climanutpcsosp_vlrpec: TFloatField;
    climanutpcsosp_qtdpec: TFloatField;
    climanutpcsosp_vlrdsc: TFloatField;
    climanutpcsosp_pctdsc: TFloatField;
    climanutpcsosp_kmgtia: TFloatField;
    climanutpcsosp_diagar: TFloatField;
    climanutpcsosp_pcticm: TFloatField;
    climanutpcsosp_vlricm: TFloatField;
    climanutpcsosp_pctipi: TFloatField;
    climanutpcsosp_vlripi: TFloatField;
    climanutpcsosp_pcticmst: TFloatField;
    climanutpcsosp_vlricmst: TFloatField;
    climanutpcsosp_usuinc: TWideStringField;
    climanutpcsosp_datinc: TDateField;
    climanutpcsosp_horinc: TWideStringField;
    climanutpcsosp_usualt: TWideStringField;
    climanutpcsosp_datalt: TDateField;
    climanutpcsosp_horalt: TWideStringField;
    climanutpcstpc_codigo: TIntegerField;
    climanutpcstpc_codfbp: TIntegerField;
    climanutpcstpc_codsgm: TIntegerField;
    climanutpcstpc_codncm: TWideStringField;
    climanutpcstpc_codcfo: TWideStringField;
    climanutpcstpc_codcst: TWideStringField;
    climanutpcstpc_cdbarra: TWideStringField;
    climanutpcstpc_referen: TWideStringField;
    climanutpcstpc_nome: TWideStringField;
    climanutpcstpc_medida: TWideStringField;
    climanutpcstpc_kgpeso: TFloatField;
    climanutpcstpc_kgcubag: TFloatField;
    climanutpcstpc_ativo: TBooleanField;
    climanutpcstpc_datpro: TDateField;
    climanutpcstpc_datems: TDateField;
    climanutpcstpc_usuinc: TWideStringField;
    climanutpcstpc_datinc: TDateField;
    climanutpcstpc_horinc: TWideStringField;
    climanutpcstpc_usualt: TWideStringField;
    climanutpcstpc_datalt: TDateField;
    climanutpcstpc_horalt: TWideStringField;
    climanutpcscst_codigo: TWideStringField;
    climanutpcscst_descri: TWideStringField;
    climanutpcscst_clcicm: TBooleanField;
    climanutpcscst_cf: TWideStringField;
    climanutpcscst_usuinc: TWideStringField;
    climanutpcscst_datinc: TDateField;
    climanutpcscst_horinc: TWideStringField;
    climanutpcscst_usualt: TWideStringField;
    climanutpcscst_datalt: TDateField;
    climanutpcscst_horalt: TWideStringField;
    climanutpcscfo_codigo: TWideStringField;
    climanutpcscfo_nome: TWideStringField;
    climanutpcscfo_usuinc: TWideStringField;
    climanutpcscfo_datinc: TDateField;
    climanutpcscfo_horinc: TWideStringField;
    climanutpcscfo_usualt: TWideStringField;
    climanutpcscfo_datalt: TDateField;
    climanutpcscfo_horalt: TWideStringField;
    climanutpcstotal: TFloatField;
    climanutpcsosp_kmatua: TFloatField;
    dsmanutpcs: TDataSource;
    sqlmanutsrv: TZQuery;
    sqlmanutsrvoss_codigo: TIntegerField;
    sqlmanutsrvoss_codosc: TIntegerField;
    sqlmanutsrvoss_codtsm: TIntegerField;
    sqlmanutsrvoss_codcst: TWideStringField;
    sqlmanutsrvoss_codcfo: TWideStringField;
    sqlmanutsrvoss_vlrsrv: TFloatField;
    sqlmanutsrvoss_qtdsrv: TFloatField;
    sqlmanutsrvoss_vlrdsc: TFloatField;
    sqlmanutsrvoss_pctdsc: TFloatField;
    sqlmanutsrvoss_kmgtia: TFloatField;
    sqlmanutsrvoss_kmatua: TFloatField;
    sqlmanutsrvoss_diagar: TFloatField;
    sqlmanutsrvoss_pcticm: TFloatField;
    sqlmanutsrvoss_vlricm: TFloatField;
    sqlmanutsrvoss_pctipi: TFloatField;
    sqlmanutsrvoss_vlripi: TFloatField;
    sqlmanutsrvoss_pcticmst: TFloatField;
    sqlmanutsrvoss_vlricmst: TFloatField;
    sqlmanutsrvoss_usuinc: TWideStringField;
    sqlmanutsrvoss_datinc: TDateField;
    sqlmanutsrvoss_horinc: TWideStringField;
    sqlmanutsrvoss_usualt: TWideStringField;
    sqlmanutsrvoss_datalt: TDateField;
    sqlmanutsrvoss_horalt: TWideStringField;
    sqlmanutsrvtsm_codigo: TIntegerField;
    sqlmanutsrvtsm_nome: TWideStringField;
    sqlmanutsrvtsm_vlrhor: TFloatField;
    sqlmanutsrvtsm_codsgm: TIntegerField;
    sqlmanutsrvtsm_usuinc: TWideStringField;
    sqlmanutsrvtsm_datinc: TDateField;
    sqlmanutsrvtsm_horinc: TWideStringField;
    sqlmanutsrvtsm_usualt: TWideStringField;
    sqlmanutsrvtsm_datalt: TDateField;
    sqlmanutsrvtsm_horalt: TWideStringField;
    sqlmanutsrvcst_codigo: TWideStringField;
    sqlmanutsrvcst_descri: TWideStringField;
    sqlmanutsrvcst_clcicm: TBooleanField;
    sqlmanutsrvcst_cf: TWideStringField;
    sqlmanutsrvcst_usuinc: TWideStringField;
    sqlmanutsrvcst_datinc: TDateField;
    sqlmanutsrvcst_horinc: TWideStringField;
    sqlmanutsrvcst_usualt: TWideStringField;
    sqlmanutsrvcst_datalt: TDateField;
    sqlmanutsrvcst_horalt: TWideStringField;
    sqlmanutsrvcfo_codigo: TWideStringField;
    sqlmanutsrvcfo_nome: TWideStringField;
    sqlmanutsrvcfo_usuinc: TWideStringField;
    sqlmanutsrvcfo_datinc: TDateField;
    sqlmanutsrvcfo_horinc: TWideStringField;
    sqlmanutsrvcfo_usualt: TWideStringField;
    sqlmanutsrvcfo_datalt: TDateField;
    sqlmanutsrvcfo_horalt: TWideStringField;
    sqlmanutsrvtotal: TFloatField;
    dspmanutsrv: TDataSetProvider;
    climanutsrv: TClientDataSet;
    climanutsrvoss_codigo: TIntegerField;
    climanutsrvoss_codosc: TIntegerField;
    climanutsrvoss_codtsm: TIntegerField;
    climanutsrvoss_codcst: TWideStringField;
    climanutsrvoss_codcfo: TWideStringField;
    climanutsrvoss_vlrsrv: TFloatField;
    climanutsrvoss_qtdsrv: TFloatField;
    climanutsrvoss_vlrdsc: TFloatField;
    climanutsrvoss_pctdsc: TFloatField;
    climanutsrvoss_kmgtia: TFloatField;
    climanutsrvoss_kmatua: TFloatField;
    climanutsrvoss_diagar: TFloatField;
    climanutsrvoss_pcticm: TFloatField;
    climanutsrvoss_vlricm: TFloatField;
    climanutsrvoss_pctipi: TFloatField;
    climanutsrvoss_vlripi: TFloatField;
    climanutsrvoss_pcticmst: TFloatField;
    climanutsrvoss_vlricmst: TFloatField;
    climanutsrvoss_usuinc: TWideStringField;
    climanutsrvoss_datinc: TDateField;
    climanutsrvoss_horinc: TWideStringField;
    climanutsrvoss_usualt: TWideStringField;
    climanutsrvoss_datalt: TDateField;
    climanutsrvoss_horalt: TWideStringField;
    climanutsrvtsm_codigo: TIntegerField;
    climanutsrvtsm_nome: TWideStringField;
    climanutsrvtsm_vlrhor: TFloatField;
    climanutsrvtsm_codsgm: TIntegerField;
    climanutsrvtsm_usuinc: TWideStringField;
    climanutsrvtsm_datinc: TDateField;
    climanutsrvtsm_horinc: TWideStringField;
    climanutsrvtsm_usualt: TWideStringField;
    climanutsrvtsm_datalt: TDateField;
    climanutsrvtsm_horalt: TWideStringField;
    climanutsrvcst_codigo: TWideStringField;
    climanutsrvcst_descri: TWideStringField;
    climanutsrvcst_clcicm: TBooleanField;
    climanutsrvcst_cf: TWideStringField;
    climanutsrvcst_usuinc: TWideStringField;
    climanutsrvcst_datinc: TDateField;
    climanutsrvcst_horinc: TWideStringField;
    climanutsrvcst_usualt: TWideStringField;
    climanutsrvcst_datalt: TDateField;
    climanutsrvcst_horalt: TWideStringField;
    climanutsrvcfo_codigo: TWideStringField;
    climanutsrvcfo_nome: TWideStringField;
    climanutsrvcfo_usuinc: TWideStringField;
    climanutsrvcfo_datinc: TDateField;
    climanutsrvcfo_horinc: TWideStringField;
    climanutsrvcfo_usualt: TWideStringField;
    climanutsrvcfo_datalt: TDateField;
    climanutsrvcfo_horalt: TWideStringField;
    climanutsrvtotal: TFloatField;
    dsmanutsrv: TDataSource;
    sqlmanutfpg: TZQuery;
    sqlmanutfpgosf_codigo: TIntegerField;
    sqlmanutfpgosf_codosc: TIntegerField;
    sqlmanutfpgosf_codcfr: TIntegerField;
    sqlmanutfpgosf_numbol: TWideStringField;
    sqlmanutfpgosf_datvnc: TDateField;
    sqlmanutfpgosf_vlrpar: TFloatField;
    sqlmanutfpgosf_usuinc: TWideStringField;
    sqlmanutfpgosf_datinc: TDateField;
    sqlmanutfpgosf_horinc: TWideStringField;
    sqlmanutfpgosf_usualt: TWideStringField;
    sqlmanutfpgosf_datalt: TDateField;
    sqlmanutfpgosf_horalt: TWideStringField;
    sqlmanutfpgosc_codigo: TIntegerField;
    sqlmanutfpgosc_codplc: TWideStringField;
    sqlmanutfpgosc_numord: TWideStringField;
    sqlmanutfpgosc_datems: TDateField;
    sqlmanutfpgosc_horems: TWideStringField;
    sqlmanutfpgosc_datrea: TDateField;
    sqlmanutfpgosc_horrea: TWideStringField;
    sqlmanutfpgosc_kmmnt: TFloatField;
    sqlmanutfpgosc_obs: TWideMemoField;
    sqlmanutfpgosc_tipoos: TWideStringField;
    sqlmanutfpgosc_codfnd: TIntegerField;
    sqlmanutfpgosc_codpss: TIntegerField;
    sqlmanutfpgosc_codfpg: TIntegerField;
    sqlmanutfpgosc_totpar: TFloatField;
    sqlmanutfpgosc_numnfe: TWideStringField;
    sqlmanutfpgosc_dtnemi: TDateField;
    sqlmanutfpgosc_chvnfe: TWideStringField;
    sqlmanutfpgosc_usuinc: TWideStringField;
    sqlmanutfpgosc_datinc: TDateField;
    sqlmanutfpgosc_horinc: TWideStringField;
    sqlmanutfpgosc_usualt: TWideStringField;
    sqlmanutfpgosc_datalt: TDateField;
    sqlmanutfpgosc_horalt: TWideStringField;
    sqlmanutfpgtotal: TFloatField;
    dspmanutfpg: TDataSetProvider;
    climanutfpg: TClientDataSet;
    climanutfpgosf_codigo: TIntegerField;
    climanutfpgosf_codosc: TIntegerField;
    climanutfpgosf_codcfr: TIntegerField;
    climanutfpgosf_numbol: TWideStringField;
    climanutfpgosf_datvnc: TDateField;
    climanutfpgosf_vlrpar: TFloatField;
    climanutfpgosf_usuinc: TWideStringField;
    climanutfpgosf_datinc: TDateField;
    climanutfpgosf_horinc: TWideStringField;
    climanutfpgosf_usualt: TWideStringField;
    climanutfpgosf_datalt: TDateField;
    climanutfpgosf_horalt: TWideStringField;
    climanutfpgosc_codigo: TIntegerField;
    climanutfpgosc_codplc: TWideStringField;
    climanutfpgosc_numord: TWideStringField;
    climanutfpgosc_datems: TDateField;
    climanutfpgosc_horems: TWideStringField;
    climanutfpgosc_datrea: TDateField;
    climanutfpgosc_horrea: TWideStringField;
    climanutfpgosc_kmmnt: TFloatField;
    climanutfpgosc_obs: TWideMemoField;
    climanutfpgosc_tipoos: TWideStringField;
    climanutfpgosc_codfnd: TIntegerField;
    climanutfpgosc_codpss: TIntegerField;
    climanutfpgosc_codfpg: TIntegerField;
    climanutfpgosc_totpar: TFloatField;
    climanutfpgosc_numnfe: TWideStringField;
    climanutfpgosc_dtnemi: TDateField;
    climanutfpgosc_chvnfe: TWideStringField;
    climanutfpgosc_usuinc: TWideStringField;
    climanutfpgosc_datinc: TDateField;
    climanutfpgosc_horinc: TWideStringField;
    climanutfpgosc_usualt: TWideStringField;
    climanutfpgosc_datalt: TDateField;
    climanutfpgosc_horalt: TWideStringField;
    climanutfpgtotal: TFloatField;
    dsmanutfpg: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure RefreshDialog;
    Procedure RefreshDados(tipo: String);
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
    procedure osc_codigoExit(Sender: TObject);
    procedure osc_codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure osc_codigoRightButtonClick(Sender: TObject);
    procedure osc_codplcRightButtonClick(Sender: TObject);
    procedure osc_codplcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure osc_codplcExit(Sender: TObject);
    procedure osc_horemsExit(Sender: TObject);
    procedure osc_horreaExit(Sender: TObject);
    procedure osc_datreaExit(Sender: TObject);
    procedure osc_kmmntKeyPress(Sender: TObject; var Key: Char);
    procedure osc_kmmntExit(Sender: TObject);
    procedure osc_codfndRightButtonClick(Sender: TObject);
    procedure osc_codfndKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure osc_codfndExit(Sender: TObject);
    procedure dbgPecasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edcodpecRightButtonClick(Sender: TObject);
    procedure edcodpecKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edcodpecExit(Sender: TObject);
    procedure edqtdpecKeyPress(Sender: TObject; var Key: Char);
    procedure edvlrpecKeyPress(Sender: TObject; var Key: Char);
    procedure edpctpecKeyPress(Sender: TObject; var Key: Char);
    procedure edpcticmKeyPress(Sender: TObject; var Key: Char);
    procedure edpctipiKeyPress(Sender: TObject; var Key: Char);
    procedure edpcticmstKeyPress(Sender: TObject; var Key: Char);
    procedure edvlrdesKeyPress(Sender: TObject; var Key: Char);
    procedure edVlricmKeyPress(Sender: TObject; var Key: Char);
    procedure edvlripiKeyPress(Sender: TObject; var Key: Char);
    procedure edvlricmstKeyPress(Sender: TObject; var Key: Char);
    procedure edCodCstRightButtonClick(Sender: TObject);
    procedure edCodCstKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCodCfoRightButtonClick(Sender: TObject);
    procedure edCodCfoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edvlrpecExit(Sender: TObject);
    procedure edpctpecExit(Sender: TObject);
    procedure edvlrdesExit(Sender: TObject);
    procedure RefreshGrid;
    procedure btnIncItemClick(Sender: TObject);
    procedure edkmgtiaKeyPress(Sender: TObject; var Key: Char);
    procedure dbgServicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edCodSrvRightButtonClick(Sender: TObject);
    procedure edCodSrvKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCodSrvExit(Sender: TObject);
    procedure edQtdSrvKeyPress(Sender: TObject; var Key: Char);
    procedure edVlrSrvKeyPress(Sender: TObject; var Key: Char);
    procedure edVlrSrvExit(Sender: TObject);
    procedure edPctDscKeyPress(Sender: TObject; var Key: Char);
    procedure edPctDscExit(Sender: TObject);
    procedure edVlrDscKeyPress(Sender: TObject; var Key: Char);
    procedure edVlrDscExit(Sender: TObject);
    procedure edCdSCstRightButtonClick(Sender: TObject);
    procedure edCdSCstKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCdSCfoRightButtonClick(Sender: TObject);
    procedure edCdSCfoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edSBPctIcmsKeyPress(Sender: TObject; var Key: Char);
    procedure edSBVlrIcmsKeyPress(Sender: TObject; var Key: Char);
    procedure eddiasgarKeyPress(Sender: TObject; var Key: Char);
    procedure btnSIncItemClick(Sender: TObject);
    procedure osc_codfpgRightButtonClick(Sender: TObject);
    procedure osc_codfpgKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure osc_codfpgExit(Sender: TObject);
    procedure osc_totparChange(Sender: TObject);
    procedure btnIncFatClick(Sender: TObject);
    procedure dbgFaturaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnCanFatClick(Sender: TObject);
    procedure btnExcFatClick(Sender: TObject);
    procedure osc_numnfeExit(Sender: TObject);
    procedure btnFaturarExecute(Sender: TObject);
    procedure btnImpNotraExecute(Sender: TObject);
    procedure btnExcluItemClick(Sender: TObject);
    procedure btnSExcluItemClick(Sender: TObject);
    procedure btnCancekItemClick(Sender: TObject);
    procedure btnSCancelItemClick(Sender: TObject);
  private
    { Private declarations }
    wEmpresa, wUsuInc, wHorInc, wUsuAlt, wHorAlt : string ;
    wDatInc, wDatAlt : Tdate;
    nNew, nRecno, nRecPct:  Integer;
    Status, cWhere  : String;
    procedure campositens;
    procedure btninc;
    procedure calcule;
    procedure Ativador;
    function chkfatura: Boolean;
  public
    acampo, nTrans: integer;
    aberto, lMostra: Boolean;
    Util: TClasseUtil;
    Pesquisa : TClasConsulta;
    sqlNew    : TFDQuery;
    aEdits : TArrayComp;
    cPre, cTabela, codsgm, CodPct: String;
    { Public declarations }
  end;

var
  frmmanutcab: Tfrmmanutcab;
  modConsulta, nOrdem : integer;


implementation

uses  UCalculadora,  U_DmEmp, uSistema, U_funcao, U_CnpjClass;

{$R *.dfm}


procedure Tfrmmanutcab.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sqlNew.Close;
    dmEmp.climanutcab.Close;
    frmmanutcab                := nil ;
    action                       := cafree;
    fPrincipal.btnmanutcab.Enabled := True;


end;



procedure Tfrmmanutcab.FormCreate(Sender: TObject);
Var
i: Integer;
begin
  cPre                        := 'osc_';
  cTabela                     := 'manutcab';
  acampo                      := 1;
  sqlNew                      := TFDQuery.Create(nil);
  sqlNew.Connection           := dmEmp.SqlConSis;
  fPrincipal.btnmanutcab.Enabled  := False;
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;
  FreeAndNil(sqlNew);
end;

procedure Tfrmmanutcab.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure Tfrmmanutcab.FormShow(Sender: TObject);
var
i, tmp: Integer;
Pesquisa : TClasConsulta;
begin
  Util:= TClasseUtil.Create;
  Pesquisa := TClasConsulta.Create;

 { Preenchimento de Vetores }
  osc_tipoos.Items.Clear;
  for i := 0 to Length(fPrincipal.aItemOs)-1 do
      osc_tipoos.Items.add(fPrincipal.aItemOs[i]);

  osc_tipoos.ItemIndex := 0;
  frmmanutcab.Caption := lbCabeca01.Caption ;


  // Cor do banner
  Banner.ParentBackGround := False;
  Banner.ParentColor      := False;
  Banner.Brush.Color      := u_funcao.Bronze_Escuro ;

  // Titulos do Banner
  lbCabeca01.Caption    := 'Ordem de Serviço e Manutenção';
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
  PgControle.TabIndex:= 0;
  RefreshGrid ;
  campositens ;
  btninc;

  FreeAndNil(Util);
  FreeAndNil(Pesquisa);


end;

procedure Tfrmmanutcab.gravadados;
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, ctip_horalt,cCodSql, cIteSql,cValSql,cCodMnt : string ;
dData, dtip_datalt : TDate ;
i, tmp: Integer;
SQLQ : TFDQuery ;
begin
   gravadados2(cTabela,cPre,cPre+'codigo','X','', nNew, frmmanutcab, dmEmp.SqlConSis, aEdits );
end;

procedure Tfrmmanutcab.limpaget;
Var
i: Integer;
begin
  limpaget2(aEdits);
end;

procedure Tfrmmanutcab.navegacao(Ord: Integer);
begin
  if btnGrava.Enabled then
     Exit;

  navegacao2( Ord, acampo, btnIni, btnAnt, btnProx, btnUlt, sqlNew, dmEmp.sqlmanutcab, osc_codigo, cWhere );
  acampo := 0;
  RefreshDialog2(cPre,acampo, frmmanutcab, sqlNew, aEdits);
  acampo := 1;
  RefreshGrid;
end;

procedure Tfrmmanutcab.RefreshDados(tipo: String);
var
  i: integer;
  cQuery, cOrder: String;

begin
  RefreshDados2(acampo, tipo, cWhere,  osc_codigo, sqlNew, dmEmp.sqlmanutcab );
end;


procedure Tfrmmanutcab.RefreshDialog;
var
  i, tmp: Integer;
  frmx : TForm ;
begin
  RefreshDialog2(cPre,acampo, frmmanutcab, sqlNew, aEdits);
end;


procedure Tfrmmanutcab.ToolButton9Click(Sender: TObject);
begin
  frmCalculadora := TfrmCalculadora.Create(Self);
  frmCalculadora.Show;

end;

procedure Tfrmmanutcab.osc_codfndExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlfornecedor ;
  edNomFnd.Text      :=  Pesquisa.Relacao('fornecedor',osc_codfnd,'fnd_codigo','fnd_nome')    ;
  edCpnj.Text        :=  masc_cnpj_cpf( Pesquisa.Relacao('fornecedor',osc_codfnd,'fnd_codigo','fnd_cpfcnpj') ) ;
  CodPct             :=  Pesquisa.Relacao('fornecedor',osc_codfnd,'fnd_codigo','fnd_codpct')    ;
  FreeAndNil(Pesquisa);


end;

procedure Tfrmmanutcab.osc_codfndKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      osc_codfndRightButtonClick(Self);
  end;
Finally

End;

end;

procedure Tfrmmanutcab.osc_codfndRightButtonClick(Sender: TObject);
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
  Pesquisa.AddReg('fnd_codigo','Código'             ,'osc_codfnd' ,5  ,'por Código' );
  Pesquisa.AddReg('fnd_nome'  ,'Fornecedor'         ,'edNomFnd'   ,25 ,'por compracmb' );


  Pesquisa.acessa(osc_codfnd);
  osc_codfnd.text   :=  Pesquisa.RecReg('fnd_codigo');
  edNomFnd.text     :=  Pesquisa.RecReg('fnd_nome');
  FreeAndNil(Pesquisa);

end;

procedure Tfrmmanutcab.osc_codfpgExit(Sender: TObject);
begin
  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlformapgm ;
  edNomFpg.Text      :=  Pesquisa.Relacao('formapgm',osc_codfpg,'fpg_codigo','fpg_nome') ;
  osc_totpar.Enabled :=( Pesquisa.Relacao('formapgm',osc_codfpg,'fpg_codigo','fpg_acao') <> 'LIQ' );
  FreeAndNil(Pesquisa);


end;

procedure Tfrmmanutcab.osc_codfpgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      osc_codfpgRightButtonClick(Self);
  end;
Finally

End;

end;

procedure Tfrmmanutcab.osc_codfpgRightButtonClick(Sender: TObject);
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
  Pesquisa.AddReg('fpg_codigo','Código'             ,'osc_codfpg' ,5  ,'por Código' );
  Pesquisa.AddReg('fpg_nome'  ,'Forma de Pagamento' ,'edNomFpg'   ,30 ,'por Descrição' );


  Pesquisa.acessa(osc_codfpg);
  osc_codfpg.text   :=  Pesquisa.RecReg('fpg_codigo');
  edNomFpg.text     :=  Pesquisa.RecReg('fpg_nome');
  FreeAndNil(Pesquisa);


end;

procedure Tfrmmanutcab.calcule;
Var
num, pctc, pctd, Encargos  : Double;
begin
{
  num               :=  (  FormataNum(edvlrlts.Text) * FormataNum(edltscmp.Text) ) ;
  pctd              :=  FormataNum(edpctdes.Text) ;

  if pctd <> 0 then
     edvlrdes.Text  := FormatCurr('R$ #,##0.00', Pegavlrporcento(num, pctd) );

  num               := ( ( num - FormataNum(edvlrdes.Text) ) + FormataNum(edvlrenc.Text) );
  edvlrtot.Text     := FormatCurr('R$ #,###,##0.00',( num  ) );
  RefreshValores;
 }
end;

procedure Tfrmmanutcab.osc_codigoExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlmanutcab ;
  osc_codplc.Text :=  Pesquisa.Relacao('manutcab',osc_codigo,'osc_codigo','osc_codplc');
  navegacao(5);
  FreeAndNil(Pesquisa);

end;

procedure Tfrmmanutcab.osc_codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      osc_codigoRightButtonClick(Self);
  end;
Finally

End;


end;

procedure Tfrmmanutcab.osc_codigoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
if btnGrava.Enabled then
   Exit;

  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsmanutcab ;
  Pesquisa.sqlTabela :=  dmEmp.sqlmanutcab ;
  Pesquisa.cliTabela :=  dmEmp.climanutcab ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Lista de OS´s Manutenção';
  Pesquisa.nmTabela  := 'manutcab';
  //Pesquisa.NovoCad   := 'manutcab' ;
  // Display        campo   cabecalho           get         tan  indices
  Pesquisa.AddReg('osc_codigo', 'Código'        ,'osc_codigo' , 5  ,'por Código'        );
  Pesquisa.AddReg('osc_tipoos', 'Situação'      ,'osc_tipoos' , 7  ,'por Status'        );
  Pesquisa.AddReg('osc_codplc', 'Placa'         ,'osc_codplc' , 7  ,'por Placa'         );
  Pesquisa.AddReg('mdl_nome',   'Modelo'        ,'mdl_nome'  , 20  ,'por Modelo'        );
  Pesquisa.AddReg('fnd_cpfcnpj','Fornecedor'    ,'fnd_cpfcnpj',30  ,'por Cnpj Fornec'   );
  Pesquisa.AddReg('fnd_nome',   'Fornecedor'    ,'fnd_nome'   ,30  ,'por Nome Fornec'   );
  Pesquisa.AddReg('osc_datrea', 'Dt Realizada'  ,'osc_datrea' ,10  ,'por Dt Realizada'  );
  Pesquisa.AddReg('osc_kmmnt',  'Km'            ,'osc_kmmnt'  , 7  ,''                  );



  Pesquisa.acessa(osc_codigo);
  osc_codigo.text   :=  Pesquisa.RecReg('osc_codigo');
  osc_codplc.text    :=  Pesquisa.RecReg('osc_codplc');

  FreeAndNil(Pesquisa);


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

procedure Tfrmmanutcab.osc_codplcExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela  :=  dmEmp.sqlveiculoatv ;
  edNomMdl.Text       :=  Pesquisa.Relacao('veiculoatv',osc_codplc,'vat_placa','mdl_nome'   );
  edNomChas.Text      :=  Pesquisa.Relacao('veiculoatv',osc_codplc,'vat_placa','vat_chassi' );
  edAno.Text          :=  Pesquisa.Relacao('veiculoatv',osc_codplc,'vat_placa','vat_anofbmd' );
  codsgm              :=  Pesquisa.Relacao('veiculoatv',osc_codplc,'vat_placa','vat_codgrm' );
  FreeAndNil(Pesquisa);


end;

procedure Tfrmmanutcab.osc_codplcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   Try
    case key of
        VK_END    : osc_codplcRightButtonClick(Self);
        VK_UP     : navegacao(1);
        VK_LEFT   : navegacao(2);
        VK_RIGHT  : navegacao(3);
        VK_DOWN   : navegacao(4);

      end;
  Finally

  End;

end;

procedure Tfrmmanutcab.osc_codplcRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsveiculoatv ;
  Pesquisa.sqlTabela :=  dmEmp.sqlveiculoatv ;
  Pesquisa.cliTabela :=  dmEmp.cliveiculoatv ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Veículos';
  Pesquisa.nmTabela  := 'veiculoatv';
  Pesquisa.QuerySql   := ' VAT_STATUS = ''ATIVO'' ';
  // Display        campo   cabecalho           get         tan  indices
  Pesquisa.AddReg('vat_placa',  'Placa'         ,'vat_placa' ,     7  , 'por Placa'   );
  Pesquisa.AddReg('vat_nrfrota','Frota'         ,'vat_nrfrota' ,   7  , 'por Frota'   );
  Pesquisa.AddReg('mdl_nome',   'Modelo'        ,'edNomMdl' ,     25  , 'por Modelo'  );
  Pesquisa.AddReg('mrc_nome',   'Marca'         ,'' ,             25  , 'por Marca'   );
  Pesquisa.AddReg('ltd_nome',   'Lotado'        ,'' ,             25  , 'por Lotação' );
  Pesquisa.AddReg('vat_chassi', 'Chassi'        ,'' ,             17  , 'por Chassi'  );
  Pesquisa.AddReg('vat_renavan','Renavan'       ,'' ,             17  , 'por Renavan' );

  Pesquisa.acessa(osc_codplc);
  osc_codplc.text  :=  Pesquisa.RecReg('vat_placa');
  edNomMdl.text    :=  Pesquisa.RecReg('mdl_nome');
  FreeAndNil(Pesquisa);


end;

procedure Tfrmmanutcab.osc_datreaExit(Sender: TObject);
begin
  if (osc_datems.Date > osc_datrea.Date ) then begin
    ShowMessage('Data de realização maior que a realização ');
  end;
end;

procedure Tfrmmanutcab.osc_horemsExit(Sender: TObject);
begin
ChkHora( Sender );
end;

procedure Tfrmmanutcab.osc_horreaExit(Sender: TObject);
begin
ChkHora( Sender );
end;

procedure Tfrmmanutcab.osc_kmmntExit(Sender: TObject);
begin
  If ChkKmVeiculo(osc_kmmnt.Text, osc_codplc.Text) Then Begin
     ShowMessage('Km Inferior ao atual do veiculo');
     osc_kmmnt.SetFocus;
  End;
end;

procedure Tfrmmanutcab.osc_kmmntKeyPress(Sender: TObject; var Key: Char);
begin
KeyKm( Sender, Key );
end;

procedure Tfrmmanutcab.osc_numnfeExit(Sender: TObject);
begin
  btninc;
end;

procedure Tfrmmanutcab.osc_totparChange(Sender: TObject);
begin
if  Trim( osc_totpar.text ) = '' then
    osc_totpar.text := '1';

if StrToInt(osc_totpar.text) > 0 then
   edVlrPrc.Text := FormatCurr('R$ ###,##0.00',FormataNum( lbTotGeral.Caption ) / FormataNum( osc_totpar.Text )  )


end;

procedure Tfrmmanutcab.btnFaturarExecute(Sender: TObject);
Var
  qDel, qDel1, qSql1, qMdm: TFDQuery;
  cTipLan, cTipPro, cNumPar, cNumAnt, cDescri : String;
  i: Integer;

begin
{ Cancelamento}
  if MESSAGEBOX(Application.Handle, 'Deseja Faturar essa nota?', 'Confirma...', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin
      IniTransacao;
      qMdm            := TFDQuery.Create(Nil);
      qDel            := TFDQuery.Create(Nil);
      qDel1           := TFDQuery.Create(Nil);
      qSql1           := TFDQuery.Create(Nil);

      // Atualiza Km do Veiciulo
      qSql1.Close;
      qSql1.Connection  := dmEmp.SqlConSis;
      qSql1.SQl.Text    :='UPDATE '+U_funcao.SelSchema('veiculoatv')+' Set vat_kmatu = :kmatu WHERE vat_placa = :placa ';
      qSql1.ParamByName('placa').Text       := osc_codplc.Text;
      qSql1.ParamByName('kmatu').AsFloat    := FormataNum(  osc_kmmnt.Text );
      qSql1.ExecSQL;


      // Verifica os serviços de manutenção prevemtiva
      dbgServico.DataSource.DataSet.First;
      while Not dbgServico.DataSource.DataSet.Eof do begin
            // Consultando Manutenção nos veículos
            qDel.Connection  := dmEmp.SqlConSis;
            qDel.Close;
            qDel.SQl.Text :='  Select DISTINCT 	vsv_codigo,vsv_codplc,vsv_codmdm,vsv_codtsm,vsv_kmmant, '
                             +' vsv_kmmanu,vsv_datmnt,vsv_ativo,vsv_usuinc,vsv_datinc, '
                             +' vsv_horinc,vsv_usualt,vsv_datalt,vsv_horalt, mdm_kmmanu '
                             +' FROM  '+U_funcao.SelSchema('veiculosrv')
                             +' left join  '+U_funcao.SelSchema('modelomnt')+' on mdm_codtsm = vsv_codtsm '
                             +' where vsv_codplc = '+QuotedStr( osc_codplc.Text )
                             +' and   vsv_codtsm = '+dbgServico.DataSource.DataSet.FieldByName('oss_codtsm').Text ;
            qDel.Open;

            if Not qDel.eof then begin
                // Pega informações da tabela de manutenção preventiva
                {
                qMdm.Connection  := dmEmp.SqlCon;
                qMdm.Close;
                qMdm.SQl.Text :=' Select * FROM '+U_funcao.SelSchema('modelomnt')+' where mdm_codigo = '+qDel.FieldByName('vsv_codmdm').Text;
                qMdm.Open; }

                // Atualiza os dados do serviço de manutenção preventiva
                qDel1.Connection  := dmEmp.SqlConSis;
                qDel1.Close;
                qDel1.SQl.Text    :='UPDATE '+U_funcao.SelSchema('veiculosrv')+' '
                                   +' Set vsv_kmmant = :vsv_kmmant, vsv_datmnt = :vsv_datmnt, vsv_kmmanu = :vsv_kmmanu, '
                                   +'     vsv_usualt = :vsv_usualt, vsv_datalt = :vsv_datalt, vsv_horalt = :vsv_horalt '
                                   +' WHERE vsv_codigo = '+qDel.FieldByName('vsv_codigo').text ;
                qDel1.ParamByName('vsv_kmmant').AsFloat:= FormataNum( osc_kmmnt.Text );
                qDel1.ParamByName('vsv_datmnt').AsDate := osc_datrea.Date;
                qDel1.ParamByName('vsv_kmmanu').AsFloat:= ( FormataNum( osc_kmmnt.Text ) + qDel.FieldByName('mdm_kmmanu').AsFloat ) ;
                qDel1.ParamByName('vsv_usualt').Text   :=  sysUsuario ;
                qDel1.ParamByName('vsv_datalt').AsDate := now ;
                qDel1.ParamByName('vsv_horalt').Text   := TimeToStr(time) ;
                qDel1.ExecSQl;

            end;
            dbgServico.DataSource.DataSet.Next
      end;

      // Verifica os serviços de manutenção prevemtiva



      cDescri         := 'REF. MANUT. '+osc_codplc.Text;

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
      qSql1.ParamByName('cfr_NumDoc').Text     := osc_numnfe.Text ;
      qSql1.ParamByName('cfr_codant').Text     := osc_codigo.Text ;
      qSql1.ParamByName('cfr_codfnd').Text     := osc_codfnd.Text ;
      qSql1.ParamByName('cfr_codpct').Text     := CodPct ;
      qSql1.ParamByName('cfr_descri').Text     := cDescri ;
      qSql1.ParamByName('cfr_DatEms').AsDate   := osc_DatEms.Date ;
      qSql1.ParamByName('cfr_DatVen').AsDate   := osc_datrea.Date ;
      qSql1.ParamByName('cfr_TotPar').Text     := osc_totpar.Text;
      qSql1.ParamByName('cfr_TipDoc').Text     := 'D';
      qSql1.ParamByName('cfr_vlrApg').AsFloat  := FormataNum( lbTotGeral.Caption );
      qSql1.ParamByName('cfr_vlrDes').AsFloat  := FormataNum( lbTotDesc.Caption );
      qSql1.ParamByName('cfr_vlrAcr').AsFloat  := 0;
      qSql1.ParamByName('cfr_vlrTot').AsFloat  := FormataNum( lbTotGeral.Caption );
      qSql1.ParamByName('cfr_UsuInc').Text     :=  sysUsuario;
      qSql1.ParamByName('cfr_DatInc').AsDate   := Now;
      qSql1.ParamByName('cfr_HorInc').Text     := TimeToStr(Now);
      qSql1.ExecSQL;
      cNumAnt  := PegaUltCodSalvo( 'financecab', 'cfr_codigo', 'cfr_' );


      qDel.Connection  := dmEmp.SqlConSis;
      qDel.Close;
      qDel.SQl.Text    :='Select * From '+U_funcao.SelSchema('manutfpg')+' WHERE osf_codosc = :codcpc ';
      qDel.ParamByName('codcpc').Text       := osc_codigo.Text;
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
            qSql1.ParamByName('fcr_DatVen').AsDate   := qDel.FieldByName('osf_datvnc').AsDateTime;
            qSql1.ParamByName('fcr_NumPar').Text     := IntToStr(i);
            qSql1.ParamByName('fcr_Status').Text     := cTipPro;
            qSql1.ParamByName('fcr_tippro').Text     := cTipLan;
            qSql1.ParamByName('fcr_codcfr').Text     := cNumAnt;
            qSql1.ParamByName('fcr_vlrApg').AsFloat  := qDel.FieldByName('osf_vlrpar').AsFloat ;
            qSql1.ParamByName('fcr_NumBol').Text     := qDel.FieldByName('osf_numbol').Text    ;
            qSql1.ParamByName('fcr_UsuInc').Text     :=  sysUsuario;
            qSql1.ParamByName('fcr_DatInc').AsDate   := Now;
            qSql1.ParamByName('fcr_HorInc').Text     := TimeToStr(Now);
            qSql1.ExecSQL;


          // Gerando a Movimentação do Estoque
          qDel.Next
      end;

      osc_tipoos.Text := fPrincipal.aItemOs[2];

      // Fechadndo a fatura
      qDel.Connection  := dmEmp.SqlConSis;
      qDel.Close;
      qDel.SQl.Text    :='UPDATE '+U_funcao.SelSchema('manutcab')+' '+
                         ' Set osc_fatura = :fatura, osc_tipoos = :tipoos, osc_usualt = :osc_usualt, osc_datalt = :osc_datalt, osc_horalt = :osc_horalt '+
                         ' WHERE osc_codigo = :codcpc ';
      qDel.ParamByName('codcpc').Text       := osc_codigo.Text ;
      qDel.ParamByName('tipoos').Text       := osc_tipoos.Text ;
      qDel.ParamByName('fatura').AsBoolean  := True ;
      qDel.ParamByName('osc_usualt').Text   :=  sysUsuario ;
      qDel.ParamByName('osc_datalt').AsDate := now ;
      qDel.ParamByName('osc_horalt').Text   := TimeToStr(time) ;
      qDel.ExecSQl;
      btnFaturar.Enabled := False;
      btnGravaExecute(Self);

  FreeAndNil(qMdm);
  FreeAndNil(qDel);
  FreeAndNil(qDel1);
  FreeAndNil(qSql1);

  end;


end;

procedure Tfrmmanutcab.ativaButoes(tipo:Integer);
begin
  ativaButoes2(Tipo,  btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt, sqlNew);
  Ativador;
end;

procedure Tfrmmanutcab.Ativador;
begin
 btnFaturar.Enabled := ( ( btnGrava.Enabled  and ( chkfatura ) ) and ( Not sqlNew.FieldByName('osc_fatura').AsBoolean ) );
 //btnImpNotra.Enabled:= (  btnGrava.Enabled   and ( sqlNew.FieldByName('osc_fatura').AsBoolean ) );
end;

function Tfrmmanutcab.chkfatura: Boolean;
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
  qDel1.SQl.Text    :='Select COALESCE( sum( osf_vlrpar ),0) as totpar FROM '+U_funcao.SelSchema('manutfpg')+' WHERE osf_codosc = :codcpc ';
  qDel1.ParamByName('codcpc').Text  := fIIF( osc_codigo.Text <> '',osc_codigo.Text,'0') ;
  qDel1.Open;

  if  qDel1.FieldByName('totpar').Value = FormataNum( lbTotGeral.Caption )  then begin
      Result := True;
  end else
      Result := False;

  FreeAndNil(qDel);
  FreeAndNil(qDel1);



end;


procedure Tfrmmanutcab.ativaget;
begin
  ativaget2(aEdits,cPre+'codigo',cTabela, btnGrava.Enabled, lMostra );
end;

procedure Tfrmmanutcab.btnAlterarExecute(Sender: TObject);
begin
   If sqlNew.FieldByName('osc_fatura').AsBoolean  Then begin
      ShowMessage('Nota Já Faturada!');
      Exit;
   end;

   PgControle.TabIndex := 0;
   btnNovo.Enabled    := False;
   btnAlterar.Enabled := False;
   btnGrava.Enabled   := True;
   acampo := 0;
   nNew   := acampo;
   ativaButoes(1);
   lMostra := false;
   ativaget;
   RefreshDialog;
   osc_datems.SetFocus;
   RefreshGrid ;
   campositens ;
   btninc;
   navegacao(0);

end;

procedure Tfrmmanutcab.btnAntExecute(Sender: TObject);
begin
  navegacao(2);
end;

procedure Tfrmmanutcab.btnCancekItemClick(Sender: TObject);
begin
{ Cancelamento}
  if MESSAGEBOX(Application.Handle, 'Deseja Cancelar este item?', 'Confirma...', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin
     RefreshGrid ;
     campositens ;
     btninc;
     edcodpec.SetFocus;
  end;

end;

procedure Tfrmmanutcab.btnCancelaExecute(Sender: TObject);
begin
   RollBack;
   PgControle.TabIndex:= 0;
   acampo := 1;
   nNew             := acampo;
   btnNovo.Enabled  := True;
   btnGrava.Enabled := False;
   RefreshDados('T');
   ativaButoes(1);
   lMostra := True;
   ativaget;
   RefreshGrid ;
   campositens ;
   btninc;
   navegacao(4);

end;


procedure Tfrmmanutcab.btnCanFatClick(Sender: TObject);
Var
  qDel : TFDQuery;
begin

{ Cancelamento}
  if LowerCase( btnCanFat.Caption ) = 'modificar' then begin
      nRecPct := dbgFatura.DataSource.DataSet.FieldByName('osf_codigo').AsInteger;
      if MESSAGEBOX(Application.Handle, 'Deseja Modificar a parcela item?', 'Confirma...', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin
         btnCanFat.Caption    := 'Gravar';
         btnCanFat.ImageIndex :=  1185 ;
         btninc;
         edNumBol.Text  := dbgFatura.DataSource.DataSet.FieldByName('osf_numbol').Text;
         edDatvnc.Date  := dbgFatura.DataSource.DataSet.FieldByName('osf_datvnc').AsDateTime;
         edvlrpar.Text  := FormatCurr('R$ ###,##0.00', dbgFatura.DataSource.DataSet.FieldByName('osf_vlrpar').AsFloat );
         edNumBol.SetFocus;
      end;

  end Else begin
     if MESSAGEBOX(Application.Handle, 'Deseja Modificar a parcela item?', 'Confirma...', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin


            //Atualiza valores
            IniTransacao;
            qDel            := TFDQuery.Create(Nil);
            qDel.Connection  := dmEmp.SqlConSis;
            qDel.Close;
            qDel.SQl.Text    :='UPDATE '+U_funcao.SelSchema('manutfpg')+' Set osf_numbol = :osf_numbol, osf_datvnc = :osf_datvnc, osf_vlrpar = :osf_vlrpar, '+
                             '  osf_usualt = :osf_usualt, osf_datalt = :osf_datalt, osf_horalt = :osf_horalt '+
                             ' WHERE  osf_codigo = :osf_codigo ';
            qDel.ParamByName('osf_numbol').Text       := edNumBol.Text;
            qDel.ParamByName('osf_datvnc').AsDate     := edDatvnc.Date;
            qDel.ParamByName('osf_vlrpar').AsFloat    := FormataNum( edvlrpar.Text );
            qDel.ParamByName('osf_usualt').Text       :=  sysUsuario ;
            qDel.ParamByName('osf_datalt').AsDate     := now ;
            qDel.ParamByName('osf_horalt').Text       := TimeToStr(time) ;
            qDel.ParamByName('osf_codigo').AsInteger  := nRecPct;
            qDel.ExecSQL;

         btnCanFat.Caption    := 'Modificar';
         btnCanFat.ImageIndex :=  1092 ;
         edNumBol.Clear;
         edDatvnc.Date  := now;
         edvlrpar.Text  := FormatCurr('R$ ###,##0.00', 0 );

         nRecPct := 0 ;
         RefreshGrid ;
         campositens ;
         btninc;

         FreeAndNil(qDel);



     end;

  end;
end;

procedure Tfrmmanutcab.btnExcFatClick(Sender: TObject);
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
    qDel.SQl.Text    :='DELETE FROM   '+U_funcao.SelSchema('manutfpg')+' WHERE osf_codosp = :codosp and osf_codigo = :codccf';
    qDel.ParamByName('codosp').Text  :=  osc_codigo.Text ;
    qDel.ParamByName('codccf').Text  :=  dbgFatura.DataSource.DataSet.FieldByName('osf_codigo').Text ;
    qDel.ExecSQL;
    RefreshGrid ;
    campositens ;
    btninc;
    dbgFatura.SetFocus;
    FreeAndNil(qDel);


  end;
end;

procedure Tfrmmanutcab.btnExcluirExecute(Sender: TObject);
Var
aSubTab : TArrayDim2;
n: Integer;
begin
   SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'manutpcs';     aSubTab[n][1] := 'osp_codosc';
   SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'manutsrv';     aSubTab[n][1] := 'oss_codosc';
   SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'manutfpg';     aSubTab[n][1] := 'osf_codosc';
   If Exclui2(cTabela, aSubTab,  osc_codigo, btnExcluir) Then Begin;
       RefreshDados('T');
       ativaButoes(1);
       limpaget;
       lMostra := True;
       ativaget;
       navegacao(4);
       acampo := 1;
       nNew   := acampo;
   End;

end;

procedure Tfrmmanutcab.btnExcluItemClick(Sender: TObject);
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
    qDel.SQl.Text    :='DELETE FROM   '+U_funcao.SelSchema('manutpcs')+' WHERE osp_codosc = :codosc and osp_codigo = :codosp';
    qDel.ParamByName('codosc').Text  :=  osc_codigo.Text ;
    qDel.ParamByName('codosp').Text  :=   dbgPecas.DataSource.DataSet.FieldByName('osp_codigo').Text ;
    qDel.ExecSQL;

    RefreshGrid ;
    campositens ;
    btninc;
    edcodpec.SetFocus;
    FreeAndNil(qDel);


  end;


end;

procedure Tfrmmanutcab.btnGravaExecute(Sender: TObject);
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
   lMostra := True;
   ativaget;
   PgControle.TabIndex:= 0;
   RefreshGrid ;
   campositens ;
   btninc;
   osc_codigo.SetFocus;
end;

procedure Tfrmmanutcab.btnImpNotraExecute(Sender: TObject);
Var
cTitulo : String;
nTipo : Integer;
begin
{ Formulando o tipo de impressao }
cTitulo := ' ORDEM DE SERVIÇO DE MANUTENÇÃO ' ;

    sqlmanutcab.Close ;
    climanutcab.Close ;
    sqlmanutcab.SQL.Text := ' Select * From '+U_funcao.SelSchema('manutcab')
                            +' LEFT Join '+U_funcao.SelSchema('veiculoatv')+' on vat_placa = osc_codplc '
                            +' LEFT Join '+U_funcao.SelSchema('fornecedor')+' on fnd_codigo = osc_codfnd '
                            +' LEFT Join '+U_funcao.SelSchema('modelo')+' on mdl_codigo = vat_codmdl  '
                            +' LEFT Join '+U_funcao.SelSchema('formapgm')+' on fpg_codigo = osc_codfpg '
                            +' where osc_codigo  = '+osc_codigo.Text;
    sqlmanutcab.Open;
    climanutcab.Active := True;



 {
    // Gerando os Turnos
  with dmEmp.sqlCargo do
     begin
       Close;
       Sql.Text :='SELECT * FROM '+U_funcao.SelSchema('cargo')+' order by '+fIIF(rbAlfa.Checked, ' cgo_nome ', ' cgo_codigo ' );
       Open;
  end;
  }

  // Cabeçalho do relatorio
  CabReports(ImpNota, cTitulo, 'notamanutencao.fr3' );
  nTipo := 1;
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


end;

procedure Tfrmmanutcab.btnIncFatClick(Sender: TObject);
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
  qDel1.SQl.Text    :='Select COALESCE( sum( osf_vlrpar ),0) as totpar FROM '+U_funcao.SelSchema('manutfpg')+' WHERE osf_codosc = :codosc ';
  qDel1.ParamByName('codosc').Text  := fIIF( osc_codigo.Text <> '',osc_codigo.Text,'0') ;
  qDel1.Open;

  if  (  qDel1.FieldByName('totpar').Value + FormataNum( edvlrpar.Text ) )  >   FormataNum( lbTotGeral.Caption )   then begin
      ShowMessage('A soma do(s) valo(res) faturado(s) é superior ao da Nota '+#13+'Não é possível incluir este valor '+#13+#13+'Necesário correção! ');

      edvlrpar.SetFocus;
  end else begin
      IniTransacao;
      qDel            := TFDQuery.Create(Nil);
      // Fazendo a Exclusão de Itens relacionandos nas SubTabelas
      qDel.Connection  := dmEmp.SqlConSis;
      For i := 1 to StrToInt(osc_totpar.Text) do begin
          qDel.Close;
          qDel.SQl.Text   :='insert into '+U_funcao.SelSchema('manutfpg')+' ( osf_codosc,   osf_NumBol, osf_datvnc,  osf_vlrpar,  osf_usuinc,  osf_datinc,  osf_horinc ) values  '+
                                                                            ' ( :osf_codosc, :osf_NumBol, :osf_datvnc, :osf_vlrpar, :osf_usuinc, :osf_datinc, :osf_horinc )  ';
          qDel.ParamByName('osf_codosc').Text     := osc_codigo.Text;
          qDel.ParamByName('osf_NumBol').Text     := StrZero( StrToInt(osc_codigo.Text),10 )+FormatDateTime('yyyymmdd',now)+StrZero( PgQtdPrcFatura( osc_codigo.Text ) ,27 );
          qDel.ParamByName('osf_datvnc').AsDate   := IncMonth(now,i);   //;edDatvnc.Date  ;
          qDel.ParamByName('osf_vlrpar').AsFloat  := formatanum( edVlrPrc.Text ) ;
          qDel.ParamByName('osf_usuinc').Text     :=  sysUsuario ;
          qDel.ParamByName('osf_datinc').AsDate   := now ;
          qDel.ParamByName('osf_horinc').Text     := TimeToStr(time) ;
          qDel.ExecSQL;
      end;
      RefreshGrid ;
      campositens ;
      btninc;
      dbgFatura.SetFocus;
      Ativador;
      FreeAndNil(qDel);
      FreeAndNil(qDel1);
  end;


end;

procedure Tfrmmanutcab.btnIncItemClick(Sender: TObject);
Var
edCfo, edCst: String;
begin

 if nNew > 0 then begin
    nNew := GravarSub(cTabela,cPre,cPre+'codigo','X','', nNew, aCampo, frmmanutcab, dmEmp.SqlConSis, aEdits, sqlNew, dmEmp.sqlmanutcab, osc_codigo );
 End;

{ Rotina para guardar as informações}
 dmEmp.climanutpcs.Close;
 dmEmp.Sqlmanutpcs.Close;
 with dmEmp.Sqlmanutpcs do
   begin
     Close;
      SQL.Text :='insert into '+U_funcao.SelSchema('manutpcs')
                                        +' ( osp_codosc, osp_codtpc,osp_codcst,osp_codcfo,osp_vlrpec,osp_qtdpec,osp_vlrdsc,osp_pctdsc, '
																				+' osp_kmgtia,osp_kmatua,osp_diagar,osp_pcticm,osp_vlricm,osp_pctipi,osp_vlripi,osp_pcticmst, '
																				+' osp_vlricmst,osp_usuinc,osp_datinc,osp_horinc ) '
																				+' Values (:osp_codosc, :osp_codtpc,:osp_codcst,:osp_codcfo,:osp_vlrpec,:osp_qtdpec,:osp_vlrdsc,:osp_pctdsc, '
																				+' :osp_kmgtia, :osp_kmatua, :osp_diagar,:osp_pcticm,:osp_vlricm,:osp_pctipi,:osp_vlripi,:osp_pcticmst, '
																				+' :osp_vlricmst,:osp_usuinc,:osp_datinc,:osp_horinc )';


     edCfo   := fIIF( edCodCfo.Text <> '', edCodCfo.Text, 'NULL' );
     edCst   := fIIF( edCodCst.Text <> '', edCodCst.Text, 'NULL' );

      ParamByName('osp_codosc').Text       := osc_codigo.Text;
      ParamByName('osp_codtpc').Text       := edcodpec.Text;
      ParamByName('osp_codcst').Text       := edCst;
      ParamByName('osp_codcfo').Text       := edCfo;
      ParamByName('osp_vlrpec').AsFloat    := FormataNum( edvlrpec.Text );
      ParamByName('osp_qtdpec').AsFloat    := FormataNum( edqtdpec.Text );
      ParamByName('osp_vlrdsc').AsFloat    := FormataNum( edvlrdes.Text );
      ParamByName('osp_pctdsc').AsFloat    := FormataNum( edpctpec.Text );
      ParamByName('osp_kmgtia').AsFloat    := FormataNum( edkmgtia.Text );
      ParamByName('osp_kmatua').AsFloat    := FormataNum( osc_kmmnt.Text );
      ParamByName('osp_diagar').AsFloat    := FormataNum( eddiagar.Text );
      ParamByName('osp_pcticm').AsFloat    := FormataNum( edpcticm.Text );
      ParamByName('osp_vlricm').AsFloat    := FormataNum( edVlricm.Text );
      ParamByName('osp_pctipi').AsFloat    := FormataNum( edpctipi.Text );
      ParamByName('osp_vlripi').AsFloat    := FormataNum( edvlripi.Text );
      ParamByName('osp_pcticmst').AsFloat  := FormataNum( edpcticmst.Text ) ;
      ParamByName('osp_vlricmst').AsFloat  := FormataNum( edvlricmst.Text ) ;
      ParamByName('osp_usuinc').Text       :=  sysUsuario ;
      ParamByName('osp_datinc').asdate     := now;
      ParamByName('osp_horinc').Text       := TimeToStr(time);
     IniTransacao;
     ExecSQL;
 end;
 RefreshGrid ;
 campositens ;
 btninc;
 edcodpec.SetFocus;

end;
procedure Tfrmmanutcab.campositens;
begin
  edcodpec.Clear;
  edcodcst.clear;
  edCodCfo.clear;
  edNomPec.Clear;
  edNumBol.Clear;
  edvlrpar.Text       := FormatCurr('R$ ###,##0.00',0);
  edqtdpec.Text       := FormatCurr('###,##1.000',0);
  edvlrpec.Text       := FormatCurr('R$ ###,##0.00',0);
  edpctpec.Text       := FormatCurr('##0.00',0);
  edvlrdes.Text       := FormatCurr('R$ #,##0.00',0);
  edvlrtot.Text       := FormatCurr('R$ #,###,##0.00',0);
  edpcticm.Text       := FormatCurr('##0.00%',0);
  edvlricm.Text       := FormatCurr('R$ #,###,##0.00',0);
  edpctipi.Text       := FormatCurr('##0.00%',0);
  edvlripi.Text       := FormatCurr('R$ #,###,##0.00',0);
  edpcticmst.Text     := FormatCurr('##0.00%',0);
  edvlricmst.Text     := FormatCurr('R$ #,###,##0.00',0);
  edkmgtia.Text       := FormatCurr('Km #,###,##0',0);
  eddiagar.Text       := FormatCurr('####,##0',0);

  edcodsrv.Clear;
  edcdscst.clear;
  edCdsCfo.clear;
  edNomSrv.Clear;
  edqtdsrv.Text       := FormatCurr('###,##1.000',0);
  edvlrsrv.Text       := FormatCurr('R$ ###,##0.00',0);
  edpctdsc.Text       := FormatCurr('##0.00%',0);
  edvlrdsc.Text       := FormatCurr('R$ #,##0.00',0);
  edtotser.Text       := FormatCurr('R$ #,###,##0.00',0);
  edSBPctIcms.Text       := FormatCurr('##0.00%',0);
  edSBVlrIcms.Text       := FormatCurr('R$ #,###,##0.00',0);
  edkmSgtia.Text       := FormatCurr('Km #,###,##0',0);
  eddiaSgar.Text       := FormatCurr('####,##0',0);

end;

procedure Tfrmmanutcab.btninc;
begin
  btnIncItem.Enabled    := ( ( edcodpec.Text <> '' ) and  ( FormataNum(edVlrTot.Text) > 0 ) and ( sqlNew.FieldByName('osc_tipoos').text <> 'FATURADO' ) ) ;
  btnExcluItem.Enabled  := (  Not btnIncItem.Enabled  and ( dmEmp.Sqlmanutpcs.RecordCount > 0 )  and ( sqlNew.FieldByName('osc_tipoos').text <> 'FATURADO' ) ) ;
  btnCancekItem.Enabled := ( ( edcodpec.Text <> '' ) and ( Not btnIncItem.Enabled )  and ( sqlNew.FieldByName('osc_tipoos').text <> 'FATURADO' ) ) ;

  btnSIncItem.Enabled    := ( ( edcodsrv.Text <> '' ) and  ( FormataNum(edTotSer.Text) > 0 ) and ( sqlNew.FieldByName('osc_tipoos').text <> 'FATURADO' ) ) ;
  btnSExcluItem.Enabled  := (  Not btnSIncItem.Enabled  and ( dmEmp.Sqlmanutsrv.RecordCount > 0 )  and ( sqlNew.FieldByName('osc_tipoos').text <> 'FATURADO' ) ) ;
  btnSCancelItem.Enabled := ( ( edcodsrv.Text <> '' ) and ( Not btnSIncItem.Enabled )  and ( sqlNew.FieldByName('osc_tipoos').text <> 'FATURADO' ) ) ;




  btnIncFat.Enabled     := ( ( Length(osc_codfpg.Text) > 0 ) and ( Not sqlNew.FieldByName('osc_fatura').AsBoolean ) ) ;
  btnCanFat.Enabled     := ( ( dbgFatura.DataSource.DataSet.RecordCount > 0 ) and (  Not sqlNew.FieldByName('osc_fatura').AsBoolean ) );
  btnExcFat.Enabled     := ( ( Not dbgFatura.DataSource.DataSet.Eof ) and( LowerCase( btnCanFat.Caption ) = 'modificar' ) and ( Not sqlNew.FieldByName('osc_fatura').AsBoolean ) );

   edNumBol.Enabled     := ( LowerCase( btnCanFat.Caption ) <> 'modificar' ) ;
   edDatvnc.Enabled     := ( LowerCase( btnCanFat.Caption ) <> 'modificar' ) ;
   edvlrpar.Enabled     := ( LowerCase( btnCanFat.Caption ) <> 'modificar' ) ;
   osc_codfpg.Enabled   := ( sqlNew.FieldByName('osc_tipoos').text <> 'FATURADO' ) ;
   osc_totpar.Enabled   := ( sqlNew.FieldByName('osc_tipoos').text <> 'FATURADO' ) ;

   grbPecas.Enabled     := ( btnGrava.Enabled and ( Not sqlNew.FieldByName('osc_fatura').AsBoolean ) ) ;
   grbservico.Enabled   := ( btnGrava.Enabled and ( Not sqlNew.FieldByName('osc_fatura').AsBoolean ) ) ;
   grbfatura.Enabled    := ( btnGrava.Enabled and ( Not sqlNew.FieldByName('osc_fatura').AsBoolean ) ) ;
end;


procedure Tfrmmanutcab.btnIniExecute(Sender: TObject);
begin
  navegacao(1);
end;

procedure Tfrmmanutcab.btnNovoExecute(Sender: TObject);
begin
   PgControle.TabIndex := 0;
   acampo := 1;
   nNew   := acampo;
   btnGrava.Enabled := True;
   RefreshDados('S');
   limpaget;
   ativaButoes(1);
   lMostra := True;
   ativaget;
   RefreshDialog;
   RefreshGrid ;
   campositens ;
   btninc;
   osc_totpar.Text := '1';
   osc_datems.SetFocus;

end;

procedure Tfrmmanutcab.btnProxExecute(Sender: TObject);
begin
  navegacao(3);
end;

procedure Tfrmmanutcab.btnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure Tfrmmanutcab.btnSCancelItemClick(Sender: TObject);
begin
{ Cancelamento}
  if MESSAGEBOX(Application.Handle, 'Deseja Cancelar este item?', 'Confirma...', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin
     RefreshGrid ;
     campositens ;
     btninc;
     edCodSrv.SetFocus;
  end;

end;

procedure Tfrmmanutcab.btnSExcluItemClick(Sender: TObject);
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
    qDel.SQl.Text    :='DELETE FROM   '+U_funcao.SelSchema('manutoss')+' WHERE oss_codosc = :codosc and oss_codigo = :codoss';
    qDel.ParamByName('codosc').Text  :=  osc_codigo.Text ;
    qDel.ParamByName('codoss').Text  :=  dbgServico.DataSource.DataSet.FieldByName('oss_codigo').Text ;
    qDel.ExecSQL;

    RefreshGrid ;
    campositens ;
    btninc;
    edCodSrv.SetFocus;
    FreeAndNil(qDel);
  end;


end;

procedure Tfrmmanutcab.btnSIncItemClick(Sender: TObject);
Var
edCfo, edCst: String;
begin

 if nNew > 0 then begin
    nNew := GravarSub(cTabela,cPre,cPre+'codigo','X','', nNew, aCampo, frmmanutcab, dmEmp.SqlConSis, aEdits, sqlNew, dmEmp.sqlmanutcab, osc_codigo );
 End;

{ Rotina para guardar as informações}
 dmEmp.climanutsrv.Close;
 dmEmp.Sqlmanutsrv.Close;
 with dmEmp.Sqlmanutsrv do
   begin
     Close;
      SQL.Text :='insert into '+U_funcao.SelSchema('manutsrv')
                                        +' ( oss_codosc, oss_codtsm,oss_codcst,oss_codcfo,oss_vlrsrv,oss_qtdsrv,oss_vlrdsc,oss_pctdsc, '
																				+' oss_kmgtia,oss_kmatua,oss_diagar,oss_pcticm,oss_vlricm,oss_pctipi,oss_vlripi,oss_pcticmst, '
																				+' oss_vlricmst,oss_usuinc,oss_datinc,oss_horinc ) '
																				+' Values (:oss_codosc, :oss_codtsm,:oss_codcst,:oss_codcfo,:oss_vlrsrv,:oss_qtdsrv,:oss_vlrdsc,:oss_pctdsc, '
																				+' :oss_kmgtia, :oss_kmatua, :oss_diagar,:oss_pcticm,:oss_vlricm,:oss_pctipi,:oss_vlripi,:oss_pcticmst, '
																				+' :oss_vlricmst,:oss_usuinc,:oss_datinc,:oss_horinc )';


     edCfo   := fIIF( edCdsCfo.Text <> '', edCdsCfo.Text, 'NULL' );
     edCst   := fIIF( edCdsCst.Text <> '', edCdsCst.Text, 'NULL' );

      ParamByName('oss_codosc').Text       := osc_codigo.Text;
      ParamByName('oss_codtsm').Text       := edcodsrv.Text;
      ParamByName('oss_codcst').Text       := edCst;
      ParamByName('oss_codcfo').Text       := edCfo;
      ParamByName('oss_vlrsrv').AsFloat    := FormataNum( edvlrsrv.Text );
      ParamByName('oss_qtdsrv').AsFloat    := FormataNum( edqtdsrv.Text );
      ParamByName('oss_vlrdsc').AsFloat    := FormataNum( edvlrdsc.Text );
      ParamByName('oss_pctdsc').AsFloat    := FormataNum( edpctdsc.Text );
      ParamByName('oss_kmgtia').AsFloat    := FormataNum( edkmSgtia.Text );
      ParamByName('oss_kmatua').AsFloat    := FormataNum( osc_kmmnt.Text );
      ParamByName('oss_diagar').AsFloat    := FormataNum( eddiaSgar.Text );
      ParamByName('oss_pcticm').AsFloat    := FormataNum( edSBPctIcms.Text );
      ParamByName('oss_vlricm').AsFloat    := FormataNum( edSBVlrIcms.Text );
      ParamByName('oss_pctipi').AsFloat    := 0 ;
      ParamByName('oss_vlripi').AsFloat    := 0 ;
      ParamByName('oss_pcticmst').AsFloat  := 0 ;
      ParamByName('oss_vlricmst').AsFloat  := 0 ;
      ParamByName('oss_usuinc').Text       :=  sysUsuario ;
      ParamByName('oss_datinc').asdate     := now;
      ParamByName('oss_horinc').Text       := TimeToStr(time);
     IniTransacao;
     ExecSQL;
 end;
 RefreshGrid ;
 campositens ;
 btninc;
 edcodsrv.SetFocus;


end;

procedure Tfrmmanutcab.btnUltExecute(Sender: TObject);
begin
  navegacao(4);
end;

procedure Tfrmmanutcab.dbgFaturaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    if gdFocused in State then  begin
      dbgFatura.Canvas.Brush.Color  := Azul_Escuro;
      dbgFatura.Canvas.Font.Color   := Branco;
      dbgFatura.Canvas.FillRect(Rect);
      dbgFatura.DefaultDrawDataCell(Rect, Column.Field, State);
    end else begin

        if Odd(dbgFatura.DataSource.DataSet.RecNo) then begin
          dbgFatura.Canvas.Brush.Color  := Branco;
          dbgFatura.Canvas.Font.Color   := Preto;
          dbgFatura.Canvas.FillRect(Rect);
          dbgFatura.DefaultDrawDataCell(Rect, Column.Field, State);

        End else Begin
          dbgFatura.Canvas.Brush.Color  := Cinza_Sintilante;
          dbgFatura.Canvas.Font.Color   := Preto;
          dbgFatura.Canvas.FillRect(Rect);
          dbgFatura.DefaultDrawDataCell(Rect, Column.Field, State);
        End;

    end;

end;

procedure Tfrmmanutcab.dbgPecasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    if gdFocused in State then  begin
      dbgpecas.Canvas.Brush.Color  := Azul_Escuro;
      dbgpecas.Canvas.Font.Color   := Branco;
      dbgpecas.Canvas.FillRect(Rect);
      dbgpecas.DefaultDrawDataCell(Rect, Column.Field, State);
    end else begin

        if Odd(dbgpecas.DataSource.DataSet.RecNo) then begin
          dbgpecas.Canvas.Brush.Color  := Branco;
          dbgpecas.Canvas.Font.Color   := Preto;
          dbgpecas.Canvas.FillRect(Rect);
          dbgpecas.DefaultDrawDataCell(Rect, Column.Field, State);

        End else Begin
          dbgpecas.Canvas.Brush.Color  := Cinza_Sintilante;
          dbgpecas.Canvas.Font.Color   := Preto;
          dbgpecas.Canvas.FillRect(Rect);
          dbgpecas.DefaultDrawDataCell(Rect, Column.Field, State);
        End;

    end;

end;

procedure Tfrmmanutcab.dbgServicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    if gdFocused in State then  begin
      dbgservico.Canvas.Brush.Color  := Azul_Escuro;
      dbgservico.Canvas.Font.Color   := Branco;
      dbgservico.Canvas.FillRect(Rect);
      dbgservico.DefaultDrawDataCell(Rect, Column.Field, State);
    end else begin

        if Odd(dbgservico.DataSource.DataSet.RecNo) then begin
          dbgservico.Canvas.Brush.Color  := Branco;
          dbgservico.Canvas.Font.Color   := Preto;
          dbgservico.Canvas.FillRect(Rect);
          dbgservico.DefaultDrawDataCell(Rect, Column.Field, State);

        End else Begin
          dbgservico.Canvas.Brush.Color  := Cinza_Sintilante;
          dbgservico.Canvas.Font.Color   := Preto;
          dbgservico.Canvas.FillRect(Rect);
          dbgservico.DefaultDrawDataCell(Rect, Column.Field, State);
        End;

    end;

end;

procedure Tfrmmanutcab.edCdSCfoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      edcdscfoRightButtonClick(Self);
  end;
Finally

End;

end;

procedure Tfrmmanutcab.edCdSCfoRightButtonClick(Sender: TObject);
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
  Pesquisa.AddReg('cfo_codigo','Código'             ,'edCdScfo' ,5  ,'por Código' );
  Pesquisa.AddReg('cfo_nome'  ,'Descrição'          ,'cfo_nome' ,50 ,'por Descrição' );

  Pesquisa.acessa(edCdScfo);
  edCdScfo.text   :=  Pesquisa.RecReg('cfo_codigo');
  FreeAndNil( Pesquisa );

end;

procedure Tfrmmanutcab.edCdSCstKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      edcdscstRightButtonClick(Self);
  end;
Finally

End;

end;

procedure Tfrmmanutcab.edCdSCstRightButtonClick(Sender: TObject);
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
  Pesquisa.AddReg('cst_codigo','Código'             ,'edCdScst' ,5  ,'por Código' );
  Pesquisa.AddReg('cst_descri','Descrição'          ,'cst_codigo' ,50 ,'por Descrição' );

  Pesquisa.acessa(edCdScst);
  edCdScst.text   :=  Pesquisa.RecReg('cst_codigo');
  FreeAndNil( Pesquisa );


end;

procedure Tfrmmanutcab.edCodCfoKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrmmanutcab.edCodCfoRightButtonClick(Sender: TObject);
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
  FreeAndNil( Pesquisa );

end;

procedure Tfrmmanutcab.edCodCstKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrmmanutcab.edCodCstRightButtonClick(Sender: TObject);
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
  FreeAndNil( Pesquisa );

end;

procedure Tfrmmanutcab.edcodpecExit(Sender: TObject);
begin
  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqltbpecas ;
  edNompec.Text      :=  Pesquisa.Relacao('tbpecas',edcodpec,'tpc_codigo','tpc_nome') ;
  edCodCst.Text      :=  Pesquisa.Relacao('tbpecas',edcodpec,'tpc_codigo','tpc_codcst') ;
  edCodcfo.Text      :=  Pesquisa.Relacao('tbpecas',edcodpec,'tpc_codigo','tpc_codcfo') ;
  FreeAndNil( Pesquisa );

end;

procedure Tfrmmanutcab.edcodpecKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      edcodpecRightButtonClick(Self);
  end;
Finally

End;

end;

procedure Tfrmmanutcab.edcodpecRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dstbpecas ;
  Pesquisa.sqlTabela :=  dmEmp.sqltbpecas ;
  Pesquisa.cliTabela :=  dmEmp.clitbpecas ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Peças de Veículos';
  Pesquisa.nmTabela  := 'tbpecas' ;
  Pesquisa.NovoCad   := 'tbpecas' ;
  Pesquisa.QuerySql  := ' sgm_codgrm = '+codsgm ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('tpc_codigo','Código'             ,'edcodpec' ,5  ,'por Código' );
  Pesquisa.AddReg('tpc_nome'  ,'Descriminação'      ,'edNompec' ,35 ,'por Descrição' );


  Pesquisa.acessa(edcodpec);
  edcodpec.text   :=  Pesquisa.RecReg('tpc_codigo');
  edNompec.text   :=  Pesquisa.RecReg('tpc_nome');
  FreeAndNil( Pesquisa );

end;

procedure Tfrmmanutcab.edCodSrvExit(Sender: TObject);
begin
  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqltbservico ;
  edNomSrv.Text      :=  Pesquisa.Relacao('tbservico',edCodSrv,'tsm_codigo','tsm_nome') ;
  btninc;
  FreeAndNil( Pesquisa );


end;

procedure Tfrmmanutcab.edCodSrvKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      edCodSrvRightButtonClick(Self);
  end;
Finally

End;

end;

procedure Tfrmmanutcab.edCodSrvRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dstbservico ;
  Pesquisa.sqlTabela :=  dmEmp.sqltbservico ;
  Pesquisa.cliTabela :=  dmEmp.clitbservico ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Serviços Automotivos';
  Pesquisa.nmTabela  := 'tbservico' ;
  Pesquisa.NovoCad   := 'tbservico' ;
  Pesquisa.QuerySql  := ' sgm_codgrm = '+codsgm ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('tsm_codigo','Código'             ,'tsm_codigo' ,5  ,'por Código' );
  Pesquisa.AddReg('tsm_nome'  ,'Serviços'           ,'edNomFpg'   ,30 ,'por Serviços' );


  Pesquisa.acessa(edCodSrv);
  edCodSrv.text   :=  Pesquisa.RecReg('tsm_codigo');
  edNomSrv.text   :=  Pesquisa.RecReg('tsm_nome');
  FreeAndNil( Pesquisa );

end;

procedure Tfrmmanutcab.eddiasgarKeyPress(Sender: TObject; var Key: Char);
begin
  KeyKm( Sender, Key );
end;

procedure Tfrmmanutcab.edkmgtiaKeyPress(Sender: TObject; var Key: Char);
begin
  KeyKm( Sender, Key );
end;

procedure Tfrmmanutcab.edPctDscExit(Sender: TObject);
begin
  edVlrDsc.Text :=  Calc_perc( Sender, edvlrsrv, edvlrdes, edPctDsc, '$' )
end;

procedure Tfrmmanutcab.edPctDscKeyPress(Sender: TObject; var Key: Char);
begin
KeyPercent( Sender , Key );
end;

procedure Tfrmmanutcab.edpcticmKeyPress(Sender: TObject; var Key: Char);
begin
  KeyPercent( Sender , Key );
end;

procedure Tfrmmanutcab.edpcticmstKeyPress(Sender: TObject; var Key: Char);
begin
  KeyPercent( Sender , Key );
end;

procedure Tfrmmanutcab.edpctipiKeyPress(Sender: TObject; var Key: Char);
begin
  KeyPercent( Sender , Key );
end;

procedure Tfrmmanutcab.edpctpecExit(Sender: TObject);
begin
  edvlrdes.Text :=  Calc_perc( Sender, edvlrpec, edvlrdes, edpctpec, '$' )
end;

procedure Tfrmmanutcab.edpctpecKeyPress(Sender: TObject; var Key: Char);
begin
KeyPercent( Sender , Key );
end;

procedure Tfrmmanutcab.edqtdpecKeyPress(Sender: TObject; var Key: Char);
begin
    ChkQtd( Sender , Key );
end;

procedure Tfrmmanutcab.edQtdSrvKeyPress(Sender: TObject; var Key: Char);
begin
    ChkQtd( Sender , Key );
end;

procedure Tfrmmanutcab.edSBPctIcmsKeyPress(Sender: TObject; var Key: Char);
begin
  KeyPercent( Sender , Key );
end;

procedure Tfrmmanutcab.edSBVlrIcmsKeyPress(Sender: TObject; var Key: Char);
begin
    KeyValor( Sender , Key );
end;

procedure Tfrmmanutcab.edvlrdesExit(Sender: TObject);
begin
  edpctpec.Text :=  Calc_perc( Sender, edvlrpec, edvlrdes, edpctpec, '%' )
end;

procedure Tfrmmanutcab.edvlrdesKeyPress(Sender: TObject; var Key: Char);
begin
    KeyValor( Sender , Key );
end;

procedure Tfrmmanutcab.edVlrDscExit(Sender: TObject);
begin
 edPctDsc.Text :=  Calc_perc( Sender, edVlrSrv, edVlrDsc, edpctdsc, '%' )
end;

procedure Tfrmmanutcab.edVlrDscKeyPress(Sender: TObject; var Key: Char);
begin
    KeyValor( Sender , Key );
end;

procedure Tfrmmanutcab.edVlricmKeyPress(Sender: TObject; var Key: Char);
begin
    KeyValor( Sender , Key );
end;

procedure Tfrmmanutcab.edvlricmstKeyPress(Sender: TObject; var Key: Char);
begin
    KeyValor( Sender , Key );
end;

procedure Tfrmmanutcab.edvlripiKeyPress(Sender: TObject; var Key: Char);
begin
    KeyValor( Sender , Key );
end;

procedure Tfrmmanutcab.edvlrpecExit(Sender: TObject);
begin
edVlrTot.Text := Soma_masc( edvlrpec, edvlrdes, edqtdpec  ) ;
btninc
end;

procedure Tfrmmanutcab.edvlrpecKeyPress(Sender: TObject; var Key: Char);
begin
    KeyValor( Sender , Key );
end;

procedure Tfrmmanutcab.edVlrSrvExit(Sender: TObject);
begin
edTotSer.Text := Soma_masc( edvlrSrv, edvlrdes, edqtdsrv  ) ;
btninc

end;

procedure Tfrmmanutcab.edVlrSrvKeyPress(Sender: TObject; var Key: Char);
begin
    KeyValor( Sender , Key );
end;

procedure Tfrmmanutcab.RefreshGrid;
Var
  nPecas, nServ, nDesc, nTotGer : Double;
  qDel : TFDQuery;
  Encargos : Double;
begin
  nPecas:=0; nServ:=0; nDesc:=0; nTotGer:=0;
  dmEmp.Sqlmanutpcs.Close;
  dmEmp.climanutpcs.Close;
  with dmEmp.Sqlmanutpcs do
    begin
      SQL.Text := ' Select *, ((osp_vlrpec - osp_vlrdsc ) * osp_qtdpec ) as Total  From '+U_funcao.SelSchema('manutpcs')
                 +'  LEFT Join  '+U_funcao.SelSchema('tbpecas')+' on tpc_codigo = osp_codtpc '
                 +'  LEFT Join '+U_funcao.SelSchema('cst')+' on cst_codigo = osp_codcst '
                 +'  LEFT Join '+U_funcao.SelSchema('cfop')+' on cfo_codigo = osp_codcfo '
                 +'  where osp_codosc = '+fIIf( Length( trim(osc_codigo.Text)) > 0, QuotedStr(osc_codigo.Text),'0' ) ;
      Open;
  end;
  dmEmp.climanutpcs.Active := True;

          dmEmp.Sqlmanutpcs.First;
          while Not dmEmp.Sqlmanutpcs.Eof  do begin
              nPecas := ( nPecas + dmEmp.Sqlmanutpcs.FieldByName('total').AsFloat );
              nDesc  := ( nDesc  + ( dmEmp.Sqlmanutpcs.FieldByName('osp_vlrdsc').AsFloat * dmEmp.Sqlmanutpcs.FieldByName('osp_qtdpec').AsFloat ) );
             dmEmp.Sqlmanutpcs.Next;
          end;


  dmEmp.Sqlmanutsrv.Close;
  dmEmp.climanutsrv.Close;
  with dmEmp.Sqlmanutsrv do
    begin
      SQL.Text := ' Select *, ((oss_vlrsrv - oss_vlrdsc ) * oss_qtdsrv ) as Total  From '+U_funcao.SelSchema('manutsrv')
                 +'  LEFT Join  '+U_funcao.SelSchema('tbservico')+' on tsm_codigo = oss_codtsm '
                 +'  LEFT Join '+U_funcao.SelSchema('cst')+' on cst_codigo = oss_codcst '
                 +'  LEFT Join '+U_funcao.SelSchema('cfop')+' on cfo_codigo = oss_codcfo '
                 +'  where oss_codosc = '+fIIf( Length( trim(osc_codigo.Text)) > 0, QuotedStr(osc_codigo.Text),'0' ) ;
      Open;
  end;
  dmEmp.climanutsrv.Active := True;

          dmEmp.Sqlmanutsrv.First;
          while Not dmEmp.Sqlmanutsrv.Eof  do begin
              nServ  := ( nServ + dmEmp.Sqlmanutsrv.FieldByName('total').AsFloat );
              nDesc  := ( nDesc  + ( dmEmp.Sqlmanutsrv.FieldByName('oss_vlrdsc').AsFloat * dmEmp.Sqlmanutsrv.FieldByName('oss_qtdsrv').AsFloat ) );
             dmEmp.Sqlmanutsrv.Next;
          end;

  dmEmp.Sqlmanutfpg.Close;
  dmEmp.climanutfpg.Close;
  with dmEmp.Sqlmanutfpg do
    begin
      SQL.Text := ' Select *, ( osf_vlrpar * osc_totpar ) as Total  From '+U_funcao.SelSchema('manutfpg')
                  +' LEFT Join '+U_funcao.SelSchema('manutcab')+' on osc_codigo = osf_codosc '
                  +' where osf_codosc = '+U_funcao.fIIf( Length( trim(osc_codigo.Text)) > 0, QuotedStr(osc_codigo.Text),QuotedStr('0') )
                  +' order by osf_datvnc ' ;
      Open;
  end;
  dmEmp.climanutfpg.Active := True;


  nTotGer             := ( nPecas + nServ );
  lbTotalPec.Caption  := FormatCurr('R$ #,###,##0.00',nPecas);
  lbTotSer.Caption    := FormatCurr('R$ #,###,##0.00',nServ);
  lbTotDesc.Caption   := FormatCurr('R$ #,###,##0.00',nDesc);
  lbTotGeral.Caption  := FormatCurr('R$ #,###,##0.00',nTotGer);
  edVlrPrc.Text       := FormatCurr('R$ #,###,##0.00',( FormataNum(lbTotGeral.Caption) * FormataNum(osc_totpar.text) ));

  dbgpecas.Refresh;
  dbgServico.Refresh;
  dbgFatura.Refresh;


end;

initialization
  RegisterClass(Tfrmmanutcab);


end.
