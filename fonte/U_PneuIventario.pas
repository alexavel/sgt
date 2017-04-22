unit U_PneuIventario;

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
  TfrmPneuIve = class(TForm)
    StatusBar1: TStatusBar;
    Banner: TPanel;
    imgLogo: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    grbincial: TGroupBox;
    Label1: TLabel;
    piv_codigo: TButtonedEdit;
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
    piv_codpmd: TButtonedEdit;
    Label2: TLabel;
    Label3: TLabel;
    edNomDes: TEdit;
    actionsub: TActionManager;
    CmbBtnInc: TAction;
    cmbBtnExc: TAction;
    Label5: TLabel;
    edNomFab: TEdit;
    Label8: TLabel;
    edNomDim: TEdit;
    Label10: TLabel;
    piv_numser: TEdit;
    piv_numnfe: TEdit;
    Label6: TLabel;
    piv_mfogo: TEdit;
    Label20: TLabel;
    edCodpds: TEdit;
    Label22: TLabel;
    edNomPds: TEdit;
    Label23: TLabel;
    edCodDIm: TEdit;
    Label4: TLabel;
    edCodFab: TEdit;
    Label9: TLabel;
    grbSulco: TGroupBox;
    Label21: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    piv_mlmsc1: TMaskEdit;
    piv_mlmsc2: TMaskEdit;
    piv_mlmsc3: TMaskEdit;
    piv_mlmsc4: TMaskEdit;
    piv_mlmsc5: TMaskEdit;
    piv_mlmsc6: TMaskEdit;
    grbKm: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    piv_kmvda1: TMaskEdit;
    piv_kmvda2: TMaskEdit;
    piv_kmvda3: TMaskEdit;
    piv_kmvda6: TMaskEdit;
    piv_kmvda4: TMaskEdit;
    piv_kmvda5: TMaskEdit;
    piv_kmvda9: TMaskEdit;
    piv_kmvda7: TMaskEdit;
    piv_kmvda8: TMaskEdit;
    edKm1: TEdit;
    edKm2: TEdit;
    edKm3: TEdit;
    edKm4: TEdit;
    edKm8: TEdit;
    edKm7: TEdit;
    edKm6: TEdit;
    edKm5: TEdit;
    edKm9: TEdit;
    grbOutDad: TGroupBox;
    Label29: TLabel;
    Label7: TLabel;
    piv_datcmp: TDateTimePicker;
    piv_vlrcto: TMaskEdit;
    piv_status: TEdit;
    Label30: TLabel;
    edLocalPne: TEdit;
    Label31: TLabel;
    piv_codplc: TEdit;
    Label32: TLabel;
    piv_locpne: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure RefreshDialog;
    Procedure RefreshDados(tipo: String);
    procedure piv_codigoExit(Sender: TObject);
    procedure piv_codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure piv_codigoRightButtonClick(Sender: TObject);
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
    procedure piv_codpmdRightButtonClick(Sender: TObject);
    procedure piv_codpmdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure piv_codpmdExit(Sender: TObject);
    procedure piv_locpneChange(Sender: TObject);

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
  frmPneuIve: TfrmPneuIve;
  modConsulta, nOrdem : integer;


implementation

uses  UCalculadora,  u_DmEmp, uSistema, U_funcao, U_CnpjClass;

{$R *.dfm}


procedure TfrmPneuIve.piv_codpmdExit(Sender: TObject);
var
i : integer;
cCampo : String;
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlpneumod ;
  edNomDes.text     :=  Pesquisa.Relacao('pneumod',piv_codpmd,'pds_codigo','pmd_nome') ;
  edCodPds.text     :=  Pesquisa.Relacao('pneumod',piv_codpmd,'pds_codigo','pmd_codpds') ;
  edNomPds.text     :=  Pesquisa.Relacao('pneumod',piv_codpmd,'pds_codigo','pds_nome') ;
  edCodDim.text     :=  Pesquisa.Relacao('pneumod',piv_codpmd,'pds_codigo','pmd_codpdm') ;
  edNomDim.text     :=  Pesquisa.Relacao('pneumod',piv_codpmd,'pds_codigo','pdm_nome') ;
  edCodfab.text     :=  Pesquisa.Relacao('pneumod',piv_codpmd,'pds_codigo','pmd_codpfb') ;
  edNomfab.text     :=  Pesquisa.Relacao('pneumod',piv_codpmd,'pds_codigo','pfb_nome') ;

  if piv_codpmd.Text <> '' then begin
      edKm1.Text        := FormatCurr('Km #,###,##0', StrToFloat( Pesquisa.Relacao('pneumod',piv_codpmd,'pds_codigo','pmd_kmvid1') ) );
      edKm2.Text        := FormatCurr('Km #,###,##0', StrToFloat( Pesquisa.Relacao('pneumod',piv_codpmd,'pds_codigo','pmd_kmvid2') ) );
      edKm3.Text        := FormatCurr('Km #,###,##0', StrToFloat( Pesquisa.Relacao('pneumod',piv_codpmd,'pds_codigo','pmd_kmvid2') ) );
      edKm4.Text        := FormatCurr('Km #,###,##0', StrToFloat( Pesquisa.Relacao('pneumod',piv_codpmd,'pds_codigo','pmd_kmvid4') ) );
      edKm5.Text        := FormatCurr('Km #,###,##0', StrToFloat( Pesquisa.Relacao('pneumod',piv_codpmd,'pds_codigo','pmd_kmvid5') ) );
      edKm6.Text        := FormatCurr('Km #,###,##0', StrToFloat( Pesquisa.Relacao('pneumod',piv_codpmd,'pds_codigo','pmd_kmvid6') ) );
      edKm7.Text        := FormatCurr('Km #,###,##0', StrToFloat( Pesquisa.Relacao('pneumod',piv_codpmd,'pds_codigo','pmd_kmvid7') ) );
      edKm8.Text        := FormatCurr('Km #,###,##0', StrToFloat( Pesquisa.Relacao('pneumod',piv_codpmd,'pds_codigo','pmd_kmvid8') ) );
      edKm9.Text        := FormatCurr('Km #,###,##0', StrToFloat( Pesquisa.Relacao('pneumod',piv_codpmd,'pds_codigo','pmd_kmvid9') ) );
      for I := 1 to StrToint( Pesquisa.Relacao('pneumod',piv_codpmd,'pds_codigo','pds_sucos') ) do begin
           cCampo := 'piv_mlmsc'+inttostr(I) ;
   //       TMaskEdit( cCampo ).Text := Pesquisa.Relacao('pneumod',piv_codpmd,'pds_codigo','pmd_sucnov') ;
          ( Self.FindComponent(cCampo) as TMaskEdit ).Text := Pesquisa.Relacao('pneumod',piv_codpmd,'pds_codigo','pmd_sucnov') ;
      end;


  end else begin
      edKm1.Text        := FormatCurr('Km #,###,##0', 0 );
      edKm2.Text        := FormatCurr('Km #,###,##0', 0 );
      edKm3.Text        := FormatCurr('Km #,###,##0', 0 );
      edKm4.Text        := FormatCurr('Km #,###,##0', 0 );
      edKm5.Text        := FormatCurr('Km #,###,##0', 0 );
      edKm6.Text        := FormatCurr('Km #,###,##0', 0 );
      edKm7.Text        := FormatCurr('Km #,###,##0', 0 );
      edKm8.Text        := FormatCurr('Km #,###,##0', 0 );
      edKm9.Text        := FormatCurr('Km #,###,##0', 0 );
  end;



end;

procedure TfrmPneuIve.piv_codpmdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      piv_codpmdRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmPneuIve.piv_codpmdRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
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
  Pesquisa.AddReg('pmd_codigo'  ,'Código'                 ,'piv_codpmd' ,5  ,'por Código'        );
  Pesquisa.AddReg('pmd_nome'    ,'Modelo'                 ,'pmd_nome'   ,30 ,'por Modelo'        );
  Pesquisa.AddReg('pds_nome'    ,'Desenho'                ,'pds_nome'   ,15 ,'por Desenho'       );
  Pesquisa.AddReg('pdm_nome'    ,'Dimensões'              ,'pdm_nome'   ,15 ,'por Dimensão'      );
  Pesquisa.acessa(piv_codpmd);
  piv_codpmd.text   :=  Pesquisa.RecReg('pmd_codigo');
  edNomDes.text     :=  Pesquisa.RecReg('pmd_nome');
  edCodPds.text     :=  Pesquisa.RecReg('pmd_codpds');
  edNomPds.text     :=  Pesquisa.RecReg('pds_nome');
  edCodDim.text     :=  Pesquisa.RecReg('pmd_codpdm');
  edNomDim.text     :=  Pesquisa.RecReg('pdm_nome');
  edCodfab.text     :=  Pesquisa.RecReg('pmd_codPfb');
  edNomfab.text     :=  Pesquisa.RecReg('pfb_nome');

  Pesquisa.Destroy;

end;



procedure TfrmPneuIve.piv_locpneChange(Sender: TObject);
begin
if piv_locpne.Text <> '' then
  edLocalPne.Text := PgLocalPne(piv_locpne.Text);

end;

procedure TfrmPneuIve.piv_codigoExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados

  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlpneuive ;
  //pmd_nome.Text :=  Pesquisa.Relacao('pneumod',pmd_codigo,'pmd_codigo','pmd_nome');
  navegacao(5);

end;

procedure TfrmPneuIve.piv_codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END    : piv_codigoRightButtonClick(Self);
    VK_UP     : navegacao(1);
    VK_LEFT   : navegacao(2);
    VK_RIGHT  : navegacao(3);
    VK_DOWN   : navegacao(4);

  end;
Finally

End;

end;

procedure TfrmPneuIve.piv_codigoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
if btnGrava.Enabled then
   Exit;

  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dspneuive    ;
  Pesquisa.sqlTabela :=  dmEmp.Sqlpneuive   ;
  Pesquisa.cliTabela :=  dmEmp.clipneuive   ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm  ;
  Pesquisa.nmTitulo  := 'Iventário de Pneus';
  Pesquisa.nmTabela  := 'pneuive';
//  Pesquisa.NovoCad   := 'pneumod' ;
  // Display        campo   cabecalho                     get         tan  indices
  Pesquisa.AddReg('piv_codigo'  ,'Código'                 ,'piv_codigo' ,5  ,'por Código'        );
  Pesquisa.AddReg('piv_mfogo'   ,'Mrc Fogo'               ,'piv_mfogo'  ,10 ,'por Mc de Fogo'    );
  Pesquisa.AddReg('pmd_nome'    ,'Tipo de Pneus'          ,'pmd_nome'   ,15 ,'por Descrição'     );
  Pesquisa.AddReg('pdm_nome'    ,'Dimensões'              ,'pdm_nome'   ,15 ,'por Dimensões'     );
  Pesquisa.AddReg('piv_codplc'  ,'Veículo'                ,'piv_codplc' ,7  ,'por Veículo'       );
  Pesquisa.AddReg('piv_numnfe'  ,'Nota'                   ,'piv_numnfe' ,10 ,'por Nota Fiscal'   );
  Pesquisa.AddReg('piv_status'  ,'Situação'               ,'piv_status' ,10 ,'por Situação'      );

  Pesquisa.acessa(piv_codigo);
  piv_codigo.text   :=  Pesquisa.RecReg('piv_codigo');
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


procedure TfrmPneuIve.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sqlNew.Close;
    dmEmp.clipneumod.Close;
    frmpneuive                    := nil ;
    action                        := cafree;
    fPrincipal.btnpneuive.Enabled := True;
end;



procedure TfrmPneuIve.FormCreate(Sender: TObject);
Var
i: Integer;
begin
  cPre                        := 'piv_';
  cTabela                     := 'pneuive';
  acampo                      := 1;
  sqlNew                      := TFDQuery.Create(nil);
  sqlNew.Connection           := dmemp.SqlConSis;
  fPrincipal.btnpneuive.Enabled  := False;
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;
end;

procedure TfrmPneuIve.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmPneuIve.FormShow(Sender: TObject);
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
  lbCabeca01.Caption    := 'Iventário de Pneus';
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

procedure TfrmPneuIve.gravadados;
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, ctip_horalt,cCodSql, cIteSql,cValSql,cCodMnt : string ;
dData, dtip_datalt : TDate ;
i, tmp: Integer;
SQLQ : TFDQuery ;

begin
   gravadados2(cTabela,cPre,cPre+'codigo','X','', nNew, frmpneuive, dmEmp.SqlConSis, aEdits );
end;

procedure TfrmPneuIve.limpaget;
Var
i: Integer;
begin
  limpaget2(aEdits);
end;

procedure TfrmPneuIve.navegacao(Ord: Integer);
begin
  if btnGrava.Enabled then
     Exit;

  navegacao2( Ord, acampo, btnIni, btnAnt, btnProx, btnUlt, sqlNew, dmEmp.sqlpneuive, piv_codigo,'' );
  acampo := 0;
  RefreshDialog2(cPre,acampo, frmpneuive, sqlNew, aEdits);
  acampo := 1;
end;

procedure TfrmPneuIve.RefreshDados(tipo: String);
var
  i: integer;
  cWhere, cQuery, cOrder: String;

begin
  RefreshDados2(acampo, tipo, '', piv_codigo, sqlNew, dmEmp.sqlpneuive );
end;

procedure TfrmPneuIve.RefreshDialog;
var
  i, tmp: Integer;
  frmx : TForm ;
begin
  RefreshDialog2(cPre,acampo, frmpneuive, sqlNew, aEdits);
end;


procedure TfrmPneuIve.ToolButton9Click(Sender: TObject);
begin
  frmCalculadora := TfrmCalculadora.Create(Self);
  frmCalculadora.Show;

end;

procedure TfrmPneuIve.ativaButoes(tipo:Integer);
begin
ativaButoes2(Tipo,  btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt, sqlNew);
end;

procedure TfrmPneuIve.ativaget;
begin
  ativaget2(aEdits,cPre+'codigo',cTabela, btnGrava.Enabled, lMostra );
end;

procedure TfrmPneuIve.btnAlterarExecute(Sender: TObject);
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
   piv_mfogo.SetFocus;
   navegacao(0);
   grbKm.Enabled := False;
   grbSulco.Enabled := False;
   grbOutDad.Enabled := False;
end;

procedure TfrmPneuIve.btnAntExecute(Sender: TObject);
begin
  navegacao(2);
end;

procedure TfrmPneuIve.btnCancelaExecute(Sender: TObject);
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
   piv_codigo.SetFocus;

end;

procedure TfrmPneuIve.btnExcluirExecute(Sender: TObject);
Var
aSubTab : TArrayDim2;
n: Integer;
begin
   //SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'acessoratv';     aSubTab[n][1] := '';
   If Exclui2(cTabela, aSubTab,  piv_codigo, btnExcluir) Then Begin;
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

procedure TfrmPneuIve.btnGravaExecute(Sender: TObject);
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
   piv_codigo.SetFocus;
end;

procedure TfrmPneuIve.btnIniExecute(Sender: TObject);
begin
  navegacao(1);
end;

procedure TfrmPneuIve.btnNovoExecute(Sender: TObject);
begin
   acampo := 1;
   nNew   := acampo;
   btnGrava.Enabled := True;
   RefreshDados('S');
   limpaget;
   ativaButoes(1);
   lMostra := False;
   ativaget;
   piv_mfogo.SetFocus;
   grbKm.Enabled := False;
   grbSulco.Enabled := False;
   grbOutDad.Enabled := False;
end;

procedure TfrmPneuIve.btnProxExecute(Sender: TObject);
begin
  navegacao(3);
end;

procedure TfrmPneuIve.btnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmPneuIve.btnUltExecute(Sender: TObject);
begin
  navegacao(4);
end;

initialization
  RegisterClass(TfrmPneuIve);


end.
{
 Ideia de posicionamento dos pneus

1 C D E
| | | |______ Interno / Meio / externo
| | |________ Direita ou Esquerda
| |__________ Cabine ou carroceria
|____________ Eixo

}
