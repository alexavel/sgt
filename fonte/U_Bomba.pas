unit U_Bomba;

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
  TfrmBomba = class(TForm)
    StatusBar1: TStatusBar;
    Banner: TPanel;
    imgLogo: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    bmb_codigo: TButtonedEdit;
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
    bmb_codtnq: TButtonedEdit;
    Label2: TLabel;
    Label3: TLabel;
    edNomTnq: TEdit;
    actionsub: TActionManager;
    CmbBtnInc: TAction;
    cmbBtnExc: TAction;
    bmb_nome: TEdit;
    Label4: TLabel;
    bmb_nmrinc: TMaskEdit;
    Label26: TLabel;
    bmb_ativo: TCheckBox;
    bmb_codcmb: TEdit;
    Label22: TLabel;
    edNomCmb: TEdit;
    Label23: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure RefreshDialog;
    Procedure RefreshDados(tipo: String);
    procedure bmb_codigoExit(Sender: TObject);
    procedure bmb_codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bmb_codigoRightButtonClick(Sender: TObject);
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
    procedure bmb_codtnqRightButtonClick(Sender: TObject);
    procedure bmb_codtnqKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bmb_codtnqExit(Sender: TObject);
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
  frmBomba: TfrmBomba;
  modConsulta, nOrdem : integer;


implementation

uses  UCalculadora,  u_DmEmp, uSistema, U_funcao, U_CnpjClass;

{$R *.dfm}

procedure TfrmBomba.bmb_codtnqExit(Sender: TObject);
begin

  // Fun��o que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmemp.sqlTanque ;
  edNomTnq.Text   :=  Pesquisa.Relacao('tanque',bmb_codtnq,'tnq_codigo','tnq_nome');
  bmb_codcmb.Text :=  Pesquisa.Relacao('tanque',bmb_codtnq,'tnq_codigo','tnq_codcmb');
  edNomCmb.Text   :=  Pesquisa.Relacao('tanque',bmb_codtnq,'tnq_codigo','cmb_nome');

end;

procedure TfrmBomba.bmb_codtnqKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      bmb_codtnqRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmBomba.bmb_codtnqRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formul�rio de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsTanque ;
  Pesquisa.sqlTabela :=  dmEmp.sqlTanque ;
  Pesquisa.cliTabela :=  dmEmp.cliTanque ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Tanques de Abastecimento';
  Pesquisa.nmTabela  := 'tanque' ;
  Pesquisa.NovoCad   := 'tanque' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('tnq_codigo'  ,'C�digo'                  ,'tnq_codigo' ,5  ,'por C�digo'       );
  Pesquisa.AddReg('tnq_nome'    ,'Tanque'                  ,'tnq_nome'   ,30 ,'por Nome'         );
  Pesquisa.AddReg('cmb_nome'    ,'Combust�uvel'            ,'tnq_codbco' ,15 ,'por Combustivel'  );
  Pesquisa.AddReg('tnq_ltsetq'  ,'Estoque'                 ,'tnq_ltsetq' ,10 ,'por Estoque'      );


  Pesquisa.acessa(bmb_codtnq);
  bmb_codtnq.text   :=  Pesquisa.RecReg('tnq_codigo');
  edNomTnq.text     :=  Pesquisa.RecReg('tnq_nome');
  bmb_codcmb.text   :=  Pesquisa.RecReg('tnq_codcmb');
  edNomCmb.text     :=  Pesquisa.RecReg('cmb_nome');

  Pesquisa.Destroy;

 end;

procedure TfrmBomba.bmb_codigoExit(Sender: TObject);
begin

  // Fun��o que confirma os dados relacionados

  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlbomba ;
  bmb_nome.Text :=  Pesquisa.Relacao('bomba',bmb_codigo,'bmb_codigo','bmb_nome');
  navegacao(5);

end;

procedure TfrmBomba.bmb_codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END    : bmb_codigoRightButtonClick(Self);
    VK_UP     : navegacao(1);
    VK_LEFT   : navegacao(2);
    VK_RIGHT  : navegacao(3);
    VK_DOWN   : navegacao(4);

  end;
Finally

End;

end;

procedure TfrmBomba.bmb_codigoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
if btnGrava.Enabled then
   Exit;

  // Inniciando o Formul�rio de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsbomba ;
  Pesquisa.sqlTabela :=  dmEmp.Sqlbomba ;
  Pesquisa.cliTabela :=  dmEmp.clibomba ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Bombas de Abastecimento';
  Pesquisa.nmTabela  := 'bomba';
//  Pesquisa.NovoCad   := 'bomba' ;
  // Display        campo   cabecalho                     get         tan  indices
  Pesquisa.AddReg('bmb_codigo'  ,'C�digo'                 ,'bmb_codigo' ,5  ,'por C�digo'       );
  Pesquisa.AddReg('bmb_nome'    ,'Bomba'                  ,'bmb_nome'   ,30 ,'por Nome'         );
  Pesquisa.AddReg('cmb_nome'    ,'Combust�uvel'           ,'cmb_nome'   ,15 ,'por Combustivel'  );



  Pesquisa.acessa(bmb_codigo);
  bmb_codigo.text   :=  Pesquisa.RecReg('bmb_codigo');
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


procedure TfrmBomba.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sqlNew.Close;
    dmEmp.clibomba.Close;
    frmbomba                 := nil ;
    action                       := cafree;
    fPrincipal.btnbomba.Enabled := True;
end;



procedure TfrmBomba.FormCreate(Sender: TObject);
Var
i: Integer;
begin
  cPre                        := 'bmb_';
  cTabela                     := 'bomba';
  acampo                      := 1;
  sqlNew                      := TFDQuery.Create(nil);
  sqlNew.Connection           := dmemp.SqlConSis;
  fPrincipal.btnbomba.Enabled  := False;
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;
end;

procedure TfrmBomba.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmBomba.FormShow(Sender: TObject);
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
  lbCabeca01.Caption    := 'Cadstro de Bombas de Abastecimento';
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

procedure TfrmBomba.gravadados;
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, ctip_horalt,cCodSql, cIteSql,cValSql,cCodMnt : string ;
dData, dtip_datalt : TDate ;
i, tmp: Integer;
SQLQ : TFDQuery ;

begin
   gravadados2(cTabela,cPre,cPre+'codigo','X','', nNew, frmbomba, dmEmp.SqlConSis, aEdits );
end;

procedure TfrmBomba.limpaget;
Var
i: Integer;
begin
  limpaget2(aEdits);
end;

procedure TfrmBomba.navegacao(Ord: Integer);
begin
  if btnGrava.Enabled then
     Exit;

  navegacao2( Ord, acampo, btnIni, btnAnt, btnProx, btnUlt, sqlNew, dmEmp.sqlbomba, bmb_codigo,'' );
  acampo := 0;
  RefreshDialog2(cPre,acampo, frmbomba, sqlNew, aEdits);
  acampo := 1;
end;

procedure TfrmBomba.RefreshDados(tipo: String);
var
  i: integer;
  cWhere, cQuery, cOrder: String;

begin
  RefreshDados2(acampo, tipo, '', bmb_codigo, sqlNew, dmEmp.sqlbomba );
end;

procedure TfrmBomba.RefreshDialog;
var
  i, tmp: Integer;
  frmx : TForm ;
begin
  RefreshDialog2(cPre,acampo, frmbomba, sqlNew, aEdits);
end;


procedure TfrmBomba.ToolButton9Click(Sender: TObject);
begin
  frmCalculadora := TfrmCalculadora.Create(Self);
  frmCalculadora.Show;

end;

procedure TfrmBomba.ativaButoes(tipo:Integer);
begin
ativaButoes2(Tipo,  btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt, sqlNew);
end;

procedure TfrmBomba.ativaget;
begin
  ativaget2(aEdits,cPre+'codigo',cTabela, btnGrava.Enabled, lMostra );
end;

procedure TfrmBomba.btnAlterarExecute(Sender: TObject);
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
   bmb_nome.SetFocus;
   navegacao(0);
   bmb_nmrinc.Enabled := False;
   bmb_codtnq.Enabled := False;

end;

procedure TfrmBomba.btnAntExecute(Sender: TObject);
begin
  navegacao(2);
end;

procedure TfrmBomba.btnCancelaExecute(Sender: TObject);
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
   bmb_codigo.SetFocus;

end;

procedure TfrmBomba.btnExcluirExecute(Sender: TObject);
Var
aSubTab : TArrayDim2;
n: Integer;
begin
   //SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'acessoratv';     aSubTab[n][1] := '';
   If Exclui2(cTabela, aSubTab,  bmb_codigo, btnExcluir) Then Begin;
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

procedure TfrmBomba.btnGravaExecute(Sender: TObject);
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
   bmb_codigo.SetFocus;
end;

procedure TfrmBomba.btnIniExecute(Sender: TObject);
begin
  navegacao(1);
end;

procedure TfrmBomba.btnNovoExecute(Sender: TObject);
begin
   acampo := 1;
   nNew   := acampo;
   btnGrava.Enabled := True;
   RefreshDados('S');
   limpaget;
   ativaButoes(1);
   lMostra := False;
   ativaget;
   bmb_nome.SetFocus;
end;

procedure TfrmBomba.btnProxExecute(Sender: TObject);
begin
  navegacao(3);
end;

procedure TfrmBomba.btnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmBomba.btnUltExecute(Sender: TObject);
begin
  navegacao(4);
end;

initialization
  RegisterClass(TfrmBomba);


end.
