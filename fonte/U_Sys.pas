unit U_Sys;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ImgList, IniFiles, jpeg, ExtCtrls, ZAbstractConnection,
  ZConnection,IdBaseComponent, IdComponent, IdIPWatch, Vcl.Imaging.pngimage,
  System.ImageList ;

type
  TfrmSys = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edHost: TEdit;
    cbTipoBco: TComboBox;
    Label2: TLabel;
    edBanco: TEdit;
    Label3: TLabel;
    Button1: TButton;
    ImageList1: TImageList;
    edUsuario: TEdit;
    Label4: TLabel;
    edPassw: TEdit;
    Label5: TLabel;
    btnTesta: TButton;
    btnGrava: TButton;
    btnCancela: TButton;
    Banner: TPanel;
    Image1: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    nmBco: TEdit;
    Connect: TZConnection;
    Image2: TImage;
    Image3: TImage;

    procedure Button1Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure btnGravaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbTipoBcoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnTestaClick(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  frmSys: TfrmSys;

implementation

uses uSistema, FileCtrl , U_funcao;

{$R *.dfm}
// INICIALIZA AS FUNÇÕES
procedure TfrmSys.Label4Click(Sender: TObject);

begin

end;

{******************************************************************************
*** Cria Diretorios ***********************************************************
******************************************************************************}

procedure TfrmSys.btnCancelaClick(Sender: TObject);
begin
  btnCancela.SetFocus;
  Application.Terminate;

end;





procedure TfrmSys.Button1Click(Sender: TObject);
Var
SelectedFile: String;
S:String;
Begin
SelectDirectory('Selecione o diretório:', '', S);
edBanco.Text:= S;
{
if PromptForFileName(SelectedFile,'Arquivo de Banco de Dados(*.fdb)|*.fdb',CamIni+CanBco,'Selecione Um Banco de dados',
   'C:',False) then
   begin
   edBanco.Text:=SelectedFile;
   end
else
   ShowMessage('Seleção Cancelada');
   }
end;


procedure TfrmSys.cbTipoBcoChange(Sender: TObject);
begin
  if cbTipoBco.Text = 'MySql' then Begin
     edBanco.Enabled := False;
     edUsuario.Text := 'root';
     edPassw.Text   := '12936511'
  End Else
  if cbTipoBco.Text = 'Firebird' then Begin
     edBanco.Enabled := True;
     edUsuario.Text := 'sysdba';
     edPassw.Text   := 'masterkey'
  End Else
  if cbTipoBco.Text = 'Postgres' then Begin
     edBanco.Enabled := False;
     edUsuario.Text := 'postgres';
     edPassw.Text   := '12936511'
  End;



end;

procedure TfrmSys.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Application.Terminate;
 frmSys := nil ;
 action := cafree;

end;

procedure TfrmSys.FormCreate(Sender: TObject);
begin
  cbTipoBco.Items.Add('Firebird');
  cbTipoBco.Items.Add('MySql');
  cbTipoBco.Items.Add('Postgres');
  cbTipoBco.ItemIndex := 0;
  variaveis();
  edBanco.Text := LowerCase( ExtractFilePath(Application.ExeName)+'DATABASE\') ;
  if Not DirectoryExists(edBanco.Text) then
      CreateDir(edBanco.Text);



 if not FileExists(CamIni+ArqIni) then Begin

    // Cor do banner
    Banner.ParentBackGround := False;
    Banner.ParentColor      := False;
    Banner.Brush.Color      := u_funcao.Bronze_Escuro ;

    // Titulos do Banner
    lbCabeca01.Caption      := 'Script de Conexão';
    lbCabeca02.Caption      := u_funcao.nmSistema ;

    // Cores - Titulos do Banner
    lbCabeca01.Font.Color   := u_funcao.clTit_BCad ;
    lbCabeca02.Font.Color   := u_funcao.clTit_BCad ;

 End ELse Begin

 End;

end;

procedure TfrmSys.FormShow(Sender: TObject);
Var
r : TIdIPWatch;
begin
  nmBco.Text := 'dbsgt';
 r := TIdIPWatch.Create(nil);
 edHost.Text := r.LocalIP;
 r.free;
end;

procedure TfrmSys.btnGravaClick(Sender: TObject);
Var
Inif: TINIFILE ;
begin


  // Cria/Associa o arquivo ini.
  if Not FileExists(CamIni+ArqIni) then Begin

     Inif := TINIFILE.Create(CamIni+ArqIni);
      // Grava o conteúdo do Edit existente no form no Indenfiticador de uma respeciva sessão
     Inif.writestring('BANCO DE DADOS', 'Tipo',      cbTipoBco.Text);
     Inif.writestring('BANCO DE DADOS', 'host',      edHost.Text);
     Inif.writestring('BANCO DE DADOS', 'caminho',   edBanco.Text+nmBco.Text+'.fdb');
     Inif.writestring('BANCO DE DADOS', 'usuario',   edUsuario.Text);
     Inif.writestring('BANCO DE DADOS', 'password',  edPassw.Text);
     Inif.writestring('BANCO DE DADOS', 'diretorio', edBanco.Text);

     Close;
  End;
  Inif.Free;
  Close;
end;



procedure TfrmSys.btnTestaClick(Sender: TObject);
begin
{ Testar Database }

            try
              Connect.autocommit       := True;
              Connect.AutoEncodeStrings:= True;
              Connect.Database         := nmBco.Text;
              Connect.hostname         := edHost.Text;
              Connect.Port             :=  5432;
              Connect.Protocol         := 'postgresql-9';
              Connect.user             := lowerCase(edUsuario.Text);
              Connect.password         := edPassw.Text;
              Connect.Connected        := True;
              ShowMessage('Conectado Com Sucesso!');
            except
              ShowMessage('Conexão Invalida');
            end;
end;

end.
