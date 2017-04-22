unit U_CpfClass;

interface

uses
  PNGImage,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ACBrBase, ACBrSocket, ACBrConsultaCPF, zdataset, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  Vcl.Mask, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

  Type
    TfrmCpf = class(TForm)
    Private

       FEditRazaoSocial       : String;
       FEditSituacao          : String;
       FEdtEmissao            : String;
       FEdtCodCtrlControle    : String;
       FEdtDigitoVerificador  : String;
       FDatNas                : String;

    protected

    Public
        property Nome          : String read FEditRazaoSocial       write FEditRazaoSocial;
        property Situacao      : String read FEditSituacao          write FEditSituacao;
        property Emissao       : String read FEdtEmissao            write FEdtEmissao;
        property Controle      : String read FEdtCodCtrlControle    write FEdtCodCtrlControle;
        property Digito        : String read FEdtDigitoVerificador  write FEdtDigitoVerificador;
        property DatNas        : String read FDatNas                write FDatNas;

        Constructor Create;               // declaração do metodo construtor
        Destructor  Destroy; Override;    // declaração do metodo destrutor
        Function    Pagacpf(Sender: TObject): Boolean;

    end;

type
  TfrmCpfPesquisa = class(TForm)
    Panel1: TPanel;
    EditCaptcha: TEdit;
    Label14: TLabel;
    Timer1: TTimer;
    Panel3: TPanel;
    Image1: TImage;
    LabAtualizarCaptcha: TLabel;
    btnConsultar: TButton;
    Label2: TLabel;
    EditDtNasc: TEdit;
    ConsultaCpf: TACBrConsultaCPF;

    procedure btnConsultarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure LabAtualizarCaptchaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private

  public
  end;

var
  frmCpfPesquisa: TfrmCpfPesquisa;
  lOk                   : Boolean;
  cpf_                  : String;
  EditRazaoSocial_      : String;
  EditSituacao_         : String;
  EdtEmissao_           : String;
  EdtCodCtrlControle_   : String;
  EdtDigitoVerificador_ : String;
  DatNas_               : String;

implementation

{$R *.dfm}

uses U_funcao, U_dmEmp ;


{ TfrmCnpj }

constructor TfrmCpf.Create;
begin
{
}
end;

destructor TfrmCpf.Destroy;
begin
{

}
  inherited;
end;

function Tfrmcpf.PagaCpf(Sender: TObject): Boolean;
Var
  cNmDataBase: String;
  SQLQuery1 : TFDQuery;
  cTab, cPrf, cNcmp: String;
  indice    : integer;
begin
 // Veriica se ja Existe o CNPJ na tabela
  SQLQuery1 := TFDQuery.Create(Nil);
  SQLQuery1.Close;
  SQLQuery1.Connection:= dmEmp.SqlConSis;
  SQLQuery1.Sql.Text  :=  'SELECT TABLE_CATALOG               AS BD '
                          +'     , TABLE_SCHEMA               AS ESQUEMA_TABELA '
                          +'     , TABLE_NAME                 AS TABELA          '
                          +'     , COLUMN_NAME                AS COLUNA          '
                          +'     , ORDINAL_POSITION           AS ORD_POS         '
                          +'     , DATA_TYPE                  AS TIPO            '
                          +'     , CHARACTER_MAXIMUM_LENGTH   AS TAM_CARACTER    '
                          +'     , DATETIME_PRECISION         AS TAM_DATA        '
                          +'     , NUMERIC_PRECISION          AS TAM_NUMERICO    '
                          +'     , CASE WHEN CHARACTER_MAXIMUM_LENGTH  IS NOT NULL THEN '
                          +'                CAST(CHARACTER_MAXIMUM_LENGTH AS NUMERIC(16,6)) '
                          +'            WHEN DATETIME_PRECISION IS NOT NULL THEN             '
                          +'                CAST(DATETIME_PRECISION AS NUMERIC(16,6))        '
                          +'            ELSE                                                 '
                          +'                CAST(CAST(NUMERIC_PRECISION AS VARCHAR) || ''.'' || CAST( NUMERIC_SCALE AS VARCHAR) AS NUMERIC(16,6)) '
                          +'       END                        AS TAM '
                          +'     , CASE WHEN IS_NULLABLE = ''YES'' THEN ''SIM'' ELSE ''NÃO''  END  AS NULO '
                          +'     , COLLATION_NAME             AS COLLATION '
                          +'     , length(COLUMN_NAME)           AS TAM_NOME_COLUNA '
                          +'     , length(TABLE_NAME)            AS TAM_NOME_TABELA '
                          +'   FROM INFORMATION_SCHEMA.COLUMNS '
                          +' WHERE COLUMN_NAME  = '+QuotedStr( TMaskEdit( Sender ).Name );
  SQLQuery1.open;
  if Not SQLQuery1.Eof then begin
         cTab     :=  SQLQuery1.FieldByName('TABELA').Value  ;
         cPrf     :=  Copy(TMaskEdit( Sender ).Name,1,4);
         cNcmp    :=  cPrf+'nome';
         SQLQuery1.Close;
         SQLQuery1.Sql.Text  := 'Select * FROM '+U_funcao.SelSchema(cTab)+' WHERE '+TMaskEdit( Sender ).Name+' = '+QuotedStr( TMaskEdit( Sender ).Text );
         SQLQuery1.open;
         if Not SQLQuery1.Eof then begin
            ShowMessage(' CPF já cadastrado '+UpperCase( SQLQuery1.FieldByName(cNcmp).value) ) ;
            TMaskEdit( Sender ).SetFocus;
            Exit;
         end;
  end;

  if ChecaFT(cfgATCPF) then Begin
      cpf_ := TMaskEdit( Sender ).text;
      frmcpfPesquisa := TfrmcpfPesquisa.Create(Self);
      frmcpfPesquisa.ShowModal;

      Nome          :=   EditRazaoSocial_ ;
      Situacao      :=   EditSituacao_ ;
      Emissao       :=   EdtEmissao_ ;
      Controle      :=   EdtCodCtrlControle_ ;
      Digito        :=   EdtDigitoVerificador_ ;
      DatNas        :=   DatNas_ ;
  End Else
      Result := ChecaFT(cfgATCPF);

end;


procedure TfrmCpfPesquisa.btnConsultarClick(Sender: TObject);
begin
  if EditCaptcha.Text <> '' then
  begin
    if ConsultaCpf.Consulta(cpf_, EditDtNasc.Text, EditCaptcha.Text) then
    begin
      EditRazaoSocial_      := ConsultaCpf.Nome;
      EditSituacao_         := ConsultaCpf.Situacao;
      EdtEmissao_           := ConsultaCpf.Emissao;
      EdtCodCtrlControle_   := ConsultaCpf.CodCtrlControle;
      EdtDigitoVerificador_ := ConsultaCpf.DigitoVerificador;
      DatNas_               := EditDtNasc.Text ;
      Close;
    end;
  end
  else
  begin
    ShowMessage('É necessário digitar o captcha.');
    EditCaptcha.SetFocus;
  end;

end;

procedure TfrmCpfPesquisa.FormShow(Sender: TObject);
begin
  Timer1.Enabled := True;
  EditDtNasc.SetFocus;
end;

procedure TfrmCpfPesquisa.LabAtualizarCaptchaClick(Sender: TObject);
var
  Stream: TMemoryStream;
  ImgArq: String;
begin
  Stream := TMemoryStream.Create;
  try
    ConsultaCpf.Captcha(Stream);
    ImgArq := ExtractFilePath(ParamStr(0))+PathDelim+'captch.png';
    Stream.SaveToFile( ImgArq );
    Image1.Picture.LoadFromFile( ImgArq );

    EditCaptcha.Clear;
    EditCaptcha.SetFocus;
  finally
    Stream.Free;
  end;
end;

procedure TfrmCpfPesquisa.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  LabAtualizarCaptchaClick(LabAtualizarCaptcha);
  EditCaptcha.SetFocus;
end;

end.
