unit U_Incerrante;

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
  TfrmIncerrante = class(TForm)
    StatusBar1: TStatusBar;
    Banner: TPanel;
    imgLogo: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    ict_codigo: TButtonedEdit;
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
    ict_codbmb: TButtonedEdit;
    Label2: TLabel;
    Label3: TLabel;
    edNomBmb: TEdit;
    actionsub: TActionManager;
    CmbBtnInc: TAction;
    cmbBtnExc: TAction;
    ict_datent: TDateTimePicker;
    Label27: TLabel;
    ict_horent: TMaskEdit;
    Label21: TLabel;
    ict_nmrien: TMaskEdit;
    Label4: TLabel;
    ict_datsai: TDateTimePicker;
    Label5: TLabel;
    ict_nmrisa: TMaskEdit;
    Label6: TLabel;
    ict_horsai: TMaskEdit;
    Label7: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure RefreshDialog;
    Procedure RefreshDados(tipo: String);
    procedure ict_codigoExit(Sender: TObject);
    procedure ict_codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ict_codigoRightButtonClick(Sender: TObject);
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
    procedure ict_codbmbRightButtonClick(Sender: TObject);
    procedure ict_codbmbKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ict_codbmbExit(Sender: TObject);
    Procedure ChkBomba;
    procedure ict_nmrisaExit(Sender: TObject);
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
  frmIncerrante: TfrmIncerrante;
  modConsulta, nOrdem : integer;


implementation

uses  UCalculadora,  u_DmEmp, uSistema, U_funcao, U_CnpjClass;

{$R *.dfm}

procedure TfrmIncerrante.ict_codbmbExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  DmEmp.sqlBomba ;
  edNomBmb.Text :=  Pesquisa.Relacao('Bomba',ict_codbmb,'bmb_codigo','bmb_nome');
  ChkBomba;


end;

procedure TfrmIncerrante.ict_codbmbKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      ict_codbmbRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmIncerrante.ict_codbmbRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  DmEmp.dsBomba ;
  Pesquisa.sqlTabela :=  DmEmp.sqlBomba ;
  Pesquisa.cliTabela :=  DmEmp.cliBomba ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Bombas de Abastecimento';
  Pesquisa.nmTabela  := 'bomba' ;
  Pesquisa.NovoCad   := 'bomba' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('bmb_codigo','Código'        ,'ict_codbmb' ,5  ,'por Código' );
  Pesquisa.AddReg('bmb_nome'  ,'Bomba'         ,'edNomBmb'   ,25 ,'por Bomba' );


  Pesquisa.acessa(ict_codbmb);
  ict_codbmb.text   :=  Pesquisa.RecReg('bmb_codigo');
  edNomBmb.text     :=  Pesquisa.RecReg('bmb_nome');
  Pesquisa.Destroy;

 end;

procedure TfrmIncerrante.ict_codigoExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados

  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlIncerrante ;
 //ict_nome.Text :=  Pesquisa.Relacao('Incerrante',ict_codigo,'ict_codigo','ict_nome');
   navegacao(5);

end;

procedure TfrmIncerrante.ict_codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END    : ict_codigoRightButtonClick(Self);
    VK_UP     : navegacao(1);
    VK_LEFT   : navegacao(2);
    VK_RIGHT  : navegacao(3);
    VK_DOWN   : navegacao(4);

  end;
Finally

End;

end;

procedure TfrmIncerrante.ict_codigoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
if btnGrava.Enabled then
   Exit;

  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsIncerrante ;
  Pesquisa.sqlTabela :=  dmEmp.sqlIncerrante ;
  Pesquisa.cliTabela :=  dmEmp.cliIncerrante ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Incerrante';
  Pesquisa.nmTabela  := 'Incerrante';
//  Pesquisa.NovoCad   := 'Incerrante' ;
  // Display        campo   cabecalho                     get         tan  indices
  Pesquisa.AddReg('ict_codigo'  ,'Código'                 ,'ict_codigo' ,5 ,'por Código'              );
  Pesquisa.AddReg('ict_datent'  ,'Dt Abertura'            ,'ict_datent',10 ,'por Dt de Abertura'      );
  Pesquisa.AddReg('ict_nmrien'  ,'Inc. Abertura'          ,'ict_datent',10 ,'por Incerrante Inicial'  );
  Pesquisa.AddReg('ict_datsai'  ,'Dt Abertura'            ,'ict_datent',10 ,'por Dt de Fechamento'    );
  Pesquisa.AddReg('ict_nmrisa'  ,'Inc. Fechamento'        ,'ict_datent',10 ,'por Incerrante Inicial'  );
  Pesquisa.AddReg('bmb_nome'    ,'Bomba'                  ,'bmb_nome',  25 ,'por Bomba'               );

  Pesquisa.acessa(ict_codigo);
  ict_codigo.text   :=  Pesquisa.RecReg('ict_codigo');
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


procedure TfrmIncerrante.ict_nmrisaExit(Sender: TObject);
begin
  if StrToInt( ict_nmrisa.Text ) < StrToInt( ict_nmrien.Text ) then Begin
     Showmessage('Erro de Incerrante: Inc Final maior que o inicial');
     ict_nmrisa.SetFocus;
  End;

end;

procedure TfrmIncerrante.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sqlNew.Close;
    dmEmp.cliIncerrante.Close;
    frmIncerrante                 := nil ;
    action                       := cafree;
    fPrincipal.btnIncerrante.Enabled := True;
end;



procedure TfrmIncerrante.FormCreate(Sender: TObject);
Var
i: Integer;
begin
  cPre                        := 'ict_';
  cTabela                     := 'Incerrante';
  acampo                      := 1;
  sqlNew                      := TFDQuery.Create(nil);
  sqlNew.Connection           := dmemp.SqlConSis;
  fPrincipal.btnIncerrante.Enabled  := False;
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;
end;

procedure TfrmIncerrante.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmIncerrante.FormShow(Sender: TObject);
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
  lbCabeca01.Caption    := 'Cadstro de Incerrantes';
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

procedure TfrmIncerrante.gravadados;
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, ctip_horalt,cCodSql, cIteSql,cValSql,cCodMnt : string ;
dData, dtip_datalt : TDate ;
i, tmp: Integer;
SQLQ : TFDQuery ;

begin
   gravadados2(cTabela,cPre,cPre+'codigo','X','', nNew, frmIncerrante, dmEmp.SqlConSis, aEdits );
end;

procedure TfrmIncerrante.limpaget;
Var
i: Integer;
begin
  limpaget2(aEdits);
end;

procedure TfrmIncerrante.navegacao(Ord: Integer);
begin
  if btnGrava.Enabled then
     Exit;

  navegacao2( Ord, acampo, btnIni, btnAnt, btnProx, btnUlt, sqlNew, dmEmp.sqlIncerrante, ict_codigo,'' );
  acampo := 0;
  RefreshDialog2(cPre,acampo, frmIncerrante, sqlNew, aEdits);
  acampo := 1;
end;

procedure TfrmIncerrante.RefreshDados(tipo: String);
var
  i: integer;
  cWhere, cQuery, cOrder: String;

begin
  RefreshDados2(acampo, tipo, '', ict_codigo, sqlNew, dmEmp.sqlIncerrante );
end;

procedure TfrmIncerrante.RefreshDialog;
var
  i, tmp: Integer;
  frmx : TForm ;
begin
  RefreshDialog2(cPre,acampo, frmIncerrante, sqlNew, aEdits);
end;


procedure TfrmIncerrante.ToolButton9Click(Sender: TObject);
begin
  frmCalculadora := TfrmCalculadora.Create(Self);
  frmCalculadora.Show;

end;

procedure TfrmIncerrante.ativaButoes(tipo:Integer);
begin
ativaButoes2(Tipo,  btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt, sqlNew);
end;

procedure TfrmIncerrante.ativaget;
begin
  ativaget2(aEdits,cPre+'codigo',cTabela, btnGrava.Enabled, lMostra );
end;

procedure TfrmIncerrante.btnAlterarExecute(Sender: TObject);
begin
   btnNovo.Enabled    := False;
   btnAlterar.Enabled := False;
   btnGrava.Enabled   := True;
   ict_datsai.Format  := '';
   ativaButoes(1);
   lMostra := True;
   ativaget;
   acampo := 0;
   nNew   := acampo;
   RefreshDialog;
   ict_codbmb.SetFocus;
   navegacao(0);
   ict_codbmb.Enabled := False;
   ict_datent.Enabled := False;
   ict_nmrien.Enabled := False;
   ict_horent.Enabled := False;
   if Not sqlNew.FieldByName('ict_datsai').IsNull  then begin
     ict_datsai.Enabled := False;
     ict_nmrisa.Enabled := False;
     ict_horsai.Enabled := False;
   end;


end;

procedure TfrmIncerrante.btnAntExecute(Sender: TObject);
begin
  navegacao(2);
end;

procedure TfrmIncerrante.btnCancelaExecute(Sender: TObject);
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

   ict_codigo.SetFocus;

end;

procedure TfrmIncerrante.btnExcluirExecute(Sender: TObject);
Var
aSubTab : TArrayDim2;
n: Integer;
begin
   //SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'acessoratv';     aSubTab[n][1] := '';
   If Exclui2(cTabela, aSubTab,  ict_codigo, btnExcluir) Then Begin;
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

procedure TfrmIncerrante.btnGravaExecute(Sender: TObject);
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
   ict_codigo.SetFocus;
end;

procedure TfrmIncerrante.btnIniExecute(Sender: TObject);
begin
  navegacao(1);
end;

procedure TfrmIncerrante.btnNovoExecute(Sender: TObject);
begin
   acampo := 1;
   nNew   := acampo;
   btnGrava.Enabled := True;
   ict_datsai.Format  := '';
   RefreshDados('S');
   limpaget;
   ativaButoes(1);
   lMostra := False;
   ativaget;
   ict_codbmb.SetFocus;
end;

procedure TfrmIncerrante.btnProxExecute(Sender: TObject);
begin
  navegacao(3);
end;

procedure TfrmIncerrante.btnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmIncerrante.btnUltExecute(Sender: TObject);
begin
  navegacao(4);
end;

procedure TfrmIncerrante.ChkBomba;
var
emptyDatePicker:Boolean;
cSql : String;
zQuery : TFDQuery;
begin
  if ( ict_codbmb.Text <> '' ) and ( nNew > 0 ) and btnGrava.Enabled then Begin

    zQuery := TFDQuery.Create(Nil);
    zQuery.Connection := dmEmp.SqlConSis;
    zQuery.Close;
    zQuery.SQL.Text := 'Select * From '+SelSchema(cTabela)+' where ict_codbmb = '+ict_codbmb.Text+' and ict_datsai is null';
    zQuery.Open;
    if zQuery.IsEmpty then Begin
       zQuery.Close;
       zQuery.SQL.Text := 'Select * From '+SelSchema('bomba')+' where bmb_codigo = '+ict_codbmb.Text;
       zQuery.Open;

       ict_nmrien.Text    := zQuery.FieldByName('bmb_nmrinc').Text;
       ict_nmrisa.Text    := zQuery.FieldByName('bmb_nmrinc').Text;
       ict_datent.Enabled := True;
       ict_nmrien.Enabled := false;
       ict_horent.Enabled := True;

       ict_datsai.Format  := '  /  /    ';
       ict_datsai.Enabled := False;
       ict_nmrisa.Enabled := False;
       ict_horsai.Enabled := False;
       ict_horent.SetFocus;

    End Else Begin
      if MESSAGEBOX(Application.Handle, 'Indecerrante Aberto, Deseja fechar?', 'Confirma...', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin
         ict_codigo.Text := zQuery.FieldByName('ict_codigo').Value;
         btnAlterarExecute(nil);
         ict_datent.Date    := zQuery.FieldByName('ict_datent').AsDateTime;
         ict_nmrien.Text    := zQuery.FieldByName('ict_nmrien').Value;
         ict_horent.Text    := zQuery.FieldByName('ict_horent').Value;

         zQuery.Close;
         zQuery.SQL.Text := 'Select * From '+SelSchema('bomba')+' where bmb_codigo = '+ict_codbmb.Text;
         zQuery.Open;


         ict_datent.Enabled := False;
         ict_nmrien.Enabled := False;
         ict_horent.Enabled := False;

         ict_nmrisa.Text    := zQuery.FieldByName('bmb_nmrinc').Text;

         ict_datsai.Enabled := True;
         ict_nmrisa.Enabled := False;
         ict_horsai.Enabled := True;
         ict_datsai.SetFocus;

      end Else Begin
        btnCancelaExecute(Nil);
      End;
    End;
  End Else Begin
        {
       ict_datent.Enabled := False;
       ict_nmrien.Enabled := False;
       ict_horent.Enabled := False;

       ict_datsai.Enabled := False;
       ict_nmrisa.Enabled := False;
       ict_horsai.Enabled := False;
         }
  End;


end;

initialization
  RegisterClass(TfrmIncerrante);


end.
