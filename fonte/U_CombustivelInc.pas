unit U_CombustivelInc;

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
  TfrmCombustivel = class(TForm)
    StatusBar1: TStatusBar;
    Banner: TPanel;
    imgLogo: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    cmb_codigo: TButtonedEdit;
    Label4: TLabel;
    cmb_nome: TEdit;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure RefreshDialog;
    Procedure RefreshDados(tipo: String);
    procedure cmb_codigoExit(Sender: TObject);
    procedure cmb_codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmb_codigoRightButtonClick(Sender: TObject);
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
  frmCombustivel: TfrmCombustivel;
  modConsulta, nOrdem : integer;


implementation

uses  UCalculadora,  u_dmEmp, uSistema, U_funcao, U_CnpjClass;

{$R *.dfm}

procedure TfrmCombustivel.cmb_codigoExit(Sender: TObject);
begin

  // Fun��o que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlComb ;
  cmb_nome.Text :=  Pesquisa.Relacao('combustivel',cmb_codigo,'cmb_codigo','cmb_nome');
  navegacao(5);


end;

procedure TfrmCombustivel.cmb_codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END    : cmb_codigoRightButtonClick(Self);
    VK_UP     : navegacao(1);
    VK_LEFT   : navegacao(2);
    VK_RIGHT  : navegacao(3);
    VK_DOWN   : navegacao(4);

  end;
Finally

End;

end;

procedure TfrmCombustivel.cmb_codigoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
if btnGrava.Enabled then
   Exit;

  // Inniciando o Formul�rio de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dscomb ;
  Pesquisa.sqlTabela :=  dmEmp.sqlComb ;
  Pesquisa.cliTabela :=  dmEmp.clicomb ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de combustivels';
  Pesquisa.nmTabela  := 'combustivel';
  //Pesquisa.NovoCad   := 'combustivel' ;
  // Display        campo   cabecalho           get         tan  indices
  Pesquisa.AddReg('cmb_codigo','C�digo'             ,'cmb_codigo' ,5  ,'por C�digo' );
  Pesquisa.AddReg('cmb_nome'  ,'Combustivel'        ,'cmb_nome'   ,20 ,'por combustivel' );

  Pesquisa.acessa(cmb_codigo);
  cmb_codigo.text   :=  Pesquisa.RecReg('cmb_codigo');
  cmb_nome.text     :=  Pesquisa.RecReg('cmb_nome');
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


procedure TfrmCombustivel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sqlNew.Close;
    dmEmp.cliComb.Close;
    frmCombustivel                   := nil ;
    action                            := cafree;
    fPrincipal.btnCombustivel.Enabled := True;
end;



procedure TfrmCombustivel.FormCreate(Sender: TObject);
Var
i: Integer;
begin
  cPre                        := 'cmb_';
  cTabela                     := 'combustivel';
  acampo                      := 1;
  sqlNew                      := TFDQuery.Create(nil);
  sqlNew.Connection           := dmEmp.SqlConSis;
  fPrincipal.btncombustivel.Enabled  := False;
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;
end;

procedure TfrmCombustivel.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmCombustivel.FormShow(Sender: TObject);
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
  lbCabeca01.Caption    := 'Tabela de Combustiveis';
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

procedure TfrmCombustivel.gravadados;
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, ctip_horalt,cCodSql, cIteSql,cValSql,cCodMnt : string ;
dData, dtip_datalt : TDate ;
i, tmp: Integer;
SQLQ : TFDQuery ;
begin
   gravadados2(cTabela,cPre,cPre+'codigo','X','', nNew, frmCombustivel, dmEmp.SqlConSis, aEdits );
end;

procedure TfrmCombustivel.limpaget;
Var
i: Integer;
begin
  limpaget2(aEdits);
end;

procedure TfrmCombustivel.navegacao(Ord: Integer);
begin
  if btnGrava.Enabled then
     Exit;

  navegacao2( Ord, acampo, btnIni, btnAnt, btnProx, btnUlt, sqlNew, dmEmp.sqlComb, cmb_codigo,'' );
  acampo := 0;
  RefreshDialog2(cPre,acampo, frmCombustivel, sqlNew, aEdits);
  acampo := 1;
end;

procedure TfrmCombustivel.RefreshDados(tipo: String);
var
  i: integer;
  cWhere, cQuery, cOrder: String;

begin
  RefreshDados2(acampo, tipo, '', cmb_codigo, sqlNew, dmEmp.sqlcomb );
end;

procedure TfrmCombustivel.RefreshDialog;
var
  i, tmp: Integer;
  frmx : TForm ;
begin
  RefreshDialog2(cPre,acampo, frmCombustivel, sqlNew, aEdits);
end;

procedure TfrmCombustivel.ToolButton9Click(Sender: TObject);
begin
  frmCalculadora := TfrmCalculadora.Create(Self);
  frmCalculadora.Show;

end;

procedure TfrmCombustivel.ativaButoes(tipo:Integer);
begin
ativaButoes2(Tipo,  btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt, sqlNew);
end;

procedure TfrmCombustivel.ativaget;
begin
  ativaget2(aEdits,cPre+'codigo',cTabela, btnGrava.Enabled, lMostra );
end;

procedure TfrmCombustivel.btnAlterarExecute(Sender: TObject);
begin
   btnNovo.Enabled    := False;
   btnAlterar.Enabled := False;
   btnGrava.Enabled   := True;
   ativaButoes(1);
   lMostra := True;
   ativaget;
   RefreshDialog;
   cmb_nome.SetFocus;
   acampo := 0;
   nNew   := acampo;
   navegacao(0);


end;

procedure TfrmCombustivel.btnAntExecute(Sender: TObject);
begin
  navegacao(2);
end;

procedure TfrmCombustivel.btnCancelaExecute(Sender: TObject);
begin
   acampo := 1;
   nNew   := acampo;
   btnNovo.Enabled := True;
   btnGrava.Enabled:= False;
   RefreshDados('S');
   lMostra := True;
   ativaButoes(0);
   ativaget;
   cmb_codigo.SetFocus;

end;

procedure TfrmCombustivel.btnExcluirExecute(Sender: TObject);
Var
aSubTab : TArrayDim2;
n: Integer;
begin
   //SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'acessoratv';     aSubTab[n][1] := '';
   If Exclui2(cTabela, aSubTab,  cmb_codigo, btnExcluir) Then Begin;
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

procedure TfrmCombustivel.btnGravaExecute(Sender: TObject);
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
   cmb_codigo.SetFocus;
end;

procedure TfrmCombustivel.btnIniExecute(Sender: TObject);
begin
  navegacao(1);
end;

procedure TfrmCombustivel.btnNovoExecute(Sender: TObject);
begin
   acampo := 1;
   nNew   := acampo;
   btnGrava.Enabled := True;
   RefreshDados('S');
   limpaget;
   ativaButoes(1);
   lMostra := False;
   ativaget;
   cmb_nome.SetFocus;
end;

procedure TfrmCombustivel.btnProxExecute(Sender: TObject);
begin
  navegacao(3);
end;

procedure TfrmCombustivel.btnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmCombustivel.btnUltExecute(Sender: TObject);
begin
  navegacao(4);
end;

initialization
  RegisterClass(TfrmCombustivel);


end.
