unit U_PontoAbtInc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, ImgList, ExtCtrls, ComCtrls, xmldom,
  XMLIntf, IdHTTP, msxmldom, XMLDoc, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, ExtDlgs, RibbonLunaStyleActnCtrls,
  ToolWin, ActnMan, ActnCtrls, jpeg, edittuning, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, U_ClasseUtil,U_Classcons, ZDataset, ZDatasetUtils,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, U_ClassCad, System.ImageList, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;


type
  TfrmPontoAbt = class(TForm)
    StatusBar1: TStatusBar;
    Banner: TPanel;
    imgLogo: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    pab_codigo: TButtonedEdit;
    Label4: TLabel;
    pab_nome: TEdit;
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
    pab_codfnd: TButtonedEdit;
    Label2: TLabel;
    Label3: TLabel;
    edNomFnd: TEdit;
    pab_nrcont: TEdit;
    Label9: TLabel;
    pab_ativo: TComboBox;
    Label15: TLabel;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    edCodCmb: TButtonedEdit;
    edNomCmb: TEdit;
    edEstMin: TMaskEdit;
    Label26: TLabel;
    SpeedButton14: TSpeedButton;
    SpeedButton13: TSpeedButton;
    actionsub: TActionManager;
    CmbBtnInc: TAction;
    cmbBtnExc: TAction;
    dbgCombustivel: TDBGrid;
    edNmrCnpj: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edDatIni: TDateTimePicker;
    Label27: TLabel;
    edDatFin: TDateTimePicker;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edNumEmp: TMaskEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure RefreshDialog;
    Procedure RefreshDados(tipo: String);
    procedure pab_codigoExit(Sender: TObject);
    procedure pab_codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pab_codigoRightButtonClick(Sender: TObject);
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
    procedure pab_codfndRightButtonClick(Sender: TObject);
    procedure pab_codfndKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pab_codfndExit(Sender: TObject);
    procedure pab_proprioChange(Sender: TObject);
    procedure edCodCmbRightButtonClick(Sender: TObject);
    procedure edCodCmbKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCodCmbExit(Sender: TObject);
    procedure CmbBtnIncExecute(Sender: TObject);
    procedure RefreshGrid;
    procedure cmbBtnExcExecute(Sender: TObject);
    procedure edEstMinKeyPress(Sender: TObject; var Key: Char);
    Procedure HabButCmb;
    procedure edDatFinExit(Sender: TObject);
    procedure dbgCombustivelDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

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
  frmPontoAbt: TfrmPontoAbt;
  modConsulta, nOrdem : integer;


implementation

uses  UCalculadora,  u_DmEmp, uSistema, U_funcao, U_CnpjClass;

{$R *.dfm}

procedure TfrmPontoAbt.pab_codfndExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlfornecedor ;
  edNomFnd.Text      :=  Pesquisa.Relacao('fornecedor',pab_codfnd,'fnd_codigo','fnd_nome');
  edNmrCnpj.Text     :=  Pesquisa.Relacao('fornecedor',pab_codfnd,'fnd_codigo','fnd_cpfcnpj');



end;

procedure TfrmPontoAbt.pab_codfndKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      pab_codfndRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmPontoAbt.pab_codfndRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsfornecedor ;
  Pesquisa.sqlTabela :=  dmEmp.sqlFornecedor ;
  Pesquisa.cliTabela :=  dmEmp.clifornecedor ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de fornecedores';
  Pesquisa.nmTabela  := 'fornecedor' ;
  Pesquisa.NovoCad   := 'fornecedor' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('fnd_codigo','Código'             ,'pab_codfnd' ,5  ,'por Código' );
  Pesquisa.AddReg('fnd_nome'  ,'fornecedor'         ,'edNomFnd'   ,25 ,'por fornecedor' );


  Pesquisa.acessa(pab_codfnd);
  pab_codfnd.text   :=  Pesquisa.RecReg('fnd_codigo');
  edNomFnd.text     :=  Pesquisa.RecReg('fnd_nome');
  Pesquisa.Destroy;

 end;

procedure TfrmPontoAbt.pab_codigoExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlPontoAbt ;
  pab_nome.Text :=  Pesquisa.Relacao('PontoAbt',pab_codigo,'pab_codigo','pab_nome');
  navegacao(5);

end;

procedure TfrmPontoAbt.pab_codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END    : pab_codigoRightButtonClick(Self);
    VK_UP     : navegacao(1);
    VK_LEFT   : navegacao(2);
    VK_RIGHT  : navegacao(3);
    VK_DOWN   : navegacao(4);

  end;
Finally

End;

end;

procedure TfrmPontoAbt.pab_codigoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
if btnGrava.Enabled then
   Exit;

  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsPontoAbt ;
  Pesquisa.sqlTabela :=  dmEmp.sqlPontoAbt ;
  Pesquisa.cliTabela :=  dmEmp.cliPontoAbt ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Pontos de Abastecimento';
  Pesquisa.nmTabela  := 'PontoAbt';
//  Pesquisa.NovoCad   := 'PontoAbt' ;
  // Display        campo   cabecalho                     get         tan  indices
  Pesquisa.AddReg('pab_codigo'  ,'Código'                 ,'pab_codigo' ,5  ,'por Código'    );
  Pesquisa.AddReg('pab_nome'    ,'Ponto de Abastecimenhto','pab_nome'   ,35 ,'por Ponto'    );


  Pesquisa.acessa(pab_codigo);
  pab_codigo.text   :=  Pesquisa.RecReg('pab_codigo');
  pab_nome.text     :=  Pesquisa.RecReg('pab_nome');
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

procedure TfrmPontoAbt.pab_proprioChange(Sender: TObject);
begin
{}
end;

procedure TfrmPontoAbt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sqlNew.Close;
    dmEmp.cliPontoAbt.Close;
    frmPontoAbt               := nil ;
    action                       := cafree;
    fPrincipal.btnPontoAbt.Enabled := True;
end;



procedure TfrmPontoAbt.FormCreate(Sender: TObject);
Var
i: Integer;
begin
  cPre                        := 'pab_';
  cTabela                     := 'pontoabt';
  acampo                      := 1;
  sqlNew                      := TFDQuery.Create(nil);
  sqlNew.Connection           := dmEmp.SqlConSis;
  fPrincipal.btnpontoabt.Enabled  := False;
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;
end;

procedure TfrmPontoAbt.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmPontoAbt.FormShow(Sender: TObject);
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
  lbCabeca01.Caption    := 'Cadstro de Pontos de Abastecimento';
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
  edDatIni.Date      := Now;
  edDatFin.Date      := Now;

end;

procedure TfrmPontoAbt.gravadados;
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, ctip_horalt,cCodSql, cIteSql,cValSql,cCodMnt : string ;
dData, dtip_datalt : TDate ;
i, tmp: Integer;
SQLQ : TFDQuery ;
begin
   gravadados2(cTabela,cPre,cPre+'codigo','X','', nNew, frmPontoAbt, dmEmp.SqlConSis, aEdits );
end;


procedure TfrmPontoAbt.HabButCmb;
begin
  CmbBtnInc.Enabled :=  btnGrava.Enabled;
  CmbBtnExc.Enabled := (btnGrava.Enabled and ( Not dmEmp.sqlPontoAbti.IsEmpty) )
end;

procedure TfrmPontoAbt.limpaget;
Var
i: Integer;
begin
  limpaget2(aEdits);
end;

procedure TfrmPontoAbt.navegacao(Ord: Integer);
begin
  if btnGrava.Enabled then
     Exit;

  navegacao2( Ord, acampo, btnIni, btnAnt, btnProx, btnUlt, sqlNew, dmEmp.sqlPontoAbt, pab_codigo,'' );
  acampo := 0;
  RefreshDialog2(cPre,acampo, frmPontoAbt, sqlNew, aEdits);
  acampo := 1;
  HabButCmb ;
  RefreshGrid ;
end;

procedure TfrmPontoAbt.RefreshDados(tipo: String);
var
  i: integer;
  cWhere, cQuery, cOrder: String;

begin
  RefreshDados2(acampo, tipo, '', pab_codigo, sqlNew, dmEmp.SqlPontoAbt );
end;

procedure TfrmPontoAbt.RefreshDialog;
var
  i, tmp: Integer;
  frmx : TForm ;
begin
  RefreshDialog2(cPre,acampo, frmPontoAbt, sqlNew, aEdits);
end;

procedure TfrmPontoAbt.ToolButton9Click(Sender: TObject);
begin
  frmCalculadora := TfrmCalculadora.Create(Self);
  frmCalculadora.Show;

end;

procedure TfrmPontoAbt.ativaButoes(tipo:Integer);
begin
ativaButoes2(Tipo,  btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt, sqlNew);
end;

procedure TfrmPontoAbt.ativaget;
begin
  ativaget2(aEdits,cPre+'codigo',cTabela, btnGrava.Enabled, lMostra );
end;

procedure TfrmPontoAbt.btnAlterarExecute(Sender: TObject);
begin
   btnNovo.Enabled    := False;
   btnAlterar.Enabled := False;
   btnGrava.Enabled   := True;
   ativaButoes(1);
   lMostra := True;
   ativaget;
   RefreshDialog;
   pab_ativo.SetFocus;
   acampo := 0;
   nNew   := acampo;
   navegacao(0);
   RefreshGrid ;
   HabButCmb;

end;

procedure TfrmPontoAbt.btnAntExecute(Sender: TObject);
begin
  navegacao(2);
end;

procedure TfrmPontoAbt.btnCancelaExecute(Sender: TObject);
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

   pab_codigo.SetFocus;

end;

procedure TfrmPontoAbt.btnExcluirExecute(Sender: TObject);
Var
aSubTab : TArrayDim2;
n: Integer;
begin
   //SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'acessoratv';     aSubTab[n][1] := '';
   If Exclui2(cTabela, aSubTab,  pab_codigo, btnExcluir) Then Begin;
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

procedure TfrmPontoAbt.btnGravaExecute(Sender: TObject);
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
   pab_codigo.SetFocus;
end;

procedure TfrmPontoAbt.btnIniExecute(Sender: TObject);
begin
  navegacao(1);
end;

procedure TfrmPontoAbt.btnNovoExecute(Sender: TObject);
begin
   acampo := 1;
   nNew   := acampo;
   btnGrava.Enabled := True;
   RefreshDados('S');
   limpaget;
   ativaButoes(1);
   lMostra := False;
   ativaget;
   pab_ativo.SetFocus;
   navegacao(5);
   RefreshGrid ;
   HabButCmb;
end;

procedure TfrmPontoAbt.btnProxExecute(Sender: TObject);
begin
  navegacao(3);
end;

procedure TfrmPontoAbt.btnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmPontoAbt.btnUltExecute(Sender: TObject);
begin
  navegacao(4);
end;


procedure TfrmPontoAbt.cmbBtnExcExecute(Sender: TObject);
begin
     if MESSAGEBOX(Application.Handle, 'Deseja Excluir?', 'Confirma...', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin
          dmEmp.sqlpontoabti.Close;
          dmEmp.sqlpontoabti.SQl.Text  :='DELETE FROM '+U_funcao.SelSchema('pontoabti')+' WHERE iab_codpab = '+QuotedStr(pab_codigo.Text)+'  and iab_codigo = '+dbgCombustivel.DataSource.DataSet.FieldByName('iab_codigo').Text;
          dmEmp.sqlpontoabti.ExecSQL;
          Auditor(Screen.activeform.Caption,'Deletou','Cód Combustivel: '+pab_codigo.Text+'/'+dbgCombustivel.DataSource.DataSet.FieldByName('iab_codigo').Text );
        end;
      RefreshGrid

end;

procedure TfrmPontoAbt.CmbBtnIncExecute(Sender: TObject);
begin
{ Rotina para guardar as informações}
 nNew := GravarSub(cTabela,cPre,cPre+'codigo','X','', nNew, aCampo, frmPontoAbt, dmEmp.SqlConSis, aEdits, sqlNew, dmEmp.sqlPontoAbt, pab_codigo );
 if nNew > 0 then begin
     Exit;
 End;

 dmEmp.clipontoabti.Close;
 with dmemp.sqlcmbatv do
   begin
     Close;
     SQL.Text :='insert into '+U_funcao.SelSchema('pontoabti')+' ( iab_codpab,   iab_codcmb,  iab_contrato,  iab_DatIni,  iab_DatFin,  iab_ltsvlr,  iab_qltmin,   iab_qltest, iab_usuinc,  iab_datinc,  iab_horinc )'+
                                                        'values ( :iab_codpab,  :iab_codcmb, :edNumEmp, :edDatIni, :edDatFin, :iab_ltsvlr, :iab_qltmin,  :iab_qltest, :iab_usuinc, :iab_datinc, :iab_horinc )';
     ParamByName('iab_codpab').Text     := pab_codigo.Text ;
     ParamByName('iab_codcmb').Text     := edCodcmb.Text  ;
     ParamByName('iab_ltsvlr').AsFloat  := 0.000 ;
     ParamByName('edNumEmp').Text       := edNumEmp.Text  ;
     ParamByName('edDatIni').AsDate     := edDatIni.date ;
     ParamByName('edDatFin').AsDate     := edDatFin.date; ;
     ParamByName('iab_qltmin').AsFloat  := FormataNum( edEstMin.Text ) ;
     ParamByName('iab_qltest').AsFloat  := 0.000 ;
     ParamByName('iab_usuinc').Text     := sysUsuario ;
     ParamByName('iab_datinc').AsDate   := now ;
     ParamByName('iab_horinc').Text     := TimeToStr(time) ;
     ExecSQL;
 end;
 RefreshGrid ;
 edCodCmb.Clear;
 edNomCmb.Clear;
 edEstMin.Clear;
 edNumEmp.Clear;
 edDatIni.Date := Now;
 edDatFin.Date := Now;



end;

procedure TfrmPontoAbt.dbgCombustivelDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    if gdFocused in State then  begin
      dbgCombustivel.Canvas.Brush.Color  := Azul_Escuro;
      dbgCombustivel.Canvas.Font.Color   := Branco;
      dbgCombustivel.Canvas.FillRect(Rect);
      dbgCombustivel.DefaultDrawDataCell(Rect, Column.Field, State);
    end else begin

        if Odd(dbgCombustivel.DataSource.DataSet.RecNo) then begin
          dbgCombustivel.Canvas.Brush.Color  := Branco;
          dbgCombustivel.Canvas.Font.Color   := Preto;
          dbgCombustivel.Canvas.FillRect(Rect);
          dbgCombustivel.DefaultDrawDataCell(Rect, Column.Field, State);

        End else Begin
          dbgCombustivel.Canvas.Brush.Color  := Cinza_Sintilante;
          dbgCombustivel.Canvas.Font.Color   := Preto;
          dbgCombustivel.Canvas.FillRect(Rect);
          dbgCombustivel.DefaultDrawDataCell(Rect, Column.Field, State);
        End;

    end;
end;

procedure TfrmPontoAbt.RefreshGrid;
begin
 dmEmp.sqlpontoabti.Close;
 dmEmp.clipontoabti.Close;
 with dmEmp.sqlpontoabti do
   begin

    SQL.Text := 'Select * FROM '+U_funcao.SelSchema('pontoabti')+
                ' LEFT JOIN  '+U_funcao.SelSchema('pontoabt')+' on pab_codigo =iab_codpab '+
                ' LEFT JOIN  '+U_funcao.SelSchema('combustivel')+' on cmb_codigo =iab_codcmb' +
                ' where iab_codpab = '+U_funcao.fIIf( Length( trim(pab_codigo.Text)) > 0, pab_codigo.Text,'0' ) ;
     Open;
 end;
 dmEmp.clipontoabti.Active := True;
 HabButCmb

end;



procedure TfrmPontoAbt.edCodCmbExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlComb ;
  edNomCmb.Text :=  Pesquisa.Relacao('combustivel',edCodCmb,'cmb_codigo','cmb_nome');

end;

procedure TfrmPontoAbt.edCodCmbKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      edCodCmbRightButtonClick(Self);
  end;
Finally

End;


end;

procedure TfrmPontoAbt.edCodCmbRightButtonClick(Sender: TObject);
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
  Pesquisa.nmTitulo  := 'Tabela de Combustíveis';
  Pesquisa.nmTabela  := 'combustivel' ;
  Pesquisa.NovoCad   := 'combustivel' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('cmb_codigo','Código'             ,'edCodCmb' ,5  ,'por Código' );
  Pesquisa.AddReg('cmb_nome'  ,'Combustivel'        ,'edNomCmb' ,25 ,'por Combustivel' );


  Pesquisa.acessa(edCodCmb);
  edCodCmb.text   :=  Pesquisa.RecReg('cmb_codigo');
  edNomCmb.text   :=  Pesquisa.RecReg('cmb_nome');
  Pesquisa.Destroy;

  end;

procedure TfrmPontoAbt.edDatFinExit(Sender: TObject);
begin
if edDatIni.Date > edDatFin.Date then begin

end;

end;

procedure TfrmPontoAbt.edEstMinKeyPress(Sender: TObject; var Key: Char);
begin
  ChkLitros( Sender, Key )
end;

initialization
  RegisterClass(TfrmPontoAbt);


end.
