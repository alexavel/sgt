unit U_ClassAutoriza;

interface

uses
  pngimage,
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons,
  ACBrBase, ACBrSocket, ACBrConsultaCNPJ, JPEG, Mask, Vcl.ImgList,
  System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnMan, edittuning, ZDatasetUtils, ZDataset, DB, System.ImageList, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

  Type
    TfrmAutoiza = class(TForm)
    Private

       FEditTipo          : String;
    protected

    Public
        property Tipo          : String read FEditTipo        write FEditTipo;

        Constructor Create;               // declaração do metodo construtor
        Destructor  Destroy; Override;    // declaração do metodo destrutor
        Function    Autorizar(Tela,Regisrto, Processo: String ): Boolean;

    end;

type
  TfrmAutoriza = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    foto: TImage;
    edLogin: TEdit;
    edSenha: TEdit;
    Banner: TPanel;
    Image1: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    actLogin: TActionManager;
    btnLogin: TAction;
    btnCanLogin: TAction;
    ImageList2: TImageList;
    ImageList1: TImageList;
    lbNome: TLabel;
    Image2: TImage;
    procedure edLoginExit(Sender: TObject);
    procedure edLoginChange(Sender: TObject);
    procedure edSenhaExit(Sender: TObject);
    procedure btnLoginExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCanLoginExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAutoriza: TfrmAutoriza;
  lOk                 : Boolean;
  Tela_, Regisrto_, Processo_    : String;

implementation

{$R *.dfm}

uses uSistema, U_funcao, U_dmEmp;

procedure TfrmAutoriza.btnCanLoginExecute(Sender: TObject);
begin
  lOk := False;
  Close;
end;

procedure TfrmAutoriza.btnLoginExecute(Sender: TObject);
var
  cWhere:string;
  chk: Boolean;
  SQL2: TFDQuery;
begin
  chk := false;
  SQL2:= TFDQuery.Create(Nil);
  cWhere:=' where usu_login = '''+edLogin.Text+''' ';
  cWhere:= cWhere+' and usu_senha = '+QuotedStr(u_funcao.Criptografar(edSenha.Text))+' ';

  //Fazendo a consulta de Login
  with SQL2 do
    begin
      Connection := dmEmp.SqlConSis;
      Close;
      Sql.Text:='SELECT * FROM "dbconfig".usuario '+cWhere;
      Open;
    end;
  if SQL2.Eof then begin
     ShowMessage('Usuário ou Senha inválidos!'+#13+'Digite corretamente e Pressione [Enter] ');
     edLogin.Clear;
     edSenha.Clear;
     edLogin.SetFocus;
     lOk := False;
     exit;
 End Else
  if  Not SQL2.FieldByName('usu_autoriza').AsBoolean then begin
       ShowMessage(' Você não tem autorização administrativa para este evento ');
       edSenha.SetFocus;
       lOk := False;
       Exit;
  end;

   sysUsuario := SQL2.FieldByName('usu_LOGIN').AsString ;
  sysCodUsu  := SQL2.FieldByName('usu_CODUSU').AsInteger ;
  fPrincipal.sysUsuEmail:= SQL2.FieldByName('usu_email').AsString ;

  if Not SQL2.eof then
      lbNome.Caption := UpperCase( SQL2.FieldByName('usu_nome').Value );

  if Not TBlobField( SQL2.FieldByName( 'usu_foto' )).IsNull then begin
     If LoadImage( foto, TBlobField( SQL2.FieldByName( 'usu_foto' ) )  ) then
  End Else Begin
    foto.Picture.Bitmap.Assign(Nil);
    foto.Parent.Repaint;
  End;

  if Not SQL2.eof then begin
     Auditor( tela_, 'Aut proc '+Processo_,'Reg: '+Regisrto_+' por: '+lbNome.Caption );

     lOk := True;
     Close;
  end;
end;


procedure TfrmAutoriza.edLoginChange(Sender: TObject);
begin
  btnLogin.Enabled := ((edLogin.Text <> '') and (edSenha.Text <> ''))
end;

procedure TfrmAutoriza.edLoginExit(Sender: TObject);
var
  cWhere:string;
  chk: Boolean;
  SQL2: TFDQuery;
begin
  chk := false;
  SQL2:= TFDQuery.Create(Nil);
  if edLogin.Text <>'' then  begin
    cWhere:=' where usu_login = '''+edLogin.Text+''' ';
  end else  begin
    If (GetKeySTATE(VK_RETURN)>0) then begin
       ShowMessage('Digite o Login do Usuário');
       lOk := False;
       Exit;
    end;
  end;
  // Gerando os Turmas
  with SQL2 do
    begin
      Connection := dmEmp.SqlConSis;
      Close;
      Sql.Text:='SELECT * FROM "dbconfig".usuario '+cWhere;
      Open;
    end;
   sysUsuario := SQL2.FieldByName('usu_LOGIN').AsString ;
  sysCodUsu  := SQL2.FieldByName('usu_CODUSU').AsInteger ;
  fPrincipal.sysUsuEmail:= SQL2.FieldByName('usu_email').AsString ;

  if Not SQL2.eof then
      lbNome.Caption := UpperCase( SQL2.FieldByName('usu_nome').Value );

  if Not TBlobField( SQL2.FieldByName( 'usu_foto' )).IsNull then begin
     If LoadImage( foto, TBlobField( SQL2.FieldByName( 'usu_foto' ) )  ) then
  End Else Begin
    foto.Picture.Bitmap.Assign(Nil);
    foto.Parent.Repaint;
  End;

end;

procedure TfrmAutoriza.edSenhaExit(Sender: TObject);
var
  cWhere:string;
  chk: Boolean;
  SQL2: TFDQuery;
begin
  chk := false;
  SQL2:= TFDQuery.Create(Nil);
  if edLogin.Text <>'' then  begin
    cWhere:=' where usu_login = '''+edLogin.Text+'''  and  usu_senha = '+QuotedStr(u_funcao.Criptografar(edSenha.Text))+' '
  end else  begin
    If (GetKeySTATE(VK_RETURN) < 0) then begin
        edSenha.SetFocus;
        ShowMessage('Digite a Senha ');
        lOk := False;
        Exit;
    end;
  end;
  // Gerando os Turmas
  with SQL2 do
    begin
      Connection := dmEmp.SqlConSis;
      Close;
      Sql.Text:='SELECT * FROM "dbconfig".usuario '+cWhere;
      Open;
    end;
  if ( Not SQL2.Eof ) and (GetKeySTATE(VK_RETURN) < 0) then begin
     btnLoginExecute(Self);
  End Else
  if ( SQL2.Eof ) and (GetKeySTATE(VK_RETURN) < 0) then begin
       ShowMessage('Usuário ou senha invalido ');
       edSenha.SetFocus;
       lOk := False;
       Exit;
  end;

end;


procedure TfrmAutoriza.FormShow(Sender: TObject);
Var
Caminho : String;
begin
  edLogin.Hint := 'Atenção | Digite '+#13#10+' o Nome do Usuário '+#13#10+' | 25';
  edSenha.Hint := 'Atenção | Digite '+#13#10+' o Nome do Usuário '+#13#10+' | 25';

  // Cor do banner
  Banner.ParentBackGround := False;
  Banner.ParentColor      := False;
  Banner.Brush.Color      := u_funcao.Bronze_Escuro ;

  // Titulos do Banner
  lbCabeca01.Caption    := 'Autoriza processo';
  lbCabeca02.Caption    := u_funcao.nmSistema ;
  // Cores - Titulos do Banner
  lbCabeca01.Font.Color := u_funcao.clTit_BCad ;
  lbCabeca02.Font.Color := u_funcao.clTit_BCad ;

  btnLogin.Enabled := ((edLogin.Text <> '') and (edSenha.Text <> ''))
end;

{ TfrmCnpj }

constructor TfrmAutoiza.Create;
begin
{
}
end;

destructor TfrmAutoiza.Destroy;
begin
{

}
  inherited;
end;

function TfrmAutoiza.autorizar(Tela,Regisrto, Processo: String): Boolean;
begin
  Tela_       := Tela;
  Regisrto_   := Regisrto;
  Processo_   := Processo;

  frmAutoriza := TfrmAutoriza.Create(Self);
  frmAutoriza.ShowModal;
  Result      := lOk



end;

end.
