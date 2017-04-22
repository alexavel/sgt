unit U_Licenc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ImgList, jpeg, DB, pngimage, edittuning, ZDatasetUtils, ZDataset,
  Vcl.ComCtrls, Clipbrd, Registry, System.ImageList, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client  ;

type
  TfrmLicenc = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edSerial: TEdit;
    btnAtiva: TButton;
    btnSair: TButton;
    Banner: TPanel;
    Label3: TLabel;
    Image1: TImage;
    lbCabeca01: TLabel;
    ImageList2: TImageList;
    Label2: TLabel;
    edCodAtiva: TEdit;
    pgrAtiva: TProgressBar;
    lbInfo: TLabel;
    Button1: TButton;
    Button2: TButton;
    Image2: TImage;
    Label4: TLabel;
    lbStatus: TLabel;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    Function registro( cChave, Serial: String ): Boolean ;
    procedure btnAtivaClick(Sender: TObject);
    procedure graRegistro(cSerial, cCdAtiv : String);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure GravarRegistro;
    Function LerRegistro: String;
    procedure edCodAtivaExit(Sender: TObject);
    procedure edCodAtivaChange(Sender: TObject);

  private
    { Private declarations }
  public
     DiasAtiv : Integer;
    { Public declarations }

  end;
const
 Raiz : String = '\Software\\SGT\';

var
  frmLicenc: TfrmLicenc;
  Caminho, serial : String;

implementation

uses uSistema, U_dmEmp, U_funcao, U_Sys, U_Empresa_, U_FuncReg;

{$R *.dfm}


procedure TfrmLicenc.btnAtivaClick(Sender: TObject);
Var
cRegistro : String ;
begin
  If U_FuncReg.registro(edCodAtiva.Text, serial ) Then Begin
    graRegistro(Serial,edCodAtiva.Text);
    GravarRegistro ;
    lbStatus.Caption := 'Copia Registrada com Sucesso' ;
    lbStatus.Transparent := False;
    lbStatus.Color := $0000FF80 ;
    lbStatus.Font.Color := $00FCFCFC ;
    edCodAtiva.Enabled :=False;
    btnSair.Caption  := 'Finalizar Ativação' ;
    btnAtiva.Enabled := False ;
  End Else Begin
    lbStatus.Caption := 'Código de Ativação Ivalido' ;
    lbStatus.Transparent := False;
    lbStatus.Color := $000000B7 ;
    lbStatus.Font.Color := $00FCFCFC ;
    edCodAtiva.Clear;
    edCodAtiva.SetFocus;
    btnAtiva.Enabled := False;
  End;

end;

procedure TfrmLicenc.GravarRegistro;
var
 Registro : TRegistry;
begin
 // Chama o construtor do objeto
 Registro := TRegistry.Create;
 { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
 Registro.OpenKey (Raiz, True);
 // Grava as informações do form
 Registro.WriteString('CodAtiva', Trim( u_funcao.Criptografar(  edCodAtiva.Text )) );
 Registro.WriteString('Serial',   Trim( u_funcao.Criptografar(  Serial )) );
 Registro.WriteString('Programa', fPrincipal.Caption );
 Registro.WriteDate ('DataInst', now);

 // Fecha a chave e o objeto
 Registro.CloseKey;
 Registro.Free;

 { Escrever outros tipos de dados

    WriteBool (NomeDoValor, Conteúdo); // Dados tipo Boolean
    WriteBinaryData (NomeDoValor, Conteúdo); // Valor Binário
    WriteCurrency (NomeDoValor, Conteúdo); // Dados tipo Currency
    WriteDate (NomeDoValor, Conteúdo); // Dados tipo TDate
    WriteDateTime (NomeDoValor, Conteúdo); // Dados tipo TDateTime
    WriteFloat (NomeDoValor, Conteúdo); // Dados tipo Float (Real)
    WriteInteger (NomeDoValor, Conteúdo); // Dados tipo Integer
    WriteString (NomeDoValor, Conteúdo); // Dados tipo String
    WriteTime (NomeDoValor, Conteúdo); // Dados tipo TTime


 }
end;

Function TfrmLicenc.LerRegistro: String;
var
Registro : TRegistry;
begin
// Chama o construtor do objeto
Registro := TRegistry.Create;
with Registro do
	begin
	 // Somente abre se a chave existir
	 if OpenKey (Raiz, False) then
	   // Envia as informações ao form, vendo se os valores existem, primeiramente...
     if ValueExists ('CodAtiva') then
        Result := ReadString ('CodAtiva');
     {
       if ValueExists ('Largura') then
         Width := ReadInteger ('Largura');
       if ValueExists ('Altura') then
         Height := ReadInteger ('Altura');
       if ValueExists ('Esquerda') then
         Left := ReadInteger ('Esquerda');
       if ValueExists ('Topo') then
         Top := ReadInteger ('Topo');
       // Fecha a chave e o objeto
     }
	   Registro.CloseKey;
	   Registro.Free;
	end;
   { Para ler outros tipos de dados

    ReadBool (NomeDoValor)   // Valor booleano
    ReadBinaryData ( NomeDoValor ; var Buffer ; TamBuffer : Integer) // Valor Inteiro
    ReadCurrency (NomeDoValor) // Valor Currency
    ReadDate (NomeDoValor)   // Valor Date
    ReadDateTime (NomeDoValor) // Valor DateTime;
    ReadFloat (NomeDoValor)  // Valor Float(Real)
    ReadInteger (NomeDoValor) // Valor Inteiro
    ReadString (NomeDoValor)  // Valor String;
    ReadTime (NomeDoValor)   // Valor DateTime

   }


End;

procedure TfrmLicenc.btnSairClick(Sender: TObject);
begin

  if LowerCase( btnSair.Caption ) = 'sair' then Begin
     Auditor(Screen.activeform.Caption,'Ativação Mal Sucedida','-');
     Application.Terminate;
  End Else Begin
     Auditor(Screen.activeform.Caption,'Ativado Com Sucesso','-');
     Close;
  End;

end;

procedure TfrmLicenc.Button1Click(Sender: TObject);
begin
Clipboard.AsText := serial ;
end;

procedure TfrmLicenc.Button2Click(Sender: TObject);
begin
  edCodAtiva.Text := Clipboard.AsText ;
  edCodAtiva.SetFocus;
end;

procedure TfrmLicenc.edCodAtivaChange(Sender: TObject);
begin
  if Length(trim(edCodAtiva.Text)) = edCodAtiva.MaxLength then
     btnAtiva.Enabled := True;

end;

procedure TfrmLicenc.edCodAtivaExit(Sender: TObject);
begin
  edCodAtiva.SetFocus;
  if Length(trim(edCodAtiva.Text)) = edCodAtiva.MaxLength then
     btnAtiva.Enabled := True;

end;

procedure TfrmLicenc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    frmLicenc := nil ;
    action := cafree;
end;

procedure TfrmLicenc.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //verifica se a tecla pressionada é a tecla ENTER, conhecida como #13
  If key = #13 then Begin
    //se for, passa o foco para o próximo campo, zerando o valor da variável Key
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  End Else
    If key = #27 then Begin
          Close;
          key := #0;
  end;
end;

procedure TfrmLicenc.FormShow(Sender: TObject);
Var
nDias : Integer;
begin
  serial := U_FuncReg.SerialNum( Copy(ExtractFileDrive(Application.ExeName),1,1) ) ;
  edSerial.Hint   := 'Serial de Acesso | Informe ao Gestor do Sistema  '+#13#10+' o numero de serial acima, e gere o código de ativação '+#13#10+' | 25';
  edCodAtiva.Hint := 'Código de Ativação | Digite o Código de Ativação '+#13#10+' e ative o programa  '+#13#10+' | 25';
  edSerial.Text   := 'Nº Serial: '+serial;
  // Cor do banner
  btnSair.Caption         := 'Sair';
  Banner.ParentBackGround := False;
  Banner.ParentColor      := False;
  Banner.Brush.Color      := u_funcao.Bronze_Escuro ;

  // Titulos do Banner
  lbCabeca01.Caption    := 'Registre o produto';
  // Cores - Titulos do Banner
  lbCabeca01.Font.Color := u_funcao.clTit_BCad ;
  btnAtiva.Enabled      := (edCodAtiva.Text <> '');

  nDias := ( 30 - u_funcao.DiasAtiv ) ;

  pgrAtiva.Min := 0;
  pgrAtiva.Max := 30;
  pgrAtiva.Position := u_funcao.DiasAtiv;

  if pgrAtiva.Position < pgrAtiva.Max then Begin
     btnSair.Caption := 'Ativar Mais Tarde';
     pgrAtiva.Brush.Color := $0011C82D;
     lbInfo.Caption := 'Você tem '+trim(IntToStr(nDias))+' Dia(s) para ativação deste programa'
  End Else Begin
     btnSair.Caption := 'Sair';
     pgrAtiva.Brush.Color := $000000D5;
     lbInfo.Caption := 'Esta aplicação foi bloqueada e necessita de ativação!'
  End;




end;

procedure TfrmLicenc.graRegistro(cSerial,cCdAtiv : String);
Var
qQry : TFDQuery ;
begin
  qQry := TFDQuery.Create(Nil) ;
  with qQry do
    begin
      Close;
      Connection         :=  dmEmp.SqlConSis;
      SQL.Text           :=  'update "dbconfig".registro set reg_codatv = :reg_codatv,  reg_usualt = :reg_usualt,  reg_datalt = :reg_datalt,  reg_horalt = :reg_horalt Where reg_cdserial = '+QuotedStr( cSerial );
      ParamByName('reg_codatv').Text    := Trim( u_funcao.Criptografar(cCdAtiv) ) ;
      ParamByName('reg_usualt').Text    := sysUsuario ;
      ParamByName('reg_datalt').AsDate  := Now ;
      ParamByName('reg_horalt').Text    := TimeToStr(time) ;
      ExecSQL;
  end;
end;

function TfrmLicenc.registro(cChave, Serial : String): Boolean;
Var
n1, n2, n3, n4, cRegNr : String;
aLics : array of string;
I, R : Integer;
begin
  R := 0 ;
  // Qubra o Serial
  n1:=copy(Serial,3,1);
  n2:=copy(Serial,4,1);
  n3:=copy(Serial,5,1);
  n4:=copy(Serial,6,1);

  // Guarda as licenças
  SetLength( aLics, 4 );
  aLics[0]:= 'J30'+n1+'1-A07'+n2+'9-C19'+n3+'7-S71'+n4+'1';
  aLics[1]:= 'J30'+n4+'1-A07'+n3+'7-C19'+n2+'6-S71'+n1+'1';
  aLics[2]:= 'J19'+n1+'1-A71'+n2+'9-C30'+n3+'7-S07'+n4+'1';
  aLics[3]:= 'J19'+n4+'1-A71'+n3+'7-C30'+n2+'9-S07'+n1+'1';

  for I := 0 to Length(aLics)-1 do Begin
      if cChave = aLics[I] then Begin
        { Se Enxcontrar faz o processo de registro }
        R := 1;
      End;
  End;
  Result := (R = 1)
end;


end.
