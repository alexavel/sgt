unit U_tbpecas;

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
  Tfrmtbpecas = class(TForm)
    StatusBar1: TStatusBar;
    Banner: TPanel;
    imgLogo: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
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
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label10: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    tpc_codsgm: TButtonedEdit;
    edNomSgm: TEdit;
    tpc_kgpeso: TMaskEdit;
    edNomFbp: TEdit;
    tpc_codfbp: TButtonedEdit;
    edNomCfo: TEdit;
    tpc_codcfo: TButtonedEdit;
    edNomCSt: TEdit;
    tpc_codcst: TButtonedEdit;
    tpc_codncm: TButtonedEdit;
    edNomNcm: TEdit;
    tpc_kgcubag: TMaskEdit;
    tpc_ativo: TCheckBox;
    tpc_codigo: TButtonedEdit;
    Label1: TLabel;
    tpc_cdbarra: TEdit;
    Label5: TLabel;
    tpc_nome: TEdit;
    Label4: TLabel;
    tpc_referen: TEdit;
    Label6: TLabel;
    tpc_medida: TComboBox;
    Label17: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure RefreshDialog;
    Procedure RefreshDados(tipo: String);
    procedure tpc_codigoExit(Sender: TObject);
    procedure tpc_codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tpc_codigoRightButtonClick(Sender: TObject);
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
    procedure tpc_codsgmRightButtonClick(Sender: TObject);
    procedure tpc_codsgmKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tpc_kgpesoKeyPress(Sender: TObject; var Key: Char);
    procedure tpc_codfbpRightButtonClick(Sender: TObject);
    procedure tpc_codfbpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tpc_codfbpExit(Sender: TObject);
    procedure tpc_codsgmExit(Sender: TObject);
    procedure tpc_codcfoRightButtonClick(Sender: TObject);
    procedure tpc_codcfoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tpc_codcfoExit(Sender: TObject);
    procedure tpc_codcstRightButtonClick(Sender: TObject);
    procedure tpc_codcstKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tpc_codcstExit(Sender: TObject);
    procedure tpc_codncmRightButtonClick(Sender: TObject);
    procedure tpc_codncmKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tpc_codncmExit(Sender: TObject);
    procedure tpc_kgcubagKeyPress(Sender: TObject; var Key: Char);
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
  frmtbpecas: Tfrmtbpecas;
  modConsulta, nOrdem : integer;


implementation

uses  UCalculadora,  u_DmEmp, uSistema, U_funcao, U_CnpjClass;

{$R *.dfm}

procedure Tfrmtbpecas.tpc_codcfoExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlcfop ;
  edNomCfo.Text :=  Pesquisa.Relacao('cfop',tpc_codcfo,'cfo_codigo','cfo_nome');

end;

procedure Tfrmtbpecas.tpc_codcfoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      tpc_codcfoRightButtonClick(Self);
  end;
Finally

End;

end;

procedure Tfrmtbpecas.tpc_codcfoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dscfop ;
  Pesquisa.sqlTabela :=  dmEmp.sqlcfop ;
  Pesquisa.cliTabela :=  dmEmp.clicfop ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de cfops ';
  Pesquisa.nmTabela  := 'cfop' ;
  Pesquisa.NovoCad   := 'cfop' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('cfo_codigo','Código'        ,'tpc_codcfo' ,5  ,'por Código' );
  Pesquisa.AddReg('cfo_nome'  ,'cfop'          ,'edNomCfo'   ,25 ,'por cfop' );


  Pesquisa.acessa(tpc_codcfo);
  tpc_codcfo.text   :=  Pesquisa.RecReg('cfo_codigo');
  edNomCfo.text     :=  Pesquisa.RecReg('cfo_nome');
  Pesquisa.Destroy;

end;

procedure Tfrmtbpecas.tpc_codcstExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlCst ;
  edNomCst.Text :=  Pesquisa.Relacao('Cst',tpc_codcst,'cst_codigo','cst_descri');

end;

procedure Tfrmtbpecas.tpc_codcstKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      tpc_codcstRightButtonClick(Self);
  end;
Finally

End;

end;

procedure Tfrmtbpecas.tpc_codcstRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsCst ;
  Pesquisa.sqlTabela :=  dmEmp.sqlCst ;
  Pesquisa.cliTabela :=  dmEmp.cliCst ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de CSTs';
  Pesquisa.nmTabela  := 'cst' ;
  Pesquisa.NovoCad   := 'cst' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('cst_codigo','Código'        ,'tpc_codcst' ,5  ,'por Código' );
  Pesquisa.AddReg('cst_descri'  ,'Descrição'     ,'edNomCst'   ,25 ,'por Cst' );


  Pesquisa.acessa(tpc_codcst);
  tpc_codcst.text   :=  Pesquisa.RecReg('cst_codigo');
  edNomCst.text     :=  Pesquisa.RecReg('cst_descri');
  Pesquisa.Destroy;

end;

procedure Tfrmtbpecas.tpc_codfbpExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlfabricapcs ;
  edNomFbp.Text :=  Pesquisa.Relacao('fabricapcs',tpc_codfbp,'fbp_codigo','fbp_nome');

end;

procedure Tfrmtbpecas.tpc_codsgmExit(Sender: TObject);
begin
  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlsubgrpmnt ;
  edNomSgm.Text   :=  Pesquisa.Relacao('subgrpmnt',tpc_codsgm,'sgm_codigo','sgm_nome');


end;

procedure Tfrmtbpecas.tpc_codsgmKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      tpc_codsgmRightButtonClick(Self);
  end;
Finally

End;

end;

procedure Tfrmtbpecas.tpc_codsgmRightButtonClick(Sender: TObject);
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


  Pesquisa.acessa(tpc_codsgm);
  tpc_codsgm.text   :=  Pesquisa.RecReg('sgm_codigo');
  edNomSgm.text     :=  Pesquisa.RecReg('sgm_nome');


  Pesquisa.Destroy;

 end;

procedure Tfrmtbpecas.tpc_kgcubagKeyPress(Sender: TObject; var Key: Char);
begin
    ChkPeso( Sender , Key );
end;

procedure Tfrmtbpecas.tpc_kgpesoKeyPress(Sender: TObject; var Key: Char);
begin
    ChkPeso( Sender , Key );
end;

procedure Tfrmtbpecas.tpc_codfbpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      tpc_codfbpRightButtonClick(Self);
  end;
Finally

End;

end;

procedure Tfrmtbpecas.tpc_codfbpRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsfabricapcs ;
  Pesquisa.sqlTabela :=  dmEmp.sqlfabricapcs ;
  Pesquisa.cliTabela :=  dmEmp.clifabricapcs ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Fabricantes de Peças';
  Pesquisa.nmTabela  := 'fabricapcs' ;
  Pesquisa.NovoCad   := 'fabricapcs' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('fbp_codigo','Código'        ,'tpc_codfbp' ,5  ,'por Código' );
  Pesquisa.AddReg('fbp_nome'  ,'CFOPs'         ,'edNomCfo'   ,25 ,'por Descrição' );


  Pesquisa.acessa(tpc_codfbp);
  tpc_codfbp.text   :=  Pesquisa.RecReg('fbp_codigo');
  edNomFbp.text     :=  Pesquisa.RecReg('fbp_nome');
  Pesquisa.Destroy;

end;

procedure Tfrmtbpecas.tpc_codigoExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados

  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqltbpecas ;
  tpc_nome.Text :=  Pesquisa.Relacao('tbpecas',tpc_codigo,'tpc_codigo','tpc_nome');
  navegacao(5);
end;

procedure Tfrmtbpecas.tpc_codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END    : tpc_codigoRightButtonClick(Self);
    VK_UP     : navegacao(1);
    VK_LEFT   : navegacao(2);
    VK_RIGHT  : navegacao(3);
    VK_DOWN   : navegacao(4);

  end;
Finally

End;

end;

procedure Tfrmtbpecas.tpc_codigoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
if btnGrava.Enabled then
   Exit;

  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dstbpecas ;
  Pesquisa.sqlTabela :=  dmEmp.Sqltbpecas ;
  Pesquisa.cliTabela :=  dmEmp.clitbpecas ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Peças Automotivos';
  Pesquisa.nmTabela  := 'tbpecas';
//  Pesquisa.NovoCad   := 'tbpecas' ;
  // Display        campo   cabecalho                     get         tan  indices
  Pesquisa.AddReg('tpc_codigo'  ,'Código'                 ,'tpc_codigo' ,5  ,'por Código'       );
  Pesquisa.AddReg('tpc_nome'    ,'Peça'                   ,'tpc_nome'   ,30 ,'por Peça'         );
  Pesquisa.AddReg('fbp_nome'    ,'Fabricante'             ,'fbp_nome'   ,30 ,'por Fabricante'   );
  Pesquisa.AddReg('sgm_nome'    ,'SubGrupo'               ,'tpc_nome'   ,30 ,'por SubGrupo'     );
  Pesquisa.AddReg('grm_nome'    ,'Grupo'                  ,'grm_nome'   ,15 ,'por Grupo'        );


  Pesquisa.acessa(tpc_codigo);
  tpc_codigo.text   :=  Pesquisa.RecReg('tpc_codigo');
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


procedure Tfrmtbpecas.tpc_codncmExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlncm ;
  edNomNcm.Text :=  Pesquisa.Relacao('ncm',tpc_codncm,'ncm_codigo','ncm_nome');

end;

procedure Tfrmtbpecas.tpc_codncmKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      tpc_codncmRightButtonClick(Self);
  end;
Finally

End;

end;

procedure Tfrmtbpecas.tpc_codncmRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsncm ;
  Pesquisa.sqlTabela :=  dmEmp.sqlncm ;
  Pesquisa.cliTabela :=  dmEmp.clincm ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de NCMs';
  Pesquisa.nmTabela  := 'ncm' ;
  Pesquisa.NovoCad   := 'ncm' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('ncm_codigo','Código'        ,'tpc_codncm' ,5  ,'por Código' );
  Pesquisa.AddReg('ncm_nome'  ,'Descrição'     ,'edNomNcm'   ,25 ,'por ncm' );


  Pesquisa.acessa(tpc_codncm);
  tpc_codncm.text   :=  Pesquisa.RecReg('ncm_codigo');
  edNomNcm.text     :=  Pesquisa.RecReg('ncm_nome');
  Pesquisa.Destroy;

end;

procedure Tfrmtbpecas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sqlNew.Close;
    dmEmp.clitbpecas.Close;
    frmtbpecas                 := nil ;
    action                       := cafree;
    fPrincipal.btntbpecas.Enabled := True;
end;



procedure Tfrmtbpecas.FormCreate(Sender: TObject);
Var
i: Integer;
begin
  cPre                        := 'tpc_';
  cTabela                     := 'tbpecas';
  acampo                      := 1;
  sqlNew                      := TFDQuery.Create(nil);
  sqlNew.Connection           := dmEmp.SqlConSis;
  fPrincipal.btntbpecas.Enabled  := False;
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;
end;

procedure Tfrmtbpecas.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure Tfrmtbpecas.FormShow(Sender: TObject);
var
i, tmp: Integer;
Pesquisa : TClasConsulta;
begin

  tpc_medida.Clear;
  for i := 0 to Length(aUniMed)-1 do Begin
      tpc_medida.Items.Add(aUniMed[i]);
  End;
  tpc_medida.ItemIndex := 0;

  Util:= TClasseUtil.Create;
  Pesquisa := TClasConsulta.Create;

  // Cor do banner
  Banner.ParentBackGround := False;
  Banner.ParentColor      := False;
  Banner.Brush.Color      := u_funcao.Bronze_Escuro ;

  // Titulos do Banner
  lbCabeca01.Caption    := 'Tabela de Peças Automotivos';
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

procedure Tfrmtbpecas.gravadados;
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, ctip_horalt,cCodSql, cIteSql,cValSql,cCodMnt : string ;
dData, dtip_datalt : TDate ;
i, tmp: Integer;
SQLQ : TFDQuery ;

begin
   gravadados2(cTabela,cPre,cPre+'codigo','X','', nNew, frmtbpecas, dmEmp.SqlConSis, aEdits );
end;

procedure Tfrmtbpecas.limpaget;
Var
i: Integer;
begin
  limpaget2(aEdits);
end;

procedure Tfrmtbpecas.navegacao(Ord: Integer);
begin
  if btnGrava.Enabled then
     Exit;

  navegacao2( Ord, acampo, btnIni, btnAnt, btnProx, btnUlt, sqlNew, dmEmp.sqltbpecas, tpc_codigo,'' );
  acampo := 0;
  RefreshDialog2(cPre,acampo, frmtbpecas, sqlNew, aEdits);
  acampo := 1;
end;

procedure Tfrmtbpecas.RefreshDados(tipo: String);
var
  i: integer;
  cWhere, cQuery, cOrder: String;

begin
  RefreshDados2(acampo, tipo, '', tpc_codigo, sqlNew, dmEmp.sqltbpecas );
end;

procedure Tfrmtbpecas.RefreshDialog;
var
  i, tmp: Integer;
  frmx : TForm ;
begin
  RefreshDialog2(cPre,acampo, frmtbpecas, sqlNew, aEdits);
end;


procedure Tfrmtbpecas.ToolButton9Click(Sender: TObject);
begin
  frmCalculadora := TfrmCalculadora.Create(Self);
  frmCalculadora.Show;

end;

procedure Tfrmtbpecas.ativaButoes(tipo:Integer);
begin
ativaButoes2(Tipo,  btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt, sqlNew);
end;

procedure Tfrmtbpecas.ativaget;
begin
  ativaget2(aEdits,cPre+'codigo',cTabela, btnGrava.Enabled, lMostra );
end;

procedure Tfrmtbpecas.btnAlterarExecute(Sender: TObject);
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
   tpc_nome.SetFocus;
   navegacao(0);
end;

procedure Tfrmtbpecas.btnAntExecute(Sender: TObject);
begin
  navegacao(2);
end;

procedure Tfrmtbpecas.btnCancelaExecute(Sender: TObject);
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
   tpc_codigo.SetFocus;

end;

procedure Tfrmtbpecas.btnExcluirExecute(Sender: TObject);
Var
aSubTab : TArrayDim2;
n: Integer;
begin
   //SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'acessoratv';     aSubTab[n][1] := '';
   If Exclui2(cTabela, aSubTab,  tpc_codigo, btnExcluir) Then Begin;
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

procedure Tfrmtbpecas.btnGravaExecute(Sender: TObject);
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
   tpc_codigo.SetFocus;
end;

procedure Tfrmtbpecas.btnIniExecute(Sender: TObject);
begin
  navegacao(1);
end;

procedure Tfrmtbpecas.btnNovoExecute(Sender: TObject);
begin
   acampo := 1;
   nNew   := acampo;
   btnGrava.Enabled := True;
   RefreshDados('S');
   limpaget;
   ativaButoes(1);
   lMostra := False;
   ativaget;
   tpc_cdbarra.SetFocus;
end;

procedure Tfrmtbpecas.btnProxExecute(Sender: TObject);
begin
  navegacao(3);
end;

procedure Tfrmtbpecas.btnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure Tfrmtbpecas.btnUltExecute(Sender: TObject);
begin
  navegacao(4);
end;

initialization
  RegisterClass(Tfrmtbpecas);


end.
