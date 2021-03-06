unit U_OrgTrans;

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
  TfrmOrgTrans = class(TForm)
    StatusBar1: TStatusBar;
    Banner: TPanel;
    imgLogo: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    ogt_codigo: TButtonedEdit;
    Label4: TLabel;
    ogt_nome: TEdit;
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
    Label2: TLabel;
    ogt_sigla: TEdit;
    ogt_telef01: TMaskEdit;
    Label21: TLabel;
    ogt_telef02: TMaskEdit;
    Label22: TLabel;
    ogt_codpct: TButtonedEdit;
    Label16: TLabel;
    edNomCnt: TEdit;
    Label17: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure RefreshDialog;
    Procedure RefreshDados(tipo: String);
    procedure ogt_codigoExit(Sender: TObject);
    procedure ogt_codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ogt_codigoRightButtonClick(Sender: TObject);
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
    procedure ogt_codpctRightButtonClick(Sender: TObject);
    procedure ogt_codpctKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ogt_codpctExit(Sender: TObject);
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
  frmOrgTrans: TfrmOrgTrans;
  modConsulta, nOrdem : integer;


implementation

uses  UCalculadora,  u_DmEmp, uSistema, U_funcao, U_CnpjClass, U_ClassconsContas;

{$R *.dfm}

procedure TfrmOrgTrans.ogt_codigoExit(Sender: TObject);
begin

  // Fun��o que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlorgtrans ;
  ogt_nome.Text :=  Pesquisa.Relacao('orgtrans',ogt_codigo,'ogt_codigo','ogt_nome');
  navegacao(5);
end;

procedure TfrmOrgTrans.ogt_codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      ogt_codigoRightButtonClick(Self);
    VK_UP     : navegacao(1);
    VK_LEFT   : navegacao(2);
    VK_RIGHT  : navegacao(3);
    VK_DOWN   : navegacao(4);
  end;
Finally

End;

end;

procedure TfrmOrgTrans.ogt_codigoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
if btnGrava.Enabled then
   Exit;

  // Inniciando o Formul�rio de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsorgtrans ;
  Pesquisa.sqlTabela :=  dmEmp.sqlorgtrans;
  Pesquisa.cliTabela :=  dmEmp.cliorgtrans ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de �rg�os de Tr�nsito';
  Pesquisa.nmTabela  := 'orgtrans';
  //Pesquisa.NovoCad   := 'tipo' ;
  // Display        campo   cabecalho           get         tan  indices
  Pesquisa.AddReg('ogt_codigo'  ,'C�digo'    ,'ogt_codigo' ,5  ,'por C�digo'    );
  Pesquisa.AddReg('ogt_nome'    ,'Descri��o' ,'ogt_nome'   ,40 ,'por Descri��o' );
  Pesquisa.AddReg('ogt_sigla'   ,'Sigla'     ,'ogt_sigla'  ,20 ,'por Sigla' );
  Pesquisa.AddReg('ogt_telef01' ,'Tel 01'    ,'ogt_telef01',10 ,'por Tel 01' );
  Pesquisa.AddReg('ogt_telef02' ,'Tel 02'    ,'ogt_telef02',10 ,'por Tel 02' );

  Pesquisa.acessa(ogt_codigo);
  ogt_codigo.text   :=  Pesquisa.RecReg('ogt_codigo');
  ogt_nome.text     :=  Pesquisa.RecReg('ogt_nome');
  ogt_sigla.text    :=  Pesquisa.RecReg('ogt_sigla');
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


procedure TfrmOrgTrans.ogt_codpctExit(Sender: TObject);
Var
  Pesquisa : TClasConsultaConta;
begin
  if ogt_codpct.Text <> '' then begin
      // Fun��o que confirma os dados relacionados
      Pesquisa := TClasConsultaConta.Create;
      edNomCnt.Text :=  Pesquisa.Relacao('pct_nome',ogt_codpct.Text);
  end;

end;

procedure TfrmOrgTrans.ogt_codpctKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      ogt_codpctRightButtonClick(Self);
  end;
Finally

End;

end;
procedure TfrmOrgTrans.ogt_codpctRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsultaConta;
begin
  // Inniciando o Formul�rio de Consulta
  Pesquisa := TClasConsultaConta.Create;
  Pesquisa.acessa(ogt_codpct,'');
  edNomCnt.Text :=  Pesquisa.Relacao('pct_nome',ogt_codpct.Text);
  Pesquisa.Destroy;

end;

procedure TfrmOrgTrans.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sqlNew.Close;
    dmEmp.clicor.Close;
    frmorgtrans                    := nil ;
    action                       := cafree;
    fPrincipal.btnorgtrans.Enabled   := True;
end;



procedure TfrmOrgTrans.FormCreate(Sender: TObject);
Var
i: Integer;
begin
  cPre                        := 'ogt_';
  cTabela                     := 'orgtrans';
  acampo                      := 1;
  sqlNew                      := TFDQuery.Create(nil);
  sqlNew.Connection           := dmEmp.SqlConSis;
  fPrincipal.btncor.Enabled  := False;
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;
end;


procedure TfrmOrgTrans.FormKeyPress(Sender: TObject; var Key: Char);
Begin
  //verifica se a tecla pressionada � a tecla ENTER, conhecida como #13
  If key = #13 then Begin
    //se for, passa o foco para o pr�ximo campo, zerando o valor da vari�vel Key
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

  end;
end;
procedure TfrmOrgTrans.FormShow(Sender: TObject);
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
  lbCabeca01.Caption    := 'Tabela de �rg�os de Tr�nsito';
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

procedure TfrmOrgTrans.gravadados;
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, ctip_horalt,cCodSql, cIteSql,cValSql,cCodMnt : string ;
dData, dtip_datalt : TDate ;
i, tmp: Integer;
SQLQ : TFDQuery ;
begin
   gravadados2(cTabela,cPre,cPre+'codigo','X','', nNew, frmorgtrans, dmEmp.SqlConSis, aEdits );
end;

procedure TfrmOrgTrans.limpaget;
Var
i: Integer;
begin
  limpaget2(aEdits);
end;

procedure TfrmOrgTrans.navegacao(Ord: Integer);
begin
  if btnGrava.Enabled then
     Exit;

  navegacao2( Ord, acampo, btnIni, btnAnt, btnProx, btnUlt, sqlNew, dmEmp.sqlorgtrans, ogt_codigo,'' );
  acampo := 0;
  RefreshDialog2(cPre,acampo, frmorgtrans, sqlNew, aEdits);
  acampo := 1;
end;


procedure TfrmOrgTrans.RefreshDados(tipo: String);
var
  i: integer;
  cWhere, cQuery, cOrder: String;

begin
  RefreshDados2(acampo, tipo, '', ogt_codigo, sqlNew, dmEmp.sqlorgtrans );
end;

procedure TfrmOrgTrans.RefreshDialog;
var
  i, tmp: Integer;
  frmx : TForm ;
begin
  RefreshDialog2(cPre,acampo, frmorgtrans, sqlNew, aEdits);
end;

procedure TfrmOrgTrans.ToolButton9Click(Sender: TObject);
begin
  frmCalculadora := TfrmCalculadora.Create(Self);
  frmCalculadora.Show;

end;

procedure TfrmOrgTrans.ativaButoes(tipo:Integer);
begin
ativaButoes2(Tipo,  btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt, sqlNew);
end;


procedure TfrmOrgTrans.ativaget;
begin
  ativaget2(aEdits,cPre+'codigo',cTabela, btnGrava.Enabled, lMostra );
end;

procedure TfrmOrgTrans.btnAlterarExecute(Sender: TObject);
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
   ogt_nome.SetFocus;
   navegacao(0);

end;

procedure TfrmOrgTrans.btnAntExecute(Sender: TObject);
begin
  navegacao(2);
end;

procedure TfrmOrgTrans.btnCancelaExecute(Sender: TObject);
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

   ogt_codigo.SetFocus;

end;

procedure TfrmOrgTrans.btnExcluirExecute(Sender: TObject);
Var
aSubTab : TArrayDim2;
n: Integer;
begin
   //SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'acessoratv';     aSubTab[n][1] := '';
   If Exclui2(cTabela, aSubTab,  ogt_codigo, btnExcluir) Then Begin;
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

procedure TfrmOrgTrans.btnGravaExecute(Sender: TObject);
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
   ogt_codigo.SetFocus;
end;

procedure TfrmOrgTrans.btnIniExecute(Sender: TObject);
begin
  navegacao(1);
end;

procedure TfrmOrgTrans.btnNovoExecute(Sender: TObject);
begin
   acampo := 1;
   nNew   := acampo;
   btnGrava.Enabled := True;
   RefreshDados('S');
   limpaget;
   ativaButoes(1);
   lMostra := False;
   ativaget;
   ogt_nome.SetFocus;
end;

procedure TfrmOrgTrans.btnProxExecute(Sender: TObject);
begin
  navegacao(3);
end;

procedure TfrmOrgTrans.btnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmOrgTrans.btnUltExecute(Sender: TObject);
begin
  navegacao(4);
end;

initialization
  RegisterClass(TfrmOrgTrans);


end.
