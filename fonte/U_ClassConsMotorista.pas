unit U_ClassConsMotorista;

interface

uses
  pngimage,
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons,
  ACBrBase, ACBrSocket, ACBrConsultaCNPJ, JPEG, Mask, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DateUtils, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

  Type
    TfrmMotorista = class(TForm)
    Private

       FCodigo            : String;
    protected

    Public
        property Codigo          : String read FCOdigo        write FCOdigo;

        Constructor Create;               // declaração do metodo construtor
        Destructor  Destroy; Override;    // declaração do metodo destrutor
        Function    PagaMotorista(codigox: TButtonedEdit): Boolean;

    end;

type
  TfrmConsMotorista = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edNomPss: TEdit;
    edValid: TEdit;
    Label3: TLabel;
    zSql: TZQuery;
    edStatus: TLabel;
    tmPisca: TTimer;
    timFoto: TImage;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    edEmiss: TEdit;
    Label4: TLabel;
    edHabiita: TEdit;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure tmPiscaTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsMotorista: TfrmConsMotorista;
  lOk                : Boolean;
  cMotorista, cMsg, dhabilita, cHb, dEmissao, nHabilita   : String;
  Fotox : TBlobField;

implementation

{$R *.dfm}

uses U_dmEmp, U_funcao;



procedure TfrmConsMotorista.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    frmConsMotorista            := nil ;
    action                      := cafree;
end;

procedure TfrmConsMotorista.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //verifica se a tecla pressionada é a tecla ENTER, conhecida como #13
  If key = #13 then Begin
    //se for, passa o foco para o próximo campo, zerando o valor da variável Key
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  End Else
    If key = #27 then Begin
       Close;
  end;

end;

procedure TfrmConsMotorista.FormShow(Sender: TObject);
begin
 edNomPss.Text     := cMotorista;
 edValid.Text      := dhabilita;
 edEmiss.Text      := dEmissao;
 edStatus.Caption  := cMsg;
 edHabiita.Text    := nHabilita;
 if Fotox <> Nil then begin
     If LoadImage( timFoto, Fotox ) then
  End Else Begin
     //timFoto.Picture.Bitmap.Assign(Nil);
  End;

 if chb = '0' then begin
    edStatus.Color := clRed;
    edStatus.Font.Color := clWhite
 end Else begin
    edStatus.Color := clGreen;
    edStatus.Font.Color := clWhite
 end;

end;


procedure TfrmConsMotorista.SpeedButton1Click(Sender: TObject);
begin
Close;
end;

{ TfrmCnpj }

constructor TfrmMotorista.Create;
begin
{
}
end;

destructor TfrmMotorista.Destroy;
begin
{

}
  inherited;
end;

function TfrmMotorista.PagaMotorista(codigox: TButtonedEdit ): Boolean;
Var
zSqlx : TFDQuery;
begin
  if ( codigox.text = '' ) or ( Not codigox.CanFocus )then
     Exit;

  zSqlx := TFDQuery.Create(Self);
  zSqlx.Close;
  zSqlx.Connection  := dmEmp.SqlConSis;
  zSqlx.SQL.Text    := ' SELECT * from '+U_funcao.SelSchema('pessoal')
                      +' LEFT JOIN "dbconfig".cargo on cgo_codigo = pss_codcgo '
                      +' where pss_codigo = '+codigox.text+' ';
  zSqlx.Open;
  if zSqlx.Eof then
      Exit;

  cMotorista  := zSqlx.FieldByName('pss_nome').Text ;
  dhabilita   := zSqlx.FieldByName('pss_hbvalid').Text ;
  dEmissao    := zSqlx.FieldByName('pss_hbemite').Text ;
  nHabilita   := zSqlx.FieldByName('pss_habilitac').Text ;

  if Not TBlobField( zSqlx.FieldByName( 'pss_foto' ) ).IsNull then begin
      Fotox := TBlobField( zSqlx.FieldByName( 'pss_foto' ) );
  End Else Begin
      Fotox := Nil;
  End;
  If zSqlx.FieldByName('pss_habilitac').IsNull then begin
     cMsg             := ' M O T O R I S T A  N Ã O  H A B I L I T A D O !!';
     cHb              := '0';
     frmConsMotorista := TfrmConsMotorista.Create(Self);
     frmConsMotorista.ShowModal;
     Result           := True;
     exit;
  end Else
  If zSqlx.FieldByName('pss_status').Value <> 'ATIVO' then begin
     cMsg             := ' M O T O R I S T A  I N A T I V O !!';
     cHb              := '0';
     frmConsMotorista := TfrmConsMotorista.Create(Self);
     frmConsMotorista.ShowModal;
     Result           := True;
     exit;
  end Else
  If zSqlx.FieldByName('pss_hbvalid').AsDateTime < now then begin
     cMsg             := 'H A B I L I T A Ç Ã O   V E N C I D A !';
     cHb              := '0';
     frmConsMotorista := TfrmConsMotorista.Create(Self);
     frmConsMotorista.ShowModal;
     Result           := True;
     exit;
  end Else
    If DaysBetween(now,zSqlx.FieldByName('pss_hbvalid').AsDateTime ) <= 30 then begin
     cMsg             := 'PRAZO DE '+IntToStr(DaysBetween(now,zSqlx.FieldByName('pss_hbvalid').AsDateTime ))+' DIAS PARA RENOVAÇÃO!';
     cHb              := '1';
     frmConsMotorista := TfrmConsMotorista.Create(Self);
     frmConsMotorista.ShowModal;
     Result           := True;
     exit;
  end;



end;

procedure TfrmConsMotorista.tmPiscaTimer(Sender: TObject);
begin
  edStatus.Visible:=not(edStatus.Visible);
end;

end.
