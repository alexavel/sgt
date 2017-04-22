unit U_CriaBanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ImgList, IniFiles, jpeg, ExtCtrls, ZAbstractConnection,
  ZConnection,IdBaseComponent, IdComponent, IdIPWatch, Vcl.Imaging.pngimage,
  System.ImageList, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client ;

type
  TfrmCriadb = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edHost: TEdit;
    cbTipoBco: TComboBox;
    Label2: TLabel;
    edBanco: TEdit;
    Label3: TLabel;
    btnPegaCaminho: TButton;
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
    Image2: TImage;
    edLib: TEdit;
    btnPegaLib: TButton;
    Label8: TLabel;
    flLib: TOpenDialog;
    Connect: TFDConnection;

    procedure btnPegaCaminhoClick(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure btnGravaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbTipoBcoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnTestaClick(Sender: TObject);
    procedure btnPegaLibClick(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  frmCriadb: TfrmCriadb;

implementation

uses FileCtrl, U_funcao, U_DmEmp, U_ClassConecte;

{$R *.dfm}
// INICIALIZA AS FUNÇÕES
procedure TfrmCriadb.Label4Click(Sender: TObject);

begin

end;

{******************************************************************************
*** Cria Diretorios ***********************************************************
******************************************************************************}

procedure TfrmCriadb.btnCancelaClick(Sender: TObject);
begin
  btnCancela.SetFocus;
  Application.Terminate;

end;





procedure TfrmCriadb.btnPegaCaminhoClick(Sender: TObject);
Var
SelectedFile: String;
S:String;
Begin
SelectDirectory('Selecione o diretório:', '', S);
edBanco.Text:= S;
{
if PromptForFileName(SelectedFile,'Arquivo de CONECTE(*.fdb)|*.fdb',CamIni+CanBco,'Selecione Um CONECTE',
   'C:',False) then
   begin
   edBanco.Text:=SelectedFile;
   end
else
   ShowMessage('Seleção Cancelada');
   }
end;


procedure TfrmCriadb.btnPegaLibClick(Sender: TObject);
begin
 // Set up the starting directory to be the current one
  flLib.InitialDir := GetCurrentDir;

  // Only allow existing files to be selected
  flLib.Options := [ofFileMustExist];

  // Display the open file dialog
  if flLib.Execute  then
    edLib.Text := flLib.FileName
  else
    edLib.Text := '';

end;

procedure TfrmCriadb.cbTipoBcoChange(Sender: TObject);
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

procedure TfrmCriadb.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmCriadb := nil ;
  action    := cafree;

end;

procedure TfrmCriadb.FormCreate(Sender: TObject);
Var
Tcn : TConecte;
n : Integer;
begin
  Tcn := TConecte.GetInstance;
  cbTipoBco.Clear;
  for n := 0 to Length( Tcn.aConn )-1 do
      cbTipoBco.Items.Add(Tcn.aConn[n]);

  cbTipoBco.ItemIndex := 0;
  variaveis();
  nmBco.Text   := adm_nmBcocnx ;
  edBanco.Text := LowerCase( GetCurrentDir +'\database\') ;
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

     LeIni('R');

 End;

end;

procedure TfrmCriadb.FormShow(Sender: TObject);
Var
r : TIdIPWatch;
begin

 r := TIdIPWatch.Create(nil);
 edHost.Text := r.LocalIP;
 r.free;
end;

procedure TfrmCriadb.btnGravaClick(Sender: TObject);
Var
Inif: TINIFILE ;
begin
 adm_TipoCnx      := cbTipoBco.Text ;
 adm_hostcnx      := edHost.Text    ;
 adm_usuariocnx   := edUsuario.Text ;
 adm_passcnx      := edPassw.Text   ;
 adm_diretoriocnx := edBanco.Text   ;
 adm_libcnx       := edLib.Text     ;
 LeIni('W');
 Close;
end;



procedure TfrmCriadb.btnTestaClick(Sender: TObject);
Var
  conn: TFDConnection;
  TConn : TConecte;
begin
  TConn := TConecte.getinstance;
  If TConn.TestaConect(cbTipoBco.Text ,edHost.Text, adm_nmBcocnx, edUsuario.Text, edPassw.Text ) then

  

end;

end.
