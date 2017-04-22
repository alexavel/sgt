unit U_EnviaEmail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase,
  IdSMTP, IdComponent, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdMessage, IdBaseComponent, IdAntiFreezeBase, Vcl.IdAntiFreeze,
  Vcl.ComCtrls;

type
  TfrmEnviaEmail = class(TForm)
    GroupBox1: TGroupBox;
    LbStatus: TLabel;
    OpenDialog1: TOpenDialog;
    StatusBar1: TStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
//    pEdAssunto, pEdEmailPara, pmemoTexto, pEdCC, pEdCCO: String;
    { Private declarations }
  public
  //pEdAssunto, pEdEmailPara, pmemoTexto, pEdCC, pEdCCO: String;
  EdSMTPServidor, EdSMTPLogin, EdSMTPSenha, EdSMTPPorta, CbTSL, CbMetodoTSL, CBPrioridade: String;

  procedure EnviaEmail( status: TStatusPanel; pEdAssunto, pEdEmailPara, pmemoTexto, pEdCC, pEdCCO: String );
  procedure TestaEmail(status: TStatusPanel; pEdAssunto, EdRemetenteEmail, EdSMTPServidor,
                       EdSMTPLogin,  EdSMTPSenha,  EdSMTPPorta,  CbMetodoTSL,
                       CbTSL, pmemoTexto, pEdCC, pEdCCO: String; CBSMTPSSL,  CbAutentica: Boolean );


  //Constructor Create(AOwner : TComponent; EdAssunto, EdEmailPara, memoTexto, EdCC, EdCCO: String );
    { Public declarations }
  end;

var
  frmEnviaEmail: TfrmEnviaEmail;


implementation
Uses u_funcao, u_aguarde;
{$R *.dfm}
{
Constructor TfrmEnviaEmail.Create(AOwner : TComponent; EdAssunto, EdEmailPara, memoTexto, EdCC, EdCCO: String );
begin
  inherited Create(AOwner);

    pEdAssunto    := EdAssunto;
    pEdEmailPara  := EdEmailPara;
    pmemoTexto    := memoTexto;
    pEdCC         := EdCC;
    pEdCCO        := EdCCO;

end;
 }
procedure TfrmEnviaEmail.EnviaEmail(status: TStatusPanel; pEdAssunto, pEdEmailPara, pmemoTexto, pEdCC, pEdCCO: String );
var
  str : string;
  SSL,Autentica : string;
  i : integer;
  EdSMTPServidor, EdSMTPLogin, EdSMTPSenha, EdSMTPPorta, CbTSL, CbMetodoTSL, CBPrioridade: String;
  CBSMTPSSL, CbAutentica: Boolean;

  OpenDialog1: TOpenDialog;
  msg: TIdMessage;
  IO_OpenSSL: TIdSSLIOHandlerSocketOpenSSL;
  SMTP: TIdSMTP;

begin
  OpenDialog1 := TOpenDialog.Create(self);
  msg         := TIdMessage.Create(self);
  IO_OpenSSL  := TIdSSLIOHandlerSocketOpenSSL.Create(self);
  SMTP        := TIdSMTP.Create(self);


{
    pEdAssunto    := EdAssunto;
    pEdEmailPara  := EdEmailPara;
    pmemoTexto    := memoTexto;
    pEdCC         := EdCC;
    pEdCCO        := EdCCO;
 }
  // Pega as informações de conexão de emails do sistema atual

  //EdRemetenteEmail_:=  cfgEmail;
  EdSMTPServidor  :=  cfgHostcon;
  CBSMTPSSL       :=  ChecaFT( cfgSeguricon );
  CbAutentica     :=  ChecaFT( cfgAutenticon );
  EdSMTPLogin     :=  cfgUsucon;
  EdSMTPSenha     :=  cfgSencon;
  EdSMTPPorta     :=  cfgPortacon;
  CbMetodoTSL     :=  cfgMetodo;
  CbTSL           :=  cfgTsl;

  inherited;
  try

  // Configurando componentes de envio
  with SMTP do begin
      Host      := EdSMTPServidor;

    if CBSMTPSSL Then
      IOHandler := IO_OpenSSL
    else
      IOHandler := nil;

    IOHandler := IO_OpenSSL;
    Username  := EdSMTPLogin;
    Password  := EdSMTPSenha;

    Port   := StrToIntDef(EdSMTPPorta,25);

    // Clausuilas para os TSL
    if CbTSL = 'TLSSupport' then
       UseTLS  := utNoTLSSupport;

    if CbTSL = 'ImplicitTLS' then
       UseTLS  := utUseImplicitTLS;

    if CbTSL = 'RequireTLS' then
       UseTLS  := utUseRequireTLS;

    if CbTSL = 'ExplicitTLS' then
       UseTLS  := utUseExplicitTLS;
    // Clausuilas para os TSL


    // Clausuilas para os metodos
    if CbMetodoTSL = 'sslvSSLv2' then
       IO_OpenSSL.SSLOptions.Method  := sslvSSLv2;

    if CbMetodoTSL = 'sslvSSLv23' then
       IO_OpenSSL.SSLOptions.Method  := sslvSSLv3;

    if CbMetodoTSL = 'sslvSSLv3' then
       IO_OpenSSL.SSLOptions.Method  := sslvSSLv3;

    if CbMetodoTSL = 'sslvTLSv1' then
       IO_OpenSSL.SSLOptions.Method  := sslvTLSv1;

    if CbMetodoTSL = 'sslvTLSv1_1' then
       IO_OpenSSL.SSLOptions.Method  := sslvTLSv1_1;

    if CbMetodoTSL = 'sslvTLSv1_2' then
       IO_OpenSSL.SSLOptions.Method  := sslvTLSv1_2;
    // Clausuilas para os metodos

    if CbAutentica then begin
      AuthType        := satDefault
    End else
      AuthType        := satNone;
      ConnectTimeout  := 10000;
      ReadTimeout     := 10000;
    end;

  //Conexão SSL
  if CBSMTPSSL then  begin
    with IO_OpenSSL do begin
      SSLOptions.Method := sslvSSLv23;
      SSLOptions.Mode   := sslmClient;
    end;
  end;

    //EdRemetenteEmail_:=  cfgEmail;
  EdSMTPServidor  :=  cfgHostcon;
  CBSMTPSSL       :=  ChecaFT( cfgSeguricon );
  CbAutentica     :=  ChecaFT( cfgAutenticon );
  EdSMTPLogin     :=  cfgUsucon;
  EdSMTPSenha     :=  cfgSencon;
  EdSMTPPorta     :=  cfgPortacon;
  CbMetodoTSL     :=  cfgMetodo;
  CbTSL           :=  cfgTsl;

  //Mensagem
  with Msg do begin
    // Informação "de quem está enviando"
    ContentType               := 'text/html';
    From.Name                 := 'SGT - Sistema de Gestão de Transportes';
    From.Address              := EdSMTPLogin;
    From.DisplayName          := 'SGT - Sistema de Gestão2';
    // Informações "Para quem está enviando"
    Subject                   := pEdAssunto;
    Sender.Address            := cfgEmail;
    Sender.Name               := EdSMTPLogin;
    Recipients.EMailAddresses := pEdEmailPara;

    // Informações da mensagem
    Body.CommaText            := pmemoTexto;

    CCList.EMailAddresses     := pEdCC;
    BccList.EMailAddresses    := pEdCCO;

  // Prioridade da mensagem
  If UpperCase(CBPrioridade) = 'NORMAL' Then
     Priority := mpNormal;

  If UpperCase(CBPrioridade) = 'LOW' Then
     Priority := mpLow;

  If UpperCase(CBPrioridade) = 'LOWEST' Then
     Priority := mpLowest;

  If UpperCase(CBPrioridade) = 'HIGH' Then
     Priority := mpHigh;

  If UpperCase(CBPrioridade) = 'HIGHEST' Then
     Priority := mpHighest;
  // Informações da mensagem


  {
  // Insira os anexos caso possua
  MessageParts.Clear;
  //if F_Envia_Email.Showing Then
  for i := 0 to MemoAnexo.Items.Count - 1 do
  if FileExists(MemoAnexo.Items[i]) Then
      TIdAttachmentFile.Create(MessageParts, MemoAnexo.Items[i]);
  end;
   }

  // Tente Enviar a Mensagem
  Try
    // Conecte ao Servidor
    if not SMTP.Connected then begin
        SMTP.Connect();
    if CbAutentica then
        SMTP.Authenticate();
    end;
               // Função de Aguarde
               with Taguarde.ShowWaitForm('') do
                   try

                      // Envie o Email
                      if SMTP.Connected then  begin
                          status.Text := 'Aguarde, enviando E-Mail...';
                  //        Refresh;
                          SMTP.Send(Msg);
                          SMTP.Disconnect;
                      end;
                      status.Text := 'Enviado Com Sucesso';
                     // ShowMessage('E-Mail enviado!');
                  finally
                    AllowClose;
                    Free;
                  end;

  Except
    // Tratamento de exceções
    on E: Exception do

      if (tag = 0) Then begin
        if (Pos(UpperCase('Credentials Rejected'), UpperCase(E.Message)) > 0)  Then  begin
            ShowMessage('Erro ao enviar E-Mail! Login ou Senha inválidos');
            status.Text := 'Erro : Login ou Senha inválidos.';
        end else if (Pos(UpperCase('Host not found'), UpperCase(E.Message)) > 0)  Then  begin
            ShowMessage('O Servidor "' + EdSMTPServidor +'" não foi encontrado');
            status.Text := 'Erro : Servidor não encontrado.';
        end  else if (Pos(UpperCase('Connection timed out'), UpperCase(E.Message)) > 0) Then  begin
            ShowMessage('O servidor "' + EdSMTPServidor +'" demorou a responder, verifique se a porta para conexão está correta!');
            status.Text := 'Erro : Servidor não respondeu.';
        End else if (Pos(UpperCase('read timeout'), UpperCase(E.Message)) > 0)  Then  begin
            ShowMessage('O servidor "' + EdSMTPServidor +'" demorou a responder, talvez o mesmo requeira uma Conexão SSL segura!');
            status.Text := 'Erro : Servidor talvez requeira uma conexão SSL segura.';
        End  else if (Pos(UpperCase('connection closed'), UpperCase(E.Message))> 0) Then  begin
            ShowMessage('Envio cancelado');
            status.Text := 'Envio de e-mail cancelado';
        End  else  begin
            ShowMessage('Erro ao enviar e-mail');
            status.Text := 'Erro ao enviar E-Mail. ' + E.Message;
        end;
        //var_status := 'erro';
      end;

    End;

    if SMTP.Connected then
        SMTP.Disconnect;
    end;
  finally

  end;

end;

procedure TfrmEnviaEmail.TestaEmail( status: TStatusPanel; pEdAssunto, EdRemetenteEmail, EdSMTPServidor,
                         EdSMTPLogin,  EdSMTPSenha,  EdSMTPPorta,  CbMetodoTSL,
                         CbTSL, pmemoTexto, pEdCC, pEdCCO: String; CBSMTPSSL,  CbAutentica: Boolean );
var
  str : string;
  SSL,Autentica, pEdEmailPara, CBPrioridade : string;
  i : integer;

  OpenDialog1: TOpenDialog;
  msg: TIdMessage;
  IO_OpenSSL: TIdSSLIOHandlerSocketOpenSSL;
  SMTP: TIdSMTP;

begin
  OpenDialog1 := TOpenDialog.Create(self);
  msg         := TIdMessage.Create(self);
  IO_OpenSSL  := TIdSSLIOHandlerSocketOpenSSL.Create(self);
  SMTP        := TIdSMTP.Create(self);
  pEdEmailPara:= EdRemetenteEmail;
  CBPrioridade:= 'NORMAL';
  {
  EdSMTPServidor  :=  dmEmp.sqlConfigura.FieldByName('HOSTCON').Text;
  CBSMTPSSL       :=  fIIF(dmEmp.sqlConfigura.FieldByName('SEGURICON').Text = 'T',True,False);
  CbAutentica     :=  fIIF(dmEmp.sqlConfigura.FieldByName('AUTENTICON').Text = 'T',True,False);
  EdSMTPLogin     :=  dmEmp.sqlConfigura.FieldByName('USUCON').Text;
  EdSMTPSenha     :=  dmEmp.sqlConfigura.FieldByName('SENCON').Text;
  EdSMTPPorta     :=  dmEmp.sqlConfigura.FieldByName('PORTACON').Text;
  CbMetodoTSL     :=  dmEmp.sqlConfigura.FieldByName('METODO').Text;
  CbTSL           :=  dmEmp.sqlConfigura.FieldByName('TSL').Text;
   }
  inherited;
  try
  // Configurando componentes de envio
  with SMTP do begin
      Host      := EdSMTPServidor;

    if CBSMTPSSL Then
      IOHandler := IO_OpenSSL
    else
      IOHandler := nil;

    IOHandler := IO_OpenSSL;
    Username  := EdSMTPLogin;
    Password  := EdSMTPSenha;

    Port   := StrToIntDef(EdSMTPPorta,25);

    // Clausuilas para os TSL
    if CbTSL = 'TLSSupport' then
       UseTLS  := utNoTLSSupport;

    if CbTSL = 'ImplicitTLS' then
       UseTLS  := utUseImplicitTLS;

    if CbTSL = 'RequireTLS' then
       UseTLS  := utUseRequireTLS;

    if CbTSL = 'ExplicitTLS' then
       UseTLS  := utUseExplicitTLS;
    // Clausuilas para os TSL


    // Clausuilas para os metodos
    if CbMetodoTSL = 'sslvSSLv2' then
       IO_OpenSSL.SSLOptions.Method  := sslvSSLv2;

    if CbMetodoTSL = 'sslvSSLv23' then
       IO_OpenSSL.SSLOptions.Method  := sslvSSLv3;

    if CbMetodoTSL = 'sslvSSLv3' then
       IO_OpenSSL.SSLOptions.Method  := sslvSSLv3;

    if CbMetodoTSL = 'sslvTLSv1' then
       IO_OpenSSL.SSLOptions.Method  := sslvTLSv1;

    if CbMetodoTSL = 'sslvTLSv1_1' then
       IO_OpenSSL.SSLOptions.Method  := sslvTLSv1_1;

    if CbMetodoTSL = 'sslvTLSv1_2' then
       IO_OpenSSL.SSLOptions.Method  := sslvTLSv1_2;
    // Clausuilas para os metodos

    if CbAutentica then begin
      AuthType        := satDefault
    End else
      AuthType        := satNone;
      ConnectTimeout  := 50000;
      ReadTimeout     := 50000;
    end;

  //Conexão SSL
  if CBSMTPSSL then  begin
    with IO_OpenSSL do begin
      SSLOptions.Method := sslvSSLv23;
      SSLOptions.Mode   := sslmClient;
    end;
  end;

  //Mensagem
  with Msg do begin
    // Informação "de quem está enviando"
    ContentType               := 'text/html';
    From.Name                 := u_funcao.nmSistema;
    From.Address              := EdRemetenteEmail;
    From.DisplayName          := EdSMTPServidor;
    // Informações "Para quem está enviando"
    Subject                   := pEdAssunto;
    Sender.Address            := EdRemetenteEmail;
    Sender.Name               := u_funcao.nmSistema;
    Recipients.EMailAddresses := pEdEmailPara;

    // Informações da mensagem
    Body.CommaText            := pmemoTexto;

    CCList.EMailAddresses     := pEdCC;
    BccList.EMailAddresses    := pEdCCO;

  // Prioridade da mensagem
  If UpperCase(CBPrioridade) = 'NORMAL' Then
     Priority := mpNormal;

  If UpperCase(CBPrioridade) = 'LOW' Then
     Priority := mpLow;

  If UpperCase(CBPrioridade) = 'LOWEST' Then
     Priority := mpLowest;

  If UpperCase(CBPrioridade) = 'HIGH' Then
     Priority := mpHigh;

  If UpperCase(CBPrioridade) = 'HIGHEST' Then
     Priority := mpHighest;
  // Informações da mensagem

  // Tente Enviar a Mensagem
  Try
    // Conecte ao Servidor
    if not SMTP.Connected then begin
        SMTP.Connect();
    if CbAutentica then
        SMTP.Authenticate();
    end;

               // Função de Aguarde
               with Taguarde.ShowWaitForm('') do
                   try
                      // Envie o Email
                      if SMTP.Connected then  begin
                          status.Text := 'Aguarde, enviando E-Mail...';
                  //        Refresh;
                          SMTP.Send(Msg);
                          SMTP.Disconnect;
                      end;
                      status.Text := 'Enviado Com Sucesso';
                     // ShowMessage('E-Mail enviado!');
                  finally
                    AllowClose;
                    Free;
                  end;


  Except
    // Tratamento de exceções
    on E: Exception do

      if (tag = 0) Then begin
        if (Pos(UpperCase('Credentials Rejected'), UpperCase(E.Message)) > 0)  Then  begin
            ShowMessage('Erro ao enviar E-Mail! Login ou Senha inválidos');
            status.Text := 'Erro : Login ou Senha inválidos.';
        end else if (Pos(UpperCase('Host not found'), UpperCase(E.Message)) > 0)  Then  begin
            ShowMessage('O Servidor "' + EdSMTPServidor +'" não foi encontrado');
            status.Text := 'Erro : Servidor não encontrado.';
        end  else if (Pos(UpperCase('Connection timed out'), UpperCase(E.Message)) > 0) Then  begin
            ShowMessage('O servidor "' + EdSMTPServidor +'" demorou a responder, verifique se a porta para conexão está correta!');
            status.Text := 'Erro : Servidor não respondeu.';
        End else if (Pos(UpperCase('read timeout'), UpperCase(E.Message)) > 0)  Then  begin
            ShowMessage('O servidor "' + EdSMTPServidor +'" demorou a responder, talvez o mesmo requeira uma Conexão SSL segura!');
            status.Text := 'Erro : Servidor talvez requeira uma conexão SSL segura.';
        End  else if (Pos(UpperCase('connection closed'), UpperCase(E.Message))> 0) Then  begin
            ShowMessage('Envio cancelado');
            status.Text := 'Envio de e-mail cancelado';
        End  else  begin
            ShowMessage('Erro ao enviar e-mail');
            status.Text := 'Erro ao enviar E-Mail. ' + E.Message;
        end;
        //var_status := 'erro';
      end;

    End;

    if SMTP.Connected then
        SMTP.Disconnect;
    end;
  finally

  end;

end;




procedure TfrmEnviaEmail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmEnviaEmail := nil ;
  action := cafree;
end;

end.
