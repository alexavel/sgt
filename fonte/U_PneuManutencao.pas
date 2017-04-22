unit U_PneuManutencao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, ImgList, ExtCtrls, ComCtrls, xmldom,
  XMLIntf, IdHTTP, msxmldom, XMLDoc, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, ExtDlgs, RibbonLunaStyleActnCtrls,
  ToolWin, ActnMan, ActnCtrls, jpeg, edittuning, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, U_ClasseUtil,U_Classcons, ZDataset, ZDatasetUtils,
  Vcl.Buttons, U_ClassCad, Vcl.Grids, Vcl.DBGrids, Datasnap.Provider,
  Datasnap.DBClient, ZAbstractRODataset, ZAbstractDataset, frxClass, frxDBSet, StrUtils,
  System.ImageList, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;


type
  TfrmPneuMnt = class(TForm)
    Banner: TPanel;
    imgLogo: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    ImageList1: TImageList;
    ActDlg: TActionManager;
    btnHist: TAction;
    btnMet: TAction;
    btnExcluir: TAction;
    btnGrava: TAction;
    btnCancela: TAction;
    btnIni: TAction;
    btnAnt: TAction;
    btnProx: TAction;
    btnUlt: TAction;
    btnSair: TAction;
    grbPneus: TGroupBox;
    imgpneus: TImageList;
    grbVeiculo: TGroupBox;
    sqlPneuEtq: TZQuery;
    dsPneuEtq: TDataSource;
    cliPneuEtq: TClientDataSet;
    dspPneuEtq: TDataSetProvider;
    sqlPneuEtqpiv_codigo: TIntegerField;
    sqlPneuEtqpiv_numser: TWideStringField;
    sqlPneuEtqpiv_numnfe: TWideStringField;
    sqlPneuEtqpiv_vlrcto: TFloatField;
    sqlPneuEtqpiv_mfogo: TWideStringField;
    sqlPneuEtqpiv_numdot: TWideStringField;
    sqlPneuEtqpiv_codpmd: TIntegerField;
    sqlPneuEtqpiv_codpds: TIntegerField;
    sqlPneuEtqpiv_codplc: TWideStringField;
    sqlPneuEtqpiv_mlmsc1: TWideStringField;
    sqlPneuEtqpiv_mlmsc2: TWideStringField;
    sqlPneuEtqpiv_mlmsc3: TWideStringField;
    sqlPneuEtqpiv_mlmsc4: TWideStringField;
    sqlPneuEtqpiv_mlmsc5: TWideStringField;
    sqlPneuEtqpiv_mlmsc6: TWideStringField;
    sqlPneuEtqpiv_kmvda1: TFloatField;
    sqlPneuEtqpiv_kmvda2: TFloatField;
    sqlPneuEtqpiv_kmvda3: TFloatField;
    sqlPneuEtqpiv_kmvda4: TFloatField;
    sqlPneuEtqpiv_kmvda5: TFloatField;
    sqlPneuEtqpiv_kmvda6: TFloatField;
    sqlPneuEtqpiv_kmvda7: TFloatField;
    sqlPneuEtqpiv_kmvda8: TFloatField;
    sqlPneuEtqpiv_kmvda9: TFloatField;
    sqlPneuEtqpiv_status: TWideStringField;
    sqlPneuEtqpiv_datcmp: TDateField;
    sqlPneuEtqpiv_locpne: TWideStringField;
    sqlPneuEtqpiv_usuinc: TWideStringField;
    sqlPneuEtqpiv_datinc: TDateField;
    sqlPneuEtqpiv_horinc: TWideStringField;
    sqlPneuEtqpiv_usualt: TWideStringField;
    sqlPneuEtqpiv_datalt: TDateField;
    sqlPneuEtqpiv_horalt: TWideStringField;
    sqlPneuEtqpmd_codigo: TIntegerField;
    sqlPneuEtqpmd_nome: TWideStringField;
    sqlPneuEtqpmd_sucref: TWideStringField;
    sqlPneuEtqpmd_sucnov: TWideStringField;
    sqlPneuEtqpmd_codpds: TIntegerField;
    sqlPneuEtqpmd_codpdm: TIntegerField;
    sqlPneuEtqpmd_codpfb: TIntegerField;
    sqlPneuEtqpmd_kmvid1: TFloatField;
    sqlPneuEtqpmd_kmvid2: TFloatField;
    sqlPneuEtqpmd_kmvid3: TFloatField;
    sqlPneuEtqpmd_kmvid4: TFloatField;
    sqlPneuEtqpmd_kmvid5: TFloatField;
    sqlPneuEtqpmd_kmvid6: TFloatField;
    sqlPneuEtqpmd_kmvid7: TFloatField;
    sqlPneuEtqpmd_kmvid8: TFloatField;
    sqlPneuEtqpmd_kmvid9: TFloatField;
    sqlPneuEtqpmd_usuinc: TWideStringField;
    sqlPneuEtqpmd_datinc: TDateField;
    sqlPneuEtqpmd_horinc: TWideStringField;
    sqlPneuEtqpmd_usualt: TWideStringField;
    sqlPneuEtqpmd_datalt: TDateField;
    sqlPneuEtqpmd_horalt: TWideStringField;
    sqlPneuEtqpds_codigo: TIntegerField;
    sqlPneuEtqpds_nome: TWideStringField;
    sqlPneuEtqpds_sucos: TWideStringField;
    sqlPneuEtqpds_usuinc: TWideStringField;
    sqlPneuEtqpds_datinc: TDateField;
    sqlPneuEtqpds_horinc: TWideStringField;
    sqlPneuEtqpds_usualt: TWideStringField;
    sqlPneuEtqpds_datalt: TDateField;
    sqlPneuEtqpds_horalt: TWideStringField;
    sqlPneuEtqpdm_codigo: TIntegerField;
    sqlPneuEtqpdm_nome: TWideStringField;
    sqlPneuEtqpdm_usuinc: TWideStringField;
    sqlPneuEtqpdm_datinc: TDateField;
    sqlPneuEtqpdm_horinc: TWideStringField;
    sqlPneuEtqpdm_usualt: TWideStringField;
    sqlPneuEtqpdm_datalt: TDateField;
    sqlPneuEtqpdm_horalt: TWideStringField;
    sqlPneuEtqpfb_codigo: TIntegerField;
    sqlPneuEtqpfb_nome: TWideStringField;
    sqlPneuEtqpfb_usuinc: TWideStringField;
    sqlPneuEtqpfb_datinc: TDateField;
    sqlPneuEtqpfb_horinc: TWideStringField;
    sqlPneuEtqpfb_usualt: TWideStringField;
    sqlPneuEtqpfb_datalt: TDateField;
    sqlPneuEtqpfb_horalt: TWideStringField;
    cliPneuEtqpiv_codigo: TIntegerField;
    cliPneuEtqpiv_numser: TWideStringField;
    cliPneuEtqpiv_numnfe: TWideStringField;
    cliPneuEtqpiv_vlrcto: TFloatField;
    cliPneuEtqpiv_mfogo: TWideStringField;
    cliPneuEtqpiv_numdot: TWideStringField;
    cliPneuEtqpiv_codpmd: TIntegerField;
    cliPneuEtqpiv_codpds: TIntegerField;
    cliPneuEtqpiv_codplc: TWideStringField;
    cliPneuEtqpiv_mlmsc1: TWideStringField;
    cliPneuEtqpiv_mlmsc2: TWideStringField;
    cliPneuEtqpiv_mlmsc3: TWideStringField;
    cliPneuEtqpiv_mlmsc4: TWideStringField;
    cliPneuEtqpiv_mlmsc5: TWideStringField;
    cliPneuEtqpiv_mlmsc6: TWideStringField;
    cliPneuEtqpiv_kmvda1: TFloatField;
    cliPneuEtqpiv_kmvda2: TFloatField;
    cliPneuEtqpiv_kmvda3: TFloatField;
    cliPneuEtqpiv_kmvda4: TFloatField;
    cliPneuEtqpiv_kmvda5: TFloatField;
    cliPneuEtqpiv_kmvda6: TFloatField;
    cliPneuEtqpiv_kmvda7: TFloatField;
    cliPneuEtqpiv_kmvda8: TFloatField;
    cliPneuEtqpiv_kmvda9: TFloatField;
    cliPneuEtqpiv_status: TWideStringField;
    cliPneuEtqpiv_datcmp: TDateField;
    cliPneuEtqpiv_locpne: TWideStringField;
    cliPneuEtqpiv_usuinc: TWideStringField;
    cliPneuEtqpiv_datinc: TDateField;
    cliPneuEtqpiv_horinc: TWideStringField;
    cliPneuEtqpiv_usualt: TWideStringField;
    cliPneuEtqpiv_datalt: TDateField;
    cliPneuEtqpiv_horalt: TWideStringField;
    cliPneuEtqpmd_codigo: TIntegerField;
    cliPneuEtqpmd_nome: TWideStringField;
    cliPneuEtqpmd_sucref: TWideStringField;
    cliPneuEtqpmd_sucnov: TWideStringField;
    cliPneuEtqpmd_codpds: TIntegerField;
    cliPneuEtqpmd_codpdm: TIntegerField;
    cliPneuEtqpmd_codpfb: TIntegerField;
    cliPneuEtqpmd_kmvid1: TFloatField;
    cliPneuEtqpmd_kmvid2: TFloatField;
    cliPneuEtqpmd_kmvid3: TFloatField;
    cliPneuEtqpmd_kmvid4: TFloatField;
    cliPneuEtqpmd_kmvid5: TFloatField;
    cliPneuEtqpmd_kmvid6: TFloatField;
    cliPneuEtqpmd_kmvid7: TFloatField;
    cliPneuEtqpmd_kmvid8: TFloatField;
    cliPneuEtqpmd_kmvid9: TFloatField;
    cliPneuEtqpmd_usuinc: TWideStringField;
    cliPneuEtqpmd_datinc: TDateField;
    cliPneuEtqpmd_horinc: TWideStringField;
    cliPneuEtqpmd_usualt: TWideStringField;
    cliPneuEtqpmd_datalt: TDateField;
    cliPneuEtqpmd_horalt: TWideStringField;
    cliPneuEtqpds_codigo: TIntegerField;
    cliPneuEtqpds_nome: TWideStringField;
    cliPneuEtqpds_sucos: TWideStringField;
    cliPneuEtqpds_usuinc: TWideStringField;
    cliPneuEtqpds_datinc: TDateField;
    cliPneuEtqpds_horinc: TWideStringField;
    cliPneuEtqpds_usualt: TWideStringField;
    cliPneuEtqpds_datalt: TDateField;
    cliPneuEtqpds_horalt: TWideStringField;
    cliPneuEtqpdm_codigo: TIntegerField;
    cliPneuEtqpdm_nome: TWideStringField;
    cliPneuEtqpdm_usuinc: TWideStringField;
    cliPneuEtqpdm_datinc: TDateField;
    cliPneuEtqpdm_horinc: TWideStringField;
    cliPneuEtqpdm_usualt: TWideStringField;
    cliPneuEtqpdm_datalt: TDateField;
    cliPneuEtqpdm_horalt: TWideStringField;
    cliPneuEtqpfb_codigo: TIntegerField;
    cliPneuEtqpfb_nome: TWideStringField;
    cliPneuEtqpfb_usuinc: TWideStringField;
    cliPneuEtqpfb_datinc: TDateField;
    cliPneuEtqpfb_horinc: TWideStringField;
    cliPneuEtqpfb_usualt: TWideStringField;
    cliPneuEtqpfb_datalt: TDateField;
    cliPneuEtqpfb_horalt: TWideStringField;
    grbEstoque: TGroupBox;
    dbgEstoque: TDBGrid;
    edPlaca: TButtonedEdit;
    Label15: TLabel;
    edNomMdl: TEdit;
    Label23: TLabel;
    Label5: TLabel;
    edNomChas: TEdit;
    Label21: TLabel;
    edAno: TEdit;
    edNomPot: TEdit;
    Label22: TLabel;
    Label24: TLabel;
    edKmAtual: TEdit;
    ToolBar1: TToolBar;
    GroupBox7: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    edVida: TEdit;
    edModPne: TEdit;
    edPosic: TEdit;
    edKmRodiz: TEdit;
    edFogo: TEdit;
    Label31: TLabel;
    edSituac: TEdit;
    Label29: TLabel;
    edFabric: TEdit;
    grbMapas: TGroupBox;
    eixo01: TImage;
    eixo02: TImage;
    eixo03: TImage;
    eixo06: TImage;
    eixo05: TImage;
    eixo04: TImage;
    eixo07: TImage;
    eixo08: TImage;
    pEsqInt01: TImage;
    pdirInt01: TImage;
    pdirInt02: TImage;
    pdirext02: TImage;
    pEsqInt02: TImage;
    pEsqExt02: TImage;
    pEsqExt01: TImage;
    pdirext01: TImage;
    pdirInt03: TImage;
    pdirext03: TImage;
    pEsqInt03: TImage;
    pEsqExt03: TImage;
    pdirext04: TImage;
    pdirInt04: TImage;
    pEsqInt04: TImage;
    pEsqExt04: TImage;
    pdirext05: TImage;
    pdirInt05: TImage;
    pEsqInt05: TImage;
    pEsqExt05: TImage;
    pdirext06: TImage;
    pdirInt06: TImage;
    pEsqInt06: TImage;
    pEsqExt06: TImage;
    pdirext07: TImage;
    pdirInt07: TImage;
    pEsqInt07: TImage;
    pEsqExt07: TImage;
    pdirext08: TImage;
    pdirInt08: TImage;
    pEsqInt08: TImage;
    pEsqExt08: TImage;
    eixo09: TImage;
    pdirext09: TImage;
    pdirInt09: TImage;
    pEsqInt09: TImage;
    pEsqExt09: TImage;
    GroupBox2: TGroupBox;
    step01: TImage;
    step03: TImage;
    step04: TImage;
    step02: TImage;
    grbManutec: TGroupBox;
    dbgManutec: TDBGrid;
    dsPneumnt: TDataSource;
    cliPneumnt: TClientDataSet;
    IntegerField1: TIntegerField;
    WideStringField1: TWideStringField;
    WideStringField2: TWideStringField;
    FloatField1: TFloatField;
    WideStringField3: TWideStringField;
    WideStringField4: TWideStringField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    WideStringField5: TWideStringField;
    WideStringField6: TWideStringField;
    WideStringField7: TWideStringField;
    WideStringField8: TWideStringField;
    WideStringField9: TWideStringField;
    WideStringField10: TWideStringField;
    WideStringField11: TWideStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    WideStringField12: TWideStringField;
    DateField1: TDateField;
    WideStringField13: TWideStringField;
    WideStringField14: TWideStringField;
    DateField2: TDateField;
    WideStringField15: TWideStringField;
    WideStringField16: TWideStringField;
    DateField3: TDateField;
    WideStringField17: TWideStringField;
    IntegerField4: TIntegerField;
    WideStringField18: TWideStringField;
    WideStringField19: TWideStringField;
    WideStringField20: TWideStringField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    FloatField17: TFloatField;
    FloatField18: TFloatField;
    FloatField19: TFloatField;
    WideStringField21: TWideStringField;
    DateField4: TDateField;
    WideStringField22: TWideStringField;
    WideStringField23: TWideStringField;
    DateField5: TDateField;
    WideStringField24: TWideStringField;
    IntegerField8: TIntegerField;
    WideStringField25: TWideStringField;
    WideStringField26: TWideStringField;
    WideStringField27: TWideStringField;
    DateField6: TDateField;
    WideStringField28: TWideStringField;
    WideStringField29: TWideStringField;
    DateField7: TDateField;
    WideStringField30: TWideStringField;
    IntegerField9: TIntegerField;
    WideStringField31: TWideStringField;
    WideStringField32: TWideStringField;
    DateField8: TDateField;
    WideStringField33: TWideStringField;
    WideStringField34: TWideStringField;
    DateField9: TDateField;
    WideStringField35: TWideStringField;
    IntegerField10: TIntegerField;
    WideStringField36: TWideStringField;
    WideStringField37: TWideStringField;
    DateField10: TDateField;
    WideStringField38: TWideStringField;
    WideStringField39: TWideStringField;
    DateField11: TDateField;
    WideStringField40: TWideStringField;
    dspPneumnt: TDataSetProvider;
    sqlPneumnt: TZQuery;
    IntegerField11: TIntegerField;
    WideStringField41: TWideStringField;
    WideStringField42: TWideStringField;
    FloatField20: TFloatField;
    WideStringField43: TWideStringField;
    WideStringField44: TWideStringField;
    IntegerField12: TIntegerField;
    IntegerField13: TIntegerField;
    WideStringField45: TWideStringField;
    WideStringField46: TWideStringField;
    WideStringField47: TWideStringField;
    WideStringField48: TWideStringField;
    WideStringField49: TWideStringField;
    WideStringField50: TWideStringField;
    WideStringField51: TWideStringField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    FloatField23: TFloatField;
    FloatField24: TFloatField;
    FloatField25: TFloatField;
    FloatField26: TFloatField;
    FloatField27: TFloatField;
    FloatField28: TFloatField;
    FloatField29: TFloatField;
    WideStringField52: TWideStringField;
    DateField12: TDateField;
    WideStringField53: TWideStringField;
    WideStringField54: TWideStringField;
    DateField13: TDateField;
    WideStringField55: TWideStringField;
    WideStringField56: TWideStringField;
    DateField14: TDateField;
    WideStringField57: TWideStringField;
    IntegerField14: TIntegerField;
    WideStringField58: TWideStringField;
    WideStringField59: TWideStringField;
    WideStringField60: TWideStringField;
    IntegerField15: TIntegerField;
    IntegerField16: TIntegerField;
    IntegerField17: TIntegerField;
    FloatField30: TFloatField;
    FloatField31: TFloatField;
    FloatField32: TFloatField;
    FloatField33: TFloatField;
    FloatField34: TFloatField;
    FloatField35: TFloatField;
    FloatField36: TFloatField;
    FloatField37: TFloatField;
    FloatField38: TFloatField;
    WideStringField61: TWideStringField;
    DateField15: TDateField;
    WideStringField62: TWideStringField;
    WideStringField63: TWideStringField;
    DateField16: TDateField;
    WideStringField64: TWideStringField;
    IntegerField18: TIntegerField;
    WideStringField65: TWideStringField;
    WideStringField66: TWideStringField;
    WideStringField67: TWideStringField;
    DateField17: TDateField;
    WideStringField68: TWideStringField;
    WideStringField69: TWideStringField;
    DateField18: TDateField;
    WideStringField70: TWideStringField;
    IntegerField19: TIntegerField;
    WideStringField71: TWideStringField;
    WideStringField72: TWideStringField;
    DateField19: TDateField;
    WideStringField73: TWideStringField;
    WideStringField74: TWideStringField;
    DateField20: TDateField;
    WideStringField75: TWideStringField;
    IntegerField20: TIntegerField;
    WideStringField76: TWideStringField;
    WideStringField77: TWideStringField;
    DateField21: TDateField;
    WideStringField78: TWideStringField;
    WideStringField79: TWideStringField;
    DateField22: TDateField;
    WideStringField80: TWideStringField;
    grbSucata: TGroupBox;
    dbgSucata: TDBGrid;
    sqlPneuSct: TZQuery;
    IntegerField21: TIntegerField;
    WideStringField81: TWideStringField;
    WideStringField82: TWideStringField;
    FloatField39: TFloatField;
    WideStringField83: TWideStringField;
    WideStringField84: TWideStringField;
    IntegerField22: TIntegerField;
    IntegerField23: TIntegerField;
    WideStringField85: TWideStringField;
    WideStringField86: TWideStringField;
    WideStringField87: TWideStringField;
    WideStringField88: TWideStringField;
    WideStringField89: TWideStringField;
    WideStringField90: TWideStringField;
    WideStringField91: TWideStringField;
    FloatField40: TFloatField;
    FloatField41: TFloatField;
    FloatField42: TFloatField;
    FloatField43: TFloatField;
    FloatField44: TFloatField;
    FloatField45: TFloatField;
    FloatField46: TFloatField;
    FloatField47: TFloatField;
    FloatField48: TFloatField;
    WideStringField92: TWideStringField;
    DateField23: TDateField;
    WideStringField93: TWideStringField;
    WideStringField94: TWideStringField;
    DateField24: TDateField;
    WideStringField95: TWideStringField;
    WideStringField96: TWideStringField;
    DateField25: TDateField;
    WideStringField97: TWideStringField;
    IntegerField24: TIntegerField;
    WideStringField98: TWideStringField;
    WideStringField99: TWideStringField;
    WideStringField100: TWideStringField;
    IntegerField25: TIntegerField;
    IntegerField26: TIntegerField;
    IntegerField27: TIntegerField;
    FloatField49: TFloatField;
    FloatField50: TFloatField;
    FloatField51: TFloatField;
    FloatField52: TFloatField;
    FloatField53: TFloatField;
    FloatField54: TFloatField;
    FloatField55: TFloatField;
    FloatField56: TFloatField;
    FloatField57: TFloatField;
    WideStringField101: TWideStringField;
    DateField26: TDateField;
    WideStringField102: TWideStringField;
    WideStringField103: TWideStringField;
    DateField27: TDateField;
    WideStringField104: TWideStringField;
    IntegerField28: TIntegerField;
    WideStringField105: TWideStringField;
    WideStringField106: TWideStringField;
    WideStringField107: TWideStringField;
    DateField28: TDateField;
    WideStringField108: TWideStringField;
    WideStringField109: TWideStringField;
    DateField29: TDateField;
    WideStringField110: TWideStringField;
    IntegerField29: TIntegerField;
    WideStringField111: TWideStringField;
    WideStringField112: TWideStringField;
    DateField30: TDateField;
    WideStringField113: TWideStringField;
    WideStringField114: TWideStringField;
    DateField31: TDateField;
    WideStringField115: TWideStringField;
    IntegerField30: TIntegerField;
    WideStringField116: TWideStringField;
    WideStringField117: TWideStringField;
    DateField32: TDateField;
    WideStringField118: TWideStringField;
    WideStringField119: TWideStringField;
    DateField33: TDateField;
    WideStringField120: TWideStringField;
    dspPneuSct: TDataSetProvider;
    cliPneuSct: TClientDataSet;
    IntegerField31: TIntegerField;
    WideStringField121: TWideStringField;
    WideStringField122: TWideStringField;
    FloatField58: TFloatField;
    WideStringField123: TWideStringField;
    WideStringField124: TWideStringField;
    IntegerField32: TIntegerField;
    IntegerField33: TIntegerField;
    WideStringField125: TWideStringField;
    WideStringField126: TWideStringField;
    WideStringField127: TWideStringField;
    WideStringField128: TWideStringField;
    WideStringField129: TWideStringField;
    WideStringField130: TWideStringField;
    WideStringField131: TWideStringField;
    FloatField59: TFloatField;
    FloatField60: TFloatField;
    FloatField61: TFloatField;
    FloatField62: TFloatField;
    FloatField63: TFloatField;
    FloatField64: TFloatField;
    FloatField65: TFloatField;
    FloatField66: TFloatField;
    FloatField67: TFloatField;
    WideStringField132: TWideStringField;
    DateField34: TDateField;
    WideStringField133: TWideStringField;
    WideStringField134: TWideStringField;
    DateField35: TDateField;
    WideStringField135: TWideStringField;
    WideStringField136: TWideStringField;
    DateField36: TDateField;
    WideStringField137: TWideStringField;
    IntegerField34: TIntegerField;
    WideStringField138: TWideStringField;
    WideStringField139: TWideStringField;
    WideStringField140: TWideStringField;
    IntegerField35: TIntegerField;
    IntegerField36: TIntegerField;
    IntegerField37: TIntegerField;
    FloatField68: TFloatField;
    FloatField69: TFloatField;
    FloatField70: TFloatField;
    FloatField71: TFloatField;
    FloatField72: TFloatField;
    FloatField73: TFloatField;
    FloatField74: TFloatField;
    FloatField75: TFloatField;
    FloatField76: TFloatField;
    WideStringField141: TWideStringField;
    DateField37: TDateField;
    WideStringField142: TWideStringField;
    WideStringField143: TWideStringField;
    DateField38: TDateField;
    WideStringField144: TWideStringField;
    IntegerField38: TIntegerField;
    WideStringField145: TWideStringField;
    WideStringField146: TWideStringField;
    WideStringField147: TWideStringField;
    DateField39: TDateField;
    WideStringField148: TWideStringField;
    WideStringField149: TWideStringField;
    DateField40: TDateField;
    WideStringField150: TWideStringField;
    IntegerField39: TIntegerField;
    WideStringField151: TWideStringField;
    WideStringField152: TWideStringField;
    DateField41: TDateField;
    WideStringField153: TWideStringField;
    WideStringField154: TWideStringField;
    DateField42: TDateField;
    WideStringField155: TWideStringField;
    IntegerField40: TIntegerField;
    WideStringField156: TWideStringField;
    WideStringField157: TWideStringField;
    DateField43: TDateField;
    WideStringField158: TWideStringField;
    WideStringField159: TWideStringField;
    DateField44: TDateField;
    WideStringField160: TWideStringField;
    dsPneuSct: TDataSource;
    sqlPneuEtqpiv_kmmant: TFloatField;
    sqlPneuEtqpiv_kmrodi: TFloatField;
    sqlPneuEtqpiv_nrvida: TWideStringField;
    sqlPneumntpiv_kmmant: TFloatField;
    sqlPneumntpiv_kmrodi: TFloatField;
    sqlPneumntpiv_nrvida: TWideStringField;
    sqlPneuSctpiv_kmmant: TFloatField;
    sqlPneuSctpiv_kmrodi: TFloatField;
    sqlPneuSctpiv_nrvida: TWideStringField;
    cliPneuEtqpiv_kmmant: TFloatField;
    cliPneuEtqpiv_kmrodi: TFloatField;
    cliPneuEtqpiv_nrvida: TWideStringField;
    cliPneumntpiv_kmmant: TFloatField;
    cliPneumntpiv_kmrodi: TFloatField;
    cliPneumntpiv_nrvida: TWideStringField;
    cliPneuSctpiv_kmmant: TFloatField;
    cliPneuSctpiv_kmrodi: TFloatField;
    cliPneuSctpiv_nrvida: TWideStringField;
    Pgopcao: TPageControl;
    tabInstalar: TTabSheet;
    btnInsOk: TButton;
    btnInsCancela: TButton;
    grbInstall: TGroupBox;
    Label11: TLabel;
    Label1: TLabel;
    Label12: TLabel;
    Label17: TLabel;
    Label16: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label13: TLabel;
    edInstFogo: TEdit;
    edDatinst: TDateTimePicker;
    edHorIns: TMaskEdit;
    edEveIns: TComboBox;
    edInsKmRdo: TMaskEdit;
    edInsKmAtual: TMaskEdit;
    edInsCalib: TMaskEdit;
    edIncSulc1: TEdit;
    edIncSulc2: TEdit;
    edIncSulc4: TEdit;
    edIncSulc3: TEdit;
    edIncSulc6: TEdit;
    edIncSulc5: TEdit;
    edLocInstPneu: TEdit;
    tabDesinstalar: TTabSheet;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    edDesInstFogo: TEdit;
    edDatDesinst: TDateTimePicker;
    edHorDesIns: TMaskEdit;
    edEveDesIns: TComboBox;
    edDesInsKmAtual: TMaskEdit;
    edDesInsCalib: TMaskEdit;
    edDesIncSulc1: TEdit;
    edDesIncSulc2: TEdit;
    edDesIncSulc4: TEdit;
    edDesIncSulc3: TEdit;
    edDesIncSulc6: TEdit;
    edDesIncSulc5: TEdit;
    edLocDesInstPneu: TEdit;
    Button2: TButton;
    btnDesInsOk: TButton;
    tabManutec: TTabSheet;
    GroupBox8: TGroupBox;
    Label2: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    edMFogoMnt: TEdit;
    edDataMnt: TDateTimePicker;
    edHorMnt: TMaskEdit;
    cmbEveMnt: TComboBox;
    edKmMnt: TMaskEdit;
    edLibraMnt: TMaskEdit;
    edMntIncSulc1: TEdit;
    edMntIncSulc2: TEdit;
    edMntIncSulc4: TEdit;
    edMntIncSulc3: TEdit;
    edMntIncSulc6: TEdit;
    edMntIncSulc5: TEdit;
    EdLocalMnt: TEdit;
    edCodFndMnt: TButtonedEdit;
    edNomFnd: TEdit;
    edVlrMnt: TMaskEdit;
    Button3: TButton;
    Button4: TButton;
    btnSucConf: TTabSheet;
    GroupBox4: TGroupBox;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    edSFogoMnt: TEdit;
    edDatSuc: TDateTimePicker;
    EdHorSct: TMaskEdit;
    cmbEveSuc: TComboBox;
    edKmSct: TMaskEdit;
    edSctIncSulc1: TEdit;
    edSctIncSulc2: TEdit;
    edSctIncSulc4: TEdit;
    edSctIncSulc3: TEdit;
    edSctIncSulc6: TEdit;
    edSctIncSulc5: TEdit;
    EdLocalSct: TEdit;
    Button5: TButton;
    btnSucCanc: TButton;
    Label47: TLabel;
    edObjeto: TEdit;
    Label48: TLabel;
    edKmInstal: TEdit;
    Label51: TLabel;
    edDimen: TEdit;
    Label52: TLabel;
    edKmRoda: TEdit;
    tabMetragem: TTabSheet;
    GroupBox1: TGroupBox;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    edFogoMet: TEdit;
    edDatMet: TDateTimePicker;
    edHorMet: TMaskEdit;
    cmbMetragem: TComboBox;
    edKmMetr: TMaskEdit;
    edSulcMet1: TEdit;
    edSulcMet2: TEdit;
    edSulcMet4: TEdit;
    edSulcMet3: TEdit;
    edSulcMet6: TEdit;
    edSulcMet5: TEdit;
    edPosicMet: TEdit;
    btnConMet: TButton;
    btnCanMet: TButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    edSulco1: TEdit;
    Label60: TLabel;
    edSulco2: TEdit;
    edSulco3: TEdit;
    edSulco4: TEdit;
    edSulco6: TEdit;
    edSulco5: TEdit;
    ImpHistorico: TfrxReport;
    sqlPneuHist: TZQuery;
    dspPneuHist: TDataSetProvider;
    cliPneuHist: TClientDataSet;
    dsPneuHist: TDataSource;
    frxDBHist: TfrxDBDataset;
    frxDBEmpresa: TfrxDBDataset;
    sqlPneuHistpmt_codigo: TIntegerField;
    sqlPneuHistpmt_codpiv: TIntegerField;
    sqlPneuHistpmt_dateve: TDateField;
    sqlPneuHistpmt_horeve: TWideStringField;
    sqlPneuHistpmt_mfogo: TWideStringField;
    sqlPneuHistpmt_codplc: TWideStringField;
    sqlPneuHistpmt_evento: TWideStringField;
    sqlPneuHistpmt_objeto: TWideStringField;
    sqlPneuHistpmt_posic: TWideStringField;
    sqlPneuHistpmt_vlrcst: TFloatField;
    sqlPneuHistpmt_kmrodiz: TFloatField;
    sqlPneuHistpmt_kmatual: TFloatField;
    sqlPneuHistpmt_libras: TWideStringField;
    sqlPneuHistpmt_mlmsc1: TWideStringField;
    sqlPneuHistpmt_mlmsc2: TWideStringField;
    sqlPneuHistpmt_mlmsc3: TWideStringField;
    sqlPneuHistpmt_mlmsc4: TWideStringField;
    sqlPneuHistpmt_mlmsc5: TWideStringField;
    sqlPneuHistpmt_mlmsc6: TWideStringField;
    sqlPneuHistpmt_mrvida: TWideStringField;
    sqlPneuHistpmt_kmvida: TFloatField;
    sqlPneuHistpmt_codfnd: TIntegerField;
    sqlPneuHistpmt_usuinc: TWideStringField;
    sqlPneuHistpmt_datinc: TDateField;
    sqlPneuHistpmt_horinc: TWideStringField;
    sqlPneuHistpmt_usualt: TWideStringField;
    sqlPneuHistpmt_datalt: TDateField;
    sqlPneuHistpmt_horalt: TWideStringField;
    sqlPneuHistpiv_codigo: TIntegerField;
    sqlPneuHistpiv_numser: TWideStringField;
    sqlPneuHistpiv_numnfe: TWideStringField;
    sqlPneuHistpiv_vlrcto: TFloatField;
    sqlPneuHistpiv_mfogo: TWideStringField;
    sqlPneuHistpiv_numdot: TWideStringField;
    sqlPneuHistpiv_codpmd: TIntegerField;
    sqlPneuHistpiv_codpds: TIntegerField;
    sqlPneuHistpiv_codplc: TWideStringField;
    sqlPneuHistpiv_mlmsc1: TWideStringField;
    sqlPneuHistpiv_mlmsc2: TWideStringField;
    sqlPneuHistpiv_mlmsc3: TWideStringField;
    sqlPneuHistpiv_mlmsc4: TWideStringField;
    sqlPneuHistpiv_mlmsc5: TWideStringField;
    sqlPneuHistpiv_mlmsc6: TWideStringField;
    sqlPneuHistpiv_kmvda1: TFloatField;
    sqlPneuHistpiv_kmvda2: TFloatField;
    sqlPneuHistpiv_kmvda3: TFloatField;
    sqlPneuHistpiv_kmvda4: TFloatField;
    sqlPneuHistpiv_kmvda5: TFloatField;
    sqlPneuHistpiv_kmvda6: TFloatField;
    sqlPneuHistpiv_kmvda7: TFloatField;
    sqlPneuHistpiv_kmvda8: TFloatField;
    sqlPneuHistpiv_kmvda9: TFloatField;
    sqlPneuHistpiv_status: TWideStringField;
    sqlPneuHistpiv_datcmp: TDateField;
    sqlPneuHistpiv_locpne: TWideStringField;
    sqlPneuHistpiv_usuinc: TWideStringField;
    sqlPneuHistpiv_datinc: TDateField;
    sqlPneuHistpiv_horinc: TWideStringField;
    sqlPneuHistpiv_usualt: TWideStringField;
    sqlPneuHistpiv_datalt: TDateField;
    sqlPneuHistpiv_horalt: TWideStringField;
    sqlPneuHistpiv_kmmant: TFloatField;
    sqlPneuHistpiv_kmrodi: TFloatField;
    sqlPneuHistpiv_nrvida: TWideStringField;
    sqlPneuHistpiv_situac: TWideStringField;
    sqlPneuHistpmd_codigo: TIntegerField;
    sqlPneuHistpmd_nome: TWideStringField;
    sqlPneuHistpmd_sucref: TWideStringField;
    sqlPneuHistpmd_sucnov: TWideStringField;
    sqlPneuHistpmd_codpds: TIntegerField;
    sqlPneuHistpmd_codpdm: TIntegerField;
    sqlPneuHistpmd_codpfb: TIntegerField;
    sqlPneuHistpmd_kmvid1: TFloatField;
    sqlPneuHistpmd_kmvid2: TFloatField;
    sqlPneuHistpmd_kmvid3: TFloatField;
    sqlPneuHistpmd_kmvid4: TFloatField;
    sqlPneuHistpmd_kmvid5: TFloatField;
    sqlPneuHistpmd_kmvid6: TFloatField;
    sqlPneuHistpmd_kmvid7: TFloatField;
    sqlPneuHistpmd_kmvid8: TFloatField;
    sqlPneuHistpmd_kmvid9: TFloatField;
    sqlPneuHistpmd_usuinc: TWideStringField;
    sqlPneuHistpmd_datinc: TDateField;
    sqlPneuHistpmd_horinc: TWideStringField;
    sqlPneuHistpmd_usualt: TWideStringField;
    sqlPneuHistpmd_datalt: TDateField;
    sqlPneuHistpmd_horalt: TWideStringField;
    sqlPneuHistpds_codigo: TIntegerField;
    sqlPneuHistpds_nome: TWideStringField;
    sqlPneuHistpds_sucos: TWideStringField;
    sqlPneuHistpds_usuinc: TWideStringField;
    sqlPneuHistpds_datinc: TDateField;
    sqlPneuHistpds_horinc: TWideStringField;
    sqlPneuHistpds_usualt: TWideStringField;
    sqlPneuHistpds_datalt: TDateField;
    sqlPneuHistpds_horalt: TWideStringField;
    sqlPneuHistpdm_codigo: TIntegerField;
    sqlPneuHistpdm_nome: TWideStringField;
    sqlPneuHistpdm_usuinc: TWideStringField;
    sqlPneuHistpdm_datinc: TDateField;
    sqlPneuHistpdm_horinc: TWideStringField;
    sqlPneuHistpdm_usualt: TWideStringField;
    sqlPneuHistpdm_datalt: TDateField;
    sqlPneuHistpdm_horalt: TWideStringField;
    sqlPneuHistpfb_codigo: TIntegerField;
    sqlPneuHistpfb_nome: TWideStringField;
    sqlPneuHistpfb_usuinc: TWideStringField;
    sqlPneuHistpfb_datinc: TDateField;
    sqlPneuHistpfb_horinc: TWideStringField;
    sqlPneuHistpfb_usualt: TWideStringField;
    sqlPneuHistpfb_datalt: TDateField;
    sqlPneuHistpfb_horalt: TWideStringField;
    sqlPneuHistvat_placa: TWideStringField;
    sqlPneuHistvat_pasta: TWideStringField;
    sqlPneuHistvat_chip: TWideStringField;
    sqlPneuHistvat_cartao: TWideStringField;
    sqlPneuHistvat_chassi: TWideStringField;
    sqlPneuHistvat_licenc: TWideStringField;
    sqlPneuHistvat_renavan: TWideStringField;
    sqlPneuHistvat_dut: TWideStringField;
    sqlPneuHistvat_codltd: TIntegerField;
    sqlPneuHistvat_codtip: TIntegerField;
    sqlPneuHistvat_codmdl: TIntegerField;
    sqlPneuHistvat_codmrc: TIntegerField;
    sqlPneuHistvat_codcor: TIntegerField;
    sqlPneuHistvat_codcid: TIntegerField;
    sqlPneuHistvat_cor: TWideStringField;
    sqlPneuHistvat_status: TWideStringField;
    sqlPneuHistvat_tanque1: TFloatField;
    sqlPneuHistvat_tanque2: TFloatField;
    sqlPneuHistvat_tanque3: TFloatField;
    sqlPneuHistvat_kmini: TFloatField;
    sqlPneuHistvat_kmatu: TFloatField;
    sqlPneuHistvat_anofbmd: TWideStringField;
    sqlPneuHistvat_termo: TWideStringField;
    sqlPneuHistvat_tombo: TWideStringField;
    sqlPneuHistvat_estado: TWideStringField;
    sqlPneuHistvat_qtdpass: TWideStringField;
    sqlPneuHistvat_potenc: TWideStringField;
    sqlPneuHistvat_kgbruto: TFloatField;
    sqlPneuHistvat_kgcarga: TFloatField;
    sqlPneuHistvat_clindad: TWideStringField;
    sqlPneuHistvat_nrmotor: TWideStringField;
    sqlPneuHistvat_foto: TBlobField;
    sqlPneuHistvat_obs: TWideMemoField;
    sqlPneuHistvat_vlrcmp: TFloatField;
    sqlPneuHistvat_datcmp: TDateField;
    sqlPneuHistvat_nfecmp: TWideStringField;
    sqlPneuHistvat_usuinc: TWideStringField;
    sqlPneuHistvat_datinc: TDateField;
    sqlPneuHistvat_horinc: TWideStringField;
    sqlPneuHistvat_usualt: TWideStringField;
    sqlPneuHistvat_datalt: TDateField;
    sqlPneuHistvat_horalt: TWideStringField;
    sqlPneuHistmdl_codigo: TIntegerField;
    sqlPneuHistmdl_nome: TWideStringField;
    sqlPneuHistmdl_codfip: TWideStringField;
    sqlPneuHistmdl_codmrc: TIntegerField;
    sqlPneuHistmdl_usuinc: TWideStringField;
    sqlPneuHistmdl_datinc: TDateField;
    sqlPneuHistmdl_horinc: TWideStringField;
    sqlPneuHistmdl_usualt: TWideStringField;
    sqlPneuHistmdl_datalt: TDateField;
    sqlPneuHistmdl_horalt: TWideStringField;
    cliPneuHistpmt_codigo: TIntegerField;
    cliPneuHistpmt_codpiv: TIntegerField;
    cliPneuHistpmt_dateve: TDateField;
    cliPneuHistpmt_horeve: TWideStringField;
    cliPneuHistpmt_mfogo: TWideStringField;
    cliPneuHistpmt_codplc: TWideStringField;
    cliPneuHistpmt_evento: TWideStringField;
    cliPneuHistpmt_objeto: TWideStringField;
    cliPneuHistpmt_posic: TWideStringField;
    cliPneuHistpmt_vlrcst: TFloatField;
    cliPneuHistpmt_kmrodiz: TFloatField;
    cliPneuHistpmt_kmatual: TFloatField;
    cliPneuHistpmt_libras: TWideStringField;
    cliPneuHistpmt_mlmsc1: TWideStringField;
    cliPneuHistpmt_mlmsc2: TWideStringField;
    cliPneuHistpmt_mlmsc3: TWideStringField;
    cliPneuHistpmt_mlmsc4: TWideStringField;
    cliPneuHistpmt_mlmsc5: TWideStringField;
    cliPneuHistpmt_mlmsc6: TWideStringField;
    cliPneuHistpmt_mrvida: TWideStringField;
    cliPneuHistpmt_kmvida: TFloatField;
    cliPneuHistpmt_codfnd: TIntegerField;
    cliPneuHistpmt_usuinc: TWideStringField;
    cliPneuHistpmt_datinc: TDateField;
    cliPneuHistpmt_horinc: TWideStringField;
    cliPneuHistpmt_usualt: TWideStringField;
    cliPneuHistpmt_datalt: TDateField;
    cliPneuHistpmt_horalt: TWideStringField;
    cliPneuHistpiv_codigo: TIntegerField;
    cliPneuHistpiv_numser: TWideStringField;
    cliPneuHistpiv_numnfe: TWideStringField;
    cliPneuHistpiv_vlrcto: TFloatField;
    cliPneuHistpiv_mfogo: TWideStringField;
    cliPneuHistpiv_numdot: TWideStringField;
    cliPneuHistpiv_codpmd: TIntegerField;
    cliPneuHistpiv_codpds: TIntegerField;
    cliPneuHistpiv_codplc: TWideStringField;
    cliPneuHistpiv_mlmsc1: TWideStringField;
    cliPneuHistpiv_mlmsc2: TWideStringField;
    cliPneuHistpiv_mlmsc3: TWideStringField;
    cliPneuHistpiv_mlmsc4: TWideStringField;
    cliPneuHistpiv_mlmsc5: TWideStringField;
    cliPneuHistpiv_mlmsc6: TWideStringField;
    cliPneuHistpiv_kmvda1: TFloatField;
    cliPneuHistpiv_kmvda2: TFloatField;
    cliPneuHistpiv_kmvda3: TFloatField;
    cliPneuHistpiv_kmvda4: TFloatField;
    cliPneuHistpiv_kmvda5: TFloatField;
    cliPneuHistpiv_kmvda6: TFloatField;
    cliPneuHistpiv_kmvda7: TFloatField;
    cliPneuHistpiv_kmvda8: TFloatField;
    cliPneuHistpiv_kmvda9: TFloatField;
    cliPneuHistpiv_status: TWideStringField;
    cliPneuHistpiv_datcmp: TDateField;
    cliPneuHistpiv_locpne: TWideStringField;
    cliPneuHistpiv_usuinc: TWideStringField;
    cliPneuHistpiv_datinc: TDateField;
    cliPneuHistpiv_horinc: TWideStringField;
    cliPneuHistpiv_usualt: TWideStringField;
    cliPneuHistpiv_datalt: TDateField;
    cliPneuHistpiv_horalt: TWideStringField;
    cliPneuHistpiv_kmmant: TFloatField;
    cliPneuHistpiv_kmrodi: TFloatField;
    cliPneuHistpiv_nrvida: TWideStringField;
    cliPneuHistpiv_situac: TWideStringField;
    cliPneuHistpmd_codigo: TIntegerField;
    cliPneuHistpmd_nome: TWideStringField;
    cliPneuHistpmd_sucref: TWideStringField;
    cliPneuHistpmd_sucnov: TWideStringField;
    cliPneuHistpmd_codpds: TIntegerField;
    cliPneuHistpmd_codpdm: TIntegerField;
    cliPneuHistpmd_codpfb: TIntegerField;
    cliPneuHistpmd_kmvid1: TFloatField;
    cliPneuHistpmd_kmvid2: TFloatField;
    cliPneuHistpmd_kmvid3: TFloatField;
    cliPneuHistpmd_kmvid4: TFloatField;
    cliPneuHistpmd_kmvid5: TFloatField;
    cliPneuHistpmd_kmvid6: TFloatField;
    cliPneuHistpmd_kmvid7: TFloatField;
    cliPneuHistpmd_kmvid8: TFloatField;
    cliPneuHistpmd_kmvid9: TFloatField;
    cliPneuHistpmd_usuinc: TWideStringField;
    cliPneuHistpmd_datinc: TDateField;
    cliPneuHistpmd_horinc: TWideStringField;
    cliPneuHistpmd_usualt: TWideStringField;
    cliPneuHistpmd_datalt: TDateField;
    cliPneuHistpmd_horalt: TWideStringField;
    cliPneuHistpds_codigo: TIntegerField;
    cliPneuHistpds_nome: TWideStringField;
    cliPneuHistpds_sucos: TWideStringField;
    cliPneuHistpds_usuinc: TWideStringField;
    cliPneuHistpds_datinc: TDateField;
    cliPneuHistpds_horinc: TWideStringField;
    cliPneuHistpds_usualt: TWideStringField;
    cliPneuHistpds_datalt: TDateField;
    cliPneuHistpds_horalt: TWideStringField;
    cliPneuHistpdm_codigo: TIntegerField;
    cliPneuHistpdm_nome: TWideStringField;
    cliPneuHistpdm_usuinc: TWideStringField;
    cliPneuHistpdm_datinc: TDateField;
    cliPneuHistpdm_horinc: TWideStringField;
    cliPneuHistpdm_usualt: TWideStringField;
    cliPneuHistpdm_datalt: TDateField;
    cliPneuHistpdm_horalt: TWideStringField;
    cliPneuHistpfb_codigo: TIntegerField;
    cliPneuHistpfb_nome: TWideStringField;
    cliPneuHistpfb_usuinc: TWideStringField;
    cliPneuHistpfb_datinc: TDateField;
    cliPneuHistpfb_horinc: TWideStringField;
    cliPneuHistpfb_usualt: TWideStringField;
    cliPneuHistpfb_datalt: TDateField;
    cliPneuHistpfb_horalt: TWideStringField;
    cliPneuHistvat_placa: TWideStringField;
    cliPneuHistvat_pasta: TWideStringField;
    cliPneuHistvat_chip: TWideStringField;
    cliPneuHistvat_cartao: TWideStringField;
    cliPneuHistvat_chassi: TWideStringField;
    cliPneuHistvat_licenc: TWideStringField;
    cliPneuHistvat_renavan: TWideStringField;
    cliPneuHistvat_dut: TWideStringField;
    cliPneuHistvat_codltd: TIntegerField;
    cliPneuHistvat_codtip: TIntegerField;
    cliPneuHistvat_codmdl: TIntegerField;
    cliPneuHistvat_codmrc: TIntegerField;
    cliPneuHistvat_codcor: TIntegerField;
    cliPneuHistvat_codcid: TIntegerField;
    cliPneuHistvat_cor: TWideStringField;
    cliPneuHistvat_status: TWideStringField;
    cliPneuHistvat_tanque1: TFloatField;
    cliPneuHistvat_tanque2: TFloatField;
    cliPneuHistvat_tanque3: TFloatField;
    cliPneuHistvat_kmini: TFloatField;
    cliPneuHistvat_kmatu: TFloatField;
    cliPneuHistvat_anofbmd: TWideStringField;
    cliPneuHistvat_termo: TWideStringField;
    cliPneuHistvat_tombo: TWideStringField;
    cliPneuHistvat_estado: TWideStringField;
    cliPneuHistvat_qtdpass: TWideStringField;
    cliPneuHistvat_potenc: TWideStringField;
    cliPneuHistvat_kgbruto: TFloatField;
    cliPneuHistvat_kgcarga: TFloatField;
    cliPneuHistvat_clindad: TWideStringField;
    cliPneuHistvat_nrmotor: TWideStringField;
    cliPneuHistvat_foto: TBlobField;
    cliPneuHistvat_obs: TWideMemoField;
    cliPneuHistvat_vlrcmp: TFloatField;
    cliPneuHistvat_datcmp: TDateField;
    cliPneuHistvat_nfecmp: TWideStringField;
    cliPneuHistvat_usuinc: TWideStringField;
    cliPneuHistvat_datinc: TDateField;
    cliPneuHistvat_horinc: TWideStringField;
    cliPneuHistvat_usualt: TWideStringField;
    cliPneuHistvat_datalt: TDateField;
    cliPneuHistvat_horalt: TWideStringField;
    cliPneuHistmdl_codigo: TIntegerField;
    cliPneuHistmdl_nome: TWideStringField;
    cliPneuHistmdl_codfip: TWideStringField;
    cliPneuHistmdl_codmrc: TIntegerField;
    cliPneuHistmdl_usuinc: TWideStringField;
    cliPneuHistmdl_datinc: TDateField;
    cliPneuHistmdl_horinc: TWideStringField;
    cliPneuHistmdl_usualt: TWideStringField;
    cliPneuHistmdl_datalt: TDateField;
    cliPneuHistmdl_horalt: TWideStringField;
    sqlPneuHistfnd_codigo: TIntegerField;
    sqlPneuHistfnd_ativo: TWideStringField;
    sqlPneuHistfnd_nome: TWideStringField;
    sqlPneuHistfnd_rsocial: TWideStringField;
    sqlPneuHistfnd_tipopes: TWideStringField;
    sqlPneuHistfnd_cpfcnpj: TWideStringField;
    sqlPneuHistfnd_codpct: TWideStringField;
    sqlPneuHistfnd_endereco: TWideStringField;
    sqlPneuHistfnd_numend: TWideStringField;
    sqlPneuHistfnd_complem: TWideStringField;
    sqlPneuHistfnd_bairro: TWideStringField;
    sqlPneuHistfnd_cep: TWideStringField;
    sqlPneuHistfnd_codcid: TIntegerField;
    sqlPneuHistfnd_telef1: TWideStringField;
    sqlPneuHistfnd_telef2: TWideStringField;
    sqlPneuHistfnd_celula: TWideStringField;
    sqlPneuHistfnd_obs: TWideMemoField;
    sqlPneuHistfnd_usuinc: TWideStringField;
    sqlPneuHistfnd_datinc: TDateField;
    sqlPneuHistfnd_horinc: TWideStringField;
    sqlPneuHistfnd_usualt: TWideStringField;
    sqlPneuHistfnd_datalt: TDateField;
    sqlPneuHistfnd_horalt: TWideStringField;
    cliPneuHistfnd_codigo: TIntegerField;
    cliPneuHistfnd_ativo: TWideStringField;
    cliPneuHistfnd_nome: TWideStringField;
    cliPneuHistfnd_rsocial: TWideStringField;
    cliPneuHistfnd_tipopes: TWideStringField;
    cliPneuHistfnd_cpfcnpj: TWideStringField;
    cliPneuHistfnd_codpct: TWideStringField;
    cliPneuHistfnd_endereco: TWideStringField;
    cliPneuHistfnd_numend: TWideStringField;
    cliPneuHistfnd_complem: TWideStringField;
    cliPneuHistfnd_bairro: TWideStringField;
    cliPneuHistfnd_cep: TWideStringField;
    cliPneuHistfnd_codcid: TIntegerField;
    cliPneuHistfnd_telef1: TWideStringField;
    cliPneuHistfnd_telef2: TWideStringField;
    cliPneuHistfnd_celula: TWideStringField;
    cliPneuHistfnd_obs: TWideMemoField;
    cliPneuHistfnd_usuinc: TWideStringField;
    cliPneuHistfnd_datinc: TDateField;
    cliPneuHistfnd_horinc: TWideStringField;
    cliPneuHistfnd_usualt: TWideStringField;
    cliPneuHistfnd_datalt: TDateField;
    cliPneuHistfnd_horalt: TWideStringField;
    sqlPneuHistpmt_kmroda: TFloatField;
    cliPneuHistpmt_kmroda: TFloatField;
    sqlPneuEtqpiv_situac: TWideStringField;
    sqlPneumntpiv_situac: TWideStringField;
    sqlPneuSctpiv_situac: TWideStringField;
    tabRodizio: TTabSheet;
    GroupBox5: TGroupBox;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label65: TLabel;
    Label67: TLabel;
    edFogoRod1: TEdit;
    edDatRod: TDateTimePicker;
    edHorRod: TMaskEdit;
    edKmRdoAtua: TMaskEdit;
    edNomRod1: TEdit;
    Button1: TButton;
    Button6: TButton;
    Image1: TImage;
    Image2: TImage;
    Label64: TLabel;
    edNomRod2: TEdit;
    edKmRodNov: TMaskEdit;
    Label66: TLabel;
    Label68: TLabel;
    edFogoRod2: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure esqueleto;
    procedure edPlacaRightButtonClick(Sender: TObject);
    procedure edPlacaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edPlacaExit(Sender: TObject);
    procedure dbgEstoqueDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure DBGrid2DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure DBGrid3DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbgEstoqueDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure inittelas(tela :Integer; lOp: Boolean);
    procedure btnInsCancelaClick(Sender: TObject);
    procedure btnInsOkClick(Sender: TObject);
    procedure btnSairExecute(Sender: TObject);
    procedure atualizagrids;
    procedure pdirInt01DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure pdirInt01MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnDesInsOkClick(Sender: TObject);
    procedure dbgEstoqueCellClick(Column: TColumn);
    procedure edInsKmRdoKeyPress(Sender: TObject; var Key: Char);
    procedure edInsKmAtualKeyPress(Sender: TObject; var Key: Char);
    procedure edInsKmAtualExit(Sender: TObject);
    procedure edDesInsKmAtualKeyPress(Sender: TObject; var Key: Char);
    procedure edDesInsKmAtualExit(Sender: TObject);
    procedure dbgEstoqueEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure pdirInt01DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure pdirInt01EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure dbgManutecDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure edCodFndMntRightButtonClick(Sender: TObject);
    procedure edCodFndMntKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCodFndMntExit(Sender: TObject);
    procedure edVlrMntKeyPress(Sender: TObject; var Key: Char);
    procedure edKmMntKeyPress(Sender: TObject; var Key: Char);
    procedure Button4Click(Sender: TObject);
    procedure dbgManutecCellClick(Column: TColumn);
    procedure dbgManutecDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgSucataDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbgSucataCellClick(Column: TColumn);
    procedure dbgSucataDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Button5Click(Sender: TObject);
    procedure tabManutecShow(Sender: TObject);
    procedure dbgManutecEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure pdirInt01DblClick(Sender: TObject);
    procedure dbgEstoqueDblClick(Sender: TObject);
    procedure dbgManutecDblClick(Sender: TObject);
    procedure dbgSucataDblClick(Sender: TObject);
    procedure btnMetExecute(Sender: TObject);
    procedure btnHistExecute(Sender: TObject);
    procedure ativabtn;
    procedure btnConMetClick(Sender: TObject);
    procedure edKmMetrKeyPress(Sender: TObject; var Key: Char);
    procedure cmbEveMntChange(Sender: TObject);
    procedure edHorDesInsExit(Sender: TObject);
    procedure edHorInsExit(Sender: TObject);
    procedure edHorMntExit(Sender: TObject);
    procedure EdHorSctExit(Sender: TObject);
    procedure edHorMetExit(Sender: TObject);
    procedure edKmRodNovKeyPress(Sender: TObject; var Key: Char);
    procedure edKmRdoAtuaKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
    wEmpresa, wUsuInc, wHorInc, wUsuAlt, wHorAlt : string ;
    wDatInc, wDatAlt : Tdate;
    nNew, nRecno:  Integer;
    procedure esqueleto2;
    function pegapne(x,Comp: integer): String;
  public
    acampo, cCodTipo: integer;
    aberto, lMostra, lCarroc: Boolean;
    Util: TClasseUtil;
    Pesquisa : TClasConsulta;
    sqlNew    : TFDQuery;
    adescPneu : array of string;
    aEdits, aImgpneu, aImgeixo : TArrayComp;
    cPre, cTabela,cLocaliza, cPlacaAnt, cNumVida,
    CodPct, cCodpiv, cEvento, cPneu1, cPneu2: String;

    { Public declarations }
  end;

var
  frmPneuMnt: TfrmPneuMnt;
  modConsulta, nOrdem : integer;


implementation

uses  UCalculadora,  u_dmEmp, uSistema, U_funcao, U_CnpjClass;

{$R *.dfm}

procedure TfrmPneuMnt.ativabtn;
begin
  btnMet.Enabled  := ( edFogo.Text <> '' )  ;
  btnHist.Enabled := ( edFogo.Text <> '' )  ;
end;

procedure TfrmPneuMnt.atualizagrids;
begin
   // Pega dados de pneus no estoque ou iventário
   sqlPneuEtq.Close;
   cliPneuEtq.Close;
   sqlPneuEtq.SQL.Text :=' Select * FROM '+U_funcao.SelSchema('pneuive')+' '
                        +' LEFT JOIN '+U_funcao.SelSchema('pneumod')+' on pmd_codigo = piv_codpmd '
                        +' LEFT JOIN '+U_funcao.SelSchema('pneudes')+' on pds_codigo = pmd_codpds '
                        +' LEFT JOIN '+U_funcao.SelSchema('pneudim')+' on pdm_codigo = pmd_codpdm '
                        +' LEFT JOIN '+U_funcao.SelSchema('pneufab')+' on pfb_codigo = pmd_codpfb '
                        +' where piv_status = '+QuotedStr('ESTOQUE')
                        +' order by piv_mfogo';
   sqlPneuEtq.Open;
   cliPneuEtq.Active := True;

   // Pega dados de pneus em manutenção
   sqlPneuMnt.Close;
   cliPneuMnt.Close;
   sqlPneuMnt.SQL.Text :=' Select * FROM '+U_funcao.SelSchema('pneuive')+' '
                        +' LEFT JOIN '+U_funcao.SelSchema('pneumod')+' on pmd_codigo = piv_codpmd '
                        +' LEFT JOIN '+U_funcao.SelSchema('pneudes')+' on pds_codigo = pmd_codpds '
                        +' LEFT JOIN '+U_funcao.SelSchema('pneudim')+' on pdm_codigo = pmd_codpdm '
                        +' LEFT JOIN '+U_funcao.SelSchema('pneufab')+' on pfb_codigo = pmd_codpfb '
                        +' where piv_status = '+QuotedStr('MANUTENCAO')
                        +' order by piv_mfogo';
   sqlPneuMnt.Open;
   cliPneuMnt.Active := True;

   // Pega dados de pneus sucateados
   sqlPneuSct.Close;
   cliPneuSct.Close;
   sqlPneuSct.SQL.Text :=' Select * FROM '+U_funcao.SelSchema('pneuive')+' '
                        +' LEFT JOIN '+U_funcao.SelSchema('pneumod')+' on pmd_codigo = piv_codpmd '
                        +' LEFT JOIN '+U_funcao.SelSchema('pneudes')+' on pds_codigo = pmd_codpds '
                        +' LEFT JOIN '+U_funcao.SelSchema('pneudim')+' on pdm_codigo = pmd_codpdm '
                        +' LEFT JOIN '+U_funcao.SelSchema('pneufab')+' on pfb_codigo = pmd_codpfb '
                        +' where piv_status = '+QuotedStr('SUCATA')
                        +' order by piv_mfogo';
   sqlPneuSct.Open;
   cliPneuSct.Active := True;
   ativabtn;


end;

procedure TfrmPneuMnt.btnConMetClick(Sender: TObject);
Var
  qDel1, qDel2: TFDQuery;
  cCodTnq, cNumAnt, evento, objeto : String;
begin
  evento := cEvento;
  objeto := '';
  IniTransacao;

  // Atualiza Km do Veiciulo
  qDel2 := TFDQuery.Create(Self);
  qDel1 := TFDQuery.Create(Self);

  qDel1.Connection  := dmEmp.SqlConSis;
  qDel1.Close;
  qDel1.SQl.Text    :='UPDATE '+U_funcao.SelSchema('pneuive')+' Set piv_situac = '+QuotedStr(cmbMetragem.Text)
                    +', piv_mlmsc1 = '+QuotedStr(edSulcMet1.Text)
                    +', piv_mlmsc2 = '+QuotedStr(edSulcMet2.Text)
                    +', piv_mlmsc3 = '+QuotedStr(edSulcMet3.Text)
                    +', piv_mlmsc4 = '+QuotedStr(edSulcMet4.Text)
                    +', piv_mlmsc5 = '+QuotedStr(edSulcMet5.Text)
                    +', piv_mlmsc6 = '+QuotedStr(edSulcMet6.Text)
                    +', piv_kmmant = '+RmCharValor( edKmMetr.Text )
                    +' WHERE piv_mfogo = :fogo ';
  qDel1.ParamByName('fogo').Text        := edFogoMet.Text;
  qDel1.ExecSQL;

  // Pegar Codigo do pneu iventario
  qDel2.Connection  := dmEmp.SqlConSis;
  qDel2.Close;
  qDel2.SQl.Text    :='Select * From '+U_funcao.SelSchema('pneuive')
                    +' WHERE piv_mfogo = :fogo ';
  qDel2.ParamByName('fogo').Text        := edFogoMet.Text;
  qDel2.open;


  // Grava a Movimentação da Compra
  qDel1.Connection  := dmEmp.SqlConSis;
  qDel1.Close;
  qDel1.SQl.Text   :='insert into '+U_funcao.SelSchema('pneumnt')
                                  +' ( pmt_codpiv, pmt_DatEve, pmt_HorEve, pmt_mfogo,    pmt_evento, ' //pmt_codplc,
                                  +'   pmt_objeto, pmt_posic,  pmt_vlrcst,  pmt_kmrodiz, pmt_kmatual,  '
                                  +'   pmt_libras, pmt_mlmsc1, pmt_mlmsc2,  pmt_mlmsc3,  pmt_mlmsc4,    '
                                  +'   pmt_mlmsc5, pmt_mlmsc6, pmt_mrvida,  pmt_kmvida,  pmt_kmroda,   ' //pmt_codfnd,
                                  +'   pmt_UsuInc, pmt_DatInc, pmt_HorInc ) values '
                                  +' ( :pmt_codpiv, :pmt_DatEve, :pmt_HorEve, :pmt_mfogo,   :pmt_evento, ' // :pmt_codplc,
                                  +'   :pmt_objeto, :pmt_posic,  :pmt_vlrcst, :pmt_kmrodiz, :pmt_kmatual,  '
                                  +'   :pmt_libras, :pmt_mlmsc1, :pmt_mlmsc2, :pmt_mlmsc3,  :pmt_mlmsc4,   '
                                  +'   :pmt_mlmsc5, :pmt_mlmsc6, :pmt_mrvida, :pmt_kmvida,  :pmt_kmroda,   ' //:pmt_codfnd,
                                  +'   :pmt_UsuInc, :pmt_DatInc, :pmt_HorInc ) ';
  qDel1.ParamByName('pmt_codpiv').Text    := cCodpiv;
  qDel1.ParamByName('pmt_DatEve').AsDate  := edDatMet.Date ;
  qDel1.ParamByName('pmt_HorEve').Text    := edHorMet.Text ;
  qDel1.ParamByName('pmt_mfogo').Text     := edFogoMet.Text  ;
 // qDel1.ParamByName('pmt_codplc').Text    := cPlacaAnt ;
  qDel1.ParamByName('pmt_evento').Text    := evento;
  qDel1.ParamByName('pmt_objeto').Text    := cmbMetragem.Text ;
  qDel1.ParamByName('pmt_posic').Text     := cLocaliza  ;
  qDel1.ParamByName('pmt_vlrcst').AsFloat :=  0  ;
  qDel1.ParamByName('pmt_kmrodiz').Text   := qDel2.FieldByName('piv_kmrodi').Text;
  qDel1.ParamByName('pmt_kmatual').Text   := RmCharValor( edKmMetr.Text );
  qDel1.ParamByName('pmt_libras').Text    := '0';
  qDel1.ParamByName('pmt_mlmsc1').Text    := edSulcMet1.Text;
  qDel1.ParamByName('pmt_mlmsc2').Text    := edSulcMet2.Text;
  qDel1.ParamByName('pmt_mlmsc3').Text    := edSulcMet3.Text;
  qDel1.ParamByName('pmt_mlmsc4').Text    := edSulcMet4.Text;
  qDel1.ParamByName('pmt_mlmsc5').Text    := edSulcMet5.Text;
  qDel1.ParamByName('pmt_mlmsc6').Text    := edSulcMet6.Text;
  qDel1.ParamByName('pmt_mrvida').Text    := qDel2.FieldByName('piv_nrvida').Text;
  qDel1.ParamByName('pmt_kmvida').Text    := '0';
  qDel1.ParamByName('pmt_kmroda').AsFloat := ( StrToFloat( RmCharValor( edKmMetr.Text )) - qDel2.FieldByName('piv_kminst').AsFloat );
  //qDel1.ParamByName('pmt_codfnd').Text    := pcp_codfnd.Text ;
  qDel1.ParamByName('pmt_UsuInc').Text    :=  sysUsuario ;
  qDel1.ParamByName('pmt_DatInc').AsDate  := now ;
  qDel1.ParamByName('pmt_HorInc').Text    := TimeToStr(time) ;
  qDel1.ExecSQL;

  // Atualiza Km do Veiciulo
  qDel1.Close;
  qDel1.SQl.Text    :='UPDATE '+U_funcao.SelSchema('veiculoatv')+' Set vat_kmatu = :kmatu WHERE vat_placa = :placa ';
  qDel1.ParamByName('placa').Text       := edPlaca.Text;
  qDel1.ParamByName('kmatu').AsFloat    := FormataNum(  edKmMetr.Text );
  qDel1.ExecSQL;

  Auditor( Screen.FocusedForm.Caption, 'METRAG PNEU '+edPlaca.Text,'CD FOGO: '+edFogoMet.Text );

  FimTransacao;
  inittelas(0,False);
  atualizagrids;
  //esqueleto;
  esqueleto2;
  grbPneus.Refresh;
  FreeAndNil(qDel1);
  FreeAndNil(qDel2);

  ShowMessage('Metragem Com Sucesso');

end;

procedure TfrmPneuMnt.btnDesInsOkClick(Sender: TObject);
Var
  qDel1, qDel2: TFDQuery;
  cCodTnq, cNumAnt,evento, objeto, cVida: String;
begin
  evento := 'DESINSTALADO';
  objeto := '';
  IniTransacao;
  // Atualiza Km do Veiciulo
  qDel1 := TFDQuery.Create(Self);
  qDel2 := TFDQuery.Create(Self);

  qDel1.Connection  := dmEmp.SqlConSis;
  qDel1.Close;
  qDel1.SQl.Text    :='UPDATE '+U_funcao.SelSchema('pneuive')+' Set piv_status = '+QuotedStr('ESTOQUE')
                    +', piv_situac = '+QuotedStr(edEveDesIns.Text)
                    +', piv_kmmant = '+RmCharValor( edDesInsKmAtual.Text )
                    +' WHERE piv_mfogo = :fogo ';
  qDel1.ParamByName('fogo').Text        := edDesInstFogo.Text;
  qDel1.ExecSQL;

  // Pegar Codigo do pneu iventario
  qDel1.Connection  := dmEmp.SqlConSis;
  qDel1.Close;
  qDel1.SQl.Text    :='Select * From '+U_funcao.SelSchema('pneuive')
                    +' WHERE piv_mfogo = :fogo ';
  qDel1.ParamByName('fogo').Text        := edDesInstFogo.Text;
  qDel1.open;

  // Grava a Movimentação da Compra
  cVida := 'piv_kmvda'+Trim(qDel1.FieldByName('piv_nrvida').Text);
  qDel2.Connection  := dmEmp.SqlConSis;
  qDel2.Close;
  qDel2.SQl.Text   :='insert into '+U_funcao.SelSchema('pneumnt')
                                  +' ( pmt_codpiv, pmt_DatEve, pmt_HorEve,  pmt_mfogo,    pmt_codplc, pmt_evento, ' //
                                  +'   pmt_objeto, pmt_posic,  pmt_vlrcst,  pmt_kmatual,  '
                                  +'   pmt_libras, pmt_mlmsc1, pmt_mlmsc2,  pmt_mlmsc3,  pmt_mlmsc4,    '
                                  +'   pmt_mlmsc5, pmt_mlmsc6, pmt_mrvida,  pmt_kmvida, pmt_kmroda, pmt_kmrodiz,     ' //pmt_codfnd,
                                  +'   pmt_UsuInc, pmt_DatInc, pmt_HorInc ) values '
                                  +' ( :pmt_codpiv, :pmt_DatEve, :pmt_HorEve, :pmt_mfogo,   :pmt_codplc,  :pmt_evento, ' // :
                                  +'   :pmt_objeto, :pmt_posic,  :pmt_vlrcst, :pmt_kmatual,  '
                                  +'   :pmt_libras, :pmt_mlmsc1, :pmt_mlmsc2, :pmt_mlmsc3,  :pmt_mlmsc4,   '
                                  +'   :pmt_mlmsc5, :pmt_mlmsc6, :pmt_mrvida, :pmt_kmvida, :pmt_kmroda,   :pmt_kmrodiz,  ' //:pmt_codfnd,
                                  +'   :pmt_UsuInc, :pmt_DatInc, :pmt_HorInc ) ';
  qDel2.ParamByName('pmt_codpiv').Text    := qDel1.FieldByName('piv_codigo').Text;
  qDel2.ParamByName('pmt_DatEve').AsDate  := now ;
  qDel2.ParamByName('pmt_HorEve').Text    := TimeToStr(time) ;
  qDel2.ParamByName('pmt_mfogo').Text     := edDesInstFogo.Text  ;
  if lCarroc then begin
     qDel2.ParamByName('pmt_codplc').Text    := edPlaca.Text  ;
  end Else Begin
     qDel2.ParamByName('pmt_codplc').Text    := qDel1.FieldByName('piv_codplc').Text  ;
  End;
  qDel2.ParamByName('pmt_evento').Text    := evento;
  qDel2.ParamByName('pmt_objeto').Text    := edEveDesIns.Text ;
  qDel2.ParamByName('pmt_posic').Text     := cLocaliza  ;
  qDel2.ParamByName('pmt_vlrcst').AsFloat := 0  ;
  qDel2.ParamByName('pmt_kmrodiz').Text   := qDel1.FieldByName('piv_kmrodi').Text;
  qDel2.ParamByName('pmt_kmatual').Text   := RmCharValor( edDesInsKmAtual.Text );
  qDel2.ParamByName('pmt_libras').Text    := edDesInsCalib.Text;
  qDel2.ParamByName('pmt_mlmsc1').Text    := edDesIncSulc1.Text;
  qDel2.ParamByName('pmt_mlmsc2').Text    := edDesIncSulc1.Text;
  qDel2.ParamByName('pmt_mlmsc3').Text    := edDesIncSulc1.Text;
  qDel2.ParamByName('pmt_mlmsc4').Text    := edDesIncSulc1.Text;
  qDel2.ParamByName('pmt_mlmsc5').Text    := edDesIncSulc1.Text;
  qDel2.ParamByName('pmt_mlmsc6').Text    := edDesIncSulc1.Text;
  qDel2.ParamByName('pmt_mrvida').Text    := qDel1.FieldByName('piv_nrvida').Text;
  qDel2.ParamByName('pmt_kmvida').Text    := qDel1.FieldByName(cVida).Text;
  if StrToFloat( RmCharValor( edDesInsKmAtual.Text )) > 0 then begin
     qDel2.ParamByName('pmt_kmroda').AsFloat := ( StrToFloat( RmCharValor( edDesInsKmAtual.Text )) - qDel1.FieldByName('piv_kminst').AsFloat );
  end else begin
     qDel2.ParamByName('pmt_kmroda').AsFloat := 0 ;
  end;
  //qDel2.ParamByName('pmt_codfnd').Text    := pcp_codfnd.Text ;
  qDel2.ParamByName('pmt_UsuInc').Text    :=  sysUsuario ;
  qDel2.ParamByName('pmt_DatInc').AsDate  := now ;
  qDel2.ParamByName('pmt_HorInc').Text    := TimeToStr(time) ;
  qDel2.ExecSQL;

  // Atualiza Km do Veiciulo
  if edDesInsKmAtual.Enabled then begin

      qDel1.Close;
      qDel1.SQl.Text    :='UPDATE '+U_funcao.SelSchema('veiculoatv')+' Set vat_kmatu = :kmatu WHERE vat_placa = :placa ';
      qDel1.ParamByName('placa').Text       := edPlaca.Text;
      qDel1.ParamByName('kmatu').AsFloat    := FormataNum(  edDesInsKmAtual.Text );
      qDel1.ExecSQL;

  end;


  Auditor( Screen.FocusedForm.Caption, 'DESINST PNEU '+edPlaca.Text,'CD FOGO: '+edDesInstFogo.Text );

  FimTransacao;
  inittelas(0,False);
  atualizagrids;
  esqueleto2;
  grbPneus.Refresh;
  FreeAndNil(qDel1);
  FreeAndNil(qDel2);


  ShowMessage('Processo Realizado Com Sucesso!');


end;

procedure TfrmPneuMnt.btnHistExecute(Sender: TObject);
begin
  sqlPneuHist.Close;
  cliPneuHist.Close;
  sqlPneuHist.SQL.Text:= ' Select * FROM '+U_funcao.SelSchema('pneumnt')
                         +' LEFT JOIN '+U_funcao.SelSchema('pneuive')+' on piv_mfogo = pmt_mfogo  '
                         +' LEFT JOIN '+U_funcao.SelSchema('veiculoatv')+' on vat_placa = piv_codplc '
                         +' LEFT JOIN '+U_funcao.SelSchema('modelo')+' modelo on mdl_codigo = vat_codmdl '
                         +' LEFT JOIN '+U_funcao.SelSchema('pneumod')+' on pmd_codigo = piv_codpmd '
                         +' LEFT JOIN '+U_funcao.SelSchema('pneudes')+' on pds_codigo = pmd_codpds '
                         +' LEFT JOIN '+U_funcao.SelSchema('pneudim')+' on pdm_codigo = pmd_codpdm '
                         +' LEFT JOIN '+U_funcao.SelSchema('pneufab')+' on pfb_codigo = pmd_codpfb '
                         +' LEFT JOIN '+U_funcao.SelSchema('fornecedor')+' on fnd_codigo = pmt_codfnd '
                         +' WHERE pmt_mfogo = :fogo '
                         +' order by pmt_mfogo, pmt_codigo, pmt_dateve ';
  sqlPneuHist.ParamByName('fogo').Text        := edFogo.Text;
  sqlPneuHist.Open;
  cliPneuHist.Active := True;

  ImpHistorico.LoadFromFile(cPathExe+'reports\'+'pneu_man_historico.fr3');
  ImpHistorico.Variables['CAB01']  := QuotedStr( UpperCase(U_funcao.nmSistema));
  ImpHistorico.Variables['CAB02']  := QuotedStr( UpperCase(fPrincipal.Caption));
  ImpHistorico.Variables['CAB03']  := QuotedStr( 'HISTÓRICO DE MOVIMENTAÇÃO DE PNEUS' );
  ImpHistorico.Variables['CAB05']  := QuotedStr(  sysUsuario);
  //ImpHistorico.DesignReport;
  ImpHistorico.ShowReport();
  sqlPneuHist.Close;
  cliPneuHist.Close;

end;

procedure TfrmPneuMnt.btnInsCancelaClick(Sender: TObject);
begin
  inittelas(0,False);
end;

procedure TfrmPneuMnt.btnInsOkClick(Sender: TObject);
Var
  qDel1, qDel2: TFDQuery;
  cCodTnq, cNumAnt, evento, objeto : String;
begin
  evento := 'INSTALADO';
  objeto := '';
  IniTransacao;

  // Pega Informações do Pneus
  qDel2 := TFDQuery.Create(Self);
  qDel2.Connection  := dmEmp.SqlConSis;
  qDel2.Close;
  qDel2.SQl.Text    :='select * From '+U_funcao.SelSchema('pneuive')
                     +' left join '+U_funcao.SelSchema('pneumod')+' on pmd_codigo = piv_codpmd '
                     +' WHERE piv_mfogo = :fogo ';
  qDel2.ParamByName('fogo').Text        := edInstFogo.Text;
  qDel2.open;


  // Atualiza Km do Veiciulo
  qDel1 := TFDQuery.Create(Self);
  qDel1.Connection  := dmEmp.SqlConSis;
  qDel1.Close;
  qDel1.SQl.Text    :='UPDATE '+U_funcao.SelSchema('pneuive')
                    +' Set piv_codplc = :placa, piv_locpne = :local, piv_status = '+QuotedStr(evento)
                    +', piv_situac = '+QuotedStr(edEveIns.Text)
                    +', piv_kmmant = :piv_kmmant '
                    +fIIF(edInsKmRdo.Enabled, ',  piv_kmrodi = :piv_kmrodi ','' )
                    +fIIF( ( ( qDel2.FieldByName('pmd_kmvid1').AsFloat > 0 ) and ( qDel2.FieldByName('piv_kmvda1').AsFloat = 0 )  ),
                                               ', piv_kmvda1 = '+FloatToStr( StrToFloat( RmCharValor( edInsKmAtual.Text )) + qDel2.FieldByName('pmd_kmvid1').AsFloat  )
                                               +', piv_nrvida = '+QuotedStr('1')+', piv_kminst = '+RmCharValor( edInsKmAtual.Text ),'' )

                    +fIIF( ( ( qDel2.FieldByName('pmd_kmvid2').AsFloat > 0 ) and ( qDel2.FieldByName('piv_kmvda2').AsFloat = 0 )
                                                                             and ( qDel2.FieldByName('piv_kmvda1').AsFloat > 0 )
                                                                             and ( qDel2.FieldByName('piv_nrvida').Text = '2'  ) ),
                                               ', piv_kmvda2 = '+FloatToStr( StrToFloat( RmCharValor( edInsKmAtual.Text )) + qDel2.FieldByName('pmd_kmvid2').AsFloat )+', piv_nrvida = '+QuotedStr('2'),'' )

                    +fIIF( ( ( qDel2.FieldByName('pmd_kmvid3').AsFloat > 0 ) and ( qDel2.FieldByName('piv_kmvda3').AsFloat = 0 )
                                                                             and ( qDel2.FieldByName('piv_kmvda2').AsFloat > 0 )
                                                                             and ( qDel2.FieldByName('piv_nrvida').Text = '3'  ) ),
                                               ', piv_kmvda3 = '+FloatToStr( StrToFloat( RmCharValor( edInsKmAtual.Text )) + qDel2.FieldByName('pmd_kmvid3').AsFloat )+', piv_nrvida = '+QuotedStr('3'),'' )

                    +fIIF( ( ( qDel2.FieldByName('pmd_kmvid4').AsFloat > 0 ) and ( qDel2.FieldByName('piv_kmvda4').AsFloat = 0 )
                                                                             and ( qDel2.FieldByName('piv_kmvda3').AsFloat > 0 )
                                                                             and ( qDel2.FieldByName('piv_nrvida').Text = '4'  ) ),
                                               ', piv_kmvda4 = '+FloatToStr( StrToFloat( RmCharValor( edInsKmAtual.Text )) + qDel2.FieldByName('pmd_kmvid4').AsFloat )+', piv_nrvida = '+QuotedStr('4'),'' )

                    +fIIF( ( ( qDel2.FieldByName('pmd_kmvid5').AsFloat > 0 ) and ( qDel2.FieldByName('piv_kmvda5').AsFloat = 0 )
                                                                             and ( qDel2.FieldByName('piv_kmvda4').AsFloat > 0 )
                                                                             and ( qDel2.FieldByName('piv_nrvida').Text = '5'  ) ),
                                               ', piv_kmvda5 = '+FloatToStr( StrToFloat( RmCharValor( edInsKmAtual.Text )) + qDel2.FieldByName('pmd_kmvid5').AsFloat )+', piv_nrvida = '+QuotedStr('5'),'' )

                    +fIIF( ( ( qDel2.FieldByName('pmd_kmvid6').AsFloat > 0 ) and ( qDel2.FieldByName('piv_kmvda6').AsFloat = 0 )
                                                                             and ( qDel2.FieldByName('piv_kmvda5').AsFloat > 0 )
                                                                             and ( qDel2.FieldByName('piv_nrvida').Text = '6'  ) ),
                                               ', piv_kmvda6 = '+FloatToStr( StrToFloat( RmCharValor( edInsKmAtual.Text )) + qDel2.FieldByName('pmd_kmvid6').AsFloat )+', piv_nrvida = '+QuotedStr('6'),'' )

                    +fIIF( ( ( qDel2.FieldByName('pmd_kmvid7').AsFloat > 0 ) and ( qDel2.FieldByName('piv_kmvda7').AsFloat = 0 )
                                                                             and ( qDel2.FieldByName('piv_kmvda6').AsFloat > 0 )
                                                                             and ( qDel2.FieldByName('piv_nrvida').Text = '7'  ) ),
                                               ', piv_kmvda7 = '+FloatToStr( StrToFloat( RmCharValor( edInsKmAtual.Text )) + qDel2.FieldByName('pmd_kmvid7').AsFloat )+', piv_nrvida = '+QuotedStr('7'),'' )

                    +fIIF( ( ( qDel2.FieldByName('pmd_kmvid8').AsFloat > 0 ) and ( qDel2.FieldByName('piv_kmvda8').AsFloat = 0 )
                                                                             and ( qDel2.FieldByName('piv_kmvda7').AsFloat > 0 )
                                                                             and ( qDel2.FieldByName('piv_nrvida').Text = '8'  ) ),
                                               ', piv_kmvda8 = '+FloatToStr( StrToFloat( RmCharValor( edInsKmAtual.Text )) + qDel2.FieldByName('pmd_kmvid8').AsFloat )+', piv_nrvida = '+QuotedStr('8'),'' )

                    +fIIF( ( ( qDel2.FieldByName('pmd_kmvid9').AsFloat > 0 ) and ( qDel2.FieldByName('piv_kmvda9').AsFloat = 0 )
                                                                             and ( qDel2.FieldByName('piv_kmvda8').AsFloat > 0 )
                                                                             and ( qDel2.FieldByName('piv_nrvida').Text = '9'  ) ),
                                               ', piv_kmvda9 = '+FloatToStr( StrToFloat( RmCharValor( edInsKmAtual.Text )) + qDel2.FieldByName('pmd_kmvid9').AsFloat )+', piv_nrvida = '+QuotedStr('9'),'' )
                    +' WHERE piv_mfogo = :fogo ';
  if edInsKmRdo.Enabled then begin
     qDel1.ParamByName('piv_kmrodi').AsFloat  :=  ( StrToFloat( RmCharValor( edInsKmAtual.Text )) + StrToFloat( RmCharValor( edInsKmRdo.Text )) );
  end;
  qDel1.ParamByName('piv_kmmant').Text  := RmCharValor( edInsKmAtual.Text );
  qDel1.ParamByName('placa').Text       := edPlaca.Text;
  qDel1.ParamByName('local').Text       := cLocaliza ;
  qDel1.ParamByName('fogo').Text        := edInstFogo.Text;
  qDel1.ExecSQL;

  qDel2.Refresh;

  // Grava a Movimentação da Compra
  qDel1.Connection  := dmEmp.SqlConSis;
  qDel1.Close;
  qDel1.SQl.Text   :='insert into '+U_funcao.SelSchema('pneumnt')
                                  +' ( pmt_codpiv, pmt_DatEve, pmt_HorEve,  pmt_mfogo,   pmt_codplc, pmt_evento, ' //
                                  +'   pmt_objeto, pmt_posic,  pmt_vlrcst,  pmt_kmrodiz, pmt_kmatual,  '
                                  +'   pmt_libras, pmt_mlmsc1, pmt_mlmsc2,  pmt_mlmsc3,  pmt_mlmsc4,    '
                                  +'   pmt_mlmsc5, pmt_mlmsc6, pmt_mrvida,  pmt_kmvida,  pmt_kmroda,     ' //pmt_codfnd,
                                  +'   pmt_UsuInc, pmt_DatInc, pmt_HorInc ) values '
                                  +' ( :pmt_codpiv, :pmt_DatEve, :pmt_HorEve, :pmt_mfogo,   :pmt_codplc,  :pmt_evento, ' // :
                                  +'   :pmt_objeto, :pmt_posic,  :pmt_vlrcst, :pmt_kmrodiz, :pmt_kmatual,  '
                                  +'   :pmt_libras, :pmt_mlmsc1, :pmt_mlmsc2, :pmt_mlmsc3,  :pmt_mlmsc4,   '
                                  +'   :pmt_mlmsc5, :pmt_mlmsc6, :pmt_mrvida, :pmt_kmvida,  :pmt_kmroda,     ' //:pmt_codfnd,
                                  +'   :pmt_UsuInc, :pmt_DatInc, :pmt_HorInc ) ';
  qDel1.ParamByName('pmt_codpiv').Text    := dbgEstoque.DataSource.DataSet.FieldByName('piv_codigo').Value;
  qDel1.ParamByName('pmt_DatEve').AsDate  := edDatinst.Date ;
  qDel1.ParamByName('pmt_HorEve').Text    := edHorIns.Text ;
  qDel1.ParamByName('pmt_mfogo').Text     := edInstFogo.Text  ;
  qDel1.ParamByName('pmt_codplc').Text    := edPlaca.Text  ;
  qDel1.ParamByName('pmt_evento').Text    := evento;
  qDel1.ParamByName('pmt_objeto').Text    := objeto;
  qDel1.ParamByName('pmt_posic').Text     := cLocaliza  ;
  qDel1.ParamByName('pmt_vlrcst').AsFloat := 0  ;
  qDel1.ParamByName('pmt_kmrodiz').Text   := qDel2.FieldByName('piv_kmrodi').Text;
  qDel1.ParamByName('pmt_kmatual').Text   := RmCharValor( edInsKmAtual.Text );
  qDel1.ParamByName('pmt_libras').Text    := edInsCalib.Text;
  qDel1.ParamByName('pmt_mlmsc1').Text    := edIncSulc1.Text;
  qDel1.ParamByName('pmt_mlmsc2').Text    := edIncSulc1.Text;
  qDel1.ParamByName('pmt_mlmsc3').Text    := edIncSulc1.Text;
  qDel1.ParamByName('pmt_mlmsc4').Text    := edIncSulc1.Text;
  qDel1.ParamByName('pmt_mlmsc5').Text    := edIncSulc1.Text;
  qDel1.ParamByName('pmt_mlmsc6').Text    := edIncSulc1.Text;
  qDel1.ParamByName('pmt_mrvida').Text    := qDel2.FieldByName('piv_nrvida').Text;
  qDel1.ParamByName('pmt_kmvida').Text    := dbgEstoque.DataSource.DataSet.FieldByName('piv_kmvda1').Text;
  qDel1.ParamByName('pmt_kmroda').AsFloat := ( StrToFloat( RmCharValor( edInsKmAtual.Text )) - qDel2.FieldByName('piv_kminst').AsFloat );
  //qDel1.ParamByName('pmt_codfnd').Text    := pcp_codfnd.Text ;
  qDel1.ParamByName('pmt_UsuInc').Text    :=  sysUsuario ;
  qDel1.ParamByName('pmt_DatInc').AsDate  := now ;
  qDel1.ParamByName('pmt_HorInc').Text    := TimeToStr(time) ;
  qDel1.ExecSQL;

  // Atualiza Km do Veiciulo
  qDel1.Close;
  qDel1.SQl.Text    :='UPDATE '+U_funcao.SelSchema('veiculoatv')+' Set vat_kmatu = :kmatu WHERE vat_placa = :placa ';
  qDel1.ParamByName('placa').Text       := edPlaca.Text;
  qDel1.ParamByName('kmatu').AsFloat    := FormataNum(  edInsKmAtual.Text );
  qDel1.ExecSQL;
  qDel2.Close;

  Auditor( Screen.FocusedForm.Caption, 'INSTAL PNEU '+edPlaca.Text,'CD FOGO: '+edInstFogo.Text );

  FimTransacao;
  inittelas(0,False);
  atualizagrids;
  esqueleto2;
  grbPneus.Refresh;
  FreeAndNil(qDel1);
  FreeAndNil(qDel2);

  ShowMessage('Instalado Com Sucesso');


end;

procedure TfrmPneuMnt.btnMetExecute(Sender: TObject);
var
qDel : TFDQuery;
begin

       // Pegar os dados do Pneu
       qDel := TFDQuery.Create(Nil);
       qDel.Connection  := dmEmp.SqlConSis;
       qDel.Close;
       qDel.SQl.Text   :='select * from '+U_funcao.SelSchema('pneuive')
                          +' left join '+U_funcao.SelSchema('pneumod')+' on pmd_codigo = piv_codpmd '
                          +' left join '+U_funcao.SelSchema('pneudes')+' on pds_codigo = pmd_codpds '
                          +' where piv_mfogo  = '+QuotedStr( edFogo.Text);

       qDel.Open;

       inittelas(4,True);
       edFogoMet.Text     := edFogo.Text;
       cLocaliza          := qDel.FieldByName('piv_locpne').Value ;
       edPosicMet.Text    := PgLocalPne(cLocaliza) ;
       cNumVida           := qDel.FieldByName('piv_nrvida').Value ;


       cCodpiv                  := qDel.FieldByName('piv_codigo').Value ;
       cEvento                  := qDel.FieldByName('piv_status').Value ;
       edDatMet.Date            := now;
       edKmMetr.Text            := FormatCurr('Km #,###,##0',0);
       edSulcMet1.Text          := qDel.FieldByName('piv_mlmsc1').Value ;
       edSulcMet2.Text          := qDel.FieldByName('piv_mlmsc2').Value ;
       edSulcMet3.Text          := qDel.FieldByName('piv_mlmsc3').Value ;
       edSulcMet4.Text          := qDel.FieldByName('piv_mlmsc4').Value ;
       edSulcMet5.Text          := qDel.FieldByName('piv_mlmsc5').Value ;
       edSulcMet6.Text          := qDel.FieldByName('piv_mlmsc6').Value ;

       edSulcMet1.Enabled       := fIIF(StrToInt(qDel.FieldByName('pds_sucos').Value)>=1, True, False );
       edSulcMet2.Enabled       := fIIF(StrToInt(qDel.FieldByName('pds_sucos').Value)>=2, True, False );
       edSulcMet3.Enabled       := fIIF(StrToInt(qDel.FieldByName('pds_sucos').Value)>=3, True, False );
       edSulcMet4.Enabled       := fIIF(StrToInt(qDel.FieldByName('pds_sucos').Value)>=4, True, False );
       edSulcMet5.Enabled       := fIIF(StrToInt(qDel.FieldByName('pds_sucos').Value)>=5, True, False );
       edSulcMet6.Enabled       := fIIF(StrToInt(qDel.FieldByName('pds_sucos').Value)>=6, True, False );

       pdirInt01DblClick(Self);
       edDatMet.SetFocus;
  FreeAndNil(qDel);


end;

procedure TfrmPneuMnt.btnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmPneuMnt.Button1Click(Sender: TObject);
Var
  qDel1, qDel2, qDel3: TFDQuery;
  cCodTnq, cNumAnt, evento, objeto, cVida2, cVida3, Fogo1, Fogo2, Descfg1, Descfg2 : String;
begin
  evento := 'INSTALADO';
  objeto := 'RODIZIO';
  IniTransacao;

  // Pega pneu 01
  qDel2 := TFDQuery.Create(Self);
  qDel2.Connection  := dmEmp.SqlConSis;
  qDel2.Close;
  qDel2.SQl.Text    :='select * From '+U_funcao.SelSchema('pneuive')
                     +' left join '+U_funcao.SelSchema('pneumod')+' on pmd_codigo = piv_codpmd '
                     +' WHERE piv_mfogo = :fogo ';
  qDel2.ParamByName('fogo').Text        := edFogoRod1.Text;
  qDel2.open;
  cVida2 := 'piv_kmvda'+Trim(qDel2.FieldByName('piv_nrvida').Text);

  // Pega pneu 02
  qDel3 := TFDQuery.Create(Self);
  qDel3.Connection  := dmEmp.SqlConSis;
  qDel3.Close;
  qDel3.SQl.Text    :='select * From '+U_funcao.SelSchema('pneuive')
                     +' left join '+U_funcao.SelSchema('pneumod')+' on pmd_codigo = piv_codpmd '
                     +' WHERE piv_mfogo = :fogo ';
  qDel3.ParamByName('fogo').Text        := edFogoRod2.Text;
  qDel3.open;
  cVida3 := 'piv_kmvda'+Trim(qDel2.FieldByName('piv_nrvida').Text);

  // Grava pneu 01 para 02
  qDel1 := TFDQuery.Create(Self);
  qDel1.Connection  := dmEmp.SqlConSis;
  qDel1.Close;
  qDel1.SQl.Text    :='UPDATE '+U_funcao.SelSchema('pneuive')
                    +'  Set piv_codplc = :placa, piv_locpne = :local '
                    +', piv_kmmant = :piv_kmmant '
                    +', piv_kmrodi = :piv_kmrodi '
                    +'  WHERE piv_mfogo = :fogo  ';
  qDel1.ParamByName('piv_kmrodi').AsFloat   := ( StrToFloat( RmCharValor( edKmRdoAtua.Text )) + StrToFloat( RmCharValor( edKmRodNov.Text )) );
  qDel1.ParamByName('piv_kmmant').Text      := RmCharValor( edKmRodNov.Text );
  qDel1.ParamByName('placa').Text           := edPlaca.Text;
  qDel1.ParamByName('local').Text           := cPneu1 ;
  qDel1.ParamByName('fogo').Text            := edFogoRod2.Text;
  qDel1.ExecSQL;


  // Grava pneu 02 para 01
  qDel1.Connection  := dmEmp.SqlConSis;
  qDel1.Close;
  qDel1.SQl.Text    :='UPDATE '+U_funcao.SelSchema('pneuive')
                    +'  Set piv_codplc = :placa, piv_locpne = :local '
                    +', piv_kmmant = :piv_kmmant '
                    +', piv_kmrodi = :piv_kmrodi '
                    +'  WHERE piv_mfogo = :fogo  ';
  qDel1.ParamByName('piv_kmrodi').AsFloat   := ( StrToFloat( RmCharValor( edKmRdoAtua.Text )) + StrToFloat( RmCharValor( edKmRodNov.Text )) );
  qDel1.ParamByName('piv_kmmant').Text      := RmCharValor( edKmRodNov.Text );
  qDel1.ParamByName('placa').Text           := edPlaca.Text;
  qDel1.ParamByName('local').Text           := cPneu2 ;
  qDel1.ParamByName('fogo').Text            := edFogoRod1.Text;
  qDel1.ExecSQL;

  // Grava Pneu 01
  qDel1.Connection  := dmEmp.SqlConSis;
  qDel1.Close;
  qDel1.SQl.Text   :='insert into '+U_funcao.SelSchema('pneumnt')
                                  +' ( pmt_codpiv, pmt_DatEve, pmt_HorEve,  pmt_mfogo,   pmt_codplc, pmt_evento, ' //
                                  +'   pmt_objeto, pmt_posic,  pmt_vlrcst,  pmt_kmrodiz, pmt_kmatual,  '
                                  +'   pmt_libras, pmt_mlmsc1, pmt_mlmsc2,  pmt_mlmsc3,  pmt_mlmsc4,    '
                                  +'   pmt_mlmsc5, pmt_mlmsc6, pmt_mrvida,  pmt_kmvida,  pmt_kmroda,     ' //pmt_codfnd,
                                  +'   pmt_UsuInc, pmt_DatInc, pmt_HorInc ) values '
                                  +' ( :pmt_codpiv, :pmt_DatEve, :pmt_HorEve, :pmt_mfogo,   :pmt_codplc,  :pmt_evento, ' // :
                                  +'   :pmt_objeto, :pmt_posic,  :pmt_vlrcst, :pmt_kmrodiz, :pmt_kmatual,  '
                                  +'   :pmt_libras, :pmt_mlmsc1, :pmt_mlmsc2, :pmt_mlmsc3,  :pmt_mlmsc4,   '
                                  +'   :pmt_mlmsc5, :pmt_mlmsc6, :pmt_mrvida, :pmt_kmvida,  :pmt_kmroda,     ' //:pmt_codfnd,
                                  +'   :pmt_UsuInc, :pmt_DatInc, :pmt_HorInc ) ';
  qDel1.ParamByName('pmt_codpiv').Text    := qDel2.FieldByName('piv_codigo').Value;
  qDel1.ParamByName('pmt_DatEve').AsDate  := edDatRod.Date ;
  qDel1.ParamByName('pmt_HorEve').Text    := edHorRod.Text ;
  qDel1.ParamByName('pmt_mfogo').Text     := edFogoRod1.Text  ;
  qDel1.ParamByName('pmt_codplc').Text    := edPlaca.Text  ;
  qDel1.ParamByName('pmt_evento').Text    := evento;
  qDel1.ParamByName('pmt_objeto').Text    := objeto;
  qDel1.ParamByName('pmt_posic').Text     := cPneu2  ;
  qDel1.ParamByName('pmt_vlrcst').AsFloat := 0  ;
  qDel1.ParamByName('pmt_kmrodiz').Text   := qDel2.FieldByName('piv_kmrodi').Text;
  qDel1.ParamByName('pmt_kmatual').Text   := RmCharValor( edKmRdoAtua.Text );
  qDel1.ParamByName('pmt_libras').Text    := '0';
  qDel1.ParamByName('pmt_mlmsc1').Text    := qDel2.FieldByName('piv_mlmsc1').Text;
  qDel1.ParamByName('pmt_mlmsc2').Text    := qDel2.FieldByName('piv_mlmsc2').Text;
  qDel1.ParamByName('pmt_mlmsc3').Text    := qDel2.FieldByName('piv_mlmsc3').Text;
  qDel1.ParamByName('pmt_mlmsc4').Text    := qDel2.FieldByName('piv_mlmsc4').Text;
  qDel1.ParamByName('pmt_mlmsc5').Text    := qDel2.FieldByName('piv_mlmsc5').Text;
  qDel1.ParamByName('pmt_mlmsc6').Text    := qDel2.FieldByName('piv_mlmsc6').Text;
  qDel1.ParamByName('pmt_mrvida').Text    := qDel2.FieldByName('piv_nrvida').Text;
  qDel1.ParamByName('pmt_kmvida').Text    := qDel2.FieldByName(cVida3).Text;
  qDel1.ParamByName('pmt_kmroda').AsFloat := ( StrToFloat( RmCharValor( edKmRdoAtua.Text )) - qDel2.FieldByName('piv_kminst').AsFloat );
  //qDel1.ParamByName('pmt_codfnd').Text    := pcp_codfnd.Text ;
  qDel1.ParamByName('pmt_UsuInc').Text    :=  sysUsuario ;
  qDel1.ParamByName('pmt_DatInc').AsDate  := now ;
  qDel1.ParamByName('pmt_HorInc').Text    := TimeToStr(time) ;
  qDel1.ExecSQL;

  // Grava Pneu 02
  qDel1.Connection  := dmEmp.SqlConSis;
  qDel1.Close;
  qDel1.SQl.Text   :='insert into '+U_funcao.SelSchema('pneumnt')
                                  +' ( pmt_codpiv, pmt_DatEve, pmt_HorEve,  pmt_mfogo,   pmt_codplc, pmt_evento, ' //
                                  +'   pmt_objeto, pmt_posic,  pmt_vlrcst,  pmt_kmrodiz, pmt_kmatual,  '
                                  +'   pmt_libras, pmt_mlmsc1, pmt_mlmsc2,  pmt_mlmsc3,  pmt_mlmsc4,    '
                                  +'   pmt_mlmsc5, pmt_mlmsc6, pmt_mrvida,  pmt_kmvida,  pmt_kmroda,     ' //pmt_codfnd,
                                  +'   pmt_UsuInc, pmt_DatInc, pmt_HorInc ) values '
                                  +' ( :pmt_codpiv, :pmt_DatEve, :pmt_HorEve, :pmt_mfogo,   :pmt_codplc,  :pmt_evento, ' // :
                                  +'   :pmt_objeto, :pmt_posic,  :pmt_vlrcst, :pmt_kmrodiz, :pmt_kmatual,  '
                                  +'   :pmt_libras, :pmt_mlmsc1, :pmt_mlmsc2, :pmt_mlmsc3,  :pmt_mlmsc4,   '
                                  +'   :pmt_mlmsc5, :pmt_mlmsc6, :pmt_mrvida, :pmt_kmvida,  :pmt_kmroda,     ' //:pmt_codfnd,
                                  +'   :pmt_UsuInc, :pmt_DatInc, :pmt_HorInc ) ';
  qDel1.ParamByName('pmt_codpiv').Text    := qDel3.FieldByName('piv_codigo').Value;
  qDel1.ParamByName('pmt_DatEve').AsDate  := edDatRod.Date ;
  qDel1.ParamByName('pmt_HorEve').Text    := edHorRod.Text ;
  qDel1.ParamByName('pmt_mfogo').Text     := edFogoRod2.Text  ;
  qDel1.ParamByName('pmt_codplc').Text    := edPlaca.Text  ;
  qDel1.ParamByName('pmt_evento').Text    := evento;
  qDel1.ParamByName('pmt_objeto').Text    := objeto;
  qDel1.ParamByName('pmt_posic').Text     := cPneu1 ;
  qDel1.ParamByName('pmt_vlrcst').AsFloat := 0  ;
  qDel1.ParamByName('pmt_kmrodiz').Text   := qDel3.FieldByName('piv_kmrodi').Text;
  qDel1.ParamByName('pmt_kmatual').Text   := RmCharValor( edKmRdoAtua.Text );
  qDel1.ParamByName('pmt_libras').Text    := '0';
  qDel1.ParamByName('pmt_mlmsc1').Text    := qDel3.FieldByName('piv_mlmsc1').Text;
  qDel1.ParamByName('pmt_mlmsc2').Text    := qDel3.FieldByName('piv_mlmsc2').Text;
  qDel1.ParamByName('pmt_mlmsc3').Text    := qDel3.FieldByName('piv_mlmsc3').Text;
  qDel1.ParamByName('pmt_mlmsc4').Text    := qDel3.FieldByName('piv_mlmsc4').Text;
  qDel1.ParamByName('pmt_mlmsc5').Text    := qDel3.FieldByName('piv_mlmsc5').Text;
  qDel1.ParamByName('pmt_mlmsc6').Text    := qDel3.FieldByName('piv_mlmsc6').Text;
  qDel1.ParamByName('pmt_mrvida').Text    := qDel3.FieldByName('piv_nrvida').Text;
  qDel1.ParamByName('pmt_kmvida').Text    := qDel3.FieldByName(cVida3).Text;
  qDel1.ParamByName('pmt_kmroda').AsFloat := ( StrToFloat( RmCharValor( edKmRdoAtua.Text )) - qDel3.FieldByName('piv_kminst').AsFloat );
  //qDel1.ParamByName('pmt_codfnd').Text    := pcp_codfnd.Text ;
  qDel1.ParamByName('pmt_UsuInc').Text    :=  sysUsuario ;
  qDel1.ParamByName('pmt_DatInc').AsDate  := now ;
  qDel1.ParamByName('pmt_HorInc').Text    := TimeToStr(time) ;
  qDel1.ExecSQL;




  // Atualiza Km do Veiciulo
  qDel1.Close;
  qDel1.SQl.Text    :='UPDATE '+U_funcao.SelSchema('veiculoatv')+' Set vat_kmatu = :kmatu WHERE vat_placa = :placa ';
  qDel1.ParamByName('placa').Text       := edPlaca.Text;
  qDel1.ParamByName('kmatu').AsFloat    := FormataNum(  edKmRdoAtua.Text );
  qDel1.ExecSQL;
  qDel2.Close;
  Fogo1             := edFogoRod1.Text;
  Descfg1           := edNomRod1.Text;
  Fogo2             := edFogoRod2.Text;
  Descfg2           := edNomRod2.Text;

  edFogoRod1.Text   := Fogo2;
  edFogoRod1.Color  := clYellow;
  edNomRod1.Text    := Descfg2;
  edNomRod1.Color   := clYellow;

  edFogoRod2.Text   := Fogo1;
  edFogoRod2.Color  := clYellow;
  edNomRod2.Text    := Descfg1;
  edNomRod2.Color   := clYellow;


  if MESSAGEBOX(Application.Handle, 'Conforma este Rodízio ', 'Confirma...', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin
      FimTransacao;
  end else begin
      edFogoRod1.Text   := Fogo1;
      edFogoRod1.Color  := $FFFFFF;
      edNomRod1.Text    := Descfg1;
      edNomRod1.Color   := $FFFFFF;

      edFogoRod2.Text   := Fogo2;
      edFogoRod2.Color  := $FFFFFF;
      edNomRod2.Text    := Descfg2;
      edNomRod2.Color   := $FFFFFF;

      RollBack;
      Exit;
  end;
  edFogoRod1.Text   := Fogo1;
  edFogoRod1.Color  := $FFFFFF;
  edNomRod1.Text    := Descfg1;
  edNomRod1.Color   := $FFFFFF;

  edFogoRod2.Text   := Fogo2;
  edFogoRod2.Color  := $FFFFFF;
  edNomRod2.Text    := Descfg2;
  edNomRod2.Color   := $FFFFFF;

  Auditor( Screen.FocusedForm.Caption, 'RODIZ PNEU '+edPlaca.Text,'CD FOGO: '+edFogoRod1.Text+' / '+edFogoRod2.Text );
  inittelas(0,False);
  atualizagrids;
  esqueleto2;
  grbPneus.Refresh;
  FreeAndNil(qDel1);
  FreeAndNil(qDel2);
  FreeAndNil(qDel3);



  ShowMessage('Rodízio Realizado Com Sucesso');


end;

procedure TfrmPneuMnt.Button4Click(Sender: TObject);
Var
  qDel1, qDel2, qDel3: TFDQuery;
  cCodTnq, cNumAnt,evento, objeto, cVid, cDescri: String;
begin
  evento := 'MANUTENCAO';
  objeto := '';
  IniTransacao;
  // Atualiza Km do Veiciulo
  qDel1 := TFDQuery.Create(Self);
  qDel2 := TFDQuery.Create(Self);
  qDel3 := TFDQuery.Create(Self);

  // Pegar Codigo do pneu iventario
  qDel3.Connection  := dmEmp.SqlConSis;
  qDel3.Close;
  qDel3.SQl.Text    :='Select *, CASE '
                    +'            WHEN pmd_kmvid1 > 0 and piv_kmvda1 = 0 THEN 1 '
                    +'            WHEN pmd_kmvid2 > 0 and piv_kmvda2 = 0 THEN 2 '
                    +'            WHEN pmd_kmvid3 > 0 and piv_kmvda3 = 0 THEN 3 '
                    +'            WHEN pmd_kmvid4 > 0 and piv_kmvda4 = 0 THEN 4 '
                    +'            WHEN pmd_kmvid5 > 0 and piv_kmvda5 = 0 THEN 5 '
                    +'            WHEN pmd_kmvid6 > 0 and piv_kmvda6 = 0 THEN 6 '
                    +'            ELSE 0 '
                    +'         END as vida '
                    +' From '+U_funcao.SelSchema('pneuive')
                    +' left join '+U_funcao.SelSchema('pneumod')+' on pmd_codigo = piv_codpmd'
                    +' WHERE piv_mfogo = :fogo ';
  qDel3.ParamByName('fogo').Text        := edMFogoMnt.Text;
  qDel3.open;

  if qDel3.FieldByName('piv_codplc').Text = ''  then begin
     ShowMessage('Pneu não usado! '+#13+#13+'Não é permitido colocar em manutenção '+#13+'pneus novos');
     RollBack;
     inittelas(0,False);
     Exit
  end;

  // Medir vida do pneu

  // Atualiza o Pneu
  qDel1.Connection  := dmEmp.SqlConSis;
  qDel1.Close;
  qDel1.SQl.Text    :='UPDATE '+U_funcao.SelSchema('pneuive')+' Set piv_status = '+QuotedStr('MANUTENCAO')
                    +', piv_situac = '+QuotedStr(cmbEveMnt.Text)
                    +', piv_kmmant = '+RmCharValor( edKmMnt.Text )
                    +fIIF( cmbEveMnt.ItemIndex <> 0, ', piv_nrvida = '+QuotedStr(  qDel3.FieldByName('vida').Text ),'')
                    +' WHERE piv_mfogo = :fogo ';
  qDel1.ParamByName('fogo').Text        := edMFogoMnt.Text;
  qDel1.ExecSQL;
  qDel3.Refresh;

  // Grava a Movimentação da Compra
  qDel2.Connection  := dmEmp.SqlConSis;
  qDel2.Close;
  qDel2.SQl.Text   :='insert into '+U_funcao.SelSchema('pneumnt')
                                  +' ( pmt_codpiv, pmt_DatEve, pmt_HorEve, pmt_mfogo,    pmt_evento, ' //pmt_codplc,
                                  +'   pmt_objeto, pmt_posic,  pmt_vlrcst,  pmt_kmrodiz, pmt_kmatual,  '
                                  +'   pmt_libras, pmt_mlmsc1, pmt_mlmsc2,  pmt_mlmsc3,  pmt_mlmsc4,    '
                                  +'   pmt_mlmsc5, pmt_mlmsc6, pmt_mrvida,  pmt_kmvida,  pmt_codfnd, pmt_kmroda,   ' //
                                  +'   pmt_UsuInc, pmt_DatInc, pmt_HorInc ) values '
                                  +' ( :pmt_codpiv, :pmt_DatEve, :pmt_HorEve, :pmt_mfogo,   :pmt_evento, ' // :pmt_codplc,
                                  +'   :pmt_objeto, :pmt_posic,  :pmt_vlrcst, :pmt_kmrodiz, :pmt_kmatual,  '
                                  +'   :pmt_libras, :pmt_mlmsc1, :pmt_mlmsc2, :pmt_mlmsc3,  :pmt_mlmsc4,   '
                                  +'   :pmt_mlmsc5, :pmt_mlmsc6, :pmt_mrvida, :pmt_kmvida,  :pmt_codfnd, :pmt_kmroda,  ' //
                                  +'   :pmt_UsuInc, :pmt_DatInc, :pmt_HorInc ) ';
  qDel2.ParamByName('pmt_codpiv').Text    := dbgEstoque.DataSource.DataSet.FieldByName('piv_codigo').Value;
  qDel2.ParamByName('pmt_DatEve').AsDate  := now ;
  qDel2.ParamByName('pmt_HorEve').Text    := TimeToStr(time) ;
  qDel2.ParamByName('pmt_mfogo').Text     := edMFogoMnt.Text  ;
  //qDel2.ParamByName('pmt_codplc').Text  := dbgEstoque.DataSource.DataSet.FieldByName('piv_codplc').Value;
  qDel2.ParamByName('pmt_evento').Text    := evento;
  qDel2.ParamByName('pmt_objeto').Text    := cmbEveMnt.Text ;
  qDel2.ParamByName('pmt_posic').Text     := cLocaliza  ;
  qDel2.ParamByName('pmt_vlrcst').AsFloat := FormataNum(edVlrMnt.Text)  ;
  qDel2.ParamByName('pmt_kmrodiz').Text   := qDel3.FieldByName('piv_kmrodi').Text;
  qDel2.ParamByName('pmt_kmatual').Text   := RmCharValor( edKmMnt.Text );
  qDel2.ParamByName('pmt_libras').Text    := edLibraMnt.Text;
  qDel2.ParamByName('pmt_mlmsc1').Text    := edMntIncSulc1.Text;
  qDel2.ParamByName('pmt_mlmsc2').Text    := edMntIncSulc1.Text;
  qDel2.ParamByName('pmt_mlmsc3').Text    := edMntIncSulc1.Text;
  qDel2.ParamByName('pmt_mlmsc4').Text    := edMntIncSulc1.Text;
  qDel2.ParamByName('pmt_mlmsc5').Text    := edMntIncSulc1.Text;
  qDel2.ParamByName('pmt_mlmsc6').Text    := edMntIncSulc1.Text;
  qDel2.ParamByName('pmt_mrvida').Text    := qDel3.FieldByName('piv_nrvida').Text;
  qDel2.ParamByName('pmt_kmvida').Text    := dbgEstoque.DataSource.DataSet.FieldByName('piv_kmvda1').Text;
  qDel2.ParamByName('pmt_kmroda').AsFloat := ( StrToFloat( RmCharValor( edKmMnt.Text )) - qDel3.FieldByName('piv_kminst').AsFloat );
  qDel2.ParamByName('pmt_codfnd').Text    := edCodFndMnt.Text ;
  qDel2.ParamByName('pmt_UsuInc').Text    :=  sysUsuario ;
  qDel2.ParamByName('pmt_DatInc').AsDate  := now ;
  qDel2.ParamByName('pmt_HorInc').Text    := TimeToStr(time) ;
  qDel2.ExecSQL;

                  // Módulo de Pagamento
                      // Gerando contas a Pagar  - Cabeçalho
                      cDescri := cmbEveMnt.Text+' PNEU '+edMFogoMnt.Text+' - '+edPlaca.Text;
                      qDel2.Connection := dmEmp.SqlConSis;
                      qDel2.Close;
                      qDel2.SQL.Text   := 'Insert Into '+U_funcao.SelSchema('financecab')+
                                                      '( cfr_NumDoc, cfr_codant, cfr_codfnd, cfr_codpct, '+
                                                      '  cfr_descri, cfr_DatEms, cfr_DatVen, cfr_TotPar, cfr_TipDoc,  '+
                                                      '  cfr_vlrApg, cfr_vlrDes, cfr_vlrAcr, cfr_vlrTot, cfr_UsuInc, cfr_DatInc, cfr_HorInc ) Values  '+
                                                     '( :cfr_NumDoc, :cfr_codant, :cfr_codfnd, :cfr_codpct, '+
                                                      ' :cfr_descri, :cfr_DatEms, :cfr_DatVen, :cfr_TotPar, :cfr_TipDoc,  '+
                                                      ' :cfr_vlrApg, :cfr_vlrDes, :cfr_vlrAcr, :cfr_vlrTot, :cfr_UsuInc, :cfr_DatInc, :cfr_HorInc ) ';
                      qDel2.ParamByName('cfr_NumDoc').Text     := edMFogoMnt.Text ;
                      qDel2.ParamByName('cfr_codant').Text     := qDel3.FieldByName('piv_codigo').Text;
                      qDel2.ParamByName('cfr_codfnd').Text     := edCodFndMnt.Text ;
                      qDel2.ParamByName('cfr_codpct').Text     := CodPct ;
                      qDel2.ParamByName('cfr_descri').Text     := cDescri;
                      qDel2.ParamByName('cfr_DatEms').AsDate   := now;
                      qDel2.ParamByName('cfr_DatVen').AsDate   := now;
                      qDel2.ParamByName('cfr_TotPar').Text     := '1';
                      qDel2.ParamByName('cfr_TipDoc').Text     := 'D';
                      qDel2.ParamByName('cfr_vlrApg').Text     := RmCharValor( edVlrMnt.Text );
                      qDel2.ParamByName('cfr_vlrDes').Text     := '0';
                      qDel2.ParamByName('cfr_vlrAcr').Text     := '0';
                      qDel2.ParamByName('cfr_vlrTot').Text     := RmCharValor( edVlrMnt.Text );
                      qDel2.ParamByName('cfr_UsuInc').Text     :=  sysUsuario;
                      qDel2.ParamByName('cfr_DatInc').AsDate   := Now;
                      qDel2.ParamByName('cfr_HorInc').Text     := TimeToStr(Now);
                      qDel2.ExecSQL;
                      cNumAnt  := PegaUltCodSalvo( 'financecab', 'cfr_codigo', 'cfr_' );

                      qDel2.Connection := dmEmp.SqlConSis;
                      qDel2.Close;
                      qDel2.SQL.Text   := 'Insert Into '+U_funcao.SelSchema('financeiro')+
                                                      '( fcr_descri,  fcr_DatVen,  fcr_NumPar,  fcr_Status,  fcr_tippro,  fcr_codcfr, '+
                                                      '  fcr_vlrApg,  fcr_NumBol,  fcr_UsuInc,  fcr_DatInc,  fcr_HorInc ) Values  '+
                                                     '( :fcr_descri, :fcr_DatVen, :fcr_NumPar, :fcr_Status, :fcr_tippro, :fcr_codcfr, '+
                                                      ' :fcr_vlrApg, :fcr_NumBol,  :fcr_UsuInc, :fcr_DatInc, :fcr_HorInc ) ';
                      qDel2.ParamByName('fcr_descri').Text     := '[Pc 1/1] '+cDescri ;
                      qDel2.ParamByName('fcr_DatVen').AsDate   := now;
                      qDel2.ParamByName('fcr_NumPar').Text     := IntToStr(i);
                      qDel2.ParamByName('fcr_Status').Text     := 'CXA';
                      qDel2.ParamByName('fcr_tippro').Text     := 'LAN';
                      qDel2.ParamByName('fcr_codcfr').Text     := cNumAnt;
                      qDel2.ParamByName('fcr_vlrApg').Text     := RmCharValor( edVlrMnt.Text );
                      qDel2.ParamByName('fcr_NumBol').Text     := edMFogoMnt.Text    ;
                      qDel2.ParamByName('fcr_UsuInc').Text     :=  sysUsuario;
                      qDel2.ParamByName('fcr_DatInc').AsDate   := Now;
                      qDel2.ParamByName('fcr_HorInc').Text     := TimeToStr(Now);
                      qDel2.ExecSQL;


  Auditor( Screen.FocusedForm.Caption, 'MANUT PNEU ','CD FOGO: '+edMFogoMnt.Text );

  FimTransacao;
  inittelas(0,False);
  atualizagrids;
  esqueleto2;
  grbPneus.Refresh;
  FreeAndNil(qDel1);
  FreeAndNil(qDel2);
  FreeAndNil(qDel3);

  ShowMessage('Processo Realizado Com Sucesso!');

end;

procedure TfrmPneuMnt.Button5Click(Sender: TObject);
Var
  qDel1, qDel2: TFDQuery;
  cCodTnq, cNumAnt, evento, objeto : String;
begin
  evento := 'SUCATA';
  objeto := '';
  IniTransacao;

  // Atualiza Km do Veiciulo
  qDel2 := TFDQuery.Create(Self);
  qDel1 := TFDQuery.Create(Self);
  qDel1.Connection  := dmEmp.SqlConSis;
  qDel1.Close;
  qDel1.SQl.Text    :='UPDATE '+U_funcao.SelSchema('pneuive')+' Set piv_status = '+QuotedStr(evento)
                    +', piv_situac = '+QuotedStr(cmbEveSuc.Text)
                    +', piv_kmmant = '+RmCharValor( edKmSct.Text )
                    +' WHERE piv_mfogo = :fogo ';
  qDel1.ParamByName('fogo').Text        := edSFogoMnt.Text;
  qDel1.ExecSQL;

  // Pegar Codigo do pneu iventario
  qDel2.Connection  := dmEmp.SqlConSis;
  qDel2.Close;
  qDel2.SQl.Text    :='Select * From '+U_funcao.SelSchema('pneuive')
                    +' WHERE piv_mfogo = :fogo ';
  qDel2.ParamByName('fogo').Text        := edSFogoMnt.Text;
  qDel2.open;

  // Grava a Movimentação da Compra
  qDel1.Connection  := dmEmp.SqlConSis;
  qDel1.Close;
  qDel1.SQl.Text   :='insert into '+U_funcao.SelSchema('pneumnt')
                                  +' ( pmt_codpiv, pmt_DatEve, pmt_HorEve, pmt_mfogo,    pmt_codplc, pmt_evento, ' //
                                  +'   pmt_objeto, pmt_posic,  pmt_vlrcst,  pmt_kmrodiz, pmt_kmatual,  '
                                  +'   pmt_libras, pmt_mlmsc1, pmt_mlmsc2,  pmt_mlmsc3,  pmt_mlmsc4,    '
                                  +'   pmt_mlmsc5, pmt_mlmsc6, pmt_mrvida,  pmt_kmvida,  pmt_kmroda,   ' //pmt_codfnd,
                                  +'   pmt_UsuInc, pmt_DatInc, pmt_HorInc ) values '
                                  +' ( :pmt_codpiv, :pmt_DatEve, :pmt_HorEve, :pmt_mfogo,   :pmt_codplc,  :pmt_evento, ' // :
                                  +'   :pmt_objeto, :pmt_posic,  :pmt_vlrcst, :pmt_kmrodiz, :pmt_kmatual,  '
                                  +'   :pmt_libras, :pmt_mlmsc1, :pmt_mlmsc2, :pmt_mlmsc3,  :pmt_mlmsc4,   '
                                  +'   :pmt_mlmsc5, :pmt_mlmsc6, :pmt_mrvida, :pmt_kmvida,  :pmt_kmroda,   ' //:pmt_codfnd,
                                  +'   :pmt_UsuInc, :pmt_DatInc, :pmt_HorInc ) ';
  qDel1.ParamByName('pmt_codpiv').Text    := cCodpiv;
  qDel1.ParamByName('pmt_DatEve').AsDate  := now ;
  qDel1.ParamByName('pmt_HorEve').Text    := TimeToStr(time) ;
  qDel1.ParamByName('pmt_mfogo').Text     := edSFogoMnt.Text  ;
  qDel1.ParamByName('pmt_codplc').Text    := cPlacaAnt ;
  qDel1.ParamByName('pmt_evento').Text    := evento;
  qDel1.ParamByName('pmt_objeto').Text    := cmbEveSuc.Text ;
  qDel1.ParamByName('pmt_posic').Text     := cLocaliza  ;
  qDel1.ParamByName('pmt_vlrcst').AsFloat := 0   ;
  qDel1.ParamByName('pmt_kmrodiz').Text   := qDel2.FieldByName('piv_kmrodi').Text;
  qDel1.ParamByName('pmt_kmatual').Text   := RmCharValor( edKmSct.Text );
  qDel1.ParamByName('pmt_libras').Text    := '0';
  qDel1.ParamByName('pmt_mlmsc1').Text    := edSctIncSulc1.Text;
  qDel1.ParamByName('pmt_mlmsc2').Text    := edSctIncSulc1.Text;
  qDel1.ParamByName('pmt_mlmsc3').Text    := edSctIncSulc1.Text;
  qDel1.ParamByName('pmt_mlmsc4').Text    := edSctIncSulc1.Text;
  qDel1.ParamByName('pmt_mlmsc5').Text    := edSctIncSulc1.Text;
  qDel1.ParamByName('pmt_mlmsc6').Text    := edSctIncSulc1.Text;
  qDel1.ParamByName('pmt_mrvida').Text    := qDel2.FieldByName('piv_nrvida').Text;
  qDel1.ParamByName('pmt_kmvida').Text    := '0';
  qDel1.ParamByName('pmt_kmroda').AsFloat := ( StrToFloat( RmCharValor( edKmSct.Text )) - qDel2.FieldByName('piv_kminst').AsFloat );
  //qDel1.ParamByName('pmt_codfnd').Text    := pcp_codfnd.Text ;
  qDel1.ParamByName('pmt_UsuInc').Text    :=  sysUsuario ;
  qDel1.ParamByName('pmt_DatInc').AsDate  := now ;
  qDel1.ParamByName('pmt_HorInc').Text    := TimeToStr(time) ;
  qDel1.ExecSQL;

  Auditor( Screen.FocusedForm.Caption, 'SUCATA PNEU ','CD FOGO: '+edSFogoMnt.Text );

  FimTransacao;
  inittelas(0,False);
  atualizagrids;
  esqueleto2;
  grbPneus.Refresh;
  FreeAndNil(qDel1);
  FreeAndNil(qDel2);

  ShowMessage('Sucateado Com Sucesso');

end;

procedure TfrmPneuMnt.cmbEveMntChange(Sender: TObject);
begin
if cmbEveMnt.ItemIndex = 0 then begin
   {}
end;

end;

procedure TfrmPneuMnt.dbgEstoqueCellClick(Column: TColumn);
begin
   if not dbgEstoque.DataSource.DataSet.Eof then begin
      dbgEstoque.BeginDrag(true);
      dbgEstoqueDblClick(Self);
    end;

end;

procedure TfrmPneuMnt.dbgEstoqueDblClick(Sender: TObject);
Var
qDel : TFDQuery;
begin

   // Pegar os dados do Pneu
   qDel := TFDQuery.Create(Nil);
   qDel.Connection  := dmEmp.SqlConSis;
   qDel.Close;
   qDel.SQl.Text   :='select * from '+U_funcao.SelSchema('pneuive')
                     +' left join '+U_funcao.SelSchema('pneumod')+' on pmd_codigo = piv_codpmd '
                     +' left join '+U_funcao.SelSchema('pneudim')+' on pdm_codigo = pmd_codpdm '
                     +' left join '+U_funcao.SelSchema('pneufab')+' on pfb_codigo = pmd_codpfb '
                     +' left join '+U_funcao.SelSchema('veiculoatv')+' on vat_placa = piv_codplc '
                     +' where piv_mfogo = '+QuotedStr( dbgEstoque.DataSource.DataSet.FieldByName('piv_mfogo').Text );
   qDel.Open;

  // Pegar informaççoes sobre os pneus
  edFogo.Text     := qDel.FieldByName('piv_mfogo').Text;
  edVida.Text     := qDel.FieldByName('piv_nrvida').Text;
  edModPne.Text   := qDel.FieldByName('pmd_nome').Text;
  edDimen.Text    := qDel.FieldByName('pdm_nome').Text;
  edFabric.Text   := qDel.FieldByName('pfb_nome').Text;
  edSituac.Text   := qDel.FieldByName('piv_status').Text  ;
  edSulco1.Text := qDel.FieldByName('piv_mlmsc1').Text  ;
  edSulco2.Text := qDel.FieldByName('piv_mlmsc2').Text  ;
  edSulco3.Text := qDel.FieldByName('piv_mlmsc3').Text  ;
  edSulco4.Text := qDel.FieldByName('piv_mlmsc4').Text  ;
  edSulco5.Text := qDel.FieldByName('piv_mlmsc5').Text  ;
  edSulco6.Text := qDel.FieldByName('piv_mlmsc6').Text  ;

  edPosic.Text    := PgLocalPne( qDel.FieldByName('piv_locpne').Text );
  edObjeto.Text   := qDel.FieldByName('piv_situac').Text  ;
  if qDel.FieldByName('piv_kmrodi').Text = '' then begin
     edKmRodiz.Text  := FormatCurr('Km #,###,##0', 0 ) ;
     edKmInstal.Text  := FormatCurr('Km #,###,##0', 0 ) ;
     edKmRoda.Text    := FormatCurr('Km #,###,##0', 0 ) ;
  End Else Begin
     edKmRodiz.Text  := FormatCurr('Km #,###,##0',StrToFloat( qDel.FieldByName('piv_kmrodi').Text ) ) ;
     edKmInstal.Text  := FormatCurr('Km #,###,##0',StrToFloat( qDel.FieldByName('piv_kmmant').Text ) ) ;
     edKmRoda.Text    := FormatCurr('Km #,###,##0', ( qDel.FieldByName('vat_kmatu').AsFloat - qDel.FieldByName('piv_kmmant').AsFloat ) ) ;
  End;
  ativabtn;
  FreeAndNil(qDel);


end;

procedure TfrmPneuMnt.dbgEstoqueDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
Var
  qDel, qDel1: TFDQuery;
  evento, objeto : string;
begin
   if TDBGrid(Sender).Name <> TDBGrid(Source).Name then
      Accept := ( ( Source IS Timage ) or ( Source IS TDBGrid )  )
end;

procedure TfrmPneuMnt.dbgEstoqueDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    if gdFocused in State then  begin
      dbgEstoque.Canvas.Brush.Color  := Azul_Escuro;
      dbgEstoque.Canvas.Font.Color   := Branco;
      dbgEstoque.Canvas.FillRect(Rect);
      dbgEstoque.DefaultDrawDataCell(Rect, Column.Field, State);
    end else begin

        if Odd(dbgEstoque.DataSource.DataSet.RecNo) then begin
          dbgEstoque.Canvas.Brush.Color  := Branco;
          dbgEstoque.Canvas.Font.Color   := Preto;
          dbgEstoque.Canvas.FillRect(Rect);
          dbgEstoque.DefaultDrawDataCell(Rect, Column.Field, State);

        End else Begin
          dbgEstoque.Canvas.Brush.Color  := Cinza_Sintilante;
          dbgEstoque.Canvas.Font.Color   := Preto;
          dbgEstoque.Canvas.FillRect(Rect);
          dbgEstoque.DefaultDrawDataCell(Rect, Column.Field, State);
        End;

    end;

end;

procedure TfrmPneuMnt.dbgEstoqueEndDrag(Sender, Target: TObject; X, Y: Integer);
Var
cVd : string ;
begin
  {
   Ideia de posicionamento dos pneus

  B 1 D E D
  | | | | |____ Direita ou Esquerda
  | | | |______ Interno / Meio / externo
  | | |________ Dianteiro ou Trazeiro / Step
  | |__________ Eixo
  |____________ Boleia ou carroceria

  }


  if (Target IS Timage) and

     BuscaPneuInstalado(TImage(Sender).Name, edPlaca.Text, lCarroc) then begin
     inittelas(0,True);
     edInstFogo.Text    := TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_mfogo').Value ;
     cLocaliza          := PneuLocalizador(TImage(Target).Name, lCarroc) ;
     edLocInstPneu.Text := PgLocalPne(cLocaliza) ;
     edIncSulc1.Text := TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_mlmsc1').Value ;
     edIncSulc2.Text := TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_mlmsc2').Value ;
     edIncSulc3.Text := TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_mlmsc3').Value ;
     edIncSulc4.Text := TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_mlmsc4').Value ;
     edIncSulc5.Text := TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_mlmsc5').Value ;
     edIncSulc6.Text := TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_mlmsc6').Value ;
     cVd := Trim( TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_nrvida').Value ) ;
     //Self.FindComponent('piv_kmvda'+cVd) as TMaskEdit ).Text

     if ( cLocaliza = TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_locpne').Value ) and
        ( TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_kmvda'+cVd).AsFloat > 0  ) then begin
        edInsKmRdo.Text := FormatCurr('Km #,###,##0',
                          fIIF( TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_kmrodi').Text <> '', TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_kmrodi').Value, 0 ) );
        edInsKmRdo.Enabled := False;
     end else begin
        edInsKmRdo.Enabled := True;
     end;
     Pgopcao.Refresh;
     edDatinst.SetFocus;
     dbgEstoqueDblClick(Self);

  End Else
    if ( (Target IS TDBGrid) and ( LowerCase( TDBGrid(Target).Name ) = 'dbgmanutec' ) )  Then Begin

    if TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_codplc').Text = ''  then begin
       ShowMessage('Pneu não usado! '+#13+#13+'Não é permitido colocar em manutenção '+#13+'pneus novos');
       inittelas(0,False);
       Exit
    end;

     inittelas(2,True);
     edMFogoMnt.Text    := TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_mfogo').Value ;
     cLocaliza          := TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_locpne').Value ;
     EdLocalMnt.Text    := PgLocalPne(cLocaliza) ;
     edMntIncSulc1.Text := TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_mlmsc1').Value ;
     edMntIncSulc2.Text := TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_mlmsc2').Value ;
     edMntIncSulc3.Text := TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_mlmsc3').Value ;
     edMntIncSulc4.Text := TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_mlmsc4').Value ;
     edMntIncSulc5.Text := TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_mlmsc5').Value ;
     edMntIncSulc6.Text := TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_mlmsc6').Value ;
     edVlrMnt.Text      := FormatCurr('R$ ###,##0.00',0);
     edKmMnt.Text       := FormatCurr('Km #,###,##0', StrToFloat(TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_kmmant').Value ));
     edKmMnt.Enabled    := False;
     edDataMnt.SetFocus;

     dbgEstoqueDblClick(Self)


  End Else
    if ( (Target IS TDBGrid) and ( LowerCase( TDBGrid(Target).Name ) = 'dbgsucata' ) )  Then Begin
     if Not TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_codplc').IsNull then begin

         inittelas(3,True);
         edSFogoMnt.Text    := TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_mfogo').Value ;
         cLocaliza          := TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_locpne').Value ;
         EdLocalSct.Text    := PgLocalPne(cLocaliza) ;
         edDatSuc.date      := Now;
         EdHorSct.Text      := '0000';
         edSctIncSulc1.Text := TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_mlmsc1').Value ;
         edSctIncSulc2.Text := TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_mlmsc2').Value ;
         edSctIncSulc3.Text := TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_mlmsc3').Value ;
         edSctIncSulc4.Text := TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_mlmsc4').Value ;
         edSctIncSulc5.Text := TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_mlmsc5').Value ;
         edSctIncSulc6.Text := TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_mlmsc6').Value ;
         edKmSct.Text       := FormatCurr('Km #,###,##0', StrToFloat(TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_mlmsc6').Value ));
         edKmSct.SetFocus ;

     end;

  End;


end;

procedure TfrmPneuMnt.dbgManutecCellClick(Column: TColumn);
begin
   if not dbgManutec.DataSource.DataSet.Eof then
      dbgManutec.BeginDrag(true);

end;

procedure TfrmPneuMnt.dbgManutecDblClick(Sender: TObject);
Var
qDel : TFDQuery;
begin

   // Pegar os dados do Pneu
   qDel := TFDQuery.Create(Nil);
   qDel.Connection  := dmEmp.SqlConSis;
   qDel.Close;
   qDel.SQl.Text   :='select * from '+U_funcao.SelSchema('pneuive')
                     +' left join '+U_funcao.SelSchema('pneumod')+' on pmd_codigo = piv_codpmd '
                     +' left join '+U_funcao.SelSchema('pneudim')+' on pdm_codigo = pmd_codpdm '
                     +' left join '+U_funcao.SelSchema('pneufab')+' on pfb_codigo = pmd_codpfb '
                     +' where piv_mfogo = '+QuotedStr( dbgManutec.DataSource.DataSet.FieldByName('piv_mfogo').Text );
   qDel.Open;

  // Pegar informaççoes sobre os pneus
  edFogo.Text     := qDel.FieldByName('piv_mfogo').Text;
  edVida.Text     := qDel.FieldByName('piv_nrvida').Text;
  edModPne.Text   := qDel.FieldByName('pmd_nome').Text;
  edDimen.Text    := qDel.FieldByName('pdm_nome').Text;
  edFabric.Text   := qDel.FieldByName('pfb_nome').Text;
  edSituac.Text   := qDel.FieldByName('piv_status').Text  ;
  edSulco1.Text := qDel.FieldByName('piv_mlmsc1').Text  ;
  edSulco2.Text := qDel.FieldByName('piv_mlmsc2').Text  ;
  edSulco3.Text := qDel.FieldByName('piv_mlmsc3').Text  ;
  edSulco4.Text := qDel.FieldByName('piv_mlmsc4').Text  ;
  edSulco5.Text := qDel.FieldByName('piv_mlmsc5').Text  ;
  edSulco6.Text := qDel.FieldByName('piv_mlmsc6').Text  ;

  edPosic.Text    := PgLocalPne( qDel.FieldByName('piv_locpne').Text );
  edObjeto.Text   := qDel.FieldByName('piv_situac').Text  ;
  if qDel.FieldByName('piv_kmrodi').Text = '' then begin
     edKmRodiz.Text  := FormatCurr('Km #,###,##0', 0 ) ;
  End Else Begin
     edKmRodiz.Text  := FormatCurr('Km #,###,##0',StrToFloat( qDel.FieldByName('piv_kmrodi').Text ) ) ;
  End;
  ativabtn;
  FreeAndNil(qDel);


end;

procedure TfrmPneuMnt.dbgManutecDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
   Accept := ( ( Source IS TDBGrid ) and ( TDBGrid(Sender).Name <> TDBGrid(Source).Name ) )
end;

procedure TfrmPneuMnt.dbgManutecDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    if gdFocused in State then  begin
      dbgManutec.Canvas.Brush.Color  := Azul_Escuro;
      dbgManutec.Canvas.Font.Color   := Branco;
      dbgManutec.Canvas.FillRect(Rect);
      dbgManutec.DefaultDrawDataCell(Rect, Column.Field, State);
    end else begin

        if Odd(dbgManutec.DataSource.DataSet.RecNo) then begin
          dbgManutec.Canvas.Brush.Color  := Branco;
          dbgManutec.Canvas.Font.Color   := Preto;
          dbgManutec.Canvas.FillRect(Rect);
          dbgManutec.DefaultDrawDataCell(Rect, Column.Field, State);

        End else Begin
          dbgManutec.Canvas.Brush.Color  := Cinza_Sintilante;
          dbgManutec.Canvas.Font.Color   := Preto;
          dbgManutec.Canvas.FillRect(Rect);
          dbgManutec.DefaultDrawDataCell(Rect, Column.Field, State);
        End;

    end;

end;

procedure TfrmPneuMnt.dbgManutecEndDrag(Sender, Target: TObject; X, Y: Integer);
Var
qDel: TFDQuery;
begin
    if ( (Target IS TDBGrid) and ( LowerCase( TDBGrid(Target).Name ) = 'dbgsucata' ) )  Then Begin
     if Not TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_codplc').IsNull then begin

         inittelas(3,True);
         edSFogoMnt.Text    := TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_mfogo').Value ;
         cLocaliza          := TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_locpne').Value ;
         EdLocalSct.Text    := PgLocalPne(cLocaliza) ;
         edDatSuc.date      := Now;
         EdHorSct.Text      := '0000';
         edSctIncSulc1.Text := TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_mlmsc1').Value ;
         edSctIncSulc2.Text := TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_mlmsc2').Value ;
         edSctIncSulc3.Text := TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_mlmsc3').Value ;
         edSctIncSulc4.Text := TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_mlmsc4').Value ;
         edSctIncSulc5.Text := TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_mlmsc5').Value ;
         edSctIncSulc6.Text := TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_mlmsc6').Value ;
         edKmSct.Text       := FormatCurr('Km #,###,##0', StrToFloat(TDBGrid( Sender ).DataSource.DataSet.FieldByName('piv_mlmsc6').Value ));
         edKmSct.SetFocus ;

         inittelas(1,True);
         edDesInstFogo.Text     := BuscaMarcaFogo( TImage(Sender).Name, edPlaca.Text, lCarroc );
         cLocaliza              := PneuLocalizador(TImage(Sender).Name, lCarroc) ;
         edLocDesInstPneu.Text  := PgLocalPne(cLocaliza) ;

     end;
    End Else
      if ( (Target IS TDBGrid) and ( LowerCase( TDBGrid(Target).Name ) = 'dbgestoque' ) )  Then Begin

           // Pegar os dados do Pneu
           inittelas(1,True);
           tabDesinstalar.Caption     := 'Devolução Iventário';

           qDel := TFDQuery.Create(Nil);
           qDel.Connection  := dmEmp.SqlConSis;
           qDel.Close;
           qDel.SQl.Text   :='select * from '+U_funcao.SelSchema('pneuive')
                             +' where piv_codplc = '+QuotedStr( TDBGrid(sender).DataSource.DataSet.FieldByName('piv_codplc').Text )
                             +' and   piv_locpne = '+QuotedStr( TDBGrid(sender).DataSource.DataSet.FieldByName('piv_locpne').Text )
                             +' and   piv_status = '+QuotedStr('MANUTENCAO')+' ';
           qDel.Open;

           edDesIncSulc1.Text         := qDel.FieldByName('piv_mlmsc1').value ;
           edDesIncSulc2.Text         := qDel.FieldByName('piv_mlmsc2').value ;
           edDesIncSulc3.Text         := qDel.FieldByName('piv_mlmsc3').value ;
           edDesIncSulc4.Text         := qDel.FieldByName('piv_mlmsc4').value ;
           edDesIncSulc5.Text         := qDel.FieldByName('piv_mlmsc5').value ;
           edDesIncSulc6.Text         := qDel.FieldByName('piv_mlmsc6').value ;
           edDesInsKmAtual.Text       := FormatCurr('Km #,###,##0',qDel.FieldByName('piv_kmmant').AsFloat ) ;
           edDesInstFogo.Text         := TDBGrid(sender).DataSource.DataSet.FieldByName('piv_mfogo').Text ;
           cLocaliza                  := TDBGrid(sender).DataSource.DataSet.FieldByName('piv_locpne').Text ;
           edLocDesInstPneu.Text      := PgLocalPne(cLocaliza) ;
           edDatDesinst.SetFocus;
           edDesInsKmAtual.Enabled    := False;
           edDesInsCalib.Enabled      := True;
           dbgManutecDblClick(Self);

          FreeAndNil(qDel);
      End;



end;

procedure TfrmPneuMnt.DBGrid2DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
Accept := (Source is TImage);
ShowMessage('Oficina');
end;

procedure TfrmPneuMnt.DBGrid3DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
Accept := (Source is TImage);
ShowMessage('Sucata');
end;

procedure TfrmPneuMnt.dbgSucataCellClick(Column: TColumn);
begin
   if not dbgSucata.DataSource.DataSet.Eof then
      dbgSucata.BeginDrag(true);

end;

procedure TfrmPneuMnt.dbgSucataDblClick(Sender: TObject);
Var
qDel : TFDQuery;
begin

   // Pegar os dados do Pneu
   qDel := TFDQuery.Create(Nil);
   qDel.Connection  := dmEmp.SqlConSis;
   qDel.Close;
   qDel.SQl.Text   :='select * from '+U_funcao.SelSchema('pneuive')
                     +' left join '+U_funcao.SelSchema('pneumod')+' on pmd_codigo = piv_codpmd '
                     +' left join '+U_funcao.SelSchema('pneudim')+' on pdm_codigo = pmd_codpdm '
                     +' left join '+U_funcao.SelSchema('pneufab')+' on pfb_codigo = pmd_codpfb '
                     +' where piv_mfogo = '+QuotedStr( dbgSucata.DataSource.DataSet.FieldByName('piv_mfogo').Text );
   qDel.Open;

  // Pegar informaççoes sobre os pneus
  edFogo.Text     := qDel.FieldByName('piv_mfogo').Text;
  edVida.Text     := qDel.FieldByName('piv_nrvida').Text;
  edModPne.Text   := qDel.FieldByName('pmd_nome').Text;
  edDimen.Text    := qDel.FieldByName('pdm_nome').Text;
  edFabric.Text   := qDel.FieldByName('pfb_nome').Text;
  edSituac.Text   := qDel.FieldByName('piv_status').Text  ;
  edSulco1.Text := qDel.FieldByName('piv_mlmsc1').Text  ;
  edSulco2.Text := qDel.FieldByName('piv_mlmsc2').Text  ;
  edSulco3.Text := qDel.FieldByName('piv_mlmsc3').Text  ;
  edSulco4.Text := qDel.FieldByName('piv_mlmsc4').Text  ;
  edSulco5.Text := qDel.FieldByName('piv_mlmsc5').Text  ;
  edSulco6.Text := qDel.FieldByName('piv_mlmsc6').Text  ;

  edPosic.Text    := PgLocalPne( qDel.FieldByName('piv_locpne').Text );
  edObjeto.Text   := qDel.FieldByName('piv_situac').Text  ;
  if qDel.FieldByName('piv_kmrodi').Text = '' then begin
     edKmRodiz.Text  := FormatCurr('Km #,###,##0', 0 ) ;
  End Else Begin
     edKmRodiz.Text  := FormatCurr('Km #,###,##0',StrToFloat( qDel.FieldByName('piv_kmrodi').Text ) ) ;
  End;
  ativabtn;

  FreeAndNil(qDel);

end;

procedure TfrmPneuMnt.dbgSucataDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
   Accept := ( ( Source IS TDBGrid ) and
               ( TDBGrid(Sender).Name <> TDBGrid(Source).Name ) and
               ( Not TDBGrid(Source).DataSource.DataSet.FieldByName('piv_codplc').IsNull ) ) ;
   if Accept then begin
       cPlacaAnt := TDBGrid(Source).DataSource.DataSet.FieldByName('piv_codplc').Value ;
       cNumVida  := TDBGrid(Source).DataSource.DataSet.FieldByName('piv_nrvida').Value ;
       cCodpiv   := TDBGrid(Source).DataSource.DataSet.FieldByName('piv_codigo').Value ;
   end;
end;

procedure TfrmPneuMnt.dbgSucataDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    if gdFocused in State then  begin
      dbgSucata.Canvas.Brush.Color  := Azul_Escuro;
      dbgSucata.Canvas.Font.Color   := Branco;
      dbgSucata.Canvas.FillRect(Rect);
      dbgSucata.DefaultDrawDataCell(Rect, Column.Field, State);
    end else begin

        if Odd(dbgSucata.DataSource.DataSet.RecNo) then begin
          dbgSucata.Canvas.Brush.Color  := Branco;
          dbgSucata.Canvas.Font.Color   := Preto;
          dbgSucata.Canvas.FillRect(Rect);
          dbgSucata.DefaultDrawDataCell(Rect, Column.Field, State);

        End else Begin
          dbgSucata.Canvas.Brush.Color  := Cinza_Sintilante;
          dbgSucata.Canvas.Font.Color   := Preto;
          dbgSucata.Canvas.FillRect(Rect);
          dbgSucata.DefaultDrawDataCell(Rect, Column.Field, State);
        End;

    end;

end;

procedure TfrmPneuMnt.edCodFndMntExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlfornecedor ;
  edNomFnd.Text      :=  Pesquisa.Relacao('fornecedor',edCodFndMnt,'fnd_codigo','fnd_nome')  ;
  CodPct             :=  Pesquisa.Relacao('fornecedor',edCodFndMnt,'fnd_codigo','fnd_codpct')    ;
  FreeAndNil(Pesquisa);

end;

procedure TfrmPneuMnt.edCodFndMntKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      edCodFndMntRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmPneuMnt.edCodFndMntRightButtonClick(Sender: TObject);
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
  Pesquisa.AddReg('fnd_codigo','Código'             ,'edCodFndMnt' ,5  ,'por Código' );
  Pesquisa.AddReg('fnd_nome'  ,'Fornecedor'         ,'edNomFnd'   ,25 ,'por compracmb' );


  Pesquisa.acessa(edCodFndMnt);
  edCodFndMnt.text  :=  Pesquisa.RecReg('fnd_codigo');
  edNomFnd.text     :=  Pesquisa.RecReg('fnd_nome');
  FreeAndNil(Pesquisa);

 end;
procedure TfrmPneuMnt.edDesInsKmAtualExit(Sender: TObject);
begin
  If ChkKmVeiculo(edDesInsKmAtual.Text, edPlaca.Text) Then Begin
     ShowMessage('Km Inferior a atual do veiculo');
     edDesInsKmAtual.SetFocus;
  End;
end;

procedure TfrmPneuMnt.edDesInsKmAtualKeyPress(Sender: TObject; var Key: Char);
begin
  KeyKm( TMaskEdit( Sender ) , Key );
end;

procedure TfrmPneuMnt.edHorDesInsExit(Sender: TObject);
begin
ChkHora( Sender );
end;

procedure TfrmPneuMnt.edHorInsExit(Sender: TObject);
begin
ChkHora( Sender );
end;

procedure TfrmPneuMnt.edHorMetExit(Sender: TObject);
begin
ChkHora( Sender );
end;

procedure TfrmPneuMnt.edHorMntExit(Sender: TObject);
begin
ChkHora( Sender );
end;

procedure TfrmPneuMnt.EdHorSctExit(Sender: TObject);
begin
ChkHora( Sender );
end;

procedure TfrmPneuMnt.edInsKmAtualExit(Sender: TObject);
begin
  If ChkKmVeiculo(edInsKmAtual.Text, edPlaca.Text) Then Begin
     ShowMessage('Km Inferior a atual do veiculo');
     edInsKmAtual.SetFocus;
  End;
end;

procedure TfrmPneuMnt.edInsKmAtualKeyPress(Sender: TObject; var Key: Char);
begin
  KeyKm( TMaskEdit( Sender ) , Key );
end;

procedure TfrmPneuMnt.edInsKmRdoKeyPress(Sender: TObject; var Key: Char);
begin
  KeyKm( TMaskEdit( Sender ) , Key );
end;

procedure TfrmPneuMnt.edKmMetrKeyPress(Sender: TObject; var Key: Char);
begin
  KeyKm( TMaskEdit( Sender ) , Key );
end;

procedure TfrmPneuMnt.edKmMntKeyPress(Sender: TObject; var Key: Char);
begin
  KeyKm( TMaskEdit( Sender ) , Key );
end;

procedure TfrmPneuMnt.edKmRdoAtuaKeyPress(Sender: TObject; var Key: Char);
begin
  KeyKm( TMaskEdit( Sender ) , Key );
end;

procedure TfrmPneuMnt.edKmRodNovKeyPress(Sender: TObject; var Key: Char);
begin
  KeyKm( TMaskEdit( Sender ), Key );
end;

procedure TfrmPneuMnt.edPlacaExit(Sender: TObject);
begin
  if edPlaca.Text <> '' then begin

      // Função que confirma os dados relacionados
      Pesquisa := TClasConsulta.Create;
      Pesquisa.sqlTabela  :=  dmEmp.sqlveiculoatv ;
      edNomMdl.Text       :=  Pesquisa.Relacao('veiculoatv',edPlaca,'vat_placa','mdl_nome'  );
      cCodTipo            :=  StrToInt( Pesquisa.Relacao('veiculoatv',edPlaca,'vat_placa','vat_codtip'  ) );
      edNomChas.Text      :=  Pesquisa.Relacao('veiculoatv',edPlaca,'vat_placa','vat_chassi'  );
      edAno.Text          :=  FormatCurr('####/####', StrToFloat( Pesquisa.Relacao('veiculoatv',edPlaca,'vat_placa','vat_anofbmd' ) ) );
      edNomPot.Text       :=  Pesquisa.Relacao('veiculoatv',edPlaca,'vat_placa','vat_potenc'  );
      edKmAtual.Text      :=  FormatCurr('Km #,###,##0', StrToFloat( Pesquisa.Relacao('veiculoatv',edPlaca,'vat_placa','vat_kmatu' ) ) );

      if cCodTipo > 0 then begin
         esqueleto2;
         grbPneus.Repaint;
      end;
      FreeAndNil(Pesquisa);
  end;

end;

procedure TfrmPneuMnt.edPlacaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      edPlacaRightButtonClick(Self);
  end;
Finally

End;
end;

procedure TfrmPneuMnt.edPlacaRightButtonClick(Sender: TObject);
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

  Pesquisa.acessa(edPlaca);
  edPlaca.text     :=  Pesquisa.RecReg('vat_placa');
  edNomMdl.text    :=  Pesquisa.RecReg('mdl_nome');
  FreeAndNil(Pesquisa);

end;

procedure TfrmPneuMnt.edVlrMntKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  MoedaKeyEdit( Key, edVlrMnt );
  Key := #0 ;

end;
procedure TfrmPneuMnt.esqueleto2;
Var
  i,x, z, y, c, v, nImg: Integer;
  Qtd, cCod : String;
  qDel, qDel1, qSql1 : TFDQuery;
begin
  if edPlaca.Text = '' then
     Exit;

  // Desabilitando imagens
  for I := 0 to Length(aImgeixo)-1 do begin
      TImage(aImgeixo[i]).Picture := Nil;
  end;
  for I := 0 to Length(aImgpneu)-1 do begin
      TImage(aImgpneu[i]).Picture := Nil;
  end;

  z     := 4;
  y     := 0;
  v     := 0;
  cCod  := IntToStr( cCodTipo );
  // Gerando a Movimentação do Estoque
  qDel1 := TFDQuery.Create(Self);
  qDel1.Connection  := dmEmp.SqlConSis;
  qDel1.Close;
  qDel1.SQl.Text   :='select * from '+U_funcao.SelSchema('tipo')+' where tip_codigo = :tipo ';
  qDel1.ParamByName('tipo').Text    := cCod ;
  qDel1.Open;

  // Checar eixo a eixo
  for I := 0 to ( StrToInt( qDel1.FieldByName('tip_teixo').Text ) )-1 do begin
      imgpneus.GetBitmap(1,TImage(aImgeixo[i]).Picture.Bitmap);

      // Verifica os pneus
      for x := y to (z-1) do begin
          v := (v +1);   // aDescpneu[0]
          c := -1;
          c := AnsiIndexText(pegapne(I,v), aDescpneu);
          //c :=  (pegapne(x,v), aImgpneu);
          if ((( LowerCase( qDel1.FieldByName('tip_trac').Text ) <> 'normal'  ) and
               ( UpperCase(copy(aImgpneu[c].name,5,1)) = 'E' ) and
                (I > 0)) or
               ( UpperCase(copy(aImgpneu[c].name,5,1)) = 'I' ) ) then
               imgpneus.GetBitmap(PneuInstal( aImgpneu[c].name, edPlaca.Text,qDel1 ),Timage(aImgpneu[c]).Picture.Bitmap);
      end;
      y := (x);
      z := (z+4 );
      v := 0;
  end;
  // verifica os steps
  If  StrToInt( qDel1.FieldByName('tip_step').Text ) >=1  Then
      imgpneus.GetBitmap(PneuInstal( 'step01', edPlaca.Text,qDel1 ),step01.Picture.Bitmap)
  Else
       ( step01.Picture := Nil ) ;

  If StrToInt( qDel1.FieldByName('tip_step').Text ) >=2 Then
     imgpneus.GetBitmap(PneuInstal( 'step02', edPlaca.Text,qDel1 ),step02.Picture.Bitmap)
  Else
  ( step02.Picture := Nil ) ;

  If  StrToInt( qDel1.FieldByName('tip_step').Text ) >=3 Then
      imgpneus.GetBitmap(PneuInstal( 'step03', edPlaca.Text,qDel1 ),step03.Picture.Bitmap)
  Else
      step03.Picture := Nil  ;

  If StrToInt( qDel1.FieldByName('tip_step').Text ) >=4 Then
     imgpneus.GetBitmap(PneuInstal( 'step04', edPlaca.Text,qDel1 ),step04.Picture.Bitmap)
  Else
     step04.Picture := Nil ;

  FreeAndNil(qDel);

end;
function TfrmPneuMnt.pegapne(x, Comp: integer): String;
Var cTexto: String;
begin
  case Comp of
   1: Result := 'pDirInt0'+IntToStr(x+1);
   2: Result := 'pEsqInt0'+IntToStr(x+1);
   3: Result := 'pdirext0'+IntToStr(x+1);
   4: Result := 'pEsqext0'+IntToStr(x+1);
  end;

end;

procedure TfrmPneuMnt.esqueleto;
Var
  i, nImg: Integer;
  Qtd, cCod : String;
  qDel, qDel1, qSql1 : TFDQuery;
begin

    if edPlaca.Text = '' then
       Exit;

    cCod  := IntToStr( cCodTipo );
    // Gerando a Movimentação do Estoque
    qDel1 := TFDQuery.Create(Self);
    qDel1.Connection  := dmEmp.SqlConSis;
    qDel1.Close;
    qDel1.SQl.Text   :='select * from '+U_funcao.SelSchema('tipo')+' where tip_codigo = :tipo ';
    qDel1.ParamByName('tipo').Text    := cCod ;
    qDel1.Open;

  // Checar a tração
  if StrToInt( qDel1.FieldByName('tip_teixo').Text ) >= 1 then Begin
     imgpneus.GetBitmap(1,eixo01.Picture.Bitmap);

     imgpneus.GetBitmap(PneuInstal( 'pDirInt01', edPlaca.Text,qDel1 ),pDirInt01.Picture.Bitmap);
     imgpneus.GetBitmap(PneuInstal( 'pEsqInt01', edPlaca.Text,qDel1 ),pEsqInt01.Picture.Bitmap);

     if chktipoveiculo( qDel1 ) and ( LowerCase( qDel1.FieldByName('tip_trac').Text ) <> 'normal'  ) then Begin
        imgpneus.GetBitmap(PneuInstal('pdirext01',edPlaca.Text, qDel1 ),pdirext01.Picture.Bitmap);
        imgpneus.GetBitmap(PneuInstal('pEsqext01',edPlaca.Text, qDel1 ),pEsqext01.Picture.Bitmap);
        lCarroc := True;
     End Else Begin
        pdirext01.Picture := Nil ;
        pEsqext01.Picture := Nil ;
        lCarroc := False;
     End;

  End Else Begin
      eixo01.Picture    := Nil ;
      pdirext01.Picture := Nil ;
      pEsqext01.Picture := Nil ;
      pdirInt01.Picture := Nil ;
      pEsqInt01.Picture := Nil ;
  End;

  if StrToInt( qDel1.FieldByName('tip_teixo').Text ) >= 2 then Begin
      imgpneus.GetBitmap(1,eixo02.Picture.Bitmap);
      imgpneus.GetBitmap(PneuInstal( 'pdirInt02', edPlaca.Text,qDel1 ),pdirInt02.Picture.Bitmap);
      imgpneus.GetBitmap(PneuInstal( 'pEsqInt02', edPlaca.Text,qDel1 ),pEsqInt02.Picture.Bitmap);

      if ( LowerCase( qDel1.FieldByName('tip_tipo').Text ) <> 'automóvel' ) and ( LowerCase( qDel1.FieldByName('tip_trac').Text ) <> 'normal' ) then Begin
          imgpneus.GetBitmap(PneuInstal( 'pdirext02', edPlaca.Text,qDel1 ),pdirext02.Picture.Bitmap);
          imgpneus.GetBitmap(PneuInstal( 'pEsqext02', edPlaca.Text,qDel1 ),pEsqext02.Picture.Bitmap);
          lCarroc := True;
       End ELse Begin
          pdirext02.Picture := Nil ;
          pEsqext02.Picture := Nil ;
          lCarroc := False;
      End;

  End Else Begin
      eixo02.Picture    := Nil ;
      pdirext02.Picture := Nil ;
      pEsqext02.Picture := Nil ;
      pdirInt02.Picture := Nil ;
      pEsqInt02.Picture := Nil ;
  End;

  if ( StrToInt( qDel1.FieldByName('tip_teixo').Text ) >= 3 ) and ( LowerCase( qDel1.FieldByName('tip_nome').Text ) <> 'automóvel' ) then Begin
      imgpneus.GetBitmap(1,eixo03.Picture.Bitmap);
      imgpneus.GetBitmap(PneuInstal( 'pdirInt03', edPlaca.Text,qDel1 ),pdirInt03.Picture.Bitmap);
      imgpneus.GetBitmap(PneuInstal( 'pEsqInt03', edPlaca.Text,qDel1 ),pEsqInt03.Picture.Bitmap);

      if ( LowerCase( qDel1.FieldByName('tip_trac').Text ) <> 'normal' ) then Begin
        imgpneus.GetBitmap(PneuInstal( 'pdirext03', edPlaca.Text,qDel1 ),pdirext03.Picture.Bitmap);
        imgpneus.GetBitmap(PneuInstal( 'pEsqext03', edPlaca.Text,qDel1 ),pEsqext03.Picture.Bitmap);
        lCarroc := True;
       End ELse Begin
        pdirext03.Picture := Nil ;
        pEsqext03.Picture := Nil ;
        lCarroc := False;
      End;

  End Else Begin
      eixo03.Picture    := Nil ;
      pdirext03.Picture := Nil ;
      pEsqext03.Picture := Nil ;
      pdirInt03.Picture := Nil ;
      pEsqInt03.Picture := Nil ;
  End;


  if ( StrToInt( qDel1.FieldByName('tip_teixo').Text ) >= 4 ) and ( LowerCase( qDel1.FieldByName('tip_nome').Text ) <> 'automóvel' ) then Begin
      imgpneus.GetBitmap(1,eixo04.Picture.Bitmap);
      imgpneus.GetBitmap(PneuInstal( 'pdirInt04', edPlaca.Text,qDel1 ),pdirInt04.Picture.Bitmap);
      imgpneus.GetBitmap(PneuInstal( 'pEsqInt04', edPlaca.Text,qDel1 ),pEsqInt04.Picture.Bitmap);

      if ( LowerCase( qDel1.FieldByName('tip_trac').Text ) <> 'normal' ) then Begin
        imgpneus.GetBitmap(PneuInstal( 'pdirext04', edPlaca.Text,qDel1 ),pdirext04.Picture.Bitmap);
        imgpneus.GetBitmap(PneuInstal( 'pEsqext04', edPlaca.Text,qDel1 ),pEsqext04.Picture.Bitmap);
          lCarroc := True;
       End ELse Begin
        pdirext04.Picture := Nil ;
        pEsqext04.Picture := Nil ;
          lCarroc := False;
      End;

  End Else Begin
      eixo04.Picture    := Nil ;
      pdirext04.Picture := Nil ;
      pEsqext04.Picture := Nil ;
      pdirInt04.Picture := Nil ;
      pEsqInt04.Picture := Nil ;
  End;

  if ( StrToInt( qDel1.FieldByName('tip_teixo').Text ) >= 5 ) and ( LowerCase( qDel1.FieldByName('tip_nome').Text ) <> 'automóvel' ) then Begin
      imgpneus.GetBitmap(1,eixo05.Picture.Bitmap);
      imgpneus.GetBitmap(PneuInstal( 'pdirInt05', edPlaca.Text,qDel1 ),pdirInt05.Picture.Bitmap);
      imgpneus.GetBitmap(PneuInstal( 'pEsqInt05', edPlaca.Text,qDel1 ),pEsqInt05.Picture.Bitmap);

      if ( LowerCase( qDel1.FieldByName('tip_trac').Text ) <> 'normal' ) then Begin
        imgpneus.GetBitmap(PneuInstal( 'pdirext05', edPlaca.Text,qDel1 ),pdirext05.Picture.Bitmap);
        imgpneus.GetBitmap(PneuInstal( 'pEsqext05', edPlaca.Text,qDel1 ),pEsqext05.Picture.Bitmap);
          lCarroc := True;
       End ELse Begin
        pdirext05.Picture := Nil ;
        pEsqext05.Picture := Nil ;
          lCarroc := False;
      End;

  End Else Begin
      eixo05.Picture    := Nil ;
      pdirext05.Picture := Nil ;
      pEsqext05.Picture := Nil ;
      pdirInt05.Picture := Nil ;
      pEsqInt05.Picture := Nil ;
  End;

  if ( StrToInt( qDel1.FieldByName('tip_teixo').Text ) >= 6 ) and ( LowerCase( qDel1.FieldByName('tip_nome').Text ) <> 'automóvel' ) then Begin
      imgpneus.GetBitmap(1,eixo06.Picture.Bitmap);
      imgpneus.GetBitmap(PneuInstal( 'pdirInt06', edPlaca.Text,qDel1 ),pdirInt06.Picture.Bitmap);
      imgpneus.GetBitmap(PneuInstal( 'pEsqInt06', edPlaca.Text,qDel1 ),pEsqInt06.Picture.Bitmap);

      if ( LowerCase( qDel1.FieldByName('tip_trac').Text ) <> 'normal' ) then Begin
        imgpneus.GetBitmap(PneuInstal( 'pdirext06', edPlaca.Text,qDel1 ),pdirext06.Picture.Bitmap);
        imgpneus.GetBitmap(PneuInstal( 'pEsqext06', edPlaca.Text,qDel1 ),pEsqext06.Picture.Bitmap);
          lCarroc := True;
       End ELse Begin
        pdirext06.Picture := Nil ;
        pEsqext06.Picture := Nil ;
          lCarroc := False;
      End;

  End Else Begin
      eixo06.Picture    := Nil ;
      pdirext06.Picture := Nil ;
      pEsqext06.Picture := Nil ;
      pdirInt06.Picture := Nil ;
      pEsqInt06.Picture := Nil ;
  End;

  if ( StrToInt( qDel1.FieldByName('tip_teixo').Text ) >= 7 ) and ( LowerCase( qDel1.FieldByName('tip_nome').Text ) <> 'automóvel' ) then Begin
      imgpneus.GetBitmap(1,eixo07.Picture.Bitmap);
      imgpneus.GetBitmap(PneuInstal( 'pdirInt07', edPlaca.Text,qDel1 ),pdirInt07.Picture.Bitmap);
      imgpneus.GetBitmap(PneuInstal( 'pEsqInt07', edPlaca.Text,qDel1 ),pEsqInt07.Picture.Bitmap);

      if ( LowerCase( qDel1.FieldByName('tip_trac').Text ) <> 'normal' ) then Begin
        imgpneus.GetBitmap(PneuInstal( 'pdirext07', edPlaca.Text,qDel1 ),pdirext07.Picture.Bitmap);
        imgpneus.GetBitmap(PneuInstal( 'pEsqext07', edPlaca.Text,qDel1 ),pEsqext07.Picture.Bitmap);
          lCarroc := True;
       End ELse Begin
        pdirext07.Picture := Nil ;
        pEsqext07.Picture := Nil ;
          lCarroc := false;
      End;

  End Else Begin
      eixo07.Picture    := Nil ;
      pdirext07.Picture := Nil ;
      pEsqext07.Picture := Nil ;
      pdirInt07.Picture := Nil ;
      pEsqInt07.Picture := Nil ;
  End;

  if ( StrToInt( qDel1.FieldByName('tip_teixo').Text ) >= 8 ) and ( LowerCase( qDel1.FieldByName('tip_nome').Text ) <> 'automóvel' ) then Begin
      imgpneus.GetBitmap(1,eixo08.Picture.Bitmap);
      imgpneus.GetBitmap(PneuInstal( 'pdirInt08', edPlaca.Text,qDel1 ),pdirInt08.Picture.Bitmap);
      imgpneus.GetBitmap(PneuInstal( 'pEsqInt08', edPlaca.Text,qDel1 ),pEsqInt08.Picture.Bitmap);

      if ( LowerCase( qDel1.FieldByName('tip_trac').Text ) <> 'normal' ) then Begin
        imgpneus.GetBitmap(PneuInstal( 'pdirext08', edPlaca.Text,qDel1 ),pdirext08.Picture.Bitmap);
        imgpneus.GetBitmap(PneuInstal( 'pEsqext08', edPlaca.Text,qDel1 ),pEsqext08.Picture.Bitmap);
          lCarroc := True;
       End ELse Begin
        pdirext08.Picture := Nil ;
        pEsqext08.Picture := Nil ;
          lCarroc := False;
      End;

  End Else Begin
      eixo08.Picture    := Nil ;
      pdirext08.Picture := Nil ;
      pEsqext08.Picture := Nil ;
      pdirInt08.Picture := Nil ;
      pEsqInt08.Picture := Nil ;
  End;

  if ( StrToInt( qDel1.FieldByName('tip_teixo').Text ) >= 9 ) and ( LowerCase( qDel1.FieldByName('tip_nome').Text ) <> 'automóvel' ) then Begin
      imgpneus.GetBitmap(1,eixo09.Picture.Bitmap);
      imgpneus.GetBitmap(PneuInstal( 'pdirInt09', edPlaca.Text,qDel1 ),pdirInt09.Picture.Bitmap);
      imgpneus.GetBitmap(PneuInstal( 'pEsqInt09', edPlaca.Text,qDel1 ),pEsqInt09.Picture.Bitmap);

      if ( LowerCase( qDel1.FieldByName('tip_trac').Text ) <> 'normal' ) then Begin
        imgpneus.GetBitmap(PneuInstal( 'pdirext09', edPlaca.Text,qDel1 ),pdirext09.Picture.Bitmap);
        imgpneus.GetBitmap(PneuInstal( 'pEsqext09', edPlaca.Text,qDel1 ),pEsqext09.Picture.Bitmap);
          lCarroc := True;
       End ELse Begin
        pdirext09.Picture := Nil ;
        pEsqext09.Picture := Nil ;
          lCarroc := False;
      End;

  End Else Begin
      eixo09.Picture    := Nil ;
      pdirext09.Picture := Nil ;
      pEsqext09.Picture := Nil ;
      pdirInt09.Picture := Nil ;
      pEsqInt09.Picture := Nil ;
  End;

 // qDel1.FieldByName('tip_step').Text
 If  StrToInt( qDel1.FieldByName('tip_step').Text ) >=1  Then
     imgpneus.GetBitmap(PneuInstal( 'step01', edPlaca.Text,qDel1 ),step01.Picture.Bitmap)
 Else
     ( step01.Picture := Nil ) ;


  If StrToInt( qDel1.FieldByName('tip_step').Text ) >=2 Then
     imgpneus.GetBitmap(PneuInstal( 'step02', edPlaca.Text,qDel1 ),step02.Picture.Bitmap)
  Else
  ( step02.Picture := Nil ) ;

  If  StrToInt( qDel1.FieldByName('tip_step').Text ) >=3 Then
      imgpneus.GetBitmap(PneuInstal( 'step03', edPlaca.Text,qDel1 ),step03.Picture.Bitmap)
  Else
      step03.Picture := Nil  ;

  If StrToInt( qDel1.FieldByName('tip_step').Text ) >=4 Then
     imgpneus.GetBitmap(PneuInstal( 'step04', edPlaca.Text,qDel1 ),step04.Picture.Bitmap)
  Else
     step04.Picture := Nil  ;



  // Definindo os Hints dos Botões e Busca dos Relacionamentos
  For i := 0 to ComponentCount-1 do begin
    if ( Components[i] is TImage ) and
       ( Components[i].Tag = 20  ) and
       ( Not TImage(Components[i]).Picture.Bitmap.Empty ) then Begin
        TImage(Components[i]).CustomHint    :=  fPrincipal.HintBalloo ;
        TImage(Components[i]).ShowHint      :=  True;
        TImage(Components[i]).Hint          := ' Informações! | '+#13
                                              +' Cód.Fogo: '+BuscaMarcaFogo( TImage(Components[i]).Name, edPlaca.Text, lCarroc )+' '+#13
                                              +' Para Maiores Informações, Duplo clique! '+#13
                                              +''+#13;
    End;
  end;

  FreeAndNil(qdel);
end;

procedure TfrmPneuMnt.FormClose(Sender: TObject; var Action: TCloseAction);
Var
i: Integer;
begin
    For i := 0 to ComponentCount-1 do begin

      if ( Components[i] is TFDQuery ) then
         TFDQuery(Components[i]).Close;

      if ( Components[i] is TClientDataSet ) then
         TClientDataSet(Components[i]).Close;
    end;

    frmPneumnt                        := nil ;
    action                            := cafree;
    fPrincipal.btnpneumnt.Enabled     := True;
end;

procedure TfrmPneuMnt.FormCreate(Sender: TObject);
Var
i: Integer;
begin

  cPre                          := 'pmt_';
  cTabela                       := 'btnpneumnt';
  acampo                        := 1;
  sqlNew                        := TFDQuery.Create(nil);
  sqlNew.Connection             := dmEmp.SqlConSis;
  fPrincipal.btnpneumnt.Enabled := False;
  {
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;
  }
end;

procedure TfrmPneuMnt.FormKeyPress(Sender: TObject; var Key: Char);
Begin
  //verifica se a tecla pressionada é a tecla ENTER, conhecida como #13
  If key = #13 then Begin
    //se for, passa o foco para o próximo campo, zerando o valor da variável Key
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  End Else
    If key = #27 then Begin
       Close;
  end;
end;

procedure TfrmPneuMnt.FormShow(Sender: TObject);
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
  lbCabeca01.Caption    := 'Manutenção de Pneus';
  lbCabeca02.Caption    := u_funcao.nmSistema ;
  // Cores - Titulos do Banner
  lbCabeca01.Font.Color := u_funcao.clTit_BCad ;
  lbCabeca02.Font.Color := u_funcao.clTit_BCad ;
  inittelas(0,False);
  atualizagrids;
  for i := 0 to ComponentCount -1 do begin
      if ( Components[i].ClassName = 'TImage' ) and ( UpperCase( Copy( Components[i].Name,1,1) ) = UpperCase( 'P' ) ) then Begin
         SetLength(aImgpneu,Length(aImgpneu)+1); aImgpneu[Length(aImgpneu) - 1] := TImage( Components[i] )  ;
         SetLength(aDescpneu,Length(aDescpneu)+1); aDescpneu[Length(aDescpneu) - 1] := Components[i].Name  ;


      End;
      if ( Components[i].ClassName = 'TImage' ) and ( UpperCase( Copy( Components[i].Name,1,4) ) = UpperCase( 'eixo' ) ) then Begin
         SetLength(aImgeixo,Length(aImgeixo)+1); aImgeixo[Length(aImgeixo) - 1] := TImage( Components[i] )  ;
      End;

  end;
  FreeAndNil(Util);
end;

procedure TfrmPneuMnt.inittelas(tela :Integer; lOp: Boolean);
Var
  DimenGridMin, DimenGridMax, I, X, G  : Integer;
  Tab : string;

begin
   DimenGridMin := 260;
   DimenGridMax := grbPneus.Height;

   if Not lOp then begin
      grbEstoque.Height := DimenGridMax;
      grbManutec.Height := DimenGridMax;
      grbSucata.Height  := DimenGridMax;
      Pgopcao.Visible   := False;
      Tab :='';

   End Else Begin
      grbEstoque.Height := DimenGridMin;
      grbManutec.Height := DimenGridMin;
      grbSucata.Height  := DimenGridMin;
      Pgopcao.Visible   := True;

      for I := 0 to ( Pgopcao.PageCount-1 )  do begin
            if I <> tela then begin
               Pgopcao.Pages[I].TabVisible := False ;
            end Else Begin
               Pgopcao.Pages[I].TabVisible  := True;
               //Pgopcao.ActivePage.PageIndex := I;


               for x := 0 to ComponentCount-1 do begin
                   if Components[x] is TEdit and (TEdit(Components[x]).Tag = 10) then begin
                      TEdit(Components[X]).Clear;
                   end Else
                   if Components[x] is TButtonedEdit and (TButtonedEdit(Components[x]).Tag = 10) then begin
                      TButtonedEdit(Components[X]).Clear;
                   end Else
                   if Components[x] is TDateTimePicker and (TDateTimePicker(Components[x]).Tag = 10) then begin
                      TDateTimePicker(Components[X]).Date := Now;
                   end Else
                   if Components[x] is TMaskEdit and (TMaskEdit(Components[x]).Tag = 10) then begin
                      TMaskEdit(Components[X]).Clear;
                   end Else
                   if Components[x] is TComboBox and (TComboBox(Components[x]).Tag = 10) then begin
                      TComboBox(Components[X]).ItemIndex := 0;
                   end;
               end;

            End;


      end;




   end;
   edPlacaExit(Nil);
end;

procedure TfrmPneuMnt.pdirInt01DblClick(Sender: TObject);
Var
qDel : TFDQuery;
begin
   if ( Sender is TImage ) then
       cLocaliza     := PneuLocalizador(TImage(Sender).Name, lCarroc ) ;

   // Pegar os dados do Pneu
   qDel := TFDQuery.Create(Nil);
   qDel.Connection  := dmEmp.SqlConSis;
   qDel.Close;
   qDel.SQl.Text   :='select * from '+U_funcao.SelSchema('pneuive')
                     +' left join '+U_funcao.SelSchema('pneumod')+' on pmd_codigo = piv_codpmd '
                     +' left join '+U_funcao.SelSchema('pneudim')+' on pdm_codigo = pmd_codpdm '
                     +' left join '+U_funcao.SelSchema('pneufab')+' on pfb_codigo = pmd_codpfb '
                     +' left join '+U_funcao.SelSchema('veiculoatv')+' on vat_placa = piv_codplc '
                     +' where piv_codplc = '+QuotedStr(edPlaca.Text)
                     +' and   piv_locpne = '+QuotedStr( cLocaliza )
                     +' and   piv_status = '+QuotedStr('INSTALADO')+' ';
   qDel.Open;

  // Pegar informaççoes sobre os pneus
  edFogo.Text     := qDel.FieldByName('piv_mfogo').Text;
  edVida.Text     := qDel.FieldByName('piv_nrvida').Text;
  edModPne.Text   := qDel.FieldByName('pmd_nome').Text;
  edDimen.Text    := qDel.FieldByName('pdm_nome').Text;
  edFabric.Text   := qDel.FieldByName('pfb_nome').Text;
  edSituac.Text   := qDel.FieldByName('piv_status').Text  ;
  edSulco1.Text := qDel.FieldByName('piv_mlmsc1').Text  ;
  edSulco2.Text := qDel.FieldByName('piv_mlmsc2').Text  ;
  edSulco3.Text := qDel.FieldByName('piv_mlmsc3').Text  ;
  edSulco4.Text := qDel.FieldByName('piv_mlmsc4').Text  ;
  edSulco5.Text := qDel.FieldByName('piv_mlmsc5').Text  ;
  edSulco6.Text := qDel.FieldByName('piv_mlmsc6').Text  ;
  edPosic.Text    := PgLocalPne(cLocaliza);
  edObjeto.Text   := qDel.FieldByName('piv_situac').Text  ;
  if qDel.FieldByName('piv_kmrodi').Text <> '' then begin
     edKmRodiz.Text   := FormatCurr('Km #,###,##0',StrToFloat( qDel.FieldByName('piv_kmrodi').Text )) ;
     edKmInstal.Text  := FormatCurr('Km #,###,##0',StrToFloat( qDel.FieldByName('piv_kmmant').Text ) ) ;
     edKmRoda.Text    := FormatCurr('Km #,###,##0', ( qDel.FieldByName('vat_kmatu').AsFloat - qDel.FieldByName('piv_kmmant').AsFloat ) ) ;
  end else begin
     edKmRodiz.Text   := FormatCurr('Km #,###,##0',0) ;
     edKmInstal.Text  := FormatCurr('Km #,###,##0',0) ;
  end;
  ativabtn;
  FreeAndNil(qDel);

end;

procedure TfrmPneuMnt.pdirInt01DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
 if (Source = TImage(Sender) ) then begin
    TImage(Sender).EndDrag(True);
    cLocaliza     := PneuLocalizador(TImage(Sender).Name, lCarroc) ;
 end;
end;

procedure TfrmPneuMnt.pdirInt01DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
   if ( TImage(Sender).Name <> TImage(Source).Name ) then begin // and  ValidaRodizio(TImage(Source).Name, edPlaca.Text, lCarroc)
       cPneu1 := PneuLocalizador(TImage(Source).Name, lCarroc);
       cPneu2 := PneuLocalizador(TImage(Sender).Name, lCarroc);
       Accept := True ;
   end Else Begin
       Accept     := (( Source IS TDBGrid) and
                       BuscaPneuInstalado(TImage(Sender).Name, edPlaca.Text, lCarroc ) and
                      ( Not TImage(Sender).Picture.Bitmap.Empty ) );
       cLocaliza  := PneuLocalizador(TImage(Sender).Name, lCarroc) ;
   End;
end;

procedure TfrmPneuMnt.pdirInt01EndDrag(Sender, Target: TObject; X, Y: Integer);
Var
  qDel, qDel1: TFDQuery;
  evento, objeto : string;
begin


  {
   Ideia de posicionamento dos pneus

  B 1 D E D
  | | | | |____ Direita ou Esquerda
  | | | |______ Interno / Meio / externo
  | | |________ Dianteiro ou Trazeiro / Step
  | |__________ Eixo
  |____________ Boleia ou carroceria

  }


  if (Target is TDBGrid) and  ( LowerCase(TDBGrid(Target).Name) = 'dbgestoque' ) then begin  ///and ( Not BuscaPneuInstalado(TImage(Target).Name, edPlaca.Text, lCarroc) )

       inittelas(1,True);
       edDesInstFogo.Text     := BuscaMarcaFogo( TImage(Sender).Name, edPlaca.Text, lCarroc );
       cLocaliza              := PneuLocalizador(TImage(Sender).Name, lCarroc) ;
       edLocDesInstPneu.Text  := PgLocalPne(cLocaliza) ;

       // Pegar os dados do Pneu
       qDel := TFDQuery.Create(Nil);
       qDel.Connection  := dmEmp.SqlConSis;
       qDel.Close;
       qDel.SQl.Text   :='select * from '+U_funcao.SelSchema('pneuive')
                         +' where piv_codplc = '+QuotedStr(edPlaca.Text)
                         +' and   piv_locpne = '+QuotedStr(cLocaliza)
                         +' and   piv_status = '+QuotedStr('INSTALADO')+' ';
       qDel.Open;

       edDesIncSulc1.Text        := qDel.FieldByName('piv_mlmsc1').Value ;
       edDesIncSulc2.Text        := qDel.FieldByName('piv_mlmsc2').Value ;
       edDesIncSulc3.Text        := qDel.FieldByName('piv_mlmsc3').Value ;
       edDesIncSulc4.Text        := qDel.FieldByName('piv_mlmsc4').Value ;
       edDesIncSulc5.Text        := qDel.FieldByName('piv_mlmsc5').Value ;
       edDesIncSulc6.Text        := qDel.FieldByName('piv_mlmsc6').Value ;
       edDatDesinst.SetFocus;
       pdirInt01DblClick(Self);


  end else
  if ( Target is TImage )  then begin
       ///and ( Not BuscaPneuInstalado(TImage(Target).Name, edPlaca.Text, lCarroc) )

       inittelas(5,True);
       edFogoRod1.Text        := BuscaMarcaFogo( TImage(Sender).Name, edPlaca.Text, lCarroc );
       edNomRod1.Text         := PgLocalPne( cPneu1 );
       edFogoRod2.Text        := BuscaMarcaFogo( TImage(Target).Name, edPlaca.Text, lCarroc );
       edNomRod2.Text         := PgLocalPne( cPneu2 );
       edDatRod.Date          := Now;
       edDatRod.SetFocus

       //edLocDesInstPneu.Text  := PgLocalPne(cLocaliza) ;
  end;
  FreeAndNil(qDel);
  FreeAndNil(qDel1);
end;

procedure TfrmPneuMnt.pdirInt01MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Not BuscaPneuInstalado(TImage(Sender).Name, edPlaca.Text, lCarroc) then begin
     if (Button = mbLeft) and ((Sender = TImage(Sender)) or (Sender = dbgEstoque)) then
        TDBGrid(Sender).BeginDrag(False) // inicia a operacao
  end;
end;

procedure TfrmPneuMnt.tabManutecShow(Sender: TObject);
Var
x: Integer;
begin
{

 }
end;

initialization
  RegisterClass(TfrmPneuMnt);


end.
