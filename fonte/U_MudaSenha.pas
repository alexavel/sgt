unit U_MudaSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, ImgList, ExtCtrls, ComCtrls, xmldom,
  XMLIntf, IdHTTP, msxmldom, XMLDoc, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, ExtDlgs, RibbonLunaStyleActnCtrls, Ribbon,
  ToolWin, ActnMan, ActnCtrls, jpeg, edittuning, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.Buttons, U_ClasseUtil, SqlExpr, DBXCommon,
  ZDataset, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Imaging.pngimage ;

type
  TfrmMudasenha = class(TForm)
    Banner: TPanel;
    sttMudaSen: TStatusBar;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    Image1: TImage;
    XMLBuscaCep: TXMLDocument;
    btnSalvar: TButton;
    btnSair: TButton;
    grpdados: TGroupBox;
    Label8: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    SenAnt: TEdit;
    NovSen: TEdit;
    ConfSen: TEdit;
    Image2: TImage;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SenAntExit(Sender: TObject);
    procedure ConfSenExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private

    wMudasenha, wUsuInc, wHorInc, wUsuAlt, wHorAlt : string ;
    wDatInc, wDatAlt : Tdate;
    nNew, nRecno:  Integer;

    { Private declarations }
  public
    { Public declarations }
    aEdits : array of TComponent;
    Util: TClasseUtil;
  end;

var
  frmMudasenha: TfrmMudasenha;

implementation

uses uSistema, U_Pesquisa, U_funcao, U_Sys,  u_classCons, U_ENVIAEMAIL,
  U_dmEmp;

{$R *.dfm}


// Grava as informações no Banco de Dados
procedure TfrmMudasenha.btnSalvarClick(Sender: TObject);
Var
Memo1: Tdbmemo;
cUsu, cHora, cHorAlt, cCodSql, cIteSql,cValSql, cHTML : string ;
i, tmp: Integer;
//Trans : TTransactionDesc;
Trans : TTransactionDesc ;
begin
  if ( SenAnt.Text  = '' ) or
     ( SenAnt.Text  = '' ) or
     ( ConfSen.Text = '' ) Then begin
      ShowMessage('Nessário o Preenchimento de Todos os campos');
      Exit;
     end;


  cUsu    :=  sysUsuario;
  cHora   := TimeToStr(time) ;
  Trans.TransactionID := 1    ;
  dmEmp.SqlConSis.StartTransaction;//(Trans);
  dmEmp.sqlUsuario.Close;

  // Gera Scrip de Update
  cCodSql:= 'update "dbconfig".usuario set usu_senha = :senha, usu_usualt = :Usuario,  usu_datalt = :Data,  usu_horalt = :Hora Where usu_login = '''+ sysUsuario+''' and usu_senha = '''+Trim( u_funcao.Criptografar(SenAnt.Text) )+''' ';
  dmEmp.sqlUsuario.Sql.Text := cCodSql ;
  dmEmp.sqlUsuario.ParamByName('senha').Text    :=  Trim( u_funcao.Criptografar(ConfSen.Text) ) ;
  dmEmp.sqlUsuario.ParamByName('Usuario').Text  :=  cUsu ;
  dmEmp.sqlUsuario.ParamByName('Data').AsDate   :=  Now ;
  dmEmp.sqlUsuario.ParamByName('Hora').Text     :=  cHora ;
  Try
    dmEmp.sqlUsuario.ExecSQL;
    dmEmp.SqlConSis.Commit;
            cHTML:='<!DOCTYPE HTML PUBLIC >';
            cHTML:=cHTML+'<?xml version="1.0" encoding="utf-8"?>';
            cHTML:=cHTML+'<html xmlns="http://www.w3.org/1999/xhtml">';
            cHTML:=cHTML+'	<head>                                     ';
            cHTML:=cHTML+'		<title>Editor HTML Online</title>         ';
            cHTML:=cHTML+'	</head>                                       ';
            cHTML:=cHTML+'	<body>                                          ';
            cHTML:=cHTML+'		<div>                                           ';
            cHTML:=cHTML+'			<strong><span style="font-family:arial,helvetica,sans-serif;">'+u_funcao.nmPrograma+'</span></strong></div>';
            cHTML:=cHTML+'		<div>';
            cHTML:=cHTML+'			<font face="arial, helvetica, sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Envio de Nova Senha</font></div>';
            cHTML:=cHTML+'		<div>                                                                                                                  ';
            cHTML:=cHTML+'			<font face="arial, helvetica, sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Alterar Senha</font></div>  ';
            cHTML:=cHTML+'		<div>                                                                                                                      ';
            cHTML:=cHTML+'			<hr />                                                                                                                     ';
            cHTML:=cHTML+'			<p>                                                                                                                          ';
            cHTML:=cHTML+'				<span style="font-family:arial,helvetica,sans-serif;">Sr. <strong>'+ sysUsuario+'</strong>,</span></p>                        ';
            cHTML:=cHTML+'		<div>';
            cHTML:=cHTML+'			&nbsp;</div>';
            cHTML:=cHTML+'		<div>                       ';
            cHTML:=cHTML+'			&nbsp;</div>                ';
            cHTML:=cHTML+'		<div>                           ';
            cHTML:=cHTML+'			&nbsp;</div>                    ';
            cHTML:=cHTML+'		<div>                               ';
            cHTML:=cHTML+'			&nbsp;</div>                        ';
            cHTML:=cHTML+'			<p>                                                                                                                              ';
            cHTML:=cHTML+'				<span style="font-family:arial,helvetica,sans-serif;">Estamos encaminhando <strong>nova senha</strong> do seu cadastro no sistema de <strong>SGT</strong>, ';
            cHTML:=cHTML+'            os dados aqui enviados s&atilde;o confidenciais e de sua total responsabilidade, sendo o seu manuseio/altera&ccedil;&atilde;o/inclus&atilde;o e exclus&atilde;o &nbsp;feitos pelo mesmo. Segue abaixo os dados.</span></p>';
            cHTML:=cHTML+'			<table align="left" border="0" cellpadding="1" cellspacing="1" style="width: 400">';
            cHTML:=cHTML+'				<tbody>';
            cHTML:=cHTML+'					<tr>   ';
            cHTML:=cHTML+'						<th scope="row" style="text-align: left;">';
            cHTML:=cHTML+'							&nbsp;</th>                               ';
            cHTML:=cHTML+'						<td>                                          ';
            cHTML:=cHTML+'							&nbsp;</td>                                   ';
            cHTML:=cHTML+'					</tr>                                               ';
            cHTML:=cHTML+'					<tr>                                                  ';
            cHTML:=cHTML+'						<th scope="row" style="text-align: left;">            ';
            cHTML:=cHTML+'							<span style="font-family:arial,helvetica,sans-serif;">Login</span></th>';
            cHTML:=cHTML+'						<td>                                                                       ';
            cHTML:=cHTML+'							<span style="font-family:arial,helvetica,sans-serif;">'+ sysUsuario+'</span></td>    ';
            cHTML:=cHTML+'					</tr>                                                                            ';
            cHTML:=cHTML+'					<tr>                                                                               ';
            cHTML:=cHTML+'						<th scope="row" style="text-align: left;">                                         ';
            cHTML:=cHTML+'							<span style="font-family:arial,helvetica,sans-serif;">Senha</span></th>            ';
            cHTML:=cHTML+'						<td>                                                                                   ';
            cHTML:=cHTML+'							<span style="font-family:arial,helvetica,sans-serif;">'+ConfSen.Text+'</span></td>                ';
            cHTML:=cHTML+'					</tr>                                                                                        ';
            cHTML:=cHTML+'					<tr>                                                                                           ';
            cHTML:=cHTML+'						<th scope="row" style="text-align: left;">                                                     ';
            cHTML:=cHTML+'							&nbsp;</th>                                                                                    ';
            cHTML:=cHTML+'						<td>                                                                                               ';
            cHTML:=cHTML+'							&nbsp;</td>                                                                                        ';
            cHTML:=cHTML+'					</tr>                                                                                                    ';
            cHTML:=cHTML+'				</tbody>                                                                                                     ';
            cHTML:=cHTML+'			</table>                                                                                                         ';
            cHTML:=cHTML+'		</div>                                                                                                               ';
            cHTML:=cHTML+'		<div>';
            cHTML:=cHTML+'			&nbsp;</div>';
            cHTML:=cHTML+'		<div>                       ';
            cHTML:=cHTML+'			&nbsp;</div>                ';
            cHTML:=cHTML+'		<div>                           ';
            cHTML:=cHTML+'			&nbsp;</div>                    ';
            cHTML:=cHTML+'		<div>                               ';
            cHTML:=cHTML+'			&nbsp;</div>                        ';
            cHTML:=cHTML+'		<div>                                   ';
            cHTML:=cHTML+'			&nbsp;</div>                            ';
            cHTML:=cHTML+'		<div>                                       ';
            cHTML:=cHTML+'			<span style="font-family:arial,helvetica,sans-serif;">Este email foi enviado autom&aacute;ticamente, todo os direitos reservados para a empresa <strong> '+fPrincipal.caption+' </strong>,&nbsp;</span></div>';
            cHTML:=cHTML+'		<div>';
            cHTML:=cHTML+'			&nbsp;</div>';
            cHTML:=cHTML+'		<div>           ';
            cHTML:=cHTML+'			<strong><span style="font-family:arial,helvetica,sans-serif;">Atenciosamente,</span></strong></div>';
            cHTML:=cHTML+'		<div>';
            cHTML:=cHTML+'			&nbsp;</div>';
            cHTML:=cHTML+'		<div>           ';
            cHTML:=cHTML+'			<strong><span style="font-family:arial,helvetica,sans-serif;">Administrador do Sistema</span></strong></div>';
            cHTML:=cHTML+'		<div>';
            cHTML:=cHTML+'			<strong><span style="font-family:arial,helvetica,sans-serif;">Modulo On-line</span></strong></div>';
            cHTML:=cHTML+'	</body>                                                                                                 ';
            cHTML:=cHTML+'</html>                                                                                                     ';
            if Not fPrincipal.sysUsuEmail.IsEmpty then
               frmEnviaEmail.EnviaEmail(sttMudaSen.Panels.Items[0] ,'Nova Senha de Acesso',fPrincipal.sysUsuEmail, cHTML,'','') ;

    ShowMessage('Senha alterada com Sucesso!' );
  except
     on Exc:Exception do
         begin
           ShowMessage('Ocorreu um erro na tentantiva de alterar os registro: ' + Exc.Message);
           dmEmp.SqlConSis.Rollback;
      end;
  End;
  Close;
end;

procedure TfrmMudasenha.ConfSenExit(Sender: TObject);
begin
if NovSen.Text <> ConfSen.Text then Begin
   ShowMessage('Confirmação de Senha não confere ');
   NovSen.Clear;
   ConfSen.Clear;
   NovSen.SetFocus;
End;

end;

procedure TfrmMudasenha.btnSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmMudasenha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    frmMudasenha := nil ;
    action := cafree;
end;


procedure TfrmMudasenha.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key = #13 then
    Begin
      //se for, passa o foco para o próximo campo, zerando o valor da variável Key
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
    end;

end;

procedure TfrmMudasenha.FormShow(Sender: TObject);
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
  lbCabeca01.Caption    := 'Alterar Senha';
  lbCabeca02.Caption    := u_funcao.nmSistema ;
  // Cores - Titulos do Banner
  lbCabeca01.Font.Color := u_funcao.clTit_BCad ;
  lbCabeca02.Font.Color := u_funcao.clTit_BCad ;
  SenAnt.SetFocus;

end;

procedure TfrmMudasenha.SenAntExit(Sender: TObject);
var
 SQLQ :TFDQuery ;
 cQuery: String;
Begin
if SenAnt.Text <> '' then begin

  cQuery  := 'SELECT * FROM "dbconfig".usuario Where usu_login = '''+ sysUsuario+''' and usu_senha = '''+Trim( u_funcao.Criptografar(SenAnt.Text) )+'''  ';
  SQLQ := TFDQuery.Create(Self);
  with SQLQ do
     begin
        Close;
        Connection := dmEmp.SqlConSis ;
        SQL.Text   := cQuery ;
        Open;
     end;

     if SQLQ.IsEmpty then Begin
        ShowMessage('Senha Inválida');
        SenAnt.SetFocus ;
        exit
     End;

end;


end;
initialization
  RegisterClass(TfrmMudasenha);

end.
