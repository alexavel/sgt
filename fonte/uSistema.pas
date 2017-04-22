Unit uSistema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ExtCtrls, ImgList, ToolWin, IniFiles,
  dbTables, FMTBcd, DB, SqlExpr, jpeg, RibbonLunaStyleActnCtrls,
  Ribbon, ActnMan, ActnCtrls, ActnMenus, RibbonActnMenus, ActnList,
  RibbonSilverStyleActnCtrls, Buttons, StdCtrls,
  RibbonObsidianStyleActnCtrls, StdActns,
  PlatformDefaultStyleActnCtrls, System.Actions, Vcl.XPStyleActnCtrls, MIDASLIB, ZDataset,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IdHashMessageDigest, frxClass, frxBarcode, Vcl.Imaging.pngimage,
  IdIPWatch, DateUtils, IdExplicitTLSClientServerBase, IdFTP, Vcl.AppEvnts,
  RibbonMDIFix , SHDocVw, Xml.xmldom, Xml.XMLIntf, Xml.Win.msxmldom, Xml.XMLDoc,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  System.ImageList, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client ;

Type {Tipos criados}
  TArrayComp = array of TComponent;

type
  TfPrincipal = class(TForm)
    stbSistema: TStatusBar;
    tmSistemas: TTimer;
    imgList_Btn_Sistemas: TImageList;
    ImgList_Mn_Sistemas: TImageList;
    ActSys: TActionManager;
    btnConfigura: TAction;
    btnGrupo: TAction;
    btnNivel: TAction;
    btnUsuario: TAction;
    btnSair: TAction;
    btnCidade: TAction;
    btnEmpresa: TAction;
    MudaEmpresa: TAction;
    Button1: TButton;
    btnAuditor: TAction;
    HintBalloo: TBalloonHint;
    mudasenha: TAction;
    ImageList1: TImageList;
    TelaFundo: TImageList;
    pmnEstoque: TPopupMenu;
    Almoxarifado2: TMenuItem;
    Peas2: TMenuItem;
    N6: TMenuItem;
    Estoque3: TMenuItem;
    lbConectado: TLabel;
    Image1: TImage;
    btnCombustivel: TAction;
    btnMarca: TAction;
    btnModelo: TAction;
    btnacessorio: TAction;
    btntipo: TAction;
    btnlotado: TAction;
    btnveiculoatv: TAction;
    btncor: TAction;
    btnCargo: TAction;
    btnPessoal: TAction;
    btnveiculoaln: TAction;
    btnveiculopal: TAction;
    btnveiculodoa: TAction;
    TmRegistro: TTimer;
    lbEmpresa: TLabel;
    btnFornecedor: TAction;
    btnPconta: TAction;
    btnpontoabt: TAction;
    btncompracmb: TAction;
    btnformapgm: TAction;
    btnBanco: TAction;
    btnopencaixa: TAction;
    btnCcorrente: TAction;
    btnCaixa: TAction;
    btnAbrcaixa: TAction;
    btnctapg: TAction;
    btnBaixaCnt: TAction;
    btnMateriapri: TAction;
    btnCategoria: TAction;
    btnFabricante: TAction;
    btnProduto: TAction;
    btnCfop: TAction;
    btnNcm: TAction;
    btnTabmulta: TAction;
    btnOrgTrans: TAction;
    btnTanque: TAction;
    btnBomba: TAction;
    btnIncerrante: TAction;
    btnCst: TAction;
    ftpAtualiza: TIdFTP;
    btnAbastece: TAction;
    AplicaErros: TApplicationEvents;
    btnImposto: TAction;
    btnMulta: TAction;
    btnPneudes: TAction;
    btnpneudim: TAction;
    btnPneufab: TAction;
    btnPneuMod: TAction;
    btnPneuIve: TAction;
    btnpneucmp: TAction;
    btnpais: TAction;
    btnEstado: TAction;
    btnPneuMnt: TAction;
    btngrupomnt: TAction;
    btnsubgrpmnt: TAction;
    rbbPrincipal: TRibbon;
    rbpGeral: TRibbonPage;
    Tabelas: TRibbonGroup;
    rbpVeiculos: TRibbonPage;
    RibbonGroup1: TRibbonGroup;
    RibbonGroup2: TRibbonGroup;
    RibbonGroup3: TRibbonGroup;
    rbpabastecimento: TRibbonPage;
    RibbonGroup4: TRibbonGroup;
    RibbonGroup6: TRibbonGroup;
    RibbonGroup5: TRibbonGroup;
    rbpPneu: TRibbonPage;
    RibbonGroup7: TRibbonGroup;
    RibbonGroup8: TRibbonGroup;
    RibbonGroup9: TRibbonGroup;
    rbpManutencao: TRibbonPage;
    RibbonGroup10: TRibbonGroup;
    rbpCargas: TRibbonPage;
    rbpfinanceiro: TRibbonPage;
    RibbonGroup11: TRibbonGroup;
    RibbonGroup12: TRibbonGroup;
    RibbonGroup13: TRibbonGroup;
    RibbonGroup14: TRibbonGroup;
    rbAcao: TRibbonApplicationMenuBar;
    btnatualizador: TAction;
    Image2: TImage;
    Image32Bits: TImageList;
    btnSobre: TAction;
    RibbonGroup15: TRibbonGroup;
    btnmanutitem: TAction;
    btnprocveic: TAction;
    RibbonMDIFix1: TRibbonMDIFix;
    RibbonQuickAccessToolbar1: TRibbonQuickAccessToolbar;
    WindowClose1: TWindowClose;
    WindowCascade1: TWindowCascade;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowTileVertical1: TWindowTileVertical;
    WindowMinimizeAll1: TWindowMinimizeAll;
    WindowArrange1: TWindowArrange;
    btntbservico: TAction;
    btnMonitor: TAction;
    btnsubgrupo: TAction;
    SSLIO: TIdSSLIOHandlerSocketOpenSSL;
    XMLDocument1: TXMLDocument;
    btnmanutcab: TAction;
    mnTabComb: TAction;
    mnTabMarca: TAction;
    mnTabDepart: TAction;
    mnTabCargo: TAction;
    mnTabPais: TAction;
    mnTabEstado: TAction;
    mnTabCidade: TAction;
    mnCadPessoal: TAction;
    btnfabricapcs: TAction;
    RibbonGroup16: TRibbonGroup;
    btntbpecas: TAction;
    btnroteiro: TAction;
    RibbonGroup17: TRibbonGroup;
    btnchamado: TAction;
    btnoricarga: TAction;
    btntrmcoleta: TAction;
    RibbonGroup18: TRibbonGroup;
    btnNavio: TAction;
    btnTpContainer: TAction;
    btnGrupocli: TAction;
    btnCliente: TAction;
    btntbrecurso: TAction;
    atualizador: TAction;
    RibbonGroup19: TRibbonGroup;
    btnordcoleta: TAction;
    btntransfin: TAction;
    mnTabmodelo: TAction;
    mnTabacessorio: TAction;
    mnCadPesAniv: TAction;
    mnCadPesHab: TAction;
    mnCadFornecedor: TAction;
    mnCadCliente: TAction;
    mnCadVeiculo: TAction;
    mnRelVeiculoLota: TAction;
    btnCTE: TAction;
    procedure tmSistemasTimer(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btToolSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnClienteClick(Sender: TObject);
    procedure calcular();
    procedure btnSairExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure EmpresaSelectTxt();
    procedure btnEmpresaExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MudaEmpresaExecute(Sender: TObject);
    procedure btnConfiguraExecute(Sender: TObject);
    procedure btnGrupoExecute(Sender: TObject);
    procedure btnUsuarioExecute(Sender: TObject);
    procedure btnNivelExecute(Sender: TObject);
    procedure btnAuditorExecute(Sender: TObject);
    procedure btnCidadeExecute(Sender: TObject);
    procedure mudasenhaExecute(Sender: TObject);
    procedure Pintar(imagem: TImageList; Barra: TStatusBar;
              Panel: TStatusPanel; Rect: TRect ; IndiceImagem : Integer);
    procedure stbSistemaDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    function  MD5(const texto:string):string;
    function  RetCmp( S : string ) : string;
    procedure VendasporUsuariosSintetizadas1Click(Sender: TObject);
    procedure btnCombustivelExecute(Sender: TObject);
    procedure Combustvel2Click(Sender: TObject);
    procedure btnMarcaExecute(Sender: TObject);
    procedure btnModeloExecute(Sender: TObject);
    procedure btnacessorioExecute(Sender: TObject);
    procedure btntipoExecute(Sender: TObject);
    procedure btnlotadoExecute(Sender: TObject);
    procedure btnveiculoatvExecute(Sender: TObject);
    procedure btncorExecute(Sender: TObject);
    procedure btnCargoExecute(Sender: TObject);
    procedure btnPessoalExecute(Sender: TObject);
    procedure TmRegistroTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure chkRegistro;
    Function AtvRegistro: Boolean;
    procedure btnPcontaExecute(Sender: TObject);
    procedure btnFornecedorExecute(Sender: TObject);
    procedure btnformapgmExecute(Sender: TObject);
    procedure btnBancoExecute(Sender: TObject);
    procedure btnCcorrenteExecute(Sender: TObject);
    Procedure AbrirFormP(frm: String ; form :TForm; Sender: TObject);
    Function chkforms(form: string): Boolean;
    procedure btnCaixaExecute(Sender: TObject);
    procedure btnAbrcaixaExecute(Sender: TObject);
    procedure btnctapgExecute(Sender: TObject);
    procedure btnBaixaCntExecute(Sender: TObject);
    procedure btnMateriapriExecute(Sender: TObject);
    procedure btnCategoriaExecute(Sender: TObject);
    procedure btnFabricanteExecute(Sender: TObject);
    procedure btnProdutoExecute(Sender: TObject);
    procedure btnCfopExecute(Sender: TObject);
    procedure btnNcmExecute(Sender: TObject);
    procedure btnTabmultaExecute(Sender: TObject);
    procedure btnOrgTransExecute(Sender: TObject);
    procedure btnTanqueExecute(Sender: TObject);
    procedure btnpontoabtExecute(Sender: TObject);
    procedure btnBombaExecute(Sender: TObject);
    procedure btnIncerranteExecute(Sender: TObject);
    procedure btncompracmbExecute(Sender: TObject);
    procedure btnCstExecute(Sender: TObject);
    function atualizar: Boolean;
    procedure btnAbasteceExecute(Sender: TObject);
    procedure AplicaErrosException(Sender: TObject; E: Exception);
    procedure btnImpostoExecute(Sender: TObject);
    procedure btnMultaExecute(Sender: TObject);
    procedure btnPneudesExecute(Sender: TObject);
    procedure btnpneudimExecute(Sender: TObject);
    procedure btnPneufabExecute(Sender: TObject);
    procedure btnPneuModExecute(Sender: TObject);
    procedure btnPneuIveExecute(Sender: TObject);
    procedure btnpneucmpExecute(Sender: TObject);
    procedure btnpaisExecute(Sender: TObject);
    procedure btnEstadoExecute(Sender: TObject);
    procedure btnPneuMntExecute(Sender: TObject);
    procedure btngrupomntExecute(Sender: TObject);
    procedure btnsubgrpmntExecute(Sender: TObject);
    procedure atualizatela;
    procedure Image2Click(Sender: TObject);
    procedure btnSobreExecute(Sender: TObject);
    procedure btnmanutitemExecute(Sender: TObject);
    procedure btnveiculodoaExecute(Sender: TObject);
    procedure btnveiculoalnExecute(Sender: TObject);
    procedure btnveiculopalExecute(Sender: TObject);
    procedure btnprocveicExecute(Sender: TObject);
    procedure btntbservicoExecute(Sender: TObject);
    procedure btnsubgrupoExecute(Sender: TObject);
    procedure mnTabCombExecute(Sender: TObject);
    procedure mnTabMarcaExecute(Sender: TObject);
    procedure mnTabDepartExecute(Sender: TObject);
    procedure mnTabCargoExecute(Sender: TObject);
    procedure mnTabPaisExecute(Sender: TObject);
    procedure mnTabEstadoExecute(Sender: TObject);
    procedure mnTabCidadeExecute(Sender: TObject);
    procedure mnCadPessoalExecute(Sender: TObject);
    procedure btnmanutcabExecute(Sender: TObject);
    procedure btnfabricapcsExecute(Sender: TObject);
    procedure btntbpecasExecute(Sender: TObject);
    procedure btnMonitorExecute(Sender: TObject);
    procedure btnroteiroExecute(Sender: TObject);
    procedure btnchamadoExecute(Sender: TObject);
    procedure btnoricargaExecute(Sender: TObject);
    procedure btntrmcoletaExecute(Sender: TObject);
    procedure btnNavioExecute(Sender: TObject);
    procedure btnTpContainerExecute(Sender: TObject);
    procedure btnGrupocliExecute(Sender: TObject);
    procedure btnClienteExecute(Sender: TObject);
    procedure btntbrecursoExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnordcoletaExecute(Sender: TObject);
    procedure atualizadorExecute(Sender: TObject);
    procedure btntransfinExecute(Sender: TObject);
    procedure mnTabmodeloExecute(Sender: TObject);
    procedure mnTabacessorioExecute(Sender: TObject);
    procedure mnCadPesAnivExecute(Sender: TObject);
    procedure mnCadPesHabExecute(Sender: TObject);
    procedure mnCadFornecedorExecute(Sender: TObject);
    procedure mnCadClienteExecute(Sender: TObject);
    procedure mnCadVeiculoExecute(Sender: TObject);
    procedure mnRelVeiculoLotaExecute(Sender: TObject);

  private
    INICONF: TINIFILE;
    NmArqIni: String;
    function habilitamn(mnformda, frms: string): boolean;
    { Private declarations }
  public
   { Public declarations }
    //sysUsuario, sysUsuDtb: string ;
    sysUsuEmail: string ;
    CorBrowse:  Tcolor;
    nmEmpresa,  nmFantasia, ctMatCon, ctMenCon, ctMtrCon, cQtdPrc: String ;
    SMTPConta,  SMTPNomeExibicao,  SMTPPassword,  SMTPUsername,  SMTPHost,  SMTPPorta: String;
    SMTPAutenticacao,  SMTPSSL: Boolean ;
    aEstCons, aStatus, aItemOs : array of string;


    procedure Sair();


  end;




var
  fPrincipal: TfPrincipal;
  clBlack,  clMaroon,   clGreen,  clOlive,    clNavy     : string ;
  clPurple, clTeal,     clGray,   clSilver,   clRed      : String ;
  clLime,   clYellows,   clBlue,   clFuchsia,  clAqua    : String ;
  clLtGray, clDkGray,   clWhite,  clMoneyGr,  clSkyBlue  : String ;
  clCream,  clMedGray,  clBlueLif, cPathExe : String ;


  {
  clBlack := Rgb(255,255,255);
  clGreen := Rgb(0,255,0);
   }
implementation

uses U_dmEmp, U_Sys,
  U_Login, U_funcao,
  U_MudaEmpresa, U_INI , U_Configura, U_usuario,
  U_Nivel, U_Auditor, U_MudaSenha, R_UsuarioSint, U_CombustivelInc,
  R_RelCombustiveis, U_MarcaInc, U_ModeloInc, U_AcessorioInc,
  U_TipoInc, U_LotadoInc, U_CidadeInc, U_VeiculoAtvInc, U_CorInc, U_CargoInc,
  U_PessoalInc, U_Licenc, U_FuncReg, U_PContas, U_FornecedorInc, U_PontoAbtInc,
  U_FormaPgmInc, U_BancoInc, U_CcorrenteInc, U_Caixa, U_AbrCaixa, U_ctapagar,
  U_baixacnt, U_Materiapri, U_Categoria, U_Fabricante, U_Produto, U_CFOP, U_NCM,
  U_TabMulta, U_OrgTrans, U_Tanque, U_Bomba, U_Incerrante, U_compracmb, U_CST,
  U_Atualizador, U_Abastece, U_Imposto, U_Multa, U_PneuDesenho, U_PneuDimensao,
  U_PneuFabricante, U_PneuMod, U_PneuIventario, U_pneucmp, U_Pais, U_Estado,
  U_PneuManutencao, U_grupomnt, U_SubGrupoMnt, U_Sobre, U_Munuitem, U_procveic,
  U_tbservico, U_SubGrupo, U_testes, UR_TabCombustiveis, UR_TabMarca,
  UR_TabDepartamento, UR_TabCargo, UR_TabPais, UR_TabEstado, UR_TabCidade,
  UR_CadPessoal, U_manutencao, U_fabricapcs, U_tbpecas, U_Monitor, U_Roteiro,
  U_chamado, U_Oricarga, U_trmcoleta, U_Navio, U_TpContainer, U_GrupoCli,
  U_Cliente, U_tbrecurso, U_ordcoleta, U_transfin, U_ClassMessage, UR_TabModelo,
  UR_TabAcessorio, UR_CadPesAniversariante, UR_CadPesHabVencida,
  UR_CadFornecedores, UR_CadCliente, UR_CadVeiculo, UR_CadVeiculoLota,
  U_Empresa_, U_Grupo_;



{$R *.dfm}

{*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
*  FUNÇÃO Tirar Caracteres
*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=}
Procedure TfPrincipal.AbrirFormP(frm: String ; form :TForm; Sender: TObject );
Var
  frmClass              : TFormClass  ;
  frmGer                : TForm       ;
  frm1, frm2, nmTab_    : String      ;
  I: Integer;
begin
  //showmessage( TComponent( Sender ).Name ) ;
  frm1        := 'T'+frm;
  frm2        := frm;
  frmGer      := TForm(frm2) ;
  for I := 0 to MDIChildCount - 1 do begin
    if MDIChildren[I] is TForm then
    begin

      if  LowerCase( MDIChildren[I].ToString ) = LowerCase( frm1 )   Then //chkforms(frm1) then
      begin
        MDIChildren[I].WindowState := WsNormal;
        MDIChildren[I].BringToFront;
        MDIChildren[I].Focused;
        exit;
      end;

    end;
  end;

  frmClass          := TFormClass(GetClass(frm1));
  frmGer            := frmClass.Create(self);
  frmGer.FormStyle  := fsMDIChild ;
  rbbPrincipal.DocumentName := frmGer.Caption;
  frmGer.show;


end;

procedure TfPrincipal.mnCadPessoalExecute(Sender: TObject);
begin
  frmRelCadPessoal := TfrmRelCadPessoal.Create(Self);
  frmRelCadPessoal.ShowModal;
end;

procedure TfPrincipal.mnCadVeiculoExecute(Sender: TObject);
begin
  frmRelCadVeiculo := TfrmRelCadVeiculo.Create(Self);
  frmRelCadVeiculo.Show;
end;

procedure TfPrincipal.mnClienteClick(Sender: TObject);
begin
  {
  frmAluno := TfrmAluno.Create(Self);
  frmAluno.Show;
   }
end;

procedure TfPrincipal.mnRelVeiculoLotaExecute(Sender: TObject);
begin
  frmRelCadVeiLota := TfrmRelCadVeiLota.Create(Self);
  frmRelCadVeiLota.ShowModal

end;

procedure TfPrincipal.mnTabacessorioExecute(Sender: TObject);
begin
  frmRelTabAcessorio := TfrmRelTabAcessorio.Create(Self);
  frmRelTabAcessorio.ShowModal
end;

procedure TfPrincipal.mnTabCargoExecute(Sender: TObject);
begin
  frmRelTabCargos := TfrmRelTabCargos.Create(Self);
  frmRelTabCargos.ShowModal;
end;

procedure TfPrincipal.mnTabCidadeExecute(Sender: TObject);
begin
  frmRelTabCidade := TfrmRelTabCidade.Create(Self);
  frmRelTabCidade.ShowModal;
end;

procedure TfPrincipal.mnTabCombExecute(Sender: TObject);
begin
  frmRelTabComb := TfrmRelTabComb.Create(Self);
  frmRelTabComb.ShowModal;
end;

procedure TfPrincipal.mnTabDepartExecute(Sender: TObject);
begin
  frmRelTabDepart := TfrmRelTabDepart.Create(Self);
  frmRelTabDepart.ShowModal;
end;

procedure TfPrincipal.mnTabMarcaExecute(Sender: TObject);
begin
  frmRelTabmarcas := TfrmRelTabMarcas.Create(Self);
  frmRelTabmarcas.ShowModal;
end;

procedure TfPrincipal.mnTabmodeloExecute(Sender: TObject);
begin
  frmRelTabModelo := TfrmRelTabModelo.Create(Self);
  frmRelTabModelo.ShowModal;
end;

procedure TfPrincipal.mnTabPaisExecute(Sender: TObject);
begin
  frmRelTabPais := TfrmRelTabPais.Create(Self);
  frmRelTabPais.ShowModal;
end;

procedure TfPrincipal.MudaEmpresaExecute(Sender: TObject);
begin
  AbrirFormP('frmMudaEmpresa',frmMudaEmpresa, Sender);
  {
  frmMudaEmpresa := TfrmMudaEmpresa.Create(Self);
  frmMudaEmpresa.ShowModal;
  }
end;

procedure TfPrincipal.mudasenhaExecute(Sender: TObject);
begin
  frmMudasenha := TfrmMudasenha.Create(Self);
  frmMudasenha.ShowModal;
end;


procedure TfPrincipal.btnMarcaExecute(Sender: TObject);
begin
  frmMarca := TfrmMarca.Create(Self);
  frmMarca.Show;
end;

procedure TfPrincipal.btnMateriapriExecute(Sender: TObject);
begin
  frmMateriapri := TfrmMateriapri.Create(Self);
  frmMateriapri.Show;

end;

procedure TfPrincipal.btnModeloExecute(Sender: TObject);
begin
  frmModelo := TfrmModelo.Create(Self);
  frmModelo.Show;
end;

procedure TfPrincipal.btnMonitorExecute(Sender: TObject);
begin
  frmMonitor := TfrmMonitor.Create(Self);
  frmMonitor.Show;
end;

procedure TfPrincipal.btnMultaExecute(Sender: TObject);
begin
  frmMulta := TfrmMulta.Create(Self);
  frmMulta.Show;
end;

procedure TfPrincipal.mnTabEstadoExecute(Sender: TObject);
begin
  frmRelTabEstado := TfrmRelTabEstado.Create(Self);
  frmRelTabEstado.Show;

end;

procedure TfPrincipal.mnCadClienteExecute(Sender: TObject);
begin
  frmRelCadCliente := TfrmRelCadCliente.Create(Self);
  frmRelCadCliente.Show;
end;

procedure TfPrincipal.mnCadFornecedorExecute(Sender: TObject);
begin
  frmRelCadFornecedores := TfrmRelCadFornecedores.Create(Self);
  frmRelCadFornecedores.Show;
end;

procedure TfPrincipal.mnCadPesAnivExecute(Sender: TObject);
begin
  frmRelCadPesAniverario := TfrmRelCadPesAniverario.Create(Self);
  frmRelCadPesAniverario.Show;
end;

procedure TfPrincipal.mnCadPesHabExecute(Sender: TObject);
begin
  frmRelCadPesHabVen := TfrmRelCadPesHabVen.Create(Self);
  frmRelCadPesHabVen.Show;
end;

procedure TfPrincipal.AplicaErrosException(Sender: TObject; E: Exception);
var
  NomeDoLog, cPath, cPathDir,cDirErr: string;
  Arquivo: TextFile;
  i : iNTEGER;
begin
  cPath     := ExtractFilePath( Application.ExeName );
  cDirErr   := '000_ERROS';
  cPathDir  := cPath+cDirErr;
  //verificar se o diretorio de logs de erros existe
 if Not DirectoryExists( cPathDir ) then
    CreateDir( cPathDir );

  NomeDoLog := cPathDir+'\sgt_erro_'+FormatDateTime('yyyymmddhhmm',now)+'_erros.log';
  AssignFile( Arquivo, NomeDoLog );

  if FileExists(NomeDoLog) then
  Append(arquivo) { se existir, apenas adiciona linhas }
  else
    ReWrite(arquivo); { cria um novo se não existir }
  try
    WriteLn(arquivo,'[INICIO]==============================================================');
    Writeln(arquivo,'                 AVEL - Sistemas e Soluções                           ');
    Writeln(arquivo,'       E-Mail: avelinoalessandro@gmail.com (0xx85)98514 3449          ');
    Writeln(arquivo,'        LOGs DE INFORMAÇÕES DE POSSIVELS AVARIAS NO SISTEMA           ');
    WriteLn(arquivo,'[SOBRE O ERRO]========================================================');
    Writeln(arquivo,'Usuário................: '+sysUsuario                                  );
    Writeln(arquivo,'Data e Hora do Erro....: '+DateTimeToStr(Now)                          );
    Writeln(arquivo,'Nome do Form...........: '+Screen.ActiveForm.ToString                  );
    Writeln(arquivo,'Título do Formulário...: '+Screen.ActiveForm.Caption                   );
    Writeln(arquivo,'Erro ocasionado........: '+E.Message                                   );
    Writeln(arquivo,'Classe.................: '+E.ClassName                                 );
    Writeln(arquivo,'Ultimo componente......: '+Sender.ToString                             );
    WriteLn(arquivo,'[FORMULARIOS ABERTOS]=================================================');
    For i:= 0 to Screen.FormCount -1 do begin
         Writeln( arquivo,Screen.Forms[i].Name );
    end;
    WriteLn(arquivo,'[FINAL]===============================================================');
    Application.ShowException(E);

  finally
    CloseFile(arquivo)
  end;

end;

procedure TfPrincipal.atualizadorExecute(Sender: TObject);
begin
  frmAtualizador := TfrmAtualizador.Create(Self);
  frmAtualizador.Show;
end;

function TfPrincipal.atualizar: Boolean;
Var
c, _Erro: String;
begin
ftpAtualiza.Disconnect();

ftpAtualiza.Host := 'ftp.xpg.com.br';
ftpAtualiza.Port := 21;
ftpAtualiza.Username := 'avelinoalessandro';
ftpAtualiza.Password := 'amen1275';
ftpAtualiza.Passive := false; { usa modo ativo }
try
  { Espera até 10 segundos pela conexão }
  ftpAtualiza.Connect();

  //alterando a pasta no servidor
  ftpAtualiza.ChangeDir('/dbsgt/');

  //Envia arquivos
  //ftpAtualiza.Put('CnpjDll.dll', 'CnpjDll.dll');
  ftpAtualiza.Get('config55555.Ini', 'config55555.Ini', True); //True para sobrescrever o arquivo.

except
  on E: Exception do
  _Erro := E.Message;
end;
ftpAtualiza.Disconnect();
end;

Function TfPrincipal.AtvRegistro: Boolean;
Var
qQry : TFDQuery ;
cSerial : String;
begin
  // Pega o Serial do HD
  cSerial := U_FuncReg.SerialNum( Copy(ExtractFileDrive(Application.ExeName),1,1) ) ;
  // Função que Checa o registro e grava o Serial do sistema
  qQry := TFDQuery.Create(Nil) ;
  with qQry do
    begin
      Close;
      Connection         :=  dmEmp.SqlConSis;
      SQL.Text           :=  'SELECT * FROM "dbconfig".registro Where reg_cdserial = '+QuotedStr( cSerial )+' order by reg_cdserial';
      Open;
  end;
  frmLicenc.LerRegistro;
  if ( Not qQry.FieldByName('reg_codatv').IsNull ) and
     ( U_FuncReg.registro( Trim( u_funcao.Criptografar( qQry.FieldByName('reg_codatv').value ) )  , cSerial ) ) and
     ( Trim( u_funcao.Criptografar( qQry.FieldByName('reg_codatv').value ) ) = Trim( u_funcao.Criptografar( frmLicenc.LerRegistro ) ) ) then Begin
     Result := False;
  End Else
     Result := True;



end;

procedure TfPrincipal.btnAbasteceExecute(Sender: TObject);
begin
  frmAbastece := TfrmAbastece.Create(Self);
  frmAbastece.Show;
end;

procedure TfPrincipal.btnAbrcaixaExecute(Sender: TObject);
begin
  frmAbrcaixa := TfrmAbrcaixa.Create(Self);
  frmAbrcaixa.Show;
end;

procedure TfPrincipal.btnacessorioExecute(Sender: TObject);
begin
  frmAcessorio := TfrmAcessorio.Create(Self);
  frmAcessorio.Show;
end;

procedure TfPrincipal.btnAuditorExecute(Sender: TObject);
begin
  frmAuditor := TfrmAuditor.Create(Self);
  frmAuditor.Show;
end;

procedure TfPrincipal.btnBaixaCntExecute(Sender: TObject);
begin
  frmBaixaCnt := TfrmBaixaCnt.Create(Self);
  frmBaixaCnt.Show;
end;

procedure TfPrincipal.btnBancoExecute(Sender: TObject);
begin
  frmBanco := TfrmBanco.Create(Self);
  frmBanco.Show;
end;

procedure TfPrincipal.btnBombaExecute(Sender: TObject);
begin
  frmBomba := TfrmBomba.Create(Self);
  frmBomba.Show
end;

procedure TfPrincipal.btnCaixaExecute(Sender: TObject);
begin
  frmCaixa := TfrmCaixa.Create(Self);
  frmCaixa.Show
end;

procedure TfPrincipal.btnCargoExecute(Sender: TObject);
begin
  frmCargo := TfrmCargo.Create(Self, Sender);
  frmCargo.Show;
end;

procedure TfPrincipal.btnCategoriaExecute(Sender: TObject);
begin
  frmCategoria := TfrmCategoria.Create(Self);
  frmCategoria.Show
end;

procedure TfPrincipal.btnCcorrenteExecute(Sender: TObject);
begin
  frmCcorrente := TfrmCcorrente.Create(Self);
  frmCcorrente.Show
end;

procedure TfPrincipal.btnCfopExecute(Sender: TObject);
begin
  frmCfop := TfrmCfop.Create(Self);
  frmCfop.Show;
end;

procedure TfPrincipal.btnchamadoExecute(Sender: TObject);
begin
  frmChamado := TfrmChamado.Create(Self);
  frmChamado.Show;
end;

procedure TfPrincipal.btnCidadeExecute(Sender: TObject);
begin
  frmCidade := TfrmCidade.Create(Self, Sender);
  frmCidade.Show;
end;

procedure TfPrincipal.btnClienteExecute(Sender: TObject);
begin
  frmCliente := TfrmCliente.Create(Self);
  frmCliente.Show;
end;

procedure TfPrincipal.btnCombustivelExecute(Sender: TObject);
begin
  frmCombustivel := TfrmCombustivel.Create(Self);
  frmCombustivel.Show;
end;

procedure TfPrincipal.btncompracmbExecute(Sender: TObject);
begin
  frmCompracmb := TfrmCompracmb.Create(Self);
  frmCompracmb.Show;
end;

procedure TfPrincipal.btnConfiguraExecute(Sender: TObject);
begin
  frmConfigura := TfrmConfigura.Create(Self);
  frmConfigura.Show;
end;

procedure TfPrincipal.btncorExecute(Sender: TObject);
begin
  frmCor := TfrmCor.Create(Self);
  frmCor.Show;
end;

procedure TfPrincipal.btnCstExecute(Sender: TObject);
begin
  frmcst := Tfrmcst.Create(Self);
  frmcst.Show;
end;

procedure TfPrincipal.btnctapgExecute(Sender: TObject);
begin
  frmctapg := Tfrmctapg.Create(Self);
  frmctapg.Show;
end;

procedure TfPrincipal.btnEmpresaExecute(Sender: TObject);
begin
  frmEmpresa_ := TfrmEmpresa_.Create(Self, Sender);
  frmEmpresa_.Show;
end;

procedure TfPrincipal.btnEstadoExecute(Sender: TObject);
begin
  frmEstado := TfrmEstado.Create(Self, Sender);
  frmEstado.Show;
end;

procedure TfPrincipal.btnFabricanteExecute(Sender: TObject);
begin
  frmFabricante := TfrmFabricante.Create(Self);
  frmFabricante.Show;
end;

procedure TfPrincipal.btnfabricapcsExecute(Sender: TObject);
begin
  frmFabricapcs := TfrmFabricapcs.Create(Self);
  frmFabricapcs.Show;
end;

procedure TfPrincipal.btnformapgmExecute(Sender: TObject);
begin
  frmFormaPgm := TfrmFormaPgm.Create(Self);
  frmFormaPgm.Show;
end;

procedure TfPrincipal.btnFornecedorExecute(Sender: TObject);
begin
  frmFornecedor := TfrmFornecedor.Create(Self);
  frmFornecedor.Show;
end;

procedure TfPrincipal.btnmanutcabExecute(Sender: TObject);
begin
  frmmanutcab := Tfrmmanutcab.Create(Self);
  frmmanutcab.Show
end;

procedure TfPrincipal.btnGrupocliExecute(Sender: TObject);
begin
  frmGrupocli := TfrmGrupocli.Create(Self,Sender);
  frmGrupocli.Show;
end;

procedure TfPrincipal.btnGrupoExecute(Sender: TObject);
begin
  frmGrupo := TfrmGrupo.Create(Self, Sender);
  frmGrupo.Show;
end;

procedure TfPrincipal.btngrupomntExecute(Sender: TObject);
begin
  frmgrupomnt := Tfrmgrupomnt.Create(Self);
  frmgrupomnt.Show;
end;

procedure TfPrincipal.btnImpostoExecute(Sender: TObject);
begin
  frmImposto := TfrmImposto.Create(Self);
  frmImposto.Show;
end;

procedure TfPrincipal.btnIncerranteExecute(Sender: TObject);
begin
  frmIncerrante := TfrmIncerrante.Create(Self);
  frmIncerrante.Show;
end;

procedure TfPrincipal.btnlotadoExecute(Sender: TObject);
begin
  frmLotado := TfrmLotado.Create(Self, Sender);
  frmLotado.Show;
end;

procedure TfPrincipal.btnmanutitemExecute(Sender: TObject);
begin
  frmmanutitem := Tfrmmanutitem.Create(Self);
  frmmanutitem.Show
end;

procedure TfPrincipal.btnNavioExecute(Sender: TObject);
begin
  frmNavio := TfrmNavio.Create(Self);
  frmNavio.Show;
end;

procedure TfPrincipal.btnNcmExecute(Sender: TObject);
begin
  frmNcm := TfrmNcm.Create(Self);
  frmNcm.Show;
end;

procedure TfPrincipal.btnNivelExecute(Sender: TObject);
begin
  frmNivel := TfrmNivel.Create(Self, Sender);
  frmNivel.Show;
end;

procedure TfPrincipal.btnordcoletaExecute(Sender: TObject);
begin
  frmordcoleta := Tfrmordcoleta.Create(Self);
  frmordcoleta.Show
end;

procedure TfPrincipal.btnOrgTransExecute(Sender: TObject);
begin
  frmOrgTrans := TfrmOrgTrans.Create(Self);
  frmOrgTrans.Show;
end;

procedure TfPrincipal.btnoricargaExecute(Sender: TObject);
begin
  frmOriCarga := TfrmOriCarga.Create(Self);
  frmOriCarga.Show;
end;

procedure TfPrincipal.btnpaisExecute(Sender: TObject);
begin
  frmPais := TfrmPais.Create(Self, Sender);
  frmPais.Show;
end;

procedure TfPrincipal.btnPcontaExecute(Sender: TObject);
begin
  frmPconta := TfrmPconta.Create(Self);
  frmPconta.Show;

end;

procedure TfPrincipal.btnPessoalExecute(Sender: TObject);
begin
  frmPessoal := TfrmPessoal.Create(Self);
  frmPessoal.Show;

end;

procedure TfPrincipal.btnpneucmpExecute(Sender: TObject);
begin
  frmPneuCmp := TfrmPneuCmp.Create(Self);
  frmPneuCmp.Show;
end;

procedure TfPrincipal.btnPneudesExecute(Sender: TObject);
begin
  frmPneuDes := TfrmPneuDes.Create(Self);
  frmPneuDes.Show;
end;

procedure TfPrincipal.btnpneudimExecute(Sender: TObject);
begin
  frmPneuDIm := TFrmPneuDIm.Create(Self);
  frmPneuDIm.Show;
end;

procedure TfPrincipal.btnPneufabExecute(Sender: TObject);
begin
  frmPneuFab := TfrmPneuFab.Create(Self);
  frmPneuFab.Show;
end;

procedure TfPrincipal.btnPneuIveExecute(Sender: TObject);
begin
  frmPneuive := TfrmPneuive.Create(Self);
  frmPneuive.Show;
end;

procedure TfPrincipal.btnPneuMntExecute(Sender: TObject);
begin
  frmPneuMnt := TfrmPneuMnt.Create(Self);
  frmPneuMnt.Show;
end;

procedure TfPrincipal.btnPneuModExecute(Sender: TObject);
begin
  frmPneuMod := TfrmPneuMod.Create(Self);
  frmPneuMod.Show;
end;

procedure TfPrincipal.btnpontoabtExecute(Sender: TObject);
begin
  frmPontoAbt := TfrmPontoAbt.Create(Self);
  frmPontoAbt.Show;
end;

procedure TfPrincipal.btnprocveicExecute(Sender: TObject);
begin
  frmprocveic := Tfrmprocveic.Create(Self);
  frmprocveic.Show;
end;

procedure TfPrincipal.btnProdutoExecute(Sender: TObject);
begin
  frmProduto := TfrmProduto.Create(Self);
  frmProduto.Show;
end;

procedure TfPrincipal.btnroteiroExecute(Sender: TObject);
begin
  frmroteiro := Tfrmroteiro.Create(Self);
  frmroteiro.Show;
end;

procedure TfPrincipal.btnSairClick(Sender: TObject);
begin

{
Icones :

MB_ICONEXCLAMATION = Exclamação amarela.
MB_ICONWARNING = Erro
MB_ICONINFORMATION = Informação
MB_ICONQUESTION = Pergunta

Botões :

MB_OK = OK
MB_OKCANCEL = OK e Cancelar
MB_YESNO = Sim e Não
MB_YESNOCANCEL = Sim , Não , Cancelar
MB_ABORTRETRYIGNORE = Anular, Repetir e Ignorar
MB_RETRYCANCEL = Repetir e Cancelar
}
Sair();

end;


procedure TfPrincipal.btnSairExecute(Sender: TObject);
begin
  Sair();
end;

procedure TfPrincipal.btnSobreExecute(Sender: TObject);
begin
  frmSobre := TfrmSobre.Create(Self);
  frmSobre.ShowModal;
end;

procedure TfPrincipal.btnsubgrpmntExecute(Sender: TObject);
begin
  frmsubgrpmnt := Tfrmsubgrpmnt.Create(Self);
  frmsubgrpmnt.Show;
end;

procedure TfPrincipal.btnsubgrupoExecute(Sender: TObject);
begin
  frmSubGrupo := TfrmSubGrupo.Create(Self, Sender);
  frmSubGrupo.Show;
end;

procedure TfPrincipal.btnTabmultaExecute(Sender: TObject);
begin
  frmTabMulta := TfrmTabMulta.Create(Self);
  frmTabMulta.Show;
end;

procedure TfPrincipal.btnTanqueExecute(Sender: TObject);
begin
  frmTanque := TfrmTanque.Create(Self);
  frmTanque.Show;
end;

procedure TfPrincipal.btntbpecasExecute(Sender: TObject);
begin
  frmtbpecas := Tfrmtbpecas.Create(Self);
  frmtbpecas.Show;
end;

procedure TfPrincipal.btntbservicoExecute(Sender: TObject);
begin
  frmtbservico := Tfrmtbservico.Create(Self);
  frmtbservico.Show;
end;

procedure TfPrincipal.btntipoExecute(Sender: TObject);
begin
  frmTipo := TfrmTipo.Create(Self);
  frmTipo.Show;
end;

procedure TfPrincipal.btnTpContainerExecute(Sender: TObject);
begin
  frmTpContainer := TfrmTpContainer.Create(Self);
  frmTpContainer.Show;
end;

procedure TfPrincipal.btntransfinExecute(Sender: TObject);
begin
  frmTransfin := TfrmTransfin.Create(Self);
  frmTransfin.Show;
end;

procedure TfPrincipal.btntrmcoletaExecute(Sender: TObject);
begin
  frmTrmColeta := TfrmTrmColeta.Create(Self);
  frmTrmColeta.Show;
end;

procedure TfPrincipal.btnUsuarioExecute(Sender: TObject);
begin
  frmUsuario := TfrmUsuario.Create(Self, Sender);
  frmUsuario.Show;
end;

procedure TfPrincipal.btnveiculoalnExecute(Sender: TObject);
begin
  frmVeiculoAtv := TfrmVeiculoAtv.Create(Self,aStatus[2]);
  frmVeiculoAtv.Show;

end;

procedure TfPrincipal.btnveiculoatvExecute(Sender: TObject);
begin
  //AbrirFormP('frmVeiculoAtv',frmVeiculoAtv);

  frmVeiculoAtv := TfrmVeiculoAtv.Create(Self,aStatus[0]);
  frmVeiculoAtv.Show;

end;

procedure TfPrincipal.btnveiculodoaExecute(Sender: TObject);
begin
  frmVeiculoAtv := TfrmVeiculoAtv.Create(Self,aStatus[3]);
  frmVeiculoAtv.Show;
end;

procedure TfPrincipal.btnveiculopalExecute(Sender: TObject);
begin
  frmVeiculoAtv := TfrmVeiculoAtv.Create(Self,aStatus[1]);
  frmVeiculoAtv.Show;

end;

procedure TfPrincipal.Sair();
var
X:integer;
begin


  Auditor(U_funcao.nmPrograma,'Logoff','-');
{
  dm.ibdSistema.Close ;
  dm.ibdSistema.Connected    := False;
  dm.ibtSistema.Active       := False;
 }
  dmEmp.SqlConSis.Connected  := False;


    for X:=1 to Screen.FormCount -1 do Begin
        if Screen.Forms[X] <> Self then
          // ShowMessage(Screen.Forms[X].ToString);
           Screen.Forms[X].Close;
    end;

    Application.Terminate;


end;

procedure TfPrincipal.stbSistemaDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
Var
   Estado : Integer;
begin
      Estado := 1 ; // Representará a segunda imagem do ImageList1
      Pintar(ImageList1,stbSistema ,stbSistema.Panels[5],Rect, Estado);

end;

procedure TfPrincipal.btntbrecursoExecute(Sender: TObject);
begin
   frmTbrecurso :=  TfrmTbrecurso.Create(Self);
   frmTbrecurso.Show;
end;

procedure TfPrincipal.TmRegistroTimer(Sender: TObject);
begin

   TmRegistro.Enabled := False;
   if AtvRegistro then Begin
      frmLicenc :=  TfrmLicenc.Create(Self);
      frmLicenc.ShowModal;
   End;


end;

procedure TfPrincipal.tmSistemasTimer(Sender: TObject);
begin
 stbSistema.Panels[0].Text := UpperCase(nmSistema );
 stbSistema.Panels[1].Text := 'Data: '+DateToStr(date);
 stbSistema.Panels[3].Text := 'Hora: '+TimeToStr(Now);
 stbSistema.Panels[4].Text := 'Usuário: '+UpperCase( TRIM(sysUsuario) ) ;

end;

procedure TfPrincipal.VendasporUsuariosSintetizadas1Click(Sender: TObject);
begin
  frmRUsuarioSint :=  TfrmRUsuarioSint.Create(Self);
  frmRUsuarioSint.Show;
end;

procedure TfPrincipal.btToolSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfPrincipal.Button1Click(Sender: TObject);
begin
  frmAtualizador := TfrmAtualizador.Create(Self);
  frmAtualizador.Show;

end;



{
procedure TfPrincipal.mnBancoClick(Sender: TObject);
begin
  frmBanco := TfrmBanco.Create(Self);
  frmBanco.Show;
end;
 }


procedure TfPrincipal.FormActivate(Sender: TObject);
begin
  clBlack   := '$000000';
  clMaroon  := '$000080';
  clGreen   := '$008000';
  clOlive   := '$008080';
  clNavy    := '$800000';
  clPurple  := '$800080';
  clTeal    := '$808000';
  clGray    := '$808080';
  clSilver  := '$C0C0C0';
  clRed     := '$0000FF';
  clLime    := '$00FF00';
  //clYellow  := '$00FFFF';
  clBlue    := '$FF0000';
  clFuchsia := '$FF00FF';
  clAqua    := '$FFFF00';
  clLtGray  := '$C0C0C0';
  clDkGray  := '$808080';
  clWhite   := '$FFFFFF';

  CorBrowse := u_funcao.Cinza_Sintilante;
//  clMoneyGreen := '$C0DCC0';
  clSkyBlue := '$F0CAA6';
  clCream := '$F0FBFF';
  clMedGray := '$A4A0A0';



//  ctMatCon    := dm.ibqConfigura.FieldByName('MATCON').Text ;
 // ctMenCon    := dm.ibqConfigura.FieldByName('MENCON').AsString ;
 // ctMtrCon    := dm.ibqConfigura.FieldByName('MTRCON').AsString ;
 // cQtdPrc     := dm.ibqConfigura.FieldByName('QTDPRC').AsString ;

//  frmIni.Destroy;
//  u_funcao.Destroy;
//  frmLogin.Destroy;
//  Screen.Forms[2].name

end;

procedure TfPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if MESSAGEBOX(Application.Handle, 'Deseja Finalizar o Sistema?', 'Confirma...', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin
    Sair();
  end;

end;

procedure TfPrincipal.FormCreate(Sender: TObject);
Var
qQry : TFDQuery ;
cSerial : String;
begin
 frmSys.Free;
   // Pega o Serial do HD
  cSerial := U_FuncReg.SerialNum(ExtractFileDrive(Application.ExeName)) ;
  TmRegistro.Enabled := False;
  // Checa Variáveis de Cores
  u_funcao.PegarColor();
  // Implementa cores
  clTit_BCad := Preto ;

  // Checa os Parametro de Configurações
  nmVersao  := U_funcao.VersaoExe;
  nmSistema := 'SGT - Sistema de Gerenciamento de Transportes '+nmVersao;

  frmSys := TfrmSys.Create(Self);
  if Not FileExists(CamIni+ArqIni) Then Begin
     frmSys.ShowModal;
  End Else
     frmSys.Free;

  chkRegistro;

  { Alocação Itebs de Ordem de Serviços }
  SetLength( aItemOs, 3);
  aItemOs[0]:= 'ORÇAMENTO';
  aItemOs[1]:= 'EXECUÇÃO';
  aItemOs[2]:= 'FATURADO';

  { Alocação Status do Veículo }
  SetLength( aStatus, 4);
  aStatus[0]:= 'ATIVO';
  aStatus[1]:= 'ALIENAR';
  aStatus[2]:= 'ALIENADO';
  aStatus[3]:= 'DOADO';

  { Alocação de Estado de Conservação e veiculos }
  SetLength( aEstCons, 6 );
  aEstCons[0]:= 'Novo';
  aEstCons[1]:= 'Ótimo';
  aEstCons[2]:= 'Bom';
  aEstCons[3]:= 'Regular';
  aEstCons[4]:= 'Velho';
  aEstCons[5]:= 'Sucata';
  Diretrizes;

  // Variável e Unidad de Medida
  SetLength( aUniMed, 6 );
  aUniMed[0]:= 'Kg';
  aUniMed[1]:= 'Lt';
  aUniMed[2]:= 'Un';
  aUniMed[3]:= 'Mt';
  aUniMed[4]:= 'Cx';
  aUniMed[5]:= 'Pc';

  // Variáveis Itens de Veiculos
  SetLength( aTipoVeic, 16 );
  aTipoVeic[0]  := 'automóvel';
  aTipoVeic[1]  := 'caminhão';
  aTipoVeic[2]  := 'caminhonete';
  aTipoVeic[3]  := 'caminhão-trator';
  aTipoVeic[4]  := 'camioneta';
  aTipoVeic[5]  := 'carroceria';
  aTipoVeic[6]  := 'microônibus';
  aTipoVeic[7]  := 'motocicleta';
  aTipoVeic[8]  := 'motoneta';
  aTipoVeic[9]  := 'ônibus';
  aTipoVeic[10] := 'quadriciclo';
  aTipoVeic[11] := 'reboque';
  aTipoVeic[12] := 'semi-reboque';
  aTipoVeic[13] := 'trator de rodas';
  aTipoVeic[14] := 'trator de esteiras';
  aTipoVeic[15] := 'trator misto';
  aTipoVeic[16] := 'triciclo';

end;

procedure TfPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case key of
      vk_f2: showmessage('teclou f2..');
      vk_f3: showmessage('teclou f3..');
      vk_f4: showmessage('teclou f4..');
      vk_f5: showmessage('teclou f5..');
    end;
end;

procedure TfPrincipal.atualizatela;
Var
i: Integer;
VerFal : Boolean;
mnformda, nmTeste: String;
x: Integer;
begin

  for i := 0 to ActSys.ActionCount-1 do begin
       mnformda := LowerCase( copy(  ActSys.Actions[i].Name ,4)) ;
       nmTeste := ActSys.Actions[i].Name ;
          if ( ActSys.Actions[i].Name <> 'btnSair') and ( copy(ActSys.Actions[i].Name,0,3)= 'btn' ) then Begin
               TAction(ActSys.Actions[i]).Enabled  := habilitamn( LowerCase( copy(  ActSys.Actions[i].Name ,4) ), LowerCase( 'frm'+copy( ActSys.Actions[i].Name ,4) ) )  ;
          End Else Begin
               // aqui é para passar
          End;

  end;
  fPrincipal.EmpresaSelectTxt;

end;


procedure TfPrincipal.FormShow(Sender: TObject);
begin
  TmRegistro.Enabled := True;
  Diretrizes;
  atualizatela;
  if U_funcao.cfgMNTIMPR = 'T' then // Abre módulo de eventos
     btnMonitorExecute(Nil);

  // pra fazer tstes
   {
  frmTestes := TfrmTestes.Create(Self);
  frmTestes.Show;
    }
end;

Function TfPrincipal.habilitamn(mnformda, frms: string): boolean;
Var
X :Integer;
lBloq :Boolean;
Tfrms : String;
begin
  lBloq := False;
  Tfrms := 'T'+frms;

  dmEmp.sqlPermissao.Close;
  dmEmp.sqlPermissao.SQL.Text := ' Select * From "dbconfig".permissao Where prm_formda = :formda and prm_Lei = :LEI and prm_codusu = :codusu';
  dmEmp.sqlPermissao.ParamByName('formda').text         := mnformda;
  dmEmp.sqlPermissao.ParamByName('LEI').AsBoolean       := True;
  dmEmp.sqlPermissao.ParamByName('codusu').AsInteger    := sysCodusu ;
  dmEmp.sqlPermissao.Open;

  for X:=0 to Screen.FormCount-1  do Begin
      if ( Screen.Forms[X] <> Self )    and
         ( LowerCase( Screen.Forms[X].Name ) = frms) Then Begin
         //ShowMessage('Feche todas as janelas abertas '+Screen.Forms[X].Name);
          lBloq := True;
      end;
  end;

  if Not lBloq Then Begin
     Result := ( Not dmEmp.sqlPermissao.eof );
  End Else Begin
     Result := False;
  End;

//   Result := ( Not dmEmp.sqlPermissao.eof );
end;

procedure TfPrincipal.Image2Click(Sender: TObject);
begin
  frmSobre := TfrmSobre.Create(Self);
  frmSobre.ShowModal;
end;

procedure TfPrincipal.Calcular();
Var
  cNumero, Nivel01, Nivel02, Nivel03, Conta : String;
begin
  cNumero:='1234567890';
  ShowMessage(cNumero);
  Nivel01 := Copy( cNumero,1, 2 );
  Nivel02 := Copy( cNumero,3, 2 );
  Nivel03 := Copy( cNumero,5, 2 );
  Conta   := Copy( cNumero,7, 4 );
  ShowMessage(Nivel01+' - '+Nivel02+' - '+Nivel03+' - '+Conta);

end;

Function TfPrincipal.chkforms(form: string): Boolean;
Var
Resultado : Boolean ;
X : Integer;
begin
    Resultado := True ;
    for X:=1 to Screen.FormCount -1 do Begin
        if Screen.Forms[X] <> Self then
           if LowerCase( Screen.Forms[X].ToString ) = LowerCase( form ) then begin
              Resultado := False ;
           end;

    end;
    Result := Resultado;
end;

procedure TfPrincipal.chkRegistro;
Var
qQry : TFDQuery ;
cSerial : String;
data1, data2: TDateTime;
begin
 data1 := StrToDate( FormatDateTime('dd/mm/yyyy',Now))  ;
  // Pega o Serial do HD
  cSerial := U_FuncReg.SerialNum( Copy(ExtractFileDrive(Application.ExeName),1,1) ) ;
  // Função que Checa o registro e grava o Serial do sistema
  qQry := TFDQuery.Create(Nil) ;
  with qQry do
    begin
      Close;
      Connection         :=  dmEmp.SqlConSis;
      SQL.Text           :=  'SELECT * FROM "dbconfig".registro Where reg_cdserial = '+QuotedStr( cSerial )+' order by reg_cdserial';
      Open;
  end;
  if qQry.IsEmpty then Begin
        with qQry do
          begin
            Close;
            Connection         :=  dmEmp.SqlConSis;
            SQL.Text           :=  'insert into "dbconfig".registro (  reg_cdserial,  reg_dtinst,  reg_usuinc,  reg_datinc,  reg_horinc )'+
                                                           ' Values ( :reg_cdserial, :reg_dtinst, :reg_usuinc, :reg_datinc, :reg_horinc )';
            ParamByName('reg_cdserial').Text  := cSerial ;
            ParamByName('reg_dtinst').AsDate  := Now ;
            ParamByName('reg_usuinc').Text    := sysUsuario ;
            ParamByName('reg_datinc').AsDate  := Now ;
            ParamByName('reg_horinc').Text    := TimeToStr(time) ;
            ExecSQL;
        end;

      data2 := StrToDate( FormatDateTime('dd/mm/yyyy',Now))  ;
      u_funcao.DiasAtiv := DaysBetween( data1 , data2 ) ;
  End Else
      data2 := StrToDate( FormatDateTime('dd/mm/yyyy', qQry.FieldByName('reg_dtinst').AsDateTime ))  ;
      u_funcao.DiasAtiv := DaysBetween( data1 , data2 );

end;

procedure TfPrincipal.Combustvel2Click(Sender: TObject);
begin
  frmRelComb := TfrmRelComb.Create(Self);
  frmRelComb.Show;

end;

procedure TfPrincipal.EmpresaSelectTxt();
Var
SQLQ : TFDQuery ;
nIp  : TIdIPWatch;
begin
  nIp  := TIdIPWatch.Create(nil);


  // Gerando os Turmas
  SQLQ := TFDQuery.Create(Self) ;
  with SQLQ do
   begin
      Close;
      Connection:= dmEmp.SqlConSis;
      SQL.Text:='SELECT * FROM "dbconfig".empresa Where emp_Fantasia = :Fantasia';
      ParamByName('Fantasia').Text := u_funcao.BancoAtual ;
      Open;
  end;
  fPrincipal.Caption := U_funcao.nmPrograma+'  - Versão '+U_funcao.GetVersion +' - Licenciado para Empresa: '+SQLQ.FieldByName('emp_nome').AsString+'  -  CPNJ: '+U_funcao.Mascara( SQLQ.FieldByName('emp_CNPJ').AsString,'99.999.999/9999-99');
  U_funcao.cDatexe   := DateToStr( SQLQ.FieldByName('emp_datexe').AsDateTime );
  U_funcao.cHorexe   := SQLQ.FieldByName('emp_horexe').Text;
  lbConectado.Caption := U_funcao.nmPrograma+'  <'+ #13 +
                        'Desenvolvido por: Alessandro Avelino  <'+ #13 +
                        'Telefone (85)98716 7990 - E-Mail: avelinoalessandro@gmail.com  <'+ #13 +
                        'Sistema Operacional: '+U_funcao.Estrutura+' Endereço Ip '+ nIp.LocalIP+'  <'+ #13 +
                        '--------------------------------------------------------------------------<'+ #13 +
                        'Ultima Atualização: '+U_funcao.cDatexe+' - '+U_funcao.cHorexe+' Versão Atual: '+U_funcao.VersaoExe+'  <'+ #13 +
                        'Database '+U_funcao.TipoCnx+' Nº de Serie '+U_FuncReg.SerialNum(Copy(ExtractFileDrive(Application.ExeName),1,1)) +'  <'+ #13 +
                        '<';
  lbempresa.Caption :=  'Conectado à:[ '+SQLQ.FieldByName('emp_nome').AsString+'  -  CPNJ: '+U_funcao.Mascara( SQLQ.FieldByName('emp_CNPJ').AsString,'99.999.999/9999-99')+' ]';
  nIp.free;
End;

procedure TfPrincipal.Pintar(imagem: TImageList; Barra: TStatusBar;
  Panel: TStatusPanel; Rect: TRect ; IndiceImagem : Integer);
begin
   Barra.Canvas.FillRect(Rect);
   Barra.Canvas.TextOut(Rect.Left+18, Rect.Top, Panel.Text);
   imagem.Draw(Barra.Canvas, Rect.Left+15, Rect.Top,IndiceImagem);
end;



function TfPrincipal.MD5(const texto:string):string;
var
  idmd5 : TIdHashMessageDigest5;
begin
  idmd5 := TIdHashMessageDigest5.Create;
  try
    result := idmd5.HashStringAsHex(texto);
  finally
    idmd5.Free;
  end;
end;

function  TfPrincipal.RetCmp( S : string ) : string;
Var
  Texto: String;
  Tamanho, Start: Integer;
Begin
    Start   := Pos( ':', S );
    Tamanho := Length(s) - Start;
    Result  := Copy(s,(Start+1),Tamanho)

End;

procedure TrimAppMemorySize;
var
MainHandle : THandle;
begin
try
MainHandle := OpenProcess(PROCESS_ALL_ACCESS, false, GetCurrentProcessID) ;
SetProcessWorkingSetSize(MainHandle, $FFFFFFFF, $FFFFFFFF) ;
CloseHandle(MainHandle) ;
except
end;
Application.ProcessMessages;
end;

end.
{
8: Coloca(’ [BACKSPACE] ‘);
9: Coloca(’ [TAB] ‘);
12: Coloca(’ [ALT] ‘);
13: Coloca(’ [ENTER] ‘);
16: Coloca(’ [SHIFT] ‘);
17: Coloca(’ [CONTROL] ‘);
18: Coloca(’ [ALT] ‘);
20: Coloca(’ [CAPS LOCK] ‘);
21: Coloca(’ [PAGE UP] ‘);
27: Coloca(’ [ESC] ‘);
33: Coloca(’ [PAGE UP] ‘);
34: Coloca(’ [PAGE DOWN] ‘);
35: Coloca(’ [END] ‘);
36: Coloca(’ [HOME] ‘);
37: Coloca(’ [SETA ESQUERDA] ‘);
38: Coloca(’ [SETA ACIMA] ‘);
39: Coloca(’ [SETA DIREITA] ‘);
40: Coloca(’ [SETA ABAIXO] ‘);
45: Coloca(’ [INSERT] ‘);
46: Coloca(’ [DEL] ‘);
91: Coloca(’ [WIN ESQUERDA] ‘);
92: Coloca(’ [WIN DIREITA] ‘);
93: Coloca(’ [MENU POP-UP] ‘);
96: Coloca(’0&8242;);
97: Coloca(’1&8242;);
98: Coloca(’2&8242;);
99: Coloca(’3&8242;);
100: Coloca(’4&8242;);
101: Coloca(’5&8242;);
102: Coloca(’6&8242;);
103: Coloca(’7&8242;);
104: Coloca(’8&8242;);
105: Coloca(’9&8242;);
106: Coloca(’ [NUM *] ‘);
107: Coloca(’ [NUM +] ‘);
109: Coloca(’ [NUM -] ‘);
110: Coloca(’ [NUM SEP. DECIMAL] ‘);
111: Coloca(’ [NUM /] ‘);
112: Coloca(’ [F1] ‘);
113: Coloca(’ [F2] ‘);
114: Coloca(’ [F3] ‘);
115: Coloca(’ [F4] ‘);
116: Coloca(’ [F5] ‘);
117: Coloca(’ [F6] ‘);
118: Coloca(’ [F7] ‘);
119: Coloca(’ [F8] ‘);
120: Coloca(’ [F9] ‘);
121: Coloca(’ [F10] ‘);
122: Coloca(’ [F11] ‘);
123: Coloca(’ [F12] ‘);
144: Coloca(’ [NUM LOCK] ‘);
186: Coloca(’Ç’);
187: Coloca(’=´);
188: Coloca(’,´);
189: Coloca(’-´);
190: Coloca(’.´);
191: Coloca(’;´);
192: Coloca(’ [APÓSTROFO] ‘);
193: Coloca(’/´);
194: Coloca(’ [NUM PONTO] ‘);
219: Coloca(’´’);
220: Coloca(’]´);
221: Coloca(’[´);
222: Coloca(’~´);
226: Coloca(’\´);


VK_LBUTTON Left mouse button
VK_RBUTTON Right mouse button
VK_CANCEL Control+Break
VK_MBUTTON Middle mouse button
VK_BACK Backspace key
VK_TAB Tab key
VK_CLEAR Clear key
VK_RETURN Enter key
VK_SHIFT Shift key
VK_CONTROL Ctrl key
VK_MENU Alt key
VK_PAUSE Pause key
VK_CAPITAL Caps Lock key
VK_KANA Used with IME
VK_HANGUL Used with IME
VK_JUNJA Used with IME
VK_FINAL Used with IME
VK_HANJA Used with IME
VK_KANJI Used with IME
VK_CONVERT Used with IME
VK_NONCONVERT Used with IME
VK_ACCEPT Used with IME
VK_MODECHANGE Used with IME
VK_ESCAPE Esc key
VK_SPACE Space bar
VK_PRIOR Page Up key
VK_NEXT Page Down key
VK_END End key
VK_HOME Home key
VK_LEFT Left Arrow key
VK_UP Up Arrow key
VK_RIGHT Right Arrow key
VK_DOWN Down Arrow key
VK_SELECT Select key
VK_PRINT Print key (keyboard-specific)
VK_EXECUTE Execute key
VK_SNAPSHOT Print Screen key
VK_INSERT Insert key
VK_DELETE Delete key
VK_HELP Help key
VK_LWIN Left Windows key (Microsoft keyboard)
VK_RWIN Right Windows key (Microsoft keyboard)
VK_APPS Applications key (Microsoft keyboard)
VK_NUMPAD0 0 key (numeric keypad)
VK_NUMPAD1 1 key (numeric keypad)
VK_NUMPAD2 2 key (numeric keypad)
VK_NUMPAD3 3 key (numeric keypad)
VK_NUMPAD4 4 key (numeric keypad)
VK_NUMPAD5 5 key (numeric keypad)
VK_NUMPAD6 6 key (numeric keypad)
VK_NUMPAD7 7 key (numeric keypad)
VK_NUMPAD8 8 key (numeric keypad)
VK_NUMPAD9 9 key (numeric keypad)
VK_MULTIPLY Multiply key (numeric keypad)
VK_ADD Add key (numeric keypad)
VK_SEPARATOR Separator key (numeric keypad)
VK_SUBTRACT Subtract key (numeric keypad)
VK_DECIMAL Decimal key (numeric keypad)
VK_DIVIDE Divide key (numeric keypad)
VK_F1 F1 key
VK_F2 F2 key
VK_F3 F3 key
VK_F4 F4 key
VK_F5 F5 key
VK_F6 F6 key
VK_F7 F7 key
VK_F8 F8 key
VK_F9 F9 key
VK_F10 F10 key
VK_F11 F11 key
VK_F12 F12 key
VK_F13 F13 key
VK_F14 F14 key
VK_F15 F15 key
VK_F16 F16 key
VK_F17 F17 key
VK_F18 F18 key
VK_F19 F19 key
VK_F20 F20 key
VK_F21 F21 key
VK_F22 F22 key
VK_F23 F23 key
VK_F24 F24 key
VK_NUMLOCK Num Lock key
VK_SCROLL Scroll Lock key
VK_LSHIFT Left Shift key (only used with GetAsyncKeyState and GetKeyState)
VK_RSHIFT Right Shift key (only used with GetAsyncKeyState and GetKeyState)
VK_LCONTROL Left Ctrl key (only used with GetAsyncKeyState and GetKeyState)
VK_RCONTROL Right Ctrl key (only used with GetAsyncKeyState and GetKeyState)
VK_LMENU Left Alt key (only used with GetAsyncKeyState and GetKeyState)
VK_RMENU Right Alt key (only used with GetAsyncKeyState and GetKeyState)
VK_PROCESSKEY Process key
VK_ATTN Attn key
VK_CRSEL CrSel key
VK_EXSEL ExSel key
VK_EREOF Erase EOF key
VK_PLAY Play key
VK_ZOOM Zoom key
VK_NONAME Reserved for future use
VK_PA1 PA1 key
VK_OEM_CLEAR Clear key
}


