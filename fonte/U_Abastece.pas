unit U_Abastece;

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
  TfrmAbastece = class(TForm)
    StatusBar1: TStatusBar;
    Banner: TPanel;
    imgLogo: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    abt_codigo: TButtonedEdit;
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
    abt_codbmb: TButtonedEdit;
    Label2: TLabel;
    Label3: TLabel;
    edNomBmb: TEdit;
    abt_horaut: TMaskEdit;
    Label12: TLabel;
    abt_codplc: TButtonedEdit;
    Label15: TLabel;
    edNomMdl: TEdit;
    Label23: TLabel;
    abt_codpss: TButtonedEdit;
    Label4: TLabel;
    edNomPss: TEdit;
    Label5: TLabel;
    abt_codcmb: TButtonedEdit;
    Label6: TLabel;
    edNomCmb: TEdit;
    Label7: TLabel;
    abt_dataut: TDateTimePicker;
    Label27: TLabel;
    Label8: TLabel;
    abt_datrea: TDateTimePicker;
    Label9: TLabel;
    abt_horrea: TMaskEdit;
    abt_ltsabt: TMaskEdit;
    Label13: TLabel;
    Label10: TLabel;
    abt_vlrlts: TMaskEdit;
    abt_kmaba: TMaskEdit;
    Label16: TLabel;
    Label14: TLabel;
    abt_local: TComboBox;
    Label17: TLabel;
    abt_ltsaut: TMaskEdit;
    Label18: TLabel;
    abt_codpab: TButtonedEdit;
    Label19: TLabel;
    edNomPab: TEdit;
    Label20: TLabel;
    abt_codict: TEdit;
    GroupBox2: TGroupBox;
    lbTotal: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure RefreshDialog;
    Procedure RefreshDados(tipo: String);
    procedure abt_codigoExit(Sender: TObject);
    procedure abt_codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure abt_codigoRightButtonClick(Sender: TObject);
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
    procedure abt_codbmbRightButtonClick(Sender: TObject);
    procedure abt_codbmbKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure abt_codbmbExit(Sender: TObject);
    procedure abt_codplcRightButtonClick(Sender: TObject);
    procedure abt_codplcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure abt_codplcExit(Sender: TObject);
    procedure abt_codpssRightButtonClick(Sender: TObject);
    procedure abt_codpssKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure abt_codpssExit(Sender: TObject);
    procedure abt_codcmbRightButtonClick(Sender: TObject);
    procedure abt_codcmbKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure abt_codcmbExit(Sender: TObject);
    procedure abt_kmabaKeyPress(Sender: TObject; var Key: Char);
    procedure abt_datreaExit(Sender: TObject);
    procedure abt_horreaExit(Sender: TObject);
    procedure abt_ltsabtKeyPress(Sender: TObject; var Key: Char);
    procedure abt_vlrltsKeyPress(Sender: TObject; var Key: Char);
    procedure calcule;
    procedure abt_ltsabtExit(Sender: TObject);
    procedure abt_vlrltsExit(Sender: TObject);
    procedure abt_kmabaExit(Sender: TObject);
    procedure abt_horautExit(Sender: TObject);
    procedure abt_ltsautKeyPress(Sender: TObject; var Key: Char);
    procedure abt_localChange(Sender: TObject);
    procedure abt_ltsautExit(Sender: TObject);
    procedure localabt;
    procedure abt_codpabRightButtonClick(Sender: TObject);
    procedure abt_codpabKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure abt_codpabExit(Sender: TObject);

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
  frmAbastece: TfrmAbastece;
  modConsulta, nOrdem : integer;


implementation

uses  UCalculadora,  u_DmEmp, uSistema, U_funcao, U_CnpjClass,
  U_ClassconsContas, U_ClassConsMotorista, U_ClassAutoriza;

{$R *.dfm}

procedure TfrmAbastece.abt_codbmbExit(Sender: TObject);
begin
  if btnGrava.Enabled and
    ( nNew = 1 )      and
    ( abt_codbmb.Text <> '' )  then begin

      If ChkBombaAberta(abt_codbmb.Text) then begin
         ShowMessage('O Incerrante para esta bomba esta fechado');
         abt_codbmb.Clear;
         abt_codbmb.SetFocus;
         exit;
      end;
      abt_codict.Text     :=  PegaIncerrante(abt_codbmb.Text);
      abt_codict.Enabled  := False;
  end;

  if ( abt_local.ItemIndex = 0 ) and ( abt_codbmb.Text <> '' )  then begin
      // Função que confirma os dados relacionados
      Pesquisa := TClasConsulta.Create;
      Pesquisa.trava(Sender, nNew );
      Pesquisa.sqlTabela  :=  dmEmp.sqlbomba ;
      edNomBmb.Text       :=  Pesquisa.Relacao('bomba',abt_codbmb,'bmb_codigo','bmb_nome'    );
      edNomCmb.Text       :=  Pesquisa.Relacao('bomba',abt_codbmb,'bmb_codigo','cmb_nome'    );
      abt_codcmb.Text     :=  Pesquisa.Relacao('bomba',abt_codbmb,'bmb_codigo','bmb_codcmb'  );
  end;

end;

procedure TfrmAbastece.abt_codbmbKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      abt_codbmbRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmAbastece.abt_codbmbRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsbomba ;
  Pesquisa.sqlTabela :=  dmEmp.Sqlbomba ;
  Pesquisa.cliTabela :=  dmEmp.clibomba ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Bombas de Abastecimento';
  Pesquisa.nmTabela  := 'bomba';
//  Pesquisa.NovoCad   := 'bomba' ;
  // Display        campo   cabecalho                     get         tan  indices
  Pesquisa.AddReg('bmb_codigo'  ,'Código'                 ,'bmb_codigo' ,5  ,'por Código'       );
  Pesquisa.AddReg('bmb_nome'    ,'Bomba'                  ,'bmb_nome'   ,30 ,'por Nome'         );
  Pesquisa.AddReg('cmb_nome'    ,'Combustíuvel'           ,'cmb_nome'   ,15 ,'por Combustivel'  );

  Pesquisa.acessa(abt_codbmb);
  abt_codbmb.text   :=  Pesquisa.RecReg('bmb_codigo');
  edNomBmb.text     :=  Pesquisa.RecReg('bmb_nome');
  abt_codcmb.text   :=  Pesquisa.RecReg('bmb_codcmb');
  edNomCmb.text     :=  Pesquisa.RecReg('cmb_nome');
  Pesquisa.Destroy;

 end;

procedure TfrmAbastece.abt_codcmbExit(Sender: TObject);
begin
  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.trava(Sender, nNew );
  Pesquisa.sqlTabela  :=  dmEmp.sqlcomb ;
  edNomCmb.Text       :=  Pesquisa.Relacao('combustivel',abt_Codcmb,'cmb_codigo','cmb_nome');
  if ( abt_Codcmb.Text <> '' ) and ( abt_codplc.Text <> '' ) then begin

      If ChkCmbVeiculo(abt_codcmb.Text, abt_codplc.Text) then begin
         ShowMessage('O Combustível não confere com o do Veículo');
          if abt_local.ItemIndex = 0 then begin
             abt_codbmb.SetFocus;
          end Else
             abt_codcmb.SetFocus;

      end;

      if abt_local.ItemIndex = 1 then begin
          If ChkCmbPonto(abt_codcmb.Text, abt_codpab.Text, abt_ltsaut.Text, abt_datrea.Date ) then begin
             abt_codcmb.SetFocus;
          end;
      end;

  end;

end;

procedure TfrmAbastece.abt_codcmbKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      abt_codcmbRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmAbastece.abt_codcmbRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dscomb ;
  Pesquisa.sqlTabela :=  dmEmp.sqlcomb ;
  Pesquisa.cliTabela :=  dmEmp.clicomb ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Combustível';
  Pesquisa.nmTabela  := 'combustivel' ;
  //Pesquisa.NovoCad   := 'combustivel' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('cmb_codigo','Código'             ,'abt_Codcmb' ,5  ,'por Código' );
  Pesquisa.AddReg('cmb_nome'  ,'Descrição'          ,'edNomCmb' ,25 ,'por Descrição' );

  Pesquisa.acessa(abt_Codcmb);
  abt_Codcmb.text :=  Pesquisa.RecReg('cmb_codigo');
  edNomCmb.text   :=  Pesquisa.RecReg('cmb_nome');
  Pesquisa.Destroy;

 end;

procedure TfrmAbastece.abt_codigoExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlabastece ;
  abt_codplc.Text :=  Pesquisa.Relacao('abastece',abt_codigo,'abt_codigo','abt_codplc');
  navegacao(5);

end;

procedure TfrmAbastece.abt_codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END    : abt_codigoRightButtonClick(Self);
    VK_UP     : navegacao(1);
    VK_LEFT   : navegacao(2);
    VK_RIGHT  : navegacao(3);
    VK_DOWN   : navegacao(4);

  end;
Finally

End;

end;

procedure TfrmAbastece.abt_codigoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
if btnGrava.Enabled then
   Exit;

  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsabastece ;
  Pesquisa.sqlTabela :=  dmEmp.sqlabastece ;
  Pesquisa.cliTabela :=  dmEmp.cliabastece ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Movimentação de Abastecimento';
  Pesquisa.nmTabela  := 'abastece';
  //Pesquisa.NovoCad   := 'abastece' ;
  // Display        campo   cabecalho           get         tan  indices
  Pesquisa.AddReg('abt_codigo'  ,'Código'       ,'abt_codigo' , 5  ,'por Código'        );
  Pesquisa.AddReg('abt_codplc',  'Placa'        ,'abt_codplc' , 7  ,'por Placa'         );
  Pesquisa.AddReg('mdl_nome',   'Modelo'        ,'edNomMdl'  , 20  ,'por Modelo'        );
  Pesquisa.AddReg('cmb_nome',   'Modelo'        ,'cmb_nome'  , 20  ,'por Combustivel'   );
  Pesquisa.AddReg('abt_Local',  'Local'         ,'abt_Local' ,  7  ,'por Local'         );
  Pesquisa.AddReg('abt_datrea', 'Dt Realizada'  ,'abt_datrea' ,10  ,'por Dt Realizada'  );
  Pesquisa.AddReg('abt_kmaba'   ,'Km'           ,'abt_kmaba'  ,10  ,''                  );
  Pesquisa.AddReg('abt_ltsabt'  ,'litros'       ,'abt_ltsabt' , 8  ,''                  );
  Pesquisa.AddReg('abt_vlrlts'  ,'Valor Lts'    ,'abt_vlrlts' , 8  ,''                  );
  Pesquisa.AddReg('total'       ,'Total'        ,'total' ,     10  ,''                  );


  Pesquisa.acessa(abt_codigo);
  abt_codigo.text   :=  Pesquisa.RecReg('abt_codigo');
  abt_codplc.text    :=  Pesquisa.RecReg('abt_codplc');
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

procedure TfrmAbastece.abt_codpssExit(Sender: TObject);
Var
cNmDataBase: String;
Motorista: TfrmMotorista;
begin
  Motorista  := TfrmMotorista.Create;
  iF Motorista.PagaMotorista(abt_codpss) then Begin

  End;

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.trava(Sender, nNew );
  Pesquisa.sqlTabela :=  dmEmp.sqlPessoal ;
  Pesquisa.QuerySql  := ' pss_codcgo =  '+PgCodCgo('Motorista');
  edNomPss.Text :=  Pesquisa.Relacao('pessoal',abt_codpss,'pss_codigo','pss_nome');
end;

procedure TfrmAbastece.abt_codpssKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      abt_codpssRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmAbastece.abt_codpssRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsPessoal ;
  Pesquisa.sqlTabela :=  dmEmp.sqlPessoal ;
  Pesquisa.cliTabela :=  dmEmp.cliPessoal ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadstro de Pessoal/Funcionários';
  Pesquisa.nmTabela  := 'pessoal';
  Pesquisa.QuerySql  := ' pss_codcgo =  '+PgCodCgo('Motorista');

  // Display        campo   cabecalho              get            tan  indices
  Pesquisa.AddReg('pss_codigo'  ,'Código'         ,'abt_codpss'   ,5  ,'por Código'    );
  Pesquisa.AddReg('pss_nome'    ,'Nome Completo'  ,'edNompss'     ,35 ,'por Nome'      );
  Pesquisa.AddReg('pss_endereco','Endereço'       ,'pss_endereco' ,25 ,'por Endereço'  );
  Pesquisa.AddReg('pss_bairro'  ,'Endereço'       ,'pss_bairro'   ,25 ,'por Bairro'    );
  Pesquisa.AddReg('cid_nome'    ,'Cidade'         ,'cid_nome'     ,25 ,'por Cidade'    );
  Pesquisa.AddReg('pss_telef01' ,'Telefone 01'    ,'pss_telef01'  ,10 ,'por Tel 01'    );
  Pesquisa.AddReg('pss_telef02' ,'Telefone 02'    ,'pss_telef02'  ,10 ,'por Tel 02'    );
  Pesquisa.AddReg('pss_celular' ,'Celular'        ,'pss_celular'  ,10 ,'por Tel 01'    );

  Pesquisa.acessa(abt_codpss);
  abt_codpss.text   :=  Pesquisa.RecReg('pss_codigo');
  edNompss.text     :=  Pesquisa.RecReg('pss_nome');
  Pesquisa.Destroy;

 end;

procedure TfrmAbastece.abt_datreaExit(Sender: TObject);
begin
  if abt_datrea.Date < abt_dataut.Date then begin
      ShowMessage('Data de realização é menotr do que a autorizada');
     abt_datrea.SetFocus;
  end;

end;

procedure TfrmAbastece.abt_horautExit(Sender: TObject);
begin
  if abt_horaut.Text = '' then 
     abt_horaut.Text := '0';
     
     abt_horaut.Text := strzero(strtoint(abt_horaut.Text),4);
end;

procedure TfrmAbastece.abt_horreaExit(Sender: TObject);
begin
  if abt_horrea.Text = '' then 
     abt_horrea.Text := '0';
     
     abt_horrea.Text := strzero(strtoint(abt_horrea.Text),4);


  if ( abt_datrea.Date = abt_dataut.Date ) and ( abt_horrea.Text < abt_horaut.Text ) then begin
      ShowMessage('Hora de realização é menotr do que a autorizada');
     abt_horrea.SetFocus;
  end;

end;

procedure TfrmAbastece.abt_kmabaExit(Sender: TObject);
begin
  If ChkKmVeiculo(abt_Kmaba.Text, abt_codplc.Text) Then Begin
     ShowMessage('Km Inferior a atual do veiculo');
     abt_Kmaba.SetFocus;
  End;
end;

procedure TfrmAbastece.abt_kmabaKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  KmKeyEdit( Key, abt_kmaba );
  Key := #0 ;

end;

procedure TfrmAbastece.abt_localChange(Sender: TObject);
begin
localabt;
end;

procedure TfrmAbastece.abt_ltsabtExit(Sender: TObject);
begin

  if FormataNum(abt_ltsabt.Text) = 0  then begin
     ShowMessage('Quantidade Invalida!');
     abt_ltsabt.SetFocus;
     exit;
  end;

 If FormataNum(abt_ltsabt.Text) > FormataNum(abt_ltsaut.Text)   then begin
    ShowMessage('Quantidade Maior do que a autorizada');
    abt_ltsabt.SetFocus;
    exit;
 end;

 If Not ChkLtsVeiculo(abt_ltsabt.Text, abt_codplc.Text)   then begin
    ShowMessage('Quantidade Maior que a registrada no veículo');
    abt_ltsabt.SetFocus;
    exit;
 end;
 if ( abt_local.ItemIndex = 0 ) then begin
     If Not ChkStiEstoque(abt_codbmb.Text, abt_ltsabt.Text) then begin
        abt_ltsabt.SetFocus;
        exit;
     end;
 end Else Begin
   { modificar }
 End;

 calcule;
end;

procedure TfrmAbastece.abt_ltsabtKeyPress(Sender: TObject; var Key: Char);
begin
  ChkLitros( Sender, Key )
end;


procedure TfrmAbastece.abt_ltsautExit(Sender: TObject);
begin
  if FormataNum(abt_ltsaut.Text) = 0  then begin
     ShowMessage('Quantidade Invalida!');
     abt_ltsaut.SetFocus;
     exit;
  end;

 If Not ChkLtsVeiculo(abt_ltsaut.Text, abt_codplc.Text)   then begin
    ShowMessage('Quantidade Maior que a registrada no veículo');
    abt_ltsaut.SetFocus;
    exit;
 end;

 if abt_local.ItemIndex = 1 then begin
      If ChkCmbPonto(abt_codcmb.Text, abt_codpab.Text, abt_ltsaut.Text, abt_datrea.Date ) then begin
         abt_codcmb.SetFocus;
      end;
 end;

end;

procedure TfrmAbastece.abt_ltsautKeyPress(Sender: TObject; var Key: Char);
begin
  ChkLitros( Sender, key )
end;


procedure TfrmAbastece.abt_codpabExit(Sender: TObject);
begin
  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.trava(Sender, nNew );
  Pesquisa.sqlTabela  :=  dmEmp.sqlPontoAbt ;
  edNomPab.Text       :=  Pesquisa.Relacao('pontoabt',abt_codPab,'pab_codigo','pab_nome');

end;

procedure TfrmAbastece.abt_codpabKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

 Try
case key of
    VK_END:
      abt_codpabRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmAbastece.abt_codpabRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsPontoAbt ;
  Pesquisa.sqlTabela :=  dmEmp.SqlPontoAbt ;
  Pesquisa.cliTabela :=  dmEmp.cliPontoAbt ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Pontos de Abastecimento';
  Pesquisa.nmTabela  := 'pontoabt';
//  Pesquisa.NovoCad   := 'bomba' ;
  // Display        campo   cabecalho                     get         tan  indices
  Pesquisa.AddReg('pab_codigo'  ,'Código'                 ,'abt_codpab' ,5  ,'por Código'       );
  Pesquisa.AddReg('pab_nome'    ,'Ponto de Abastecimento' ,'edNomPab'   ,30 ,'por Nome'         );

  Pesquisa.acessa(abt_codpab);
  abt_codpab.text   :=  Pesquisa.RecReg('pab_codigo');
  edNomPab.text     :=  Pesquisa.RecReg('pab_nome');
  Pesquisa.Destroy;

 end;

procedure TfrmAbastece.abt_codplcExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.trava(Sender, nNew );
  Pesquisa.sqlTabela  :=  dmEmp.sqlveiculoatv ;
  edNomMdl.Text       :=  Pesquisa.Relacao('veiculoatv',abt_codplc,'vat_placa','mdl_nome'  );

end;
procedure TfrmAbastece.abt_codplcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      abt_codplcRightButtonClick(Self);
  end;
Finally

End;


end;

procedure TfrmAbastece.abt_codplcRightButtonClick(Sender: TObject);
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
  Pesquisa.QuerySql   := ' VAT_CAVALO = ''CAVALO'' AND VAT_STATUS = ''ATIVO'' ';
  // Display        campo   cabecalho           get         tan  indices
  Pesquisa.AddReg('vat_placa',  'Placa'         ,'vat_placa' ,     7  , 'por Placa'   );
  Pesquisa.AddReg('vat_nrfrota','Frota'         ,'vat_nrfrota' ,   7  , 'por Frota'   );
  Pesquisa.AddReg('mdl_nome',   'Modelo'        ,'edNomMdl' ,     25  , 'por Modelo'  );
  Pesquisa.AddReg('mrc_nome',   'Marca'         ,'' ,             25  , 'por Marca'   );
  Pesquisa.AddReg('ltd_nome',   'Lotado'        ,'' ,             25  , 'por Lotação' );
  Pesquisa.AddReg('vat_chassi', 'Chassi'        ,'' ,             17  , 'por Chassi'  );
  Pesquisa.AddReg('vat_renavan','Renavan'       ,'' ,             17  , 'por Renavan' );

  Pesquisa.acessa(abt_codplc);
  abt_codplc.text   :=  Pesquisa.RecReg('vat_placa');
  edNomMdl.text    :=  Pesquisa.RecReg('mdl_nome');
  Pesquisa.Destroy;

end;


procedure TfrmAbastece.abt_vlrltsExit(Sender: TObject);
begin
  if ( abt_local.ItemIndex = 0 ) then begin
     If Not ChkStiEstoque(abt_codbmb.Text, abt_ltsabt.Text) then begin
        abt_ltsabt.SetFocus;
        exit;
     end;
  end else begin

  end;

  calcule;
end;

procedure TfrmAbastece.abt_vlrltsKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  MoedaKeyEdit( Key, abt_vlrlts );
  Key := #0 ;
end;

procedure TfrmAbastece.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sqlNew.Close;
    dmEmp.cliabastece.Close;
    frmabastece                 := nil ;
    action                       := cafree;
    fPrincipal.btnabastece.Enabled := True;
end;



procedure TfrmAbastece.FormCreate(Sender: TObject);
Var
i: Integer;
begin
  cPre                        := 'abt_';
  cTabela                     := 'abastece';
  acampo                      := 1;
  sqlNew                      := TFDQuery.Create(nil);
  sqlNew.Connection           := dmEmp.SqlConSis;
  fPrincipal.btnabastece.Enabled  := False;
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;
end;


procedure TfrmAbastece.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmAbastece.FormShow(Sender: TObject);
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
  lbCabeca01.Caption    := 'Cadastro de abastecees';
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
  abt_codigo.SetFocus;

  btnNovo.Caption    := 'Novo'+#13 +'[F3]';
  btnAlterar.Caption := 'Editar'+#13 +'[F4]';
  btnGrava.Caption   := 'Salvar'+#13 +'[F5]';
  btnExcluir.Caption := 'Excluir'+#13 +'[Alt+Del]';
  btnCancela.Caption := 'Cancelar'+#13 +'[F12]';

end;

procedure TfrmAbastece.gravadados;
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, ctip_horalt,cCodSql, cIteSql,cValSql,cCodMnt : string ;
dData, dtip_datalt : TDate ;
i, tmp: Integer;
SQLQ : TFDQuery ;
begin
   gravadados2(cTabela,cPre,cPre+'codigo','X','', nNew, frmabastece, dmEmp.SqlConSis, aEdits );
end;

procedure TfrmAbastece.limpaget;
Var
i: Integer;
begin
  limpaget2(aEdits);
end;

procedure TfrmAbastece.localabt;
begin
abt_codbmb.Enabled := ( ( abt_local.ItemIndex = 0 ) and btnGrava.Enabled ) ;
abt_codict.Enabled := ( ( abt_local.ItemIndex = 0 ) and btnGrava.Enabled ) ;
abt_codpab.Enabled := ( ( abt_local.ItemIndex = 1 ) and btnGrava.Enabled ) ;

end;

procedure TfrmAbastece.navegacao(Ord: Integer);
begin
  if btnGrava.Enabled then
     Exit;

  navegacao2( Ord, acampo, btnIni, btnAnt, btnProx, btnUlt, sqlNew, dmEmp.sqlabastece, abt_codigo,'' );
  acampo := 0;
  RefreshDialog2(cPre,acampo, frmabastece, sqlNew, aEdits);
  acampo := 1;
  calcule;
  localabt;
end;

procedure TfrmAbastece.RefreshDados(tipo: String);
var
  i: integer;
  cWhere, cQuery, cOrder: String;

begin
  RefreshDados2(acampo, tipo,'',  abt_codigo, sqlNew, dmEmp.sqlabastece );
  lbTotal.Caption := FormatCurr('R$ #,##0.00',0);
end;


procedure TfrmAbastece.RefreshDialog;
var
  i, tmp: Integer;
  frmx : TForm ;
begin
  RefreshDialog2(cPre,acampo, frmabastece, sqlNew, aEdits);
end;

procedure TfrmAbastece.ToolButton9Click(Sender: TObject);
begin
  frmCalculadora := TfrmCalculadora.Create(Self);
  frmCalculadora.Show;

end;

procedure TfrmAbastece.ativaButoes(tipo:Integer);
begin
ativaButoes2(Tipo,  btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt, sqlNew);
end;

procedure TfrmAbastece.ativaget;
begin
  ativaget2(aEdits,cPre+'codigo',cTabela, btnGrava.Enabled, lMostra );
end;

procedure TfrmAbastece.btnAlterarExecute(Sender: TObject);
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
   abt_local.SetFocus;
   navegacao(0);

end;

procedure TfrmAbastece.btnAntExecute(Sender: TObject);
begin
  navegacao(2);
end;

procedure TfrmAbastece.btnCancelaExecute(Sender: TObject);
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

   abt_codigo.SetFocus;

end;

procedure TfrmAbastece.btnExcluirExecute(Sender: TObject);
Var
aSubTab : TArrayDim2;
n: Integer;
Autoriza: TfrmAutoiza;
begin

   Autoriza  := TfrmAutoiza.Create;
   iF Autoriza.Autorizar(Screen.ActiveForm.Caption, abt_codigo.Text, 'Excluir' ) then Begin
       //SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'acessoratv';     aSubTab[n][1] := '';
       If Exclui2(cTabela, aSubTab,  abt_codigo, btnExcluir) Then Begin;
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

procedure TfrmAbastece.btnGravaExecute(Sender: TObject);
Var
  qDel, qDel1, qSql1 : TFDQuery;
  cCodTnq, cNumAnt : String;
begin
   gravadados;
   cNumAnt  := IntToStr( strtoint( PegaUltCodSalvo( cTabela, 'abt_codigo', 'abt_' ) ) + 0 );
   IniTransacao;
   cCodTnq := '0';

   if abt_local.ItemIndex = 0 then
      cCodTnq := PgTanque(abt_codbmb.Text);

   if nNew = 1 then Begin
          // Gerando a Movimentação do Estoque
          qDel1 := TFDQuery.Create(Self);
          qDel1.Connection  := dmEmp.SqlConSis;
          qDel1.Close;
          qDel1.SQl.Text   :='insert into '+U_funcao.SelSchema('combumovim')+' ( mab_codcmb,  '+fiif(abt_local.ItemIndex = 0,'mab_codtnq', 'mab_codpab' )+',  mab_codabt,  mab_DatMov,  mab_HorMov,  mab_tipo,  mab_ltsIni,  mab_ltsmov, mab_ltsAtu, mab_usuinc, mab_datinc, mab_horinc  ) values  '+
                                                                            '  ( :mab_codcmb, :mab_codtnq,  :mab_codabt,  :mab_DatMov,  :mab_HorMov,  :mab_tipo,  :mab_ltsIni,  :mab_ltsmov, :mab_ltsAtu, :mab_usuinc, :mab_datinc, :mab_horinc )  ';

          qDel1.ParamByName('mab_codcmb').Text    := abt_codcmb.Text;
          qDel1.ParamByName('mab_codtnq').Text    := fIIF(abt_local.ItemIndex = 0,cCodTnq, abt_codpab.Text ) ;
          qDel1.ParamByName('mab_codabt').Text    := cNumAnt;
          qDel1.ParamByName('mab_DatMov').AsDate  := now ;
          qDel1.ParamByName('mab_HorMov').Text    := TimeToStr(time) ;
          qDel1.ParamByName('mab_tipo').Text      := 'S';
          qDel1.ParamByName('mab_ltsIni').AsFloat := fIIF(abt_local.ItemIndex = 0,pgEstoqueComb( StrToInt( cCodTnq)  ),0);
          qDel1.ParamByName('mab_ltsmov').AsFloat := FormataNum( abt_ltsabt.Text );
          qDel1.ParamByName('mab_ltsAtu').AsFloat := ( fIIF(abt_local.ItemIndex = 0, pgEstoqueComb( StrToInt( cCodTnq ) ), 0 ) - FormataNum( abt_ltsabt.Text ) );
          qDel1.ParamByName('mab_usuinc').Text    := sysUsuario ;
          qDel1.ParamByName('mab_datinc').AsDate  := now ;
          qDel1.ParamByName('mab_horinc').Text    := TimeToStr(time) ;
          qDel1.ExecSQL;

          if abt_local.ItemIndex = 0 then begin

              // Atualizando estoque do tanque
              qDel1.Close;
              qDel1.SQl.Text    :='UPDATE '+U_funcao.SelSchema('tanque')+' Set tnq_ltsetq = ( tnq_ltsetq - :tnq_ltsetq ),  '+
                                  ' tnq_usualt = :tnq_usualt, tnq_datalt = :tnq_datalt, tnq_horalt = :tnq_horalt  WHERE tnq_codigo = :codtnq ';
              qDel1.ParamByName('codtnq').Text       := cCodTnq;
              qDel1.ParamByName('tnq_ltsetq').AsFloat:= FormataNum( abt_ltsabt.Text );
              qDel1.ParamByName('tnq_usualt').Text   := SysUsuario ;
              qDel1.ParamByName('tnq_datalt').AsDate := now ;
              qDel1.ParamByName('tnq_horalt').Text   := TimeToStr(time) ;
              qDel1.ExecSQL;

              // Atualiza Incerrante da Bombao
              qDel1.Close;
              qDel1.SQl.Text    :='UPDATE '+U_funcao.SelSchema('incerrante')+' Set ict_nmrisa = (ict_nmrisa + 1) '+
                                 ' WHERE  ict_codbmb = :bomba and ict_datent is not null and ict_datsai is null ';
              qDel1.ParamByName('bomba').Text       := abt_codbmb.Text;
              qDel1.ExecSQL;

              // Atualiza Incerrante da Incerrante
              qDel1.Close;
              qDel1.SQl.Text    :='UPDATE '+U_funcao.SelSchema('bomba')+' Set bmb_nmrinc = (bmb_nmrinc + 1) '+
                                 ' WHERE  bmb_codigo = :bomba ';
              qDel1.ParamByName('bomba').Text       := abt_codbmb.Text;
              qDel1.ExecSQL;

          end Else Begin

              // Atualizando estoque do tanque
              qDel1.Close;
              qDel1.SQl.Text    :='UPDATE '+U_funcao.SelSchema('pontoabti')+' Set iab_qltest = ( iab_qltest + :ltsetq ), '
                                  +' iab_usualt = :usualt, iab_datalt = :datalt, iab_horalt = :horalt  '
                                  +' where iab_codpab = '+abt_codpab.Text
                                    +' and iab_codcmb = '+abt_codcmb.Text;

              qDel1.ParamByName('ltsetq').AsFloat:= FormataNum( abt_ltsabt.Text );
              qDel1.ParamByName('usualt').Text   := sysUsuario ;
              qDel1.ParamByName('datalt').AsDate := now ;
              qDel1.ParamByName('horalt').Text   := TimeToStr(time) ;
              qDel1.ExecSQL;

          End;

          // Atualiza Km do Veiciulo
          qDel1.Close;
          qDel1.SQl.Text    :='UPDATE '+U_funcao.SelSchema('veiculoatv')+' Set vat_kmatu = :kmatu WHERE vat_placa = :placa ';
          qDel1.ParamByName('placa').Text       := abt_codplc.Text;
          qDel1.ParamByName('kmatu').AsFloat    := FormataNum(  abt_kmaba.Text );
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
   abt_codigo.SetFocus;
   localabt;
end;

procedure TfrmAbastece.btnIniExecute(Sender: TObject);
begin
  navegacao(1);
end;

procedure TfrmAbastece.btnNovoExecute(Sender: TObject);
begin
   acampo := 1;
   nNew   := acampo;
   btnGrava.Enabled := True;
   RefreshDados('S');
   limpaget;
   ativaButoes(1);
   lMostra := False;
   ativaget;
   abt_local.SetFocus;
   localabt;

end;

procedure TfrmAbastece.btnProxExecute(Sender: TObject);
begin
  navegacao(3);
end;

procedure TfrmAbastece.btnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmAbastece.btnUltExecute(Sender: TObject);
begin
  navegacao(4);
end;

Procedure TfrmAbastece.calcule;
Var
 Total: Double;
begin
  Total           := ( FormataNum(abt_vlrlts.Text) *  FormataNum( abt_ltsabt.Text ) ) ;
  lbTotal.Caption := FormatCurr('R$ #,##0.00',Total);
end;

initialization
  RegisterClass(TfrmAbastece);


end.
