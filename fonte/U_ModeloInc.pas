unit U_ModeloInc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, ImgList, ExtCtrls, ComCtrls, xmldom,
  XMLIntf, IdHTTP, msxmldom, XMLDoc, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, ExtDlgs, RibbonLunaStyleActnCtrls,
  ToolWin, ActnMan, ActnCtrls, jpeg, edittuning, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, U_ClasseUtil,U_Classcons, ZDataset, ZDatasetUtils,
  Vcl.Buttons,U_ClassCad, Vcl.Grids, Vcl.DBGrids, System.ImageList, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmModelo = class(TForm)
    StatusBar1: TStatusBar;
    Banner: TPanel;
    imgLogo: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    mdl_codigo: TButtonedEdit;
    Label4: TLabel;
    mdl_nome: TEdit;
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
    mdl_codmrc: TButtonedEdit;
    Label2: TLabel;
    Label3: TLabel;
    edNomMrc: TEdit;
    mdl_codfip: TEdit;
    Label5: TLabel;
    edCodSer: TButtonedEdit;
    Label6: TLabel;
    edNomSer: TEdit;
    Label7: TLabel;
    dbgServiços: TDBGrid;
    btnExcFat: TButton;
    btnIncFat: TButton;
    edKmManu: TMaskEdit;
    Label16: TLabel;
    edNomGrm: TEdit;
    mdl_codgrm: TButtonedEdit;
    Label8: TLabel;
    Label9: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure RefreshDialog;
    Procedure RefreshDados(tipo: String);
    procedure mdl_codigoExit(Sender: TObject);
    procedure mdl_codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mdl_codigoRightButtonClick(Sender: TObject);
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
    procedure mdl_codmrcRightButtonClick(Sender: TObject);
    procedure mdl_codmrcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mdl_codmrcExit(Sender: TObject);
    procedure edKmManuKeyPress(Sender: TObject; var Key: Char);
    procedure btnIncFatClick(Sender: TObject);
    procedure edCodSerRightButtonClick(Sender: TObject);
    procedure edCodSerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCodSerExit(Sender: TObject);
    procedure mdl_codigoChange(Sender: TObject);
    procedure dbgServiçosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnExcFatClick(Sender: TObject);
    procedure mdl_codgrmRightButtonClick(Sender: TObject);
    procedure mdl_codgrmKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mdl_codgrmExit(Sender: TObject);
  private
    { Private declarations }
    wEmpresa, wUsuInc, wHorInc, wUsuAlt, wHorAlt : string ;
    wDatInc, wDatAlt : Tdate;
    nNew, nRecno:  Integer;
    procedure RefreshGrid;
    procedure btninc;
  public
    acampo: integer;
    aberto, lMostra, NewServicos: Boolean;
    Util: TClasseUtil;
    Pesquisa : TClasConsulta;
    sqlNew    : TFDQuery;
    aEdits : TArrayComp;
    cPre, cTabela: String;

    { Public declarations }
  end;

var
  frmModelo: TfrmModelo;
  modConsulta, nOrdem : integer;


implementation

uses  UCalculadora, uSistema, U_funcao, U_CnpjClass, U_dmEmp, u_aguarde;

{$R *.dfm}

procedure TfrmModelo.mdl_codmrcExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlMarca ;
  edNomMrc.Text :=  Pesquisa.Relacao('marca',mdl_codmrc,'mrc_codigo','mrc_nome');

end;

procedure TfrmModelo.mdl_codmrcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      mdl_codmrcRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmModelo.mdl_codmrcRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsMarca ;
  Pesquisa.sqlTabela :=  dmEmp.sqlMarca ;
  Pesquisa.cliTabela :=  dmEmp.cliMarca ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Marcas de Veículos';
  Pesquisa.nmTabela  := 'marca';
  Pesquisa.NovoCad   := 'marca' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('mrc_codigo','Código'             ,'mdl_codmrc' ,5  ,'por Código' );
  Pesquisa.AddReg('mrc_nome'  ,'Marca de Modleo'    ,'edNomMrc'   ,25 ,'por Marca' );

  Pesquisa.acessa(mdl_codmrc);
  mdl_codmrc.text   :=  Pesquisa.RecReg('mrc_codigo');
  edNomMrc.text     :=  Pesquisa.RecReg('mrc_nome');
  Pesquisa.Destroy;

 end;

procedure TfrmModelo.mdl_codgrmExit(Sender: TObject);
begin
  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlgrupomnt ;
  edNomGrm.Text   :=  Pesquisa.Relacao('grupomnt',mdl_codgrm,'grm_codigo','grm_nome');

end;

procedure TfrmModelo.mdl_codgrmKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      mdl_codgrmRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmModelo.mdl_codgrmRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsgrupomnt ;
  Pesquisa.sqlTabela :=  dmEmp.sqlgrupomnt ;
  Pesquisa.cliTabela :=  dmEmp.cligrupomnt ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Grupos de Peças e Serviços';
  Pesquisa.nmTabela  := 'grupomnt' ;
  Pesquisa.NovoCad   := 'grupomnt' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('grm_codigo'  ,'Código'                  ,'grm_codigo' ,5  ,'por Código'       );
  Pesquisa.AddReg('grm_nome'    ,'Grupos'                  ,'grm_nome'   ,30 ,'por Grupo'         );


  Pesquisa.acessa(mdl_codgrm);
  mdl_codgrm.text   :=  Pesquisa.RecReg('grm_codigo');
  edNomGrm.text     :=  Pesquisa.RecReg('grm_nome');

  Pesquisa.Destroy;

end;

procedure TfrmModelo.mdl_codigoChange(Sender: TObject);
begin
  RefreshGrid;
end;

procedure TfrmModelo.mdl_codigoExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlModelo ;
  mdl_nome.Text :=  Pesquisa.Relacao('Modelo',mdl_codigo,'mdl_codigo','mdl_nome');
  navegacao(0);


end;

procedure TfrmModelo.mdl_codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      mdl_codigoRightButtonClick(Self);
    VK_UP     : navegacao(1);
    VK_LEFT   : navegacao(2);
    VK_RIGHT  : navegacao(3);
    VK_DOWN   : navegacao(4);
  end;
Finally

End;

end;

procedure TfrmModelo.mdl_codigoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin

if btnGrava.Enabled then
   Exit;

  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsmodelo ;
  Pesquisa.sqlTabela :=  dmEmp.sqlModelo ;
  Pesquisa.cliTabela :=  dmEmp.climodelo ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Modelos de Veículos';
  Pesquisa.nmTabela  := 'Modelo';
  Pesquisa.NovoCad   := 'Modelo' ;
  // Display        campo   cabecalho           get         tan  indices
  Pesquisa.AddReg('mdl_codigo','Código'        ,'mdl_codigo' ,5  ,'por Código' );
  Pesquisa.AddReg('mdl_nome'  ,'Modelos'       ,'mdl_nome'   ,20 ,'por Modelo' );
  Pesquisa.AddReg('mrc_nome'  ,'Marca'         ,'mrc_nome'   ,15 ,'por Marca' );

  Pesquisa.acessa(mdl_codigo);
  mdl_codigo.text   :=  Pesquisa.RecReg('mdl_codigo');
  mdl_nome.text     :=  Pesquisa.RecReg('mdl_nome');
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

procedure TfrmModelo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sqlNew.Close;
    dmEmp.cliModelo.Close;
    frmModelo                    := nil ;
    action                       := cafree;
    fPrincipal.btnModelo.Enabled := True;
end;



procedure TfrmModelo.FormCreate(Sender: TObject);
Var
i: Integer;
begin
  cPre                        := 'mdl_';
  cTabela                     := 'modelo';
  acampo                      := 1;
  sqlNew                      := TFDQuery.Create(nil);
  sqlNew.Connection           := dmEmp.SqlConSis;
  fPrincipal.btnmodelo.Enabled  := False;
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;
end;


procedure TfrmModelo.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmModelo.FormShow(Sender: TObject);
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
  lbCabeca01.Caption    := 'Tabela de Modelos';
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
  NewServicos := False;
  // fPrincipal.rbbPrincipal.DocumentName := lbCabeca01.Caption;

end;

procedure TfrmModelo.gravadados;
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, ctip_horalt,cCodSql, cIteSql,cValSql,cCodMnt : string ;
dData, dtip_datalt : TDate ;
i, tmp: Integer;
SQLQ : TFDQuery ;
begin
   gravadados2(cTabela,cPre,cPre+'codigo','X','', nNew, frmModelo, dmEmp.SqlConSis, aEdits );
end;


procedure TfrmModelo.limpaget;
Var
i: Integer;
begin
  limpaget2(aEdits);
end;

procedure TfrmModelo.navegacao(Ord: Integer);
begin
  if btnGrava.Enabled then
     Exit;

  navegacao2( Ord, acampo, btnIni, btnAnt, btnProx, btnUlt, sqlNew, dmEmp.sqlModelo, mdl_codigo,'' );
  acampo := 0;
  RefreshDialog2(cPre,acampo, frmModelo, sqlNew, aEdits);
  acampo := 1;
  RefreshGrid;
end;

procedure TfrmModelo.RefreshDados(tipo: String);
var
  i: integer;
  cWhere, cQuery, cOrder: String;

begin
  RefreshDados2(acampo, tipo, '', mdl_codigo, sqlNew, dmEmp.sqlModelo );
end;

procedure TfrmModelo.RefreshDialog;
var
  i, tmp: Integer;
  frmx : TForm ;
begin
  RefreshDialog2(cPre,acampo, frmModelo, sqlNew, aEdits);
end;


procedure TfrmModelo.ToolButton9Click(Sender: TObject);
begin
  frmCalculadora := TfrmCalculadora.Create(Self);
  frmCalculadora.Show;

end;

procedure TfrmModelo.ativaButoes(tipo:Integer);
begin
ativaButoes2(Tipo,  btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt, sqlNew);
end;

procedure TfrmModelo.ativaget;
begin
  ativaget2(aEdits,cPre+'codigo',cTabela, btnGrava.Enabled, lMostra );
end;

procedure TfrmModelo.btnAlterarExecute(Sender: TObject);
begin
   btnNovo.Enabled    := False;
   btnAlterar.Enabled := False;
   btnGrava.Enabled   := True;
   ativaButoes(1);
   lMostra := True;
   ativaget;
   RefreshDialog;
   mdl_nome.SetFocus;
   acampo := 0;
   nNew   := acampo;
   RefreshGrid;
   edKmManu.Text         := FormatCurr('Km #,###,##0',0);
   navegacao(0);
   NewServicos := False;

end;

procedure TfrmModelo.btnAntExecute(Sender: TObject);
begin
  navegacao(2);
end;

procedure TfrmModelo.btnCancelaExecute(Sender: TObject);
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

   mdl_codigo.SetFocus;

end;

procedure TfrmModelo.btnExcFatClick(Sender: TObject);
begin
     if MESSAGEBOX(Application.Handle, 'Deseja Excluir?', 'Confirma...', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin
          dmEmp.sqlacsatv.Close;
          dmEmp.sqlacsatv.SQl.Text  :='DELETE FROM '+U_funcao.SelSchema('modelomnt')
                                    +' WHERE mdm_codigo = '+dbgServiços.DataSource.DataSet.FieldByName('mdm_codigo').Text
                                    +' and   mdm_codmdl = '+mdl_codigo.Text ;
          dmEmp.sqlacsatv.ExecSQL;
          Auditor(Screen.activeform.Caption,'Deletou','Cód SubTab-Serviços: '+mdl_codigo.Text+'/'+dbgServiços.DataSource.DataSet.FieldByName('mdm_codigo').Text );
        end;
      RefreshGrid

end;

procedure TfrmModelo.btnExcluirExecute(Sender: TObject);
Var
aSubTab : TArrayDim2;
n: Integer;
begin
   //SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'acessoratv';     aSubTab[n][1] := '';
   If Exclui2(cTabela, aSubTab,  mdl_codigo, btnExcluir) Then Begin;
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

procedure TfrmModelo.btnGravaExecute(Sender: TObject);
Var
  qItem, qVeic, qManu, qGrav : TFDQuery;
begin
   gravadados;

   // Se houver inclusão de Novos registros
   if    NewServicos  then Begin
           with Taguarde.ShowWaitForm('') do
               try
                  // Abrindo pesquisa de veículos
                  qItem := TFDQuery.Create(Nil);
                  qVeic := TFDQuery.Create(Nil);
                  qManu := TFDQuery.Create(Nil);
                  qGrav := TFDQuery.Create(Nil);

                  // Atualização Porte do Veiculo pelo modelo
                  qVeic.Connection  := dmEmp.SqlConSis;
                  qVeic.Close;
                  qVeic.SQl.Text :=' update '+U_funcao.SelSchema('veiculoatv')+' Set vat_codgrm = '+mdl_codgrm.Text
                                         +' where vat_codmdl = '+mdl_codigo.Text ;
                  qVeic.ExecSQL;

                  // Consultando veiculos com o modelo
                  qItem.Connection  := dmEmp.SqlConSis;
                  qItem.Close;
                  qItem.SQl.Text :=' Select * FROM '+U_funcao.SelSchema('modelomnt')
                                   +' where mdm_codmdl = '+mdl_codigo.Text ;
                  qItem.Open;
                  while not qItem.eof do begin

                        // Consultando veiculos com o modelo
                        qVeic.Connection  := dmEmp.SqlConSis;
                        qVeic.Close;
                        qVeic.SQl.Text :=' Select * FROM '+U_funcao.SelSchema('veiculoatv')
                                         +' where vat_codmdl = '+mdl_codigo.Text ;
                        qVeic.Open;
                        while Not qVeic.Eof do Begin
                              // Consultando Manutenção nos veículos
                              qManu.Connection  := dmEmp.SqlConSis;
                              qManu.Close;
                              qManu.SQl.Text :=' Select * FROM '+U_funcao.SelSchema('veiculosrv')
                                               +' where vsv_codplc = '+QuotedStr( qVeic.FieldByName('vat_placa').Text)
                                               +' and   vsv_codtsm = '+qItem.FieldByName('mdm_codtsm').Text ;

                              qManu.Open;
                              if qManu.Eof then begin
                                  { Rotina para guardar as informações na manutenção do veiculo}
                                   qGrav.Connection  := dmEmp.SqlConSis;
                                   with qGrav do
                                     begin
                                       Close;
                                       SQL.Text :='insert into '+U_funcao.SelSchema('veiculosrv')+' (  vsv_codplc,  vsv_codmdm,  vsv_codtsm,  vsv_kmmanu,  vsv_kmmant,  vsv_ativo,  vsv_usuinc,   vsv_datinc,   vsv_horinc ) values  '+
                                                                                                  ' ( :vsv_codplc, :vsv_codmdm, :vsv_codtsm, :vsv_kmmanu, :vsv_kmmant, :vsv_ativo, :vsv_usuinc,  :vsv_datinc,  :vsv_horinc ) ';

                                       ParamByName('vsv_codplc').Text       := qVeic.FieldByName('vat_placa').Text    ;
                                       ParamByName('vsv_codmdm').Text       := qItem.FieldByName('mdm_codigo').Text   ;
                                       ParamByName('vsv_codtsm').Text       := qItem.FieldByName('mdm_codtsm').Text   ;
                                       ParamByName('vsv_kmmant').AsFloat    := qVeic.FieldByName('vat_kmatu').AsFloat ;
                                       ParamByName('vsv_kmmanu').AsFloat    := qVeic.FieldByName('vat_kmatu').AsFloat ;
                                       ParamByName('vsv_ativo').AsBoolean   := True ;
                                       ParamByName('vsv_usuinc').Text       :=  sysUsuario ;
                                       ParamByName('vsv_datinc').AsDate     := now ;
                                       ParamByName('vsv_horinc').Text       := TimeToStr(time) ;
                                       ExecSQL;
                                   end;
                                   qGrav.Close;
                              end;


                          qVeic.Next;
                        End;
                        qItem.Next;
                  end;

              finally
                AllowClose;
                Free;
              end;
   End;

   if FechaSubFrm(cTabela) then Close;

   acampo := 1;
   nNew   := acampo;
   btnNovo.Enabled := True;
   btnGrava.Enabled:= False;
   RefreshDados('T');
   ativaButoes(0);
   edKmManu.Text         := FormatCurr('Km #,###,##0',0);
    Case lMostra of
      False  : navegacao(4);
      True   : navegacao(5);
     end;
   lMostra := True;
   ativaget;
   mdl_codigo.SetFocus;
   btninc;

end;

procedure TfrmModelo.btnIncFatClick(Sender: TObject);
Var
edCfo, edCst: String;
begin

 if nNew > 0 then begin
    nNew := GravarSub(cTabela,cPre,cPre+'codigo','X','', nNew, aCampo, frmModelo, dmEmp.SqlConSis, aEdits, sqlNew, dmEmp.SqlModelo, mdl_codigo );
 End;
 IniTransacao;
{ Rotina para guardar as informações}
 dmEmp.climodelomnt.Close;
 dmEmp.Sqlmodelomnt.Close;
 with dmEmp.Sqlmodelomnt do
   begin
     Close;
     SQL.Text :='insert into '+U_funcao.SelSchema('modelomnt')+' ( mdm_codmdl,  mdm_codtsm,  mdm_kmmanu,  mdm_usuinc,  mdm_datinc,  mdm_horinc ) values     '+
                                                                '(:mdm_codmdl, :mdm_codtsm, :mdm_kmmanu, :mdm_usuinc, :mdm_datinc, :mdm_horinc )  ';

     ParamByName('mdm_codmdl').Text       := mdl_codigo.Text ;
     ParamByName('mdm_codtsm').Text       := edcodser.Text ;
     ParamByName('mdm_kmmanu').AsFloat    := FormataNum( edKmManu.Text ) ;
     ParamByName('mdm_usuinc').Text       :=  sysUsuario ;
     ParamByName('mdm_datinc').AsDate     := now ;
     ParamByName('mdm_horinc').Text       := TimeToStr(time) ;
     ExecSQL;
     NewServicos := True;
 end;


 edcodser.Clear;
 edNomSer.Clear;
 edKmManu.Text         := FormatCurr('Km #,###,##0',0);
 edcodser.SetFocus;
 RefreshGrid;

end;
procedure TfrmModelo.RefreshGrid;
Var
  qDel : TFDQuery;
  Encargos : Double;
begin

  dmEmp.climodelomnt.Close;
  dmEmp.Sqlmodelomnt.Close;
  with dmEmp.Sqlmodelomnt do
    begin
      SQL.Text :=' Select * from '+U_funcao.SelSchema('modelomnt')
                +' LEFT JOIN '+U_funcao.SelSchema('tbservico')+' on tsm_codigo = mdm_codtsm '
                +' where mdm_codmdl = '+fIIf( Length( trim(mdl_codigo.Text)) > 0, mdl_codigo.Text,'0' ) ;
      Open;
  end;
  dmEmp.climodelomnt.Active := True;
  dbgServiços.Refresh;
  btninc;

end;

procedure TfrmModelo.btninc;
begin
      btnIncFat.Enabled     := ( ( edcodser.Text <> '' )         and ( btnGrava.Enabled ) )  ;
      btnExcFat.Enabled     := ( ( Not dmEmp.climodelomnt.Eof )  and ( btnGrava.Enabled ) )  ;
      edcodser.Enabled      := ( btnGrava.Enabled ) ;
      edKmManu.Enabled      := ( btnGrava.Enabled ) ;

end;

procedure TfrmModelo.btnIniExecute(Sender: TObject);
begin
  navegacao(1);
end;

procedure TfrmModelo.btnNovoExecute(Sender: TObject);
begin
   acampo := 1;
   nNew   := acampo;
   btnGrava.Enabled := True;
   RefreshDados('S');
   limpaget;
   ativaButoes(1);
   lMostra := False;
   ativaget;
   mdl_nome.SetFocus;
   edKmManu.Text         := FormatCurr('Km #,###,##0',0);
   RefreshGrid;
   NewServicos := False;

end;

procedure TfrmModelo.btnProxExecute(Sender: TObject);
begin
  navegacao(3);
end;

procedure TfrmModelo.btnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmModelo.btnUltExecute(Sender: TObject);
begin
  navegacao(4);
end;

procedure TfrmModelo.dbgServiçosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    if gdFocused in State then  begin
      dbgServiços.Canvas.Brush.Color  := Azul_Escuro;
      dbgServiços.Canvas.Font.Color   := Branco;
      dbgServiços.Canvas.FillRect(Rect);
      dbgServiços.DefaultDrawDataCell(Rect, Column.Field, State);
    end else begin

        if Odd(dbgServiços.DataSource.DataSet.RecNo) then begin
          dbgServiços.Canvas.Brush.Color  := Branco;
          dbgServiços.Canvas.Font.Color   := Preto;
          dbgServiços.Canvas.FillRect(Rect);
          dbgServiços.DefaultDrawDataCell(Rect, Column.Field, State);

        End else Begin
          dbgServiços.Canvas.Brush.Color  := Cinza_Sintilante;
          dbgServiços.Canvas.Font.Color   := Preto;
          dbgServiços.Canvas.FillRect(Rect);
          dbgServiços.DefaultDrawDataCell(Rect, Column.Field, State);
        End;

    end;

end;

procedure TfrmModelo.edCodSerExit(Sender: TObject);
begin
  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqltbservico ;
  edNomSer.Text      :=  Pesquisa.Relacao('tbservico',edCodSer,'tsm_codigo','tsm_nome') ;
  btninc;

end;

procedure TfrmModelo.edCodSerKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmModelo.edCodSerRightButtonClick(Sender: TObject);
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
  Pesquisa.QuerySql  := ' sgm_codgrm = '+mdl_codgrm.Text ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('tsm_codigo','Código'             ,'tsm_codigo' ,5  ,'por Código'   );
  Pesquisa.AddReg('tsm_nome'  ,'Serviços'           ,'edNomFpg'   ,30 ,'por Serviços' );
  Pesquisa.AddReg('grm_nome'  ,'Grupo'              ,'grm_nome'   ,30 ,'por Grupo'    );


  Pesquisa.acessa(edCodSer);
  edCodSer.text   :=  Pesquisa.RecReg('tsm_codigo');
  edNomSer.text   :=  Pesquisa.RecReg('tsm_nome');
  Pesquisa.Destroy;

end;

procedure TfrmModelo.edKmManuKeyPress(Sender: TObject; var Key: Char);
begin
  KeyKm( TMaskEdit( Sender ) , Key );
end;

initialization
  RegisterClass(TfrmModelo);

end.
