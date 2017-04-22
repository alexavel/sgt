unit U_transfin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, ImgList, ExtCtrls, ComCtrls, xmldom,
  XMLIntf, IdHTTP, msxmldom, XMLDoc, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, ExtDlgs, RibbonLunaStyleActnCtrls,
  ToolWin, ActnMan, ActnCtrls, jpeg, edittuning, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, U_ClasseUtil,U_Classcons, ZDataset, ZDatasetUtils,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,U_ClassCad, frxClass, frxDBSet,
  Datasnap.DBClient, Datasnap.Provider, ZAbstractRODataset, ZAbstractDataset,
  System.ImageList, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;


type
  TfrmTransfin = class(TForm)
    StatusBar1: TStatusBar;
    Banner: TPanel;
    imgLogo: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    grbTransfin: TGroupBox;
    Label1: TLabel;
    tff_codigo: TButtonedEdit;
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
    tff_dattff: TDateTimePicker;
    Label27: TLabel;
    tff_obs: TEdit;
    Label6: TLabel;
    tff_vlrtff: TMaskEdit;
    Label7: TLabel;
    grbD: TGroupBox;
    Label4: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    tff_codctd: TButtonedEdit;
    edNomBcoD: TEdit;
    edNomAgeD: TEdit;
    edNomCtcD: TEdit;
    edSaldoD: TEdit;
    Label8: TLabel;
    grbC: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    tff_codctc: TButtonedEdit;
    edNomBcoC: TEdit;
    edNomAgeC: TEdit;
    edNomCtcC: TEdit;
    edSaldoC: TEdit;
    comptransfin: TfrxReport;
    Config: TfrxDBDataset;
    transfin: TfrxDBDataset;
    tff_tipdoc: TComboBox;
    Label47: TLabel;
    tff_horent: TMaskEdit;
    Label24: TLabel;
    tff_numtff: TEdit;
    Label14: TLabel;
    btnImprime: TAction;
    SpeedButton11: TSpeedButton;
    dspTrans: TDataSetProvider;
    cliTrans: TClientDataSet;
    dsTrans: TDataSource;
    cliTranstff_codigo: TIntegerField;
    cliTranstff_codctd: TIntegerField;
    cliTranstff_codctc: TIntegerField;
    cliTranstff_vlrtff: TFloatField;
    cliTranstff_dattff: TDateField;
    cliTranstff_numtff: TWideStringField;
    cliTranstff_usuinc: TWideStringField;
    cliTranstff_datinc: TDateField;
    cliTranstff_horinc: TWideStringField;
    cliTranstff_usualt: TWideStringField;
    cliTranstff_datalt: TDateField;
    cliTranstff_horalt: TWideStringField;
    cliTranstff_tipdoc: TWideStringField;
    cliTranstff_horent: TWideStringField;
    cliTranstff_obs: TWideStringField;
    cliTranscct_codigo: TIntegerField;
    cliTranscct_codbco: TWideStringField;
    cliTranscct_agencia: TWideStringField;
    cliTranscct_nrconta: TWideStringField;
    cliTranscct_telef1: TWideStringField;
    cliTranscct_telef2: TWideStringField;
    cliTranscct_celula: TWideStringField;
    cliTranscct_usuinc: TWideStringField;
    cliTranscct_datinc: TDateField;
    cliTranscct_horinc: TWideStringField;
    cliTranscct_usualt: TWideStringField;
    cliTranscct_datalt: TDateField;
    cliTranscct_horalt: TWideStringField;
    cliTranscct_codpcd: TWideStringField;
    cliTranscct_codpcc: TWideStringField;
    cliTransbco_codigo: TWideStringField;
    cliTransbco_nome: TWideStringField;
    cliTransbco_usuinc: TWideStringField;
    cliTransbco_datinc: TDateField;
    cliTransbco_horinc: TWideStringField;
    cliTransbco_usualt: TWideStringField;
    cliTransbco_datalt: TDateField;
    cliTransbco_horalt: TWideStringField;
    cliTranscct_codigo_1: TIntegerField;
    cliTranscct_codbco_1: TWideStringField;
    cliTranscct_agencia_1: TWideStringField;
    cliTranscct_nrconta_1: TWideStringField;
    cliTranscct_telef1_1: TWideStringField;
    cliTranscct_telef2_1: TWideStringField;
    cliTranscct_celula_1: TWideStringField;
    cliTranscct_usuinc_1: TWideStringField;
    cliTranscct_datinc_1: TDateField;
    cliTranscct_horinc_1: TWideStringField;
    cliTranscct_usualt_1: TWideStringField;
    cliTranscct_datalt_1: TDateField;
    cliTranscct_horalt_1: TWideStringField;
    cliTranscct_codpcd_1: TWideStringField;
    cliTranscct_codpcc_1: TWideStringField;
    cliTransbco_codigo_1: TWideStringField;
    cliTransbco_nome_1: TWideStringField;
    cliTransbco_usuinc_1: TWideStringField;
    cliTransbco_datinc_1: TDateField;
    cliTransbco_horinc_1: TWideStringField;
    cliTransbco_usualt_1: TWideStringField;
    cliTransbco_datalt_1: TDateField;
    cliTransbco_horalt_1: TWideStringField;
    Empresa: TfrxDBDataset;
    sqlTrans: TFDQuery;
    sqlTranstff_codigo: TIntegerField;
    sqlTranstff_codctd: TIntegerField;
    sqlTranstff_codctc: TIntegerField;
    sqlTranstff_tipdoc: TWideStringField;
    sqlTranstff_horent: TWideStringField;
    sqlTranstff_vlrtff: TBCDField;
    sqlTranstff_dattff: TDateField;
    sqlTranstff_numtff: TWideStringField;
    sqlTranstff_obs: TWideStringField;
    sqlTranstff_usuinc: TWideStringField;
    sqlTranstff_datinc: TDateField;
    sqlTranstff_horinc: TWideStringField;
    sqlTranstff_usualt: TWideStringField;
    sqlTranstff_datalt: TDateField;
    sqlTranstff_horalt: TWideStringField;
    sqlTranscct_codigo: TIntegerField;
    sqlTranscct_codbco: TWideStringField;
    sqlTranscct_agencia: TWideStringField;
    sqlTranscct_nrconta: TWideStringField;
    sqlTranscct_codpcd: TWideStringField;
    sqlTranscct_codpcc: TWideStringField;
    sqlTranscct_telef1: TWideStringField;
    sqlTranscct_telef2: TWideStringField;
    sqlTranscct_celula: TWideStringField;
    sqlTranscct_usuinc: TWideStringField;
    sqlTranscct_datinc: TDateField;
    sqlTranscct_horinc: TWideStringField;
    sqlTranscct_usualt: TWideStringField;
    sqlTranscct_datalt: TDateField;
    sqlTranscct_horalt: TWideStringField;
    sqlTransbco_codigo: TWideStringField;
    sqlTransbco_nome: TWideStringField;
    sqlTransbco_usuinc: TWideStringField;
    sqlTransbco_datinc: TDateField;
    sqlTransbco_horinc: TWideStringField;
    sqlTransbco_usualt: TWideStringField;
    sqlTransbco_datalt: TDateField;
    sqlTransbco_horalt: TWideStringField;
    sqlTranscct_codigo_1: TIntegerField;
    sqlTranscct_codbco_1: TWideStringField;
    sqlTranscct_agencia_1: TWideStringField;
    sqlTranscct_nrconta_1: TWideStringField;
    sqlTranscct_codpcd_1: TWideStringField;
    sqlTranscct_codpcc_1: TWideStringField;
    sqlTranscct_telef1_1: TWideStringField;
    sqlTranscct_telef2_1: TWideStringField;
    sqlTranscct_celula_1: TWideStringField;
    sqlTranscct_usuinc_1: TWideStringField;
    sqlTranscct_datinc_1: TDateField;
    sqlTranscct_horinc_1: TWideStringField;
    sqlTranscct_usualt_1: TWideStringField;
    sqlTranscct_datalt_1: TDateField;
    sqlTranscct_horalt_1: TWideStringField;
    sqlTransbco_codigo_1: TWideStringField;
    sqlTransbco_nome_1: TWideStringField;
    sqlTransbco_usuinc_1: TWideStringField;
    sqlTransbco_datinc_1: TDateField;
    sqlTransbco_horinc_1: TWideStringField;
    sqlTransbco_usualt_1: TWideStringField;
    sqlTransbco_datalt_1: TDateField;
    sqlTransbco_horalt_1: TWideStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure RefreshDialog;
    Procedure RefreshDados(tipo: String);
    procedure tff_codigoExit(Sender: TObject);
    procedure tff_codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tff_codigoRightButtonClick(Sender: TObject);
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
    procedure tff_codctdRightButtonClick(Sender: TObject);
    procedure tff_codctdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tff_codctdExit(Sender: TObject);
    procedure tff_vlrtffKeyPress(Sender: TObject; var Key: Char);
    procedure tff_codctcRightButtonClick(Sender: TObject);
    procedure tff_codctcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tff_codctcExit(Sender: TObject);
    procedure tff_horentExit(Sender: TObject);
    procedure btnImprimeExecute(Sender: TObject);
  private
    { Private declarations }
    wEmpresa, wUsuInc, wHorInc, wUsuAlt, wHorAlt : string ;
    wDatInc, wDatAlt : Tdate;
    nNew, nRecno:  Integer;
  public
    acampo: integer;
    aberto, lMostra: Boolean;
    Util: TClasseUtil;
    Pesquisa : TClasConsulta;
    sqlNew    : TFDQuery;
    aEdits : TArrayComp;
    cPre, cTabela: String;

    { Public declarations }
  end;

var
  frmTransfin: TfrmTransfin;
  modConsulta, nOrdem : integer;


implementation

uses  UCalculadora,  u_DmEmp, uSistema, U_funcao, U_CnpjClass;

{$R *.dfm}

procedure TfrmTransfin.tff_codctcExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlccorrente ;
  edNomBcoC.Text :=  Pesquisa.Relacao('ccorrente',tff_codctc,'cct_codigo','bco_nome');
  edNomAgeC.Text :=  Pesquisa.Relacao('ccorrente',tff_codctc,'cct_codigo','cct_agencia');
  edNomCtcC.Text :=  Pesquisa.Relacao('ccorrente',tff_codctc,'cct_codigo','cct_nrconta');
  edSaldoC.Text  :=  FormatCurr( 'R$ ###,##0.00', StrToFloat(  Pesquisa.Relacao('ccorrente',tff_codctc,'cct_codigo','abc_vlratu') ) ) ;

end;

procedure TfrmTransfin.tff_codctcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      tff_codctcRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmTransfin.tff_codctcRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsccorrente ;
  Pesquisa.sqlTabela :=  dmEmp.sqlccorrente ;
  Pesquisa.cliTabela :=  dmEmp.cliccorrente ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Conta Corrente';
  Pesquisa.nmTabela  := 'ccorrente' ;
  Pesquisa.QuerySql  := ' cxa_codusu = '+ IntToStr( sysCodusu )+' and cct_codigo <> '+fIIF( tff_codctd.Text = '','0', tff_codctd.Text );
  //Pesquisa.NovoCad   := 'Banco' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('cct_codigo'  ,'Cd Conta'      ,'cct_codcct' ,5  ,'por Código' );
  Pesquisa.AddReg('cct_codbco'  ,'Nr Banco'      ,'edCodBco'   ,5  ,'por Nr Banco' );
  Pesquisa.AddReg('bco_nome'    ,'Banco'         ,'edNomBco'   ,25 ,'por Banco' );
  Pesquisa.AddReg('cct_agencia' ,'Agencia'       ,'edNomAge'   ,6  ,'por Agencia' );
  Pesquisa.AddReg('cct_nrconta' ,'Nr Conta'      ,'edNomCta'   ,6  ,'por Conta' );

  Pesquisa.acessa(tff_codctc);
  tff_codctc.text   :=  Pesquisa.RecReg('cct_codigo');
  Pesquisa.Destroy;

 end;


procedure TfrmTransfin.tff_codctdExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlccorrente ;
  edNomBcoD.Text :=  Pesquisa.Relacao('ccorrente',tff_codctd,'cct_codigo','bco_nome');
  edNomAgeD.Text :=  Pesquisa.Relacao('ccorrente',tff_codctd,'cct_codigo','cct_agencia');
  edNomCtcD.Text :=  Pesquisa.Relacao('ccorrente',tff_codctd,'cct_codigo','cct_nrconta');
  edSaldoD.Text  :=  FormatCurr( 'R$ ###,##0.00', StrToFloat(  Pesquisa.Relacao('ccorrente',tff_codctd,'cct_codigo','abc_vlratu') ) )  ;

end;

procedure TfrmTransfin.tff_codctdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      tff_codctdRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmTransfin.tff_codctdRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsccorrente ;
  Pesquisa.sqlTabela :=  dmEmp.sqlccorrente ;
  Pesquisa.cliTabela :=  dmEmp.cliccorrente ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Conta Corrente';
  Pesquisa.nmTabela  := 'ccorrente' ;
  Pesquisa.QuerySql  := ' cxa_codusu = '+ IntToStr( sysCodusu )+' and cct_codigo <> '+fIIF( tff_codctc.Text = '','0', tff_codctc.Text );
  //Pesquisa.NovoCad   := 'Banco' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('cct_codigo'  ,'Cd Conta'      ,'cct_codcct' ,5  ,'por Código' );
  Pesquisa.AddReg('cct_codbco'  ,'Nr Banco'      ,'edCodBco'   ,5  ,'por Nr Banco' );
  Pesquisa.AddReg('bco_nome'    ,'Banco'         ,'edNomBco'   ,25 ,'por Banco' );
  Pesquisa.AddReg('cct_agencia' ,'Agencia'       ,'edNomAge'   ,6  ,'por Agencia' );
  Pesquisa.AddReg('cct_nrconta' ,'Nr Conta'      ,'edNomCta'   ,6  ,'por Conta' );

  Pesquisa.acessa(tff_codctd);
  tff_codctd.text   :=  Pesquisa.RecReg('cct_codigo');
  Pesquisa.Destroy;

 end;

procedure TfrmTransfin.tff_codigoExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados

  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqltransfin ;
 //tff_nome.Text :=  Pesquisa.Relacao('transfin',tff_codigo,'tff_codigo','tff_nome');
  navegacao(5);

end;

procedure TfrmTransfin.tff_codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END    : tff_codigoRightButtonClick(Self);
    VK_UP     : navegacao(1);
    VK_LEFT   : navegacao(2);
    VK_RIGHT  : navegacao(3);
    VK_DOWN   : navegacao(4);

  end;
Finally

End;

end;

procedure TfrmTransfin.tff_codigoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
if btnGrava.Enabled then
   Exit;

  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dstransfin ;
  Pesquisa.sqlTabela :=  dmEmp.sqltransfin ;
  Pesquisa.cliTabela :=  dmEmp.clitransfin ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Transferêmcia Financeiro';
  Pesquisa.nmTabela  := 'transfin';
//  Pesquisa.NovoCad   := 'transfin' ;
  // Display        campo   cabecalho                     get         tan  indices
  Pesquisa.AddReg('tff_codigo'    ,'Código'                 ,'tff_codigo'   , 5  ,'por Código'        );
  Pesquisa.AddReg('tff_dattff'    ,'Data'                   ,'tff_dattff'   , 7  ,'por Data'          );
  Pesquisa.AddReg('tff_numtff'    ,'Nr Controle'            ,'tff_numtff'   , 8  ,'por Controle'      );
  Pesquisa.AddReg('db.bco_nome'   ,'Banco Débito'           ,'db.bco_nome'  ,15  ,'por Nr Bnaco Deb'  );
  Pesquisa.AddReg('d.cct_agencia' ,'Agencia'                ,'tff_agencia'  , 9  ,'por Agencia Deb'   );
  Pesquisa.AddReg('d.cct_nrconta' ,'Nº da Conta'            ,'tff_nrconta'  , 9  ,'por Nr Conta Deb'  );
  Pesquisa.AddReg('dc.bco_nome'   ,'Banco Crédito'          ,'db.bco_nome'  ,15  ,'por Nr Bnaco Cre'  );
  Pesquisa.AddReg('c.cct_agencia' ,'Agencia'                ,'tff_agencia'  , 9  ,'por Agencia Cre'   );
  Pesquisa.AddReg('c.cct_nrconta' ,'Nº da Conta'            ,'tff_nrconta'  , 9  ,'por Nr Conta Cre'  );
  Pesquisa.AddReg('tff_vlrtff'    ,'Valor'                  ,'tff_vlrtff'   ,10  ,'por Valor'         );


  Pesquisa.acessa(tff_codigo);
  tff_codigo.text   :=  Pesquisa.RecReg('tff_codigo');
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


procedure TfrmTransfin.tff_horentExit(Sender: TObject);
begin
  ChkHora( Sender );
end;

procedure TfrmTransfin.tff_vlrtffKeyPress(Sender: TObject; var Key: Char);
begin
  KeyValor(Sender, Key);
end;

procedure TfrmTransfin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sqlNew.Close;
    dmEmp.clitransfin.Close;
    frmtransfin                 := nil ;
    action                       := cafree;
    fPrincipal.btntransfin.Enabled := True;
end;



procedure TfrmTransfin.FormCreate(Sender: TObject);
Var
i: Integer;
begin
  cPre                        := 'tff_';
  cTabela                     := 'transfin';
  acampo                      := 1;
  sqlNew                      := TFDQuery.Create(nil);
  sqlNew.Connection           := dmemp.SqlConSis;
  fPrincipal.btntransfin.Enabled  := False;
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;
end;

procedure TfrmTransfin.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmTransfin.FormShow(Sender: TObject);
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
  lbCabeca01.Caption    := 'Transferência Financeiro';
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

end;

procedure TfrmTransfin.gravadados;
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, ctip_horalt,cCodSql, cIteSql,cValSql,cCodMnt : string ;
dData, dtip_datalt : TDate ;
i, tmp: Integer;
SQLQ : TFDQuery ;

begin
   gravadados2(cTabela,cPre,cPre+'codigo','X','', nNew, frmtransfin, dmEmp.SqlConSis, aEdits );
end;

procedure TfrmTransfin.limpaget;
Var
i: Integer;
begin
  limpaget2(aEdits);
end;

procedure TfrmTransfin.navegacao(Ord: Integer);
begin
  if btnGrava.Enabled then
     Exit;

  navegacao2( Ord, acampo, btnIni, btnAnt, btnProx, btnUlt, sqlNew, dmEmp.sqltransfin, tff_codigo,'' );
  acampo := 0;
  RefreshDialog2(cPre,acampo, frmtransfin, sqlNew, aEdits);
  acampo := 1;
end;

procedure TfrmTransfin.RefreshDados(tipo: String);
var
  i: integer;
  cWhere, cQuery, cOrder: String;

begin
  RefreshDados2(acampo, tipo,'', tff_codigo, sqlNew, dmEmp.sqltransfin );
end;

procedure TfrmTransfin.RefreshDialog;
var
  i, tmp: Integer;
  frmx : TForm ;
begin
  RefreshDialog2(cPre,acampo, frmtransfin, sqlNew, aEdits);
end;


procedure TfrmTransfin.ToolButton9Click(Sender: TObject);
begin
  frmCalculadora := TfrmCalculadora.Create(Self);
  frmCalculadora.Show;

end;

procedure TfrmTransfin.ativaButoes(tipo:Integer);
begin
  ativaButoes2(Tipo,  btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt, sqlNew);
  btnImprime.Enabled := ( Not sqlNew.Eof );
end;

procedure TfrmTransfin.ativaget;
begin
  ativaget2(aEdits,cPre+'codigo',cTabela, btnGrava.Enabled, lMostra );
end;

procedure TfrmTransfin.btnAlterarExecute(Sender: TObject);
begin
   {
   btnNovo.Enabled    := False;
   btnAlterar.Enabled := False;
   btnGrava.Enabled   := True;
   ativaButoes(1);
   lMostra := True;
   ativaget;
   RefreshDialog;
   tff_dattff.SetFocus;
   acampo := 0;
   nNew   := acampo;
   navegacao(0);
   }
  ShowMessage('Não é possivel alterar');

end;

procedure TfrmTransfin.btnAntExecute(Sender: TObject);
begin
  navegacao(2);
end;

procedure TfrmTransfin.btnCancelaExecute(Sender: TObject);
begin
   acampo := 1;
   nNew             := acampo;
   btnNovo.Enabled  := True;
   btnGrava.Enabled := False;
   RefreshDados('T');
   ativaButoes(1);
   lMostra := True;
   ativaget;
   navegacao(4);
   tff_codigo.SetFocus;

end;

procedure TfrmTransfin.btnExcluirExecute(Sender: TObject);
Var
aSubTab : TArrayDim2;
n: Integer;
begin
{
   //SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'acessoratv';     aSubTab[n][1] := '';
   If Exclui2(cTabela, aSubTab,  tff_codigo, btnExcluir) Then Begin;
       RefreshDados('T');
       ativaButoes(1);
       limpaget;
       lMostra := True;
       ativaget;
       navegacao(4);
       acampo := 1;
       nNew   := acampo;
   End;
   }
  ShowMessage('Não é possivel Excluir');
end;

procedure TfrmTransfin.btnGravaExecute(Sender: TObject);
Var
i: Integer;
zQry,xQry, qSql1, qSql2  : TFDQuery;
cOpe : String;
begin
    // Realizando transferencias
    IniTransacao;

    // Pega dados da abertura de Débito
    qSql1 := TFDQuery.Create(Nil);
    qSql1.Connection := dmemp.SqlConSis;
    qSql1.Close;
    qSql1.SQL.Text := ' Select * From  '+U_funcao.SelSchema('abrcaixa')+
                              ' LEFT Join  '+U_funcao.SelSchema('caixa')+'  on cxa_codigo = abc_codcxa '+
                              ' LEFT Join  '+U_funcao.SelSchema('ccorrente')+'  on cct_codigo = cxa_codcct '+
                              ' LEFT Join  '+U_funcao.SelSchema('banco')+'  on bco_codigo = cct_codbco '+
                              ' LEFT Join  '+U_funcao.SelSchema('usuario')+'  on usu_codusu = cxa_codusu '+
                      ' where abc_codcct = '+tff_codctd.Text+
                      ' And   abc_databr = ( Select max( abc_databr ) From  '+U_funcao.SelSchema('abrcaixa')+'  ) '+
                      ' And   abc_datfch is NULL ';
    qSql1.Open;
    if qSql1.IsEmpty then begin
       ShowMessage('Caixa da conta de Débito Fechado');
       exit;
    end;

    // Pega dados da abertura de Credito
    qSql2 := TFDQuery.Create(Nil);
    qSql2.Connection := dmemp.SqlConSis;
    qSql2.Close;
    qSql2.SQL.Text := ' Select * From  '+U_funcao.SelSchema('abrcaixa')+
                              ' LEFT Join  '+U_funcao.SelSchema('caixa')+'  on cxa_codigo = abc_codcxa '+
                              ' LEFT Join  '+U_funcao.SelSchema('ccorrente')+'  on cct_codigo = cxa_codcct '+
                              ' LEFT Join  '+U_funcao.SelSchema('banco')+'  on bco_codigo = cct_codbco '+
                              ' LEFT Join  '+U_funcao.SelSchema('usuario')+'  on usu_codusu = cxa_codusu '+
                      ' where abc_codcct = '+tff_codctc.Text+
                      ' And   abc_databr = ( Select max( abc_databr ) From  '+U_funcao.SelSchema('abrcaixa')+'  ) '+
                      ' And   abc_datfch is NULL ';
    qSql2.Open;
    if qSql2.IsEmpty then begin
       ShowMessage('Caixa da conta de Crédoto Fechado');
       exit;
    end;

    zQry := TFDQuery.Create(Nil);
    zQry.Connection := dmEmp.SqlConSis;

    xQry := TFDQuery.Create(Nil);
    xQry.Connection := dmEmp.SqlConSis;

    // Alimenta os valores do caixa de debitos
    zQry.Close;
    zQry.SQL.Text   := 'update '+U_funcao.SelSchema('abrcaixa')+
                       ' Set  abc_vlratu = :abc_vlratu,  abc_usualt = :abc_usualt,  abc_datalt = :abc_datalt,  abc_horalt = :abc_horalt '+
                       ' where abc_codigo = '+qSql1.FieldByName('abc_codigo').Text;
    zQry.ParamByName('abc_vlratu').AsFloat := qSql1.FieldByName('abc_vlratu').AsFloat - RetMoeda( tff_vlrtff.Text );
    zQry.ParamByName('abc_usualt').Text    :=  sysUsuario;
    zQry.ParamByName('abc_datalt').AsDate  := Now;
    zQry.ParamByName('abc_horalt').Text    := TimeToStr(Now);
    zQry.ExecSQL;

    // fazendo lançamento na movimentação do caixa Débito
    zQry.Close;
    zQry.SQL.Text   := 'Insert Into '+U_funcao.SelSchema('abrcxamov')+
                                    '( abm_codabc, abm_codcxa, abm_datmov, abm_hormov, abm_tipdoc, abm_descri, abm_numdoc, '+
                                    ' abm_vlrlan, abm_vlrant, abm_vlratu, abm_usuinc, abm_datinc, abm_horinc, abm_usualt, abm_datalt, abm_horalt ) Values  '+
                                    '( :abm_codabc, :abm_codcxa, :abm_datmov, :abm_hormov, :abm_tipdoc, :abm_descri, :abm_numdoc,'+
                                    ' :abm_vlrlan, :abm_vlrant, :abm_vlratu, :abm_usuinc, :abm_datinc, :abm_horinc, :abm_usualt, :abm_datalt, :abm_horalt ) ';
    zQry.ParamByName('abm_codabc').Text     := qSql1.FieldByName('abc_codigo').Text;
    zQry.ParamByName('abm_codcxa').Text     := qSql1.FieldByName('abc_codcxa').Text;
    zQry.ParamByName('abm_numdoc').Text     := tff_numtff.Text;
    zQry.ParamByName('abm_datmov').AsDate   := Now;
    zQry.ParamByName('abm_hormov').Text     := TimeToStr(Now);
    zQry.ParamByName('abm_tipdoc').Text     := 'D';
    zQry.ParamByName('abm_descri').Text     := 'DÉBITO TRANSF. ENTRE CONTAS: '+tff_codctd.Text+' p/ '+tff_codctc.Text;
    zQry.ParamByName('abm_vlrlan').AsFloat  := RetMoeda( tff_vlrtff.Text );
    zQry.ParamByName('abm_vlrant').AsFloat  := qSql1.FieldByName('abc_vlratu').AsFloat;
    zQry.ParamByName('abm_vlratu').AsFloat  := qSql1.FieldByName('abc_vlratu').AsFloat - RetMoeda( tff_vlrtff.Text );
    zQry.ParamByName('abm_usuinc').Text     := TimeToStr(Now);
    zQry.ParamByName('abm_UsuAlt').Text     :=  sysUsuario;
    zQry.ParamByName('abm_DatAlt').AsDate   := Now;
    zQry.ParamByName('abm_HorAlt').Text     := TimeToStr(Now);
    zQry.ParamByName('abm_usuinc').Text     :=  sysUsuario;
    zQry.ParamByName('abm_datinc').AsDate   := Now;
    zQry.ParamByName('abm_horinc').Text     := TimeToStr(Now);
    zQry.ExecSQL;

    // Alimenta os valores do caixa de debitos
    zQry.Close;
    zQry.SQL.Text   := 'update '+U_funcao.SelSchema('abrcaixa')+
                       ' Set  abc_vlratu = :abc_vlratu,  abc_usualt = :abc_usualt,  abc_datalt = :abc_datalt,  abc_horalt = :abc_horalt '+
                       ' where abc_codigo = '+qSql2.FieldByName('abc_codigo').Text;
    zQry.ParamByName('abc_vlratu').AsFloat := qSql2.FieldByName('abc_vlratu').AsFloat + RetMoeda( tff_vlrtff.Text );
    zQry.ParamByName('abc_usualt').Text    :=  sysUsuario;
    zQry.ParamByName('abc_datalt').AsDate  := Now;
    zQry.ParamByName('abc_horalt').Text    := TimeToStr(Now);
    zQry.ExecSQL;

    // fazendo lançamento na movimentação do caixa Débito
    zQry.Close;
    zQry.SQL.Text   := 'Insert Into '+U_funcao.SelSchema('abrcxamov')+
                                    '( abm_codabc, abm_codcxa, abm_datmov, abm_hormov, abm_tipdoc, abm_descri, abm_numdoc, '+
                                    ' abm_vlrlan, abm_vlrant, abm_vlratu, abm_usuinc, abm_datinc, abm_horinc, abm_usualt, abm_datalt, abm_horalt ) Values  '+
                                    '( :abm_codabc, :abm_codcxa, :abm_datmov, :abm_hormov, :abm_tipdoc, :abm_descri, :abm_numdoc,'+
                                    ' :abm_vlrlan, :abm_vlrant, :abm_vlratu, :abm_usuinc, :abm_datinc, :abm_horinc, :abm_usualt, :abm_datalt, :abm_horalt ) ';
    zQry.ParamByName('abm_codabc').Text     := qSql2.FieldByName('abc_codigo').Text;
    zQry.ParamByName('abm_codcxa').Text     := qSql2.FieldByName('abc_codcxa').Text;
    zQry.ParamByName('abm_numdoc').Text     := tff_numtff.Text;
    zQry.ParamByName('abm_datmov').AsDate   := Now;
    zQry.ParamByName('abm_hormov').Text     := TimeToStr(Now);
    zQry.ParamByName('abm_tipdoc').Text     := 'C';
    zQry.ParamByName('abm_descri').Text     := 'CRÉDITO TRANSF. ENTRE CONTAS: '+tff_codctd.Text+' p/ '+tff_codctc.Text;
    zQry.ParamByName('abm_vlrlan').AsFloat  := RetMoeda( tff_vlrtff.Text );
    zQry.ParamByName('abm_vlrant').AsFloat  := qSql2.FieldByName('abc_vlratu').AsFloat;
    zQry.ParamByName('abm_vlratu').AsFloat  := qSql2.FieldByName('abc_vlratu').AsFloat + RetMoeda( tff_vlrtff.Text );
    zQry.ParamByName('abm_usuinc').Text     := TimeToStr(Now);
    zQry.ParamByName('abm_UsuAlt').Text     :=  sysUsuario;
    zQry.ParamByName('abm_DatAlt').AsDate   := Now;
    zQry.ParamByName('abm_HorAlt').Text     := TimeToStr(Now);
    zQry.ParamByName('abm_usuinc').Text     :=  sysUsuario;
    zQry.ParamByName('abm_datinc').AsDate   := Now;
    zQry.ParamByName('abm_horinc').Text     := TimeToStr(Now);
    zQry.ExecSQL;


    gravadados;
    if FechaSubFrm(cTabela) then Close;

    FimTransacao;
    acampo := 1;
    nNew   := acampo;
    btnNovo.Enabled := True;
    btnGrava.Enabled:= False;
    RefreshDados('T');
    ativaButoes(0);
    lMostra := True;
    ativaget;
    Case lMostra of
        False  : navegacao(4);
        True   : navegacao(5);
    end;
    tff_codigo.SetFocus;
end;

procedure TfrmTransfin.btnImprimeExecute(Sender: TObject);
Var
sqlQry: TFDQuery;
cTitulo : String;
nTipo : Integer;
begin
  { Formulando o tipo de impressao }
  cTitulo := 'TRANSFERÊNCIA FINANCEIRA - ENTRE CONTAS' ;
  sqlTrans.Connection := dmEmp.SqlConSis;
  sqlTrans.close;
  cliTrans.Close;
  sqlTrans.SQL.Text :=' Select * from '+U_funcao.SelSchema('transfin')
                      +' LEFT JOIN '+U_funcao.SelSchema('ccorrente')+' as d on d.cct_codigo = tff_codctd '
                      +' LEFT JOIN '+U_funcao.SelSchema('banco')+' as db on db.bco_codigo = d.cct_codbco '
                      +' LEFT JOIN '+U_funcao.SelSchema('ccorrente')+' as c on c.cct_codigo = tff_codctc '
                      +' LEFT JOIN '+U_funcao.SelSchema('banco')+' as cb on cb.bco_codigo = c.cct_codbco '
                      +' where tff_codigo  = '+tff_codigo.Text;
  sqlTrans.Open;
  cliTrans.Active := True;

  // Cabeçalho do relatorio
  CabReports(comptransfin, cTitulo, 'comptransfin.fr3' );
  nTipo := 1;
  if nTipo = 3 then Begin
     comptransfin.DesignReport();
  End Else
  if nTipo = 1 then Begin
     comptransfin.ShowReport();
  End Else
  if nTipo = 2 then Begin
     comptransfin.PrepareReport;
     comptransfin.Print;
  End;
  sqlTrans.close;
  cliTrans.Close;

end;

procedure TfrmTransfin.btnIniExecute(Sender: TObject);
begin
  navegacao(1);
end;

procedure TfrmTransfin.btnNovoExecute(Sender: TObject);
begin
   acampo := 1;
   nNew   := acampo;
   btnGrava.Enabled := True;
   RefreshDados('S');
   limpaget;
   ativaButoes(1);
   lMostra := False;
   ativaget;
   tff_numtff.SetFocus;
end;

procedure TfrmTransfin.btnProxExecute(Sender: TObject);
begin
  navegacao(3);
end;

procedure TfrmTransfin.btnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmTransfin.btnUltExecute(Sender: TObject);
begin
  navegacao(4);
end;

initialization
  RegisterClass(TfrmTransfin);


end.
