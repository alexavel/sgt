unit U_FornecedorInc;

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
  TfrmFornecedor = class(TForm)
    StatusBar1: TStatusBar;
    Banner: TPanel;
    imgLogo: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    fnd_codigo: TButtonedEdit;
    Label4: TLabel;
    fnd_nome: TEdit;
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
    fnd_codcid: TButtonedEdit;
    Label2: TLabel;
    Label3: TLabel;
    edNomCid: TEdit;
    Label5: TLabel;
    fnd_rsocial: TEdit;
    Label6: TLabel;
    fnd_cep: TMaskEdit;
    fnd_endereco: TEdit;
    Label7: TLabel;
    fnd_numend: TEdit;
    Label8: TLabel;
    fnd_complem: TEdit;
    Label9: TLabel;
    fnd_bairro: TEdit;
    Label10: TLabel;
    edNomUf: TEdit;
    Label11: TLabel;
    fnd_telef1: TMaskEdit;
    Label12: TLabel;
    Label13: TLabel;
    fnd_telef2: TMaskEdit;
    fnd_celula: TMaskEdit;
    Label14: TLabel;
    Label25: TLabel;
    fnd_tipopes: TComboBox;
    fnd_cpfcnpj: TMaskEdit;
    lbPessoal: TLabel;
    fnd_ativo: TComboBox;
    Label15: TLabel;
    fnd_codpct: TButtonedEdit;
    Label16: TLabel;
    edNomCnt: TEdit;
    Label17: TLabel;
    GroupBox4: TGroupBox;
    fnd_obs: TRichEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure RefreshDialog;
    Procedure RefreshDados(tipo: String);
    procedure fnd_codigoExit(Sender: TObject);
    procedure fnd_codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fnd_codigoRightButtonClick(Sender: TObject);
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
    procedure fnd_codcidRightButtonClick(Sender: TObject);
    procedure fnd_codcidKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fnd_codcidExit(Sender: TObject);
    procedure fnd_cepExit(Sender: TObject);
    procedure fnd_tipopesChange(Sender: TObject);
    procedure fnd_codpctRightButtonClick(Sender: TObject);
    procedure fnd_codpctKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fnd_codpctExit(Sender: TObject);
    procedure fnd_cpfcnpjExit(Sender: TObject);
    Function  ChkCNPJ(CNPJ: String): Boolean;
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
  frmFornecedor: TfrmFornecedor;
  modConsulta, nOrdem : integer;


implementation

uses  UCalculadora,  u_DmEmp, uSistema, U_funcao, U_CnpjClass,
  U_ClassconsContas;

{$R *.dfm}

procedure TfrmFornecedor.fnd_codcidExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlcidade ;
  edNomCid.Text :=  Pesquisa.Relacao('cidade',fnd_codcid,'cid_codigo','cid_nome');
  edNomUf.Text  :=  Pesquisa.Relacao('cidade',fnd_codcid,'cid_codigo','est_uf'  );

end;

procedure TfrmFornecedor.fnd_codcidKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      fnd_codcidRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmFornecedor.fnd_codcidRightButtonClick(Sender: TObject);
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
  Pesquisa.AddReg('cid_codigo','Código'             ,'fnd_codcid' ,5  ,'por Código' );
  Pesquisa.AddReg('cid_nome'  ,'Cidade'             ,'edNomCid'   ,25 ,'por cidade' );
  Pesquisa.AddReg('est_uf'    ,'Cidade'             ,'edNomUf'    ,2  ,'por Estado' );

  Pesquisa.acessa(fnd_codcid);
  fnd_codcid.text   :=  Pesquisa.RecReg('cid_codigo');
  edNomCid.text     :=  Pesquisa.RecReg('cid_nome');
  edNomUf.text      :=  Pesquisa.RecReg('est_uf');
  Pesquisa.Destroy;

 end;

procedure TfrmFornecedor.fnd_codigoExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlfornecedor ;
  fnd_nome.Text :=  Pesquisa.Relacao('fornecedor',fnd_codigo,'fnd_codigo','fnd_nome');
  navegacao(5);

end;

procedure TfrmFornecedor.fnd_codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END    : fnd_codigoRightButtonClick(Self);
    VK_UP     : navegacao(1);
    VK_LEFT   : navegacao(2);
    VK_RIGHT  : navegacao(3);
    VK_DOWN   : navegacao(4);

  end;
Finally

End;

end;

procedure TfrmFornecedor.fnd_codigoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
if btnGrava.Enabled then
   Exit;

  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsfornecedor ;
  Pesquisa.sqlTabela :=  dmEmp.sqlFornecedor ;
  Pesquisa.cliTabela :=  dmEmp.clifornecedor ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Fornecedores';
  Pesquisa.nmTabela  := 'fornecedor';
  //Pesquisa.NovoCad   := 'fornecedor' ;
  // Display        campo   cabecalho           get         tan  indices
  Pesquisa.AddReg('fnd_codigo'  ,'Código'         ,'fnd_codigo' ,5  ,'por Código'    );
  Pesquisa.AddReg('fnd_nome'    ,'Nome'           ,'fnd_nome'   ,35 ,'por fornecedor');
  Pesquisa.AddReg('fnd_cpfcnpj' ,'Cpf/Cnpj'       ,'fnd_cpfcnpj',15  ,'por Cpf/Cnpj' );


  Pesquisa.acessa(fnd_codigo);
  fnd_codigo.text   :=  Pesquisa.RecReg('fnd_codigo');
  fnd_nome.text     :=  Pesquisa.RecReg('fnd_nome');
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

procedure TfrmFornecedor.fnd_codpctExit(Sender: TObject);
Var
  Pesquisa : TClasConsultaConta;
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsultaConta.Create;
  edNomCnt.Text :=  Pesquisa.Relacao('pct_nome',fnd_codpct.Text);

end;

procedure TfrmFornecedor.fnd_codpctKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      fnd_codpctRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmFornecedor.fnd_codpctRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsultaConta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsultaConta.Create;
  Pesquisa.acessa(fnd_codpct,'D');
  edNomCnt.Text :=  Pesquisa.Relacao('pct_nome',fnd_codpct.Text);
  Pesquisa.Destroy;

 end;

procedure TfrmFornecedor.fnd_cpfcnpjExit(Sender: TObject);
Var
cNmDataBase: String;
Empresa: TfrmCnpj;

begin
 if fnd_tipopes.ItemIndex = 1 then
    Verificacnpj(Sender, fnd_nome, fnd_rsocial, fnd_Endereco, fnd_numend,fnd_complem,  fnd_Bairro, edNomCid, edNomUf, fnd_CEP, fnd_codcid );

end;

Function  TfrmFornecedor.ChkCNPJ(CNPJ: String): Boolean;
Var
SQLQuery1 : TFDQuery;
Begin
  SQLQuery1 := TFDQuery.Create(Nil);
  SQLQuery1.Close;
  SQLQuery1.Connection:= dmemp.SqlConSis;
  SQLQuery1.Sql.Text  :='Select * FROM '+U_funcao.SelSchema('fornecedor')+' WHERE fnd_cpfcnpj = :fnd_cpfcnpj';
  SQLQuery1.ParamByName('fnd_cpfcnpj').Text     :=  CNPJ ;
  SQLQuery1.open;
//  dmEmp.SQLQuery1.FieldByName('Nome').ToString
  if ( Not SQLQuery1.Eof ) and (Not CNPJ.IsEmpty)then Begin
     ShowMessage('Já existe um registro com esse CNPJ');
     Result := False;
  End Else begin
     Result := True ;
  End;


End;

procedure TfrmFornecedor.fnd_tipopesChange(Sender: TObject);
begin
if fnd_tipopes.Text = 'Física' then Begin
   lbPessoal.Caption := 'CPF' ;
   fnd_cpfcnpj.EditMask := '000\.000\.000\-00;0;_' ;
End Else Begin
   lbPessoal.Caption := 'CNPJ' ;
   fnd_cpfcnpj.EditMask := '00\.000\.000\/0000\-00;0;_' ;
End;

end;

procedure TfrmFornecedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sqlNew.Close;
    dmEmp.clifornecedor.Close;
    frmfornecedor                 := nil ;
    action                       := cafree;
    fPrincipal.btnfornecedor.Enabled := True;
end;



procedure TfrmFornecedor.FormCreate(Sender: TObject);
Var
i: Integer;
begin
  cPre                        := 'fnd_';
  cTabela                     := 'fornecedor';
  acampo                      := 1;
  sqlNew                      := TFDQuery.Create(nil);
  sqlNew.Connection           := dmEmp.SqlConSis;
  fPrincipal.btnfornecedor.Enabled  := False;
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;
end;


procedure TfrmFornecedor.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmFornecedor.FormShow(Sender: TObject);
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
  lbCabeca01.Caption    := 'Cadastro de Fornecedores';
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
  fnd_codigo.SetFocus;


  btnNovo.Caption    := 'Novo'+#13 +'[F3]';
  btnAlterar.Caption := 'Editar'+#13 +'[F4]';
  btnGrava.Caption   := 'Salvar'+#13 +'[F5]';
  btnExcluir.Caption := 'Excluir'+#13 +'[Alt+Del]';
  btnCancela.Caption := 'Cancelar'+#13 +'[F12]';

end;

procedure TfrmFornecedor.gravadados;
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, ctip_horalt,cCodSql, cIteSql,cValSql,cCodMnt : string ;
dData, dtip_datalt : TDate ;
i, tmp: Integer;
SQLQ : TFDQuery ;
begin
   gravadados2(cTabela,cPre,cPre+'codigo','X','', nNew, frmFornecedor, dmEmp.SqlConSis, aEdits );
end;

procedure TfrmFornecedor.limpaget;
Var
i: Integer;
begin
  limpaget2(aEdits);
end;

procedure TfrmFornecedor.navegacao(Ord: Integer);
begin
  if btnGrava.Enabled then
     Exit;

  navegacao2( Ord, acampo, btnIni, btnAnt, btnProx, btnUlt, sqlNew, dmEmp.sqlFornecedor, fnd_codigo,'' );
  acampo := 0;
  RefreshDialog2(cPre,acampo, frmFornecedor, sqlNew, aEdits);
  acampo := 1;
end;

procedure TfrmFornecedor.RefreshDados(tipo: String);
var
  i: integer;
  cWhere, cQuery, cOrder: String;

begin
  RefreshDados2(acampo, tipo, '', fnd_codigo, sqlNew, dmEmp.sqlFornecedor );
end;


procedure TfrmFornecedor.RefreshDialog;
var
  i, tmp: Integer;
  frmx : TForm ;
begin
  RefreshDialog2(cPre,acampo, frmFornecedor, sqlNew, aEdits);
end;

procedure TfrmFornecedor.ToolButton9Click(Sender: TObject);
begin
  frmCalculadora := TfrmCalculadora.Create(Self);
  frmCalculadora.Show;

end;

procedure TfrmFornecedor.ativaButoes(tipo:Integer);
begin
ativaButoes2(Tipo,  btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt, sqlNew);
end;

procedure TfrmFornecedor.ativaget;
begin
  ativaget2(aEdits,cPre+'codigo',cTabela, btnGrava.Enabled, lMostra );
end;

procedure TfrmFornecedor.btnAlterarExecute(Sender: TObject);
begin
   btnNovo.Enabled    := False;
   btnAlterar.Enabled := False;
   btnGrava.Enabled   := True;
   ativaButoes(1);
   lMostra := True;
   ativaget;
   RefreshDialog;
   fnd_tipopes.SetFocus;
   acampo := 0;
   nNew   := acampo;
   navegacao(0);
   fnd_tipopes.Enabled := False;
   fnd_cpfcnpj.Enabled := False;

end;

procedure TfrmFornecedor.btnAntExecute(Sender: TObject);
begin
  navegacao(2);
end;

procedure TfrmFornecedor.btnCancelaExecute(Sender: TObject);
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

   fnd_codigo.SetFocus;

end;

procedure TfrmFornecedor.btnExcluirExecute(Sender: TObject);
Var
aSubTab : TArrayDim2;
n: Integer;
begin
   //SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'acessoratv';     aSubTab[n][1] := '';
   If Exclui2(cTabela, aSubTab,  fnd_codigo, btnExcluir) Then Begin;
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

procedure TfrmFornecedor.btnGravaExecute(Sender: TObject);
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
   fnd_codigo.SetFocus;


end;

procedure TfrmFornecedor.btnIniExecute(Sender: TObject);
begin
  navegacao(1);
end;

procedure TfrmFornecedor.btnNovoExecute(Sender: TObject);
begin
   acampo := 1;
   nNew   := acampo;
   btnGrava.Enabled := True;
   RefreshDados('S');
   limpaget;
   ativaButoes(1);
   lMostra := False;
   ativaget;
   fnd_tipopes.SetFocus;
   fnd_tipopes.ItemIndex := 1;
   fnd_tipopes.OnChange(nil);
end;

procedure TfrmFornecedor.btnProxExecute(Sender: TObject);
begin
  navegacao(3);
end;

procedure TfrmFornecedor.btnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmFornecedor.btnUltExecute(Sender: TObject);
begin
  navegacao(4);
end;

procedure TfrmFornecedor.fnd_cepExit(Sender: TObject);
begin
 verificacep( Sender, fnd_endereco, fnd_complem,  fnd_bairro, edNomCid, edNomUf, fnd_codcid  );
end;

initialization
  RegisterClass(TfrmFornecedor);


end.
