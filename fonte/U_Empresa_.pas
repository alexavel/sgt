unit U_Empresa_;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_000MdlCrud, Data.DB,
  FireDAC.Phys.MySQLDef, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Data.Bind.Components, Data.Bind.DBScope, FireDAC.Phys,
  FireDAC.Phys.MySQL, System.ImageList, Vcl.ImgList, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.Imaging.jpeg, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.ExtDlgs, U_Classcons, EditTuning ;

type
  TfrmEmpresa_ = class(T_frmModeloCrud)
    Label8: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label24: TLabel;
    Label7: TLabel;
    Label21: TLabel;
    Label39: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    emp_codemp: TEdit;
    emp_nome: TEdit;
    emp_dtbase: TEdit;
    emp_cnpj: TMaskEdit;
    emp_fantasia: TEdit;
    emp_endemp: TEdit;
    emp_baiemp: TEdit;
    emp_codcid: TButtonedEdit;
    edNomCid: TEdit;
    edUf: TEdit;
    emp_numemp: TEdit;
    emp_cepemp: TMaskEdit;
    emp_telemp: TMaskEdit;
    emp_tl1emp: TMaskEdit;
    emp_tl2emp: TMaskEdit;
    emp_faxemp: TMaskEdit;
    emp_tipo: TEdit;
    emp_dtabertura: TDateTimePicker;
    emp_comemp: TEdit;
    emp_situacao: TEdit;
    GroupBox3: TGroupBox;
    emp_logo: TImage;
    Button1: TButton;
    emp_site: TEdit;
    emp_email: TEdit;
    procedure emp_codcidRightButtonClick(Sender: TObject);
    procedure emp_codcidKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure emp_codcidExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure emp_cnpjExit(Sender: TObject);
    procedure emp_fantasiaChange(Sender: TObject);
  private
    procedure LancBDE;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmpresa_: TfrmEmpresa_;

implementation

{$R *.dfm}

uses U_dmEmp, U_CnpjClass, U_funcao;

procedure TfrmEmpresa_.Button1Click(Sender: TObject);
Var
BMP: TBitmap;
JPG: TJPegImage;
begin
  inherited;
if openpicturedialog1.Execute then
  begin
    emp_logo.Picture.LoadFromFile(openpicturedialog1.FileName);
  end;
end;

procedure TfrmEmpresa_.emp_cnpjExit(Sender: TObject);
Var
cNmDataBase: String;
Empresa: TfrmCnpj;
begin
  inherited;

  Empresa:= TfrmCnpj.Create;
  if  (emp_CNPJ.Text <> '99999999999999') and (ChkCNPJ(emp_CNPJ.Text, cTabela,'emp_CNPJ' )) then Begin
    iF isCNPJ(emp_CNPJ.Text) then Begin

        If Empresa.PagaCnpj(emp_CNPJ.Text)  then Begin
            emp_Tipo.Text:= Empresa.Tipo;
            if Empresa.Abertura <> '' then
               emp_dtAbertura.Date := StrToDate(Empresa.Abertura);

            emp_nome.Text:= Empresa.RazaoSocial;
            if RemoveChar(Empresa.Fantasia) = '' then Begin
                emp_fantasia.Text:= Empresa.RazaoSocial;
            End Else Begin
                emp_fantasia.Text:= Empresa.Fantasia;
            End;
            emp_EndEmp.Text:= Empresa.Endereco;
            emp_NumEmp.Text:= Empresa.Numero;
            emp_ComEmp.Text:= Empresa.Complemento;
            emp_CepEmp.Text:= RemoveChar(Empresa.CEP);
            emp_BaiEmp.Text:= Empresa.Bairro;
            edNomCid.Text:= Empresa.Cidade;
            EdUF.Text:= Empresa.UF;
            emp_Situacao.Text:= Empresa.Situacao;

            if emp_codcid.Text = '' then
               emp_codcid.Text := IntToStr( ChkTabCid( edNomCid.Text, EdUF.Text ) );

            LancBDE();
            emp_Tipo.SetFocus;
        End Else
            emp_CNPJ.setfocus;
    End Else Begin
       ShowMessage('Erro de CNPJ'  );
       emp_CNPJ.SetFocus ;
    End;
  End Else Begin
    if  (emp_CNPJ.Text <> '99999999999999') Then Begin
        emp_CNPJ.SetFocus ;
    End Else Begin
        // Passa
        emp_EndEmp.Text:= 'Endereço';
        emp_NumEmp.Text:= '999';
        emp_ComEmp.Text:= 'Complemento';
        edNomCid.Text:= 'Fortaleza';
        EdUF.Text:= 'CE';
        if emp_codcid.Text = '' then
           emp_codcid.Text := IntToStr( ChkTabCid( edNomCid.Text, EdUF.Text ) );

        LancBDE();
        emp_Tipo.SetFocus;
    End;
  End;
  FreeAndNil(Empresa);

end;

procedure TfrmEmpresa_.emp_codcidExit(Sender: TObject);
Var
Pesquisa : TClasConsulta;
begin
  inherited;
  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlCIdade ;
  edNomCid.Text :=  Pesquisa.Relacao('cidade',emp_codcid,'cid_codigo','cid_nome');
  edUf.Text     :=  Pesquisa.Relacao('cidade',emp_codcid,'cid_codigo','est_uf');


end;

procedure TfrmEmpresa_.emp_codcidKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 Try
case key of
    VK_END:
      emp_codcidRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmEmpresa_.emp_codcidRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsCidade ;
  Pesquisa.sqlTabela :=  dmEmp.sqlCIdade ;
  Pesquisa.cliTabela :=  dmEmp.cliCIdade ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Cidades';
  Pesquisa.nmTabela  := 'Cidade';
  // Display        campo   cabecalho           get         tan  indices
  Pesquisa.AddReg('cid_codigo','Código'           ,'codcid'    ,5  ,'por Código' );
  Pesquisa.AddReg('cid_nome'  ,'Nome da Cidade'   ,'edNomCId'  ,20 ,'por Cidade' );
  Pesquisa.AddReg('est_uf'    ,'Uf'               ,'edUF'      ,5  ,'por Estado' );
  Pesquisa.acessa(emp_CodCid);
  emp_codcid.text   :=  Pesquisa.RecReg('cid_codigo');
  edNomCId.text :=  Pesquisa.RecReg('cid_nome');
  edUF.text     :=  Pesquisa.RecReg('est_uf');
  Pesquisa.Destroy


end;

procedure TfrmEmpresa_.emp_fantasiaChange(Sender: TObject);
begin
  LancBDE();
end;

procedure TfrmEmpresa_.LancBDE();
var
  cNmDataBase: string;
Begin
   if emp_codemp.Text = ''  then Begin
      cNmDataBase     :=  emp_CNPJ.Text+'_'+Copy(emp_fantasia.Text,0,5);
      emp_dtbase.Text :=  cNmDataBase;
   End Else If (emp_fantasia.Text = '') or (emp_CNPJ.Text = '') Then Begin
      emp_fantasia.SetFocus;
   End;
End;


end.
