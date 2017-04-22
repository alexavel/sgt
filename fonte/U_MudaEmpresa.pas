unit U_MudaEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, ImgList, ExtCtrls, ComCtrls, xmldom,
  XMLIntf, IdHTTP, msxmldom, XMLDoc, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, ExtDlgs, RibbonLunaStyleActnCtrls, Ribbon,
  ToolWin, ActnMan, ActnCtrls, jpeg, Data.FMTBcd, Data.SqlExpr, zdataset,
  System.ImageList, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Imaging.pngimage ;

type
  TfrmMudaEmpresa = class(TForm)
    ImageList1: TImageList;
    Banner: TPanel;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    Image1: TImage;
    GroupBox1: TGroupBox;
    cbxEmpresa: TComboBox;
    btnselect: TButton;
    Button2: TButton;
    Image2: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnselectClick(Sender: TObject);
    function  ValidaLogin(): boolean;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cbxEmpresaChange(Sender: TObject);

  private
    wEmpresa, wUsuInc, wHorInc, wUsuAlt, wHorAlt : string ;
    wDatInc, wDatAlt : Tdate;
    nNew, nRecno:  Integer;

    { Private declarations }
  public
    { Public declarations }
    aEdits : array of TComponent;
  end;

var
  frmMudaEmpresa: TfrmMudaEmpresa;

implementation

uses U_dmEmp, uSistema, U_Pesquisa, U_funcao, U_Sys, U_ClassConecte;


{$R *.dfm}


procedure TfrmMudaEmpresa.btnselectClick(Sender: TObject);
Var
x: Integer;
TConn : TConecte;
cSql  : string;
begin
    TConn := TConecte.GetInstance;
    for X:=0 to Screen.FormCount-1  do Begin
        if ( Screen.Forms[x] <> Self ) and
           ( Screen.Forms[X].Name <> 'fPrincipal') AND
           ( Screen.Forms[X].Name <> 'frmIni') AND
           ( Screen.Forms[X].Name <> 'frmSys') AND
           ( Screen.Forms[X].Name <> 'frmMudaEmpresa')  then begin
           //ShowMessage('Feche todas as janelas abertas '+Screen.Forms[X].Name);
           Screen.Forms[X].Close;
        end;

    end;

    SelecNameEmpresa( cbxEmpresa.Text ) ;
    // Verifica se existe alguma empresa inserida no banco

    Auditor(Screen.activeform.Caption,'Selecionou','Empresa: '+cbxEmpresa.Text );
    fPrincipal.atualizatela;
    Close;


end;

procedure TfrmMudaEmpresa.Button2Click(Sender: TObject);
begin
  Close;

end;

procedure TfrmMudaEmpresa.cbxEmpresaChange(Sender: TObject);
begin
 btnselect.SetFocus;
end;

procedure TfrmMudaEmpresa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 frmMudaEmpresa := nil ;
 action         := cafree;
end;

procedure TfrmMudaEmpresa.FormCreate(Sender: TObject);
var nI: Integer;
begin
  // Cor do banner
  Banner.ParentBackGround := False;
  Banner.ParentColor      := False;
  Banner.Brush.Color      := u_funcao.Bronze_Escuro ;

  // Titulos do Banner
  lbCabeca01.Caption    := 'Módulo de Seleção de Empresa';
  lbCabeca02.Caption    := u_funcao.nmSistema ;
  // Cores - Titulos do Banner
  lbCabeca01.Font.Color := u_funcao.clTit_BCad ;
  lbCabeca02.Font.Color := u_funcao.clTit_BCad ;


  ValidaLogin();

//  .Values(u_funcao.BancoAtual). ;

end;

procedure TfrmMudaEmpresa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //verifica se a tecla pressionada é a tecla ENTER, conhecida pelo Delphi como #13
  If key = #13 then
    Begin
      //se for, passa o foco para o próximo campo, zerando o valor da variável Key
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
    end;

end;

function TfrmMudaEmpresa.ValidaLogin(): boolean;
Var
SQLQ : TFDQuery;
begin
  SQLQ := TFDQuery.Create(Self);
  with SQLQ do
    begin
      Close ;
      Connection := dmEmp.SqlConSis ;
      SQL.Text   :='SELECT * FROM "dbconfig".empresa ';
      open;
    end;
  cbxEmpresa.Clear;
  while not SQLQ.Eof do begin
        cbxEmpresa.Items.Add(SQLQ.fieldbyname('emp_fantasia').AsString);
        SQLQ.Next;
  end;
  cbxEmpresa.ItemIndex := cbxEmpresa.Items.IndexOf(u_funcao.BancoAtual) ;

end;
initialization
  RegisterClass(TfrmMudaEmpresa);

end.
