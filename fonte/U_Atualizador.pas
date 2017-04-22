unit U_Atualizador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, ImgList, ExtCtrls, ComCtrls, xmldom,
  XMLIntf, IdHTTP, msxmldom, XMLDoc, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, ExtDlgs, RibbonLunaStyleActnCtrls,
  ToolWin, ActnMan, ActnCtrls, jpeg, edittuning, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, U_ClasseUtil,U_Classcons, ZDataset, ZDatasetUtils,
  Vcl.Buttons, U_ClassCad, IdExplicitTLSClientServerBase, IdFTP, IdFTPList,  IdAllFTPListParsers,
  System.ImageList;


type
  TfrmAtualizador = class(TForm)
    StatusBar1: TStatusBar;
    Banner: TPanel;
    imgLogo: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    ImageList1: TImageList;
    ActDlg: TActionManager;
    btnNovo: TAction;
    btnAlterar: TAction;
    btnExcluir: TAction;
    btnGrava: TAction;
    btnCancela: TAction;
    btnIni: TAction;
    btnAnt: TAction;
    btnProx: TAction;
    btnUlt: TAction;
    btnSair: TAction;
    Button1: TButton;
    ftpAtualiza: TIdFTP;
    GroupBox1: TGroupBox;
    lbArquivos: TLabel;
    prgReports: TProgressBar;
    prgBarTotal: TProgressBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure listarArquivosDir(diretorio: string; lista: array of Byte);
    function TemAtributo(Attr, Val: Integer): Boolean;
    procedure ftpAtualizaWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure ftpAtualizaWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure ftpAtualizaWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
  private
    BytesToTransfer: LongWord;
    { Private declarations }
    wEmpresa, wUsuInc, wHorInc, wUsuAlt, wHorAlt : string ;
    wDatInc, wDatAlt : Tdate;
    nNew, nRecno:  Integer;
    procedure pro_report(cPath, cPasta: string);
  public
    acampo, nSizeArq: integer;
    aberto, lMostra: Boolean;
    Util: TClasseUtil;
    Pesquisa : TClasConsulta;
    sqlNew    : TZQuery;
    aEdits : TArrayComp;
    cPre, cTabela: String;
    { Public declarations }
  end;

var
  frmAtualizador: TfrmAtualizador;
  modConsulta, nOrdem : integer;


implementation

uses  UCalculadora,  u_DmEmp, uSistema, U_funcao, U_CnpjClass;

{$R *.dfm}



procedure TfrmAtualizador.Button1Click(Sender: TObject);
Var
TempNome, c, _Erro, cPath, cPath2, cArq   : String;
lsReports                                 : array of Byte ;
i, Ret                                    : integer;
F                                         : TSearchRec;
Lista                                     : TStringList;
lPer                                      : Boolean;
begin
  Lista := TStringList.Create;
  cPath := ExtractFilePath( Application.ExeName ) ;


  setLength(lsReports, 0);
  I := 0;

  ftpAtualiza.Disconnect();
  ftpAtualiza.Host     := 'ftp.xpg.com.br';
  ftpAtualiza.Port     := 21;
  ftpAtualiza.Username := 'avelinoalessandro';
  ftpAtualiza.Password := 'amen1275';
  ftpAtualiza.Passive  := false; { usa modo ativo }

  try
    { Espera até 10 segundos pela conexão }
    ftpAtualiza.Connect();
  except
    on E: Exception do
    _Erro := E.Message;
  end;

  // Transfere reports
  pro_report(cPath, 'reports');
  // Transfere Docs
  pro_report(cPath, 'docs');
  // Transfere DllSys
  pro_report(cPath, 'DllSys');
  // Transfere Arquivos raiz
  pro_report(cPath, '');




  ftpAtualiza.Disconnect();

end;

procedure TfrmAtualizador.pro_report(cPath, cPasta: string );
Var
cPath2, TempNome,nmArquivo, c, _Erro, cArq   : String;
i, Ret                             : integer;
F                                  : TSearchRec;
Lista                              : TStringList;
lPer                               : Boolean;
lsReports                          : array of Byte ;
begin

  // Enviando arquivos de relatórios
  cPath2 := cPath+cPasta+'\';
  if cPasta.IsEmpty then
     cPath2 := cPath;


  listarArquivosDir(cPath2, lsReports);
  ftpAtualiza.ChangeDir('/dbsgt/');
  try
    ftpAtualiza.List(nil,cPasta, false);
  except
    ftpAtualiza.MakeDir(cPasta);
  end;
  ftpAtualiza.ChangeDir('/dbsgt/'+cPasta+'/');

  Ret                 := FindFirst(cPath2+'*.*', faArchive, F);
  prgBarTotal.Max     := ( f.Attr + f.ExcludeAttr );
  prgBarTotal.Position:= 0;
  while Ret = 0 do begin
      if (F.Name <> '.') And (F.Name <> '..') And (F.Name <> 'iphist.dat') then begin
          TempNome  := cPath2+F.Name;
          nSizeArq  := f.Size;
          lbArquivos.Caption := 'TRANSFERINDO: '+TempNome;
          lbArquivos.Refresh;
          nmArquivo := F.Name;
          if  Pos('.exe', LowerCase(nmArquivo)) > 0 then
              nmArquivo := StringReplace(nmArquivo, '.exe', '.atu', [rfReplaceAll, rfIgnoreCase]);

          ftpAtualiza.Put(TempNome,nmArquivo);
          prgBarTotal.Position := prgBarTotal.Position + 1;
      end;
      Ret := FindNext(F);
  end;
  FindClose(F);
end;

procedure TfrmAtualizador.listarArquivosDir(diretorio: string; lista: array of Byte);
var
  search_rec: TSearchRec;
  i : integer;
begin
  if FindFirst(diretorio + '*.*', faAnyFile, search_rec) = 0 then
    begin
      repeat
        if search_rec.Attr <> faDirectory then
//           setLength(lista, Length(lista)+1); i:= Length(lista)-1; lista[i]:= search_rec.Name ;
          //lista.Add(search_rec.Name);
      until FindNext(search_rec) <> 0;

      FindClose(search_rec);
    end;
end;




function TfrmAtualizador.TemAtributo(Attr, Val: Integer): Boolean;
begin
  Result := Attr and Val = Val;
end;

procedure TfrmAtualizador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sqlNew.Close;
    dmEmp.clicor.Close;
    frmAtualizador               := nil ;
    action                       := cafree;
end;



procedure TfrmAtualizador.FormCreate(Sender: TObject);
Var
i: Integer;
begin

end;


procedure TfrmAtualizador.FormShow(Sender: TObject);
var
i, tmp: Integer;
Pesquisa : TClasConsulta;
begin

  Util:= TClasseUtil.Create;
  Pesquisa := TClasConsulta.Create;

  // Cor do banner
  Banner.ParentBackGround := False;
  Banner.ParentColor      := False;
  Banner.Brush.Color      := u_funcao.Bronze_Escuro ;

  // Titulos do Banner
  lbCabeca01.Caption    := 'Modulo Atualizador';
  lbCabeca02.Caption    := u_funcao.nmSistema ;
  // Cores - Titulos do Banner
  lbCabeca01.Font.Color := u_funcao.clTit_BCad ;
  lbCabeca02.Font.Color := u_funcao.clTit_BCad ;

end;


procedure TfrmAtualizador.ftpAtualizaWork(ASender: TObject;
  AWorkMode: TWorkMode; AWorkCount: Int64);
begin
prgReports.Position := AWorkCount;
end;

procedure TfrmAtualizador.ftpAtualizaWorkBegin(ASender: TObject;
  AWorkMode: TWorkMode; AWorkCountMax: Int64);
begin
if AWorkCountMax > 0 then
  prgReports.Max := AWorkCountMax
else
  prgReports.Max := BytesToTransfer;
end;

procedure TfrmAtualizador.ftpAtualizaWorkEnd(ASender: TObject;
  AWorkMode: TWorkMode);
begin
BytesToTransfer := 0;
prgReports.Position := 0;
end;

initialization
  RegisterClass(TfrmAtualizador);


end.
