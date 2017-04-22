unit U_Munuitem;

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
  TfrmManutitem = class(TForm)
    StatusBar1: TStatusBar;
    Banner: TPanel;
    imgLogo: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    mit_codigo: TButtonedEdit;
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
    mit_codsgm: TButtonedEdit;
    Label2: TLabel;
    Label3: TLabel;
    edNomSgm: TEdit;
    actionsub: TActionManager;
    CmbBtnInc: TAction;
    cmbBtnExc: TAction;
    mit_nome: TEdit;
    Label4: TLabel;
    mit_kmmanu: TMaskEdit;
    Label26: TLabel;
    Label5: TLabel;
    mit_period: TMaskEdit;
    DBGrid2: TDBGrid;
    edCodSer: TButtonedEdit;
    edNomSer: TEdit;
    btnIncFat: TButton;
    btnExcFat: TButton;
    Label6: TLabel;
    Label7: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure RefreshDialog;
    Procedure RefreshDados(tipo: String);
    procedure mit_codigoExit(Sender: TObject);
    procedure mit_codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mit_codigoRightButtonClick(Sender: TObject);
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
    procedure mit_codsgmRightButtonClick(Sender: TObject);
    procedure mit_codsgmKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mit_codsgmExit(Sender: TObject);
    procedure mit_kmmanuKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edCodSerRightButtonClick(Sender: TObject);
    procedure edCodSerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCodSerExit(Sender: TObject);
    procedure btnIncFatClick(Sender: TObject);
  private
    { Private declarations }
    wEmpresa, wUsuInc, wHorInc, wUsuAlt, wHorAlt : string ;
    wDatInc, wDatAlt : Tdate;
    nNew, nRecno:  Integer;
    procedure RefreshGrid;
    procedure btninc;
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
  frmManutitem: TfrmManutitem;
  modConsulta, nOrdem : integer;


implementation

uses  UCalculadora,  u_DmEmp, uSistema, U_funcao, U_CnpjClass;

{$R *.dfm}

procedure TfrmManutitem.mit_codsgmExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlsubgrpmnt ;
  edNomSgm.Text   :=  Pesquisa.Relacao('subgrpmnt',mit_codsgm,'sgm_codigo','sgm_nome');

end;

procedure TfrmManutitem.mit_codsgmKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      mit_codsgmRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmManutitem.mit_codsgmRightButtonClick(Sender: TObject);
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
  Pesquisa.nmTitulo  := 'Cadastro de SubGrupo de Veículos';
  Pesquisa.nmTabela  := 'subgrpmnt' ;
  Pesquisa.NovoCad   := 'subgrpmnt' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('sgm_codigo'  ,'Código'                  ,'sgm_codigo' ,5  ,'por Código'       );
  Pesquisa.AddReg('sgm_nome'    ,'Nome'                    ,'sgm_nome'   ,30 ,'por Nome'         );
  Pesquisa.AddReg('grm_nome'    ,'Grupo'                   ,'grm_nome'   ,30 ,'por Nome'         );

  Pesquisa.acessa(mit_codsgm);
  mit_codsgm.text   :=  Pesquisa.RecReg('sgm_codigo');
  edNomSgm.text     :=  Pesquisa.RecReg('sgm_nome');

  Pesquisa.Destroy;

 end;

procedure TfrmManutitem.mit_kmmanuKeyPress(Sender: TObject; var Key: Char);
begin
  KeyKm( Sender, Key );
end;

procedure TfrmManutitem.mit_codigoExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados

  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlmanuitem ;
  mit_nome.Text :=  Pesquisa.Relacao('manutitem',mit_codigo,'mit_codigo','mit_nome');
  navegacao(5);

end;

procedure TfrmManutitem.mit_codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END    : mit_codigoRightButtonClick(Self);
    VK_UP     : navegacao(1);
    VK_LEFT   : navegacao(2);
    VK_RIGHT  : navegacao(3);
    VK_DOWN   : navegacao(4);

  end;
Finally

End;

end;

procedure TfrmManutitem.mit_codigoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
if btnGrava.Enabled then
   Exit;

  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsmanuitem ;
  Pesquisa.sqlTabela :=  dmEmp.Sqlmanuitem ;
  Pesquisa.cliTabela :=  dmEmp.climanuitem ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Itens de Manutenção';
  Pesquisa.nmTabela  := 'manuitem';
//  Pesquisa.NovoCad   := 'manuitem' ;
  // Display        campo   cabecalho                     get         tan  indices
  Pesquisa.AddReg('mit_codigo'  ,'Código'                 ,'mit_codigo' ,5  ,'por Código'       );
  Pesquisa.AddReg('mit_nome'    ,'nome'                   ,'mit_nome'   ,30 ,'por Nome'         );
  Pesquisa.AddReg('sgm_nome'    ,'SubGrupo'               ,'sgm_nome'   ,15 ,'por SubGrupo'     );
  Pesquisa.AddReg('grm_nome'    ,'Grupo'                  ,'grm_nome'   ,15 ,'por Grupo'        );
  Pesquisa.AddReg('mit_kmmanu'  ,'Km Verif'               ,'mit_kmmanu' ,10 ,''                 );
  Pesquisa.AddReg('mit_period'  ,'Tempo'                  ,'mit_period' ,10 ,''                 );



  Pesquisa.acessa(mit_codigo);
  mit_codigo.text   :=  Pesquisa.RecReg('mit_codigo');
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


procedure TfrmManutitem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sqlNew.Close;
    dmEmp.climanuitem.Close;
    frmmanutitem                 := nil ;
    action                       := cafree;
    fPrincipal.btnmanutitem.Enabled := True;
end;



procedure TfrmManutitem.FormCreate(Sender: TObject);
Var
i: Integer;
begin
  cPre                        := 'mit_';
  cTabela                     := 'manutitem';
  acampo                      := 1;
  sqlNew                      := TFDQuery.Create(nil);
  sqlNew.Connection           := dmEmp.SqlConSis;
  fPrincipal.btnmanutitem.Enabled  := False;
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;
end;

procedure TfrmManutitem.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmManutitem.FormShow(Sender: TObject);
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
  lbCabeca01.Caption    := 'Cadstro de Itens de Manutenção';
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
  RefreshGrid ;

end;

procedure TfrmManutitem.gravadados;
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, ctip_horalt,cCodSql, cIteSql,cValSql,cCodMnt : string ;
dData, dtip_datalt : TDate ;
i, tmp: Integer;
SQLQ : TFDQuery ;

begin
   gravadados2(cTabela,cPre,cPre+'codigo','X','', nNew, frmmanutitem, dmEmp.SqlConSis, aEdits );
end;

procedure TfrmManutitem.limpaget;
Var
i: Integer;
begin
  limpaget2(aEdits);
end;

procedure TfrmManutitem.navegacao(Ord: Integer);
begin
  if btnGrava.Enabled then
     Exit;

  navegacao2( Ord, acampo, btnIni, btnAnt, btnProx, btnUlt, sqlNew, dmEmp.sqlmanuitem, mit_codigo,'' );
  acampo := 0;
  RefreshDialog2(cPre,acampo, frmmanutitem, sqlNew, aEdits);
  acampo := 1;
end;

procedure TfrmManutitem.RefreshDados(tipo: String);
var
  i: integer;
  cWhere, cQuery, cOrder: String;

begin
  RefreshDados2(acampo, tipo,'', mit_codigo, sqlNew, dmEmp.sqlmanuitem );
end;

procedure TfrmManutitem.RefreshDialog;
var
  i, tmp: Integer;
  frmx : TForm ;
begin
  RefreshDialog2(cPre,acampo, frmmanutitem, sqlNew, aEdits);
end;


procedure TfrmManutitem.ToolButton9Click(Sender: TObject);
begin
  frmCalculadora := TfrmCalculadora.Create(Self);
  frmCalculadora.Show;

end;

procedure TfrmManutitem.ativaButoes(tipo:Integer);
begin
ativaButoes2(Tipo,  btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt, sqlNew);
end;

procedure TfrmManutitem.ativaget;
begin
  ativaget2(aEdits,cPre+'codigo',cTabela, btnGrava.Enabled, lMostra );
end;

procedure TfrmManutitem.btnAlterarExecute(Sender: TObject);
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
   mit_nome.SetFocus;
   navegacao(0);
   RefreshGrid ;

end;

procedure TfrmManutitem.btnAntExecute(Sender: TObject);
begin
  navegacao(2);
end;

procedure TfrmManutitem.btnCancelaExecute(Sender: TObject);
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
   mit_codigo.SetFocus;

end;

procedure TfrmManutitem.btnExcluirExecute(Sender: TObject);
Var
aSubTab : TArrayDim2;
n: Integer;
begin
   //SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'acessoratv';     aSubTab[n][1] := '';
   If Exclui2(cTabela, aSubTab,  mit_codigo, btnExcluir) Then Begin;
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

procedure TfrmManutitem.btnGravaExecute(Sender: TObject);
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
   mit_codigo.SetFocus;
end;

procedure TfrmManutitem.btnIncFatClick(Sender: TObject);
Var
edCfo, edCst: String;
begin

 if nNew > 0 then begin
    nNew := GravarSub(cTabela,cPre,cPre+'codigo','X','', nNew, aCampo, frmManutitem, dmEmp.SqlConSis, aEdits, sqlNew, dmEmp.Sqlmanuitem, mit_codigo );
 End;

{ Rotina para guardar as informações}
 dmEmp.climanutitens.Close;
 dmEmp.Sqlmanutitens.Close;
 with dmEmp.Sqlmanutitens do
   begin
     Close;
     SQL.Text :='insert into '+U_funcao.SelSchema('manutitens')+' ( itm_codmit,  itm_codtsm,  itm_usuinc,  itm_datinc,  itm_horinc ) values     '+
                                                                ' (:itm_codmit, :itm_codtsm, :itm_usuinc, :itm_datinc, :itm_horinc )  ';
     ParamByName('itm_codmit').Text       := mit_codigo.Text ;
     ParamByName('itm_codtsm').Text       := edcodser.Text ;
     ParamByName('itm_usuinc').Text       := sysUsuario ;
     ParamByName('itm_datinc').AsDate     := now ;
     ParamByName('itm_horinc').Text       := TimeToStr(time) ;
     IniTransacao;
     ExecSQL;
 end;
 RefreshGrid ;
 edcodser.SetFocus;

end;
procedure TfrmManutitem.RefreshGrid;
Var
  qDel : TFDQuery;
  Encargos : Double;
begin

  dmEmp.climanutitens.Close;
  dmEmp.Sqlmanutitens.Close;
  with dmEmp.Sqlmanutitens do
    begin
      SQL.Text :=' Select * from '+U_funcao.SelSchema('manutitens')
                +' LEFT JOIN '+U_funcao.SelSchema('tbservico')+' on tsm_codigo = itm_codtsm '
                +' where itm_codmit = '+fIIf( Length( trim(mit_codigo.Text)) > 0, QuotedStr(mit_codigo.Text),'0' ) ;
      Open;
  end;
  dmEmp.climanutitens.Active := True;
  DBGrid2.Refresh;
  btninc;

end;

procedure TfrmManutitem.btninc;
begin
  btnIncFat.Enabled    := ( ( edcodser.Text <> '' )                 and ( btnGrava.Enabled ) )  ;
  btnExcFat.Enabled    := ( ( Not DBGrid2.DataSource.DataSet.Eof )  and ( btnGrava.Enabled ) )  ;
end;


procedure TfrmManutitem.btnIniExecute(Sender: TObject);
begin
  navegacao(1);
end;

procedure TfrmManutitem.btnNovoExecute(Sender: TObject);
begin
   acampo := 1;
   nNew   := acampo;
   btnGrava.Enabled := True;
   RefreshDados('S');
   limpaget;
   ativaButoes(1);
   lMostra := False;
   ativaget;
   mit_nome.SetFocus;
   RefreshGrid ;
end;

procedure TfrmManutitem.btnProxExecute(Sender: TObject);
begin
  navegacao(3);
end;

procedure TfrmManutitem.btnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmManutitem.btnUltExecute(Sender: TObject);
begin
  navegacao(4);
end;

procedure TfrmManutitem.edCodSerExit(Sender: TObject);
begin
  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqltbservico ;
  edNomSer.Text      :=  Pesquisa.Relacao('tbservico',edCodSer,'tsm_codigo','tsm_nome') ;
  btninc;

end;

procedure TfrmManutitem.edCodSerKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      edCodSerRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmManutitem.edCodSerRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dstbservico ;
  Pesquisa.sqlTabela :=  dmEmp.sqltbservico ;
  Pesquisa.cliTabela :=  dmEmp.clitbservico ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Serviços Automotivos';
  Pesquisa.nmTabela  := 'tbservico' ;
  Pesquisa.NovoCad   := 'tbservico' ;
  Pesquisa.QuerySql  := ' sgm_codigo = '+mit_codsgm.Text ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('tsm_codigo','Código'             ,'tsm_codigo' ,5  ,'por Código' );
  Pesquisa.AddReg('tsm_nome'  ,'Serviços'           ,'edNomFpg'   ,30 ,'por Serviços' );


  Pesquisa.acessa(edCodSer);
  edCodSer.text   :=  Pesquisa.RecReg('tsm_codigo');
  edNomSer.text   :=  Pesquisa.RecReg('tsm_nome');
  Pesquisa.Destroy;

end;

procedure TfrmManutitem.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    if gdFocused in State then  begin
      DbGrid2.Canvas.Brush.Color  := Azul_Escuro;
      DbGrid2.Canvas.Font.Color   := Branco;
      DbGrid2.Canvas.FillRect(Rect);
      DbGrid2.DefaultDrawDataCell(Rect, Column.Field, State);
    end else begin

        if Odd(DBGrid2.DataSource.DataSet.RecNo) then begin
          DbGrid2.Canvas.Brush.Color  := Branco;
          DbGrid2.Canvas.Font.Color   := Preto;
          DbGrid2.Canvas.FillRect(Rect);
          DbGrid2.DefaultDrawDataCell(Rect, Column.Field, State);

        End else Begin
          DbGrid2.Canvas.Brush.Color  := Cinza_Sintilante;
          DbGrid2.Canvas.Font.Color   := Preto;
          DbGrid2.Canvas.FillRect(Rect);
          DbGrid2.DefaultDrawDataCell(Rect, Column.Field, State);
        End;

    end;

end;

initialization
  RegisterClass(TfrmManutitem);


end.
