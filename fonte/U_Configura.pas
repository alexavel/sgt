unit U_Configura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, ImgList, ExtCtrls, ComCtrls, xmldom,
  XMLIntf, IdHTTP, msxmldom, XMLDoc, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, RibbonLunaStyleActnCtrls, Ribbon,
  ToolWin, ActnMan, ActnCtrls, jpeg, Grids, DBGrids, ExtDlgs, Clipbrd, edittuning, U_ClasseUtil,
  Vcl.Menus, Vcl.Buttons, System.ImageList, ACBrMail, ACBrBase, ACBrDFe, ACBrCTe,
  Vcl.OleCtrls, SHDocVw, ACBrCTeDACTEClass, Vcl.Imaging.pngimage ;

type
  TfrmConfigura = class(TForm)
    pgConfigura: TPageControl;
    pgConfigura01: TTabSheet;
    Button1: TButton;
    imgConfigura: TImageList;
    Button2: TButton;
    DBImage1: TDBImage;
    btnImage: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    Banner: TPanel;
    Image1: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    grbDados01: TGroupBox;
    cfg_Empresa: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    cfg_Fantasia: TEdit;
    Label3: TLabel;
    cfg_CNPJ: TMaskEdit;
    Label9: TLabel;
    cfg_telef1: TMaskEdit;
    Label39: TLabel;
    cfg_telef2: TMaskEdit;
    Label4: TLabel;
    cfg_endereco: TEdit;
    cfg_numero: TEdit;
    Label5: TLabel;
    cfg_bairro: TEdit;
    Label6: TLabel;
    Label24: TLabel;
    cfg_codcid: TButtonedEdit;
    edNomCid: TEdit;
    edUf: TEdit;
    Label21: TLabel;
    cfg_cep: TMaskEdit;
    Label7: TLabel;
    cfg_email: TEdit;
    cfg_site: TEdit;
    Label8: TLabel;
    Conexoes: TGroupBox;
    cfg_Conexao: TEdit;
    Label10: TLabel;
    cfg_usucon: TEdit;
    Label11: TLabel;
    cfg_sencon: TEdit;
    Label12: TLabel;
    cfg_portacon: TEdit;
    Label13: TLabel;
    cfg_hostcon: TEdit;
    Label14: TLabel;
    cfg_seguricon: TCheckBox;
    cfg_autenticon: TCheckBox;
    Label16: TLabel;
    Label15: TLabel;
    cfg_TSL: TComboBox;
    cfg_Metodo: TComboBox;
    GroupBox1: TGroupBox;
    cfg_atcpf: TCheckBox;
    Label17: TLabel;
    cfg_totpar: TEdit;
    tbDiretrivas: TTabSheet;
    GroupBox2: TGroupBox;
    TbBarra: TToolBar;
    TbCopiar: TToolButton;
    TbCortar: TToolButton;
    TbColar: TToolButton;
    ToolButton3: TToolButton;
    TbDesfazer: TToolButton;
    tbSelecionar_tudo: TToolButton;
    ToolButton4: TToolButton;
    TbNegrito: TToolButton;
    TbItalico: TToolButton;
    TbSublinhado: TToolButton;
    ToolButton5: TToolButton;
    TbCor_fonte: TToolButton;
    TbFonte: TToolButton;
    ToolButton6: TToolButton;
    TbEsquerda: TToolButton;
    TbCentralizado: TToolButton;
    TbDireita: TToolButton;
    cfg_ofctransf: TRichEdit;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    FontDialog1: TFontDialog;
    ColorDialog1: TColorDialog;
    PrintDialog1: TPrintDialog;
    TTimer: TTimer;
    ImageList: TImageList;
    GroupBox3: TGroupBox;
    Label18: TLabel;
    cfg_endtablic: TEdit;
    cfg_atcnpj: TCheckBox;
    cfg_atcep: TCheckBox;
    cfg_mntimpr: TCheckBox;
    Label19: TLabel;
    cfg_kmveri: TMaskEdit;
    tbCTE: TTabSheet;
    gbxGeral: TGroupBox;
    Label23: TLabel;
    sbtnLogoMarca: TSpeedButton;
    sbtnPathSalvar: TSpeedButton;
    edtLogoMarca: TEdit;
    edtPathLogs: TEdit;
    ckSalvar: TCheckBox;
    rgTipoDACTe: TRadioGroup;
    rgFormaEmissao: TRadioGroup;
    gbxWebService: TGroupBox;
    Label26: TLabel;
    ckVisualizar: TCheckBox;
    cbUF: TComboBox;
    rgTipoAmb: TRadioGroup;
    gbxProxy: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    edtProxyHost: TEdit;
    edtProxyPorta: TEdit;
    edtProxyUser: TEdit;
    edtProxySenha: TEdit;
    gbxEmail: TGroupBox;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    edtSmtpHost: TEdit;
    edtSmtpPort: TEdit;
    edtSmtpUser: TEdit;
    edtSmtpPass: TEdit;
    edtEmailAssunto: TEdit;
    cbEmailSSL: TCheckBox;
    mmEmailMsg: TMemo;
    gbxEmitente: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    edtEmitCNPJ: TEdit;
    edtEmitIE: TEdit;
    edtEmitRazao: TEdit;
    edtEmitFantasia: TEdit;
    edtEmitFone: TEdit;
    edtEmitCEP: TEdit;
    edtEmitLogradouro: TEdit;
    edtEmitNumero: TEdit;
    edtEmitComp: TEdit;
    edtEmitBairro: TEdit;
    edtEmitCodCidade: TEdit;
    edtEmitCidade: TEdit;
    edtEmitUF: TEdit;
    ACBrMail1: TACBrMail;
    ACBrCTe1: TACBrCTe;
    OpenDialog2: TOpenDialog;
    GroupBox4: TGroupBox;
    Label20: TLabel;
    Label22: TLabel;
    sbtnCaminhoCert: TSpeedButton;
    Label25: TLabel;
    sbtnGetCert: TSpeedButton;
    edtCaminho: TEdit;
    edtSenha: TEdit;
    edtNumSerie: TEdit;
    btnSalvarConfig: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure matconxExit(Sender: TObject);
    procedure menconxExit(Sender: TObject);
    procedure mtrconxExit(Sender: TObject);
    procedure matconxKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure menconxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mtrconxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure matconxRightButtonClick(Sender: TObject);
    procedure menconxRightButtonClick(Sender: TObject);
    procedure mtrconxRightButtonClick(Sender: TObject);
    procedure btnImageClick(Sender: TObject);
    procedure CarregaImagem(BlobField: TBlobField; DBImage1, ImagePadrao: TDBImage);
    procedure FormCreate(Sender: TObject);
    procedure cfg_codcidExit(Sender: TObject);
    procedure cfg_codcidKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cfg_codcidRightButtonClick(Sender: TObject);
    procedure TbCopiarClick(Sender: TObject);
    procedure TbCortarClick(Sender: TObject);
    procedure TbColarClick(Sender: TObject);
    procedure TbDesfazerClick(Sender: TObject);
    procedure tbSelecionar_tudoClick(Sender: TObject);
    procedure TbNegritoClick(Sender: TObject);
    procedure TbItalicoClick(Sender: TObject);
    procedure TbSublinhadoClick(Sender: TObject);
    procedure TbCor_fonteClick(Sender: TObject);
    procedure TbFonteClick(Sender: TObject);
    procedure TbEsquerdaClick(Sender: TObject);
    procedure TbCentralizadoClick(Sender: TObject);
    procedure TbDireitaClick(Sender: TObject);
    procedure cfg_ofctransfChange(Sender: TObject);
    procedure cfg_kmveriKeyPress(Sender: TObject; var Key: Char);
    procedure sbtnCaminhoCertClick(Sender: TObject);
    procedure sbtnGetCertClick(Sender: TObject);
    procedure sbtnLogoMarcaClick(Sender: TObject);
    procedure sbtnPathSalvarClick(Sender: TObject);
    procedure btnSalvarConfigClick(Sender: TObject);
  private
    procedure mudar_estilo(estilo: TFontStyle);
    procedure LerCteCfg;
    { Private declarations }
  public
    { Public declarations }
    { Public declarations }
    aEdits : array of TComponent;
    cCodigo: String;
    stImagem: TFileStream;


  end;

var
  frmConfigura: TfrmConfigura;

implementation

uses MaskUtils , U_Pesquisa, uSistema, U_funcao, u_classCons,
  U_dmEmp,   FileCtrl, DateUtils,
  pcnConversao, pcteConversaoCTe, ACBrUtil,
  ACBrCTeConhecimentos;

const
  SELDIRHELP = 1000;

{$R *.dfm}

procedure TfrmConfigura.btnImageClick(Sender: TObject);
begin
OpenPictureDialog1.Execute;
stImagem := TFileStream.Create(OpenPictureDialog1.FileName, fmShareDenyWrite );

//Table1.Edit;
DbImage1.Picture.LoadFromFile(OpenPictureDialog1.Filename);
//DBImage1.Stretch := true;
DBImage1.Refresh;
end;

procedure TfrmConfigura.btnSalvarConfigClick(Sender: TObject);
begin
  dmEmp.sqlCtecfg.Close;
  with dmEmp.sqlCtecfg do begin
       SQL.Text := 'Insert Into '+U_funcao.SelSchema('cfgcte')+'( '
                  +'cte_caminho,    cte_senha,    cte_numserie,   cte_dacte,      cte_formaemiss, '
                  +'cte_logomarca,  cte_salvar,   cte_pathsalvar, cte_uf,         cte_ambiente,   cte_visualizar, '
                  +'cte_host,       cte_porta,    cte_user,       cte_pass,       cte_cnpj,       cte_ie,         '
                  +'cte_razaosocial,cte_fantasia, cte_fone,       cte_cep,        cte_logradouro, cte_numero,     '
                  +'cte_complemento,cte_bairro,   cte_codcidade,  cte_cidade,     cte_ufemite,    cte_emahost,    '
                  +'cte_emaport,    cte_emauser,  cte_emapass,    cte_emaassunto, cte_emaassl,    cte_mensagem,   '
                  +'cte_usuinc,     cte_datinc,   cte_horinc,     cte_usualt,     cte_datalt,     cte_horalt      '
                  +') Values ( '
                  +':cte_caminho,    :cte_senha,    :cte_numserie,   :cte_dacte,      :cte_formaemiss, '
                  +':cte_logomarca,  :cte_salvar,   :cte_pathsalvar, :cte_uf,         :cte_ambiente,   :cte_visualizar, '
                  +':cte_host,       :cte_porta,    :cte_user,       :cte_pass,       :cte_cnpj,       :cte_ie,         '
                  +':cte_razaosocial,:cte_fantasia, :cte_fone,       :cte_cep,        :cte_logradouro, :cte_numero,     '
                  +':cte_complemento,:cte_bairro,   :cte_codcidade,  :cte_cidade,     :cte_ufemite,    :cte_emahost,    '
                  +':cte_emaport,    :cte_emauser,  :cte_emapass,    :cte_emaassunto, :cte_emaassl,    :cte_mensagem,   '
                  +':cte_usuinc,     :cte_datinc,   :cte_horinc,     :cte_usualt,     :cte_datalt,     :cte_horalt     )';
       ParamByName('cte_caminho').Text        := edtCaminho.Text  ;
       ParamByName('cte_senha').Text          := edtSenha.Text    ;
       ParamByName('cte_numserie').Text       := edtNumSerie.Text ;
       ParamByName('cte_dacte').AsInteger     := rgTipoDACTe.ItemIndex ;
       ParamByName('cte_formaemiss').AsInteger:= rgFormaEmissao.ItemIndex ;
       ParamByName('cte_logomarca').Text      := edtLogoMarca.Text ;
       ParamByName('cte_salvar').AsBoolean    := ckSalvar.Checked ;
       ParamByName('cte_pathsalvar').Text     := edtPathLogs.Text ;
       ParamByName('cte_uf').Text             := cbUF.Text;
       ParamByName('cte_ambiente').AsInteger  := rgTipoAmb.ItemIndex;
       ParamByName('cte_visualizar').AsBoolean:= ckVisualizar.Checked;
       ParamByName('cte_host').Text           := edtProxyHost.Text;
       ParamByName('cte_porta').Text          := edtProxyPorta.Text;
       ParamByName('cte_user').Text           := edtProxyUser.Text;
       ParamByName('cte_pass').Text           := edtProxySenha.Text;
       ParamByName('cte_cnpj').Text           := edtEmitCNPJ.Text;
       ParamByName('cte_ie').Text             := edtEmitIE.Text;
       ParamByName('cte_razaosocial').Text    := edtEmitRazao.Text;
       ParamByName('cte_fantasia').Text       := edtEmitFantasia.Text;
       ParamByName('cte_fone').Text           := edtEmitFone.Text;
       ParamByName('cte_cep').Text            := edtEmitCEP.Text;
       ParamByName('cte_logradouro').Text     := edtEmitLogradouro.Text;
       ParamByName('cte_numero').Text         := edtEmitNumero.Text;
       ParamByName('cte_complemento').Text    := edtEmitComp.Text;
       ParamByName('cte_bairro').Text         := edtEmitBairro.Text;
       ParamByName('cte_codcidade').Text      := edtEmitCodCidade.Text;
       ParamByName('cte_cidade').Text         := edtEmitCidade.Text;
       ParamByName('cte_ufemite').Text        := edtEmitUF.Text;
       ParamByName('cte_emahost').Text        := edtSmtpHost.Text;
       ParamByName('cte_emaport').Text        := edtSmtpPort.Text;
       ParamByName('cte_emauser').Text        := edtSmtpUser.Text;
       ParamByName('cte_emapass').Text        := edtSmtpPass.Text;
       ParamByName('cte_emaassunto').Text     := edtEmailAssunto.Text;
       ParamByName('cte_emaassl').AsBoolean   := cbEmailSSL.Checked ;
       ParamByName('cte_mensagem').Text       := mmEmailMsg.Text ;
       ParamByName('cte_usuinc').Text         := sysUsuario ;
       ParamByName('cte_datinc').AsDate       := now  ;
       ParamByName('cte_horinc').Text         := TimeToStr(now) ;
       ParamByName('cte_usualt').Text         := sysUsuario ;
       ParamByName('cte_datalt').AsDate       := now ;
       ParamByName('cte_horalt').Text         := TimeToStr(now);
       ExecSQL;
  end;
  LerCteCfg;

end;

procedure TfrmConfigura.LerCteCfg;
var
 IniFile    : String;
 Ok         : Boolean;
 StreamMemo : TMemoryStream;
begin
   dmEmp.sqlCtecfg.Open;
   with dmEmp.sqlCtecfg do begin
     try
      {$IFDEF ACBrCTeOpenSSL}
         edtCaminho.Text  := FieldByName('cte_caminho').Text;
         edtSenha.Text    := FieldByName('cte_senha').Text;
         ACBrCTe1.Configuracoes.Certificados.Certificado  := edtCaminho.Text;
         ACBrCTe1.Configuracoes.Certificados.Senha        := edtSenha.Text;
         edtNumSerie.Visible := False;
         Label25.Visible     := False;
         sbtnGetCert.Visible := False;
      {$ELSE}
         edtNumSerie.Text := FieldByName('cte_numserie').Text;
         ACBrCTe1.Configuracoes.Certificados.NumeroSerie := edtNumSerie.Text;
         //edtNumSerie.Text := ACBrCTe1.Configuracoes.Certificados.NumeroSerie;
         Label20.Caption := 'Informe o número de série do certificado'#13+
                            'Disponível no Internet Explorer no menu'#13+
                            'Ferramentas - Opções da Internet - Conteúdo '#13+
                            'Certificados - Exibir - Detalhes - '#13+
                            'Número do certificado';
         Label2.Visible     := False;
         edtCaminho.Visible := False;
         edtSenha.Visible   := False;
         sbtnCaminhoCert.Visible := False;
      {$ENDIF}

      rgFormaEmissao.ItemIndex := FieldByName('cte_formaemiss').AsInteger;
      ckSalvar.Checked         := FieldByName('cte_salvar').AsBoolean;
      edtPathLogs.Text         := FieldByName('cte_pathsalvar').Text;

      case rgFormaEmissao.ItemIndex of
       0: ACBrCTe1.Configuracoes.Geral.FormaEmissao := teNormal;
       1: ACBrCTe1.Configuracoes.Geral.FormaEmissao := teDPEC; // o mesmo que EPEC
       2: ACBrCTe1.Configuracoes.Geral.FormaEmissao := teFSDA;
       3: ACBrCTe1.Configuracoes.Geral.FormaEmissao := teSVCRS;
       4: ACBrCTe1.Configuracoes.Geral.FormaEmissao := tESVCSP;
      end;

      ACBrCTe1.Configuracoes.Geral.Salvar := ckSalvar.Checked;

      ACBrCTe1.Configuracoes.Arquivos.PathSalvar := edtPathLogs.Text;

      cbUF.ItemIndex       := cbUF.Items.IndexOf( FieldByName('cte_uf').Text );
      rgTipoAmb.ItemIndex  := FieldByName('cte_ambiente').AsInteger;
      ckVisualizar.Checked := FieldByName('cte_visualizar').AsBoolean;
      ACBrCTe1.Configuracoes.WebServices.UF         := cbUF.Text;
      ACBrCTe1.Configuracoes.WebServices.Ambiente   := StrToTpAmb(Ok,IntToStr(rgTipoAmb.ItemIndex+1));
      ACBrCTe1.Configuracoes.WebServices.Visualizar := ckVisualizar.Checked;

      edtProxyHost.Text  := FieldByName('cte_host').Text;
      edtProxyPorta.Text := FieldByName('cte_porta').Text;
      edtProxyUser.Text  := FieldByName('cte_user').Text;
      edtProxySenha.Text := FieldByName('cte_pass').Text;
      ACBrCTe1.Configuracoes.WebServices.ProxyHost := edtProxyHost.Text;
      ACBrCTe1.Configuracoes.WebServices.ProxyPort := edtProxyPorta.Text;
      ACBrCTe1.Configuracoes.WebServices.ProxyUser := edtProxyUser.Text;
      ACBrCTe1.Configuracoes.WebServices.ProxyPass := edtProxySenha.Text;

      rgTipoDACTe.ItemIndex := FieldByName('cte_dacte').AsInteger;
      edtLogoMarca.Text     := FieldByName('cte_logomarca').Text;

      if ACBrCTe1.DACTe <> nil then
       begin
        ACBrCTe1.DACTe.TipoDACTe    := StrToTpImp(OK,IntToStr(rgTipoDaCTe.ItemIndex+1));
        ACBrCTe1.DACTe.Logo         := edtLogoMarca.Text;
        ACBrCTe1.DACTe.PathPDF      := edtPathLogs.Text;
        ACBrCTe1.DACTe.TamanhoPapel := tpA4_2vias;
       end;

      edtEmitCNPJ.Text       := FieldByName('cte_cnpj').Text;
      edtEmitIE.Text         := FieldByName('cte_ie').Text;
      edtEmitRazao.Text      := FieldByName('cte_razaosocial').Text;
      edtEmitFantasia.Text   := FieldByName('cte_fantasia').Text;
      edtEmitFone.Text       := FieldByName('cte_fone').Text;
      edtEmitCEP.Text        := FieldByName('cte_cep').Text;
      edtEmitLogradouro.Text := FieldByName('cte_logradouro').Text;
      edtEmitNumero.Text     := FieldByName('cte_numero').Text;
      edtEmitComp.Text       := FieldByName('cte_complemento').Text;
      edtEmitBairro.Text     := FieldByName('cte_bairro').Text;
      edtEmitCodCidade.Text  := FieldByName('cte_codcidade').Text;
      edtEmitCidade.Text     := FieldByName('cte_cidade').Text;
      edtEmitUF.Text         := FieldByName('cte_ufemite').Text;

      edtSmtpHost.Text      := FieldByName('cte_emahost').Text;
      edtSmtpPort.Text      := FieldByName('cte_emaport').Text;
      edtSmtpUser.Text      := FieldByName('cte_emauser').Text;
      edtSmtpPass.Text      := FieldByName('cte_emapass').Text;
      edtEmailAssunto.Text  := FieldByName('cte_emaassunto').Text;
      cbEmailSSL.Checked    := FieldByName('cte_emaassl').AsBoolean;

      ACBrCTe1.MAIL.Host      := edtSmtpHost.Text;
      ACBrCTe1.MAIL.Port      := edtSmtpPort.Text;
      ACBrCTe1.MAIL.Username  := edtSmtpUser.Text;
      ACBrCTe1.MAIL.Password  := edtSmtpPass.Text;
      ACBrCTe1.MAIL.SetSSL    := cbEmailSSL.Checked;
      ACBrCTe1.MAIL.ReadingConfirmation := False;

     finally
      Free;
     end;

   end;
end;

procedure TfrmConfigura.Button1Click(Sender: TObject);
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, cHorAlt,cCodSql, cIteSql,cValSql : string ;
dData, dDatAlt : TDate ;
i, tmp: Integer;
Stream    : TMemoryStream;
begin
  cUsu    :=  sysUsuario;
  dData   :=  date ;
  cHora   :=  TimeToStr(time) ;

  msFoto01 := TMemoryStream.Create;
  Memo1.Text := '';

 // Carrega Imagem para o Comp. Image
  if (DBImage1.Picture.Graphic = nil) or DBImage1.Picture.Graphic.Empty then
     begin

     end
    else begin
        DBImage1.Picture.Graphic.SaveToStream(msFoto01);
    end;

  dmEmp.sqlConfigura.Close;
  Stream            := TMemoryStream.Create;
  // Gera Scrip de Update
  cCodSql:= 'update "dbconfig".Configura set ';
  for i := 0 to Length(aEdits)-1 do begin
       if aEdits[i].name <> 'cfg_codigo' then
          begin
          cIteSql:= cIteSql+aEdits[i].Name+' = :'+aEdits[i].Name+', ';
        end;
  end;
  cIteSql:= cIteSql + ' cfg_foto = :foto,  cfg_usuinc = :Usuario,  cfg_datinc = :Data ';// Where codigo = '+ccodigo;
  cCodSql:=cCodSql+cIteSql;
  // jogando os parametros
  dmEmp.sqlConfigura.Sql.Text := cCodSql ;
  for i := 0 to Length(aEdits)-1 do begin
       if aEdits[i].name <> 'cfg_codigo' then
          begin

          If aEdits[i].ClassType = Tedit Then
              Begin
                  dmEmp.sqlConfigura.ParamByName(aEdits[i].name).Text     :=  TEdit(aEdits[i]).Text ;
              End;

          If aEdits[i].ClassType = TMaskEdit Then
              Begin
                  dmEmp.sqlConfigura.ParamByName(aEdits[i].name).Text     := RemoveChar(  TMaskEdit(aEdits[i]).text ) ;
              End;

          If aEdits[i].ClassType = TComboBox Then
              Begin
                  dmEmp.sqlConfigura.ParamByName(aEdits[i].name).Text     :=  TComboBox(aEdits[i]).text ;
              End;

          If aEdits[i].ClassType = TDateTimePicker Then
              Begin
                  dmEmp.sqlConfigura.ParamByName(aEdits[i].name).Text     := DateToStr( TDateTimePicker(aEdits[i]).Date );
              End;

          If aEdits[i].ClassType = TButtonedEdit Then
              Begin
                  dmEmp.sqlConfigura.ParamByName(aEdits[i].name).Text     :=  TButtonedEdit(aEdits[i]).Text ;
              End;

          If aEdits[i].ClassType = TRichEdit Then
              Begin
                  TRichEdit(aEdits[i]).Lines.SaveToStream(Stream);
                  dmEmp.sqlConfigura.ParamByName(aEdits[i].Name).AsMemo  := TRichEdit(aEdits[i]).Lines.GetText;


              End;

          If aEdits[i].ClassType = TCheckBox Then
              Begin
                if TCheckBox(aEdits[i]).Checked then Begin
                    dmEmp.sqlConfigura.ParamByName(aEdits[i].name).Text     :=  'T' ;
                End Else Begin
                    dmEmp.sqlConfigura.ParamByName(aEdits[i].name).Text     :=  'F' ;
                End;
              End;


        end;
  end;

  if (DBImage1.Picture.Graphic = nil) or DBImage1.Picture.Graphic.Empty then
  begin
    dmEmp.sqlConfigura.ParamByName('Foto').AsString := Memo1.Text;
  end
  Else Begin
    dmEmp.sqlConfigura.ParamByName('Foto').LoadFromStream(msFoto01,ftBlob);
  End;
  dmEmp.sqlConfigura.ParamByName('Usuario').Text  :=  cUsu ;
  dmEmp.sqlConfigura.ParamByName('Data').AsDate   :=  Now ;

  dmEmp.sqlConfigura.ExecSQL;
  dmEmp.cliConfigura.ApplyUpdates(0);
  Auditor(Screen.activeform.Caption,'Alterou','Empresa: '+cfg_Empresa.Text );
  Diretrizes;
  Close;

end;

procedure TfrmConfigura.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmConfigura.menconxExit(Sender: TObject);
begin
//   frmPesquisa.ChkRelac( 'pconta','codpco','conta','', MenConx, nmMenCon,nil, dmEmp.IbqPConta , dmEmp.dsPconta ) ;

end;

procedure TfrmConfigura.menconxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      MenConxRightButtonClick(Self);
  end;
Finally

End;
end;

procedure TfrmConfigura.menconxRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Titulo, cHwewa: String;
begin
  Titulo:='Tabela de Planode Contas';
  // -----------------------  CAMPOS DO DBGRID -----------------------------//
  // arrays de TITULOS de pesquisa co combobox
  SetLength(aFcab,Length(aFcab)+1); aFcab[Length(aFcab)-1] :='Código';
  SetLength(aFcab,Length(aFcab)+1); aFcab[Length(aFcab)-1] :='Descrição da Conta';

  // arrays de CAMPOSde pesquisa co combobox
  SetLength(aFcam,Length(aFcam)+1); aFcam[Length(aFcam)-1] :='codpco';
  SetLength(aFcam,Length(aFcam)+1); aFcam[Length(aFcam)-1] :='conta';

  // arrays de TAMANHO DOS CAMPOS de pesquisa co combobox
  SetLength(aTcam,Length(aTcam)+1); aTcam[Length(aTcam)-1] :='100';
  SetLength(aTcam,Length(aTcam)+1); aTcam[Length(aTcam)-1] :='250';

  cHwewa := ' Where nivel  = ''A'' and  tipo = ''CRE'' ' ;
//  frmPesquisa := TfrmPesquisa.Create(self, Titulo, 'pconta',frmConfigura, MenConx ,nmMenCon, dmEmp.ibqPConta,dmEmp.dsPConta, aFcab, aFcam, aTcam, cHwewa,0);
//  frmPesquisa.ShowModal ; // Exibir só após ter posicionado[/code:1:e6b3da2fbb]


end;

procedure TfrmConfigura.mtrconxExit(Sender: TObject);
begin
//s   frmPesquisa.ChkRelac( 'pconta','codpco','conta','', MtrConx, nmMtrCon,nil, dmEmp.IbqPConta , dmEmp.dsPconta ) ;


end;

procedure TfrmConfigura.mtrconxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      MtrConxRightButtonClick(Self);
  end;
Finally

End;
end;

procedure TfrmConfigura.mtrconxRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Titulo, cHwewa: String;
begin
  Titulo:='Tabela de Planode Contas';
  // -----------------------  CAMPOS DO DBGRID -----------------------------//
  // arrays de TITULOS de pesquisa co combobox
  SetLength(aFcab,Length(aFcab)+1); aFcab[Length(aFcab)-1] :='Código';
  SetLength(aFcab,Length(aFcab)+1); aFcab[Length(aFcab)-1] :='Descrição da Conta';

  // arrays de CAMPOSde pesquisa co combobox
  SetLength(aFcam,Length(aFcam)+1); aFcam[Length(aFcam)-1] :='codpco';
  SetLength(aFcam,Length(aFcam)+1); aFcam[Length(aFcam)-1] :='conta';

  // arrays de TAMANHO DOS CAMPOS de pesquisa co combobox
  SetLength(aTcam,Length(aTcam)+1); aTcam[Length(aTcam)-1] :='100';
  SetLength(aTcam,Length(aTcam)+1); aTcam[Length(aTcam)-1] :='250';

  cHwewa := ' Where nivel  = ''A'' and  tipo = ''CRE'' ' ;
//  frmPesquisa := TfrmPesquisa.Create(self, Titulo, 'pconta',frmConfigura, MtrConx ,nmMtrCon, dmEmp.ibqPConta,dmEmp.dsPConta, aFcab, aFcam, aTcam, cHwewa,0);
//  frmPesquisa.ShowModal ; // Exibir só após ter posicionado[/code:1:e6b3da2fbb]


end;

procedure TfrmConfigura.TbCentralizadoClick(Sender: TObject);
begin
cfg_ofctransf.Paragraph.Alignment := taCenter;
end;

procedure TfrmConfigura.TbColarClick(Sender: TObject);
begin
  cfg_ofctransf.PasteFromClipboard;
end;

procedure TfrmConfigura.TbCopiarClick(Sender: TObject);
begin
  cfg_ofctransf.CopyToClipboard;
  //Colar1.Enabled:=True;
end;

procedure TfrmConfigura.TbCortarClick(Sender: TObject);
begin
  cfg_ofctransf.CutToClipboard;
  //Colar1.Enabled:=True; {habilita o item Colar}
end;

procedure TfrmConfigura.TbCor_fonteClick(Sender: TObject);
begin
 with cfg_ofctransf do
  if seltext <>  '' then
   begin
     ColorDialog1.Color:=cfg_ofctransf.Color;
     if ColorDialog1.Execute then
     cfg_ofctransf.SelAttributes.Color := ColorDialog1.Color;
   end
 else
   if ColorDialog1.Execute then
   cfg_ofctransf.SelAttributes.Color := ColorDialog1.Color;

end;

procedure TfrmConfigura.TbDesfazerClick(Sender: TObject);
begin
cfg_ofctransf.Undo;
end;

procedure TfrmConfigura.TbDireitaClick(Sender: TObject);
begin
cfg_ofctransf.Paragraph.Alignment := taRightJustify;
end;

procedure TfrmConfigura.TbEsquerdaClick(Sender: TObject);
begin
cfg_ofctransf.Paragraph.Alignment := taLeftJustify;
end;

procedure TfrmConfigura.TbFonteClick(Sender: TObject);
begin
 with cfg_ofctransf do
  if seltext <>  '' then
   begin
    FontDialog1.Font := cfg_ofctransf.Font;
   {inicializa a FontDialog com a font de RichEdit}
    if FontDialog1.Execute then
    cfg_ofctransf.SelAttributes.Name  := FontDialog1.Font.Name;
    cfg_ofctransf.SelAttributes.Size  := FontDialog1.Font.Size;
    cfg_ofctransf.SelAttributes.Style := FontDialog1.Font.Style;
    cfg_ofctransf.SelAttributes.Color := FontDialog1.Font.Color;
  end
  else
    if FontDialog1.Execute then
     cfg_ofctransf.SelAttributes.Color := FontDialog1.Font.Color;
     cfg_ofctransf.SelAttributes.Name  := FontDialog1.Font.Name;
     cfg_ofctransf.SelAttributes.Size  := FontDialog1.Font.Size;
     cfg_ofctransf.SelAttributes.Style := FontDialog1.Font.Style

end;

procedure TfrmConfigura.TbItalicoClick(Sender: TObject);
begin
mudar_estilo (fsItalic);
end;

procedure TfrmConfigura.TbNegritoClick(Sender: TObject);
begin
Mudar_estilo(fsBold);
end;

procedure TfrmConfigura.tbSelecionar_tudoClick(Sender: TObject);
begin
cfg_ofctransf.SelectAll;
end;

procedure TfrmConfigura.TbSublinhadoClick(Sender: TObject);
begin
mudar_estilo (fsUnderline);
end;

procedure TfrmConfigura.matconxExit(Sender: TObject);
begin
//  frmPesquisa.ChkRelac( 'pconta','codpco','conta','', MatConx, nmMatCon,nil, dmEmp.IbqPConta , dmEmp.dsPconta ) ;
end;
procedure TfrmConfigura.mudar_estilo(estilo: TFontStyle);
begin
  if not (estilo in cfg_ofctransf.SelAttributes.Style) then
    cfg_ofctransf.SelAttributes.Style:=cfg_ofctransf.SelAttributes.Style + [estilo]
  else
    cfg_ofctransf.SelAttributes.Style := cfg_ofctransf.SelAttributes.Style - [estilo];
end;

procedure TfrmConfigura.sbtnCaminhoCertClick(Sender: TObject);
begin
 OpenDialog1.Title := 'Selecione o Certificado';
 OpenDialog1.DefaultExt := '*.pfx';
 OpenDialog1.Filter := 'Arquivos PFX (*.pfx)|*.pfx|Todos os Arquivos (*.*)|*.*';
 OpenDialog1.InitialDir := ExtractFileDir(application.ExeName);

 if OpenDialog1.Execute then
  begin
   edtCaminho.Text := OpenDialog1.FileName;
  end;

end;

procedure TfrmConfigura.sbtnGetCertClick(Sender: TObject);
begin
  edtNumSerie.Text := ACBrCTe1.SSL.SelecionarCertificado;
end;

procedure TfrmConfigura.sbtnLogoMarcaClick(Sender: TObject);
begin
 OpenDialog1.Title := 'Selecione o Logo';
 OpenDialog1.DefaultExt := '*.bmp';
 OpenDialog1.Filter := 'Arquivos BMP (*.bmp)|*.bmp|Todos os Arquivos (*.*)|*.*';
 OpenDialog1.InitialDir := ExtractFileDir(application.ExeName);

 if OpenDialog1.Execute then
 begin
  edtLogoMarca.Text := OpenDialog1.FileName;
 end;

end;

procedure TfrmConfigura.sbtnPathSalvarClick(Sender: TObject);
var
 Dir : string;
begin
 if Length(edtPathLogs.Text) <= 0
  then Dir := ExtractFileDir(application.ExeName)
  else Dir := edtPathLogs.Text;

 if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt],SELDIRHELP)
  then edtPathLogs.Text := Dir;

end;

procedure TfrmConfigura.cfg_ofctransfChange(Sender: TObject);
begin
  //Recortar1.Enabled:=True;
  //Copiar1.Enabled:=True;
end;

procedure TfrmConfigura.matconxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      MatConxRightButtonClick(Self);
  end;
Finally

End;
end;


procedure TfrmConfigura.matconxRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Titulo, cHwewa: String;
begin
  Titulo:='Tabela de Planode Contas';
  // -----------------------  CAMPOS DO DBGRID -----------------------------//
  // arrays de TITULOS de pesquisa co combobox
  SetLength(aFcab,Length(aFcab)+1); aFcab[Length(aFcab)-1] :='Código';
  SetLength(aFcab,Length(aFcab)+1); aFcab[Length(aFcab)-1] :='Descrição da Conta';

  // arrays de CAMPOSde pesquisa co combobox
  SetLength(aFcam,Length(aFcam)+1); aFcam[Length(aFcam)-1] :='codpco';
  SetLength(aFcam,Length(aFcam)+1); aFcam[Length(aFcam)-1] :='conta';

  // arrays de TAMANHO DOS CAMPOS de pesquisa co combobox
  SetLength(aTcam,Length(aTcam)+1); aTcam[Length(aTcam)-1] :='100';
  SetLength(aTcam,Length(aTcam)+1); aTcam[Length(aTcam)-1] :='250';

  cHwewa := ' Where nivel  = ''A'' and  tipo = ''CRE'' ' ;
//  frmPesquisa := TfrmPesquisa.Create(self, Titulo, 'pconta',frmConfigura, matconx ,nmmatcon, dmEmp.ibqPConta,dmEmp.dsPConta, aFcab, aFcam, aTcam, cHwewa,0);
// frmPesquisa.ShowModal ; // Exibir só após ter posicionado[/code:1:e6b3da2fbb]


end;

procedure TfrmConfigura.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    dmEmp.sqlConfigura.Close;
    dmEmp.cliConfigura.Active := False;
    dmEmp.dspConfigura.DataSet.Active := False;

    frmConfigura := nil ;
    action := cafree;

end;

procedure TfrmConfigura.FormCreate(Sender: TObject);
begin
  dmEmp.sqlConfigura.Close;


 with dmEmp.sqlConfigura do
   begin
     //dbgrid1.DataSource.DataSet := dmEmp.ibqGrupo;
     Close;
     Sql.Text :='SELECT * FROM  "dbconfig".configura ';
     Open;
     cCodigo := FieldByName('cfg_codigo').ToString
     //frmGrupo.SetFocus;
 end;
  dmEmp.cliConfigura.Active := True;
  dmEmp.dspConfigura.DataSet.Active := True;

end;

procedure TfrmConfigura.FormShow(Sender: TObject);
var
i, tmp: Integer;
// Caso haja Imagem
Stm : TStream;
DBImage3: TDBImage;

begin
  // Cor do banner
  Banner.ParentBackGround := False;
  Banner.ParentColor      := False;
  Banner.Brush.Color      := u_funcao.Bronze_Escuro ;

  // Titulos do Banner
  lbCabeca01.Caption    := 'Configuração do Sistema';
  lbCabeca02.Caption    := u_funcao.nmSistema ;
  // Cores - Titulos do Banner
  lbCabeca01.Font.Color := u_funcao.clTit_BCad ;
  lbCabeca02.Font.Color := u_funcao.clTit_BCad ;

  // Gera o Array com os Componentes
  for i := 0 to ComponentCount-1 do begin

      if (Components[i].ClassType <> TLabel ) and ( LowerCase( copy(Components[i].Name, 1,4) ) = 'cfg_' ) then
          begin
          //Pega todos o TEduits
          if (Components[i].ClassType = Tedit) and Tedit(Components[i]).Enabled then
              Begin
                 SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := Tedit( Components[i] ) ;
              End;

          If  Components[i].Name = 'cfg_codigo' Then
              Begin
                  SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := Tedit( Components[i] ) ;
              End;


          //Pega todos o TMaskEdit
          if Components[i].ClassType = TMaskEdit then
          Begin
              SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := TMaskEdit( Components[i] ) ;
          End;

          //Pega todos o TComboBox
          if Components[i].ClassType = TComboBox then
          Begin
              SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := TComboBox( Components[i] ) ;
          End;

          //Pega todos o TDateTimePiker
          if Components[i].ClassType = TDateTimePicker then
          Begin
              SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := TDateTimePicker( Components[i] ) ;
          End;

          //Pega todos o TButtonedEdit
          if Components[i].ClassType = TButtonedEdit then
          Begin
              SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := TButtonedEdit( Components[i] ) ;
          End;

          //Pega todos o TButtonedEdit
          if Components[i].ClassType = TCheckBox then
          Begin
              SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := TCheckBox( Components[i] ) ;
          End;

          if Components[i].ClassType = TRichEdit then
          Begin
              SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := TRichEdit( Components[i] ) ;
          End;

       end;

  end;

  // Alimenta os componentes com os tamanho dos campos
  for i := 0 to Length(aEdits)-1 do begin
      //     TEdit(aEdits[i]).MaxLength := dmEmp.sqlConfigura.FieldByName( aEdits[i].name ).Size;
      If aEdits[i].ClassType = Tedit Then
          Begin
              TEdit(aEdits[i]).MaxLength := dmEmp.sqlConfigura.FieldByName( aEdits[i].name ).Size;
          End;

      If aEdits[i].ClassType = TMaskEdit Then
          Begin
              TMaskEdit(aEdits[i]).MaxLength := dmEmp.sqlConfigura.FieldByName( aEdits[i].name ).Size;
          End;
      {
      If aEdits[i].ClassType = TComboBox Then
          Begin
              TComboBox(aEdits[i]).MaxLength := dmEmp.sqlConfigura.FieldByName( aEdits[i].name ).Size;
          End;
       }
      If aEdits[i].ClassType = TDateTimePicker Then
          Begin
              TDateTimePicker(aEdits[i]).Date := dmEmp.sqlConfigura.FieldByName( aEdits[i].name ).Size;
          End;

      If aEdits[i].ClassType = TButtonedEdit Then
          Begin
              TButtonedEdit(aEdits[i]).MaxLength := dmEmp.sqlConfigura.FieldByName( aEdits[i].name ).Size;
          End;

      If aEdits[i].ClassType = TRichEdit Then
          Begin
              TRichEdit(aEdits[i]).MaxLength := dmEmp.sqlConfigura.FieldByName( aEdits[i].name ).Size;
          End;

      If aEdits[i].ClassType = TCheckBox Then
          Begin
            if dmEmp.sqlConfigura.FieldByName( aEdits[i].name ).AsString = 'T' then Begin
                TCheckBox(aEdits[i]).Checked := True ;
            End Else Begin
                TCheckBox(aEdits[i]).Checked := False ;
            End;
          End;

  end;
  // Alimenta os componentes com os campos apara Alteraçaõ e Consulta
  for i := 0 to Length(aEdits)-1 do begin

    If ( aEdits[i].ClassType = Tedit ) and (Not dmEmp.sqlConfigura.FieldByName( aEdits[i].name ).IsNull) Then
        Begin
            TEdit(aEdits[i]).Text := dmEmp.sqlConfigura.FieldByName( aEdits[i].name ).Value;
        End;

    If ( aEdits[i].ClassType = TMaskEdit ) and (Not dmEmp.sqlConfigura.FieldByName( aEdits[i].Name ).IsNull ) Then
        Begin
            TMaskEdit(aEdits[i]).Text := dmEmp.sqlConfigura.FieldByName( aEdits[i].name ).Value;
        End;

    If aEdits[i].ClassType = TComboBox Then
        Begin
           TComboBox(aEdits[i]).ItemIndex :=  TComboBox(aEdits[i]).Items.IndexOf(dmEmp.sqlConfigura.FieldByName( aEdits[i].name ).Text);
        End;

    If aEdits[i].ClassType = TDateTimePicker Then
        Begin
            TDateTimePicker(aEdits[i]).Date := dmEmp.sqlConfigura.FieldByName( aEdits[i].name ).Value;
        End;

    If aEdits[i].ClassType = TCheckBox Then
        Begin
          if dmEmp.sqlConfigura.FieldByName( aEdits[i].name ).AsString = 'T' then Begin
              TCheckBox(aEdits[i]).Checked := True ;
          End Else Begin
              TCheckBox(aEdits[i]).Checked := False ;
          End;
        End;


    If aEdits[i].ClassType = TButtonedEdit Then
        Begin
            if dmEmp.sqlConfigura.FieldByName( aEdits[i].name ).IsNull then
            Begin
               TButtonedEdit(aEdits[i]).MaxLength := dmEmp.sqlConfigura.FieldByName( aEdits[i].name ).Size;
            End
            Else Begin
              TButtonedEdit(aEdits[i]).Text := dmEmp.sqlConfigura.FieldByName( aEdits[i].name ).Value;
            End;
        End;

    If aEdits[i].ClassType = TRichEdit Then
        Begin
            TRichEdit(aEdits[i]).Text :=  dmEmp.sqlConfigura.FieldByName( aEdits[i].name ).Value ;
        End;


  end;
  for i := 0 to ComponentCount-1 do begin
    if (Components[i].ClassType = TButtonedEdit ) then Begin
        TButtonedEdit(Components[i]).CustomHint :=  fPrincipal.HintBalloo ;
        TButtonedEdit(Components[i]).ShowHint   :=  True;
        TButtonedEdit(Components[i]).Hint       := 'Atenção | Para pesquisar pressione a tecla [END] '+#13#10+' do seu teclado e aparecerá as opções de consulta '+#13#10+' | 256';
        If TButtonedEdit(Components[i]).Text <> '' Then Begin
           TButtonedEdit(Components[i]).OnExit(Self);

        End;
    End;
  end;

  CarregaImagem(TBlobField(dmEmp.sqlConfigura.FieldByName('cfg_foto')), DBImage1, DBImage3);

  if ( Not dmEmp.sqlConfigura.FieldByName( 'cfg_codcid' ).IsNull) then
//      frmPesquisa.ChkRelac( 'cidade','cfg_codcid','nome','uf', cfg_codcid ,edNomCid, edUf ,dmEmp.IbqCidade , dmEmp.dsCidade ) ;

 LerCteCfg;
end;

procedure TfrmConfigura.CarregaImagem(BlobField: TBlobField; DBImage1, ImagePadrao: TDBImage);
var
  MemoryStream: TMemoryStream;
  JPEG: TJPEGImage;
begin
  if BlobField.IsNull then
  begin
//    DBImage1.Picture.Assign(ImagePadrao.Picture);
    Exit;
  end;

  JPEG := TJPEGImage.Create;
  MemoryStream := TMemoryStream.Create;
  try
    BlobField.SaveToStream(MemoryStream);
    MemoryStream.Seek(0, soFromBeginning);
    JPEG.LoadFromStream(MemoryStream);
    if MemoryStream.Size > 0 then
      begin
      DBImage1.Picture.Assign(JPEG);
      DBImage1.AutoDisplay :=true;
      end
    else
      DBImage1.Picture.Assign(nil);
      DBImage1.AutoDisplay :=true;
  finally
    JPEG.Free;
    MemoryStream.Free;
  end;
end;

procedure TfrmConfigura.cfg_codcidExit(Sender: TObject);
Var
Pesquisa : TClasConsulta;
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  if  cfg_codcid.Text <> '' Then Begin
      Pesquisa.sqlTabela :=  dmEmp.sqlCIdade ;
      edNomCid.Text :=  Pesquisa.Relacao('cidade',cfg_codcid,'cid_codigo','cid_nome');
      edUf.Text     :=  Pesquisa.Relacao('cidade',cfg_codcid,'cid_codigo','est_uf');
  End;

end;

procedure TfrmConfigura.cfg_codcidKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      cfg_codcidRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmConfigura.cfg_codcidRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsCidade ;
  Pesquisa.sqlTabela :=  dmEmp.sqlCIdade ;
  Pesquisa.cliTabela :=  dmEmp.cliCIdade ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Cidades';
  Pesquisa.nmTabela  := 'Cidade';
  // Display        campo   cabecalho           get         tan  indices
  Pesquisa.AddReg('cid_codigo','Código'           ,'cid_codigo'    ,5  ,'por Código' );
  Pesquisa.AddReg('cid_nome'  ,'Nome da Cidade'   ,'edNomCId'      ,20 ,'por Cidade' );
  Pesquisa.AddReg('est_uf'    ,'Uf'               ,'edUF'         ,5  ,'por Estado' );
  Pesquisa.acessa(cfg_codcid);
  cfg_codcid.text   :=  Pesquisa.RecReg('cid_codigo');
  edNomCId.text :=  Pesquisa.RecReg('cid_nome');
  edUF.text     :=  Pesquisa.RecReg('est_uf');
  Pesquisa.Destroy

end;

procedure TfrmConfigura.cfg_kmveriKeyPress(Sender: TObject; var Key: Char);
begin
KeyKm( Sender, Key );
end;

end.
