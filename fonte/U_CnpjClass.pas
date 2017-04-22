unit U_CnpjClass;

interface

uses
  pngimage,
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons,
  ACBrBase, ACBrSocket, ACBrConsultaCNPJ, JPEG, Mask; 

  Type
    TfrmCnpj = class(TForm)
    Private

       FEditTipo          : String;
       FEditRazaoSocial   : String;
       FEditAbertura      : String;
       FEditFantasia      : String;
       FEditEndereco      : String;
       FEditNumero        : String;
       FEditComplemento   : String;
       FEditBairro        : String;
       FEditCidade        : String;
       FEditUF            : String;
       FEditCEP           : String;
       FEditSituacao      : String;
       FEditCNAE1         : String;
       FListCNAE2         : String;
    protected

    Public
        property Tipo          : String read FEditTipo        write FEditTipo;
        property RazaoSocial   : String read FEditRazaoSocial write FEditRazaoSocial;
        property Abertura      : String read FEditAbertura    write FEditAbertura;
        property Fantasia      : String read FEditFantasia    write FEditFantasia;
        property Endereco      : String read FEditEndereco    write FEditEndereco;
        property Numero        : String read FEditNumero      write FEditNumero;
        property Complemento   : String read FEditComplemento write FEditComplemento;
        property Bairro        : String read FEditBairro      write FEditBairro;
        property Cidade        : String read FEditCidade      write FEditCidade;
        property UF            : String read FEditUF          write FEditUF;
        property CEP           : String read FEditCEP         write FEditCEP;
        property Situacao      : String read FEditCNAE1       write FEditCNAE1;
        property CNAE1         : String read FListCNAE2       write FListCNAE2;

        Constructor Create;               // declaração do metodo construtor
        Destructor  Destroy; Override;    // declaração do metodo destrutor
        Function    PagaCnpj(cnpj:String): Boolean;

    end;

type
  TfrmCnpjPesquisa = class(TForm)
    Panel1: TPanel;
    ButBuscar: TBitBtn;
    EditCaptcha: TEdit;
    Label14: TLabel;
    Timer1: TTimer;
    ACBrConsultaCNPJ1: TACBrConsultaCNPJ;
    Panel3: TPanel;
    Image1: TImage;
    LabAtualizarCaptcha: TLabel;
    ckRemoverEspacosDuplos: TCheckBox;
    procedure LabAtualizarCaptchaClick(Sender: TObject);
    procedure ButBuscarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditCaptchaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCnpjPesquisa: TfrmCnpjPesquisa;
  lOk                : Boolean;
  cnpj_              : String;
  EditTipo_          : String;
  EditRazaoSocial_   : String;
  EditAbertura_      : String;
  EditFantasia_      : String;
  EditEndereco_      : String;
  EditNumero_        : String;
  EditComplemento_   : String;
  EditBairro_        : String;
  EditCidade_        : String;
  EditUF_            : String;
  EditCEP_           : String;
  EditSituacao_      : String;
  EditCNAE1_         : String;
  ListCNAE2_         : TListBox;

implementation

{$R *.dfm}

procedure TfrmCnpjPesquisa.ButBuscarClick(Sender: TObject);
var
  I: Integer;
begin
  lOk := False;
  if EditCaptcha.Text <> '' then
  begin

    if ACBrConsultaCNPJ1.Consulta( cnpj_,  EditCaptcha.Text, ckRemoverEspacosDuplos.Checked  ) then
    begin
      EditTipo_        := ACBrConsultaCNPJ1.EmpresaTipo;
      EditRazaoSocial_ := ACBrConsultaCNPJ1.RazaoSocial;
      EditAbertura_    := DateToStr( ACBrConsultaCNPJ1.Abertura );
      EditFantasia_    := ACBrConsultaCNPJ1.Fantasia;
      EditEndereco_    := ACBrConsultaCNPJ1.Endereco;
      EditNumero_      := ACBrConsultaCNPJ1.Numero;
      EditComplemento_ := ACBrConsultaCNPJ1.Complemento;
      EditBairro_      := ACBrConsultaCNPJ1.Bairro;
      EditComplemento_ := ACBrConsultaCNPJ1.Complemento;
      EditCidade_      := ACBrConsultaCNPJ1.Cidade;
      EditUF_          := ACBrConsultaCNPJ1.UF;
      EditCEP_         := ACBrConsultaCNPJ1.CEP;
      EditSituacao_    := ACBrConsultaCNPJ1.Situacao;
      EditCNAE1_       := ACBrConsultaCNPJ1.CNAE1;
      lOk := True;
      {
      ListCNAE2_.Clear;
      for I := 0 to ACBrConsultaCNPJ1.CNAE2.Count - 1 do
        ListCNAE2_.Items.Add(ACBrConsultaCNPJ1.CNAE2[I]);
        }
    end;
  end
  else
  begin
    ShowMessage('É necessário digitar o captcha.');
    EditCaptcha.SetFocus;
  end;

  if lOk then
     Close;

end;

procedure TfrmCnpjPesquisa.EditCaptchaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    ButBuscarClick(ButBuscar);
end;

procedure TfrmCnpjPesquisa.FormShow(Sender: TObject);
begin
  Timer1.Enabled:= True;
end;

procedure TfrmCnpjPesquisa.LabAtualizarCaptchaClick(Sender: TObject);
var
  Stream: TMemoryStream;
  Png: TPngImage;
begin
  Stream := TMemoryStream.Create;
  Png := TPNGImage.Create;
  try
    ACBrConsultaCNPJ1.Captcha(Stream);
    Png.LoadFromStream(Stream);
    Image1.Picture.Assign(Png);

    EditCaptcha.Clear;
    EditCaptcha.SetFocus;
  finally
    Stream.Free;
    Png.Free;
  end;
end;

procedure TfrmCnpjPesquisa.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:= False;
  LabAtualizarCaptchaClick(LabAtualizarCaptcha);
  EditCaptcha.SetFocus;
end;

{ TfrmCnpj }

constructor TfrmCnpj.Create;
begin
{
}
end;

destructor TfrmCnpj.Destroy;
begin
{

}
  inherited;
end;

function TfrmCnpj.PagaCnpj(cnpj:String): Boolean;
begin
  cnpj_ := cnpj;
  frmCnpjPesquisa := TfrmCnpjPesquisa.Create(Self);
  frmCnpjPesquisa.ShowModal;

  Tipo          :=   EditTipo_;
  RazaoSocial   :=   EditRazaoSocial_;
  Abertura      :=   EditAbertura_;
  Fantasia      :=   EditFantasia_;
  Endereco      :=   EditEndereco_;
  Numero        :=   EditNumero_;
  Complemento   :=   EditComplemento_;
  Bairro        :=   EditBairro_;
  Cidade        :=   EditCidade_;
  UF            :=   EditUF_;
  CEP           :=   EditCEP_;
  Situacao      :=   EditSituacao_;
  CNAE1         :=   EditCNAE1_;

  Result := lOk

end;

end.
