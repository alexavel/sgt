unit U_PessoalInc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, ImgList, ExtCtrls, ComCtrls, xmldom,
  XMLIntf, IdHTTP, msxmldom, XMLDoc, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, ExtDlgs, RibbonLunaStyleActnCtrls,
  ToolWin, ActnMan, ActnCtrls, jpeg, edittuning, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, U_ClasseUtil,U_Classcons, ZDataset, ZDatasetUtils,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, U_ClassCad, Datasnap.DBClient,
  Datasnap.Provider, ZAbstractRODataset, ZAbstractDataset,FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList;


type
  TfrmPessoal = class(TForm)
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
    GroupBox1: TGroupBox;
    Label16: TLabel;
    pss_codcgo: TButtonedEdit;
    Label2: TLabel;
    EdNomCgo: TEdit;
    Label3: TLabel;
    pss_codltd: TButtonedEdit;
    Label1: TLabel;
    edNomLtd: TEdit;
    Label4: TLabel;
    pss_tpsangue: TEdit;
    Label11: TLabel;
    pss_sexo: TComboBox;
    Label25: TLabel;
    pss_datnas: TDateTimePicker;
    Label27: TLabel;
    btnPegaFoto: TAction;
    btnExcluiFoto: TAction;
    OpenDialog01: TOpenPictureDialog;
    GroupBox2: TGroupBox;
    pss_foto: TImage;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    Tbcomplemento: TTabSheet;
    GroupBox4: TGroupBox;
    actionsub: TActionManager;
    AcsBtnInc: TAction;
    AcsBtnExc: TAction;
    CmbBtnInc: TAction;
    cmbBtnExc: TAction;
    pss_obs: TRichEdit;
    pss_ecivil: TComboBox;
    Label20: TLabel;
    GroupBox6: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    pss_codcid: TButtonedEdit;
    pss_cep: TMaskEdit;
    pss_endereco: TEdit;
    pss_numres: TEdit;
    pss_complem: TEdit;
    pss_telef01: TMaskEdit;
    pss_telef02: TMaskEdit;
    pss_celular: TMaskEdit;
    Label9: TLabel;
    pss_bairro: TEdit;
    Label5: TLabel;
    edNomCid: TEdit;
    edNomUf: TEdit;
    edNomSig: TEdit;
    pss_tpimove: TComboBox;
    Label6: TLabel;
    pss_tpresid: TEdit;
    Label17: TLabel;
    GroupBox3: TGroupBox;
    Label29: TLabel;
    pss_rg: TEdit;
    Label26: TLabel;
    pss_rgdata: TDateTimePicker;
    pss_rgexped: TEdit;
    Label28: TLabel;
    Label30: TLabel;
    pss_habilitac: TEdit;
    pss_hbemite: TDateTimePicker;
    Label31: TLabel;
    pss_hbvalid: TDateTimePicker;
    Label32: TLabel;
    pss_nrtitulo: TEdit;
    Label33: TLabel;
    pss_nrreserv: TEdit;
    Label34: TLabel;
    pss_numctps: TEdit;
    Label35: TLabel;
    pss_pispasep: TEdit;
    Label36: TLabel;
    pss_hbcateg: TEdit;
    Label37: TLabel;
    GroupBox5: TGroupBox;
    Label38: TLabel;
    pss_nompal: TEdit;
    pss_nommae: TEdit;
    Label39: TLabel;
    TabSheet1: TTabSheet;
    GroupBox7: TGroupBox;
    Label55: TLabel;
    Label56: TLabel;
    pss_codpcv: TButtonedEdit;
    edNompcv: TEdit;
    Label40: TLabel;
    pss_email: TEdit;
    pss_status: TComboBox;
    Label41: TLabel;
    pss_vlrvale: TMaskEdit;
    Label42: TLabel;
    pss_vlrrenda: TMaskEdit;
    Label43: TLabel;
    pss_codpcr: TButtonedEdit;
    edNomPcr: TEdit;
    Label44: TLabel;
    Label45: TLabel;
    dbgDebitos: TDBGrid;
    Label46: TLabel;
    dspDb: TDataSetProvider;
    cliDb: TClientDataSet;
    dsDb: TDataSource;
    Label15: TLabel;
    pss_codigo: TButtonedEdit;
    pss_cpf: TMaskEdit;
    Label24: TLabel;
    pss_nome: TEdit;
    Label18: TLabel;
    pss_apelido: TComboBox;
    sqlDb: TFDQuery;
    sqlDbcfr_codigo: TIntegerField;
    sqlDbcfr_numdoc: TStringField;
    sqlDbcfr_codant: TIntegerField;
    sqlDbcfr_codfnd: TIntegerField;
    sqlDbcfr_codpss: TIntegerField;
    sqlDbcfr_codcli: TIntegerField;
    sqlDbcfr_codpct: TStringField;
    sqlDbcfr_descri: TStringField;
    sqlDbcfr_datems: TDateField;
    sqlDbcfr_datven: TDateField;
    sqlDbcfr_totpar: TStringField;
    sqlDbcfr_vlrapg: TBCDField;
    sqlDbcfr_vlrdes: TBCDField;
    sqlDbcfr_vlracr: TBCDField;
    sqlDbcfr_vlrtot: TBCDField;
    sqlDbcfr_period: TStringField;
    sqlDbcfr_tipdoc: TStringField;
    sqlDbcfr_usuinc: TStringField;
    sqlDbcfr_datinc: TDateField;
    sqlDbcfr_horinc: TStringField;
    sqlDbcfr_usualt: TStringField;
    sqlDbcfr_datalt: TDateField;
    sqlDbcfr_horalt: TStringField;
    sqlDbfcr_codigo: TIntegerField;
    sqlDbfcr_codcfr: TIntegerField;
    sqlDbfcr_codcxa: TIntegerField;
    sqlDbfcr_codabc: TIntegerField;
    sqlDbfcr_codcct: TIntegerField;
    sqlDbfcr_codfpg: TIntegerField;
    sqlDbfcr_datpag: TDateField;
    sqlDbfcr_datven: TDateField;
    sqlDbfcr_numpar: TStringField;
    sqlDbfcr_descri: TStringField;
    sqlDbfcr_status: TStringField;
    sqlDbfcr_tippro: TStringField;
    sqlDbfcr_vlrapg: TBCDField;
    sqlDbfcr_vlrpag: TBCDField;
    sqlDbfcr_check: TBooleanField;
    sqlDbfcr_numbol: TStringField;
    sqlDbfcr_usuinc: TStringField;
    sqlDbfcr_datinc: TDateField;
    sqlDbfcr_horinc: TStringField;
    sqlDbfcr_usualt: TStringField;
    sqlDbfcr_datalt: TDateField;
    sqlDbfcr_horalt: TStringField;
    cliDbcfr_codigo: TIntegerField;
    cliDbcfr_numdoc: TStringField;
    cliDbcfr_codant: TIntegerField;
    cliDbcfr_codfnd: TIntegerField;
    cliDbcfr_codpss: TIntegerField;
    cliDbcfr_codcli: TIntegerField;
    cliDbcfr_codpct: TStringField;
    cliDbcfr_descri: TStringField;
    cliDbcfr_datems: TDateField;
    cliDbcfr_datven: TDateField;
    cliDbcfr_totpar: TStringField;
    cliDbcfr_vlrapg: TBCDField;
    cliDbcfr_vlrdes: TBCDField;
    cliDbcfr_vlracr: TBCDField;
    cliDbcfr_vlrtot: TBCDField;
    cliDbcfr_period: TStringField;
    cliDbcfr_tipdoc: TStringField;
    cliDbcfr_usuinc: TStringField;
    cliDbcfr_datinc: TDateField;
    cliDbcfr_horinc: TStringField;
    cliDbcfr_usualt: TStringField;
    cliDbcfr_datalt: TDateField;
    cliDbcfr_horalt: TStringField;
    cliDbfcr_codigo: TIntegerField;
    cliDbfcr_codcfr: TIntegerField;
    cliDbfcr_codcxa: TIntegerField;
    cliDbfcr_codabc: TIntegerField;
    cliDbfcr_codcct: TIntegerField;
    cliDbfcr_codfpg: TIntegerField;
    cliDbfcr_datpag: TDateField;
    cliDbfcr_datven: TDateField;
    cliDbfcr_numpar: TStringField;
    cliDbfcr_descri: TStringField;
    cliDbfcr_status: TStringField;
    cliDbfcr_tippro: TStringField;
    cliDbfcr_vlrapg: TBCDField;
    cliDbfcr_vlrpag: TBCDField;
    cliDbfcr_check: TBooleanField;
    cliDbfcr_numbol: TStringField;
    cliDbfcr_usuinc: TStringField;
    cliDbfcr_datinc: TDateField;
    cliDbfcr_horinc: TStringField;
    cliDbfcr_usualt: TStringField;
    cliDbfcr_datalt: TDateField;
    cliDbfcr_horalt: TStringField;
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
    procedure pss_codigoRightButtonClick(Sender: TObject);
    procedure pss_codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pss_codigoExit(Sender: TObject);
    procedure pss_codcgoRightButtonClick(Sender: TObject);
    procedure pss_codcgoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pss_codcgoExit(Sender: TObject);
    procedure pss_codltdRightButtonClick(Sender: TObject);
    procedure pss_codltdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pss_codltdExit(Sender: TObject);
    procedure pss_codcidRightButtonClick(Sender: TObject);
    procedure pss_codcidKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPegaFotoExecute(Sender: TObject);
    procedure btnExcluiFotoExecute(Sender: TObject);
    Procedure BtnFoto;
    procedure RefreshGrid;
    procedure PgControleChange(Sender: TObject);
    procedure pss_cepExit(Sender: TObject);
    procedure pss_codcidExit(Sender: TObject);
    procedure pss_cpfExit(Sender: TObject);
    Procedure HabButFoto;
    procedure pss_vlrvaleKeyPress(Sender: TObject; var Key: Char);
    procedure pss_vlrrendaKeyPress(Sender: TObject; var Key: Char);
    procedure pss_codpcvRightButtonClick(Sender: TObject);
    procedure pss_codpcvKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pss_codpcvExit(Sender: TObject);
    procedure pss_codpcrRightButtonClick(Sender: TObject);
    procedure pss_codpcrKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pss_codpcrExit(Sender: TObject);
    procedure dbgDebitosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure pss_nomeExit(Sender: TObject);
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
  frmPessoal: TfrmPessoal;
  modConsulta, nOrdem : integer;


implementation

uses  UCalculadora,  u_DmEmp, uSistema, U_funcao, U_CnpjClass,
  U_CpfClass, U_ClassconsContas;

{$R *.dfm}

procedure TfrmPessoal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sqlNew.Close;
    dmEmp.cliPessoal.Close;
    frmPessoal                := nil ;
    action                       := cafree;
    fPrincipal.btnPessoal.Enabled := True;
end;



procedure TfrmPessoal.FormCreate(Sender: TObject);
Var
i: Integer;
begin
  cPre                        := 'pss_';
  cTabela                     := 'pessoal';
  acampo                      := 1;
  sqlNew                      := TFDQuery.Create(nil);
  sqlNew.Connection           := dmEmp.SqlConSis;
  fPrincipal.btnpessoal.Enabled  := False;
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;
end;

procedure TfrmPessoal.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmPessoal.FormShow(Sender: TObject);
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
  lbCabeca01.Caption    := 'Tabela de Veículos Ativos';
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

procedure TfrmPessoal.gravadados;
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, ctip_horalt,cCodSql, cIteSql,cValSql,cCodMnt : string ;
dData, dtip_datalt : TDate ;
i, tmp: Integer;
SQLQ : TFDQuery ;
begin
   gravadados2(cTabela,cPre,cPre+'codigo','X','', nNew, frmPessoal, dmEmp.SqlConSis, aEdits );
end;

procedure TfrmPessoal.HabButFoto;
begin
  btnPegaFoto.Enabled   := ((btnGrava.Enabled) and (    pss_foto.Picture.Graphic.Empty));
  btnExcluiFoto.Enabled := ((btnGrava.Enabled) and (Not pss_foto.Picture.Graphic.Empty));
end;

procedure TfrmPessoal.limpaget;
Var
i: Integer;
begin
  limpaget2(aEdits);
end;

procedure TfrmPessoal.pss_codcidExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlcidade ;
  edNomCid.Text :=  Pesquisa.Relacao('cidade',pss_codcid,'cid_codigo','cid_nome');
  edNomUf.Text  :=  Pesquisa.Relacao('cidade',pss_codcid,'cid_codigo','est_uf'  );

end;

procedure TfrmPessoal.pss_codcidKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      pss_codcidRightButtonClick(Self);
  end;
Finally

End;


end;

procedure TfrmPessoal.pss_codcidRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dscidade ;
  Pesquisa.sqlTabela :=  dmEmp.sqlCidade ;
  Pesquisa.cliTabela :=  dmEmp.clicidade ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Cidades';
  Pesquisa.nmTabela  := 'cidade' ;
  Pesquisa.NovoCad   := 'cidade' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('cid_codigo','Código'             ,'pss_codcid' ,5  ,'por Código' );
  Pesquisa.AddReg('cid_nome'  ,'Cidade'             ,'edNomCid'   ,25 ,'por cidade' );
  Pesquisa.AddReg('est_uf'    ,'Estado'             ,'edNomUf'    ,2  ,'por Estado' );

  Pesquisa.acessa(pss_codcid);
  pss_codcid.text   :=  Pesquisa.RecReg('cid_codigo');
  edNomCid.text     :=  Pesquisa.RecReg('cid_nome');
  edNomUf.text      :=  Pesquisa.RecReg('est_uf');
  Pesquisa.Destroy;


end;

procedure TfrmPessoal.navegacao(Ord: Integer);
begin
  if btnGrava.Enabled then
     Exit;

  navegacao2( Ord, acampo, btnIni, btnAnt, btnProx, btnUlt, sqlNew, dmEmp.sqlPessoal, pss_codigo,'' );
  acampo := 0;
  RefreshDialog2(cPre,acampo, frmPessoal, sqlNew, aEdits);
  acampo := 1;
  HabButFoto;
  RefreshGrid;
end;

procedure TfrmPessoal.PgControleChange(Sender: TObject);
begin
  if btnGrava.Enabled then Begin
      //navegacao(5);
  End Else
      navegacao(5);

end;

procedure TfrmPessoal.RefreshDados(tipo: String);
var
  i: integer;
  cWhere, cQuery, cOrder: String;

begin
  RefreshDados2(acampo, tipo, '',  pss_codigo, sqlNew, dmEmp.sqlPessoal );
end;

procedure TfrmPessoal.RefreshDialog;
var
  i, tmp: Integer;
  frmx : TForm ;
begin
  RefreshDialog2(cPre,acampo, frmPessoal, sqlNew, aEdits);
  HabButFoto;
end;

procedure TfrmPessoal.RefreshGrid;
begin
 dmEmp.sqlacsatv.Close;
 dmEmp.cliacsatv.Close;
 with dmEmp.sqlacsatv do
   begin
     SQL.Text :='Select aat_codigo, aat_placa, aat_codacs, acs_nome, aat_usuinc, aat_datinc, aat_horinc, aat_usualt, aat_datalt, aat_horalt '+
                ' from '+U_funcao.SelSchema('acessoratv')+' '+
                ' left JOIN '+U_funcao.SelSchema('acessorio')+' on acs_codigo = aat_codacs '+
                ' where aat_placa = '+QuotedStr(pss_codigo.Text ) ;
     Open;
 end;
 dmEmp.cliacsatv.Active := True;

 dmEmp.sqlcmbatv.Close;
 dmEmp.clicmbatv.Close;
 with dmEmp.sqlcmbatv do
   begin
     SQL.Text :='Select cat_codigo, cat_placa, cat_codcmb, cmb_nome, cat_usuinc, cat_datinc, cat_horinc, cat_usualt, cat_datalt, cat_horalt '+
                ' from '+U_funcao.SelSchema('combustatv')+' '+
                ' left JOIN '+U_funcao.SelSchema('combustivel')+' on cmb_codigo = cat_codcmb '+
                ' where cat_placa = '+QuotedStr(pss_codigo.Text ) ;
     Open;
 end;
 dmEmp.clicmbatv.Active := True;


 sqlDb.Close;
 cliDb.Close;
 with sqlDb do
   begin
     SQL.Text :='Select * from '+U_funcao.SelSchema('financecab')+' '+
                        ' left JOIN '+U_funcao.SelSchema('financeiro')+' on fcr_codcfr = cfr_codigo '+
                        ' where cfr_codpss = '+U_funcao.fIIf( Length( trim(pss_codigo.Text)) > 0, QuotedStr(pss_codigo.Text),'0' )+
                        ' and cfr_tipdoc = ''C'' ' ;
     Open;
 end;
 cliDb.Active := True;

 BtnFoto ;

end;

procedure TfrmPessoal.ToolButton9Click(Sender: TObject);
begin
  frmCalculadora := TfrmCalculadora.Create(Self);
  frmCalculadora.Show;

end;

procedure TfrmPessoal.pss_cepExit(Sender: TObject);
var
Cep : TClasseUtil;
begin
 verificacep( Sender, pss_endereco, pss_complem, pss_Bairro, edNomCid, edNomUf, pss_codcid  );

end;

procedure TfrmPessoal.pss_codcgoExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela  :=  dmEmp.sqlcargo;
  edNomCgo.Text       :=  Pesquisa.Relacao('cargo',pss_codcgo,'cgo_codigo','cgo_nome'  );


end;

procedure TfrmPessoal.pss_codcgoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      pss_codcgoRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmPessoal.pss_codcgoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dscargo ;
  Pesquisa.sqlTabela :=  dmEmp.sqlCargo ;
  Pesquisa.cliTabela :=  dmEmp.clicargo ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Cargos e Funções';
  Pesquisa.nmTabela  := 'cargo';
  Pesquisa.NovoCad   := 'cargo' ;
  Pesquisa.QuerySql  := '';
  // Display        campo   cabecalho           get         tan  indices
  Pesquisa.AddReg('cgo_codigo','Código'        ,'pss_codcgo' ,5  ,'por Código' );
  Pesquisa.AddReg('cgo_nome'  ,'Cargo/Função'  ,'edNomCgo'   ,20 ,'por Cargo' );

  Pesquisa.acessa(pss_codcgo);
  pss_codcgo.text   :=  Pesquisa.RecReg('cgo_codigo');
  edNomCgo.text     :=  Pesquisa.RecReg('cgo_nome');
  Pesquisa.Destroy;


end;


procedure TfrmPessoal.pss_codigoExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlLotado ;
  //ltd_nome.Text :=  Pesquisa.Relacao('Lotado',pss_codigo,'pss_codigo','ltd_nome');
  navegacao(5);
 
end;

procedure TfrmPessoal.pss_codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   Try
    case key of
        VK_END    : pss_codigoRightButtonClick(Self);
        VK_UP     : navegacao(1);
        VK_LEFT   : navegacao(2);
        VK_RIGHT  : navegacao(3);
        VK_DOWN   : navegacao(4);

      end;
  Finally

  End;

end;

procedure TfrmPessoal.pss_codigoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
if btnGrava.Enabled then
   Exit;

  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsPessoal ;
  Pesquisa.sqlTabela :=  dmEmp.sqlPessoal ;
  Pesquisa.cliTabela :=  dmEmp.cliPessoal ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Pessoal/Funcionários';
  Pesquisa.nmTabela  := 'pessoal';
  // Display        campo   cabecalho              get            tan  indices
  Pesquisa.AddReg('pss_codigo'  ,'Código'         ,'pss_codigo'   ,5  ,'por Código'    );
  Pesquisa.AddReg('pss_nome'    ,'Nome Completo'  ,'pss_nome'     ,35 ,'por Nome'      );
  Pesquisa.AddReg('pss_endereco','Endereço'       ,'pss_endereco' ,25 ,'por Endereço'  );
  Pesquisa.AddReg('pss_bairro'  ,'Endereço'       ,'pss_bairro'   ,25 ,'por Bairro'    );
  Pesquisa.AddReg('cid_nome'    ,'Cidade'         ,'cid_nome'     ,25 ,'por Cidade'    );
  Pesquisa.AddReg('pss_telef01' ,'Telefone 01'    ,'pss_telef01'  ,10 ,'por Tel 01'    );
  Pesquisa.AddReg('pss_telef02' ,'Telefone 02'    ,'pss_telef02'  ,10 ,'por Tel 02'    );
  Pesquisa.AddReg('pss_celular' ,'Celular'        ,'pss_celular'  ,10 ,'por Tel 01'    );

  Pesquisa.acessa(pss_codigo);
  pss_codigo.text   :=  Pesquisa.RecReg('pss_codigo');
  pss_nome.text     :=  Pesquisa.RecReg('pss_nome');
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

procedure TfrmPessoal.ativaButoes(tipo:Integer);
begin
ativaButoes2(Tipo,  btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt, sqlNew);
end;

procedure TfrmPessoal.ativaget;
begin
  ativaget2(aEdits,cPre+'codigo',cTabela, btnGrava.Enabled, lMostra );
end;

procedure TfrmPessoal.btnAlterarExecute(Sender: TObject);
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
   pss_nome.SetFocus;
   navegacao(0);
   pss_cpf.Enabled := False;

end;

procedure TfrmPessoal.btnAntExecute(Sender: TObject);
begin
  navegacao(2);
end;

procedure TfrmPessoal.btnCancelaExecute(Sender: TObject);
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
   pss_codigo.SetFocus;

end;

procedure TfrmPessoal.btnExcluiFotoExecute(Sender: TObject);
begin
  if MESSAGEBOX(Application.Handle, 'Deseja Remover a Foto', 'Confirma...', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin
     pss_foto.Picture.Graphic := Nil
  end;
   // definindo Botões de Manuseio de Imagem
   BtnFoto;


end;

procedure TfrmPessoal.btnExcluirExecute(Sender: TObject);
Var
aSubTab : TArrayDim2;
n: Integer;
begin
   //SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'acessoratv';     aSubTab[n][1] := '';
   If Exclui2(cTabela, aSubTab,  pss_codigo, btnExcluir) Then Begin;
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

procedure TfrmPessoal.BtnFoto;
begin
   // definindo Botões de Manuseio de Imagem
   btnPegaFoto.Enabled    := ( btnGrava.Enabled and ( pss_foto.Picture.Graphic = Nil ));
   btnExcluiFoto.Enabled  := ( btnGrava.Enabled and ( pss_foto.Picture.Graphic <> Nil ));

   AcsBtnInc.Enabled      := btnGrava.Enabled ;
   AcsBtnExc.Enabled      := (( Not dmEmp.sqlacsatv.Eof ) and ( btnGrava.Enabled ) and dmEmp.chkPer( 'Pessoal', 'prm_exc') );

   CmbBtnInc.Enabled      := btnGrava.Enabled ;
   CmbBtnExc.Enabled      := (( Not dmEmp.sqlcmbatv.Eof ) and ( btnGrava.Enabled ) and dmEmp.chkPer( 'Pessoal', 'prm_exc') );


end;

procedure TfrmPessoal.btnGravaExecute(Sender: TObject);
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
   pss_codigo.SetFocus;
end;

procedure TfrmPessoal.btnIniExecute(Sender: TObject);
begin
  navegacao(1);
end;

procedure TfrmPessoal.btnNovoExecute(Sender: TObject);
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
   pss_apelido.Clear;
   pss_cpf.SetFocus;
   HabButFoto;
   RefreshGrid;
end;

procedure TfrmPessoal.btnPegaFotoExecute(Sender: TObject);
begin
if OpenDialog01.Execute then
  begin
    pss_foto.Picture.LoadFromFile(OpenDialog01.FileName);
  end;
   // definindo Botões de Manuseio de Imagem
   BtnFoto;


end;

procedure TfrmPessoal.btnProxExecute(Sender: TObject);
begin
  navegacao(3);
end;

procedure TfrmPessoal.btnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmPessoal.btnUltExecute(Sender: TObject);
begin
  navegacao(4);
end;


procedure TfrmPessoal.dbgDebitosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    if gdFocused in State then  begin
      dbgDebitos.Canvas.Brush.Color  := Azul_Escuro;
      dbgDebitos.Canvas.Font.Color   := Branco;
      dbgDebitos.Canvas.FillRect(Rect);
      dbgDebitos.DefaultDrawDataCell(Rect, Column.Field, State);
    end else begin

        if Odd(dbgDebitos.DataSource.DataSet.RecNo) then begin
          dbgDebitos.Canvas.Brush.Color  := Branco;
          dbgDebitos.Canvas.Font.Color   := Preto;
          dbgDebitos.Canvas.FillRect(Rect);
          dbgDebitos.DefaultDrawDataCell(Rect, Column.Field, State);

        End else Begin
          dbgDebitos.Canvas.Brush.Color  := Cinza_Sintilante;
          dbgDebitos.Canvas.Font.Color   := Preto;
          dbgDebitos.Canvas.FillRect(Rect);
          dbgDebitos.DefaultDrawDataCell(Rect, Column.Field, State);
        End;

    end;

end;

procedure TfrmPessoal.pss_codltdExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela  :=  dmEmp.sqllotado ;
  edNomLtd.Text       :=  Pesquisa.Relacao('lotado',pss_codltd,'ltd_codigo','ltd_nome'  );
  edNomSig.Text       :=  Pesquisa.Relacao('lotado',pss_codltd,'ltd_codigo','ltd_sigla'  );

end;

procedure TfrmPessoal.pss_codltdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      pss_codltdRightButtonClick(Self);
  end;
Finally

End;
end;

procedure TfrmPessoal.pss_codltdRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsLotado ;
  Pesquisa.sqlTabela :=  dmEmp.sqlLotado ;
  Pesquisa.cliTabela :=  dmEmp.cliLotado ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Setores/Departamentos de Veículos';
  Pesquisa.nmTabela  := 'lotado' ;
  Pesquisa.NovoCad   := 'lotado' ;
  // Display        campo   cabecalho               get         tan  indices
  Pesquisa.AddReg('ltd_codigo','Código'             ,'pss_codltd' ,5  ,'por Código' );
  Pesquisa.AddReg('ltd_nome'  ,'Setor/Departamento' ,'edNomLtd'   ,20 ,'por Departamnento' );
  Pesquisa.AddReg('ltd_sigla' ,'Sigla'              ,'edNomSig'   ,7  ,'por Sigla' );

  Pesquisa.acessa(pss_codltd);
  pss_codltd.text   :=  Pesquisa.RecReg('ltd_codigo');
  edNomLtd.text     :=  Pesquisa.RecReg('ltd_nome');
  edNomSig.text     :=  Pesquisa.RecReg('ltd_sigla');
  Pesquisa.Destroy;


end;

procedure TfrmPessoal.pss_codpcrExit(Sender: TObject);
Var
  Pesquisa : TClasConsultaConta;
begin
  if pss_codpcr.Text <> '' then begin
  // Função que confirma os dados relacionados
  Pesquisa := TClasConsultaConta.Create;
  edNomPcr.Text :=  Pesquisa.Relacao('pct_nome',pss_codpcr.Text);
  end;

end;

procedure TfrmPessoal.pss_codpcrKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      pss_codpcrRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmPessoal.pss_codpcrRightButtonClick(Sender: TObject);
Var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsultaConta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsultaConta.Create;
  Pesquisa.acessa(pss_codpcr,'D');
  edNomPcr.Text :=  Pesquisa.Relacao('pct_nome',pss_codpcr.Text);
  Pesquisa.Destroy;

 end;


procedure TfrmPessoal.pss_codpcvExit(Sender: TObject);
Var
  Pesquisa : TClasConsultaConta;
begin
  if pss_codpcv.Text <> '' then begin

      // Função que confirma os dados relacionados
      Pesquisa := TClasConsultaConta.Create;
      edNomPcv.Text :=  Pesquisa.Relacao('pct_nome',pss_codpcv.Text);
  end;

end;

procedure TfrmPessoal.pss_codpcvKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      pss_codpcvRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmPessoal.pss_codpcvRightButtonClick(Sender: TObject);
Var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsultaConta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsultaConta.Create;
  Pesquisa.acessa(pss_codpcv,'C');
  edNomPcv.Text :=  Pesquisa.Relacao('pct_nome',pss_codpcv.Text);
  Pesquisa.Destroy;

 end;

procedure TfrmPessoal.pss_cpfExit(Sender: TObject);
Var
cNmDataBase: String;
oCpf: TfrmCpf;
begin
If Not CPFCGC( pss_Cpf, cTabela ) then
   pss_Cpf.SetFocus;


  oCpf:= TfrmCpf.Create;
  If oCpf.PagaCpf(Sender)  then Begin
     pss_nome.Text    := oCpf.Nome;
     pss_datnas.Date  := StrToDate(oCpf.datnas);
  End;



end;

procedure TfrmPessoal.pss_nomeExit(Sender: TObject);
Var
I : Integer;
begin
if pss_nome.Text <> '' then
   pss_apelido.Clear;
   for I := 0 to explode(pss_nome.Text, ' ').Count-1 do begin
       pss_apelido.Items.Add( explode(pss_nome.Text, ' ')[I]);
   end;
   if pss_apelido.Text = '' then
      pss_apelido.ItemIndex := 0;

end;

procedure TfrmPessoal.pss_vlrrendaKeyPress(Sender: TObject; var Key: Char);
vAR
  cKey: String;
begin
  cKey:=Key;
  MoedaKeyEdit( Key, pss_vlrrenda );
  Key := #0 ;
end;

procedure TfrmPessoal.pss_vlrvaleKeyPress(Sender: TObject; var Key: Char);
vAR
  cKey: String;
begin
  cKey:=Key;
  MoedaKeyEdit( Key, pss_vlrvale );
  Key := #0 ;
end;

initialization
  RegisterClass(TfrmPessoal);


end.
