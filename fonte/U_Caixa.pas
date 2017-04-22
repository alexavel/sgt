unit U_Caixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, ImgList, ExtCtrls, ComCtrls, xmldom,
  XMLIntf, IdHTTP, msxmldom, XMLDoc, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, ExtDlgs, RibbonLunaStyleActnCtrls,
  ToolWin, ActnMan, ActnCtrls, jpeg, edittuning, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, U_ClasseUtil,U_Classcons, ZDataset, ZDatasetUtils,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, U_ClassCad, System.ImageList, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client ;


type
  TfrmCaixa = class(TForm)
    StatusBar1: TStatusBar;
    Banner: TPanel;
    imgLogo: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    cxa_codigo: TButtonedEdit;
    Label4: TLabel;
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
    cxa_codcct: TButtonedEdit;
    Label2: TLabel;
    Label3: TLabel;
    edNomBco: TEdit;
    actionsub: TActionManager;
    CmbBtnInc: TAction;
    cmbBtnExc: TAction;
    Label5: TLabel;
    Label6: TLabel;
    edCodBco: TEdit;
    edNomAge: TEdit;
    edNomCta: TEdit;
    cxa_ativo: TCheckBox;
    cxa_codusu: TButtonedEdit;
    Label7: TLabel;
    edNomUsu: TEdit;
    Label8: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure RefreshDialog;
    Procedure RefreshDados(tipo: String);
    procedure cxa_codigoExit(Sender: TObject);
    procedure cxa_codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxa_codigoRightButtonClick(Sender: TObject);
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
    procedure cxa_codcctRightButtonClick(Sender: TObject);
    procedure cxa_codcctKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxa_codcctExit(Sender: TObject);
    procedure cxa_codusuRightButtonClick(Sender: TObject);
    procedure cxa_codusuKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxa_codusuExit(Sender: TObject);
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
    cQueryPad : String;
    aEdits : TArrayComp;
    cPre, cTabela: String;


    { Public declarations }
  end;

var
  frmCaixa: TfrmCaixa;
  modConsulta, nOrdem : integer;


implementation

uses  UCalculadora,  u_DmEmp, uSistema, U_funcao, U_CnpjClass;

{$R *.dfm}

procedure TfrmCaixa.cxa_codcctExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlccorrente ;
  edCodBco.Text :=  Pesquisa.Relacao('ccorrente',cxa_codcct,'cct_codigo','cct_codbco');
  edNomBco.Text :=  Pesquisa.Relacao('ccorrente',cxa_codcct,'cct_codigo','bco_nome');
  edNomage.Text :=  Pesquisa.Relacao('ccorrente',cxa_codcct,'cct_codigo','cct_agencia');
  edNomcta.Text :=  Pesquisa.Relacao('ccorrente',cxa_codcct,'cct_codigo','cct_nrconta');

end;

procedure TfrmCaixa.cxa_codcctKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      cxa_codcctRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmCaixa.cxa_codcctRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsCcorrente ;
  Pesquisa.sqlTabela :=  dmEmp.sqlCcorrente ;
  Pesquisa.cliTabela :=  dmEmp.cliCcorrente ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Bancos Financeiros';
  Pesquisa.nmTabela  := 'ccorrente' ;
  //Pesquisa.NovoCad   := 'Banco' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('cct_codigo'  ,'Cd Conta'      ,'cxa_codcct' ,5  ,'por Código' );
  Pesquisa.AddReg('cct_codbco'  ,'Nr Banco'      ,'edCodBco'   ,5  ,'por Nr Banco' );
  Pesquisa.AddReg('bco_nome'    ,'Banco'         ,'edNomBco'   ,25 ,'por Banco' );
  Pesquisa.AddReg('cct_agencia' ,'Agencia'       ,'edNomAge'   ,6  ,'por Agencia' );
  Pesquisa.AddReg('cct_nrconta' ,'Nr Conta'      ,'edNomCta'   ,6  ,'por Conta' );


  Pesquisa.acessa(cxa_codcct);
  cxa_codcct.text   :=  Pesquisa.RecReg('cct_codigo');
  //edNomBco.text     :=  Pesquisa.RecReg('bco_nome');
  Pesquisa.Destroy;

 end;

procedure TfrmCaixa.cxa_codigoExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados

  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlcaixa ;
  navegacao(5);


end;

procedure TfrmCaixa.cxa_codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END    : cxa_codigoRightButtonClick(Self);
    VK_UP     : navegacao(1);
    VK_LEFT   : navegacao(2);
    VK_RIGHT  : navegacao(3);
    VK_DOWN   : navegacao(4);

  end;
Finally

End;

end;

procedure TfrmCaixa.cxa_codigoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
if btnGrava.Enabled then
   Exit;

  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dscaixa ;
  Pesquisa.sqlTabela :=  dmEmp.sqlCaixa ;
  Pesquisa.cliTabela :=  dmEmp.clicaixa ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Caixa';
  Pesquisa.nmTabela  := 'caixa';
//  Pesquisa.NovoCad   := 'caixa' ;
  // Display        campo   cabecalho                     get         tan  indices
  Pesquisa.AddReg('cxa_codigo'  ,'Caixa'                  ,'cxa_codigo' ,5 ,'por Código'    );
  Pesquisa.AddReg('cxa_codcct'  ,'Cd Conta'               ,'cxa_codcct' ,6 ,'por Cd Conta'  );
  Pesquisa.AddReg('cct_codbco'  ,'Nr Banco'               ,'cct_codbco' ,6 ,'por Nr do Banco'  );
  Pesquisa.AddReg('cct_agencia' ,'Agencia'                ,'cct_agencia',9 ,'por Agencia'   );
  Pesquisa.AddReg('cct_nrconta' ,'Conta'                  ,'cct_nrconta',9 ,'por Nr Conta'  );
  Pesquisa.AddReg('bco_nome'    ,'Banco'                  ,'bco_nome',  30 ,'por Nome'  );


  Pesquisa.acessa(cxa_codigo);
  cxa_codigo.text   :=  Pesquisa.RecReg('cxa_codigo');
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


procedure TfrmCaixa.cxa_codusuExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlusuario ;
  edNomUsu.Text :=  Pesquisa.Relacao('usuario',cxa_codusu,'usu_codusu','usu_nome');

end;

procedure TfrmCaixa.cxa_codusuKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      cxa_codusuRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmCaixa.cxa_codusuRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsusuario ;
  Pesquisa.sqlTabela :=  dmEmp.sqlusuario ;
  Pesquisa.cliTabela :=  dmEmp.cliusuario ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Usuários do Sistema';
  Pesquisa.nmTabela  := 'usuario' ;
  //Pesquisa.NovoCad   := 'Banco' ;
  // Display        campo       cabecalho            get         tan  indices
  Pesquisa.AddReg('usu_codusu'      ,'Cd Usuário'    ,'cxa_codusu' ,5  ,'por Código' );
  Pesquisa.AddReg('usu_nome'        ,'Nome Completo' ,'edNomUsu'   ,25 ,'por Nome' );
  Pesquisa.AddReg('usu_login'       ,'login'         ,''           ,10 ,'por Login' );


  Pesquisa.acessa(cxa_codusu);
  cxa_codusu.text   :=  Pesquisa.RecReg('usu_codusu');
  //edNomBco.text     :=  Pesquisa.RecReg('bco_nome');
  Pesquisa.Destroy;

end;

procedure TfrmCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sqlNew.Close;
    dmEmp.clicaixa.Close;
    frmcaixa                     := nil ;
    action                       := cafree;
    fPrincipal.btncaixa.Enabled  := True;
end;



procedure TfrmCaixa.FormCreate(Sender: TObject);
Var
i: Integer;
begin
  cPre                        := 'cxa_';
  cTabela                     := 'caixa';
  acampo                      := 1;
  sqlNew                      := TFDQuery.Create(nil);
  sqlNew.Connection           := dmEmp.SqlConSis;
  fPrincipal.btncaixa.Enabled  := False;
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;
end;
procedure TfrmCaixa.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmCaixa.FormShow(Sender: TObject);
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
  lbCabeca01.Caption    := 'Cadstro de Conta Corrente';
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

procedure TfrmCaixa.gravadados;
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, ctip_horalt,cCodSql, cIteSql,cValSql,cCodMnt : string ;
dData, dtip_datalt : TDate ;
i, tmp: Integer;
SQLQ : TFDQuery ;

begin
   gravadados2(cTabela,cPre,cPre+'codigo','X','', nNew, frmCaixa, dmEmp.SqlConSis, aEdits );
end;

procedure TfrmCaixa.limpaget;
Var
i: Integer;
begin
  limpaget2(aEdits);
end;

procedure TfrmCaixa.navegacao(Ord: Integer);
begin
  if btnGrava.Enabled then
     Exit;

  navegacao2( Ord, acampo, btnIni, btnAnt, btnProx, btnUlt, sqlNew, dmemp.sqlCaixa, cxa_codigo,'' );
  acampo := 0;
  RefreshDialog2(cPre,acampo, frmCaixa, sqlNew, aEdits);
  acampo := 1;
end;

procedure TfrmCaixa.RefreshDados(tipo: String);
var
  i: integer;
  cWhere, cQuery, cOrder: String;

begin
  RefreshDados2(acampo, tipo,'',  cxa_codigo, sqlNew, dmEmp.sqlcaixa );
end;

procedure TfrmCaixa.RefreshDialog;
var
  i, tmp: Integer;
  frmx : TForm ;
begin
  RefreshDialog2(cPre,acampo, frmCaixa, sqlNew, aEdits);
end;

procedure TfrmCaixa.ToolButton9Click(Sender: TObject);
begin
  frmCalculadora := TfrmCalculadora.Create(Self);
  frmCalculadora.Show;

end;

procedure TfrmCaixa.ativaButoes(tipo:Integer);
begin
  ativaButoes2(Tipo,  btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt, sqlNew);
end;

procedure TfrmCaixa.ativaget;
begin
  ativaget2(aEdits,cPre+'codigo',cTabela, btnGrava.Enabled, lMostra );
end;


procedure TfrmCaixa.btnAlterarExecute(Sender: TObject);
begin
   btnNovo.Enabled    := False;
   btnAlterar.Enabled := False;
   btnGrava.Enabled   := True;
   ativaButoes(1);
   lMostra := True;
   ativaget;
   RefreshDialog;
   cxa_codcct.SetFocus;
   acampo := 0;
   nNew   := acampo;
   navegacao(0);

end;

procedure TfrmCaixa.btnAntExecute(Sender: TObject);
begin
  navegacao(2);
end;

procedure TfrmCaixa.btnCancelaExecute(Sender: TObject);
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

   cxa_codigo.SetFocus;

end;

procedure TfrmCaixa.btnExcluirExecute(Sender: TObject);
Var
aSubTab : TArrayDim2;
n: Integer;
begin
   //SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'acessoratv';     aSubTab[n][1] := '';
   If Exclui2(cTabela, aSubTab,  cxa_codigo, btnExcluir) Then Begin;
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

procedure TfrmCaixa.btnGravaExecute(Sender: TObject);
begin
   gravadados;
   if FechaSubFrm(cTabela) then Close;

   acampo := 1;
   nNew   := acampo;
   btnNovo.Enabled := True;
   btnGrava.Enabled:= False;
   RefreshDados('T');
   ativaButoes(0);
   limpaget;
   lMostra := True;
   ativaget;
    Case lMostra of
      False  : navegacao(4);
      True   : navegacao(5);
     end;
   cxa_codigo.SetFocus;
end;

procedure TfrmCaixa.btnIniExecute(Sender: TObject);
begin
  navegacao(1);
end;

procedure TfrmCaixa.btnNovoExecute(Sender: TObject);
begin
   acampo := 1;
   nNew   := acampo;
   btnGrava.Enabled := True;
   RefreshDados('S');
   limpaget;
   ativaButoes(1);
   lMostra := False;
   ativaget;
   cxa_codcct.SetFocus;
end;

procedure TfrmCaixa.btnProxExecute(Sender: TObject);
begin
  navegacao(3);
end;

procedure TfrmCaixa.btnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmCaixa.btnUltExecute(Sender: TObject);
begin
  navegacao(4);
end;

initialization
  RegisterClass(TfrmCaixa);


end.
