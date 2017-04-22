unit U_Multa;

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
  TfrmMulta = class(TForm)
    StatusBar1: TStatusBar;
    Banner: TPanel;
    imgLogo: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    mlt_codigo: TButtonedEdit;
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
    mlt_codogt: TButtonedEdit;
    Label2: TLabel;
    Label3: TLabel;
    edNomOgt: TEdit;
    mlt_codplc: TButtonedEdit;
    Label15: TLabel;
    edNomMdl: TEdit;
    Label23: TLabel;
    mlt_codpss: TButtonedEdit;
    Label4: TLabel;
    edNomPss: TEdit;
    Label5: TLabel;
    mlt_codcid: TButtonedEdit;
    Label6: TLabel;
    edNomCid: TEdit;
    Label7: TLabel;
    mlt_datems: TDateTimePicker;
    Label27: TLabel;
    mlt_datvnc: TDateTimePicker;
    Label9: TLabel;
    Label10: TLabel;
    mlt_vlrinf: TMaskEdit;
    mlt_codtmt: TButtonedEdit;
    Label19: TLabel;
    edNomTmt: TEdit;
    Label20: TLabel;
    mlt_autinf: TEdit;
    Label13: TLabel;
    Label16: TLabel;
    mlt_datinf: TDateTimePicker;
    Label17: TLabel;
    mlt_horinf: TMaskEdit;
    Label21: TLabel;
    edNomNat: TLabel;
    Label22: TLabel;
    edNomPnt: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    edNomArt: TLabel;
    mlt_local: TEdit;
    Label29: TLabel;
    mlt_datpdf: TDateTimePicker;
    Label8: TLabel;
    edNomSig: TEdit;
    Label11: TLabel;
    edNomUf: TEdit;
    Label12: TLabel;
    mlt_boleto: TEdit;
    Label14: TLabel;
    mlt_codfcd: TButtonedEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    Procedure RefreshDialog;
    Procedure RefreshDados(tipo: String);
    procedure mlt_codigoExit(Sender: TObject);
    procedure mlt_codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mlt_codigoRightButtonClick(Sender: TObject);
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
    procedure mlt_codogtRightButtonClick(Sender: TObject);
    procedure mlt_codogtKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mlt_codogtExit(Sender: TObject);
    procedure mlt_codplcRightButtonClick(Sender: TObject);
    procedure mlt_codplcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mlt_codplcExit(Sender: TObject);
    procedure mlt_codpssRightButtonClick(Sender: TObject);
    procedure mlt_codpssKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mlt_codpssExit(Sender: TObject);
    procedure mlt_codcidRightButtonClick(Sender: TObject);
    procedure mlt_codcidKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mlt_codcidExit(Sender: TObject);
    procedure mlt_datvncExit(Sender: TObject);
    procedure mlt_vlrinfKeyPress(Sender: TObject; var Key: Char);
    procedure mlt_codtmtRightButtonClick(Sender: TObject);
    procedure mlt_codtmtKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mlt_codtmtExit(Sender: TObject);
    procedure mlt_datemsExit(Sender: TObject);
    procedure mlt_datpdfExit(Sender: TObject);
    procedure mlt_horinfExit(Sender: TObject);
    procedure mlt_autinfExit(Sender: TObject);

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
  frmMulta: TfrmMulta;
  modConsulta, nOrdem : integer;


implementation

uses  UCalculadora,  u_DmEmp, uSistema, U_funcao, U_CnpjClass,
  U_ClassconsContas, U_ClassConsMotorista ;

{$R *.dfm}

procedure TfrmMulta.mlt_codogtExit(Sender: TObject);
begin
  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela  :=  dmEmp.sqlorgtrans ;
  edNomOgt.Text       :=  Pesquisa.Relacao('orgtrans',mlt_codogt,'ogt_codigo','ogt_nome');
  edNomSig.Text       :=  Pesquisa.Relacao('orgtrans',mlt_codogt,'ogt_codigo','ogt_sigla'  );

end;

procedure TfrmMulta.mlt_codogtKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      mlt_codogtRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmMulta.mlt_codogtRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsorgtrans ;
  Pesquisa.sqlTabela :=  dmEmp.Sqlorgtrans ;
  Pesquisa.cliTabela :=  dmEmp.cliorgtrans ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Orgãos de trânsito';
  Pesquisa.nmTabela  := 'orgtrans';
//  Pesquisa.NovoCad   := 'orgtrans' ;
  // Display        campo   cabecalho                     get         tan  indices
  Pesquisa.AddReg('ogt_codigo'  ,'Código'                 ,'ogt_codigo' ,5  ,'por Código'  );
  Pesquisa.AddReg('ogt_nome'    ,'Orgão de Transito'      ,'edNomOgt'   ,30 ,'por Orgão'   );
  Pesquisa.AddReg('ogt_sigla'   ,'Sigla'                  ,'edNomSig'   ,15 ,'por Sigla'   );

  Pesquisa.acessa(mlt_codogt);
  mlt_codogt.text   :=  Pesquisa.RecReg('ogt_codigo');
  edNomOgt.text     :=  Pesquisa.RecReg('ogt_nome');
  edNomSig.text     :=  Pesquisa.RecReg('ogt_sigla');
  Pesquisa.Destroy;

 end;

procedure TfrmMulta.mlt_autinfExit(Sender: TObject);
begin
  mlt_autinf.Text := StrZero(StrToInt(mlt_autinf.Text),mlt_autinf.MaxLength)
end;

procedure TfrmMulta.mlt_codcidExit(Sender: TObject);
begin
  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela  :=  dmEmp.sqlcidade ;
  edNomCid.Text       :=  Pesquisa.Relacao('cidade',mlt_codcid,'cid_codigo','cid_nome');
  edNomUf.Text        :=  Pesquisa.Relacao('cidade',mlt_codcid,'cid_codigo','est_Uf');

end;

procedure TfrmMulta.mlt_codcidKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      mlt_codcidRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmMulta.mlt_codcidRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dscidade ;
  Pesquisa.sqlTabela :=  dmEmp.sqlcidade ;
  Pesquisa.cliTabela :=  dmEmp.clicidade ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Cadastro de Cidade';
  Pesquisa.nmTabela  := 'cidade' ;
  //Pesquisa.NovoCad   := 'cidade' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('cid_codigo','Código'             ,'mlt_codcid' ,5  ,'por Código' );
  Pesquisa.AddReg('cid_nome'  ,'Descrição'          ,'edNomCid'   ,25 ,'por Cidade' );

  Pesquisa.acessa(mlt_codcid);
  mlt_codcid.text :=  Pesquisa.RecReg('cid_codigo');
  edNomCid.text   :=  Pesquisa.RecReg('cid_nome');
  edNomUf.text    :=  Pesquisa.RecReg('est_Uf');
  Pesquisa.Destroy;

 end;

procedure TfrmMulta.mlt_codigoExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlmulta ;
  mlt_codplc.Text :=  Pesquisa.Relacao('multa',mlt_codigo,'mlt_codigo','mlt_codplc');
  navegacao(5);

end;

procedure TfrmMulta.mlt_codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END    : mlt_codigoRightButtonClick(Self);
    VK_UP     : navegacao(1);
    VK_LEFT   : navegacao(2);
    VK_RIGHT  : navegacao(3);
    VK_DOWN   : navegacao(4);

  end;
Finally

End;

end;

procedure TfrmMulta.mlt_codigoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
if btnGrava.Enabled then
   Exit;

  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsmulta ;
  Pesquisa.sqlTabela :=  dmEmp.sqlmulta ;
  Pesquisa.cliTabela :=  dmEmp.climulta ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Movimentação de Multa';
  Pesquisa.nmTabela  := 'multa';
  //Pesquisa.NovoCad   := 'multa' ;
  // Display        campo   cabecalho           get         tan  indices
  Pesquisa.AddReg('mlt_codigo', 'Código'        ,'mlt_codigo' ,  5 ,'por Nosso Nr'        );
  Pesquisa.AddReg('mlt_autinf', 'Nr Auto'       ,'mlt_autinf' , 10 ,'por Auto de Infração');
  Pesquisa.AddReg('mlt_datinf', 'Dt Infração'   ,'mlt_datinf' , 10 ,'por Data Infração'   );
  Pesquisa.AddReg('mlt_codplc', 'Placa'         ,'mlt_codplc' ,  7 ,'por Placa'           );
  Pesquisa.AddReg('tmt_nome',   'infração'      ,'edNomMdl'   , 20 ,'por Infração'        );
  Pesquisa.AddReg('mlt_Local',  'Local'         ,'mlt_Local'  , 20 ,'por Local'           );
  Pesquisa.AddReg('pss_nome',   'Motorista'     ,'edNomPss'   , 20 ,'por Motorista'       );


  Pesquisa.acessa(mlt_codigo);
  mlt_codigo.text   :=  Pesquisa.RecReg('mlt_codigo');
  mlt_codplc.text   :=  Pesquisa.RecReg('mlt_codplc');
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

procedure TfrmMulta.mlt_codpssExit(Sender: TObject);
Var
cNmDataBase: String;
Motorista: TfrmMotorista;
begin
  Motorista  := TfrmMotorista.Create;
  iF Motorista.PagaMotorista(mlt_codpss) then Begin

  End;

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlPessoal ;
  Pesquisa.QuerySql  := ' pss_codcgo =  '+PgCodCgo('Motorista');
  edNomPss.Text :=  Pesquisa.Relacao('pessoal',mlt_codpss,'pss_codigo','pss_nome');
end;

procedure TfrmMulta.mlt_codpssKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      mlt_codpssRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmMulta.mlt_codpssRightButtonClick(Sender: TObject);
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
  Pesquisa.AddReg('pss_codigo'  ,'Código'         ,'mlt_codpss'   ,5  ,'por Código'    );
  Pesquisa.AddReg('pss_nome'    ,'Nome Completo'  ,'edNompss'     ,35 ,'por Nome'      );
  Pesquisa.AddReg('pss_endereco','Endereço'       ,'pss_endereco' ,25 ,'por Endereço'  );
  Pesquisa.AddReg('pss_bairro'  ,'Endereço'       ,'pss_bairro'   ,25 ,'por Bairro'    );
  Pesquisa.AddReg('cid_nome'    ,'Cidade'         ,'cid_nome'     ,25 ,'por Cidade'    );
  Pesquisa.AddReg('pss_telef01' ,'Telefone 01'    ,'pss_telef01'  ,10 ,'por Tel 01'    );
  Pesquisa.AddReg('pss_telef02' ,'Telefone 02'    ,'pss_telef02'  ,10 ,'por Tel 02'    );
  Pesquisa.AddReg('pss_celular' ,'Celular'        ,'pss_celular'  ,10 ,'por Tel 01'    );

  Pesquisa.acessa(mlt_codpss);
  mlt_codpss.text   :=  Pesquisa.RecReg('pss_codigo');
  edNompss.text     :=  Pesquisa.RecReg('pss_nome');
  Pesquisa.Destroy;

 end;

procedure TfrmMulta.mlt_datemsExit(Sender: TObject);
begin
  if  mlt_datinf.Date > mlt_datems.Date then begin
      ShowMessage('Data de infração é maior do que a emissão');
      mlt_datems.SetFocus;
  end;

end;

procedure TfrmMulta.mlt_datpdfExit(Sender: TObject);
begin
  if mlt_datpdf.Date < mlt_datems.Date then begin
      ShowMessage('Data de Defesa prévia é manor do que a emissão');
      mlt_datpdf.SetFocus;
  end;

end;

procedure TfrmMulta.mlt_datvncExit(Sender: TObject);
begin
  if mlt_datvnc.Date < mlt_datems.Date then begin
      ShowMessage('Data de Vencimento é manor do que a emissão');
      mlt_datvnc.SetFocus;
  end;

end;

procedure TfrmMulta.mlt_horinfExit(Sender: TObject);
begin
  ChkHora( Sender );
end;

procedure TfrmMulta.mlt_codtmtExit(Sender: TObject);
begin
  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela  :=  dmEmp.sqltabmulta ;
  edNomTmt.Text       :=  Pesquisa.Relacao('tabmulta',mlt_codtmt,'tmt_codigo','tmt_nome');
  edNomArt.Caption    :=  Pesquisa.Relacao('tabmulta',mlt_codtmt,'tmt_codigo','tmt_ampleg');
  edNomNat.Caption    :=  Pesquisa.Relacao('tabmulta',mlt_codtmt,'tmt_codigo','tmt_gravid');
  edNomPnt.Caption    :=  Pesquisa.Relacao('tabmulta',mlt_codtmt,'tmt_codigo','tmt_nmrpts');
  mlt_vlrinf.Text     :=  FormatCurr('R$ ###,##0.00', FormataNum(Pesquisa.Relacao('tabmulta',mlt_codtmt,'tmt_codigo','tmt_vlrmul')))

end;

procedure TfrmMulta.mlt_codtmtKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

 Try
case key of
    VK_END:
      mlt_codtmtRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmMulta.mlt_codtmtRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dstabmulta ;
  Pesquisa.sqlTabela :=  dmEmp.Sqltabmulta ;
  Pesquisa.cliTabela :=  dmEmp.clitabmulta ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Infrações';
  Pesquisa.nmTabela  := 'tabmulta';
  // Pesquisa.NovoCad   := 'orgtrans' ;
  // Display        campo   cabecalho                     get         tan  indices
  Pesquisa.AddReg('tmt_codigo'  ,'Código'                 ,'mlt_codtmt'   ,5  ,'por Código'       );
  Pesquisa.AddReg('tmt_nome'    ,'Infração'               ,'edNomTmt'    ,50 ,'por Nome'         );
  Pesquisa.AddReg('tmt_gravid'  ,'Natureza'               ,'tmt_gravid'  ,50 ,'por Natureza'     );
  Pesquisa.AddReg('tmt_nmrpts'  ,'Pontos'                 ,'tmt_nmrpts'  ,50 ,'por Pontos'     );

  Pesquisa.acessa(mlt_codtmt);
  mlt_codtmt.text   :=  Pesquisa.RecReg('tmt_codigo');
  edNomTmt.text     :=  Pesquisa.RecReg('tmt_nome');
  Pesquisa.Destroy;

 end;

procedure TfrmMulta.mlt_codplcExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela  :=  dmEmp.sqlveiculoatv ;
  edNomMdl.Text       :=  Pesquisa.Relacao('veiculoatv',mlt_codplc,'vat_placa','mdl_nome'  );

end;
procedure TfrmMulta.mlt_codplcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      mlt_codplcRightButtonClick(Self);
  end;
Finally

End;


end;

procedure TfrmMulta.mlt_codplcRightButtonClick(Sender: TObject);
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
  Pesquisa.QuerySql   := ' VAT_STATUS = ''ATIVO'' ';
  // Display        campo   cabecalho           get         tan  indices
  Pesquisa.AddReg('vat_placa',  'Placa'         ,'vat_placa' ,     7  , 'por Placa'   );
  Pesquisa.AddReg('vat_nrfrota','Frota'         ,'vat_nrfrota' ,   7  , 'por Frota'   );
  Pesquisa.AddReg('mdl_nome',   'Modelo'        ,'edNomMdl' ,     25  , 'por Modelo'  );
  Pesquisa.AddReg('mrc_nome',   'Marca'         ,'' ,             25  , 'por Marca'   );
  Pesquisa.AddReg('ltd_nome',   'Lotado'        ,'' ,             25  , 'por Lotação' );
  Pesquisa.AddReg('vat_chassi', 'Chassi'        ,'' ,             17  , 'por Chassi'  );
  Pesquisa.AddReg('vat_renavan','Renavan'       ,'' ,             17  , 'por Renavan' );

  Pesquisa.acessa(mlt_codplc);
  mlt_codplc.text   :=  Pesquisa.RecReg('vat_placa');
  edNomMdl.text    :=  Pesquisa.RecReg('mdl_nome');
  Pesquisa.Destroy;

end;


procedure TfrmMulta.mlt_vlrinfKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  MoedaKeyEdit( Key, mlt_vlrinf );
  Key := #0 ;
end;

procedure TfrmMulta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sqlNew.Close;
    dmEmp.climulta.Close;
    frmmulta                 := nil ;
    action                       := cafree;
    fPrincipal.btnmulta.Enabled := True;
end;



procedure TfrmMulta.FormCreate(Sender: TObject);
Var
i: Integer;
begin
  cPre                        := 'mlt_';
  cTabela                     := 'multa';
  acampo                      := 1;
  sqlNew                      := TFDQuery.Create(nil);
  sqlNew.Connection           := dmEmp.SqlConSis;
  fPrincipal.btnmulta.Enabled  := False;
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;
end;


procedure TfrmMulta.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmMulta.FormShow(Sender: TObject);
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
  lbCabeca01.Caption    := 'Movimentação de Multas';
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
  mlt_codigo.SetFocus;

  btnNovo.Caption    := 'Novo'+#13 +'[F3]';
  btnAlterar.Caption := 'Editar'+#13 +'[F4]';
  btnGrava.Caption   := 'Salvar'+#13 +'[F5]';
  btnExcluir.Caption := 'Excluir'+#13 +'[Alt+Del]';
  btnCancela.Caption := 'Cancelar'+#13 +'[F12]';

end;

procedure TfrmMulta.gravadados;
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, ctip_horalt,cCodSql, cIteSql,cValSql,cCodMnt : string ;
dData, dtip_datalt : TDate ;
i, tmp: Integer;
SQLQ : TFDQuery ;
begin
   gravadados2(cTabela,cPre,cPre+'codigo','X','', nNew, frmmulta, dmEmp.SqlConSis, aEdits );
end;

procedure TfrmMulta.limpaget;
Var
i: Integer;
begin
  limpaget2(aEdits);
end;

procedure TfrmMulta.navegacao(Ord: Integer);
begin
  if btnGrava.Enabled then
     Exit;

  navegacao2( Ord, acampo, btnIni, btnAnt, btnProx, btnUlt, sqlNew, dmEmp.sqlmulta, mlt_codigo,'' );
  acampo := 0;
  RefreshDialog2(cPre,acampo, frmmulta, sqlNew, aEdits);
  acampo := 1;
end;

procedure TfrmMulta.RefreshDados(tipo: String);
var
  i: integer;
  cWhere, cQuery, cOrder: String;

begin
  RefreshDados2(acampo, tipo, '', mlt_codigo, sqlNew, dmEmp.sqlmulta );
end;


procedure TfrmMulta.RefreshDialog;
var
  i, tmp: Integer;
  frmx : TForm ;
begin
  RefreshDialog2(cPre,acampo, frmmulta, sqlNew, aEdits);
end;

procedure TfrmMulta.ativaButoes(tipo:Integer);
begin
ativaButoes2(Tipo,  btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt, sqlNew);
end;

procedure TfrmMulta.ativaget;
begin
  ativaget2(aEdits,cPre+'codigo',cTabela, btnGrava.Enabled, lMostra );
end;

procedure TfrmMulta.btnAlterarExecute(Sender: TObject);
begin
   ShowMessage('Não é possivel alterar o Registro');
  {
   btnNovo.Enabled    := False;
   btnAlterar.Enabled := False;
   btnGrava.Enabled   := True;
   ativaButoes(1);
   lMostra := True;
   ativaget;
   acampo := 0;
   nNew   := acampo;
   RefreshDialog;
   mlt_autinf.SetFocus;
   navegacao(0);
   }
end;

procedure TfrmMulta.btnAntExecute(Sender: TObject);
begin
  navegacao(2);
end;

procedure TfrmMulta.btnCancelaExecute(Sender: TObject);
begin
   acampo := 0;
   nNew             := acampo;
   acampo := 1;
   nNew             := acampo;
   btnNovo.Enabled  := True;
   btnGrava.Enabled := False;
   RefreshDados('T');
   ativaButoes(1);
   lMostra := True;
   ativaget;
   navegacao(4);

   mlt_codigo.SetFocus;

end;

procedure TfrmMulta.btnExcluirExecute(Sender: TObject);
Var
aSubTab : TArrayDim2;
n: Integer;
begin
   SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'multa';          aSubTab[n][1] := 'mlt_codfcd';
   SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'financeiro';     aSubTab[n][1] := 'fcr_codcfr';
   SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'financecab';     aSubTab[n][1] := 'cfr_codigo';
   If Exclui2(cTabela, aSubTab,  mlt_codfcd, btnExcluir) Then Begin;
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

procedure TfrmMulta.btnGravaExecute(Sender: TObject);
Var
  qDel, qDel1, qSql1, qSql2, qSql3 : TFDQuery;
  cCodTnq, cNumAntMult, cNumAntFin, cPConta, cDescri : String;
begin
   cDescri  :='Multa do veículo '+mlt_codplc.Text ;

   // Pega o plano de contas que esta no orgão expedidor
   qSql2    := TFDQuery.Create(Nil);
   qSql2.Close;
   qSql2.Connection  := dmEmp.SqlConSis;
   qSql2.SQL.Text    := 'SELECT * from '+U_funcao.SelSchema('orgtrans')+' where ogt_codigo = '+mlt_codogt.Text+' ';
   qSql2.Open;
   if qSql2.FieldByName('ogt_codpct').Text = '' then begin
      ShowMessage('Não há plano de contas cadastrado no Orgão de Trânsito ');
      exit;
   end;

   // Pega o plano de contas que esta no Cadastro de Cliente - Vale:
   qSql3    := TFDQuery.Create(Nil);
   qSql3.Close;
   qSql3.Connection  := dmEmp.SqlConSis;
   qSql3.SQL.Text    := 'SELECT * from '+U_funcao.SelSchema('pessoal')+' where pss_codigo = '+mlt_codpss.Text+' ';
   qSql3.Open;
   if qSql3.FieldByName('pss_codpcv').Text = '' then begin
      ShowMessage('Não há plano de contas cadastrado no motorista ');
      RollBack;
      exit;
   end;


   gravadados;
   cNumAntMult  := IntToStr( strtoint( PegaUltCodSalvo( cTabela, 'mlt_codigo', 'mlt_' ) ) + 0 );
   IniTransacao;
   cCodTnq := '0';

   if nNew = 1 then Begin

      // Gerando contas a Pagar  - Cabeçalho [DÉBITO PARA EMPRESA PAGAR]
      qDel1    := TFDQuery.Create(Nil);
      qSql1    := TFDQuery.Create(Nil);
      qDel1.Connection := dmEmp.SqlConSis;
      qSql1.Connection := dmEmp.SqlConSis;
      qSql1.Close;
      qSql1.SQL.Text   := 'Insert Into '+U_funcao.SelSchema('financecab')+
                                      '( cfr_NumDoc, cfr_codant, cfr_codpct, '+
                                      '  cfr_descri, cfr_DatEms, cfr_DatVen, cfr_TotPar, cfr_TipDoc,  '+
                                      '  cfr_vlrApg, cfr_vlrDes, cfr_vlrAcr, cfr_vlrTot, cfr_UsuInc, cfr_DatInc, cfr_HorInc ) Values  '+
                                     '( :cfr_NumDoc, :cfr_codant, :cfr_codpct, '+
                                      ' :cfr_descri, :cfr_DatEms, :cfr_DatVen, :cfr_TotPar, :cfr_TipDoc,  '+
                                      ' :cfr_vlrApg, :cfr_vlrDes, :cfr_vlrAcr, :cfr_vlrTot, :cfr_UsuInc, :cfr_DatInc, :cfr_HorInc ) ';
      qSql1.ParamByName('cfr_NumDoc').Text     := mlt_autinf.Text ;
      qSql1.ParamByName('cfr_codant').AsInteger:= StrToInt( cNumAntMult ) ;
      //qSql1.ParamByName('cfr_codfnd').Text     := cpc_codfnd.Text ;
      qSql1.ParamByName('cfr_codpct').Text     := qSql2.FieldByName('ogt_codpct').Text ;
      qSql1.ParamByName('cfr_descri').Text     := 'Pagamento '+cDescri;
      qSql1.ParamByName('cfr_DatEms').AsDate   := mlt_DatEms.Date ;
      qSql1.ParamByName('cfr_DatVen').AsDate   := mlt_DatEms.Date ;
      qSql1.ParamByName('cfr_TotPar').Text     := '1';
      qSql1.ParamByName('cfr_TipDoc').Text     := 'D';
      qSql1.ParamByName('cfr_vlrApg').AsFloat  := FormataNum(mlt_vlrinf.Text );
      qSql1.ParamByName('cfr_vlrDes').AsFloat  := 0;
      qSql1.ParamByName('cfr_vlrAcr').AsFloat  := 0;
      qSql1.ParamByName('cfr_vlrTot').AsFloat  := FormataNum(mlt_vlrinf.Text );
      qSql1.ParamByName('cfr_UsuInc').Text     :=  sysUsuario;
      qSql1.ParamByName('cfr_DatInc').AsDate   := Now;
      qSql1.ParamByName('cfr_HorInc').Text     := TimeToStr(Now);
      qSql1.ExecSQL;
      cNumAntFin  := PegaUltCodSalvo( 'financecab', 'cfr_codigo', 'cfr_' );

          // Gravar na multa o codifo financeiro
          // Atualizando estoque do tanque
          qDel1.Close;
          qDel1.SQl.Text    :='UPDATE '+U_funcao.SelSchema('multa')+' Set mlt_codfcd = :mlt_codfcd  WHERE mlt_codigo = :mlt_codigo ';
          qDel1.ParamByName('mlt_codfcd').AsInteger := StrToInt( cNumAntFin );
          qDel1.ParamByName('mlt_codigo').AsInteger := StrToInt( cNumAntMult );
          qDel1.ExecSQL;


      // Grava as parcelas
      qSql1.Connection := dmEmp.SqlConSis;
      qSql1.Close;
      qSql1.SQL.Text   := 'Insert Into '+U_funcao.SelSchema('financeiro')+
                                      '( fcr_descri,  fcr_DatVen,  fcr_NumPar,  fcr_Status,  fcr_tippro,  fcr_codcfr, '+
                                      '  fcr_vlrApg,  fcr_NumBol,  fcr_UsuInc,  fcr_DatInc,  fcr_HorInc ) Values  '+
                                     '( :fcr_descri, :fcr_DatVen, :fcr_NumPar, :fcr_Status, :fcr_tippro, :fcr_codcfr, '+
                                      ' :fcr_vlrApg, :fcr_NumBol,  :fcr_UsuInc, :fcr_DatInc, :fcr_HorInc ) ';
      qSql1.ParamByName('fcr_descri').Text     := '[Pc 1/1] '+cDescri ;
      qSql1.ParamByName('fcr_DatVen').AsDate   := mlt_datvnc.Date;
      qSql1.ParamByName('fcr_NumPar').Text     := '1';
      qSql1.ParamByName('fcr_Status').Text     := 'CXA';
      qSql1.ParamByName('fcr_tippro').Text     := 'LAN';
      qSql1.ParamByName('fcr_codcfr').AsInteger:= StrToInt( cNumAntFin );
      qSql1.ParamByName('fcr_vlrApg').AsFloat  := FormataNum(mlt_vlrinf.Text ) ;
      qSql1.ParamByName('fcr_NumBol').Text     := mlt_boleto.Text    ;
      qSql1.ParamByName('fcr_UsuInc').Text     :=  sysUsuario;
      qSql1.ParamByName('fcr_DatInc').AsDate   := Now;
      qSql1.ParamByName('fcr_HorInc').Text     := TimeToStr(Now);
      qSql1.ExecSQL;
      {*******************************************************************************************************************}
      {*******************************************************************************************************************}
      {*******************************************************************************************************************}

      cDescri  :='Multa do Motorista: '+edNomPss.Text ;
      // Gerando contas a Pagar  - Cabeçalho [CREDITO PARA A EMPRESA EM NOME DO MOTORISTA]
      qSql1    := TFDQuery.Create(Nil);
      qSql1.Connection := dmEmp.SqlConSis;
      qSql1.Close;
      qSql1.SQL.Text   := 'Insert Into '+U_funcao.SelSchema('financecab')+
                                      '( cfr_NumDoc, cfr_codant, cfr_codpss, cfr_codpct, '+
                                      '  cfr_descri, cfr_DatEms, cfr_DatVen, cfr_TotPar, cfr_TipDoc,  '+
                                      '  cfr_vlrApg, cfr_vlrDes, cfr_vlrAcr, cfr_vlrTot, cfr_UsuInc, cfr_DatInc, cfr_HorInc ) Values  '+
                                     '( :cfr_NumDoc, :cfr_codant, :cfr_codpss, :cfr_codpct, '+
                                      ' :cfr_descri, :cfr_DatEms, :cfr_DatVen, :cfr_TotPar, :cfr_TipDoc,  '+
                                      ' :cfr_vlrApg, :cfr_vlrDes, :cfr_vlrAcr, :cfr_vlrTot, :cfr_UsuInc, :cfr_DatInc, :cfr_HorInc ) ';
      qSql1.ParamByName('cfr_NumDoc').Text     := mlt_autinf.Text ;
      qSql1.ParamByName('cfr_codant').AsInteger:= StrToInt( cNumAntMult );
      qSql1.ParamByName('cfr_codpss').AsInteger:= StrToInt( mlt_codpss.Text ) ;
      qSql1.ParamByName('cfr_codpct').Text     := qSql3.FieldByName('pss_codpcv').Text ;
      qSql1.ParamByName('cfr_descri').Text     := 'Recebimento: '+cDescri;
      qSql1.ParamByName('cfr_DatEms').AsDate   := mlt_DatEms.Date ;
      qSql1.ParamByName('cfr_DatVen').AsDate   := mlt_DatEms.Date ;
      qSql1.ParamByName('cfr_TotPar').Text     := '1';
      qSql1.ParamByName('cfr_TipDoc').Text     := 'C';
      qSql1.ParamByName('cfr_vlrApg').AsFloat  := FormataNum( mlt_vlrinf.Text );
      qSql1.ParamByName('cfr_vlrDes').AsFloat  := 0;
      qSql1.ParamByName('cfr_vlrAcr').AsFloat  := 0;
      qSql1.ParamByName('cfr_vlrTot').AsFloat  := FormataNum( mlt_vlrinf.Text );
      qSql1.ParamByName('cfr_UsuInc').Text     :=  sysUsuario;
      qSql1.ParamByName('cfr_DatInc').AsDate   := Now;
      qSql1.ParamByName('cfr_HorInc').Text     := TimeToStr(Now);
      qSql1.ExecSQL;
      cNumAntFin  := PegaUltCodSalvo( 'financecab', 'cfr_codigo', 'cfr_' );

          // Gravar na multa o codifo financeiro
          // Atualizando estoque do tanque
          qDel1.Close;
          qDel1.SQl.Text    :='UPDATE '+U_funcao.SelSchema('multa')+' Set mlt_codfcd = :mlt_codfcd  WHERE mlt_codigo = :mlt_codigo ';
          qDel1.ParamByName('mlt_codfcd').AsInteger := StrToInt( cNumAntFin );
          qDel1.ParamByName('mlt_codigo').AsInteger := StrToInt( cNumAntMult );
          qDel1.ExecSQL;


      // Grava as parcelas
      qSql1.Connection := dmEmp.SqlConSis;
      qSql1.Close;
      qSql1.SQL.Text   := 'Insert Into '+U_funcao.SelSchema('financeiro')+
                                      '( fcr_descri,  fcr_DatVen,  fcr_NumPar,  fcr_Status,  fcr_tippro,  fcr_codcfr, '+
                                      '  fcr_vlrApg,  fcr_NumBol,  fcr_UsuInc,  fcr_DatInc,  fcr_HorInc ) Values  '+
                                     '( :fcr_descri, :fcr_DatVen, :fcr_NumPar, :fcr_Status, :fcr_tippro, :fcr_codcfr, '+
                                      ' :fcr_vlrApg, :fcr_NumBol,  :fcr_UsuInc, :fcr_DatInc, :fcr_HorInc ) ';
      qSql1.ParamByName('fcr_descri').Text     := '[Rc 1/1] '+cDescri ;
      qSql1.ParamByName('fcr_DatVen').AsDate   := mlt_datvnc.Date;
      qSql1.ParamByName('fcr_NumPar').Text     := '1';
      qSql1.ParamByName('fcr_Status').Text     := 'CXA';
      qSql1.ParamByName('fcr_tippro').Text     := 'LAN';
      qSql1.ParamByName('fcr_codcfr').AsInteger:= StrToInt( cNumAntFin );
      qSql1.ParamByName('fcr_vlrApg').AsFloat  := FormataNum(mlt_vlrinf.Text ) ;
      qSql1.ParamByName('fcr_NumBol').Text     := mlt_boleto.Text    ;
      qSql1.ParamByName('fcr_UsuInc').Text     :=  sysUsuario;
      qSql1.ParamByName('fcr_DatInc').AsDate   := Now;
      qSql1.ParamByName('fcr_HorInc').Text     := TimeToStr(Now);
      qSql1.ExecSQL;



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
   mlt_codigo.SetFocus;
end;

procedure TfrmMulta.btnIniExecute(Sender: TObject);
begin
  navegacao(1);
end;

procedure TfrmMulta.btnNovoExecute(Sender: TObject);
begin
   acampo := 1;
   nNew   := acampo;
   btnGrava.Enabled := True;
   RefreshDados('S');
   limpaget;
   ativaButoes(1);
   lMostra := False;
   ativaget;
   mlt_autinf.SetFocus;

end;

procedure TfrmMulta.btnProxExecute(Sender: TObject);
begin
  navegacao(3);
end;

procedure TfrmMulta.btnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmMulta.btnUltExecute(Sender: TObject);
begin
  navegacao(4);
end;

initialization
  RegisterClass(TfrmMulta);

end.
