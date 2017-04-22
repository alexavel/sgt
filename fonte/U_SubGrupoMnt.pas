unit U_SubGrupoMnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, ImgList, ExtCtrls, ComCtrls, xmldom,
  XMLIntf, IdHTTP, msxmldom, XMLDoc, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, ExtDlgs, RibbonLunaStyleActnCtrls,
  ToolWin, ActnMan, ActnCtrls, jpeg, edittuning, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, U_ClasseUtil,U_Classcons, ZDataset, ZDatasetUtils,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,U_ClassCad, System.ImageList, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;


type
  Tfrmsubgrpmnt = class(TForm)
    StatusBar1: TStatusBar;
    Banner: TPanel;
    imgLogo: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    sgm_codigo: TButtonedEdit;
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
    sgm_codgrm: TButtonedEdit;
    Label2: TLabel;
    Label3: TLabel;
    edNomGrm: TEdit;
    sgm_nome: TEdit;
    Label4: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure RefreshDialog;
    Procedure RefreshDados(tipo: String);
    procedure sgm_codigoExit(Sender: TObject);
    procedure sgm_codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgm_codigoRightButtonClick(Sender: TObject);
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
    procedure sgm_codgrmRightButtonClick(Sender: TObject);
    procedure sgm_codgrmKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgm_codgrmExit(Sender: TObject);
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
  frmsubgrpmnt: Tfrmsubgrpmnt;
  modConsulta, nOrdem : integer;


implementation

uses  UCalculadora,  u_DmEmp, uSistema, U_funcao, U_CnpjClass;

{$R *.dfm}

procedure Tfrmsubgrpmnt.sgm_codgrmExit(Sender: TObject);
begin

  // Fun��o que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlgrupomnt ;
  edNomGrm.Text   :=  Pesquisa.Relacao('grupomnt',sgm_codgrm,'grm_codigo','grm_nome');

end;

procedure Tfrmsubgrpmnt.sgm_codgrmKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      sgm_codgrmRightButtonClick(Self);
  end;
Finally

End;

end;

procedure Tfrmsubgrpmnt.sgm_codgrmRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formul�rio de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsgrupomnt ;
  Pesquisa.sqlTabela :=  dmEmp.sqlgrupomnt ;
  Pesquisa.cliTabela :=  dmEmp.cligrupomnt ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Grupos de Pe�as e Servi�os';
  Pesquisa.nmTabela  := 'grupomnt' ;
  Pesquisa.NovoCad   := 'grupomnt' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('grm_codigo'  ,'C�digo'                  ,'grm_codigo' ,5  ,'por C�digo'       );
  Pesquisa.AddReg('grm_nome'    ,'Grupos'                  ,'grm_nome'   ,30 ,'por Grupo'         );


  Pesquisa.acessa(sgm_codgrm);
  sgm_codgrm.text   :=  Pesquisa.RecReg('grm_codigo');
  edNomGrm.text     :=  Pesquisa.RecReg('grm_nome');

  Pesquisa.Destroy;

 end;

procedure Tfrmsubgrpmnt.sgm_codigoExit(Sender: TObject);
begin

  // Fun��o que confirma os dados relacionados

  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlsubgrpmnt ;
  sgm_nome.Text :=  Pesquisa.Relacao('subgrpmnt',sgm_codigo,'sgm_codigo','sgm_nome');
  navegacao(5);
end;

procedure Tfrmsubgrpmnt.sgm_codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END    : sgm_codigoRightButtonClick(Self);
    VK_UP     : navegacao(1);
    VK_LEFT   : navegacao(2);
    VK_RIGHT  : navegacao(3);
    VK_DOWN   : navegacao(4);

  end;
Finally

End;

end;

procedure Tfrmsubgrpmnt.sgm_codigoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
if btnGrava.Enabled then
   Exit;

  // Inniciando o Formul�rio de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dssubgrpmnt ;
  Pesquisa.sqlTabela :=  dmEmp.Sqlsubgrpmnt ;
  Pesquisa.cliTabela :=  dmEmp.clisubgrpmnt ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Subgrupos de Pe�as e Servi�os';
  Pesquisa.nmTabela  := 'subgrpmnt';
//  Pesquisa.NovoCad   := 'subgrpmnt' ;
  // Display        campo   cabecalho                     get         tan  indices
  Pesquisa.AddReg('sgm_codigo'  ,'C�digo'                 ,'sgm_codigo' ,5  ,'por C�digo'       );
  Pesquisa.AddReg('sgm_nome'    ,'SubGrupo'               ,'sgm_nome'   ,30 ,'por SubGrupo'     );
  Pesquisa.AddReg('grm_nome'    ,'Grupo'                  ,'grm_nome'   ,15 ,'por Grupo'        );



  Pesquisa.acessa(sgm_codigo);
  sgm_codigo.text   :=  Pesquisa.RecReg('sgm_codigo');
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


procedure Tfrmsubgrpmnt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sqlNew.Close;
    dmEmp.clisubgrpmnt.Close;
    frmsubgrpmnt                 := nil ;
    action                       := cafree;
    fPrincipal.btnsubgrpmnt.Enabled := True;
end;



procedure Tfrmsubgrpmnt.FormCreate(Sender: TObject);
Var
i: Integer;
begin
  cPre                        := 'sgm_';
  cTabela                     := 'subgrpmnt';
  acampo                      := 1;
  sqlNew                      := TFDQuery.Create(nil);
  sqlNew.Connection           := dmEmp.SqlConSis;
  fPrincipal.btnsubgrpmnt.Enabled  := False;
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;
end;

procedure Tfrmsubgrpmnt.FormKeyPress(Sender: TObject; var Key: Char);
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

  End Else
    If key = #37 then Begin
       navegacao(3);
  End Else
    If key = #39 then Begin
       navegacao(2);

  end;
end;
procedure Tfrmsubgrpmnt.FormShow(Sender: TObject);
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
  lbCabeca01.Caption    := 'Tabela de Subgrupos de Pe�as e Servi�os';
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

procedure Tfrmsubgrpmnt.gravadados;
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, ctip_horalt,cCodSql, cIteSql,cValSql,cCodMnt : string ;
dData, dtip_datalt : TDate ;
i, tmp: Integer;
SQLQ : TFDQuery ;

begin
   gravadados2(cTabela,cPre,cPre+'codigo','X','', nNew, frmsubgrpmnt, dmEmp.SqlConSis, aEdits );
end;

procedure Tfrmsubgrpmnt.limpaget;
Var
i: Integer;
begin
  limpaget2(aEdits);
end;

procedure Tfrmsubgrpmnt.navegacao(Ord: Integer);
begin
  if btnGrava.Enabled then
     Exit;

  navegacao2( Ord, acampo, btnIni, btnAnt, btnProx, btnUlt, sqlNew, dmEmp.sqlsubgrpmnt, sgm_codigo,'' );
  acampo := 0;
  RefreshDialog2(cPre,acampo, frmsubgrpmnt, sqlNew, aEdits);
  acampo := 1;
end;

procedure Tfrmsubgrpmnt.RefreshDados(tipo: String);
var
  i: integer;
  cWhere, cQuery, cOrder: String;

begin
  RefreshDados2(acampo, tipo, '', sgm_codigo, sqlNew, dmEmp.sqlsubgrpmnt );
end;

procedure Tfrmsubgrpmnt.RefreshDialog;
var
  i, tmp: Integer;
  frmx : TForm ;
begin
  RefreshDialog2(cPre,acampo, frmsubgrpmnt, sqlNew, aEdits);
end;


procedure Tfrmsubgrpmnt.ToolButton9Click(Sender: TObject);
begin
  frmCalculadora := TfrmCalculadora.Create(Self);
  frmCalculadora.Show;

end;

procedure Tfrmsubgrpmnt.ativaButoes(tipo:Integer);
begin
ativaButoes2(Tipo,  btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt, sqlNew);
end;

procedure Tfrmsubgrpmnt.ativaget;
begin
  ativaget2(aEdits,cPre+'codigo',cTabela, btnGrava.Enabled, lMostra );
end;

procedure Tfrmsubgrpmnt.btnAlterarExecute(Sender: TObject);
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
   sgm_nome.SetFocus;
   navegacao(0);
end;

procedure Tfrmsubgrpmnt.btnAntExecute(Sender: TObject);
begin
  navegacao(2);
end;

procedure Tfrmsubgrpmnt.btnCancelaExecute(Sender: TObject);
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
   sgm_codigo.SetFocus;

end;

procedure Tfrmsubgrpmnt.btnExcluirExecute(Sender: TObject);
Var
aSubTab : TArrayDim2;
n: Integer;
begin
   //SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'acessoratv';     aSubTab[n][1] := '';
   If Exclui2(cTabela, aSubTab,  sgm_codigo, btnExcluir) Then Begin;
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

procedure Tfrmsubgrpmnt.btnGravaExecute(Sender: TObject);
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
   sgm_codigo.SetFocus;
end;

procedure Tfrmsubgrpmnt.btnIniExecute(Sender: TObject);
begin
  navegacao(1);
end;

procedure Tfrmsubgrpmnt.btnNovoExecute(Sender: TObject);
begin
   acampo := 1;
   nNew   := acampo;
   btnGrava.Enabled := True;
   RefreshDados('S');
   limpaget;
   ativaButoes(1);
   lMostra := False;
   ativaget;
   sgm_nome.SetFocus;
end;

procedure Tfrmsubgrpmnt.btnProxExecute(Sender: TObject);
begin
  navegacao(3);
end;

procedure Tfrmsubgrpmnt.btnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure Tfrmsubgrpmnt.btnUltExecute(Sender: TObject);
begin
  navegacao(4);
end;

initialization
  RegisterClass(Tfrmsubgrpmnt);


end.
