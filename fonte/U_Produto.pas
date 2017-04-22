unit U_Produto;

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
  TfrmProduto = class(TForm)
    StatusBar1: TStatusBar;
    Banner: TPanel;
    imgLogo: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    pdt_codigo: TButtonedEdit;
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
    pdt_codmpr: TButtonedEdit;
    Label2: TLabel;
    Label3: TLabel;
    edNomMpr: TEdit;
    actionsub: TActionManager;
    CmbBtnInc: TAction;
    cmbBtnExc: TAction;
    edNomCtg: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    pdt_nome: TEdit;
    Label6: TLabel;
    pdt_codfbt: TButtonedEdit;
    Label7: TLabel;
    edNomFbt: TEdit;
    Label8: TLabel;
    pdt_codbar: TEdit;
    Label9: TLabel;
    pdt_unimed: TComboBox;
    Label11: TLabel;
    pdt_vlrcst: TMaskEdit;
    Label10: TLabel;
    pdt_pctluc: TMaskEdit;
    Label12: TLabel;
    pdt_vlrvnd: TMaskEdit;
    Label13: TLabel;
    pdt_ncmnfe: TEdit;
    Label14: TLabel;
    pdt_estmin: TMaskEdit;
    Label15: TLabel;
    pdt_estoqu: TMaskEdit;
    Label16: TLabel;
    pdt_codctg: TButtonedEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure RefreshDialog;
    Procedure RefreshDados(tipo: String);
    procedure pdt_codigoExit(Sender: TObject);
    procedure pdt_codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pdt_codigoRightButtonClick(Sender: TObject);
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
    procedure pdt_codmprRightButtonClick(Sender: TObject);
    procedure pdt_codmprKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pdt_codmprExit(Sender: TObject);
    procedure pdt_vlrcstKeyPress(Sender: TObject; var Key: Char);
    procedure pdt_codfbtRightButtonClick(Sender: TObject);
    procedure pdt_codctgRightButtonClick(Sender: TObject);
    procedure pdt_codctgKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pdt_codctgExit(Sender: TObject);
    procedure pdt_codfbtKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pdt_codfbtExit(Sender: TObject);
    procedure pdt_pctlucKeyPress(Sender: TObject; var Key: Char);
    procedure pdt_vlrvndKeyPress(Sender: TObject; var Key: Char);
    procedure pdt_estminKeyPress(Sender: TObject; var Key: Char);
    procedure pdt_estoquKeyPress(Sender: TObject; var Key: Char);
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
  frmProduto: TfrmProduto;
  modConsulta, nOrdem : integer;


implementation

uses  UCalculadora,  u_DmEmp, uSistema, U_funcao, U_CnpjClass;

{$R *.dfm}

procedure TfrmProduto.pdt_codmprExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlMateriapri ;
  edNomMpr.Text :=  Pesquisa.Relacao('Materiapri',pdt_codmpr,'mpr_codigo','mpr_nome');

end;

procedure TfrmProduto.pdt_codmprKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      pdt_codmprRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmProduto.pdt_codmprRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsMateriapri ;
  Pesquisa.sqlTabela :=  dmEmp.sqlMateriapri ;
  Pesquisa.cliTabela :=  dmEmp.cliMateriapri ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Materia Prima';
  Pesquisa.nmTabela  := 'Materiapri' ;
  Pesquisa.NovoCad   := 'materiapri' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('mpr_codigo','Código'        ,'pdt_codmpr' ,5  ,'por Código' );
  Pesquisa.AddReg('mpr_nome'  ,'Banco'         ,'edNomMpr'   ,25 ,'por Descrição' );


  Pesquisa.acessa(pdt_codmpr);
  pdt_codmpr.text   :=  Pesquisa.RecReg('mpr_codigo');
  edNomMpr.text     :=  Pesquisa.RecReg('mpr_nome');
  Pesquisa.Destroy;

 end;

procedure TfrmProduto.pdt_estminKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  QtdKey( Key, pdt_estmin );
  Key := #0 ;
end;

procedure TfrmProduto.pdt_estoquKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  QtdKey( Key, pdt_estoqu );
  Key := #0 ;

end;

procedure TfrmProduto.pdt_vlrcstKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  MoedaKeyEdit( Key, pdt_vlrcst );
  Key := #0 ;
end;
procedure TfrmProduto.pdt_codctgExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlCategoria ;
  edNomCtg.Text :=  Pesquisa.Relacao('categoria',pdt_codctg,'ctg_codigo','ctg_nome');

end;

procedure TfrmProduto.pdt_codctgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      pdt_codctgRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmProduto.pdt_codctgRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsCategoria ;
  Pesquisa.sqlTabela :=  dmEmp.sqlCategoria ;
  Pesquisa.cliTabela :=  dmEmp.cliCategoria ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Categorias de Produtos';
  Pesquisa.nmTabela  := 'Categoria' ;
  Pesquisa.NovoCad   := 'categoria' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('ctg_codigo','Código'        ,'pdt_codctg' ,5  ,'por Código' );
  Pesquisa.AddReg('ctg_nome'  ,'Categoria'     ,'edNomCtg'   ,25 ,'por Descrição' );


  Pesquisa.acessa(pdt_codctg);
  pdt_codctg.text   :=  Pesquisa.RecReg('ctg_codigo');
  edNomCtg.text     :=  Pesquisa.RecReg('ctg_nome');
  Pesquisa.Destroy;

 end;

procedure TfrmProduto.pdt_codfbtExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlFabricante ;
  edNomFbt.Text :=  Pesquisa.Relacao('Fabricante',pdt_codfbt,'fbt_codigo','fbt_nome');

end;

procedure TfrmProduto.pdt_codfbtKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      pdt_codfbtRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmProduto.pdt_codfbtRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsFabricante ;
  Pesquisa.sqlTabela :=  dmEmp.sqlFabricante ;
  Pesquisa.cliTabela :=  dmEmp.cliFabricante ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Fabricante';
  Pesquisa.nmTabela  := 'Fabricante' ;
  Pesquisa.NovoCad   := 'fabricante' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('fbt_codigo','Código'        ,'pdt_codfbt' ,5  ,'por Código' );
  Pesquisa.AddReg('fbt_nome'  ,'Fabricante'    ,'edNomFbt'   ,25 ,'por Descrição' );


  Pesquisa.acessa(pdt_codfbt);
  pdt_codfbt.text   :=  Pesquisa.RecReg('fbt_codigo');
  edNomFbt.text     :=  Pesquisa.RecReg('fbt_nome');
  Pesquisa.Destroy;

 end;

procedure TfrmProduto.pdt_codigoExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados

  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlProduto ;
 //pdt_nome.Text :=  Pesquisa.Relacao('Produto',pdt_codigo,'pdt_codigo','pdt_nome');
  navegacao(5);

end;

procedure TfrmProduto.pdt_codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END    : pdt_codigoRightButtonClick(Self);
    VK_UP     : navegacao(1);
    VK_LEFT   : navegacao(2);
    VK_RIGHT  : navegacao(3);
    VK_DOWN   : navegacao(4);

  end;
Finally

End;

end;

procedure TfrmProduto.pdt_codigoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
if btnGrava.Enabled then
   Exit;

  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsproduto ;
  Pesquisa.sqlTabela :=  dmEmp.sqlProduto ;
  Pesquisa.cliTabela :=  dmEmp.cliProduto ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Produtos';
  Pesquisa.nmTabela  := 'produto';
//  Pesquisa.NovoCad   := 'Produto' ;
  // Display        campo   cabecalho                     get         tan  indices
  Pesquisa.AddReg('pdt_codigo'  ,'Código'                 ,'pdt_codigo' ,7 ,'por Código'       );
  Pesquisa.AddReg('pdt_codbar'  ,'Cód. Barra'             ,'pdt_codbar' ,10,'por Cod. Barras'  );
  Pesquisa.AddReg('pdt_nome'    ,'Descrição do Produto'   ,'pdt_nome'   ,30,'por Descrição'    );
  Pesquisa.AddReg('fbt_nome'    ,'Fabricante'             ,'fbt_nome'   ,20,'por Fabricante'   );
  Pesquisa.AddReg('pdt_vlrvnd'  ,'Valor para Venda'       ,'pdt_vlrvnd' ,15,'por Valor'        );
  Pesquisa.AddReg('pdt_Estoqu'  ,'Estoque Atual'          ,'pdt_Estoqu' ,15,'por Estoque'      );


  Pesquisa.acessa(pdt_codigo);
  pdt_codigo.text   :=  Pesquisa.RecReg('pdt_codigo');
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


procedure TfrmProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sqlNew.Close;
    dmEmp.cliProduto.Close;
    frmProduto                 := nil ;
    action                       := cafree;
    fPrincipal.btnProduto.Enabled := True;
end;



procedure TfrmProduto.FormCreate(Sender: TObject);
Var
i: Integer;
begin
  cPre                        := 'pdt_';
  cTabela                     := 'Produto';
  acampo                      := 1;
  sqlNew                      := TFDQuery.Create(nil);
  sqlNew.Connection           := dmemp.SqlConSis;
  fPrincipal.btnproduto.Enabled  := False;
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;
end;

procedure TfrmProduto.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmProduto.FormShow(Sender: TObject);
var
i, tmp: Integer;
Pesquisa : TClasConsulta;
begin
  for i := 0 to Length(aUniMed) do Begin
      pdt_unimed.Items.Add(aUniMed[i]);
  End;
  pdt_unimed.ItemIndex := 0;


  Util:= TClasseUtil.Create;
  Pesquisa := TClasConsulta.Create;

  // Cor do banner
  Banner.ParentBackGround := False;
  Banner.ParentColor      := False;
  Banner.Brush.Color      := u_funcao.Bronze_Escuro ;

  // Titulos do Banner
  lbCabeca01.Caption    := 'Cadstro de Produtos';
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

procedure TfrmProduto.gravadados;
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, ctip_horalt,cCodSql, cIteSql,cValSql,cCodMnt : string ;
dData, dtip_datalt : TDate ;
i, tmp: Integer;
SQLQ : TFDQuery ;

begin
   gravadados2(cTabela,cPre,cPre+'codigo','X','', nNew, frmProduto, dmEmp.SqlConSis, aEdits );
end;

procedure TfrmProduto.limpaget;
Var
i: Integer;
begin
  limpaget2(aEdits);
end;

procedure TfrmProduto.pdt_vlrvndKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  MoedaKeyEdit( Key, pdt_vlrvnd );
  Key := #0 ;
end;

procedure TfrmProduto.pdt_pctlucKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  PorcentoKeyEdit( Key, pdt_pctluc );
  Key := #0 ;
end;
procedure TfrmProduto.navegacao(Ord: Integer);
begin
  if btnGrava.Enabled then
     Exit;

  navegacao2( Ord, acampo, btnIni, btnAnt, btnProx, btnUlt, sqlNew, dmEmp.sqlProduto, pdt_codigo,'' );
  acampo := 0;
  RefreshDialog2(cPre,acampo, frmProduto, sqlNew, aEdits);
  acampo := 1;
end;

procedure TfrmProduto.RefreshDados(tipo: String);
var
  i: integer;
  cWhere, cQuery, cOrder: String;

begin
  RefreshDados2(acampo, tipo, '', pdt_codigo, sqlNew, dmEmp.sqlProduto );
end;

procedure TfrmProduto.RefreshDialog;
var
  i, tmp: Integer;
  frmx : TForm ;
begin
  RefreshDialog2(cPre,acampo, frmProduto, sqlNew, aEdits);
end;


procedure TfrmProduto.ToolButton9Click(Sender: TObject);
begin
  frmCalculadora := TfrmCalculadora.Create(Self);
  frmCalculadora.Show;

end;

procedure TfrmProduto.ativaButoes(tipo:Integer);
begin
ativaButoes2(Tipo,  btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt, sqlNew);
end;

procedure TfrmProduto.ativaget;
begin
  ativaget2(aEdits,cPre+'codigo',cTabela, btnGrava.Enabled, lMostra );
end;

procedure TfrmProduto.btnAlterarExecute(Sender: TObject);
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
   pdt_codmpr.SetFocus;
   navegacao(0);

end;

procedure TfrmProduto.btnAntExecute(Sender: TObject);
begin
  navegacao(2);
end;

procedure TfrmProduto.btnCancelaExecute(Sender: TObject);
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

   pdt_codmpr.SetFocus;

end;

procedure TfrmProduto.btnExcluirExecute(Sender: TObject);
Var
aSubTab : TArrayDim2;
n: Integer;
begin
   //SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'acessoratv';     aSubTab[n][1] := '';
   If Exclui2(cTabela, aSubTab,  pdt_codigo, btnExcluir) Then Begin;
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

procedure TfrmProduto.btnGravaExecute(Sender: TObject);
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
   pdt_codigo.SetFocus;
end;

procedure TfrmProduto.btnIniExecute(Sender: TObject);
begin
  navegacao(1);
end;

procedure TfrmProduto.btnNovoExecute(Sender: TObject);
begin
   acampo := 1;
   nNew   := acampo;
   btnGrava.Enabled := True;
   RefreshDados('S');
   limpaget;
   ativaButoes(1);
   lMostra := False;
   ativaget;
   pdt_codmpr.SetFocus;
end;

procedure TfrmProduto.btnProxExecute(Sender: TObject);
begin
  navegacao(3);
end;

procedure TfrmProduto.btnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmProduto.btnUltExecute(Sender: TObject);
begin
  navegacao(4);
end;

initialization
  RegisterClass(TfrmProduto);


end.
