unit U_procveic;

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
  Tfrmprocveic = class(TForm)
    StatusBar1: TStatusBar;
    Banner: TPanel;
    imgLogo: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    prv_codigo: TButtonedEdit;
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
    prv_codplc: TButtonedEdit;
    Label15: TLabel;
    edNomMdl: TEdit;
    Label23: TLabel;
    prv_datems: TDateTimePicker;
    Label27: TLabel;
    prv_datpro: TDateTimePicker;
    Label9: TLabel;
    prv_destin: TComboBox;
    Label17: TLabel;
    prv_numpro: TMaskEdit;
    Label26: TLabel;
    Label2: TLabel;
    prv_origem: TMaskEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure RefreshDialog;
    Procedure RefreshDados(tipo: String);
    procedure prv_codigoExit(Sender: TObject);
    procedure prv_codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure prv_codigoRightButtonClick(Sender: TObject);
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
    procedure prv_codplcRightButtonClick(Sender: TObject);
    procedure prv_codplcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure prv_codplcExit(Sender: TObject);
    procedure prv_datproExit(Sender: TObject);
    procedure destino;
    procedure protoclo;

  private
    { Private declarations }
    wEmpresa, wUsuInc, wHorInc, wUsuAlt, wHorAlt : string ;
    wDatInc, wDatAlt : Tdate;
    nNew, nRecno:  Integer;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  public
    acampo: integer;
    aberto, lMostra: Boolean;
    Util: TClasseUtil;
    Pesquisa : TClasConsulta;
    sqlNew   : TFDQuery;
    aEdits   : TArrayComp;
    cPre, cTabela: String;

    { Public declarations }
  end;

var
  frmprocveic: Tfrmprocveic;
  modConsulta, nOrdem : integer;


implementation

uses  UCalculadora,  u_DmEmp, uSistema, U_funcao, U_CnpjClass,
  U_ClassconsContas, U_ClassConsMotorista, U_ClassAutoriza;

{$R *.dfm}

procedure Tfrmprocveic.protoclo;
Var
cSql : string;
qSql : TFDQuery;
begin
  { protocolo de pesquisa}
  qSql := TFDQuery.Create(Nil);
  qSql.Connection := dmEmp.SqlConSis;
  qSql.Close;
  qSql.SQL.Text := 'Select ( COALESCE( max( CAST( substr(prv_numpro, 1,5) as INTEGER ) ),0)+1 ) as protocolo from "99999999999999_TESTE".procveic';
  qSql.Open;
  prv_numpro.Text :=  strzero( qSql.FieldByName('protocolo').Value, 5)+FormatDateTime('yyyy', Now ) ;

end;

procedure Tfrmprocveic.prv_codigoExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlprocveic ;
  prv_codplc.Text :=  Pesquisa.Relacao('procveic',prv_codigo,'prv_codigo','prv_codplc');
  navegacao(5);

end;

procedure Tfrmprocveic.prv_codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END    : prv_codigoRightButtonClick(Self);
    VK_UP     : navegacao(1);
    VK_LEFT   : navegacao(2);
    VK_RIGHT  : navegacao(3);
    VK_DOWN   : navegacao(4);

  end;
Finally

End;

end;

procedure Tfrmprocveic.prv_codigoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
if btnGrava.Enabled then
   Exit;

  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsprocveic ;
  Pesquisa.sqlTabela :=  dmEmp.sqlprocveic ;
  Pesquisa.cliTabela :=  dmEmp.cliprocveic ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Movimentação de Veículos';
  Pesquisa.nmTabela  := 'procveic';
  //Pesquisa.NovoCad   := 'procveic' ;
  // Display        campo   cabecalho           get         tan  indices
  Pesquisa.AddReg('prv_codigo', 'Código'        ,'prv_codigo' , 5  ,'por Código'        );
  Pesquisa.AddReg('prv_destin', 'Destino'       ,'prv_destin' , 7  ,'por Destino'       );
  Pesquisa.AddReg('prv_origem', 'Origem'        ,'prv_origem' , 7  ,'por Origem'        );
  Pesquisa.AddReg('prv_codplc', 'Placa'         ,'prv_codplc' , 7  ,'por Placa'         );
  Pesquisa.AddReg('mdl_nome',   'Modelo'        ,'edNomMdl'  , 20  ,'por Modelo'        );
  Pesquisa.AddReg('prv_numpro', 'Protocolo'     ,'prv_numpro' ,10  ,'por Protocolo'     );
  Pesquisa.AddReg('prv_datems', 'Dt Emissão'    ,'prv_datems' ,10  ,'por Dt Emissão'    );
  Pesquisa.AddReg('prv_datpro', 'Dt Processo'   ,'prv_datpro' ,10  ,'por Dt Processo'   );


  Pesquisa.acessa(prv_codigo);
  prv_codigo.text   :=  Pesquisa.RecReg('prv_codigo');
  prv_codplc.text   :=  Pesquisa.RecReg('prv_codplc');
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


procedure Tfrmprocveic.prv_datproExit(Sender: TObject);
begin
  if prv_datpro.Date >= prv_datems.Date then begin
      ShowMessage('Data de Processo é menor do que a autorizada');
     prv_datpro.SetFocus;
  end;

end;

procedure Tfrmprocveic.prv_codplcExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela  :=  dmEmp.sqlveiculoatv ;
  edNomMdl.Text       :=  Pesquisa.Relacao('veiculoatv',prv_codplc,'vat_placa','mdl_nome'   );
  prv_origem.Text     :=  Pesquisa.Relacao('veiculoatv',prv_codplc,'vat_placa','vat_status' );
  destino;

end;
procedure Tfrmprocveic.prv_codplcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      prv_codplcRightButtonClick(Self);
  end;
Finally

End;


end;

procedure Tfrmprocveic.prv_codplcRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsveiculoatv ;
  Pesquisa.sqlTabela :=  dmEmp.sqlveiculoatv ;
  Pesquisa.cliTabela :=  dmEmp.cliveiculoatv ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Veículos';
  Pesquisa.nmTabela  := 'veiculoatv';
  Pesquisa.NovoCad   := '' ;
  // Display        campo   cabecalho           get         tan  indices
  Pesquisa.AddReg('vat_placa',  'Placa'         ,'vat_placa' ,     7  , 'por Placa'   );
  Pesquisa.AddReg('vat_nrfrota','Frota'         ,'vat_nrfrota' ,   7  , 'por Frota'   );
  Pesquisa.AddReg('mdl_nome',   'Modelo'        ,'edNomMdl' ,     25  , 'por Modelo'  );
  Pesquisa.AddReg('mrc_nome',   'Marca'         ,'' ,             25  , 'por Marca'   );
  Pesquisa.AddReg('vat_Status', 'Status'        ,'vat_Status' ,    7  , 'por Status'  );
  Pesquisa.AddReg('ltd_nome',   'Lotado'        ,'' ,             25  , 'por Lotação' );
  Pesquisa.AddReg('vat_chassi', 'Chassi'        ,'' ,             17  , 'por Chassi'  );
  Pesquisa.AddReg('vat_renavan','Renavan'       ,'' ,             17  , 'por Renavan' );

  Pesquisa.acessa(prv_codplc);
  prv_codplc.text   :=  Pesquisa.RecReg('vat_placa');
  edNomMdl.text    :=  Pesquisa.RecReg('mdl_nome');
  Pesquisa.Destroy;

end;


procedure Tfrmprocveic.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sqlNew.Close;
    dmEmp.cliprocveic.Close;
    frmprocveic                 := nil ;
    action                       := cafree;
    fPrincipal.btnprocveic.Enabled := True;
end;



procedure Tfrmprocveic.FormCreate(Sender: TObject);
Var
i: Integer;
begin
  cPre                        := 'prv_';
  cTabela                     := 'procveic';
  acampo                      := 1;
  sqlNew                      := TFDQuery.Create(nil);
  sqlNew.Connection           := dmEmp.SqlConSis;
  fPrincipal.btnprocveic.Enabled  := False;
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;
end;


procedure Tfrmprocveic.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure Tfrmprocveic.FormShow(Sender: TObject);
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
  lbCabeca01.Caption    := 'Movimentação de Veículos';
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
  prv_codigo.SetFocus;

  btnNovo.Caption    := 'Novo'+#13 +'[F3]';
  btnAlterar.Caption := 'Editar'+#13 +'[F4]';
  btnGrava.Caption   := 'Salvar'+#13 +'[F5]';
  btnExcluir.Caption := 'Excluir'+#13 +'[Alt+Del]';
  btnCancela.Caption := 'Cancelar'+#13 +'[F12]';

end;

procedure Tfrmprocveic.gravadados;
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, ctip_horalt,cCodSql, cIteSql,cValSql,cCodMnt : string ;
dData, dtip_datalt : TDate ;
i, tmp: Integer;
SQLQ : TFDQuery ;
begin
   gravadados2(cTabela,cPre,cPre+'codigo','X','', nNew, frmprocveic, dmEmp.SqlConSis, aEdits );
end;

procedure Tfrmprocveic.limpaget;
Var
i: Integer;
begin
  limpaget2(aEdits);
end;

procedure Tfrmprocveic.destino;
Var
I: Integer;
begin

prv_destin.Clear;
for I := 0 to Length( fPrincipal.astatus )-1 do Begin

  if prv_origem.Text <> fPrincipal.astatus[I] then
     prv_destin.Items.Add(fPrincipal.astatus[I])

End;
prv_destin.ItemIndex := 0;
end;

procedure Tfrmprocveic.navegacao(Ord: Integer);
begin
  if btnGrava.Enabled then
     Exit;

  navegacao2( Ord, acampo, btnIni, btnAnt, btnProx, btnUlt, sqlNew, dmEmp.sqlprocveic, prv_codigo,'' );
  acampo := 0;
  RefreshDialog2(cPre,acampo, frmprocveic, sqlNew, aEdits);
  acampo := 1;
  destino;
end;

procedure Tfrmprocveic.RefreshDados(tipo: String);
var
  i: integer;
  cWhere, cQuery, cOrder: String;

begin
  RefreshDados2(acampo, tipo,'',  prv_codigo, sqlNew, dmEmp.sqlprocveic );
end;


procedure Tfrmprocveic.RefreshDialog;
var
  i, tmp: Integer;
  frmx : TForm ;
begin
  RefreshDialog2(cPre,acampo, frmprocveic, sqlNew, aEdits);
end;

procedure Tfrmprocveic.ToolButton9Click(Sender: TObject);
begin
  frmCalculadora := TfrmCalculadora.Create(Self);
  frmCalculadora.Show;

end;

procedure Tfrmprocveic.ativaButoes(tipo:Integer);
begin
ativaButoes2(Tipo,  btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt, sqlNew);
end;

procedure Tfrmprocveic.ativaget;
begin
  ativaget2(aEdits,cPre+'codigo',cTabela, btnGrava.Enabled, lMostra );
end;

procedure Tfrmprocveic.btnAlterarExecute(Sender: TObject);
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
   prv_codplc.SetFocus;
   navegacao(0);
   prv_numpro.Enabled := False;
   prv_origem.Enabled := False;

end;

procedure Tfrmprocveic.btnAntExecute(Sender: TObject);
begin
  navegacao(2);
end;

procedure Tfrmprocveic.btnCancelaExecute(Sender: TObject);
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
   prv_codigo.SetFocus;

end;

procedure Tfrmprocveic.btnExcluirExecute(Sender: TObject);
Var
aSubTab : TArrayDim2;
n: Integer;
Autoriza: TfrmAutoiza;
begin

   Autoriza  := TfrmAutoiza.Create;
   iF Autoriza.Autorizar(Screen.ActiveForm.Caption, prv_codigo.Text, 'Excluir' ) then Begin
       //SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'acessoratv';     aSubTab[n][1] := '';
       If Exclui2(cTabela, aSubTab,  prv_codigo, btnExcluir) Then Begin;
           RefreshDados('T');
           ativaButoes(1);
           limpaget;
           lMostra := True;
           ativaget;
           navegacao(4);
           acampo := 1;
           nNew   := acampo;
       End;
   End;
end;

procedure Tfrmprocveic.btnGravaExecute(Sender: TObject);
Var
  qDel, qDel1, qSql1 : TFDQuery;
  cCodTnq, cNumAnt : String;
begin
   gravadados;
   cNumAnt  := IntToStr( strtoint( PegaUltCodSalvo( cTabela, 'prv_codigo', 'prv_' ) ) + 0 );
   IniTransacao;

   if nNew = 1 then Begin

      // Atualizando status do Veículo
      qDel1 := TFDQuery.Create(Nil);
      qDel1.Close;
      qDel1.Connection := dmEmp.SqlConSis;
      qDel1.SQl.Text    :='UPDATE '+U_funcao.SelSchema('veiculoatv')+' Set vat_status = :vat_status,   '+
                          ' vat_usualt = :vat_usualt, vat_datalt = :vat_datalt, vat_horalt = :vat_horalt  WHERE vat_placa = :vat_placa ';
      qDel1.ParamByName('vat_placa').Text    := prv_codplc.Text;
      qDel1.ParamByName('vat_status').Text   := prv_destin.Text;
      qDel1.ParamByName('vat_usualt').Text   := sysUsuario ;
      qDel1.ParamByName('vat_datalt').AsDate := now ;
      qDel1.ParamByName('vat_horalt').Text   := TimeToStr(time) ;
      qDel1.ExecSQL;
      FimTransacao;
   End;

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
   prv_codigo.SetFocus;
   destino;
end;

procedure Tfrmprocveic.btnIniExecute(Sender: TObject);
begin
  navegacao(1);
end;

procedure Tfrmprocveic.btnNovoExecute(Sender: TObject);
begin
   acampo := 1;
   nNew   := acampo;
   btnGrava.Enabled := True;
   RefreshDados('S');
   limpaget;
   ativaButoes(1);
   lMostra := False;
   ativaget;
   prv_codplc.SetFocus;
   protoclo;
   destino;
   prv_numpro.Enabled := False;
   prv_origem.Enabled := False;

end;

procedure Tfrmprocveic.btnProxExecute(Sender: TObject);
begin
  navegacao(3);
end;

procedure Tfrmprocveic.btnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure Tfrmprocveic.btnUltExecute(Sender: TObject);
begin
  navegacao(4);
end;

initialization
  RegisterClass(Tfrmprocveic);

end.
