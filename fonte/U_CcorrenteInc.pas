unit U_CcorrenteInc;

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
  TfrmCcorrente = class(TForm)
    StatusBar1: TStatusBar;
    Banner: TPanel;
    imgLogo: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    cct_codigo: TButtonedEdit;
    Label4: TLabel;
    cct_agencia: TEdit;
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
    cct_codbco: TButtonedEdit;
    Label2: TLabel;
    Label3: TLabel;
    edNomBco: TEdit;
    actionsub: TActionManager;
    CmbBtnInc: TAction;
    cmbBtnExc: TAction;
    cct_nrconta: TEdit;
    Label5: TLabel;
    cct_codpcd: TButtonedEdit;
    Label55: TLabel;
    edNompcd: TEdit;
    Label56: TLabel;
    cct_codpcc: TButtonedEdit;
    Label45: TLabel;
    edNomPcc: TEdit;
    Label44: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure RefreshDialog;
    Procedure RefreshDados(tipo: String);
    procedure cct_codigoExit(Sender: TObject);
    procedure cct_codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cct_codigoRightButtonClick(Sender: TObject);
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
    procedure cct_codbcoRightButtonClick(Sender: TObject);
    procedure cct_codbcoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cct_codbcoExit(Sender: TObject);
    procedure cct_codpcdRightButtonClick(Sender: TObject);
    procedure cct_codpcdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cct_codpcdExit(Sender: TObject);
    procedure cct_codpccRightButtonClick(Sender: TObject);
    procedure cct_codpccKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cct_codpccExit(Sender: TObject);
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
  frmCcorrente: TfrmCcorrente;
  modConsulta, nOrdem : integer;


implementation

uses  UCalculadora,  u_DmEmp, uSistema, U_funcao, U_CnpjClass, U_ClassconsContas;

{$R *.dfm}

procedure TfrmCcorrente.cct_codbcoExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlBanco ;
  edNomBco.Text :=  Pesquisa.Relacao('Banco',cct_codbco,'bco_codigo','bco_nome');

end;

procedure TfrmCcorrente.cct_codbcoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      cct_codbcoRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmCcorrente.cct_codbcoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsBanco ;
  Pesquisa.sqlTabela :=  dmEmp.sqlBanco ;
  Pesquisa.cliTabela :=  dmEmp.cliBanco ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Bancos Financeiros';
  Pesquisa.nmTabela  := 'Banco' ;
  Pesquisa.NovoCad   := 'Banco' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('bco_codigo','Código'        ,'cct_codbco' ,5  ,'por Código' );
  Pesquisa.AddReg('bco_nome'  ,'Banco'         ,'edNomFnd'   ,25 ,'por Banco' );


  Pesquisa.acessa(cct_codbco);
  cct_codbco.text   :=  Pesquisa.RecReg('bco_codigo');
  Pesquisa.Destroy;

 end;

procedure TfrmCcorrente.cct_codigoExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados

  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlccorrente ;
 //cct_nome.Text :=  Pesquisa.Relacao('ccorrente',cct_codigo,'cct_codigo','cct_nome');
  navegacao(5);

end;

procedure TfrmCcorrente.cct_codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END    : cct_codigoRightButtonClick(Self);
    VK_UP     : navegacao(1);
    VK_LEFT   : navegacao(2);
    VK_RIGHT  : navegacao(3);
    VK_DOWN   : navegacao(4);

  end;
Finally

End;

end;

procedure TfrmCcorrente.cct_codigoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
if btnGrava.Enabled then
   Exit;

  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsccorrente ;
  Pesquisa.sqlTabela :=  dmEmp.sqlccorrente ;
  Pesquisa.cliTabela :=  dmEmp.cliccorrente ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Conta Corrente';
  Pesquisa.nmTabela  := 'ccorrente';
//  Pesquisa.NovoCad   := 'ccorrente' ;
  // Display        campo   cabecalho                     get         tan  indices
  Pesquisa.AddReg('cct_codigo'  ,'Código'                 ,'cct_codigo' ,5 ,'por Código'    );
  Pesquisa.AddReg('cct_codbco'  ,'Nr do Banco'            ,'cct_codbco' ,6 ,'por Nr Bnaco'  );
  Pesquisa.AddReg('cct_agencia' ,'Agencia'                ,'cct_agencia',9 ,'por Agencia'   );
  Pesquisa.AddReg('cct_nrconta' ,'Nº da Conta'            ,'cct_nrconta',9 ,'por Nr Conta'  );
  Pesquisa.AddReg('bco_nome'    ,'Nome do Banco'          ,'bco_nome',  30 ,'por Nome'  );
  Pesquisa.AddReg('abc_vlratu'  ,'Saldo'                  ,'abc_vlratu',10 ,''  );


  Pesquisa.acessa(cct_codigo);
  cct_codigo.text   :=  Pesquisa.RecReg('cct_codigo');
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


procedure TfrmCcorrente.cct_codpccExit(Sender: TObject);
Var
  Pesquisa : TClasConsultaConta;
begin
  if cct_codpcc.Text <> '' then begin

      // Função que confirma os dados relacionados
      Pesquisa := TClasConsultaConta.Create;
      edNomPcc.Text :=  Pesquisa.Relacao('pct_nome',cct_codpcc.Text);
  end;

end;

procedure TfrmCcorrente.cct_codpccKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      cct_codpccRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmCcorrente.cct_codpccRightButtonClick(Sender: TObject);
Var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsultaConta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsultaConta.Create;
  Pesquisa.acessa(cct_codpcc,'C');
  edNomPcc.Text :=  Pesquisa.Relacao('pct_nome',cct_codpcc.Text);
  Pesquisa.Destroy;

end;

procedure TfrmCcorrente.cct_codpcdExit(Sender: TObject);
Var
  Pesquisa : TClasConsultaConta;
begin
  if cct_codpcd.Text <> '' then begin

      // Função que confirma os dados relacionados
      Pesquisa := TClasConsultaConta.Create;
      edNomPcd.Text :=  Pesquisa.Relacao('pct_nome',cct_codpcd.Text);
  end;

end;

procedure TfrmCcorrente.cct_codpcdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      cct_codpcdRightButtonClick(Self);
  end;
Finally

End;
end;

procedure TfrmCcorrente.cct_codpcdRightButtonClick(Sender: TObject);
Var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsultaConta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsultaConta.Create;
  Pesquisa.acessa(cct_codpcd,'D');
  edNomPcd.Text :=  Pesquisa.Relacao('pct_nome',cct_codpcd.Text);
  Pesquisa.Destroy;

end;

procedure TfrmCcorrente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sqlNew.Close;
    dmEmp.cliccorrente.Close;
    frmccorrente                 := nil ;
    action                       := cafree;
    fPrincipal.btnccorrente.Enabled := True;
end;



procedure TfrmCcorrente.FormCreate(Sender: TObject);
Var
i: Integer;
begin
  cPre                        := 'cct_';
  cTabela                     := 'ccorrente';
  acampo                      := 1;
  sqlNew                      := TFDQuery.Create(nil);
  sqlNew.Connection           := dmemp.SqlConSis;
  fPrincipal.btnccorrente.Enabled  := False;
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;
end;

procedure TfrmCcorrente.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmCcorrente.FormShow(Sender: TObject);
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

procedure TfrmCcorrente.gravadados;
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, ctip_horalt,cCodSql, cIteSql,cValSql,cCodMnt : string ;
dData, dtip_datalt : TDate ;
i, tmp: Integer;
SQLQ : TFDQuery ;

begin
   gravadados2(cTabela,cPre,cPre+'codigo','X','', nNew, frmCcorrente, dmEmp.SqlConSis, aEdits );
end;

procedure TfrmCcorrente.limpaget;
Var
i: Integer;
begin
  limpaget2(aEdits);
end;

procedure TfrmCcorrente.navegacao(Ord: Integer);
begin
  if btnGrava.Enabled then
     Exit;

  navegacao2( Ord, acampo, btnIni, btnAnt, btnProx, btnUlt, sqlNew, dmEmp.sqlCcorrente, cct_codigo,'' );
  acampo := 0;
  RefreshDialog2(cPre,acampo, frmCcorrente, sqlNew, aEdits);
  acampo := 1;
end;

procedure TfrmCcorrente.RefreshDados(tipo: String);
var
  i: integer;
  cWhere, cQuery, cOrder: String;

begin
  RefreshDados2(acampo, tipo,'', cct_codigo, sqlNew, dmEmp.sqlCcorrente );
end;

procedure TfrmCcorrente.RefreshDialog;
var
  i, tmp: Integer;
  frmx : TForm ;
begin
  RefreshDialog2(cPre,acampo, frmCcorrente, sqlNew, aEdits);
end;


procedure TfrmCcorrente.ToolButton9Click(Sender: TObject);
begin
  frmCalculadora := TfrmCalculadora.Create(Self);
  frmCalculadora.Show;

end;

procedure TfrmCcorrente.ativaButoes(tipo:Integer);
begin
ativaButoes2(Tipo,  btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt, sqlNew);
end;

procedure TfrmCcorrente.ativaget;
begin
  ativaget2(aEdits,cPre+'codigo',cTabela, btnGrava.Enabled, lMostra );
end;

procedure TfrmCcorrente.btnAlterarExecute(Sender: TObject);
begin
   btnNovo.Enabled    := False;
   btnAlterar.Enabled := False;
   btnGrava.Enabled   := True;
   ativaButoes(1);
   lMostra := True;
   ativaget;
   RefreshDialog;
   cct_codbco.SetFocus;
   acampo := 0;
   nNew   := acampo;
   navegacao(0);
   cct_codbco.Enabled  := False;
   cct_agencia.Enabled := False;
   cct_nrconta.Enabled := False;

end;

procedure TfrmCcorrente.btnAntExecute(Sender: TObject);
begin
  navegacao(2);
end;

procedure TfrmCcorrente.btnCancelaExecute(Sender: TObject);
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

   cct_codigo.SetFocus;

end;

procedure TfrmCcorrente.btnExcluirExecute(Sender: TObject);
Var
aSubTab : TArrayDim2;
n: Integer;
begin
   //SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'acessoratv';     aSubTab[n][1] := '';
   If Exclui2(cTabela, aSubTab,  cct_codigo, btnExcluir) Then Begin;
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

procedure TfrmCcorrente.btnGravaExecute(Sender: TObject);
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
   cct_codigo.SetFocus;
end;

procedure TfrmCcorrente.btnIniExecute(Sender: TObject);
begin
  navegacao(1);
end;

procedure TfrmCcorrente.btnNovoExecute(Sender: TObject);
begin
   acampo := 1;
   nNew   := acampo;
   btnGrava.Enabled := True;
   RefreshDados('S');
   limpaget;
   ativaButoes(1);
   lMostra := False;
   ativaget;
   cct_codbco.SetFocus;
end;

procedure TfrmCcorrente.btnProxExecute(Sender: TObject);
begin
  navegacao(3);
end;

procedure TfrmCcorrente.btnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmCcorrente.btnUltExecute(Sender: TObject);
begin
  navegacao(4);
end;

initialization
  RegisterClass(TfrmCcorrente);


end.
