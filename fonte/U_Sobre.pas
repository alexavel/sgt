unit U_Sobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ImgList, jpeg, DB, pngimage, edittuning, ZDatasetUtils, ZDataset,
  System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  Vcl.Buttons, System.ImageList;

type
  TfrmSobre = class(TForm)
    ImageList1: TImageList;
    Banner: TPanel;
    Label3: TLabel;
    Image1: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    ImageList2: TImageList;
    Image2: TImage;
    Label2: TLabel;
    Label1: TLabel;
    Image3: TImage;
    Label4: TLabel;
    lbversao: TLabel;
    GroupBox1: TGroupBox;
    lbIp: TLabel;
    lbMac: TLabel;
    lbCpu: TLabel;
    lbUsu: TLabel;
    lbCpo: TLabel;
    lbCpl: TLabel;
    lbSHd: TLabel;
    lbCpc: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    btnOk: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation

uses uSistema, U_dmEmp, U_funcao, U_Sys, U_INI,
  U_SISTEMA_DADOS;

{$R *.dfm}

procedure TfrmSobre.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSobre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    frmSobre := nil ;
    action := cafree;

end;

procedure TfrmSobre.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
      vk_Escape: CLose;
  end;
end;

procedure TfrmSobre.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //verifica se a tecla pressionada é a tecla ENTER, conhecida pelo Delphi como #13
  If key = #13 then
    Begin
      //se for, passa o foco para o próximo campo, zerando o valor da variável Key
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
    end;

end;

procedure TfrmSobre.FormShow(Sender: TObject);
Var
Caminho : String;
dados : TDadosPC;
begin
  dados := TDadosPC.Create;
  // Cor do banner
  Banner.ParentBackGround := False;
  Banner.ParentColor      := False;
  Banner.Brush.Color      := u_funcao.Bronze_Escuro ;

  // Titulos do Banner
  lbCabeca01.Caption    := 'Informações Gerais';
  lbCabeca02.Caption    := u_funcao.nmSistema ;
  // Cores - Titulos do Banner
  lbCabeca01.Font.Color := u_funcao.clTit_BCad ;
  lbCabeca02.Font.Color := u_funcao.clTit_BCad ;
  lbversao.Caption      := U_funcao.GetVersion;

  lbCpu.Caption         := 'Nome do Computador : '+dados.Computador;
  lbUsu.Caption         := 'Usuário logado : '+dados.Usuario;
  lbIp.Caption          := 'Endereço de Protocolo local: '+dados.IpLocal;
  lbMac.Caption         := 'Endereço Mac : '+dados.MAC;
  lbSHd.Caption         := 'Numero Serial do HD : '+dados.SeriaDiscoC('C');
  lbCpc.Caption         := 'Capacidade de Armazenamento : '+ IntToStr( dados.TamanhoDisco('C') );
  lbCpo.Caption         := 'Espaço utilizado : '+IntToStr( dados.TamanhoDiscoOcupado('C') );
  lbCpl.Caption         := 'Espaço Livre : '+IntToStr( dados.TamanhoDiscoLivre('C') );


end;

initialization
  RegisterClass(TfrmSobre);

end.
