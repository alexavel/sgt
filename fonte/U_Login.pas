unit U_Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls, Vcl.XPMan, System.Actions,
  Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, EditTuning,
  System.ImageList, Vcl.ImgList, Vcl.Imaging.pngimage ;

type
  TFrmLogin = class(TForm)
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Banner: TPanel;
    Image1: TImage;
    lbCabeca01: TLabel;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    foto: TImage;
    edLogin: TEdit;
    edSenha: TEdit;
    cbxEmpresa: TComboBox;
    actLogin: TActionManager;
    btnLogin: TAction;
    btnCanLogin: TAction;
    IConesLogin: TImageList;
    procedure btnOKClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edLoginExit(Sender: TObject);
    procedure edSenhaExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses USistema,  FireDAC.Comp.Client, U_funcao , U_dmEmp, U_ClassConecte;

procedure TFrmLogin.btnOKClick(Sender: TObject);
Var
 qStr  : TFDQuery;
 buttonSelected : Integer;
begin
  qStr := TFDQuery.Create(Nil);
  with qStr do Begin
    Connection  := dmEmp.SqlConSis;
    SQL.Text    := ' SELECT * from dbconfig.usuario '
                  +' where usu_login = '+QuotedStr(edLogin.Text)
                  +' and   usu_senha = '+QuotedStr(u_funcao.Criptografar( Trim( edSenha.Text ) ));
    Open;
    if IsEmpty and ( edLogin.CanFocus ) then begin
       buttonSelected := messagedlg('Usuário ou Senha incorreto', mtError , [mbAbort], 0);
       edLogin.SetFocus;
    End Else Begin
      { Codigo }
      sysUsuario := fieldByName('usu_login').text;
      sysCodusu  := fieldByName('usu_codusu').AsInteger ;
      adm_codusu := fieldByName('usu_codusu').AsInteger ;
      ModalResult := mrOK;// retorna o resultado como OK
      SelecNameEmpresa( cbxEmpresa.Text )



    end;

  End;
  FreeAndNil(qStr);

end;

procedure TFrmLogin.btnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmLogin.edLoginExit(Sender: TObject);
Var
 qStr : TFDQuery;
 buttonSelected : Integer;
begin
  qStr := TFDQuery.Create(Nil);
  with qStr do Begin
    Connection  := dmEmp.SqlConSis;
    SQL.Text    := ' SELECT * from dbconfig.usuario where usu_login = '+QuotedStr(edLogin.Text);
    Open;
    if IsEmpty and ( edLogin.CanFocus ) then begin
       buttonSelected := messagedlg('Usuário não encontrado', mtError , [mbAbort], 0);
       edLogin.SetFocus;
       exit;
    end;
    if Not qStr.FieldByName('usu_database').IsNull then
       cbxEmpresa.ItemIndex := cbxEmpresa.Items.IndexOf(qStr.FieldByName('usu_database').Text);

  End;
  qStr.Free
end;

procedure TFrmLogin.edSenhaExit(Sender: TObject);
Var
 qStr : TFDQuery;
 buttonSelected : Integer;
begin
  qStr := TFDQuery.Create(Nil);
  with qStr do Begin
    Connection  := dmEmp.SqlConSis;
    SQL.Text    := ' SELECT * from dbconfig.usuario '
                  +' where usu_login = '+QuotedStr(edLogin.Text)
                  +' and   usu_senha = '+QuotedStr(u_funcao.Criptografar( Trim( edSenha.Text ) ));
    Open;
    if IsEmpty and ( edLogin.CanFocus ) then begin
       buttonSelected := messagedlg('Usuário ou Senha incorreto ', mtError , [mbAbort], 0);
       edLogin.SetFocus;
    End Else Begin
      { Codigo }
    end;

  End;
  qStr.Free
end;

procedure TFrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmLogin := nil ;
  action    := cafree;
end;

procedure TFrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //verifica se a tecla pressionada é a tecla ENTER, conhecida como #13
  If key = #13 then Begin
    //se for, passa o foco para o próximo campo, zerando o valor da variável Key
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;

end;

procedure TFrmLogin.FormShow(Sender: TObject);
begin

     // Verifica se existe alguma empresa inserida no banco
     dmEmp.sqlEmpresa.Open;
     cbxEmpresa.Clear;
     with dmEmp.sqlEmpresa do begin

       while Not Eof do begin
         cbxEmpresa.Items.Add(FieldByName('emp_fantasia').Text);
         Next;
       end;

     end;
     dmEmp.sqlEmpresa.close;
     cbxEmpresa.ItemIndex := 0;


end;

end.
