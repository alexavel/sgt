unit U_Tanque;

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
  TfrmTanque = class(TForm)
    StatusBar1: TStatusBar;
    Banner: TPanel;
    imgLogo: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    tnq_codigo: TButtonedEdit;
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
    tnq_codcmb: TButtonedEdit;
    Label2: TLabel;
    Label3: TLabel;
    edNomCmb: TEdit;
    actionsub: TActionManager;
    CmbBtnInc: TAction;
    cmbBtnExc: TAction;
    tnq_nome: TEdit;
    Label4: TLabel;
    tnq_nmrinc: TMaskEdit;
    Label26: TLabel;
    tnq_vlrcst: TMaskEdit;
    Label5: TLabel;
    tnq_ltsmin: TMaskEdit;
    Label6: TLabel;
    tnq_ltsetq: TMaskEdit;
    Label7: TLabel;
    tnq_ativo: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure RefreshDialog;
    Procedure RefreshDados(tipo: String);
    procedure tnq_codigoExit(Sender: TObject);
    procedure tnq_codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tnq_codigoRightButtonClick(Sender: TObject);
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
    procedure tnq_codcmbRightButtonClick(Sender: TObject);
    procedure tnq_codcmbKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tnq_codcmbExit(Sender: TObject);
    procedure tnq_vlrcstKeyPress(Sender: TObject; var Key: Char);
    procedure tnq_ltsminKeyPress(Sender: TObject; var Key: Char);
    procedure tnq_ltsetqKeyPress(Sender: TObject; var Key: Char);
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
  frmTanque: TfrmTanque;
  modConsulta, nOrdem : integer;


implementation

uses  UCalculadora,  u_DmEmp, uSistema, U_funcao, U_CnpjClass;

{$R *.dfm}

procedure TfrmTanque.tnq_codcmbExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlComb ;
  edNomCmb.Text :=  Pesquisa.Relacao('combustivel',tnq_codcmb,'cmb_codigo','cmb_nome');

end;

procedure TfrmTanque.tnq_codcmbKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      tnq_codcmbRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmTanque.tnq_codcmbRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsComb ;
  Pesquisa.sqlTabela :=  dmEmp.sqlComb ;
  Pesquisa.cliTabela :=  dmEmp.cliComb ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Combustíuveis';
  Pesquisa.nmTabela  := 'combustivel' ;
  Pesquisa.NovoCad   := 'combustivel' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('cmb_codigo','Código'        ,'tnq_codcmb' ,5  ,'por Código' );
  Pesquisa.AddReg('cmb_nome'  ,'Combustível'   ,'edNomCmb'   ,25 ,'por Combustível' );


  Pesquisa.acessa(tnq_codcmb);
  tnq_codcmb.text   :=  Pesquisa.RecReg('cmb_codigo');
  edNomCmb.text     :=  Pesquisa.RecReg('cmb_nome');
  Pesquisa.Destroy;

 end;

procedure TfrmTanque.tnq_codigoExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados

  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqltanque ;
  tnq_nome.Text :=  Pesquisa.Relacao('tanque',tnq_codigo,'tnq_codigo','tnq_nome');
  navegacao(5);
end;

procedure TfrmTanque.tnq_codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END    : tnq_codigoRightButtonClick(Self);
    VK_UP     : navegacao(1);
    VK_LEFT   : navegacao(2);
    VK_RIGHT  : navegacao(3);
    VK_DOWN   : navegacao(4);

  end;
Finally

End;

end;

procedure TfrmTanque.tnq_codigoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
if btnGrava.Enabled then
   Exit;

  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dstanque ;
  Pesquisa.sqlTabela :=  dmEmp.SqlTanque ;
  Pesquisa.cliTabela :=  dmEmp.clitanque ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Tanques de Abastecimento';
  Pesquisa.nmTabela  := 'tanque';
//  Pesquisa.NovoCad   := 'tanque' ;
  // Display        campo   cabecalho                     get         tan  indices
  Pesquisa.AddReg('tnq_codigo'  ,'Código'                  ,'tnq_codigo' ,5  ,'por Código'       );
  Pesquisa.AddReg('tnq_nome'    ,'Tanque'                  ,'tnq_nome'   ,30 ,'por Nome'         );
  Pesquisa.AddReg('cmb_nome'    ,'Combustíuvel'            ,'tnq_codbco' ,15 ,'por Combustivel'  );
  Pesquisa.AddReg('tnq_ltsetq'  ,'Estoque'                 ,'tnq_ltsetq' ,10 ,'por Estoque'      );


  Pesquisa.acessa(tnq_codigo);
  tnq_codigo.text   :=  Pesquisa.RecReg('tnq_codigo');
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


procedure TfrmTanque.tnq_ltsetqKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  QtdKey( Key, tnq_ltsetq );
  Key := #0 ;
end;


procedure TfrmTanque.tnq_ltsminKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  QtdKey( Key, tnq_ltsmin );
  Key := #0 ;
end;

procedure TfrmTanque.tnq_vlrcstKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  MoedaKeyEdit( Key, tnq_vlrcst );
  Key := #0 ;

end;

procedure TfrmTanque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sqlNew.Close;
    dmEmp.clitanque.Close;
    frmtanque                 := nil ;
    action                       := cafree;
    fPrincipal.btntanque.Enabled := True;
end;



procedure TfrmTanque.FormCreate(Sender: TObject);
Var
i: Integer;
begin
  cPre                        := 'tnq_';
  cTabela                     := 'tanque';
  acampo                      := 1;
  sqlNew                      := TFDQuery.Create(nil);
  sqlNew.Connection           := dmemp.SqlConSis;
  fPrincipal.btntanque.Enabled  := False;
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;
end;

procedure TfrmTanque.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmTanque.FormShow(Sender: TObject);
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
  lbCabeca01.Caption    := 'Cadstro de Tanque de Abastecimento';
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

procedure TfrmTanque.gravadados;
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, ctip_horalt,cCodSql, cIteSql,cValSql,cCodMnt : string ;
dData, dtip_datalt : TDate ;
i, tmp: Integer;
SQLQ : TFDQuery ;

begin
   gravadados2(cTabela,cPre,cPre+'codigo','X','', nNew, frmtanque, dmEmp.SqlConSis, aEdits );
end;

procedure TfrmTanque.limpaget;
Var
i: Integer;
begin
  limpaget2(aEdits);
end;

procedure TfrmTanque.navegacao(Ord: Integer);
begin
  if btnGrava.Enabled then
     Exit;

  navegacao2( Ord, acampo, btnIni, btnAnt, btnProx, btnUlt, sqlNew, dmEmp.sqltanque, tnq_codigo,'' );
  acampo := 0;
  RefreshDialog2(cPre,acampo, frmtanque, sqlNew, aEdits);
  acampo := 1;

end;

procedure TfrmTanque.RefreshDados(tipo: String);
var
  i: integer;
  cWhere, cQuery, cOrder: String;

begin
  RefreshDados2(acampo, tipo, '', tnq_codigo, sqlNew, dmEmp.sqltanque );
end;

procedure TfrmTanque.RefreshDialog;
var
  i, tmp: Integer;
  frmx : TForm ;
begin
  RefreshDialog2(cPre,acampo, frmtanque, sqlNew, aEdits);
end;


procedure TfrmTanque.ToolButton9Click(Sender: TObject);
begin
  frmCalculadora := TfrmCalculadora.Create(Self);
  frmCalculadora.Show;

end;

procedure TfrmTanque.ativaButoes(tipo:Integer);
begin
ativaButoes2(Tipo,  btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt, sqlNew);
end;

procedure TfrmTanque.ativaget;
begin
  ativaget2(aEdits,cPre+'codigo',cTabela, btnGrava.Enabled, lMostra );
end;

procedure TfrmTanque.btnAlterarExecute(Sender: TObject);
begin
   btnNovo.Enabled    := False;
   btnAlterar.Enabled := False;
   btnGrava.Enabled   := True;
   ativaButoes(1);
   lMostra := True;
   ativaget;
   RefreshDialog;
   tnq_nome.SetFocus;
   acampo := 0;
   nNew   := acampo;
   navegacao(0);
   tnq_ltsetq.Enabled := ( nNew = 1 );
   tnq_nmrinc.Enabled := tnq_ltsetq.Enabled ;
   tnq_vlrcst.Enabled := tnq_ltsetq.Enabled ;
   tnq_codcmb.Enabled := tnq_ltsetq.Enabled ;


end;

procedure TfrmTanque.btnAntExecute(Sender: TObject);
begin
  navegacao(2);
end;

procedure TfrmTanque.btnCancelaExecute(Sender: TObject);
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

   tnq_codigo.SetFocus;

end;

procedure TfrmTanque.btnExcluirExecute(Sender: TObject);
Var
aSubTab : TArrayDim2;
n: Integer;
begin
   //SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'acessoratv';     aSubTab[n][1] := '';
   If Exclui2(cTabela, aSubTab,  tnq_codigo, btnExcluir) Then Begin;
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

procedure TfrmTanque.btnGravaExecute(Sender: TObject);
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
   tnq_codigo.SetFocus;
end;

procedure TfrmTanque.btnIniExecute(Sender: TObject);
begin
  navegacao(1);
end;

procedure TfrmTanque.btnNovoExecute(Sender: TObject);
begin
   acampo := 1;
   nNew   := acampo;
   btnGrava.Enabled := True;
   RefreshDados('S');
   limpaget;
   ativaButoes(1);
   lMostra := False;
   ativaget;
   tnq_nome.SetFocus;
   tnq_nmrinc.Text    := '0';
   tnq_nmrinc.Enabled := False;
   tnq_vlrcst.Enabled := False;
   tnq_ltsetq.Enabled := False;

end;

procedure TfrmTanque.btnProxExecute(Sender: TObject);
begin
  navegacao(3);
end;

procedure TfrmTanque.btnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmTanque.btnUltExecute(Sender: TObject);
begin
  navegacao(4);
end;

initialization
  RegisterClass(TfrmTanque);


end.
