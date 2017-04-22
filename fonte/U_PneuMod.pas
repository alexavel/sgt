unit U_PneuMod;

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
  TfrmPneuMod = class(TForm)
    StatusBar1: TStatusBar;
    Banner: TPanel;
    imgLogo: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    pmd_codigo: TButtonedEdit;
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
    pmd_codpds: TButtonedEdit;
    Label2: TLabel;
    Label3: TLabel;
    edNomDes: TEdit;
    actionsub: TActionManager;
    CmbBtnInc: TAction;
    cmbBtnExc: TAction;
    pmd_nome: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    pmd_codpfb: TButtonedEdit;
    Label7: TLabel;
    edNomFab: TEdit;
    Label8: TLabel;
    pmd_codpdm: TButtonedEdit;
    Label9: TLabel;
    edNomDim: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    pmd_sucref: TEdit;
    pmd_sucnov: TEdit;
    Label6: TLabel;
    pmd_kmvid1: TMaskEdit;
    pmd_kmvid2: TMaskEdit;
    pmd_kmvid3: TMaskEdit;
    pmd_kmvid6: TMaskEdit;
    pmd_kmvid4: TMaskEdit;
    pmd_kmvid5: TMaskEdit;
    pmd_kmvid9: TMaskEdit;
    pmd_kmvid7: TMaskEdit;
    pmd_kmvid8: TMaskEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure RefreshDialog;
    Procedure RefreshDados(tipo: String);
    procedure pmd_codigoExit(Sender: TObject);
    procedure pmd_codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pmd_codigoRightButtonClick(Sender: TObject);
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
    procedure pmd_codpdsRightButtonClick(Sender: TObject);
    procedure pmd_codpdsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pmd_codpdsExit(Sender: TObject);
    procedure pmd_codpdmRightButtonClick(Sender: TObject);
    procedure pmd_codpdmKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pmd_codpdmExit(Sender: TObject);
    procedure pmd_codpfbRightButtonClick(Sender: TObject);
    procedure pmd_codpfbKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pmd_codpfbExit(Sender: TObject);
    procedure pmd_kmvid1KeyPress(Sender: TObject; var Key: Char);
    procedure pmd_kmvid2KeyPress(Sender: TObject; var Key: Char);
    procedure pmd_kmvid3KeyPress(Sender: TObject; var Key: Char);
    procedure pmd_kmvid4KeyPress(Sender: TObject; var Key: Char);
    procedure pmd_kmvid5KeyPress(Sender: TObject; var Key: Char);
    procedure pmd_kmvid6KeyPress(Sender: TObject; var Key: Char);
    procedure pmd_kmvid7KeyPress(Sender: TObject; var Key: Char);
    procedure pmd_kmvid8KeyPress(Sender: TObject; var Key: Char);
    procedure pmd_kmvid9KeyPress(Sender: TObject; var Key: Char);
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
  frmPneuMod: TfrmPneuMod;
  modConsulta, nOrdem : integer;


implementation

uses  UCalculadora,  u_DmEmp, uSistema, U_funcao, U_CnpjClass;

{$R *.dfm}

procedure TfrmPneuMod.pmd_codpdmExit(Sender: TObject);
begin
  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlpneudim ;
  edNomdim.Text   :=  Pesquisa.Relacao('pneudim',pmd_codpdm,'pdm_codigo','pdm_nome');

end;

procedure TfrmPneuMod.pmd_codpdmKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      pmd_codpdmRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmPneuMod.pmd_codpdmRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dspneudim ;
  Pesquisa.sqlTabela :=  dmEmp.sqlpneudim ;
  Pesquisa.cliTabela :=  dmEmp.clipneudim ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Dimensões de Pneus';
  Pesquisa.nmTabela  := 'pneudim' ;
  Pesquisa.NovoCad   := 'pneudim' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('pdm_codigo'  ,'Código'                  ,'pmd_codpdm' ,5  ,'por Código'       );
  Pesquisa.AddReg('pdm_nome'    ,'Domensões'               ,'edNomDim'   ,30 ,'por Domensão'     );

  Pesquisa.acessa(pmd_codpdm);
  pmd_codpdm.text   :=  Pesquisa.RecReg('pdm_codigo');
  edNomDim.text     :=  Pesquisa.RecReg('pdm_nome');

  Pesquisa.Destroy;

 end;

procedure TfrmPneuMod.pmd_codpdsExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlpneudes ;
  edNomdes.Text   :=  Pesquisa.Relacao('pneudes',pmd_codpds,'pds_codigo','pds_nome');

end;

procedure TfrmPneuMod.pmd_codpdsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      pmd_codpdsRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmPneuMod.pmd_codpdsRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dspneudes ;
  Pesquisa.sqlTabela :=  dmEmp.sqlpneudes ;
  Pesquisa.cliTabela :=  dmEmp.clipneudes ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Desenho de Pneus';
  Pesquisa.nmTabela  := 'pneudes' ;
  Pesquisa.NovoCad   := 'pneudes' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('pds_codigo'  ,'Código'                  ,'pmd_codpds' ,5  ,'por Código'       );
  Pesquisa.AddReg('pds_nome'    ,'Desenho'                 ,'edNomDes'   ,30 ,'por Nome'         );
  Pesquisa.AddReg('pds_sucos'   ,'Sucos'                   ,'pds_sucos'   ,5 ,'por Sucos'        );

  Pesquisa.acessa(pmd_codpds);
  pmd_codpds.text   :=  Pesquisa.RecReg('pds_codigo');
  edNomDes.text     :=  Pesquisa.RecReg('pds_nome');

  Pesquisa.Destroy;

 end;

procedure TfrmPneuMod.pmd_codpfbExit(Sender: TObject);
begin
  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlpneufab ;
  edNomFab.Text   :=  Pesquisa.Relacao('pneufab',pmd_codpfb,'pfb_codigo','pfb_nome');
end;

procedure TfrmPneuMod.pmd_codpfbKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      pmd_codpfbRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmPneuMod.pmd_codpfbRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dspneufab ;
  Pesquisa.sqlTabela :=  dmEmp.sqlpneufab ;
  Pesquisa.cliTabela :=  dmEmp.clipneufab ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Fabricantes de Pneus';
  Pesquisa.nmTabela  := 'pneufab' ;
  Pesquisa.NovoCad   := 'pneufab' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('pfb_codigo'  ,'Código'                  ,'pmd_codpfb' ,5  ,'por Código'       );
  Pesquisa.AddReg('pfb_nome'    ,'Desenho'                 ,'edNomFab'   ,30 ,'por Fabricante'   );

  Pesquisa.acessa(pmd_codpfb);
  pmd_codpfb.text   :=  Pesquisa.RecReg('pfb_codigo');
  edNomFab.text     :=  Pesquisa.RecReg('pfb_nome');

  Pesquisa.Destroy;

 end;

procedure TfrmPneuMod.pmd_kmvid1KeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  KmKeyEdit( Key, pmd_kmvid1 );
  Key := #0 ;
end;

procedure TfrmPneuMod.pmd_kmvid2KeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  KmKeyEdit( Key, pmd_kmvid2 );
  Key := #0 ;
end;

procedure TfrmPneuMod.pmd_kmvid3KeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  KmKeyEdit( Key, pmd_kmvid3 );
  Key := #0 ;
end;

procedure TfrmPneuMod.pmd_kmvid4KeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  KmKeyEdit( Key, pmd_kmvid4 );
  Key := #0 ;
end;

procedure TfrmPneuMod.pmd_kmvid5KeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  KmKeyEdit( Key, pmd_kmvid5 );
  Key := #0 ;
end;

procedure TfrmPneuMod.pmd_kmvid6KeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  KmKeyEdit( Key, pmd_kmvid6 );
  Key := #0 ;
end;

procedure TfrmPneuMod.pmd_kmvid7KeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  KmKeyEdit( Key, pmd_kmvid7 );
  Key := #0 ;
end;

procedure TfrmPneuMod.pmd_kmvid8KeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  KmKeyEdit( Key, pmd_kmvid8 );
  Key := #0 ;
end;

procedure TfrmPneuMod.pmd_kmvid9KeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  KmKeyEdit( Key, pmd_kmvid9 );
  Key := #0 ;
end;

procedure TfrmPneuMod.pmd_codigoExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados

  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlpneumod ;
  pmd_nome.Text :=  Pesquisa.Relacao('pneumod',pmd_codigo,'pmd_codigo','pmd_nome');
  navegacao(5);
end;

procedure TfrmPneuMod.pmd_codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END    : pmd_codigoRightButtonClick(Self);
    VK_UP     : navegacao(1);
    VK_LEFT   : navegacao(2);
    VK_RIGHT  : navegacao(3);
    VK_DOWN   : navegacao(4);

  end;
Finally

End;

end;

procedure TfrmPneuMod.pmd_codigoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
if btnGrava.Enabled then
   Exit;

  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dspneumod ;
  Pesquisa.sqlTabela :=  dmEmp.Sqlpneumod ;
  Pesquisa.cliTabela :=  dmEmp.clipneumod ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Modelos de Pneus';
  Pesquisa.nmTabela  := 'pneumod';
//  Pesquisa.NovoCad   := 'pneumod' ;
  // Display        campo   cabecalho                     get         tan  indices
  Pesquisa.AddReg('pmd_codigo'  ,'Código'                 ,'pmd_codigo' ,5  ,'por Código'        );
  Pesquisa.AddReg('pmd_nome'    ,'Modelo'                 ,'pmd_nome'   ,30 ,'por Modelo'        );
  Pesquisa.AddReg('pds_nome'    ,'Desenho'                ,'pds_nome'   ,15 ,'por Desenho'       );
  Pesquisa.AddReg('pdm_nome'    ,'Dimensões'              ,'pdm_nome'   ,15 ,'por Dimensão'      );

  Pesquisa.acessa(pmd_codigo);
  pmd_codigo.text   :=  Pesquisa.RecReg('pmd_codigo');
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


procedure TfrmPneuMod.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sqlNew.Close;
    dmEmp.clipneumod.Close;
    frmpneumod                 := nil ;
    action                       := cafree;
    fPrincipal.btnpneumod.Enabled := True;
end;



procedure TfrmPneuMod.FormCreate(Sender: TObject);
Var
i: Integer;
begin
  cPre                        := 'pmd_';
  cTabela                     := 'pneumod';
  acampo                      := 1;
  sqlNew                      := TFDQuery.Create(nil);
  sqlNew.Connection           := dmemp.SqlConSis;
  fPrincipal.btnpneumod.Enabled  := False;
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;
end;

procedure TfrmPneuMod.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmPneuMod.FormShow(Sender: TObject);
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
  lbCabeca01.Caption    := 'Cadstro de Modelos de Pneus';
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

procedure TfrmPneuMod.gravadados;
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, ctip_horalt,cCodSql, cIteSql,cValSql,cCodMnt : string ;
dData, dtip_datalt : TDate ;
i, tmp: Integer;
SQLQ : TFDQuery ;

begin
   gravadados2(cTabela,cPre,cPre+'codigo','X','', nNew, frmpneumod, dmEmp.SqlConSis, aEdits );
end;

procedure TfrmPneuMod.limpaget;
Var
i: Integer;
begin
  limpaget2(aEdits);
end;

procedure TfrmPneuMod.navegacao(Ord: Integer);
begin
  if btnGrava.Enabled then
     Exit;

  navegacao2( Ord, acampo, btnIni, btnAnt, btnProx, btnUlt, sqlNew, dmEmp.sqlpneumod, pmd_codigo,'' );
  acampo := 0;
  RefreshDialog2(cPre,acampo, frmpneumod, sqlNew, aEdits);
  acampo := 1;
end;

procedure TfrmPneuMod.RefreshDados(tipo: String);
var
  i: integer;
  cWhere, cQuery, cOrder: String;

begin
  RefreshDados2(acampo, tipo, '', pmd_codigo, sqlNew, dmEmp.sqlpneumod );
end;

procedure TfrmPneuMod.RefreshDialog;
var
  i, tmp: Integer;
  frmx : TForm ;
begin
  RefreshDialog2(cPre,acampo, frmpneumod, sqlNew, aEdits);
end;


procedure TfrmPneuMod.ToolButton9Click(Sender: TObject);
begin
  frmCalculadora := TfrmCalculadora.Create(Self);
  frmCalculadora.Show;

end;

procedure TfrmPneuMod.ativaButoes(tipo:Integer);
begin
ativaButoes2(Tipo,  btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt, sqlNew);
end;

procedure TfrmPneuMod.ativaget;
begin
  ativaget2(aEdits,cPre+'codigo',cTabela, btnGrava.Enabled, lMostra );
end;

procedure TfrmPneuMod.btnAlterarExecute(Sender: TObject);
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
   pmd_nome.SetFocus;
   navegacao(0);

end;

procedure TfrmPneuMod.btnAntExecute(Sender: TObject);
begin
  navegacao(2);
end;

procedure TfrmPneuMod.btnCancelaExecute(Sender: TObject);
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
   pmd_codigo.SetFocus;

end;

procedure TfrmPneuMod.btnExcluirExecute(Sender: TObject);
Var
aSubTab : TArrayDim2;
n: Integer;
begin
   //SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'acessoratv';     aSubTab[n][1] := '';
   If Exclui2(cTabela, aSubTab,  pmd_codigo, btnExcluir) Then Begin;
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

procedure TfrmPneuMod.btnGravaExecute(Sender: TObject);
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
   pmd_codigo.SetFocus;
end;

procedure TfrmPneuMod.btnIniExecute(Sender: TObject);
begin
  navegacao(1);
end;

procedure TfrmPneuMod.btnNovoExecute(Sender: TObject);
begin
   acampo := 1;
   nNew   := acampo;
   btnGrava.Enabled := True;
   RefreshDados('S');
   limpaget;
   ativaButoes(1);
   lMostra := False;
   ativaget;
   pmd_nome.SetFocus;
end;

procedure TfrmPneuMod.btnProxExecute(Sender: TObject);
begin
  navegacao(3);
end;

procedure TfrmPneuMod.btnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmPneuMod.btnUltExecute(Sender: TObject);
begin
  navegacao(4);
end;

initialization
  RegisterClass(TfrmPneuMod);


end.
