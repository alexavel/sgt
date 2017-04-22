unit U_FormaPgmInc;

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
  TfrmFormaPgm = class(TForm)
    StatusBar1: TStatusBar;
    Banner: TPanel;
    imgLogo: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    fpg_codigo: TButtonedEdit;
    Label4: TLabel;
    fpg_nome: TEdit;
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
    Label25: TLabel;
    fpg_acao: TComboBox;
    fpg_codpct: TButtonedEdit;
    Label16: TLabel;
    Label17: TLabel;
    fpg_parcela: TComboBox;
    Label5: TLabel;
    fpg_pctdesc: TMaskEdit;
    Label26: TLabel;
    fpg_pctacre: TMaskEdit;
    Label18: TLabel;
    edNomCnt: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure RefreshDialog;
    Procedure RefreshDados(tipo: String);
    procedure fpg_codigoExit(Sender: TObject);
    procedure fpg_codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fpg_codigoRightButtonClick(Sender: TObject);
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
    procedure fpg_acaoChange(Sender: TObject);
    procedure fpg_codpctRightButtonClick(Sender: TObject);
    procedure fpg_codpctKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fpg_codpctExit(Sender: TObject);
    procedure fpg_pctdescKeyPress(Sender: TObject; var Key: Char);
    procedure fpg_pctacreKeyPress(Sender: TObject; var Key: Char);
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
  frmFormaPgm: TfrmFormaPgm;
  modConsulta, nOrdem : integer;


implementation

uses  UCalculadora,  u_DmEmp, uSistema, U_funcao, U_CnpjClass,
  U_ClassconsContas;

{$R *.dfm}


procedure TfrmFormaPgm.fpg_codigoExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlformapgm ;
  fpg_nome.Text :=  Pesquisa.Relacao('formapgm',fpg_codigo,'fpg_codigo','fpg_nome');
  navegacao(5);

end;

procedure TfrmFormaPgm.fpg_codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END    : fpg_codigoRightButtonClick(Self);
    VK_UP     : navegacao(1);
    VK_LEFT   : navegacao(2);
    VK_RIGHT  : navegacao(3);
    VK_DOWN   : navegacao(4);

  end;
Finally

End;

end;

procedure TfrmFormaPgm.fpg_codigoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
if btnGrava.Enabled then
   Exit;

  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsformapgm ;
  Pesquisa.sqlTabela :=  dmEmp.Sqlformapgm ;
  Pesquisa.cliTabela :=  dmEmp.cliformapgm ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Formas de Pagamentos';
  Pesquisa.nmTabela  := 'formapgm';
  //Pesquisa.NovoCad   := 'formapgm' ;
  // Display        campo   cabecalho           get         tan  indices
  Pesquisa.AddReg('fpg_codigo'  ,'Código'         ,'fpg_codigo' ,5  ,'por Código'    );
  Pesquisa.AddReg('fpg_nome'    ,'Nome'           ,'fpg_nome'   ,35 ,'por Forma de Pagamento');



  Pesquisa.acessa(fpg_codigo);
  fpg_codigo.text   :=  Pesquisa.RecReg('fpg_codigo');
  fpg_nome.text     :=  Pesquisa.RecReg('fpg_nome');
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

procedure TfrmFormaPgm.fpg_codpctExit(Sender: TObject);
Var
  Pesquisa : TClasConsultaConta;
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsultaConta.Create;
  edNomCnt.Text :=  Pesquisa.Relacao('pct_nome',fpg_codpct.Text);

end;

procedure TfrmFormaPgm.fpg_codpctKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      fpg_codpctRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmFormaPgm.fpg_codpctRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsultaConta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsultaConta.Create;
  Pesquisa.acessa(fpg_codpct,'');
  edNomCnt.Text :=  Pesquisa.Relacao('pct_nome',fpg_codpct.Text);
  Pesquisa.Destroy;

 end;

procedure TfrmFormaPgm.fpg_pctacreKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  PctKeyEdit( Key, fpg_pctacre );
  Key := #0 ;

end;

procedure TfrmFormaPgm.fpg_pctdescKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  PctKeyEdit( Key, fpg_pctdesc );
  Key := #0 ;

end;

procedure TfrmFormaPgm.fpg_acaoChange(Sender: TObject);
begin
if fpg_acao.Text = 'CXA' then Begin
   fpg_parcela.ItemIndex  := 0 ;
   fpg_parcela.Enabled    := btnGrava.Enabled     ;
   fpg_pctacre.Enabled    := btnGrava.Enabled ;
   fpg_pctdesc.Text       := FormatFloat('##0.00%',0) ;
   fpg_pctdesc.Enabled    := False ;
End Else Begin
   fpg_parcela.ItemIndex  := 0 ;
   fpg_parcela.Enabled    := False ;
   fpg_pctacre.Text       := FormatFloat('##0.00%',0) ;
   fpg_pctacre.Enabled    := False ;
   fpg_pctdesc.Enabled    := btnGrava.Enabled ;
End;

end;

procedure TfrmFormaPgm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sqlNew.Close;
    dmEmp.cliformapgm.Close;
    frmformapgm                 := nil ;
    action                       := cafree;
    fPrincipal.btnformapgm.Enabled := True;
end;



procedure TfrmFormaPgm.FormCreate(Sender: TObject);
Var
i: Integer;
begin
  cPre                            := 'fpg_';
  cTabela                         := 'formapgm';
  acampo                          := 1;
  sqlNew                          := TFDQuery.Create(nil);
  sqlNew.Connection               := dmEmp.SqlConSis;
  fPrincipal.btnformapgm.Enabled  := False;
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;
end;

procedure TfrmFormaPgm.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmFormaPgm.FormShow(Sender: TObject);
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
  lbCabeca01.Caption    := 'Cadastro de formapgmes';
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
  fpg_codigo.SetFocus;

  btnNovo.Caption    := 'Novo'+#13 +'[F3]';
  btnAlterar.Caption := 'Editar'+#13 +'[F4]';
  btnGrava.Caption   := 'Salvar'+#13 +'[F5]';
  btnExcluir.Caption := 'Excluir'+#13 +'[Alt+Del]';
  btnCancela.Caption := 'Cancelar'+#13 +'[F12]';

end;

procedure TfrmFormaPgm.gravadados;
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, ctip_horalt,cCodSql, cIteSql,cValSql,cCodMnt : string ;
dData, dtip_datalt : TDate ;
i, tmp: Integer;
SQLQ : TFDQuery ;
begin
   gravadados2(cTabela,cPre,cPre+'codigo','X','', nNew, frmFormapgm, dmEmp.SqlConSis, aEdits );
end;

procedure TfrmFormaPgm.limpaget;
Var
i: Integer;
begin
  limpaget2(aEdits);
end;

procedure TfrmFormaPgm.navegacao(Ord: Integer);
begin
  if btnGrava.Enabled then
     Exit;

  navegacao2( Ord, acampo, btnIni, btnAnt, btnProx, btnUlt, sqlNew, dmEmp.sqlFormaPgm, fpg_codigo,'' );
  acampo := 0;
  RefreshDialog2(cPre,acampo, frmFormaPgm, sqlNew, aEdits);
  acampo := 1;
end;

procedure TfrmFormaPgm.RefreshDados(tipo: String);
var
  i: integer;
  cWhere, cQuery, cOrder: String;

begin
  RefreshDados2(acampo, tipo, '', fpg_codigo, sqlNew, dmEmp.sqlFormaPgm );
end;

procedure TfrmFormaPgm.RefreshDialog;
var
  i, tmp: Integer;
  frmx : TForm ;
begin
  RefreshDialog2(cPre,acampo, frmFormaPgm, sqlNew, aEdits);
end;

procedure TfrmFormaPgm.ToolButton9Click(Sender: TObject);
begin
  frmCalculadora := TfrmCalculadora.Create(Self);
  frmCalculadora.Show;

end;

procedure TfrmFormaPgm.ativaButoes(tipo:Integer);
begin
ativaButoes2(Tipo,  btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt, sqlNew);
end;

procedure TfrmFormaPgm.ativaget;
begin
  ativaget2(aEdits,cPre+'codigo',cTabela, btnGrava.Enabled, lMostra );
end;

procedure TfrmFormaPgm.btnAlterarExecute(Sender: TObject);
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
   fpg_nome.SetFocus;
   navegacao(0);

end;

procedure TfrmFormaPgm.btnAntExecute(Sender: TObject);
begin
  navegacao(2);
end;

procedure TfrmFormaPgm.btnCancelaExecute(Sender: TObject);
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

   fpg_codigo.SetFocus;

end;

procedure TfrmFormaPgm.btnExcluirExecute(Sender: TObject);
Var
aSubTab : TArrayDim2;
n: Integer;
begin
   //SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'acessoratv';     aSubTab[n][1] := '';
   If Exclui2(cTabela, aSubTab,  fpg_codigo, btnExcluir) Then Begin;
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

procedure TfrmFormaPgm.btnGravaExecute(Sender: TObject);
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
   lMostra := True;
   ativaget;
   fpg_codigo.SetFocus;
end;

procedure TfrmFormaPgm.btnIniExecute(Sender: TObject);
begin
  navegacao(1);
end;

procedure TfrmFormaPgm.btnNovoExecute(Sender: TObject);
begin
   acampo := 1;
   nNew   := acampo;
   btnGrava.Enabled := True;
   RefreshDados('S');
   limpaget;
   ativaButoes(1);
   lMostra := False;
   ativaget;
   fpg_nome.SetFocus;
end;

procedure TfrmFormaPgm.btnProxExecute(Sender: TObject);
begin
  navegacao(3);
end;

procedure TfrmFormaPgm.btnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmFormaPgm.btnUltExecute(Sender: TObject);
begin
  navegacao(4);
end;


initialization
  RegisterClass(TfrmFormaPgm);


end.
