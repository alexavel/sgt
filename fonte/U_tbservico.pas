unit U_tbservico;

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
  Tfrmtbservico = class(TForm)
    StatusBar1: TStatusBar;
    Banner: TPanel;
    imgLogo: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    tsm_codigo: TButtonedEdit;
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
    tsm_codsgm: TButtonedEdit;
    Label2: TLabel;
    Label3: TLabel;
    edNomSgm: TEdit;
    tsm_nome: TEdit;
    Label4: TLabel;
    tsm_vlrhor: TMaskEdit;
    Label10: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure RefreshDialog;
    Procedure RefreshDados(tipo: String);
    procedure tsm_codigoExit(Sender: TObject);
    procedure tsm_codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tsm_codigoRightButtonClick(Sender: TObject);
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
    procedure tsm_codsgmRightButtonClick(Sender: TObject);
    procedure tsm_codsgmKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tsm_codsgmExit(Sender: TObject);
    procedure tsm_vlrhorKeyPress(Sender: TObject; var Key: Char);
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
  frmtbservico: Tfrmtbservico;
  modConsulta, nOrdem : integer;


implementation

uses  UCalculadora,  u_DmEmp, uSistema, U_funcao, U_CnpjClass;

{$R *.dfm}

procedure Tfrmtbservico.tsm_codsgmExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlsubgrpmnt ;
  edNomSgm.Text   :=  Pesquisa.Relacao('subgrpmnt',tsm_codsgm,'sgm_codigo','sgm_nome');

end;

procedure Tfrmtbservico.tsm_codsgmKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      tsm_codsgmRightButtonClick(Self);
  end;
Finally

End;

end;

procedure Tfrmtbservico.tsm_codsgmRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dssubgrpmnt ;
  Pesquisa.sqlTabela :=  dmEmp.sqlsubgrpmnt ;
  Pesquisa.cliTabela :=  dmEmp.clisubgrpmnt ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Subgrupos de Peças e Serviços';
  Pesquisa.nmTabela  := 'subgrpmnt' ;
  Pesquisa.NovoCad   := 'subgrpmnt' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('sgm_codigo'  ,'Código'                  ,'sgm_codigo' ,5  ,'por Código'       );
  Pesquisa.AddReg('sgm_nome'    ,'Grupos'                  ,'sgm_nome'   ,30 ,'por Grupo'        );
  Pesquisa.AddReg('grm_nome'    ,'Grupo'                   ,'grm_nome'   ,15 ,'por Grupo'        );


  Pesquisa.acessa(tsm_codsgm);
  tsm_codsgm.text   :=  Pesquisa.RecReg('sgm_codigo');
  edNomSgm.text     :=  Pesquisa.RecReg('sgm_nome');


  Pesquisa.Destroy;

 end;

procedure Tfrmtbservico.tsm_vlrhorKeyPress(Sender: TObject; var Key: Char);
begin
    KeyValor( Sender , Key );
end;

procedure Tfrmtbservico.tsm_codigoExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados

  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqltbservico ;
  tsm_nome.Text :=  Pesquisa.Relacao('tbservico',tsm_codigo,'tsm_codigo','tsm_nome');
  navegacao(5);
end;

procedure Tfrmtbservico.tsm_codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END    : tsm_codigoRightButtonClick(Self);
    VK_UP     : navegacao(1);
    VK_LEFT   : navegacao(2);
    VK_RIGHT  : navegacao(3);
    VK_DOWN   : navegacao(4);

  end;
Finally

End;

end;

procedure Tfrmtbservico.tsm_codigoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
if btnGrava.Enabled then
   Exit;

  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dstbservico ;
  Pesquisa.sqlTabela :=  dmEmp.Sqltbservico ;
  Pesquisa.cliTabela :=  dmEmp.clitbservico ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Servicos Automotivos';
  Pesquisa.nmTabela  := 'tbservico';
//  Pesquisa.NovoCad   := 'tbservico' ;
  // Display        campo   cabecalho                     get         tan  indices
  Pesquisa.AddReg('tsm_codigo'  ,'Código'                 ,'tsm_codigo' ,5  ,'por Código'       );
  Pesquisa.AddReg('tsm_nome'    ,'Serviço'                ,'tsm_nome'   ,30 ,'por Serviço'      );
  Pesquisa.AddReg('tsm_vlrhor'  ,'Valor'                  ,'tsm_vlrhor' ,10 ,'por Valor'        );
  Pesquisa.AddReg('sgm_nome'    ,'SubGrupo'               ,'tsm_nome'   ,30 ,'por SubGrupo'     );
  Pesquisa.AddReg('grm_nome'    ,'Grupo'                  ,'grm_nome'   ,15 ,'por Grupo'        );



  Pesquisa.acessa(tsm_codigo);
  tsm_codigo.text   :=  Pesquisa.RecReg('tsm_codigo');
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


procedure Tfrmtbservico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sqlNew.Close;
    dmEmp.clitbservico.Close;
    frmtbservico                 := nil ;
    action                       := cafree;
    fPrincipal.btntbservico.Enabled := True;
end;



procedure Tfrmtbservico.FormCreate(Sender: TObject);
Var
i: Integer;
begin
  cPre                        := 'tsm_';
  cTabela                     := 'tbservico';
  acampo                      := 1;
  sqlNew                      := TFDQuery.Create(nil);
  sqlNew.Connection           := dmEmp.SqlConSis;
  fPrincipal.btntbservico.Enabled  := False;
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;
end;

procedure Tfrmtbservico.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure Tfrmtbservico.FormShow(Sender: TObject);
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
  lbCabeca01.Caption    := 'Tabela de Serviços Automotivos';
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

procedure Tfrmtbservico.gravadados;
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, ctip_horalt,cCodSql, cIteSql,cValSql,cCodMnt : string ;
dData, dtip_datalt : TDate ;
i, tmp: Integer;
SQLQ : TFDQuery ;

begin
   gravadados2(cTabela,cPre,cPre+'codigo','X','', nNew, frmtbservico, dmEmp.SqlConSis, aEdits );
end;

procedure Tfrmtbservico.limpaget;
Var
i: Integer;
begin
  limpaget2(aEdits);
end;

procedure Tfrmtbservico.navegacao(Ord: Integer);
begin
  if btnGrava.Enabled then
     Exit;

  navegacao2( Ord, acampo, btnIni, btnAnt, btnProx, btnUlt, sqlNew, dmEmp.sqltbservico, tsm_codigo,'' );
  acampo := 0;
  RefreshDialog2(cPre,acampo, frmtbservico, sqlNew, aEdits);
  acampo := 1;
end;

procedure Tfrmtbservico.RefreshDados(tipo: String);
var
  i: integer;
  cWhere, cQuery, cOrder: String;

begin
  RefreshDados2(acampo, tipo, '', tsm_codigo, sqlNew, dmEmp.sqltbservico );
end;

procedure Tfrmtbservico.RefreshDialog;
var
  i, tmp: Integer;
  frmx : TForm ;
begin
  RefreshDialog2(cPre,acampo, frmtbservico, sqlNew, aEdits);
end;


procedure Tfrmtbservico.ToolButton9Click(Sender: TObject);
begin
  frmCalculadora := TfrmCalculadora.Create(Self);
  frmCalculadora.Show;

end;

procedure Tfrmtbservico.ativaButoes(tipo:Integer);
begin
ativaButoes2(Tipo,  btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt, sqlNew);
end;

procedure Tfrmtbservico.ativaget;
begin
  ativaget2(aEdits,cPre+'codigo',cTabela, btnGrava.Enabled, lMostra );
end;

procedure Tfrmtbservico.btnAlterarExecute(Sender: TObject);
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
   tsm_nome.SetFocus;
   navegacao(0);
end;

procedure Tfrmtbservico.btnAntExecute(Sender: TObject);
begin
  navegacao(2);
end;

procedure Tfrmtbservico.btnCancelaExecute(Sender: TObject);
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
   tsm_codigo.SetFocus;

end;

procedure Tfrmtbservico.btnExcluirExecute(Sender: TObject);
Var
aSubTab : TArrayDim2;
n: Integer;
begin
   //SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'acessoratv';     aSubTab[n][1] := '';
   If Exclui2(cTabela, aSubTab,  tsm_codigo, btnExcluir) Then Begin;
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

procedure Tfrmtbservico.btnGravaExecute(Sender: TObject);
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
   tsm_codigo.SetFocus;
end;

procedure Tfrmtbservico.btnIniExecute(Sender: TObject);
begin
  navegacao(1);
end;

procedure Tfrmtbservico.btnNovoExecute(Sender: TObject);
begin
   acampo := 1;
   nNew   := acampo;
   btnGrava.Enabled := True;
   RefreshDados('S');
   limpaget;
   ativaButoes(1);
   lMostra := False;
   ativaget;
   tsm_nome.SetFocus;
end;

procedure Tfrmtbservico.btnProxExecute(Sender: TObject);
begin
  navegacao(3);
end;

procedure Tfrmtbservico.btnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure Tfrmtbservico.btnUltExecute(Sender: TObject);
begin
  navegacao(4);
end;

initialization
  RegisterClass(Tfrmtbservico);

end.
