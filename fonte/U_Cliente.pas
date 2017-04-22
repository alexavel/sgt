unit U_Cliente;

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
  TfrmCliente = class(TForm)
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
    GroupBox2: TGroupBox;
    cli_foto: TImage;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    Tbcomplemento: TTabSheet;
    GroupBox4: TGroupBox;
    actionsub: TActionManager;
    AcsBtnInc: TAction;
    AcsBtnExc: TAction;
    CmbBtnInc: TAction;
    cmbBtnExc: TAction;
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
    cli_codcid: TButtonedEdit;
    cli_cep: TMaskEdit;
    cli_endereco: TEdit;
    cli_numres: TEdit;
    cli_complem: TEdit;
    cli_telef01: TMaskEdit;
    cli_telef02: TMaskEdit;
    cli_celular: TMaskEdit;
    cli_bairro: TEdit;
    Label5: TLabel;
    edNomCid: TEdit;
    edNomUf: TEdit;
    TabSheet1: TTabSheet;
    Label40: TLabel;
    cli_email: TEdit;
    dspDb: TDataSetProvider;
    cliDb: TClientDataSet;
    dsDb: TDataSource;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    Label32: TLabel;
    cli_codcdc: TButtonedEdit;
    cli_cepcob: TMaskEdit;
    cli_endcob: TEdit;
    cli_numcob: TEdit;
    cli_comcob: TEdit;
    cli_baicob: TEdit;
    edNomCdc: TEdit;
    edNomUfc: TEdit;
    TabSheet2: TTabSheet;
    GroupBox7: TGroupBox;
    cli_obs: TRichEdit;
    GroupBox3: TGroupBox;
    cli_repend: TCheckBox;
    cli_vlrcre: TMaskEdit;
    Label29: TLabel;
    cli_vlrlim: TMaskEdit;
    Label30: TLabel;
    cli_diapag: TComboBox;
    Label31: TLabel;
    GroupBox5: TGroupBox;
    dbgDebitos: TDBGrid;
    GroupBox8: TGroupBox;
    Label15: TLabel;
    lbPessoal: TLabel;
    Label18: TLabel;
    cli_codigo: TButtonedEdit;
    cli_cpfcnpj: TMaskEdit;
    cli_nome: TEdit;
    cli_tipo: TComboBox;
    Label25: TLabel;
    cli_fantasia: TEdit;
    Label47: TLabel;
    cli_datnas: TDateTimePicker;
    Label27: TLabel;
    cli_ativo: TCheckBox;
    Label20: TLabel;
    cli_ecivil: TComboBox;
    cli_codcgo: TButtonedEdit;
    Label2: TLabel;
    EdNomCgo: TEdit;
    Label3: TLabel;
    cli_codgcl: TButtonedEdit;
    Label4: TLabel;
    edNomGcl: TEdit;
    Label1: TLabel;
    cli_rgiest: TEdit;
    Label33: TLabel;
    cli_imunic: TEdit;
    Label34: TLabel;
    sqlDb: TFDQuery;
    sqlDbfcr_codcfr: TIntegerField;
    sqlDbfcr_datven: TDateField;
    sqlDbfcr_numpar: TStringField;
    sqlDbcfr_vlrtot: TBCDField;
    sqlDbcfr_descri: TStringField;
    sqlDbfcr_vlrapg: TBCDField;
    sqlDbfcr_vlrpag: TBCDField;
    sqlDbfcr_datpag: TDateField;
    sqlDbfcr_status: TStringField;
    cliDbfcr_codcfr: TIntegerField;
    cliDbfcr_datven: TDateField;
    cliDbfcr_numpar: TStringField;
    cliDbcfr_vlrtot: TBCDField;
    cliDbcfr_descri: TStringField;
    cliDbfcr_vlrapg: TBCDField;
    cliDbfcr_vlrpag: TBCDField;
    cliDbfcr_datpag: TDateField;
    cliDbfcr_status: TStringField;
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
    procedure cli_codigoRightButtonClick(Sender: TObject);
    procedure cli_codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cli_codigoExit(Sender: TObject);
    procedure cli_codcgoRightButtonClick(Sender: TObject);
    procedure cli_codcgoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cli_codcgoExit(Sender: TObject);
    procedure cli_codgclRightButtonClick(Sender: TObject);
    procedure cli_codgclKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cli_codgclExit(Sender: TObject);
    procedure cli_codcidRightButtonClick(Sender: TObject);
    procedure cli_codcidKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPegaFotoExecute(Sender: TObject);
    procedure btnExcluiFotoExecute(Sender: TObject);
    Procedure BtnFoto;
    procedure RefreshGrid;
    procedure PgControleChange(Sender: TObject);
    procedure cli_cepExit(Sender: TObject);
    procedure cli_codcidExit(Sender: TObject);
    procedure cli_cpfcnpjExit(Sender: TObject);
    Procedure HabButFoto;
    procedure dbgDebitosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cli_tipoChange(Sender: TObject);
    procedure cli_rependClick(Sender: TObject);
    procedure cli_cepcobExit(Sender: TObject);
    procedure cli_codcdcRightButtonClick(Sender: TObject);
    procedure cli_codcdcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cli_codcdcExit(Sender: TObject);
    procedure cli_vlrlimKeyPress(Sender: TObject; var Key: Char);
    procedure cli_vlrcreKeyPress(Sender: TObject; var Key: Char);
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
    cPre, cTabela,clicepcob, cliendcob,  clinumcob,  clicomcob, clibaicob,  clicodcdc: String;

    { Public declarations }
  end;

var
  frmCliente: TfrmCliente;
  modConsulta, nOrdem : integer;


implementation

uses  UCalculadora,  u_DmEmp, uSistema, U_funcao, U_CnpjClass,
  U_CpfClass, U_ClassconsContas;

{$R *.dfm}

procedure TfrmCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sqlNew.Close;
    dmEmp.clicliente.Close;
    frmcliente                := nil ;
    action                       := cafree;
    fPrincipal.btncliente.Enabled := True;
end;



procedure TfrmCliente.FormCreate(Sender: TObject);
Var
i: Integer;
begin
  cPre                        := 'cli_';
  cTabela                     := 'cliente';
  acampo                      := 1;
  sqlNew                      := TFDQuery.Create(nil);
  sqlNew.Connection           := dmEmp.SqlConSis;
  fPrincipal.btncliente.Enabled  := False;
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;
end;

procedure TfrmCliente.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmCliente.FormShow(Sender: TObject);
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
  lbCabeca01.Caption    := 'Cadastro de Clientes';
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

procedure TfrmCliente.gravadados;
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, ctip_horalt,cCodSql, cIteSql,cValSql,cCodMnt : string ;
dData, dtip_datalt : TDate ;
i, tmp: Integer;
SQLQ : TFDQuery ;
begin
   gravadados2(cTabela,cPre,cPre+'codigo','X','', nNew, frmcliente, dmEmp.SqlConSis, aEdits );
end;

procedure TfrmCliente.HabButFoto;
begin
  btnPegaFoto.Enabled   := ((btnGrava.Enabled) and (    cli_foto.Picture.Graphic.Empty));
  btnExcluiFoto.Enabled := ((btnGrava.Enabled) and (Not cli_foto.Picture.Graphic.Empty));
end;

procedure TfrmCliente.limpaget;
Var
i: Integer;
begin
  limpaget2(aEdits);
end;

procedure TfrmCliente.cli_codcidExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlcidade ;
  edNomCid.Text :=  Pesquisa.Relacao('cidade',cli_codcid,'cid_codigo','cid_nome');
  edNomUf.Text  :=  Pesquisa.Relacao('cidade',cli_codcid,'cid_codigo','est_uf'  );

end;

procedure TfrmCliente.cli_codcidKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      cli_codcidRightButtonClick(Self);
  end;
Finally

End;


end;

procedure TfrmCliente.cli_codcidRightButtonClick(Sender: TObject);
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
  Pesquisa.AddReg('cid_codigo','Código'             ,'cli_codcid' ,5  ,'por Código' );
  Pesquisa.AddReg('cid_nome'  ,'Cidade'             ,'edNomCid'   ,25 ,'por cidade' );
  Pesquisa.AddReg('est_uf'    ,'Estado'             ,'edNomUf'    ,2  ,'por Estado' );

  Pesquisa.acessa(cli_codcid);
  cli_codcid.text   :=  Pesquisa.RecReg('cid_codigo');
  edNomCid.text     :=  Pesquisa.RecReg('cid_nome');
  edNomUf.text      :=  Pesquisa.RecReg('est_uf');
  Pesquisa.Destroy;


end;

procedure TfrmCliente.navegacao(Ord: Integer);
begin
  if btnGrava.Enabled then
     Exit;

  navegacao2( Ord, acampo, btnIni, btnAnt, btnProx, btnUlt, sqlNew, dmEmp.sqlcliente, cli_codigo,'' );
  acampo := 0;
  RefreshDialog2(cPre,acampo, frmcliente, sqlNew, aEdits);
  acampo := 1;
  RefreshGrid;
end;

procedure TfrmCliente.PgControleChange(Sender: TObject);
begin
  if btnGrava.Enabled then Begin
      //navegacao(5);
  End Else
      navegacao(5);

end;

procedure TfrmCliente.RefreshDados(tipo: String);
var
  i: integer;
  cWhere, cQuery, cOrder: String;

begin
  RefreshDados2(acampo, tipo, '',  cli_codigo, sqlNew, dmEmp.sqlcliente );
end;

procedure TfrmCliente.RefreshDialog;
var
  i, tmp: Integer;
  frmx : TForm ;
begin
  RefreshDialog2(cPre,acampo, frmcliente, sqlNew, aEdits);
  clicepcob :=  cli_cepcob.Text;
  cliendcob :=  cli_endcob.Text;
  clinumcob :=  cli_numcob.Text;
  clicomcob :=  cli_comcob.Text;
  clibaicob :=  cli_baicob.Text;
  clicodcdc :=  cli_codcdc.Text;
  HabButFoto;
end;

procedure TfrmCliente.ToolButton9Click(Sender: TObject);
begin
  frmCalculadora := TfrmCalculadora.Create(Self);
  frmCalculadora.Show;

end;

procedure TfrmCliente.cli_cepcobExit(Sender: TObject);
var
Cep : TClasseUtil;
begin
 verificacep( Sender, cli_endcob, cli_comcob, cli_Baicob, edNomCdc, edNomUfc, cli_codcdc  );
end;

procedure TfrmCliente.cli_cepExit(Sender: TObject);
var
Cep : TClasseUtil;
begin
 verificacep( Sender, cli_endereco, cli_complem, cli_Bairro, edNomCid, edNomUf, cli_codcid  );

end;

procedure TfrmCliente.cli_codcdcExit(Sender: TObject);
begin
  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlcidade ;
  edNomCdc.Text :=  Pesquisa.Relacao('cidade',cli_codcdc,'cid_codigo','cid_nome');
  edNomUfc.Text  :=  Pesquisa.Relacao('cidade',cli_codcdc,'cid_codigo','est_uf'  );

end;

procedure TfrmCliente.cli_codcdcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      cli_codcdcRightButtonClick(Self);
  end;
Finally

End;


end;

procedure TfrmCliente.cli_codcdcRightButtonClick(Sender: TObject);
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
  Pesquisa.AddReg('cid_codigo','Código'             ,'cli_codcdc' ,5  ,'por Código' );
  Pesquisa.AddReg('cid_nome'  ,'Cidade'             ,'edNomCdc'   ,25 ,'por cidade' );
  Pesquisa.AddReg('est_uf'    ,'Estado'             ,'edNomUfc'   ,2  ,'por Estado' );

  Pesquisa.acessa(cli_codcdc);
  cli_codcdc.text   :=  Pesquisa.RecReg('cid_codigo');
  edNomCdc.text     :=  Pesquisa.RecReg('cid_nome');
  edNomUfc.text     :=  Pesquisa.RecReg('est_uf');
  Pesquisa.Destroy;

end;

procedure TfrmCliente.cli_codcgoExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela  :=  dmEmp.sqlcargo;
  edNomCgo.Text       :=  Pesquisa.Relacao('cargo',cli_codcgo,'cgo_codigo','cgo_nome'  );


end;

procedure TfrmCliente.cli_codcgoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      cli_codcgoRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmCliente.cli_codcgoRightButtonClick(Sender: TObject);
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
  Pesquisa.AddReg('cgo_codigo','Código'        ,'cli_codcgo' ,5  ,'por Código' );
  Pesquisa.AddReg('cgo_nome'  ,'Cargo/Função'  ,'edNomCgo'   ,20 ,'por Cargo' );

  Pesquisa.acessa(cli_codcgo);
  cli_codcgo.text   :=  Pesquisa.RecReg('cgo_codigo');
  edNomCgo.text     :=  Pesquisa.RecReg('cgo_nome');
  Pesquisa.Destroy;


end;

procedure TfrmCliente.cli_codigoExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlgrupocli ;
  //gcl_nome.Text :=  Pesquisa.Relacao('grupocli',cli_codigo,'cli_codigo','gcl_nome');
  navegacao(5);
 
end;

procedure TfrmCliente.cli_codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   Try
    case key of
        VK_END    : cli_codigoRightButtonClick(Self);
        VK_UP     : navegacao(1);
        VK_LEFT   : navegacao(2);
        VK_RIGHT  : navegacao(3);
        VK_DOWN   : navegacao(4);

      end;
  Finally

  End;

end;

procedure TfrmCliente.cli_codigoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
if btnGrava.Enabled then
   Exit;

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

  Pesquisa.acessa(cli_codigo);
  cli_codigo.text   :=  Pesquisa.RecReg('cli_codigo');
  cli_nome.text     :=  Pesquisa.RecReg('cli_nome');
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

procedure TfrmCliente.ativaButoes(tipo:Integer);
begin
ativaButoes2(Tipo,  btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt, sqlNew);
end;

procedure TfrmCliente.ativaget;
begin
  ativaget2(aEdits,cPre+'codigo',cTabela, btnGrava.Enabled, lMostra );
end;

procedure TfrmCliente.btnAlterarExecute(Sender: TObject);
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
   cli_nome.SetFocus;
   navegacao(0);
   cli_cpfcnpj.Enabled := False;
   cli_tipo.Enabled    := False;

end;

procedure TfrmCliente.btnAntExecute(Sender: TObject);
begin
  navegacao(2);
end;

procedure TfrmCliente.btnCancelaExecute(Sender: TObject);
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
   cli_codigo.SetFocus;

end;

procedure TfrmCliente.btnExcluiFotoExecute(Sender: TObject);
begin
  if MESSAGEBOX(Application.Handle, 'Deseja Remover a Foto', 'Confirma...', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin
     cli_foto.Picture.Graphic := Nil
  end;
   // definindo Botões de Manuseio de Imagem
   BtnFoto;


end;

procedure TfrmCliente.btnExcluirExecute(Sender: TObject);
Var
aSubTab : TArrayDim2;
n: Integer;
begin
   //SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'acessoratv';     aSubTab[n][1] := '';
   If Exclui2(cTabela, aSubTab,  cli_codigo, btnExcluir) Then Begin;
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

procedure TfrmCliente.BtnFoto;
begin
   // definindo Botões de Manuseio de Imagem
   btnPegaFoto.Enabled    := ( btnGrava.Enabled and ( cli_foto.Picture.Graphic = Nil ));
   btnExcluiFoto.Enabled  := ( btnGrava.Enabled and ( cli_foto.Picture.Graphic <> Nil ));

   AcsBtnInc.Enabled      := btnGrava.Enabled ;
   AcsBtnExc.Enabled      := (( Not dmEmp.sqlacsatv.Eof ) and ( btnGrava.Enabled ) and dmEmp.chkPer( 'cliente', 'prm_exc') );

   CmbBtnInc.Enabled      := btnGrava.Enabled ;
   CmbBtnExc.Enabled      := (( Not dmEmp.sqlcmbatv.Eof ) and ( btnGrava.Enabled ) and dmEmp.chkPer( 'cliente', 'prm_exc') );


end;

procedure TfrmCliente.RefreshGrid;
begin

 sqlDb.Close;
 cliDb.Close;
 with sqlDb do
   begin
     SQL.Text :='SELECT fcr_codcfr, fcr_datven, fcr_numpar, cfr_vlrtot, cfr_descri, fcr_vlrapg, fcr_vlrpag, fcr_datpag, fcr_status  from  '+U_funcao.SelSchema('financecab')
                        +' LEFT JOIN  '+U_funcao.SelSchema('financeiro')+' on fcr_codcfr = cfr_codigo '
                        +' where cfr_codcli = '+U_funcao.fIIf( Length( trim(cli_codigo.Text)) > 0, QuotedStr(cli_codigo.Text),'0' ) ;
     Open;
 end;
 cliDb.Active := True;

 BtnFoto ;

end;

procedure TfrmCliente.btnGravaExecute(Sender: TObject);
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
   cli_codigo.SetFocus;
end;

procedure TfrmCliente.btnIniExecute(Sender: TObject);
begin
  navegacao(1);
end;

procedure TfrmCliente.btnNovoExecute(Sender: TObject);
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
   cli_tipo.SetFocus;
   HabButFoto;
end;

procedure TfrmCliente.btnPegaFotoExecute(Sender: TObject);
begin
if OpenDialog01.Execute then
  begin
    cli_foto.Picture.LoadFromFile(OpenDialog01.FileName);
  end;
   // definindo Botões de Manuseio de Imagem
   BtnFoto;


end;

procedure TfrmCliente.btnProxExecute(Sender: TObject);
begin
  navegacao(3);
end;

procedure TfrmCliente.btnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmCliente.btnUltExecute(Sender: TObject);
begin
  navegacao(4);
end;


procedure TfrmCliente.dbgDebitosDrawColumnCell(Sender: TObject;
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

procedure TfrmCliente.cli_codgclExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela  :=  dmEmp.sqlgrupocli ;
  edNomGcl.Text       :=  Pesquisa.Relacao('grupocli',cli_codgcl,'gcl_codigo','gcl_nome'  );

end;

procedure TfrmCliente.cli_codgclKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      cli_codgclRightButtonClick(Self);
  end;
Finally

End;
end;

procedure TfrmCliente.cli_codgclRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsgrupocli ;
  Pesquisa.sqlTabela :=  dmEmp.sqlgrupocli ;
  Pesquisa.cliTabela :=  dmEmp.cligrupocli ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Grupo de Clientes';
  Pesquisa.nmTabela  := 'grupocli' ;
  Pesquisa.NovoCad   := 'grupocli' ;
  // Display        campo   cabecalho               get         tan  indices
  Pesquisa.AddReg('gcl_codigo','Código'             ,'cli_codgcl' ,5  ,'por Código' );
  Pesquisa.AddReg('gcl_nome'  ,'Descrição do Grupo' ,'edNomGcl'   ,20 ,'por Grupo'  );

  Pesquisa.acessa(cli_codgcl);
  cli_codgcl.text   :=  Pesquisa.RecReg('gcl_codigo');
  edNomGcl.text     :=  Pesquisa.RecReg('gcl_nome');
  Pesquisa.Destroy;


end;

procedure TfrmCliente.cli_cpfcnpjExit(Sender: TObject);
Var
cNmDataBase: String;
oCpf: TfrmCpf;
Empresa: TfrmCnpj;
begin
 if cli_tipo.ItemIndex = 1 then begin
    Verificacnpj(Sender, cli_nome, cli_fantasia, cli_Endereco, cli_numres, cli_complem,  cli_Bairro, edNomCid, edNomUf, cli_CEP, cli_codcid );
 end Else Begin
    oCpf:= TfrmCpf.Create;
    If oCpf.PagaCpf(Sender)  then Begin
       cli_nome.Text    := oCpf.Nome;
       cli_datnas.Date  := StrToDate(oCpf.datnas);
    End;
 End;

end;


procedure TfrmCliente.cli_rependClick(Sender: TObject);
begin
  if cli_repend.Checked then begin
     cli_cepcob.Text  :=  cli_cep.Text;
     cli_endcob.Text  :=  cli_endereco.Text;
     cli_numcob.Text  :=  cli_numres.Text;
     cli_comcob.Text  :=  cli_complem.Text;
     cli_baicob.Text  :=  cli_bairro.Text;
     cli_codcdc.Text  :=  cli_codcid.Text;
     edNomCdc.Text    :=  edNomCid.Text;
     edNomUfc.Text    :=  edNomUf.Text;
  end Else Begin
     cli_cepcob.Text  :=  clicepcob;
     cli_endcob.Text  :=  cliendcob;
     cli_numcob.Text  :=  clinumcob;
     cli_comcob.Text  :=  clicomcob;
     cli_baicob.Text  :=  clibaicob;
     cli_codcdc.Text  :=  clicodcdc;
  End;

end;

procedure TfrmCliente.cli_tipoChange(Sender: TObject);
begin
  if cli_tipo.Text = 'Física' then Begin
     lbPessoal.Caption := 'CPF' ;
     cli_cpfcnpj.EditMask := '000\.000\.000\-00;0;_' ;
  End Else Begin
     lbPessoal.Caption := 'CNPJ' ;
     cli_cpfcnpj.EditMask := '00\.000\.000\/0000\-00;0;_' ;
  End;
end;

procedure TfrmCliente.cli_vlrcreKeyPress(Sender: TObject; var Key: Char);
begin
    KeyValor( Sender , Key );
end;

procedure TfrmCliente.cli_vlrlimKeyPress(Sender: TObject; var Key: Char);
begin
    KeyValor( Sender , Key );
end;

initialization
  RegisterClass(TfrmCliente);


end.
