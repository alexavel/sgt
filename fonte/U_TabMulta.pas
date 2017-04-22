unit U_TabMulta;

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
  TfrmTabmulta = class(TForm)
    StatusBar1: TStatusBar;
    Banner: TPanel;
    imgLogo: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    tmt_codigo: TButtonedEdit;
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
    tmt_nome: TRichEdit;
    tmt_gravid: TComboBox;
    Label20: TLabel;
    tmt_ampleg: TEdit;
    Label11: TLabel;
    tmt_infrat: TEdit;
    Label2: TLabel;
    tmt_local: TEdit;
    Label3: TLabel;
    tmt_nmrpts: TMaskEdit;
    Label26: TLabel;
    tmt_vlrmul: TMaskEdit;
    Label5: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure RefreshDialog;
    Procedure RefreshDados(tipo: String);
    procedure tmt_codigoExit(Sender: TObject);
    procedure tmt_codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tmt_codigoRightButtonClick(Sender: TObject);
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
    procedure tmt_vlrmulKeyPress(Sender: TObject; var Key: Char);
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
  frmTabmulta: TfrmTabmulta;
  modConsulta, nOrdem : integer;


implementation

uses  UCalculadora,  u_DmEmp, uSistema, U_funcao, U_CnpjClass;

{$R *.dfm}

procedure TfrmTabmulta.tmt_codigoExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqltabmulta ;
  tmt_nome.Text :=  Pesquisa.Relacao('tabmulta',tmt_codigo,'tmt_codigo','tmt_nome');
  navegacao(5);
end;

procedure TfrmTabmulta.tmt_codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      tmt_codigoRightButtonClick(Self);
    VK_UP     : navegacao(1);
    VK_LEFT   : navegacao(2);
    VK_RIGHT  : navegacao(3);
    VK_DOWN   : navegacao(4);
  end;
Finally

End;

end;

procedure TfrmTabmulta.tmt_codigoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
if btnGrava.Enabled then
   Exit;

  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dstabmulta ;
  Pesquisa.sqlTabela :=  dmEmp.sqltabmulta;
  Pesquisa.cliTabela :=  dmEmp.clitabmulta ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Multas';
  Pesquisa.nmTabela  := 'tabmulta';
  //Pesquisa.NovoCad   := 'tipo' ;
  // Display        campo   cabecalho           get         tan  indices
  Pesquisa.AddReg('tmt_codigo','Código'    ,'tmt_codigo' ,10  ,'por Código'    );
  Pesquisa.AddReg('tmt_nome'  ,'Descrição' ,'tmt_nome'   ,100 ,'por Descrição' );
  Pesquisa.AddReg('tmt_nmrpts','Pontos'    ,'tmt_nmrpts' ,10  ,'por Pontos' );
  Pesquisa.AddReg('tmt_vlrmul','Valor'     ,'tmt_vlrmul' ,15  ,'por Valor' );

  Pesquisa.acessa(tmt_codigo);
  tmt_codigo.text   :=  Pesquisa.RecReg('tmt_codigo');
  Pesquisa.Destroy;

  if Pesquisa.lOk then Begin
     tmt_nome.text     :=  Pesquisa.RecReg('tmt_nome');
     acampo             := 0;
     RefreshDados('S');
     btnNovo.Enabled    := False;
     btnAlterar.Enabled := True;
     ativaButoes(1);
     ativaget;
     navegacao(5);
  End;

 end;


procedure TfrmTabmulta.tmt_vlrmulKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  MoedaKeyEdit( Key, tmt_vlrmul );
  Key := #0 ;
end;

procedure TfrmTabmulta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sqlNew.Close;
    dmEmp.clicor.Close;
    frmtabmulta                    := nil ;
    action                         := cafree;
    fPrincipal.btntabmulta.Enabled := True;
end;



procedure TfrmTabmulta.FormCreate(Sender: TObject);
Var
i: Integer;
begin
  cPre                        := 'tmt_';
  cTabela                     := 'tabmulta';
  acampo                      := 1;
  sqlNew                      := TFDQuery.Create(nil);
  sqlNew.Connection           := dmEmp.SqlConSis;
  fPrincipal.btntabmulta.Enabled  := False;
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;
end;


procedure TfrmTabmulta.FormKeyPress(Sender: TObject; var Key: Char);
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

  end;
end;
procedure TfrmTabmulta.FormShow(Sender: TObject);
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
  lbCabeca01.Caption    := 'Tabela de Multas';
  lbCabeca02.Caption    := u_funcao.nmSistema ;
  // Cores - Titulos do Banner
  lbCabeca01.Font.Color := u_funcao.clTit_BCad ;
  lbCabeca02.Font.Color := u_funcao.clTit_BCad ;
  RefreshDados('T');
  btnGrava.Enabled := False;
  ativaButoes(1);
  RefreshDialog;
  lMostra := False;
  ativaget;
  navegacao(1);
  btnNovo.Caption    := 'Novo'+#13 +'[F3]';
  btnAlterar.Caption := 'Editar'+#13 +'[F4]';
  btnGrava.Caption   := 'Salvar'+#13 +'[F5]';
  btnExcluir.Caption := 'Excluir'+#13 +'[Alt+Del]';
  btnCancela.Caption := 'Cancelar'+#13 +'[F12]';

end;

procedure TfrmTabmulta.gravadados;
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, ctip_horalt,cCodSql, cIteSql,cValSql,cCodMnt : string ;
dData, dtip_datalt : TDate ;
i, tmp: Integer;
SQLQ : TFDQuery ;
begin
   gravadados2(cTabela,cPre,cPre+'codigo','X','', nNew, frmtabmulta, dmEmp.SqlConSis, aEdits );
end;

procedure TfrmTabmulta.limpaget;
Var
i: Integer;
begin
  limpaget2(aEdits);
end;

procedure TfrmTabmulta.navegacao(Ord: Integer);
begin
  if btnGrava.Enabled then
     Exit;

  navegacao2( Ord, acampo, btnIni, btnAnt, btnProx, btnUlt, sqlNew, dmEmp.sqltabmulta, tmt_codigo,'' );
  acampo := 0;
  RefreshDialog2(cPre,acampo, frmtabmulta, sqlNew, aEdits);
  acampo := 1;
end;


procedure TfrmTabmulta.RefreshDados(tipo: String);
var
  i: integer;
  cWhere, cQuery, cOrder: String;

begin
  RefreshDados2(acampo, tipo, '', tmt_codigo, sqlNew, dmEmp.sqltabmulta );
end;

procedure TfrmTabmulta.RefreshDialog;
var
  i, tmp: Integer;
  frmx : TForm ;
begin
  RefreshDialog2(cPre,acampo, frmtabmulta, sqlNew, aEdits);
end;

procedure TfrmTabmulta.ToolButton9Click(Sender: TObject);
begin
  frmCalculadora := TfrmCalculadora.Create(Self);
  frmCalculadora.Show;

end;

procedure TfrmTabmulta.ativaButoes(tipo:Integer);
begin
ativaButoes2(Tipo,  btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt, sqlNew);
end;


procedure TfrmTabmulta.ativaget;
begin
  ativaget2(aEdits,cPre+'codigo',cTabela, btnGrava.Enabled, lMostra );
end;

procedure TfrmTabmulta.btnAlterarExecute(Sender: TObject);
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
   tmt_nome.SetFocus;
   navegacao(0);

end;

procedure TfrmTabmulta.btnAntExecute(Sender: TObject);
begin
  navegacao(2);
end;

procedure TfrmTabmulta.btnCancelaExecute(Sender: TObject);
begin
   RollBack;
   acampo := 1;
   nNew             := acampo;
   btnNovo.Enabled  := True;
   btnGrava.Enabled := False;
   RefreshDados('T');
   ativaButoes(1);
   lMostra := False;
   ativaget;
   navegacao(4);

   tmt_codigo.SetFocus;

end;

procedure TfrmTabmulta.btnExcluirExecute(Sender: TObject);
Var
aSubTab : TArrayDim2;
n: Integer;
begin
   //SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'acessoratv';     aSubTab[n][1] := '';
   If Exclui2(cTabela, aSubTab,  tmt_codigo, btnExcluir) Then Begin;
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

procedure TfrmTabmulta.btnGravaExecute(Sender: TObject);
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
   tmt_codigo.SetFocus;
end;

procedure TfrmTabmulta.btnIniExecute(Sender: TObject);
begin
  navegacao(1);
end;

procedure TfrmTabmulta.btnNovoExecute(Sender: TObject);
begin
   acampo := 1;
   nNew   := acampo;
   btnGrava.Enabled := True;
   RefreshDados('S');
   limpaget;
   ativaButoes(1);
   lMostra := False;
   ativaget;
   tmt_codigo.SetFocus;
end;

procedure TfrmTabmulta.btnProxExecute(Sender: TObject);
begin
  navegacao(3);
end;

procedure TfrmTabmulta.btnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmTabmulta.btnUltExecute(Sender: TObject);
begin
  navegacao(4);
end;

initialization
  RegisterClass(TfrmTabmulta);


end.
