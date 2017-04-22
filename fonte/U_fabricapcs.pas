unit U_fabricapcs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, ImgList, ExtCtrls, ComCtrls, xmldom,
  XMLIntf, IdHTTP, msxmldom, XMLDoc, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, ExtDlgs, RibbonLunaStyleActnCtrls,
  ToolWin, ActnMan, ActnCtrls, jpeg, edittuning, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, U_ClasseUtil,U_Classcons, ZDataset, ZDatasetUtils,
  Vcl.Buttons, U_ClassCad, System.ImageList, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;


type
  Tfrmfabricapcs = class(TForm)
    StatusBar1: TStatusBar;
    Banner: TPanel;
    imgLogo: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    fbp_codigo: TButtonedEdit;
    Label4: TLabel;
    fbp_nome: TEdit;
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
    fbp_codcid: TButtonedEdit;
    Label2: TLabel;
    Label3: TLabel;
    edNomCid: TEdit;
    Label5: TLabel;
    fbp_rsocial: TEdit;
    Label6: TLabel;
    fbp_cep: TMaskEdit;
    fbp_endereco: TEdit;
    Label7: TLabel;
    fbp_numend: TEdit;
    Label8: TLabel;
    fbp_complem: TEdit;
    Label9: TLabel;
    fbp_bairro: TEdit;
    Label10: TLabel;
    edNomUf: TEdit;
    Label11: TLabel;
    fbp_telef1: TMaskEdit;
    Label12: TLabel;
    Label13: TLabel;
    fbp_telef2: TMaskEdit;
    fbp_celula: TMaskEdit;
    Label14: TLabel;
    fbp_cpfcnpj: TMaskEdit;
    lbPessoal: TLabel;
    fbp_ativo: TComboBox;
    Label15: TLabel;
    fbp_codpct: TButtonedEdit;
    Label16: TLabel;
    edNomCnt: TEdit;
    Label17: TLabel;
    GroupBox4: TGroupBox;
    fbp_obs: TRichEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure RefreshDialog;
    Procedure RefreshDados(tipo: String);
    procedure fbp_codigoExit(Sender: TObject);
    procedure fbp_codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fbp_codigoRightButtonClick(Sender: TObject);
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
    procedure fbp_codcidRightButtonClick(Sender: TObject);
    procedure fbp_codcidKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fbp_codcidExit(Sender: TObject);
    procedure fbp_cepExit(Sender: TObject);
    procedure fbp_codpctRightButtonClick(Sender: TObject);
    procedure fbp_codpctKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fbp_codpctExit(Sender: TObject);
    Function  ChkCNPJ(CNPJ: String): Boolean;
    procedure fbp_cpfcnpjExit(Sender: TObject);
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
  frmfabricapcs: Tfrmfabricapcs;
  modConsulta, nOrdem : integer;


implementation

uses  UCalculadora,  u_DmEmp, uSistema, U_funcao, U_CnpjClass,
  U_ClassconsContas;

{$R *.dfm}

procedure Tfrmfabricapcs.fbp_codcidExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlcidade ;
  edNomCid.Text :=  Pesquisa.Relacao('cidade',fbp_codcid,'cid_codigo','cid_nome');
  edNomUf.Text  :=  Pesquisa.Relacao('cidade',fbp_codcid,'cid_codigo','est_uf'  );

end;

procedure Tfrmfabricapcs.fbp_codcidKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      fbp_codcidRightButtonClick(Self);
  end;
Finally

End;

end;

procedure Tfrmfabricapcs.fbp_codcidRightButtonClick(Sender: TObject);
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
  Pesquisa.AddReg('cid_codigo','Código'             ,'fbp_codcid' ,5  ,'por Código' );
  Pesquisa.AddReg('cid_nome'  ,'Cidade'             ,'edNomCid'   ,25 ,'por cidade' );
  Pesquisa.AddReg('est_uf'    ,'Cidade'             ,'edNomUf'    ,2  ,'por Estado' );

  Pesquisa.acessa(fbp_codcid);
  fbp_codcid.text   :=  Pesquisa.RecReg('cid_codigo');
  edNomCid.text     :=  Pesquisa.RecReg('cid_nome');
  edNomUf.text      :=  Pesquisa.RecReg('est_uf');
  Pesquisa.Destroy;

 end;

procedure Tfrmfabricapcs.fbp_codigoExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlfabricapcs ;
  fbp_nome.Text :=  Pesquisa.Relacao('fabricapcs',fbp_codigo,'fbp_codigo','fbp_nome');
  navegacao(5);

end;

procedure Tfrmfabricapcs.fbp_codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END    : fbp_codigoRightButtonClick(Self);
    VK_UP     : navegacao(1);
    VK_LEFT   : navegacao(2);
    VK_RIGHT  : navegacao(3);
    VK_DOWN   : navegacao(4);

  end;
Finally

End;

end;

procedure Tfrmfabricapcs.fbp_codigoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
if btnGrava.Enabled then
   Exit;

  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsfabricapcs ;
  Pesquisa.sqlTabela :=  dmEmp.sqlfabricapcs ;
  Pesquisa.cliTabela :=  dmEmp.clifabricapcs ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Fabricantes de Peças';
  Pesquisa.nmTabela  := 'fabricapcs';
  //Pesquisa.NovoCad   := 'fabricapcs' ;
  // Display        campo   cabecalho           get         tan  indices
  Pesquisa.AddReg('fbp_codigo'  ,'Código'         ,'fbp_codigo' ,5  ,'por Código'    );
  Pesquisa.AddReg('fbp_nome'    ,'Nome'           ,'fbp_nome'   ,35 ,'por Fabricante');
  Pesquisa.AddReg('fbp_cpfcnpj'    ,'Cnpj'           ,'fbp_cpfcnpj'   ,15 ,'por Cpf/Cnpj' );


  Pesquisa.acessa(fbp_codigo);
  fbp_codigo.text   :=  Pesquisa.RecReg('fbp_codigo');
  fbp_nome.text     :=  Pesquisa.RecReg('fbp_nome');
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

procedure Tfrmfabricapcs.fbp_codpctExit(Sender: TObject);
Var
  Pesquisa : TClasConsultaConta;
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsultaConta.Create;
  edNomCnt.Text :=  Pesquisa.Relacao('pct_nome',fbp_codpct.Text);

end;

procedure Tfrmfabricapcs.fbp_codpctKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      fbp_codpctRightButtonClick(Self);
  end;
Finally

End;

end;

procedure Tfrmfabricapcs.fbp_codpctRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsultaConta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsultaConta.Create;
  Pesquisa.acessa(fbp_codpct,'D');
  edNomCnt.Text :=  Pesquisa.Relacao('pct_nome',fbp_codpct.Text);
  Pesquisa.Destroy;

 end;

procedure Tfrmfabricapcs.fbp_cpfcnpjExit(Sender: TObject);
begin
    Verificacnpj(Sender, fbp_nome, fbp_rsocial, fbp_Endereco, fbp_numend,fbp_complem,  fbp_Bairro, edNomCid, edNomUf, fbp_CEP, fbp_codcid );
end;

Function  Tfrmfabricapcs.ChkCNPJ(CNPJ: String): Boolean;
Var
SQLQuery1 : TFDQuery;
Begin
  SQLQuery1 := TFDQuery.Create(Nil);
  SQLQuery1.Close;
  SQLQuery1.Connection:= dmEmp.SqlConSis;
  SQLQuery1.Sql.Text  :='Select * FROM '+U_funcao.SelSchema('fabricapcs')+' WHERE fbp_cpfcnpj = :fbp_cpfcnpj';
  SQLQuery1.ParamByName('fbp_cpfcnpj').Text     :=  CNPJ ;
  SQLQuery1.open;
//  dmEmp.SQLQuery1.FieldByName('Nome').ToString
  if ( Not SQLQuery1.Eof ) and (Not CNPJ.IsEmpty)then Begin
     ShowMessage('Já existe um registro com esse CNPJ');
     Result := False;
  End Else begin
     Result := True ;
  End;


End;


procedure Tfrmfabricapcs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sqlNew.Close;
    dmEmp.clifabricapcs.Close;
    frmfabricapcs                 := nil ;
    action                       := cafree;
    fPrincipal.btnfabricapcs.Enabled := True;
end;



procedure Tfrmfabricapcs.FormCreate(Sender: TObject);
Var
i: Integer;
begin
  cPre                        := 'fbp_';
  cTabela                     := 'fabricapcs';
  acampo                      := 1;
  sqlNew                      := TFDQuery.Create(nil);
  sqlNew.Connection           := dmEmp.SqlConSis;
  fPrincipal.btnfabricapcs.Enabled  := False;
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;
end;


procedure Tfrmfabricapcs.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure Tfrmfabricapcs.FormShow(Sender: TObject);
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
  lbCabeca01.Caption    := 'Cadastro de Fabricamtes de Peças';
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
  fbp_codigo.SetFocus;


  btnNovo.Caption    := 'Novo'+#13 +'[F3]';
  btnAlterar.Caption := 'Editar'+#13 +'[F4]';
  btnGrava.Caption   := 'Salvar'+#13 +'[F5]';
  btnExcluir.Caption := 'Excluir'+#13 +'[Alt+Del]';
  btnCancela.Caption := 'Cancelar'+#13 +'[F12]';

end;

procedure Tfrmfabricapcs.gravadados;
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, ctip_horalt,cCodSql, cIteSql,cValSql,cCodMnt : string ;
dData, dtip_datalt : TDate ;
i, tmp: Integer;
SQLQ : TFDQuery ;
begin
   gravadados2(cTabela,cPre,cPre+'codigo','X','', nNew, frmfabricapcs, dmEmp.SqlConSis, aEdits );
end;

procedure Tfrmfabricapcs.limpaget;
Var
i: Integer;
begin
  limpaget2(aEdits);
end;

procedure Tfrmfabricapcs.navegacao(Ord: Integer);
begin
  if btnGrava.Enabled then
     Exit;

  navegacao2( Ord, acampo, btnIni, btnAnt, btnProx, btnUlt, sqlNew, dmEmp.sqlfabricapcs, fbp_codigo,'' );
  acampo := 0;
  RefreshDialog2(cPre,acampo, frmfabricapcs, sqlNew, aEdits);
  acampo := 1;
end;

procedure Tfrmfabricapcs.RefreshDados(tipo: String);
var
  i: integer;
  cWhere, cQuery, cOrder: String;

begin
  RefreshDados2(acampo, tipo, '', fbp_codigo, sqlNew, dmEmp.sqlfabricapcs );
end;


procedure Tfrmfabricapcs.RefreshDialog;
var
  i, tmp: Integer;
  frmx : TForm ;
begin
  RefreshDialog2(cPre,acampo, frmfabricapcs, sqlNew, aEdits);
end;

procedure Tfrmfabricapcs.ToolButton9Click(Sender: TObject);
begin
  frmCalculadora := TfrmCalculadora.Create(Self);
  frmCalculadora.Show;

end;

procedure Tfrmfabricapcs.ativaButoes(tipo:Integer);
begin
ativaButoes2(Tipo,  btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt, sqlNew);
end;

procedure Tfrmfabricapcs.ativaget;
begin
  ativaget2(aEdits,cPre+'codigo',cTabela, btnGrava.Enabled, lMostra );
end;

procedure Tfrmfabricapcs.btnAlterarExecute(Sender: TObject);
begin
   btnNovo.Enabled    := False;
   btnAlterar.Enabled := False;
   btnGrava.Enabled   := True;
   ativaButoes(1);
   lMostra := True;
   ativaget;
   RefreshDialog;
   fbp_rsocial.SetFocus;
   acampo := 0;
   nNew   := acampo;
   navegacao(0);
   fbp_cpfcnpj.Enabled := False;

end;

procedure Tfrmfabricapcs.btnAntExecute(Sender: TObject);
begin
  navegacao(2);
end;

procedure Tfrmfabricapcs.btnCancelaExecute(Sender: TObject);
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
   fbp_codigo.SetFocus;

end;

procedure Tfrmfabricapcs.btnExcluirExecute(Sender: TObject);
Var
aSubTab : TArrayDim2;
n: Integer;
begin
   //SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'acessoratv';     aSubTab[n][1] := '';
   If Exclui2(cTabela, aSubTab,  fbp_codigo, btnExcluir) Then Begin;
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

procedure Tfrmfabricapcs.btnGravaExecute(Sender: TObject);
begin
   gravadados;
   if FechaSubFrm(cTabela) then Close;

   acampo := 1;
   nNew   := acampo;
   btnNovo.Enabled := True;
   btnGrava.Enabled:= False;
   RefreshDados('T');
   ativaButoes(0);
   //limpaget;
    Case lMostra of
      False  : navegacao(4);
      True   : navegacao(5);
     end;
   lMostra := True;
   ativaget;
   fbp_codigo.SetFocus;


end;

procedure Tfrmfabricapcs.btnIniExecute(Sender: TObject);
begin
  navegacao(1);
end;

procedure Tfrmfabricapcs.btnNovoExecute(Sender: TObject);
begin
   acampo := 1;
   nNew   := acampo;
   btnGrava.Enabled := True;
   RefreshDados('S');
   limpaget;
   ativaButoes(1);
   lMostra := False;
   ativaget;
   fbp_cpfcnpj.SetFocus;

end;

procedure Tfrmfabricapcs.btnProxExecute(Sender: TObject);
begin
  navegacao(3);
end;

procedure Tfrmfabricapcs.btnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure Tfrmfabricapcs.btnUltExecute(Sender: TObject);
begin
  navegacao(4);
end;

procedure Tfrmfabricapcs.fbp_cepExit(Sender: TObject);
begin
 verificacep( Sender, fbp_endereco, fbp_complem,  fbp_bairro, edNomCid, edNomUf, fbp_codcid  );
end;

initialization
  RegisterClass(Tfrmfabricapcs);


end.
