unit U_ordcoleta;

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
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;


type
  Tfrmordcoleta = class(TForm)
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
    GroupBox4: TGroupBox;
    actionsub: TActionManager;
    AcsBtnInc: TAction;
    AcsBtnExc: TAction;
    CmbBtnInc: TAction;
    cmbBtnExc: TAction;
    GroupBox6: TGroupBox;
    sqlDb: TZQuery;
    dspDb: TDataSetProvider;
    cliDb: TClientDataSet;
    dsDb: TDataSource;
    TabSheet2: TTabSheet;
    GroupBox7: TGroupBox;
    odc_obs: TRichEdit;
    GroupBox8: TGroupBox;
    Label15: TLabel;
    odc_codigo: TButtonedEdit;
    odc_datems: TDateTimePicker;
    Label27: TLabel;
    odc_codtmc: TButtonedEdit;
    Label2: TLabel;
    edNomtmc: TEdit;
    Label3: TLabel;
    odc_codcli: TButtonedEdit;
    Label4: TLabel;
    edNomCli: TEdit;
    Label1: TLabel;
    sqlDbfcr_codcfr: TIntegerField;
    sqlDbfcr_datven: TDateField;
    sqlDbfcr_numpar: TWideStringField;
    sqlDbcfr_vlrtot: TFloatField;
    sqlDbcfr_descri: TWideStringField;
    sqlDbfcr_vlrapg: TFloatField;
    sqlDbfcr_vlrpag: TFloatField;
    sqlDbfcr_datpag: TDateField;
    cliDbfcr_codcfr: TIntegerField;
    cliDbfcr_datven: TDateField;
    cliDbfcr_numpar: TWideStringField;
    cliDbcfr_vlrtot: TFloatField;
    cliDbcfr_descri: TWideStringField;
    cliDbfcr_vlrapg: TFloatField;
    cliDbfcr_vlrpag: TFloatField;
    cliDbfcr_datpag: TDateField;
    sqlDbfcr_status: TWideStringField;
    cliDbfcr_status: TWideStringField;
    odc_horems: TMaskEdit;
    Label24: TLabel;
    odc_codocg: TButtonedEdit;
    Label18: TLabel;
    edNomOcg: TEdit;
    Label35: TLabel;
    odc_codtme: TButtonedEdit;
    Label36: TLabel;
    edNomTme: TEdit;
    Label37: TLabel;
    grbSeguros: TGroupBox;
    odc_sgcarga: TCheckBox;
    odc_sgequip: TCheckBox;
    odc_lctrl01: TMaskEdit;
    Label20: TLabel;
    odc_genset01: TMaskEdit;
    Label25: TLabel;
    odc_vlrscg: TMaskEdit;
    Label33: TLabel;
    odc_codtcn: TButtonedEdit;
    Label34: TLabel;
    edNomTcn: TEdit;
    Label38: TLabel;
    odc_nmrctn: TMaskEdit;
    Label39: TLabel;
    odc_vlreqp: TMaskEdit;
    Label41: TLabel;
    odc_codpss: TButtonedEdit;
    Label5: TLabel;
    edNomPss: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    odc_codpl1: TButtonedEdit;
    Label10: TLabel;
    edNomPl1: TEdit;
    Label12: TLabel;
    odc_codpl2: TButtonedEdit;
    edNomPl2: TEdit;
    Label13: TLabel;
    TabSheet1: TTabSheet;
    GroupBox9: TGroupBox;
    Label6: TLabel;
    Label9: TLabel;
    Label16: TLabel;
    dbgrecursos: TDBGrid;
    edCodSer: TButtonedEdit;
    edNomSer: TEdit;
    edValor: TMaskEdit;
    btnIncFat: TButton;
    btnExcFat: TButton;
    grbVlrSeg: TGroupBox;
    lbTotalSeg: TLabel;
    grbVlrRec: TGroupBox;
    lbTotRec: TLabel;
    grbVlrTre: TGroupBox;
    lbTotTre: TLabel;
    GroupBox1: TGroupBox;
    lbTotGeral: TLabel;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    Label14: TLabel;
    Label17: TLabel;
    dbgroteiro: TDBGrid;
    edCodRot: TButtonedEdit;
    edNomRot: TEdit;
    btnIncSer: TButton;
    btnExcSer: TButton;
    Label19: TLabel;
    edQtdRot: TMaskEdit;
    Label21: TLabel;
    edValRot: TMaskEdit;
    edTotRot: TMaskEdit;
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
    procedure odc_codigoRightButtonClick(Sender: TObject);
    procedure odc_codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure odc_codigoExit(Sender: TObject);
    procedure odc_codtmcRightButtonClick(Sender: TObject);
    procedure odc_codtmcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure odc_codtmcExit(Sender: TObject);
    procedure odc_codcliRightButtonClick(Sender: TObject);
    procedure odc_codcliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure odc_codcliExit(Sender: TObject);
    Procedure BtnFoto;
    procedure RefreshGrid;
    procedure PgControleChange(Sender: TObject);
    procedure odc_vlrscgKeyPress(Sender: TObject; var Key: Char);
    procedure odc_vlreqpKeyPress(Sender: TObject; var Key: Char);
    procedure odc_horemsExit(Sender: TObject);
    procedure odc_codocgRightButtonClick(Sender: TObject);
    procedure odc_codocgKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure odc_codocgExit(Sender: TObject);
    procedure odc_codtmeRightButtonClick(Sender: TObject);
    procedure odc_codtmeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure odc_codtmeExit(Sender: TObject);
    procedure odc_codtcnRightButtonClick(Sender: TObject);
    procedure odc_codtcnKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure odc_codtcnExit(Sender: TObject);
    procedure odc_codpssRightButtonClick(Sender: TObject);
    procedure odc_codpssKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure odc_codpssExit(Sender: TObject);
    procedure odc_codpl1RightButtonClick(Sender: TObject);
    procedure odc_codpl1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure odc_codpl1Exit(Sender: TObject);
    procedure odc_codpl2RightButtonClick(Sender: TObject);
    procedure odc_codpl2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure odc_codpl2Exit(Sender: TObject);
    procedure odc_sgequipClick(Sender: TObject);
    procedure odc_sgcargaClick(Sender: TObject);
    procedure odc_vlrscgChange(Sender: TObject);
    procedure odc_vlreqpChange(Sender: TObject);
    procedure odc_vlreqpExit(Sender: TObject);
    procedure odc_vlrscgExit(Sender: TObject);
    procedure dbgrecursosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edCodSerRightButtonClick(Sender: TObject);
    procedure edCodSerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCodSerExit(Sender: TObject);
    procedure edValorKeyPress(Sender: TObject; var Key: Char);
    procedure btnIncFatClick(Sender: TObject);
    procedure edCodRotRightButtonClick(Sender: TObject);
    procedure edCodRotKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCodRotExit(Sender: TObject);
    procedure btnIncSerClick(Sender: TObject);
    procedure dbgroteiroDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edQtdRotChange(Sender: TObject);
    procedure btnExcSerClick(Sender: TObject);
    procedure btnExcFatClick(Sender: TObject);
  private
    { Private declarations }
    wEmpresa, wUsuInc, wHorInc, wUsuAlt, wHorAlt : string ;
    wDatInc, wDatAlt : Tdate;
    nNew, nRecno:  Integer;
    procedure verificseg;
    procedure btninc;
    procedure Soma;
  public
    acampo: integer;
    aberto, lMostra: Boolean;
    Util: TClasseUtil;
    Pesquisa : TClasConsulta;
    sqlNew    : TFDQuery;
    aEdits : TArrayComp;
    cPre, cTabela,clicepcob, cliendcob,  clinumcob,  clicomcob, clibaicob,  clicodcdc: String;

    { Public declarations }
  end;

var
  frmordcoleta: Tfrmordcoleta;
  modConsulta, nOrdem : integer;


implementation

uses  UCalculadora, u_DmEmp, uSistema, U_funcao, U_CnpjClass,
  U_CpfClass, U_ClassconsContas, U_ClassConsMotorista;

{$R *.dfm}

procedure Tfrmordcoleta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sqlNew.Close;
    dmEmp.cliordcoleta.Close;
    frmordcoleta                    := nil ;
    action                          := cafree;
    fPrincipal.btnordcoleta.Enabled := True;
end;



procedure Tfrmordcoleta.FormCreate(Sender: TObject);
Var
i: Integer;
begin
  cPre                        := 'odc_';
  cTabela                     := 'ordcoleta';
  acampo                      := 1;
  sqlNew                      := TFDQuery.Create(nil);
  sqlNew.Connection           := dmEmp.SqlConSis;
  fPrincipal.btnordcoleta.Enabled  := False;
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;
end;

procedure Tfrmordcoleta.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure Tfrmordcoleta.FormShow(Sender: TObject);
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
  lbCabeca01.Caption    := 'Cadastro de ordcoletas';
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

end;

procedure Tfrmordcoleta.gravadados;
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, ctip_horalt,cCodSql, cIteSql,cValSql,cCodMnt : string ;
dData, dtip_datalt : TDate ;
i, tmp: Integer;
SQLQ : TFDQuery ;
begin
   gravadados2(cTabela,cPre,cPre+'codigo','X','', nNew, frmordcoleta, dmEmp.SqlConSis, aEdits );
end;

procedure Tfrmordcoleta.limpaget;
Var
i: Integer;
begin
  limpaget2(aEdits);
end;

procedure Tfrmordcoleta.navegacao(Ord: Integer);
begin
  if btnGrava.Enabled then
     Exit;

  navegacao2( Ord, acampo, btnIni, btnAnt, btnProx, btnUlt, sqlNew, dmEmp.sqlordcoleta, odc_codigo,'' );
  acampo := 0;
  RefreshDialog2(cPre,acampo, frmordcoleta, sqlNew, aEdits);
  acampo := 1;
  RefreshGrid;
end;

procedure Tfrmordcoleta.PgControleChange(Sender: TObject);
begin
  if btnGrava.Enabled then Begin
      //navegacao(5);
  End Else
      navegacao(5);

end;

procedure Tfrmordcoleta.RefreshDados(tipo: String);
var
  i: integer;
  cWhere, cQuery, cOrder: String;

begin
  RefreshDados2(acampo, tipo, '',  odc_codigo, sqlNew, dmEmp.sqlordcoleta );
end;


procedure Tfrmordcoleta.RefreshDialog;
begin
{}
end;

procedure Tfrmordcoleta.ToolButton9Click(Sender: TObject);
begin
  frmCalculadora := TfrmCalculadora.Create(Self);
  frmCalculadora.Show;

end;

procedure Tfrmordcoleta.odc_codtcnExit(Sender: TObject);
begin
  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela  :=  dmEmp.sqltpcontainer;
  edNomTcn.Text       :=  Pesquisa.Relacao('tpcontainer',odc_codtcn,'tcn_codigo','tcn_nome'  );
end;

procedure Tfrmordcoleta.odc_codtcnKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      odc_codtcnRightButtonClick(Self);
  end;
Finally

End;

end;

procedure Tfrmordcoleta.odc_codtcnRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dstpcontainer ;
  Pesquisa.sqlTabela :=  dmEmp.sqltpcontainer ;
  Pesquisa.cliTabela :=  dmEmp.clitpcontainer ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Tipos de Container';
  Pesquisa.nmTabela  := 'tpcontainer';
  Pesquisa.NovoCad   := 'tpcontainer' ;
  Pesquisa.QuerySql  := '';
  // Display        campo   cabecalho           get         tan  indices
  Pesquisa.AddReg('tcn_codigo','Código'               ,'tcn_codigo' ,5  ,'por Código' );
  Pesquisa.AddReg('tcn_nome'  ,'Terminal de Coleta'   ,'tcn_nome'   ,20 ,'por Terminal' );

  Pesquisa.acessa(odc_codtme);
  odc_codtcn.text   :=  Pesquisa.RecReg('tcn_codigo');
  edNomTcn.text     :=  Pesquisa.RecReg('tcn_nome');
  Pesquisa.Destroy;

end;

procedure Tfrmordcoleta.odc_codtmcExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela  :=  dmEmp.sqltrmcoleta;
  edNomTmc.Text       :=  Pesquisa.Relacao('trmcoleta',odc_codtmc,'tmc_codigo','tmc_nome'  );
  if ( TButtonedEdit(Sender).Text = odc_codtme.Text  ) and ( TButtonedEdit(Sender).Text <> '' ) then begin
     ShowMessage('ERRO: Terminal de Coleta igual ao terminal de entrega');
     TButtonedEdit(Sender).SetFocus;
  end;

end;

procedure Tfrmordcoleta.odc_codtmcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      odc_codtmcRightButtonClick(Self);
  end;
Finally

End;

end;

procedure Tfrmordcoleta.odc_codtmcRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dstrmcoleta ;
  Pesquisa.sqlTabela :=  dmEmp.sqltrmcoleta ;
  Pesquisa.cliTabela :=  dmEmp.clitrmcoleta ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Terminal de Coleta';
  Pesquisa.nmTabela  := 'trmcoleta';
  Pesquisa.NovoCad   := 'trmcoleta' ;
  Pesquisa.QuerySql  := ' tmc_codigo <> '++ fIIF( odc_codtme.Text = '','0', odc_codtme.Text ) ;
  // Display        campo   cabecalho           get         tan  indices
  Pesquisa.AddReg('tmc_codigo','Código'               ,'tmc_codigo' ,5  ,'por Código' );
  Pesquisa.AddReg('tmc_nome'  ,'Terminal de Coleta'   ,'tmc_nome'   ,20 ,'por Terminal' );

  Pesquisa.acessa(odc_codtmc);
  odc_codtmc.text   :=  Pesquisa.RecReg('tmc_codigo');
  edNomTmc.text     :=  Pesquisa.RecReg('tmc_nome');
  Pesquisa.Destroy;


end;

procedure Tfrmordcoleta.odc_codtmeExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela  :=  dmEmp.sqltrmcoleta;
  edNomTme.Text       :=  Pesquisa.Relacao('trmcoleta',odc_codtme,'tmc_codigo','tmc_nome'  );
  if ( TButtonedEdit(Sender).Text = odc_codtmc.Text ) and ( TButtonedEdit(Sender).Text <> '' )  then begin
     ShowMessage('ERRO: Terminal de Entrega igual ao terminal de Coleta');
     TButtonedEdit(Sender).SetFocus;
  end;


end;

procedure Tfrmordcoleta.odc_codtmeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      odc_codtmeRightButtonClick(Self);
  end;
Finally

End;

end;

procedure Tfrmordcoleta.odc_codtmeRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dstrmcoleta ;
  Pesquisa.sqlTabela :=  dmEmp.sqltrmcoleta ;
  Pesquisa.cliTabela :=  dmEmp.clitrmcoleta ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Terminal de Entrega';
  Pesquisa.nmTabela  := 'trmcoleta';
  Pesquisa.NovoCad   := 'trmcoleta' ;
  Pesquisa.QuerySql  := ' tmc_codigo <> '+ fIIF( odc_codtmc.Text = '','0', odc_codtmc.Text ) ;
  // Display        campo   cabecalho           get         tan  indices
  Pesquisa.AddReg('tmc_codigo','Código'               ,'tmc_codigo' ,5  ,'por Código' );
  Pesquisa.AddReg('tmc_nome'  ,'Terminal de Coleta'   ,'tmc_nome'   ,20 ,'por Terminal' );

  Pesquisa.acessa(odc_codtme);
  odc_codtme.text   :=  Pesquisa.RecReg('tmc_codigo');
  edNomTme.text     :=  Pesquisa.RecReg('tmc_nome');
  Pesquisa.Destroy;
end;

procedure Tfrmordcoleta.odc_horemsExit(Sender: TObject);
begin
  ChkHora( Sender );
end;

procedure Tfrmordcoleta.odc_sgcargaClick(Sender: TObject);
begin
verificseg
end;

procedure Tfrmordcoleta.odc_sgequipClick(Sender: TObject);
begin
verificseg
end;

procedure Tfrmordcoleta.verificseg;
begin
  odc_vlrscg.Enabled := ( ( odc_sgcarga.Checked ) and btnGrava.Enabled ) ;
  odc_vlreqp.Enabled := ( ( odc_sgequip.Checked ) and btnGrava.Enabled ) ;
  Soma;
end;


procedure Tfrmordcoleta.odc_vlreqpChange(Sender: TObject);
begin
verificseg;
end;

procedure Tfrmordcoleta.odc_vlreqpExit(Sender: TObject);
begin
verificseg
end;

procedure Tfrmordcoleta.odc_vlreqpKeyPress(Sender: TObject; var Key: Char);
begin
    KeyValor( Sender , Key );
end;

procedure Tfrmordcoleta.odc_vlrscgChange(Sender: TObject);
begin
verificseg;
end;

procedure Tfrmordcoleta.odc_vlrscgExit(Sender: TObject);
begin
verificseg;
end;

procedure Tfrmordcoleta.odc_vlrscgKeyPress(Sender: TObject; var Key: Char);
begin
    KeyValor( Sender , Key );
end;

procedure Tfrmordcoleta.odc_codigoExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlordcoleta ;
  navegacao(5);
 
end;

procedure Tfrmordcoleta.odc_codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   Try
    case key of
        VK_END    : odc_codigoRightButtonClick(Self);
        VK_UP     : navegacao(1);
        VK_LEFT   : navegacao(2);
        VK_RIGHT  : navegacao(3);
        VK_DOWN   : navegacao(4);

      end;
  Finally

  End;

end;

procedure Tfrmordcoleta.odc_codigoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
if btnGrava.Enabled then
   Exit;

  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsordcoleta ;
  Pesquisa.sqlTabela :=  dmEmp.sqlordcoleta ;
  Pesquisa.cliTabela :=  dmEmp.cliordcoleta ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de ordcoletas';
  Pesquisa.nmTabela  := 'ordcoleta';
  // Display        campo   cabecalho              get            tan  indices
  Pesquisa.AddReg('odc_codigo'  ,'Código'         ,'odc_codigo'   ,5  ,'por Código'     );
  Pesquisa.AddReg('odc_datems'  ,'Dt Emissão'     ,'odc_datems'   ,14 ,'por Dt Emissão' );
  Pesquisa.AddReg('cli_cpfcnpj' ,'CPF/CNPJ'       ,'cli_cpfcnpj'  ,14 ,'por CPF/CNPJ'   );
  Pesquisa.AddReg('cli_nome'    ,'Cliente'        ,'cli_nome'     ,35 ,'por Cliente'    );
  Pesquisa.AddReg('odc_codpl1'  ,'Placa'          ,'odc_codpl1'   ,25 ,'por Placa'      );
  Pesquisa.AddReg('pss_nome'    ,'Motorista'      ,'pss_nome'     ,25 ,'por Motorista'  );
  Pesquisa.AddReg('tmc_nome'    ,'Term Coleta'    ,'tmc_nome'     ,25 ,'por Term Coleta');

  Pesquisa.acessa(odc_codigo);
  odc_codigo.text   :=  Pesquisa.RecReg('odc_codigo');
  //odc_datems.Date   :=  Pesquisa.RecReg('odc_datems');
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

procedure Tfrmordcoleta.odc_codocgExit(Sender: TObject);
begin
  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela  :=  dmEmp.sqloricarga;
  edNomOcg.Text       :=  Pesquisa.Relacao('oricarga',odc_codocg,'ocg_codigo','ocg_nome'  );

end;

procedure Tfrmordcoleta.odc_codocgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      odc_codocgRightButtonClick(Self);
  end;
Finally

 End;

end;

procedure Tfrmordcoleta.odc_codocgRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsoricarga ;
  Pesquisa.sqlTabela :=  dmEmp.sqloricarga ;
  Pesquisa.cliTabela :=  dmEmp.clioricarga ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Origenm de Cargas';
  Pesquisa.nmTabela  := 'oricarga';
  Pesquisa.NovoCad   := 'oricarga' ;
  Pesquisa.QuerySql  := '';
  // Display        campo   cabecalho           get         tan  indices
  Pesquisa.AddReg('ocg_codigo','Código'               ,'ocg_codigo' ,5  ,'por Código' );
  Pesquisa.AddReg('ocg_nome'  ,'Origem de Carga'      ,'ocg_nome'   ,20 ,'por Terminal' );

  Pesquisa.acessa(odc_codtmc);
  odc_codocg.text   :=  Pesquisa.RecReg('ocg_codigo');
  edNomOcg.text     :=  Pesquisa.RecReg('ocg_nome');
  Pesquisa.Destroy;


end;

procedure Tfrmordcoleta.odc_codpl1Exit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela  :=  dmEmp.sqlveiculoatv ;
  edNomPl1.Text       :=  Pesquisa.Relacao('veiculoatv',odc_codpl1,'vat_placa','mdl_nome'  );
  if ( TButtonedEdit(Sender).Text = odc_codpl2.Text  ) and ( TButtonedEdit(Sender).Text <> '' ) then begin
     ShowMessage('ERRO: o Cavalo é igual ao Reboque');
     TButtonedEdit(Sender).SetFocus;
  end;

end;

procedure Tfrmordcoleta.odc_codpl1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      odc_codpl1RightButtonClick(Self);
  end;
Finally

End;

end;

procedure Tfrmordcoleta.odc_codpl1RightButtonClick(Sender: TObject);
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
  Pesquisa.QuerySql  := ' VAT_CAVALO = ''CAVALO'' AND VAT_STATUS = ''ATIVO'' ';
  // Display        campo   cabecalho           get         tan  indices
  Pesquisa.AddReg('vat_placa',  'Placa'         ,'vat_placa' ,     7  , 'por Placa'   );
  Pesquisa.AddReg('vat_nrfrota','Frota'         ,'vat_nrfrota' ,   7  , 'por Frota'   );
  Pesquisa.AddReg('mdl_nome',   'Modelo'        ,'edNomPl1' ,     25  , 'por Modelo'  );
  Pesquisa.AddReg('mrc_nome',   'Marca'         ,'' ,             25  , 'por Marca'   );
  Pesquisa.AddReg('ltd_nome',   'Lotado'        ,'' ,             25  , 'por Lotação' );
  Pesquisa.AddReg('vat_chassi', 'Chassi'        ,'' ,             17  , 'por Chassi'  );
  Pesquisa.AddReg('vat_renavan','Renavan'       ,'' ,             17  , 'por Renavan' );

  Pesquisa.acessa(odc_codpl1);
  odc_codpl1.text   :=  Pesquisa.RecReg('vat_placa');
  edNomPl1.text     :=  Pesquisa.RecReg('mdl_nome');
  Pesquisa.Destroy;

end;

procedure Tfrmordcoleta.odc_codpl2Exit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela  :=  dmEmp.sqlveiculoatv ;
  edNomPl2.Text       :=  Pesquisa.Relacao('veiculoatv',odc_codpl2,'vat_placa','mdl_nome'  );
  if ( TButtonedEdit(Sender).Text = odc_codpl1.Text  ) and ( TButtonedEdit(Sender).Text <> '' ) then begin
     ShowMessage('ERRO: o Reboque é igual ao Cavalo');
     TButtonedEdit(Sender).SetFocus;
  end;

end;

procedure Tfrmordcoleta.odc_codpl2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      odc_codpl2RightButtonClick(Self);
  end;
Finally

End;

end;

procedure Tfrmordcoleta.odc_codpl2RightButtonClick(Sender: TObject);
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
  Pesquisa.QuerySql  := ' VAT_CAVALO <> ''CAVALO'' AND VAT_STATUS = ''ATIVO'' ';
  // Display        campo   cabecalho           get         tan  indices
  Pesquisa.AddReg('vat_placa',  'Placa'         ,'vat_placa' ,     7  , 'por Placa'   );
  Pesquisa.AddReg('vat_nrfrota','Frota'         ,'vat_nrfrota' ,   7  , 'por Frota'   );
  Pesquisa.AddReg('mdl_nome',   'Modelo'        ,'edNomPl2' ,     25  , 'por Modelo'  );
  Pesquisa.AddReg('mrc_nome',   'Marca'         ,'' ,             25  , 'por Marca'   );
  Pesquisa.AddReg('ltd_nome',   'Lotado'        ,'' ,             25  , 'por Lotação' );
  Pesquisa.AddReg('vat_chassi', 'Chassi'        ,'' ,             17  , 'por Chassi'  );
  Pesquisa.AddReg('vat_renavan','Renavan'       ,'' ,             17  , 'por Renavan' );

  Pesquisa.acessa(odc_codpl2);
  odc_codpl2.text   :=  Pesquisa.RecReg('vat_placa');
  edNomPl2.text     :=  Pesquisa.RecReg('mdl_nome');
  Pesquisa.Destroy;

end;

procedure Tfrmordcoleta.odc_codpssExit(Sender: TObject);
Var
cNmDataBase: String;
Motorista: TfrmMotorista;
begin
  Motorista  := TfrmMotorista.Create;
  iF Motorista.PagaMotorista(odc_codpss) then Begin

  End;

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.trava(Sender, nNew );
  Pesquisa.sqlTabela :=  dmEmp.sqlPessoal ;
  Pesquisa.QuerySql  := ' pss_codcgo =  '+PgCodCgo('Motorista');
  edNomPss.Text :=  Pesquisa.Relacao('pessoal',odc_codpss,'pss_codigo','pss_nome');
end;

procedure Tfrmordcoleta.odc_codpssKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      odc_codpssRightButtonClick(Self);
  end;
Finally

End;

end;

procedure Tfrmordcoleta.odc_codpssRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsPessoal ;
  Pesquisa.sqlTabela :=  dmEmp.sqlPessoal ;
  Pesquisa.cliTabela :=  dmEmp.cliPessoal ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadstro de Motorista';
  Pesquisa.nmTabela  := 'pessoal';
  Pesquisa.QuerySql  := ' pss_codcgo =  '+PgCodCgo('Motorista');

  // Display        campo   cabecalho              get            tan  indices
  Pesquisa.AddReg('pss_codigo'  ,'Código'         ,'odc_codpss'   ,5  ,'por Código'    );
  Pesquisa.AddReg('pss_nome'    ,'Nome Completo'  ,'edNompss'     ,35 ,'por Nome'      );
  Pesquisa.AddReg('pss_endereco','Endereço'       ,'pss_endereco' ,25 ,'por Endereço'  );
  Pesquisa.AddReg('pss_bairro'  ,'Endereço'       ,'pss_bairro'   ,25 ,'por Bairro'    );
  Pesquisa.AddReg('cid_nome'    ,'Cidade'         ,'cid_nome'     ,25 ,'por Cidade'    );
  Pesquisa.AddReg('pss_telef01' ,'Telefone 01'    ,'pss_telef01'  ,10 ,'por Tel 01'    );
  Pesquisa.AddReg('pss_telef02' ,'Telefone 02'    ,'pss_telef02'  ,10 ,'por Tel 02'    );
  Pesquisa.AddReg('pss_celular' ,'Celular'        ,'pss_celular'  ,10 ,'por Tel 01'    );

  Pesquisa.acessa(odc_codpss);
  odc_codpss.text   :=  Pesquisa.RecReg('pss_codigo');
  edNompss.text     :=  Pesquisa.RecReg('pss_nome');
  Pesquisa.Destroy;

end;

procedure Tfrmordcoleta.ativaButoes(tipo:Integer);
begin
ativaButoes2(Tipo,  btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt, sqlNew);
end;

procedure Tfrmordcoleta.ativaget;
begin
  ativaget2(aEdits,cPre+'codigo',cTabela, btnGrava.Enabled, lMostra );
end;

procedure Tfrmordcoleta.btnAlterarExecute(Sender: TObject);
begin

   PgControle.TabIndex := 0;
   btnNovo.Enabled    := False;
   btnAlterar.Enabled := False;
   btnGrava.Enabled   := True;
   ativaButoes(1);
   lMostra := True;
   ativaget;
   acampo := 0;
   nNew   := acampo;
   RefreshDialog;
   navegacao(0);
   verificseg;
   RefreshGrid;
   odc_datems.SetFocus;
end;

procedure Tfrmordcoleta.btnAntExecute(Sender: TObject);
begin
  navegacao(2);
end;

procedure Tfrmordcoleta.btnCancelaExecute(Sender: TObject);
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
   navegacao(4);
   odc_codigo.SetFocus;

end;

procedure Tfrmordcoleta.btnExcFatClick(Sender: TObject);
begin
     if MESSAGEBOX(Application.Handle, 'Deseja Excluir?', 'Confirma...', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin
          dmEmp.sqlordcoletatbr.Close;
          dmEmp.sqlordcoletatbr.SQl.Text  :='DELETE FROM '+U_funcao.SelSchema('ordcoletatbr')
                                    +' WHERE orc_codigo = '+dbgrecursos.DataSource.DataSet.FieldByName('orc_codigo').Text
                                    +' and   orc_cododc = '+odc_codigo.Text ;
          dmEmp.sqlordcoletatbr.ExecSQL;
          Auditor(Screen.activeform.Caption,'Deletou','Cód SubTab-Serviços: '+odc_codigo.Text+'/'+dbgrecursos.DataSource.DataSet.FieldByName('orc_codigo').Text );
        end;
      RefreshGrid
end;

procedure Tfrmordcoleta.btnExcluirExecute(Sender: TObject);
Var
aSubTab : TArrayDim2;
n: Integer;
begin
   //SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'acessoratv';     aSubTab[n][1] := '';
   If Exclui2(cTabela, aSubTab,  odc_codigo, btnExcluir) Then Begin;
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

procedure Tfrmordcoleta.btnExcSerClick(Sender: TObject);
begin
     if MESSAGEBOX(Application.Handle, 'Deseja Excluir?', 'Confirma...', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin
          dmEmp.sqlacsatv.Close;
          dmEmp.sqlacsatv.SQl.Text  :='DELETE FROM '+U_funcao.SelSchema('ordcoletatrt')
                                    +' WHERE otr_codigo = '+dbgroteiro.DataSource.DataSet.FieldByName('otr_codigo').Text
                                    +' and   otr_cododc = '+odc_codigo.Text ;
          dmEmp.sqlacsatv.ExecSQL;
          Auditor(Screen.activeform.Caption,'Deletou','Cód SubTab-Serviços: '+odc_codigo.Text+'/'+dbgroteiro.DataSource.DataSet.FieldByName('otr_codigo').Text );
        end;
      RefreshGrid
end;

procedure Tfrmordcoleta.BtnFoto;
begin
   AcsBtnInc.Enabled      := btnGrava.Enabled ;
   AcsBtnExc.Enabled      := (( Not dmEmp.sqlacsatv.Eof ) and ( btnGrava.Enabled ) and dmEmp.chkPer( 'ordcoleta', 'prm_exc') );

   CmbBtnInc.Enabled      := btnGrava.Enabled ;
   CmbBtnExc.Enabled      := (( Not dmEmp.sqlcmbatv.Eof ) and ( btnGrava.Enabled ) and dmEmp.chkPer( 'ordcoleta', 'prm_exc') );


end;

procedure Tfrmordcoleta.RefreshGrid;
Var
  qDel : TFDQuery;
  Encargos : Double;
  i: integer;
begin
 {
 sqlDb.Close;
 cliDb.Close;
 with sqlDb do
   begin
     SQL.Text :='SELECT fcr_codcfr, fcr_datven, fcr_numpar, cfr_vlrtot, cfr_descri, fcr_vlrapg, fcr_vlrpag, fcr_datpag, fcr_status  from  '+U_funcao.SelSchema('financecab')
                        +' LEFT JOIN  '+U_funcao.SelSchema('financeiro')+' on fcr_codcfr = cfr_codigo '
                        +' where cfr_codcli = '+U_funcao.fIIf( Length( trim(odc_codigo.Text)) > 0, QuotedStr(odc_codigo.Text),'0' ) ;
     Open;
 end;
 cliDb.Active := True;

 BtnFoto ;
  }

  dmEmp.cliordcoletatbr.Close;
  dmEmp.Sqlordcoletatbr.Close;
  with dmEmp.Sqlordcoletatbr do
    begin
      SQL.Text :=' Select * from '+U_funcao.SelSchema('ordcoletatbr')
                +' LEFT JOIN '+U_funcao.SelSchema('tbrecurso')+' on tbr_codigo = orc_codtbr '
                +' where orc_cododc = '+fIIf( Length( trim(odc_codigo.Text)) > 0, QuotedStr(odc_codigo.Text),'0' ) ;
      Open;
  end;
  dmEmp.cliordcoletatbr.Active := True;
  dbgrecursos.Refresh;

  dmEmp.cliordcoletatrt.Close;
  dmEmp.Sqlordcoletatrt.Close;
  with dmEmp.Sqlordcoletatrt do
    begin
      SQL.Text :=' Select *, (otr_vlrrot * otr_qtdrot  ) as total  from '+U_funcao.SelSchema('ordcoletatrt')
                +' LEFT JOIN '+U_funcao.SelSchema('roteiro')+' on rto_codigo = otr_codrto '
                +' where otr_cododc = '+fIIf( Length( trim(odc_codigo.Text)) > 0, QuotedStr(odc_codigo.Text),'0' ) ;
      Open;
  end;
  dmEmp.cliordcoletatrt.Active := True;
  dbgroteiro.Refresh;
  btninc;
  Soma
end;
procedure Tfrmordcoleta.Soma;
Var
  SumRec, SumRot: real;
begin
  lbTotalSeg.Caption  := FormatCurr('R$ #,###,##0.00',( FormataNum( odc_vlrscg.Text ) + FormataNum( odc_vlreqp.Text ) ) );
  SumRec:=0;
  while Not dmEmp.sqlordcoletatbr.Eof do begin
      SumRec:=SumRec+ dmEmp.sqlordcoletatbr.FieldByName('orc_vlrrec').AsFloat ;
      dmEmp.sqlordcoletatbr.Next;
  end;
  lbTotRec.Caption    := FormatCurr('R$ #,###,##0.00',SumRec);

  SumRot:=0;
  while Not dmEmp.sqlordcoletatrt.Eof do begin
      SumRot:=SumRot+ dmEmp.sqlordcoletatrt.FieldByName('otr_vlrrot').AsFloat ;
      dmEmp.sqlordcoletatrt.Next;
  end;
  lbTotTre.Caption    := FormatCurr('R$ #,###,##0.00',SumRot);
  lbTotGeral.Caption  := FormatCurr('R$ #,###,##0.00',(SumRec + ( FormataNum( odc_vlrscg.Text ) + FormataNum( odc_vlreqp.Text ) ) + SumRot  ));

end;

procedure Tfrmordcoleta.btninc;
begin
  btnIncFat.Enabled     := ( ( edcodser.Text <> '' )                     and ( btnGrava.Enabled ) )  ;
  btnExcFat.Enabled     := ( ( Not dbgrecursos.DataSource.DataSet.Eof )  and ( btnGrava.Enabled ) )  ;

  btnIncSer.Enabled     := ( ( edcodrot.Text <> '' )                     and ( btnGrava.Enabled ) )  ;
  btnExcSer.Enabled     := ( ( Not dbgroteiro.DataSource.DataSet.Eof )   and ( btnGrava.Enabled ) )  ;

  edcodser.Enabled      := ( btnGrava.Enabled ) ;
  edValor.Enabled       := ( btnGrava.Enabled ) ;
  edValor.Text          := FormatCurr('R$ ###,##0.00',0) ;

  edcodrot.Enabled      := ( btnGrava.Enabled ) ;
  edQtdRot.Enabled      := ( btnGrava.Enabled ) ;
  edQtdRot.Text         := '1' ;
  edValRot.Enabled      := False;
  edTotRot.Enabled      := False;



end;

procedure Tfrmordcoleta.btnGravaExecute(Sender: TObject);
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

   PgControle.TabIndex:= 0;
   odc_codigo.SetFocus;
   RefreshGrid;
end;

procedure Tfrmordcoleta.btnIncFatClick(Sender: TObject);
Var
edCfo, edCst: String;
begin

 if nNew > 0 then begin
    nNew := GravarSub(cTabela,cPre,cPre+'codigo','X','', nNew, aCampo, frmordcoleta, dmEmp.SqlConSis, aEdits, sqlNew, dmEmp.Sqlordcoleta, odc_codigo );
 End;
 IniTransacao;
{ Rotina para guardar as informações}
 dmEmp.cliordcoletatbr.Close;
 dmEmp.Sqlordcoletatbr.Close;
 with dmEmp.Sqlordcoletatbr do
   begin
     Close;
     SQL.Text :='insert into '+U_funcao.SelSchema('ordcoletatbr')+' ( orc_cododc,  orc_codtbr,  orc_vlrrec,  orc_usuinc,  orc_datinc,  orc_horinc ) values     '+
                                                                   '(:orc_cododc, :orc_codtbr, :orc_vlrrec, :orc_usuinc, :orc_datinc, :orc_horinc )  ';

     ParamByName('orc_cododc').Text       := odc_codigo.Text ;
     ParamByName('orc_codtbr').Text       := edcodser.Text ;
     ParamByName('orc_vlrrec').AsFloat    := FormataNum( edValor.Text ) ;
     ParamByName('orc_usuinc').Text       :=  sysUsuario ;
     ParamByName('orc_datinc').AsDate     := now ;
     ParamByName('orc_horinc').Text       := TimeToStr(time) ;
     ExecSQL;
 end;
 edcodser.Clear;
 edNomSer.Clear;
 edValor.Text         := FormatCurr('R$ ###,##0.00',0);
 edcodser.SetFocus;
 RefreshGrid;

end;

procedure Tfrmordcoleta.btnIncSerClick(Sender: TObject);
Var
edCfo, edCst: String;
begin

 if nNew > 0 then begin
    nNew := GravarSub(cTabela,cPre,cPre+'codigo','X','', nNew, aCampo, frmordcoleta, dmEmp.SqlConSis, aEdits, sqlNew, dmEmp.Sqlordcoleta, odc_codigo );
 End;
 IniTransacao;
{ Rotina para guardar as informações}
 dmEmp.cliordcoletatrt.Close;
 dmEmp.Sqlordcoletatrt.Close;
 with dmEmp.Sqlordcoletatrt do
   begin
     Close;
     SQL.Text :='insert into '+U_funcao.SelSchema('ordcoletatrt')+' ( otr_cododc,  otr_codrto,  otr_vlrrot,  otr_qtdrot,  otr_usuinc,  otr_datinc,  otr_horinc ) values     '+
                                                                   '(:otr_cododc, :otr_codrto, :otr_vlrrot, :otr_qtdrot, :otr_usuinc, :otr_datinc, :otr_horinc )  ';

     ParamByName('otr_cododc').Text       := odc_codigo.Text ;
     ParamByName('otr_codrto').Text       := edcodrot.Text ;
     ParamByName('otr_vlrrot').AsFloat    := FormataNum( edValRot.Text ) ;
     ParamByName('otr_qtdrot').AsFloat    := FormataNum( edQtdRot.Text ) ;
     ParamByName('otr_usuinc').Text       :=  sysUsuario ;
     ParamByName('otr_datinc').AsDate     := now ;
     ParamByName('otr_horinc').Text       := TimeToStr(time) ;
     ExecSQL;
 end;
 edcodrot.Clear;
 edNomrot.Clear;
 edQtdRot.Text := '1';
 edValRot.Text := FormatCurr('R$ ###,##0.00',0);
 edTotRot.Text := FormatCurr('R$ ###,##0.00',0);
 edcodrot.SetFocus;
 RefreshGrid;


end;

procedure Tfrmordcoleta.btnIniExecute(Sender: TObject);
begin
  navegacao(1);
end;

procedure Tfrmordcoleta.btnNovoExecute(Sender: TObject);
begin
   PgControle.TabIndex := 0;
   acampo := 1;
   nNew   := acampo;
   btnGrava.Enabled := True;
   RefreshDados('S');
   limpaget;
   ativaButoes(1);
   lMostra := False;
   ativaget;
   RefreshGrid;
   odc_datems.SetFocus;
end;

procedure Tfrmordcoleta.btnProxExecute(Sender: TObject);
begin
  navegacao(3);
end;

procedure Tfrmordcoleta.btnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure Tfrmordcoleta.btnUltExecute(Sender: TObject);
begin
  navegacao(4);
end;




procedure Tfrmordcoleta.edCodRotExit(Sender: TObject);
begin
  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela := dmemp.sqlroteiro ;
  edNomrot.Text      := Pesquisa.Relacao('roteiro',edCodRot,'rto_codigo','rto_nome') ;
  if edCodRot.Text <> '' then
     edValrot.Text      := FormatCurr('R$ ###,##0.00', StrToFloat( Pesquisa.Relacao('roteiro',edCodRot,'rto_codigo','rto_vlrrot') )) ;
  btninc;

end;

procedure Tfrmordcoleta.edCodRotKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      edCodRotRightButtonClick(Self);
  end;
Finally

End
end;

procedure Tfrmordcoleta.edCodRotRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsroteiro ;
  Pesquisa.sqlTabela :=  dmEmp.sqlroteiro ;
  Pesquisa.cliTabela :=  dmEmp.cliroteiro ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Roteiro/Serviços';
  Pesquisa.nmTabela  := 'roteiro' ;
  Pesquisa.NovoCad   := 'roteiro' ;
  //Pesquisa.QuerySql  := ' sgm_codigo = '+mit_codsgm.Text ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('rto_codigo','Código'             ,'rto_codigo' ,5  ,'por Código'   );
  Pesquisa.AddReg('rto_nome'  ,'Roteiro/Serviço'    ,'rto_nome'   ,40 ,'por Roteiro'  );
  Pesquisa.AddReg('rto_vlrrot','Valor'              ,'rto_vlrrot' ,15 ,'por Valor'    );


  Pesquisa.acessa(edCodSer);
  edCodRot.text   :=  Pesquisa.RecReg('rto_codigo');
  edNomRot.text   :=  Pesquisa.RecReg('rto_nome');
  Pesquisa.Destroy;

end;

procedure Tfrmordcoleta.dbgrecursosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    if gdFocused in State then  begin
      dbgrecursos.Canvas.Brush.Color  := Azul_Escuro;
      dbgrecursos.Canvas.Font.Color   := Branco;
      dbgrecursos.Canvas.FillRect(Rect);
      dbgrecursos.DefaultDrawDataCell(Rect, Column.Field, State);
    end else begin

        if Odd(dbgrecursos.DataSource.DataSet.RecNo) then begin
          dbgrecursos.Canvas.Brush.Color  := Branco;
          dbgrecursos.Canvas.Font.Color   := Preto;
          dbgrecursos.Canvas.FillRect(Rect);
          dbgrecursos.DefaultDrawDataCell(Rect, Column.Field, State);

        End else Begin
          dbgrecursos.Canvas.Brush.Color  := Cinza_Sintilante;
          dbgrecursos.Canvas.Font.Color   := Preto;
          dbgrecursos.Canvas.FillRect(Rect);
          dbgrecursos.DefaultDrawDataCell(Rect, Column.Field, State);
        End;

    end;

end;

procedure Tfrmordcoleta.dbgroteiroDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    if gdFocused in State then  begin
      dbgroteiro.Canvas.Brush.Color  := Azul_Escuro;
      dbgroteiro.Canvas.Font.Color   := Branco;
      dbgroteiro.Canvas.FillRect(Rect);
      dbgroteiro.DefaultDrawDataCell(Rect, Column.Field, State);
    end else begin

        if Odd(dbgroteiro.DataSource.DataSet.RecNo) then begin
          dbgroteiro.Canvas.Brush.Color  := Branco;
          dbgroteiro.Canvas.Font.Color   := Preto;
          dbgroteiro.Canvas.FillRect(Rect);
          dbgroteiro.DefaultDrawDataCell(Rect, Column.Field, State);

        End else Begin
          dbgroteiro.Canvas.Brush.Color  := Cinza_Sintilante;
          dbgroteiro.Canvas.Font.Color   := Preto;
          dbgroteiro.Canvas.FillRect(Rect);
          dbgroteiro.DefaultDrawDataCell(Rect, Column.Field, State);
        End;

    end;

end;

procedure Tfrmordcoleta.edCodSerExit(Sender: TObject);
begin
  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqltbrecurso ;
  edNomSer.Text      :=  Pesquisa.Relacao('tbrecurso',edCodSer,'tbr_codigo','tbr_nome') ;
  if edCodSer.Text <> '' then
     edValor.Text       := FormatCurr('R$ ###,##0.00', StrToFloat( Pesquisa.Relacao('tbrecurso',edCodSer,'tbr_codigo','tbr_vlrrec') )) ;
  btninc;

end;

procedure Tfrmordcoleta.edCodSerKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      edCodSerRightButtonClick(Self);
  end;
Finally

End
end;

procedure Tfrmordcoleta.edCodSerRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dstbrecurso ;
  Pesquisa.sqlTabela :=  dmEmp.sqltbrecurso ;
  Pesquisa.cliTabela :=  dmEmp.clitbrecurso ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Recursos Financeiros';
  Pesquisa.nmTabela  := 'tbrecurso' ;
  Pesquisa.NovoCad   := 'tbrecurso' ;
  //Pesquisa.QuerySql  := ' sgm_codigo = '+mit_codsgm.Text ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('tbr_codigo','Código'             ,'tbr_codigo' ,5  ,'por Código'   );
  Pesquisa.AddReg('tbr_nome'  ,'Recurso'            ,'tbr_nome'   ,40 ,'por Recruso'  );
  Pesquisa.AddReg('tbr_vlrrec','Valor'              ,'tbr_vlrrec' ,15 ,'por Valor'    );


  Pesquisa.acessa(edCodSer);
  edCodSer.text   :=  Pesquisa.RecReg('tbr_codigo');
  edNomSer.text   :=  Pesquisa.RecReg('tbr_nome');
  Pesquisa.Destroy;

end;

procedure Tfrmordcoleta.edQtdRotChange(Sender: TObject);
begin
  edTotRot.Text := FormatCurr('R$ ###,##0.00', ( FormataNum( edValRot.Text ) * FormataNum(edQtdRot.Text) ) )
end;

procedure Tfrmordcoleta.edValorKeyPress(Sender: TObject; var Key: Char);
begin
  KeyValor( Sender, Key );
end;

procedure Tfrmordcoleta.odc_codcliExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela  :=  dmEmp.sqlcliente ;
  edNomCli.Text       :=  Pesquisa.Relacao('cliente',odc_codcli,'cli_codigo','cli_nome'  );

end;

procedure Tfrmordcoleta.odc_codcliKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      odc_codcliRightButtonClick(Self);
  end;
Finally

End;
end;

procedure Tfrmordcoleta.odc_codcliRightButtonClick(Sender: TObject);
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
  Pesquisa.nmTabela  := 'cliente' ;
  Pesquisa.NovoCad   := 'cliente' ;
  // Display        campo   cabecalho               get         tan  indices
  Pesquisa.AddReg('cli_codigo' ,'Código'             ,'odc_codcli'  , 5 ,'por Código'    );
  Pesquisa.AddReg('cli_cpfcnpj','CPF/CNPJ'           ,'cli_cpfcnpj' ,10 ,'por CPF/CNPJ'  );
  Pesquisa.AddReg('cli_nome'   ,'Nome do Cliente'    ,'cli_nome'    ,30 ,'por Nome'      );

  Pesquisa.acessa(odc_codcli);
  odc_codcli.text   :=  Pesquisa.RecReg('cli_codigo');
  edNomCli.text     :=  Pesquisa.RecReg('cli_nome');
  Pesquisa.Destroy;


end;






initialization
  RegisterClass(Tfrmordcoleta);


end.
