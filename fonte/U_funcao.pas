unit U_funcao;
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnMan, Vcl.Buttons, Vcl.ImgList,  Menus, ComCtrls,   ToolWin, IniFiles,
  dbTables, FMTBcd, DB, SqlExpr, DBXFirebird, StrUtils, Datasnap.Provider, Datasnap.DBClient,
  Vcl.Imaging.jpeg, zdataset, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  xmldom, XMLIntf, msxmldom, XMLDoc, IdHTTP, Mask, DateUtils, zlib, ZConnection, TLHelp32, frxClass,
  frxDBSet, frxExportImage, frxExportRTF, frxExportPDF, frxExportMail,
  frxExportXML, frxExportXLS, frxExportDBF, frxExportDOCX, frxExportText,
  frxExportCSV, wininet,  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, IdHashMessageDigest ;

Type {Tipos criados}
  TSemestre = record
  Mes, Ano : Word;
 end;
  Semestre = array[0..5] of TSemestre;
Var
    {Variaveis de ambiente de parametros}
    cfgCodigo,    cfgCodcid	    :Integer;
    cfgEmpresa,   cfgFantasia,  cfgCnpj,      cfgEndereco,  cfgNumero,
    cfgComple,    cfgBairro,    cfgTelef1,    cfgTelef2,    cfgCep,     cfgSite,
    cfgEmail,     cfgConexao,   cfgUsucon,    cfgSencon,    cfgPortacon,cfgHostcon,
    cfgTsl,       cfgMetodo,    cfgOfctransf, cfgQtdprc,    cfgNew,     cfgEndtablic,
    cfgHorexe,    cfgUsuinc,    cfgMatcon,    cfgMencon,    cfgMtrcon,  cfgMntcnt, cfgTotpar,
    cfgAutenticon,cfgSeguricon, cfgMntimpr,   cfgAtcpf,     cfgAtcnpj,  cfgAtcep,  sysUsuario:  String;
    cfgKmveri     :Double;
    cfgDatexe,    cfgDatinc     :TDate;
    sysCodusu:  Integer ;
    //****************************************************************************************//

    // variáveis de cores
    Amarelo, Amarelo_Esverdeado,  Aquamarine, Aquamarine_Medio, Azul, Azul_Ardosia,
    Azul_Ardosia_Escuro, Azul_Brilhante, Azul_Celeste, Azul_Claro,  Azul_Corn_Flower,
    Azul_Escuro,  Azul_Marinho, Azul_Medio, Azul_Neon,  Azul_Rich,  Azul_Violeta, Baker_Chocolate,
    Branco, Bright_Ouro,  Bronze, Bronze_Claro, Bronze_Escuro,  Caqui,  Cinza,  Cinza_Brilhante,
    Cinza_Claro,  Cobre,  Cobre_Claro,  Cobre_Escuro, Coral,  Cyan, Escarlata,  Firebrick,  Goldenrod_Medio,
    Goldenrod,  Laranja,  Laranja_Mandarian,  Light_Steel_Blue, Light_Wood, Magenta,  Marrom_lilaz, Marrom, Marrom_Escuro,
    Medium_Slate_Blue,  Orquidea_Escuro,  Orquidea_Medio, Ouro, Ouro_Velho, Plum, Preto,  Purpura_Escuro, Quartz, Rosa,
    Rosa_Temperado, Salmao, Semi_Sweet_Chocolate, Sienna, Silver, Steel_Azul, Summer_Sky, Tan_Escuro, Thistle,  Turquesa,
    Turquesa_Escuro,  Turquesa_Medio, Verde,  Verde_Amarelado,  Verde_Cobre,  Verde_Cobre_Escuro, Verde_Escuro, Verde_Floresta,
    Verde_Floresta_Medio, Verde_Hunter, Verde_Limao,  Verde_Oceano, Verde_Oceano_claro, Verde_Oliva_Escuro, Verde_Primavera,
    Verde_Primavera_claro, Vermelho, Vermelho_Indiano, Vermelho_Violeta, Violeta,  Violeta_Vermelho_Medio, Wheat,  Wood_Medio,
    Cinza_Sintilante : TColor ;

    // variáveis de cores das telas e banners
    nmSistema,  nmVersao: String ;
    BancoAtual, DBSel: String ;
    // variáveis de cores das telas e banners
    clTit_BCad: TColor;
    DiasAtiv : Integer;

    { Public declarations }
    cdUsuario : Integer;
    usuario,  password, TipoCnx,      nmUsuario,  emUsuario : string ;
    Caminho,  ArqIni,   CamIni,       CamIni2,    Host,         CanBco:     string;
    CnxTipo,  CnxHost,  CnxCaminho,   CnxUsuario, CnxPassword,  bdSistema: string;
    nmBanco,  cHorexe,  cDatexe,      nmPrograma, cendtablic:   string;
    aListForm, aUniMed, aTipoVeic : array of string;
    aMeses : array[1..12] of string=('Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro');

    // Vstiaveis do CreatSys
    db, TelaP,cTab, cTab2: string;
    nmSchemaEmp, nmSchemaEmp_: String;





    // Diretivas de Configurações do sistema
    ChkCPF, lAcesso, lRoolBack  : Boolean;
    ChkTotPar : String;

    {Váriáveis públicas de Conexão com o banco de dados}
    adm_codusu      : integer ;
    adm_codemp      : integer ;
    adm_TipoCnx     : String  ;
    adm_hostcnx     : String  ;
    adm_usuariocnx  : String  ;
    adm_passcnx     : String  ;
    adm_diretoriocnx: String  ;
    adm_libcnx      : String  ;
    lAtualiza       : Boolean ;
    Const adm_nmBcocnx    : String  = 'dbsgt';
    Const nmSchemaCfg     : String  = '"dbconfig"';
    Const nmSchemaCfg_    : String  = 'dbconfig';


    {$IFDEF WIN32}
      const Estrutura: String = 'Windows 32 bits';
    {$ENDIF}
    {$IFDEF WIN64}
      const Estrutura: String = 'Windows 64 bits';
    {$ENDIF}

    {Váriáveis públicas de Emai}
    const adm_email       : String  = 'avelinoalessandro@gmail.com';
    const adm_smtp        : String  = 'smtp.gmail.com';
    const adm_usuario     : String  = 'avelinoalessandro@gmail.com';
    const adm_senha       : String  = '12936511';
    const adm_porta       : integer = 587;
    const adm_metodo      : String  = 'sslvSSLv3';
    const adm_tsl         : String  = 'RequireTLS';
    const adm_modseg      : Boolean = True;
    const adm_autent      : Boolean = True;
    const adm_nmapp       : String  = 'Sistema de Gestão de Escolas - SGEplus';





function mensagem(Texto: string; Botao: TMsgDlgButtons = [mbOk]; Rotulo:String = 'Atenção'; Icon : TMsgDlgType = mtWarning): integer;
function ValidaEMail(Email : String): Boolean;
function TestaComponente(Nome: String): boolean;
function BuscaCep(edCep: TMaskEdit; edLog, edBairro, edCidade, edUf: Tedit): Boolean;
function ConsLike(nmTabela, Campo: string; edPesq:TEdit; Ztab:TFdQuery): String;
Function Qlinha: PWChar;
procedure MoedaChange(edMoeda: TMaskEdit);
procedure MoedaKeyEdit( Key: Char; edMoeda: TMaskEdit);
procedure MoedaKeyCEdit( Key: Char; edMoeda: TMaskEdit; Casa: Integer);
procedure PorcentoKeyEdit( Key: Char; edMoeda: TMaskEdit);
procedure MoedaKeyMask( Key: Char; edMoeda: TMaskEdit);
procedure KmKeyEdit(Key: Char; edMoeda: TMaskEdit);
procedure KgKeyEdit(Key: Char; edMoeda: TMaskEdit);
procedure TanqKeyEdit(Key: Char; edMoeda: TMaskEdit);
procedure QtdChange(edMoeda: TMaskEdit);
procedure QtdKey( Key: Char; edMoeda: TMaskEdit);

function RemoveChar(texto: string): string; stdcall;
Function ChecaTF( checa: Boolean ): String;
Function ChecaFT( checa: String  ): Boolean;
function FNUMD(Objeto: TMaskEdit; Texto, VKey: String; Espaco, Decimal: Integer): String;

function ReturnSixMonth(Actual:TDateTime):Semestre;
function NameMonth(Mes:Word;Abrev:Boolean):string;
function DataExtenso(Data:TDateTime): string;
function DataValida(StrD: string): boolean;
function PrimeiroDiaUtil(Data:TDateTime):TDateTime;
function IsWeekEnd(dData : TDateTime) : boolean;
function Mascara(edt: String;str:String):string;
procedure PorcentagemChange(edPorce: TMaskEdit);
Function FormataNum( cNum: String ): Double;
function StrZero(Num, Size: Integer): String;
function StrZeroF(Num: Double; Size: Integer): String;
Procedure Auditor(cMod,cAcao, cObs: String);
function isCNPJ(CNPJ: string): boolean;
procedure PegarColor();
function Mascarax(edt: String;str:String):string;
function ChkTabCid(edNomCid: String; edUf:String):integer;
function ChkEndRede(texto: string): string; stdcall;
Function CriaDir(const NomeSubDir, nmCamBanco,nmTipos: string; lSplash: Boolean): boolean;
procedure Variaveis;
procedure LeIni(Modu: String);
Function fIIF( pCond:Boolean; pTrue, pFalse:Variant ): Variant;
Function ChkRede(cDadosdb: string):String;
function TestaCpfCgc(Dado: string): String;
function TestaCGC(Dado : string) : boolean;
function TestaCPF(Dado : string) : boolean;
function ChkCaixa(Caixa : string) : boolean;
function PgDadosBanco(Caixa,Campo: String): String;
function PgSaldo(Abertura, Caixa: String; nMd:Integer): Double;
function SelSchema(nmTabela: string ): String;
function Schema(nmTabela: string ): String;
function Criptografar(wStri: String): String;
function ChkVar(Tab, Cmp, tipo: String ): Boolean;
Function SalvaSql(aEdits : array of TComponent; Tab,Pre:String; nNew: Integer; ECT1,ECT2,cWhere:String ): string;
function RmCharValor(texto: string): string; stdcall;
function RmCharKm(texto: string): string; stdcall;
procedure LtsKeyEdit(Key: Char; edMoeda: TMaskEdit);
function SelSchemaNome(nmTabela: string ): String;
Function IniMoeda(cValor: String): String;
Function Permissao(Nivel, tabela : String): Boolean;
function LoadImage(AImage: TImage; ABlobField: TBlobField): Boolean;
Function VersaoExe: String;
function RmCharLitros(texto: string; Dec: Integer): Double; stdcall;
function RmCharPorcent(texto: string; Dec: Integer): Double; stdcall;
procedure PCTKeyEdit(Key: Char; edMoeda: TMaskEdit);
Procedure AbrirForm(frm: TForm );
procedure Comprimir(ArquivoCompacto: TFileName; Arquivos: array of TFileName);
procedure Descomprimir(ArquivoZip: TFileName; DiretorioDestino: string);
Function StrBool(logic: Boolean): String;
Function FechaSubFrm(cTan: String): Boolean;
procedure Diretrizes;
function CPFCGC( CPFCNPJ: TMaskEdit; cTab : string) : boolean;
Function ValidaUsu(cCod,cSen: String): Boolean;
procedure IniTransacao;
procedure FimTransacao;
procedure RollBack;
function RetMoeda(sStringFloat : string) : double;
Function RetNumero(c: String): String;
procedure QtdKeyC2(Key: Char; edMoeda: TMaskEdit);
function GetVersion: string;
function Pegavlrporcento(valor, porc: Double ): Double;
function masc_cnpj_cpf(num: string):string ;
function GraCharLitro(texto: string): string; stdcall;
function PgTanque(cCod: String): String;
function pgEstoqueComb(codtnq: Integer ): Double;
function ChkCmbVeiculo(codtcmb, placa: string): Boolean;
function ChkKmVeiculo(Kmatua, placa: string): Boolean;
function ChkBombaAberta(CodBmb: string): Boolean;
function ChkLtsVeiculo(Litros, placa: string): Boolean;
function PegaIncerrante(CodBmb: string): String;
function PgFormaPgAtu: String;
function PgQtdPrcFatura(Cod: string): Integer;
function PgCodCgo(Cargo: string): String;
function ChkStiEstoque(bomba, litros: string): Boolean;
function ChkCmbPonto(codcmb, codpab, qtd: string; data : TDate): Boolean;
function GeraSenha: string ;
function chkemail(const Value: string):Boolean;
function PgLocalPne(Cod: string): string;
procedure QtdKeyEdit(Key: Char; edMoeda: TMaskEdit);
procedure QtdMaskEdit(Key: Char; edMoeda: TMaskEdit);
procedure QtdMaskEdit2(Key: Char; edMoeda: TMaskEdit);
function pgMarcaFogo: string;
function RemoveAcentos(Texto: String): String;
Function PneuInstal(cComp, cPlc:String; qDel1: TFdQuery):Integer;
function PneuLocalizador(Texto: String; lCarroc: Boolean): String;
function BuscaPneuInstalado(Local, Placa:String; lCarroc: Boolean ): Boolean;
function BuscaMarcaFogo(local, Plc: string; lCarroc: Boolean ): string;
procedure ChkHora( Sender: TObject );
procedure ChkPeso( Sender: TObject; var Key: Char );
procedure ChkLitros( Sender: TObject; var Key: Char );
procedure ChkQtd( Sender: TObject; var Key: Char );
procedure ChkQtd2( Sender: TObject; var Key: Char );
function ValidaRodizio(Local, Placa:String; lCarroc: Boolean ): Boolean;
function Rem_(texto: string): string; stdcall;
procedure KeyKm( Sender: TObject; var Key: Char );
procedure KeyValor( Sender: TObject; var Key: Char );
procedure KeyPercent( Sender: TObject; var Key: Char );
function killtask(ExeFileName: string): Integer;
Function Explode(Texto, Separador : String) : TStrings;
function ExtractText(aText, OpenTag, CloseTag : String) : String;
Function ChkCNPJ(CNPJ, cTab, cCampo: String): Boolean;
Procedure Verificacnpj(Sender: TObject; nome, Fantasia, Endereco, Numero, Complemento, Bairro, Cidade, UF: TEdit; CEP: TMaskEdit ; codcid :TButtonedEdit   );
procedure verificacep( Sender : TObject; Ende, Comp, Bair, Cida, Uf : TEdit ; codcid : TButtonedEdit     );
function chktipoveiculo( qDel1 : TFdQuery ): Boolean;
Procedure CabReports( oReport : TfrxReport; cTitulo, cArq : string );
Function ChkInternet(Sender: TObject): boolean;
function Soma_masc( edvlrpec, edvlrdes, edqtdpec : TMaskEdit ) : String;
Function Calc_perc( Sender: TObject; edbase, edValor, edPercento : TMaskEdit; Simbolo :string ): String;
Function CmpNulo(tabela: String; campo: TButtonedEdit): Boolean;
function BmpToJpg(cImage: String): Boolean;
Function pegahora: string;
procedure ChkDuplicidade( Sender: TObject );
function MD5File(const fileName : string) : string;
Function MD5(const texto:string):string;
Function FormataNumInt( cNum: String ): Integer;
procedure SelecNameEmpresa(cEmpresa : String );
function TipoCampo(cTab, cCmp : String ): String;
procedure DupliCod( Sender: TObject );
implementation


uses  U_ClasseUtil, U_CnpjClass, u_aguarde,
   U_ClassConecte, uSistema, U_dmEmp, U_CriaBanco;
//**************************************************************/
procedure DupliCod( Sender: TObject );
Var
  qSql : TFDQuery;
  cSql1, cSql2, cTbl, cCmp, cSch : String ;
Begin
  qSql := TFDQuery.Create(Nil);
  qSql.Connection :=  dmEmp.SqlConSis ;

  cCmp  := TEdit(Sender).Name ;
  cSql1 :=  ' SELECT table_schema, TABLE_NAME, COLUMN_NAME, udt_name, character_maximum_length, '
           +' character_octet_length, numeric_precision, numeric_precision_radix, numeric_scale, '
           +' ordinal_position FROM information_schema.columns '
           +' WHERE COLUMN_NAME = '+QuotedStr( cCmp );

  qSql.Close;
  qSql.SQL.Text   :=  cSql1 ;
  qSql.Open;

  cTbl  := qSql.FieldByName('TABLE_NAME').Text;
  cSch  := qSql.FieldByName('table_schema').Text;

  cSql1 :=  ' SELECT * FROM '+U_funcao.SelSchema(cTbl)
            +' WHERE '+cCmp+' = '+QuotedStr( TEdit(Sender).Text );

  qSql.Close;
  qSql.SQL.Text   :=  cSql1 ;
  qSql.Open;
  if qSql.IsEmpty then begin
     qSql.Close;
     FreeAndNil(qSql);
     ShowMessage('Codigo já Existente');
     TEdit(Sender).SetFocus ;
     exit;
  End;
  FreeAndNil(qSql);

End;


procedure SelecNameEmpresa(cEmpresa : String );
Var
  qSql : TFDQuery;
  TCon : TConecte;
Begin
  TCon := TConecte.GetInstance;
  qSql := TFDQuery.Create(Nil);
  qSql.Connection :=  dmEmp.SqlConSis ;
  qSql.SQL.Text   := ' select * from "dbconfig".empresa where emp_fantasia = '+QuotedStr( cEmpresa );
  qSql.Open;
  if ( Not qSql.IsEmpty ) then begin
      nmSchemaEmp         := '"'+qSql.FieldByName('emp_dtbase').Text+'"' ;
      nmSchemaEmp_        := qSql.FieldByName('emp_dtbase').Text ;
      adm_codemp          := qSql.FieldByName('emp_codemp').asInteger ;
      u_funcao.BancoAtual := qSql.FieldByName('emp_fantasia').Text ;

      // Guarda Ultima empresa usada pelo Usuarioi
      qSql.close ;
      qSql.SQL.Text   := ' update "dbconfig".usuario set usu_database = '+QuotedStr( cEmpresa )+' where usu_codusu = '+ IntToStr( adm_codusu );
      qSql.ExecSQL;

      TCon.SchemaEMP(dmEmp.SqlConSis);
  end else Begin
      ShowMessage(' Não foi possivel Conectar a esta empresa '+#13+'Contate o Administrador');
      Application.Terminate ;
  End;
  FreeAndNil(qSql);


End;

function TipoCampo(cTab, cCmp : String ): String;
Var
  qSql : TFDQuery;
  cSql : String ;
Begin
  cSql :=  ' SELECT TABLE_NAME, COLUMN_NAME, udt_name, character_maximum_length, character_octet_length, numeric_precision, numeric_precision_radix, numeric_scale, ordinal_position FROM information_schema.columns '
          +' WHERE table_schema = '+ QuotedStr( SelSchemaNome( LowerCase( cTab ) ) )
          +' AND table_name  = '+QuotedStr( LowerCase( cTab ) )
          +' AND COLUMN_NAME = '+QuotedStr( cCmp );

  qSql := TFDQuery.Create(Nil);
  qSql.Connection :=  dmEmp.SqlConSis ;
  qSql.SQL.Text   :=  cSql ;
  qSql.Open;

  if Not qSql.IsEmpty then begin
     Result := qSql.FieldByName('udt_name').Text
  end else Begin
     Result := 'varchar'
  End;
  FreeAndNil(qSql);

End;



procedure ChkDuplicidade( Sender: TObject );
Var
cNmDataBase: String;
Empresa: TfrmCnpj;
SQLQuery1 : TFdQuery;
cTab, cPrf, cNcmp: String;
indice    : integer;
t: TDateTime;
cTipo, cCmp,  cValue : string;
Componente: TComponent;
begin
  case AnsiIndexStr( Sender.ClassName, ['TEdit','TButtonedEdit'] ) of
     0 : cTipo := ' COLUMN_NAME  = '+QuotedStr( TEdit( Sender ).Name ) ;
     1 : cTipo := ' COLUMN_NAME  = '+QuotedStr( TButtonedEdit( Sender ).Name ) ;
  end;

  case AnsiIndexStr( Sender.ClassName, ['TEdit','TButtonedEdit'] ) of
     0 : cValue := QuotedStr( TEdit( Sender ).Text ) ;
     1 : cValue := QuotedStr( TButtonedEdit( Sender ).Text ) ;
  end;



 // Veriica se ja Existe o CNPJ na tabela
  SQLQuery1 := TFdQuery.Create(Nil);
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
                          +' WHERE '+cTipo+' AND TABLE_SCHEMA = '+QuotedStr( nmSchemaEmp_ );
  SQLQuery1.open;
  if Not SQLQuery1.Eof then begin
         cTab     :=  SQLQuery1.FieldByName('TABELA').Value  ;
         cCmp     :=  SQLQuery1.FieldByName('COLUNA').Value  ;
         cPrf     :=  Copy(TMaskEdit( Sender ).Name,1,4);
         SQLQuery1.Close;
         SQLQuery1.Sql.Text  := 'Select * FROM '+U_funcao.SelSchema(cTab)+' WHERE '+cCmp+' = '+ cValue ;
         SQLQuery1.open;
         if ( Not SQLQuery1.Eof )  then begin
            ShowMessage(' ERRO: Duplicidade de campo '+UpperCase( SQLQuery1.FieldByName(cCmp).value) );
            case AnsiIndexStr( Sender.ClassName, ['TEdit','TButtonedEdit'] ) of
               0 : ( Sender as TEdit).SetFocus ;
               1 : ( Sender as TButtonedEdit).SetFocus ;
            end;
            Exit;

         end;
  end;
  FreeAndNil(SQLQuery1);

end;

Function pegahora: string;
var
  Hora, Min, Sec, MSec : Word;
begin
  DecodeTime(Now, Hora, Min, Sec, MSec);
  Result := FormatDateTime('hhmm',Now);
end;

function BmpToJpg(cImage: String): Boolean;
var
  MyJPEG: TJPEGImage;
  MyBMP : TBitmap;
begin
  Result := False;
  if fileExists(cImage + '.bmp') then
  begin
    MyBMP := TBitmap.Create;
    with MyBMP do
      try
        LoadFromFile(cImage + '.bmp');
        MyJPEG := TJPEGImage.Create;
        with MyJPEG do
        begin
          Assign(MyBMP);
          //"Descomente" e ajuste as linhas abaixo para compactar a imagem, o que
          //poderá perder qualidade mas ajudará a diminuir o tamanho do arquivo
          //CompressionQuality := 75; //min. 1 - max. 100
          //Compress;
          SaveToFile(cImage + '.jpeg');
          Free;
          Result := True;
        end;
      finally
        Free;
      end;
  end;
  //   BmpToJpg('C:\ImagemTeste');
end;




Procedure CabReports( oReport : TfrxReport; cTitulo, cArq : string );
Begin
  oReport.LoadFromFile(GetCurrentDir +'\reports\'+cArq);
  oReport.Variables['CAB01']  := QuotedStr( UpperCase(U_funcao.nmSistema));
  oReport.Variables['CAB02']  := QuotedStr( UpperCase(FPrincipal.Caption));
  oReport.Variables['CAB03']  := QuotedStr( cTitulo );
  oReport.Variables['CAB05']  := QuotedStr( nmUsuario ) ;
End;

Function ChkInternet(Sender: TObject): boolean;
var
  Flags : Cardinal;
 begin
      if not InternetGetConnectedState(@Flags, 0) then begin
        ShowMessage('Sem conexão com a Internet');
        Result := False;
      End else Begin
        Result := True;
      end;

end;

procedure verificacep( Sender : TObject; Ende, Comp, Bair, Cida, Uf : TEdit ; codcid : TButtonedEdit   );
var
Cep : TClasseUtil;
begin
  if Not checaFT( cfgAtcep) then
     exit;

  // Verificar a internet
  if Not ChkInternet(Sender) then begin
     TButtonedEdit(Sender).SetFocus;
     exit
  end;

  // Funcão para pegar o CEP - Derivadda da Classe UTIL
 with Taguarde.ShowWaitForm('') do
     try
        Cep := TClasseUtil.Create;
        if Cep.ChkCep(TButtonedEdit(Sender).Text, codcid) then Begin
            if Not Cep.EndCep.IsEmpty then begin
                Ende.Text := Cep.EndCep;
                Bair.Text := Cep.BaiCep;
                Comp.Text := Cep.ComCep;
                Cida.Text := Cep.CidCep;
                Uf.Text   := Cep.UfCep ;
            end;
        End;

    finally
      AllowClose;
      Free;
    end;

end;

Procedure Verificacnpj(Sender: TObject; nome, Fantasia, Endereco, Numero, Complemento, Bairro, Cidade, UF: TEdit; CEP: TMaskEdit; codcid :TButtonedEdit );
Var
  cNmDataBase: String;
  Empresa: TfrmCnpj;
  SQLQuery1 : TFdQuery;
  cTab, cPrf, cNcmp: String;
  indice    : integer;
begin

 If Not ChecaFt( cfgATcnpj ) then
    Exit;

 // Verificar a internet
 if Not ChkInternet(Sender) then begin
    TButtonedEdit(Sender).SetFocus;
    exit
 end;

 // Veriica se ja Existe o CNPJ na tabela
  SQLQuery1 := TFdQuery.Create(Nil);
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
                          +' WHERE COLUMN_NAME  = '+QuotedStr( TMaskEdit( Sender ).Name )
                          +' AND TABLE_SCHEMA = '+QuotedStr( nmSchemaEmp_ );
  SQLQuery1.open;
  if Not SQLQuery1.Eof then begin
         cTab     :=  SQLQuery1.FieldByName('TABELA').Value  ;
         cPrf     :=  Copy(TMaskEdit( Sender ).Name,1,4);
         cNcmp    :=  cPrf+'nome';
         SQLQuery1.Close;
         SQLQuery1.Sql.Text  := 'Select * FROM '+U_funcao.SelSchema(cTab)+' WHERE '+TMaskEdit( Sender ).Name+' = '+QuotedStr( TMaskEdit( Sender ).Text );
         SQLQuery1.open;
         if Not SQLQuery1.Eof then begin
            ShowMessage(' CNPJ ja cadastrado '+UpperCase( SQLQuery1.FieldByName(cNcmp).value) );
            TMaskEdit( Sender ).SetFocus;
            Exit;
         end;
  end;


 with Taguarde.ShowWaitForm('') do
    try

          Empresa:= TfrmCnpj.Create;
            if  ( TMaskEdit(Sender).Text <> '99999999999999') and (ChkCNPJ(TMaskEdit(Sender).Text,cTab ,TMaskEdit(Sender).Name  )) then Begin
              iF isCNPJ(TMaskEdit(Sender).Text) then Begin

                  If Empresa.PagaCnpj(TMaskEdit(Sender).Text)  then Begin
                      //Tipo.Text:= Empresa.Tipo;
                      if Empresa.Abertura <> '' then
                         //dtAbertura.Date := StrToDate(Empresa.Abertura);

                      nome.Text        := Copy( Empresa.RazaoSocial ,1,nome.MaxLength       );
                      if RemoveChar(Empresa.Fantasia) = '' then Begin
                        Fantasia.Text  := Copy( Empresa.RazaoSocial ,1,Fantasia.MaxLength   );
                      End Else Begin
                          Fantasia.Text:= Copy( Empresa.Fantasia    ,1,Fantasia.MaxLength   );
                      End;
                      Endereco.Text    := Copy( Empresa.Endereco    ,1,Endereco.MaxLength   );
                      Numero.Text      := Copy( Empresa.Numero      ,1,Numero.MaxLength     );
                      Complemento.Text := Copy( Empresa.Complemento ,1,Complemento.MaxLength);
                      CEP.Text         := RemoveChar(Empresa.CEP);
                      Bairro.Text      := Copy( Empresa.Bairro      ,1,Bairro.MaxLength     );
                      Cidade.Text      := Empresa.Cidade;
                      UF.Text          := Empresa.UF;


                      if codcid.Text = '' then
                         codcid.Text := IntToStr( ChkTabCid( Cidade.Text, UF.Text ) );

                      nome.SetFocus;
                  End Else
                      TMaskEdit(Sender).setfocus;
              End Else Begin
                 ShowMessage('Erro de CNPJ'  );
                 TMaskEdit(Sender).SetFocus ;
              End;
            End Else Begin
              if  (TMaskEdit(Sender).Text <> '99999999999999') Then Begin
                  TMaskEdit(Sender).SetFocus ;
              End Else Begin
                  // Passa
                  Endereco.Text:= '';
                  Numero.Text:= '';
                  //CEP.Text:= '00000000';
                  Cidade.Text:= '';
                  UF.Text:= '';
                  {
                  if codcid.Text = '' then
                     codcid.Text := IntToStr( ChkTabCid( Cidade.Text, UF.Text ) );
                   }
                  nome.SetFocus;
              End;
            End;

    finally
      AllowClose;
      Free;
    end;
    FreeAndNil(SQLQuery1)

end;
Function ChkCNPJ(CNPJ, cTab, cCampo: String): Boolean;
Var
SQLQuery1 : TFdQuery;
Begin
  SQLQuery1 := TFdQuery.Create(Nil);
  SQLQuery1.Close;
  SQLQuery1.Connection:= dmEmp.SqlConSis;
  SQLQuery1.Sql.Text  :='Select * FROM '+U_funcao.SelSchema(cTab)+' WHERE '+cCampo+' = :cpfcnpj';
  SQLQuery1.ParamByName('cpfcnpj').Text  :=  CNPJ ;
  SQLQuery1.open;
//  dmSistema.SQLQuery1.FieldByName('Nome').ToString
  if ( Not SQLQuery1.Eof ) and (Not CNPJ.IsEmpty)then Begin
     ShowMessage('Já existe um registro com esse CNPJ');
     Result := False;
  End Else begin
     Result := True ;
  End;
  FreeAndNil(SQLQuery1)
End;


function ExtractText(aText, OpenTag, CloseTag : String) : String;
{ Retorna o texto dentro de 2 tags (open & close Tag's) }
var
  iAux, kAux : Integer;
begin
  Result := '';

  if (Pos(CloseTag, aText) <> 0) and (Pos(OpenTag, aText) <> 0) then
  begin
    iAux := Pos(OpenTag, aText) + Length(OpenTag);
    kAux := Pos(CloseTag, aText);
    Result := Copy(aText, iAux, kAux-iAux);
  end;
end;

Function Explode(Texto, Separador : String) : TStrings;
var
    strItem       : String;
    ListaAuxUTILS : TStrings;
    NumCaracteres,
    TamanhoSeparador,
    I : Integer;
Begin
    ListaAuxUTILS    := TStringList.Create;
    strItem          := '';
    NumCaracteres    := Length(Texto);
    TamanhoSeparador := Length(Separador);
    I                := 1;
    While I <= NumCaracteres Do
      Begin
        If (Copy(Texto,I,TamanhoSeparador) = Separador) or (I = NumCaracteres) Then
          Begin
            if (I = NumCaracteres) then strItem := strItem + Texto[I];
            ListaAuxUTILS.Add(trim(strItem));
            strItem := '';
            I := I + (TamanhoSeparador-1);
          end
        Else
            strItem := strItem + Texto[I];

        I := I + 1;
      End;
    Explode := ListaAuxUTILS;
end;

function killtask(ExeFileName: string): Integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) = UpperCase(ExeFileName))) then
      Result := Integer(TerminateProcess(
                        OpenProcess(PROCESS_TERMINATE,
                                    BOOL(0),
                                    FProcessEntry32.th32ProcessID),
                                    0));
     ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

procedure KeyValor( Sender: TObject; var Key: Char );
Var
  cKey: String;
begin
  cKey:=Key;
  MoedaKeyEdit( Key, TMaskEdit( Sender ) );
  Key := #0 ;
end;



procedure KeyPercent( Sender: TObject; var Key: Char );
Var
  cKey: String;
begin
  cKey:=Key;
  PorcentoKeyEdit( Key, TMaskEdit( Sender ) );
  Key := #0 ;
end;


procedure KeyKm( Sender: TObject; var Key: Char );
Var
  cKey: String;
begin
  cKey:=Key;
  KmKeyEdit( Key, TMaskEdit( Sender ) );
  Key := #0 ;
end;

procedure ChkPeso( Sender: TObject; var Key: Char );
Var
  cKey: String;
begin
  cKey:=Key;
  QtdKeyEdit( Key, TMaskEdit( Sender ) );
  Key := #0 ;
end;

procedure ChkLitros( Sender: TObject; var Key: Char );
Var
  cKey: String;
begin
  cKey:=Key;
  TanqKeyEdit( Key, TMaskEdit( Sender ) );
  Key := #0 ;
end;

procedure ChkQtd( Sender: TObject; var Key: Char );
Var
  cKey: String;
begin
  cKey:=Key;
  QtdMaskEdit( Key, TMaskEdit( Sender ) );
  Key := #0 ;
end;
procedure ChkQtd2( Sender: TObject; var Key: Char );
Var
  cKey: String;
begin
  cKey:=Key;
  QtdMaskEdit2( Key, TMaskEdit( Sender ) );
  Key := #0 ;
end;



procedure ChkHora( Sender: TObject );
Var
t: TDateTime;
cHora : string;
begin

  if ( TMaskEdit(Sender).Text = '' ) and TMaskEdit(Sender).Focused then
     Exit;

    TMaskEdit(Sender).Text := strzero(StrToInt(TMaskEdit(Sender).Text),4);
    cHora := Copy(TMaskEdit(Sender).Text,1,2)+':'+Copy(TMaskEdit(Sender).Text,3,2)+':00';

    if not TryStrtoTime( cHora, t) then begin
      showmessage('Hora invaçida '+cHora);
      TMaskEdit(Sender).SetFocus ;
      exit
    end;
    TMaskEdit(Sender).EditMask := '!90:00;0;_';
    TMaskEdit(Sender).Alignment := taCenter;
    //TMaskEdit(Sender).Text     :=  ;
end;

function Soma_masc( edvlrpec, edvlrdes, edqtdpec : TMaskEdit ) : String;
Var
  nRes: Double;
  i, nImg: Integer;
  Qtd, cLoc : String;
  qDel, qSql1 : TFdQuery;
begin
    nRes    := ( ( FormataNum( edvlrpec.Text ) - FormataNum( edvlrdes.Text ) ) * FormataNum( edqtdpec.Text ) ) ;
    Result  := FormatCurr('R$ ###,###,##0.00', nRes )
end;

Function Calc_perc( Sender: TObject; edbase, edValor, edPercento : TMaskEdit; Simbolo :string ): String;
Var
  nRes: Double;
  i, nImg: Integer;
  Qtd, cLoc : String;
  qDel, qSql1 : TFdQuery;
begin
    if Simbolo = '$' then begin
       nRes    := ( ( FormataNum( edbase.Text ) / 100 ) * FormataNum( edPercento.Text ) ) ;
       Result  := FormatCurr('R$ ###,##0.00', nRes )
    end Else begin
       nRes    := ( ( ( ( FormataNum( edbase.Text ) + FormataNum( edValor.Text ) ) -  FormataNum( edbase.Text ) ) / FormataNum( edbase.Text ) ) * 100 ) ;
       Result  := FormatCurr('##0.00%', nRes )
    end;



end;


function BuscaPneuInstalado(Local, Placa:String; lCarroc: Boolean ): Boolean;
Var
  i, nImg: Integer;
  Qtd, cLoc : String;
  qDel, qSql1 : TFdQuery;
begin

    cLoc := PneuLocalizador(Local, lCarroc);

    // Gerando a Movimentação do Estoque
    qDel := TFdQuery.Create(Nil);
    qDel.Connection  := dmEmp.SqlConSis;
    qDel.Close;
    qDel.SQl.Text   :='select * from '+U_funcao.SelSchema('pneuive')
                     +' where piv_codplc = '+QuotedStr(Placa)+' and  piv_locpne = '+QuotedStr(cLoc)+' and piv_status = '+QuotedStr('INSTALADO')+' ';
    qDel.Open;
    Result := qDel.Eof ;
    FreeAndNil(qDel)
end;

function ValidaRodizio(Local, Placa:String; lCarroc: Boolean ): Boolean;
Var
  i, nImg: Integer;
  Qtd, cLoc : String;
  qDel, qSql1 : TFdQuery;
begin

    cLoc := PneuLocalizador(Local, lCarroc);

    // Gerando a Movimentação do Estoque
    qDel := TFdQuery.Create(Nil);
    qDel.Connection  := dmEmp.SqlConSis;
    qDel.Close;
    qDel.SQl.Text   :='select * from '+U_funcao.SelSchema('pneuive')
                     +' left join '+U_funcao.SelSchema('veiculoatv')+' on vat_placa = piv_codplc '
                     +' where piv_codplc = '+QuotedStr(Placa)+' and  piv_locpne = '+QuotedStr(cLoc)+' and piv_status = '+QuotedStr('INSTALADO')+' ';
    qDel.Open;
    If  qDel.FieldByName('vat_kmatu').AsFloat >= qDel.FieldByName('piv_kmrodi').AsFloat  then begin
        Result := True ;
    end else
        Result := False ;

    FreeAndNil(qDel)
end;

function chktipoveiculo( qDel1 : TFdQuery ): Boolean;
Var
  I: Integer;
  lSair : Boolean;
begin
  I := -1;
  I := AnsiIndexText(LowerCase( qDel1.FieldByName('tip_tipo').Text ), aTipoVeic);
  Result :=  ( ( LowerCase( qDel1.FieldByName('tip_tipo').Text ) <>  aTipoVeic[I] ) and
               ( LowerCase( qDel1.FieldByName('tip_trac').Text ) <> 'normal'      ) )

end;


function PneuLocalizador(Texto: String; lCarroc: Boolean): String;
Var
cLoc: String ;
begin
  {
   Ideia de posicionamento dos pneus

  B 1 D E D
  | | | | |____ Direita ou Esquerda
  | | | |______ Interno / Meio / externo
  | | |________ Dianteiro ou Trazeiro / Step
  | |__________ Eixo
  |____________ Boleia ou carroceria

   Ex:

   pEsqInt01

  }
    if Pos('step',texto) > 0  then begin
      cLoc :='S';
      cLoc :=cLoc+' ';
      cLoc :=cLoc+copy(Texto,6,1);
      cLoc :=cLoc+' ';
      cLoc :=cLoc+' ';
    end Else Begin
      cLoc :=' ';
      cLoc :=cLoc+copy(Texto,9,1);
      cLoc :=cLoc+fiif( copy(Texto,9,1) = '1','D','T' );
      cLoc :=cLoc+fiif( lCarroc, copy(Texto,5,1),' ' );
      cLoc :=cLoc+copy(Texto,2,1);
    End;

    Result := UpperCase(cLoc);

end;
Function PneuInstal(cComp, cPlc:String; qDel1: TFdQuery): Integer;
Var
  i, nImg: Integer;
  Qtd, cLoc, cVd : String;
  qDel, qSql1 : TFdQuery;
  lCarroc : Boolean;
begin
    cLoc    := '';
    I       := -1;
    I       := AnsiIndexText(LowerCase( qDel1.FieldByName('tip_tipo').Text ), aTipoVeic);
    lCarroc := False;
    if Pos('step',cComp)=0 then
       lCarroc := ( ( LowerCase( qDel1.FieldByName('tip_trac').Text ) <> 'normal'  ) and ( StrToInt( copy(cComp,9,1) ) > 1 ) );

    cLoc := PneuLocalizador(cComp, lCarroc);

    // Gerando a Movimentação do Estoque
    qDel := TFdQuery.Create(Nil);
    qDel.Connection  := dmEmp.SqlConSis;
    qDel.Close;
    qDel.SQl.Text   :='select * from '+U_funcao.SelSchema('pneuive')
                     +' left join '+U_funcao.SelSchema('veiculoatv')+' on vat_placa = piv_codplc '
                     +' where piv_codplc = '+QuotedStr(cPlc)
                     +' and  piv_locpne = '+QuotedStr(cLoc)
                     +' and piv_status = '+QuotedStr('INSTALADO')+' ';
    qDel.Open;
    if Not qDel.eof then begin

        cVd := Trim( qDel.FieldByName('piv_nrvida').Text );
        if ( qDel.FieldByName('piv_kmrodi').AsFloat  < qDel.FieldByName('vat_kmatu').AsFloat ) and
           ( Pos('step',cComp) = 0 ) then begin
            Result := 3;
        end else
        if ( qDel.FieldByName('piv_kmvda'+cVd).AsFloat  < qDel.FieldByName('vat_kmatu').AsFloat ) and
           ( Pos('step',cComp) = 0 ) then begin
            Result := 4;
        end Else Begin
            Result := fiif(qDel.Eof,0,2);
        End;
    End Else begin
        Result := 0;
    end;
    FreeAndNil(qDel)
end;


function RemoveAcentos(Texto: String): String;
Const ComAcento = 'àâêôûãõáéíóúçüÀÂÊÔÛÃÕÁÉÍÓÚÇÜ';
 SemAcento = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
var iFor : Integer;
begin
   for iFor := 1 to Length(Texto) do begin
      if Pos(Texto[iFor],ComAcento) <> 0 then begin
         Texto[iFor] := SemAcento[Pos(Texto[iFor],ComAcento)];
      end;
   end;
   Result := Texto;
end;

function pgMarcaFogo: string;
const
 C=10;
var
  I, A, P : Integer;
  Num: Integer;
  qDel : TFdQuery;
  lOk :Boolean;
begin
  lOk               := True;
  qDel              := TFdQuery.Create(Nil);
  qDel.Connection   := dmEmp.SqlConSis;

  while lOk do begin
      randomize;
      num := Round(random(999999)); // 99999 é o limite do numero randomico

      qDel.Close;
      qDel.SQl.Text     :='Select * From '+U_funcao.SelSchema('pneuive')+' WHERE piv_mfogo = :mfogo ';
      qDel.ParamByName('mfogo').Text     := IntToStr(Num);
      qDel.Open;

      if qDel.Eof then begin
         Result := IntToStr(Num) ;
         lOk := False;
      end;

  end;
    FreeAndNil(qDel)
End;


function BuscaMarcaFogo(local, Plc: string; lCarroc: Boolean ): string;
var
  qDel : TFdQuery;
  lOk :Boolean;
begin

  local := PneuLocalizador(local, lCarroc);
  qDel              := TFdQuery.Create(Nil);
  qDel.Connection   := dmEmp.SqlConSis;
  qDel.Close;
  qDel.SQl.Text   :='select * from '+U_funcao.SelSchema('pneuive')
                  +' where piv_codplc = '+QuotedStr(Plc)+' and  piv_locpne = '+QuotedStr(local)+' and piv_status = '+QuotedStr('INSTALADO')+' ';
  qDel.Open;
  Result := qDel.FieldByName('piv_mfogo').Text ;
  FreeAndNil(qDel)

End;


function PgLocalPne(Cod: string): string;
Var
i: integer;
cResult, cCod: String;
begin
{
 Ideia de posicionamento dos pneus

B 1 D E D
| | | | |____ Direita ou Esquerda
| | | |______ Interno / Meio / externo
| | |________ Dianteiro ou Trazeiro / Step
| |__________ Eixo
|____________ Boleia ou carroceria

}

if Not Cod.IsEmpty then begin

    case Cod[1] of
    'C' : cResult := 'CARROCERIA';
    'B' : cResult := 'BOLEIA';
    'S' : cResult := 'STEP' ;
    end;

    if Cod[2] <> ' ' then begin
       cResult := cResult +' EX '+Cod[2];
    end else begin
       cResult := cResult +' '+Cod[3];
    end;

    case Cod[3] of
    'D' : cResult := cResult +' DIANT';
    'T' : cResult := cResult +' TRAS';
    ' ' : cResult := cResult ;
    end;

    case Cod[4] of
    'I' : cResult := cResult +' INTER';
    'M' : cResult := cResult +' MEIO' ;
    'E' : cResult := cResult +' EXTER' ;
    ' ' : cResult := cResult ;
    end;

    case Cod[5] of
    'E' : cResult := cResult +' ESQ';
    'D' : cResult := cResult +' DIR';
    end;

end Else begin
    cResult := '-'
end;

Result := cResult

end;

function GeraSenha: string ;
var
  i, aQuant: integer;
const
  str = '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
begin
  aQuant := 6;
  for i:= 1 to aQuant do begin
    Randomize;
    Result := Result + str[Random(Length(str))+1];
  end ;
end;

function ChkCmbPonto(codcmb, codpab, qtd: string; data : TDate ): Boolean;
Var
  qDel: TFdQuery;
  lRes :Boolean;
begin
   qDel             := TFdQuery.Create(Nil);
   qDel.Connection  := dmEmp.SqlConSis;
   qDel.Close;
   qDel.SQl.Text    :='Select * From '+U_funcao.SelSchema('pontoabti')+' WHERE iab_codpab = :codpab and iab_codcmb = :codcmb ';
   qDel.ParamByName('codcmb').Text  := codcmb;
   qDel.ParamByName('codpab').Text  := codpab;
   qDel.Open;
   if qDel.Eof then begin
      ShowMessage('O Combustível não confere com o contrato do deste ponto');
      Result  := ( qDel.Eof );
      exit
   end;

   qDel.Connection  := dmEmp.SqlConSis;
   qDel.Close;
   qDel.SQl.Text    :='Select * From '+U_funcao.SelSchema('pontoabti')
           +' where iab_codpab = :codpab '
           +'    and iab_codcmb = :codcmb '
           +'    and iab_datini >= :datas '
           +'    and iab_datfin <= :datas ';

   qDel.ParamByName('codcmb').Text  := codcmb;
   qDel.ParamByName('codpab').Text  := codpab;
   qDel.ParamByName('datas').asdate := data;
   qDel.Open;
   if qDel.Eof then begin
      ShowMessage('O Contrato de Empenho esta vencido para este combustivel');
      Result  := ( qDel.Eof );
      exit
   end;

   qDel.Connection  := dmEmp.SqlConSis;
   qDel.Close;
   qDel.SQl.Text    :='Select * From '+U_funcao.SelSchema('pontoabti')
           +' where iab_codpab = :codpab '
           +'    and iab_codcmb = :codcmb '
           +'    and ( iab_qltmin - iab_qltest ) >= :qtdade ';

   qDel.ParamByName('codcmb').Text    := codcmb;
   qDel.ParamByName('codpab').Text    := codpab;
   qDel.ParamByName('qtdade').asfloat := formatanum(qtd);
   qDel.Open;
   if qDel.Eof then begin
      ShowMessage('Limite esgotado de combustivel do empenho');
      Result  := ( qDel.Eof );
      exit
   end;
   FreeAndNil(qDel)
end;


function ChkStiEstoque(bomba, litros: string): Boolean;
Var
  qDel: TFdQuery;
begin
   qDel             := TFdQuery.Create(Nil);
   qDel.Connection  := dmEmp.SqlConSis;
   qDel.Close;
   qDel.SQl.Text    :='Select * From '+U_funcao.SelSchema('bomba')+
                      ' left join '+U_funcao.SelSchema('tanque')+' on tnq_codigo = bmb_codtnq   '+
                      ' WHERE bmb_codigo = :bomba ';
   qDel.ParamByName('bomba').Text    := bomba;
   qDel.Open;

   if qDel.Eof then begin
      Showmessage('Ponto de Abastecimento não configurado estoque');
      Result           := True;
      end Else
   if qDel.FieldByName('tnq_ltsetq').AsFloat < formatanum(litros) then begin
      Showmessage('Não há estoque para este abastecimento: Estoque atual '+qDel.FieldByName('tnq_ltsetq').Text);
      Result           := False;
      end Else
   if qDel.FieldByName('tnq_ltsetq').AsFloat < qDel.FieldByName('tnq_ltsmin').AsFloat then begin
      Showmessage('o estoque está abaixo do minimo: Estoque atual '+qDel.FieldByName('tnq_ltsetq').Text);
      Result           := True;
   end else begin
      Result           := True;
   end;
    FreeAndNil(qDel)
end;


function PgCodCgo(Cargo: string): String;
Var
  qDel: TFdQuery;
begin
   qDel             := TFdQuery.Create(Nil);
   qDel.Connection  := dmEmp.SqlConSis;
   qDel.Close;
   qDel.SQl.Text    :='Select * From '+U_funcao.SelSchema('cargo')+' WHERE lower( cgo_nome ) LIKE lower('+QuotedStr('%'+Cargo+'%')+') ';
   qDel.Open;
   Result           := qDel.FieldByName('cgo_codigo').Text;
    FreeAndNil(qDel)
end;

function ChkLtsVeiculo(Litros, placa: string): Boolean;
Var
  qDel: TFdQuery;
begin
   qDel             := TFdQuery.Create(Nil);
   qDel.Connection  := dmEmp.SqlConSis;
   qDel.Close;
   qDel.SQl.Text    :='Select * From '+U_funcao.SelSchema('veiculoatv')
                     +' WHERE vat_placa = :placa and (vat_tanque1+vat_tanque2+vat_tanque3) >= :Litros ';
   qDel.ParamByName('placa').Text     := placa;
   qDel.ParamByName('Litros').AsFloat  := formatanum(Litros);
   qDel.Open;
   Result           := ( Not qDel.Eof );
    FreeAndNil(qDel)
end;


function PgQtdPrcFatura(Cod: string): Integer;
Var
  qDel: TFdQuery;
begin
   qDel             := TFdQuery.Create(Nil);
   qDel.Connection  := dmEmp.SqlConSis;
   qDel.Close;
   qDel.SQl.Text    :='Select Count(*)+1 as Prc From '+U_funcao.SelSchema('compracbmf')+' WHERE ccf_codcpc = :ccf_codcpc ';
   qDel.ParamByName('ccf_codcpc').asinteger     := StrToInt( Cod );
   qDel.Open;
   Result          := qDel.FieldByName('Prc').AsInteger;
   FreeAndNil(qDel)
end;

function PgFormaPgAtu: String;
Var
  qDel: TFdQuery;
begin
   qDel             := TFdQuery.Create(Nil);
   qDel.Connection  := dmEmp.SqlConSis;
   qDel.Close;
   qDel.SQl.Text    :='Select * From '+U_funcao.SelSchema('formapgm')+' order by fpg_codigo';
   qDel.Open;
   if qDel.Eof then begin
       ShowMessage('Não há Formas de Pagamento para alimentar');
       exit;
   end else
       Result           := qDel.FieldByName('fpg_codigo').Text;

   FreeAndNil(qDel)
end;


function PegaIncerrante(CodBmb: string): String;
Var
  qDel: TFdQuery;
begin
   qDel             := TFdQuery.Create(Nil);
   qDel.Connection  := dmEmp.SqlConSis;
   qDel.Close;
   qDel.SQl.Text    :='Select * From '+U_funcao.SelSchema('incerrante')+' WHERE ict_codbmb = :bomba and ict_datent is not null and ict_datsai is null ';
   qDel.ParamByName('bomba').Text     := CodBmb;
   qDel.Open;
   Result           := qDel.FieldByName('ict_codigo').Text;
   FreeAndNil(qDel)
end;


function ChkBombaAberta(CodBmb: string): Boolean;
Var
  qDel: TFdQuery;
begin
   qDel             := TFdQuery.Create(Nil);
   qDel.Connection  := dmEmp.SqlConSis;
   qDel.Close;
   qDel.SQl.Text    :='Select * From '+U_funcao.SelSchema('incerrante')+' WHERE ict_codbmb = :bomba and ict_datent is not null and ict_datsai is null ';
   qDel.ParamByName('bomba').Text     := CodBmb;
   qDel.Open;
   Result           := qDel.Eof;
   FreeAndNil(qDel)
end;


function ChkKmVeiculo(Kmatua, placa: string): Boolean;
Var
  qDel: TFdQuery;
begin
   qDel             := TFdQuery.Create(Nil);
   qDel.Connection  := dmEmp.SqlConSis;
   qDel.Close;
   qDel.SQl.Text    :='Select * From '+U_funcao.SelSchema('veiculoatv')+' WHERE vat_placa = :placa  ';
   qDel.ParamByName('placa').Text     := placa;
   qDel.Open;
   Result           := ( qDel.FieldByName('vat_kmatu').AsFloat > formatanum(Kmatua) );
   FreeAndNil(qDel)
end;

function ChkCmbVeiculo(codtcmb, placa: string): Boolean;
Var
  qDel: TFdQuery;
begin
   qDel             := TFdQuery.Create(Nil);
   qDel.Connection  := dmEmp.SqlConSis;
   qDel.Close;
   qDel.SQl.Text    :='Select * From '+U_funcao.SelSchema('combustatv')+' WHERE cat_placa = :placa and cat_codcmb = :codcmb ';
   qDel.ParamByName('codcmb').Text    := codtcmb;
   qDel.ParamByName('placa').Text     := placa;
   qDel.Open;
   Result           := ( qDel.Eof );
   FreeAndNil(qDel)
end;

function pgEstoqueComb(codtnq: Integer): Double;
Var
  qDel: TFdQuery;
begin
   qDel             := TFdQuery.Create(Nil);
   qDel.Connection  := dmEmp.SqlConSis;
   qDel.Close;
   qDel.SQl.Text    :='Select * From '+U_funcao.SelSchema('tanque')+' WHERE tnq_codigo = :codtnq ';
   qDel.ParamByName('codtnq').AsInteger    := codtnq;
   qDel.Open;
   Result           := qDel.FieldByName('tnq_ltsetq').AsFloat;
   FreeAndNil(qDel)
end;

function PgTanque(cCod: String): String;
Var
  qDel: TFdQuery;
begin
      qDel              := TFdQuery.Create(Nil);
      // Gerando Estoque
      qDel.Connection  := dmEmp.SqlConSis;
      qDel.Close;
      qDel.SQl.Text    :='Select * From '+U_funcao.SelSchema('bomba')+' WHERE bmb_codigo = :codbmb ';
      qDel.ParamByName('codbmb').Text       := cCod;
      qDel.Open;
      Result := qDel.FieldByName('bmb_codtnq').Text;
      FreeAndNil(qDel)

end;


function masc_cnpj_cpf(num: string):string;
Var
   FormatarCNPJ, FormatarCPF, cNum:String;

begin
   if Length(num) <> 0 then begin
     if Length(num) = 14 then Begin
        FormatarCNPJ:= Copy(num, 1,2)
        + '.' + Copy(num, 3,3)
        +'.' + Copy(num, 6,3)
        + '/' +Copy(num, 9,4)
        + '-' + Copy(num, 13,2);
        Result  := FormatarCNPJ;
      End Else
      if Length(num) = 11 then Begin
         FormatarCPF:= Copy(num, 1,3)
          + '.' + Copy(num, 4,3)
          + '.' + Copy(num,7,3)
          + '-' + Copy(num, 10,2);
          Result  := FormatarCPF;

       End
   end;

end;



function Pegavlrporcento(valor, porc: Double ): Double;
var
percentual: double;
Begin
  percentual :=  ( porc / 100.0 );
  Result := (valor * percentual );

End;

function RetMoeda(sStringFloat : string) : double;
var
  dReturn : double;

begin
  sStringFloat := stringReplace(sStringFloat, 'R', '', [rfIgnoreCase, rfReplaceAll]);
  sStringFloat := stringReplace(sStringFloat, '%', '', [rfIgnoreCase, rfReplaceAll]);
  sStringFloat := stringReplace(sStringFloat, '$', '', [rfIgnoreCase, rfReplaceAll]);
  sStringFloat := stringReplace(sStringFloat, ' ', '', [rfIgnoreCase, rfReplaceAll]);
  sStringFloat := stringReplace(sStringFloat, '.', '', [rfIgnoreCase, rfReplaceAll]);
  try
    dReturn := strToFloat(sStringFloat);
  except
    dReturn := 0;
  end;
  result := dReturn;

end;
{*************************************************************************
 Função de Transicao
**************************************************************************}
procedure IniTransacao;
Var
  qIniTrans : TFdQuery;
Begin
    // Inicia Transação no Banco do Sistema
    qIniTrans := TFdQuery.Create(Nil);
    qIniTrans.Connection := dmEmp.SqlConSis;
    qIniTrans.SQL.Add('BEGIN TRANSACTION;');
    qIniTrans.ExecSQL;
    FreeAndNil(qIniTrans)

End;

procedure FimTransacao;
Var
  qIniTrans : TFdQuery;
Begin
    // Inicia Transação no Banco do Sistema
    qIniTrans := TFdQuery.Create(Nil);
    qIniTrans.Connection := dmEmp.SqlConSis;
    qIniTrans.SQL.Add('COMMIT;');
    qIniTrans.ExecSQL;
    FreeAndNil(qIniTrans)

End;
procedure RollBack;
Var
  qIniTrans : TFdQuery;
Begin
    // Inicia Transação no Banco do Sistema
    qIniTrans := TFdQuery.Create(Nil);
    qIniTrans.Connection := dmEmp.SqlConSis;
    qIniTrans.SQL.Add('ROLLBACK;');
    qIniTrans.ExecSQL;
    FreeAndNil(qIniTrans)

End;

{*************************************************************************
 Função que peha a conexão
**************************************************************************}
Function ValidaUsu(cCod,cSen: String): Boolean;
Var
qSql : TFdQuery;
cQuery : String ;
Begin
  cQuery := ' Where usu_codusu = '+cCod;
  cQuery := cQuery+' and usu_senha = '+QuotedStr(Trim( Criptografar(cSen) ));

  qSql := TFdQuery.Create(Nil);
  qSql.Connection := dmEmp.SqlConSis;
  qSql.SQL.Text   := 'Select * From "dbconfig".usuario '+cQuery ;
  qSql.Open; ;
  Result := (Not qSql.IsEmpty) ;
  FreeAndNil(qSql)

End;

function CPFCGC( CPFCNPJ: TMaskEdit; cTab : string) : boolean;
Var
qSql : TFdQuery;
cLegend : String;
Begin
  if Length( Trim( CPFCNPJ.text ) ) = 11 then
     cLegend := 'CPF';

  if Length( Trim( CPFCNPJ.text ) ) = 14 then
     cLegend := 'CNPJ';


  qSql := TFdQuery.Create(Nil);
  qSql.Connection := dmEmp.SqlConSis;
  qSql.sql.text   := 'Select * From '+U_funcao.SelSchema(cTab)+' where '+CPFCNPJ.name+' = '+QuotedStr(CPFCNPJ.text);
  qSql.Open;
  if Not qSql.IsEmpty then Begin
     ShowMessage(' Já existe um registro com este '+cLegend+' Registrado');
     Result := False;
     Exit;
  End;




  if Length( Trim( CPFCNPJ.text ) ) = 11 then Begin
     Result := TestaCPF(CPFCNPJ.text)
  End Else
  if Length( Trim( CPFCNPJ.text ) ) = 14 then Begin
     Result := TestaCGC(CPFCNPJ.text)
  End Else Begin
     ShowMessage('CPF/CNPJ Invalido');
     Result := False;
  End;

  FreeAndNil(qSql)
End;
procedure Diretrizes;
Var
 SQLQ          :TFdQuery ;
Begin
    SQLQ := TFdQuery.Create(Nil);
    with SQLQ do  begin
         Close;
         Connection:= dmEmp.SqlConSis;
         SQL.Text:=' Select * from "dbconfig".configura ';
         Open;
       end;
    if Not SQLQ.Eof then Begin
       {
       ChkCPF     := SQLQ.FieldByName('cfg_mntimpr').AsBoolean;
       ChkTotPar  := SQLQ.FieldByName('cfg_totpar').Text;
       cendtablic := SQLQ.FieldByName('cfg_endtablic').Text;
       }
      cfgCODIGO      := SQLQ.FieldByName('cfg_codigo').AsInteger ;
      cfgEMPRESA     := SQLQ.FieldByName('cfg_empresa').Text ;
      cfgFANTASIA    := SQLQ.FieldByName('cfg_fantasia').Text ;
      cfgCNPJ        := SQLQ.FieldByName('cfg_cnpj').Text ;
      cfgENDERECO    := SQLQ.FieldByName('cfg_endereco').Text ;
      cfgNUMERO      := SQLQ.FieldByName('cfg_numero').Text ;
      cfgCOMPLE      := SQLQ.FieldByName('cfg_comple').Text ;
      cfgBAIRRO      := SQLQ.FieldByName('cfg_bairro').Text ;
      cfgCODCID      := SQLQ.FieldByName('cfg_codcid').AsInteger ;
      cfgTELEF1      := SQLQ.FieldByName('cfg_telef1').Text ;
      cfgTELEF2      := SQLQ.FieldByName('cfg_telef2').Text ;
      cfgCEP         := SQLQ.FieldByName('cfg_cep').Text ;
      cfgSITE        := SQLQ.FieldByName('cfg_site').Text ;
      cfgEMAIL       := SQLQ.FieldByName('cfg_email').Text ;
      cfgCONEXAO     := SQLQ.FieldByName('cfg_conexao').Text ;
      cfgUSUCON      := SQLQ.FieldByName('cfg_usucon').Text ;
      cfgSENCON      := SQLQ.FieldByName('cfg_sencon').Text ;
      cfgPORTACON    := SQLQ.FieldByName('cfg_portacon').Text ;
      cfgHOSTCON     := SQLQ.FieldByName('cfg_hostcon').Text ;
      cfgAUTENTICON  := SQLQ.FieldByName('cfg_autenticon').Text ;
      cfgSEGURICON   := SQLQ.FieldByName('cfg_seguricon').Text ;
      cfgTSL         := SQLQ.FieldByName('cfg_tsl').Text ;
      cfgMETODO      := SQLQ.FieldByName('cfg_metodo').Text ;
      cfgOFCTRANSF   := SQLQ.FieldByName('cfg_ofctransf').Text ;
      cfgQTDPRC      := SQLQ.FieldByName('cfg_qtdprc').Text ;
      cfgNEW         := SQLQ.FieldByName('cfg_new').Text ;
      cfgENDTABLIC   := SQLQ.FieldByName('cfg_endtablic').Text ;
      cfgDATEXE      := SQLQ.FieldByName('cfg_datexe').AsDateTime ;
      cfgHOREXE      := SQLQ.FieldByName('cfg_horexe').Text ;
      cfgUSUINC      := SQLQ.FieldByName('cfg_usuinc').Text ;
      cfgDATINC      := SQLQ.FieldByName('cfg_datinc').AsDateTime ;
      cfgMATCON      := SQLQ.FieldByName('cfg_matcon').Text ;
      cfgMENCON      := SQLQ.FieldByName('cfg_mencon').Text ;
      cfgMTRCON      := SQLQ.FieldByName('cfg_mtrcon').Text ;
      cfgMNTCNT      := SQLQ.FieldByName('cfg_mntcnt').Text ;
      cfgMNTIMPR     := SQLQ.FieldByName('cfg_mntimpr').Text ;
      cfgTOTPAR      := SQLQ.FieldByName('cfg_totpar').Text ;
      cfgATCPF       := SQLQ.FieldByName('cfg_atcpf').Text ;
      cfgATCNPJ      := SQLQ.FieldByName('cfg_atcnpj').Text ;
      cfgATCEP       := SQLQ.FieldByName('cfg_atcep').Text ;
      cfgKMVERI      := SQLQ.FieldByName('cfg_kmveri').AsFloat ;

    End;
    FreeAndNil(SQLQ)
End;


Function FechaSubFrm(cTan: String): Boolean;
Var
i: Integer;
Begin
   if Length(aListForm) <> 0 then Begin
      for i := 0 to Length(aListForm) do begin
        if LowerCase( aListForm[i] ) = LowerCase( cTan ) then begin
           Result := True;
           Exit;
        end;
      end;
   End;
   Result := False;

End;

Function Qlinha: PWChar;
Begin
  Result := PWChar('#13#10');
End;

procedure Comprimir(ArquivoCompacto: TFileName; Arquivos: array of TFileName);
var
  FileInName: TFileName;
  FileEntrada, FileSaida: TFileStream;
  Compressor: TCompressionStream;
  NumArq, I, Len, Size: Integer;
  Fim: Byte;
begin
  FileSaida := TFileStream.Create(ArquivoCompacto, fmCreate or fmShareExclusive);
  Compressor := TCompressionStream.Create(clMax, FileSaida);
  NumArq := Length(Arquivos);
  Compressor.Write(NumArq, SizeOf(Integer));
  try
    for I := Low(Arquivos) to High(Arquivos) do begin
      FileEntrada := TFileStream.Create(Arquivos[I], fmOpenRead and fmShareExclusive);
      try
        FileInName := ExtractFileName(Arquivos[I]);
        Len := Length(FileInName);
        Compressor.Write(Len, SizeOf(Integer));
        Compressor.Write(FileInName[1], Len);
        Size := FileEntrada.Size;
        Compressor.Write(Size, SizeOf(Integer));
        Compressor.CopyFrom(FileEntrada, FileEntrada.Size);
        Fim := 0;
        Compressor.Write(Fim, SizeOf(Byte));
      finally
        FileEntrada.Free;
      end;
    end;
  finally
    FreeAndNil(Compressor);
    FreeAndNil(FileSaida);
  end;
end;

procedure Descomprimir(ArquivoZip: TFileName; DiretorioDestino: string);
var
  NomeSaida: string;
  FileEntrada, FileOut: TFileStream;
  Descompressor: TDecompressionStream;
  NumArq, I, Len, Size: Integer;
  Fim: Byte;
begin
  FileEntrada := TFileStream.Create(ArquivoZip, fmOpenRead and fmShareExclusive);
  Descompressor := TDecompressionStream.Create(FileEntrada);
  Descompressor.Read(NumArq, SizeOf(Integer));
  try
    I := 0;
    while I < NumArq do begin
      Descompressor.Read(Len, SizeOf(Integer));
      SetLength(NomeSaida, Len);
      Descompressor.Read(NomeSaida[1], Len);
      Descompressor.Read(Size, SizeOf(Integer));
      FileOut := TFileStream.Create(
        IncludeTrailingBackslash(DiretorioDestino) + NomeSaida,
        fmCreate or fmShareExclusive);
      try
        FileOut.CopyFrom(Descompressor, Size);
      finally
        FileOut.Free;
      end;
      Descompressor.Read(Fim, SizeOf(Byte));
      Inc(I);
    end;
  finally
    FreeAndNil(Descompressor);
    FreeAndNil(FileEntrada);
  end;
{
Um exemplo de uso, seria:
var
  //vetor para guardar os nomes dos arquivos a ser compactados
  ListaArquivos: Array of TFileName;
begin
  //define o tamanho do vetor (qtde. de arquivos)
  SetLength(ListaArquivos, 2);
  //preenche a lista com os arquivos
  ListaArquivos[0] := 'C:\Windows\Bruma.bmp';
  ListaArquivos[1] := 'C:\Windows\Cafezinho.bmp';
  //executa a compactação, gerando o arquivo C:\Compactado.xxx
  Comprimir('C:\Compactado.xxx', ListaArquivos);
  //cria um diretório de teste para descompactarmos
  MkDir('C:\Descompactado');
  //executa a descompactação no diretório criado
  Descomprimir('C:\Compactado.xxx', 'C:\Descompactado');
end;
 }
end;

function LoadImage(AImage: TImage; ABlobField: TBlobField): Boolean;
var
  JpgImg: TJPEGImage;
  StMem: TMemoryStream;
begin
  if ABlobField.DataSet.IsEmpty then
  begin
    Result := False;
    Exit;
  end;

  AImage.Picture.Assign(nil);
  if not (ABlobField.IsNull) and not (ABlobField.AsString = '') then
  begin
    jpgImg := TJPEGImage.Create;
    stMem := TMemoryStream.Create;
    try
      ABlobField.SaveToStream(StMem);
      StMem.Position := 0;
      JpgImg.LoadFromStream(StMem);
      AImage.Picture.Assign(JpgImg);
    finally
      StMem.Free;
      JpgImg.Free;
    end;
  end;
  Result := True;
end;


Function Permissao(Nivel, tabela : String): Boolean;
Var
  SQLQ : TFdQuery ;
Begin
    SQLQ := TFdQuery.Create(Nil);
    with SQLQ do
       begin
         Close;
         Connection:= dmEmp.SqlConSis;
         SQL.Text:=' Select * from "dbconfig".permissao'+
                    ' where prm_formda    = '+QuotedStr(tabela)+
                    ' and   '+Nivel+' = '+QuotedStr('T');
          Open;
       end;

      if SQLQ.IsEmpty then
      Begin
          Result := False;
      End Else
          Result := True;

 FreeAndNil( SQLQ );
End;

Function IniMoeda(cValor: String): String;
begin
if cvalor.IsEmpty then
   cValor:='0';

Result := FormatCurr('R$ ###,###,##0.00',StrToFloat(cValor));
end;

function Criptografar(wStri: String): String;
var
Simbolos  : array [0..4] of String;
x         : Integer;
begin
Simbolos[1]:='ABCDEFGHIJLMNOPQRSTUVXZYWK ~!@#$%^&*()';
Simbolos[2]:= 'ÂÀ©Øû×ƒçêùÿ5Üø£úñÑªº¿®¬¼ëèïÙýÄÅÉæÆôöò»Á';
Simbolos[3]:= 'abcdefghijlmnopqrstuvxzywk1234567890';
Simbolos[4]:= 'áâäàåíóÇüé¾¶§÷ÎÏ-+ÌÓß¸°¨·¹³²Õµþîì¡«½';
for x := 1 to Length(Trim(wStri)) do begin
  if pos(copy(wStri,x,1),Simbolos[1])>0 then
    Result := Result+copy(Simbolos[2], pos(copy(wStri,x,1),Simbolos[1]),1)
  else if pos(copy(wStri,x,1),Simbolos[2])>0 then
    Result := Result+copy(Simbolos[1], pos(copy(wStri,x,1),Simbolos[2]),1)
  else if pos(copy(wStri,x,1),Simbolos[3])>0 then
    Result := Result+copy(Simbolos[4], pos(copy(wStri,x,1),Simbolos[3]),1)
  else if pos(copy(wStri,x,1),Simbolos[4])>0 then
    Result := Result+copy(Simbolos[3], pos(copy(wStri,x,1),Simbolos[4]),1);
  end;
end;


function PgSaldo(Abertura,Caixa: String; nMd:Integer): Double;
Var
  SQLQ : TFdQuery ;
Begin
    SQLQ := TFdQuery.Create(Nil);
    with SQLQ do
       begin
         Close;
         Connection:= dmEmp.SqlConSis;
         SQL.Text:=' Select mvc_salant, mvc_salatu' +
                      ' from  '+U_funcao.SelSchema('movcxa')+' ' +
                      ' Where mvc_Codabt = '+QuotedStr(Abertura)+'' +
                      '   and mvc_codmvc = (select Max(mvc_codmvc) from  '+U_funcao.SelSchema('movcxa')+' where mvc_codabt ='+QuotedStr(Abertura)+') ';
         Active := True;
         Open;
       end;
      if SQLQ.IsEmpty then Begin

          with SQLQ do
             begin
               Close;
               Connection:= dmEmp.SqlConSis;
               SQL.Text:=' Select mvc_salant, mvc_salatu' +
                            ' from '+U_funcao.SelSchema('movcxa')+'' +
                            ' Where mvc_Codcxa = '+QuotedStr(Caixa)+'' +
                            '   and mvc_codmvc = (select Max(mvc_codmvc) from  '+U_funcao.SelSchema('movcxa')+' where mvc_Codcxa ='+QuotedStr(Caixa)+') ';
               Active := True;
               Open;
             end;
              if SQLQ.IsEmpty then Begin
                Result := 0;
              End Else Begin
                  if nMd = 0 then Begin
                      Result := SQLQ.FieldByName('mvc_salatu').AsFloat;
                  End Else Begin
                      Result := SQLQ.FieldByName('mvc_salatu').AsFloat;
                  End;
              End;

      End Else Begin
        if nMd = 0 then Begin
            Result := SQLQ.FieldByName('mvc_salatu').AsFloat;
        End Else Begin
            Result := SQLQ.FieldByName('mvc_salatu').AsFloat;
        End;

      End;
 FreeAndNil( SQLQ );

End;





function PgDadosBanco(Caixa, Campo : string) : String;
Var
  SQLQ : TFdQuery ;
Begin
    SQLQ := TFdQuery.Create(Nil);
    with SQLQ do
       begin
         Close;
         Connection:= dmEmp.SqlConSis;
         SQL.Text:=' Select cct_'+campo+' as '+campo+' from '+U_funcao.SelSchema('Ccorrente')+' Where cct_CodCxa = '+QuotedStr(Caixa)+' ';
         Active := True;
         Open;
       end;
      if SQLQ.IsEmpty then Begin
         ShowMessage('Banco não Encontrado');
         Result := '';
      End Else Begin
         Result := SQLQ.FieldByName(campo).Text;

      End;

 FreeAndNil( SQLQ );
End;



function ChkCaixa(Caixa : string) : boolean;
Var
  SQLQ : TFdQuery ;
Begin
    SQLQ := TFdQuery.Create(Nil);
    with SQLQ do
       begin
         Close;
         Connection:= dmEmp.SqlConSis;
         SQL.Text:=' Select * from '+U_funcao.SelSchema('Ccorrente')+' Where cct_CodCxa = '+QuotedStr(Caixa)+' ';
         Active := True;
         Open;
       end;
      if SQLQ.IsEmpty then Begin
         ShowMessage('Este caixa não dispõe de conta registrada');
         Result := False;
      End Else Begin
         Result := True;

      End;

 FreeAndNil( SQLQ );
End;




Function ChkRede(cDadosdb: string):String;
Var
cRetorno : String;
Begin
  if Copy(Host,1,13) = '127.0.0.1' then begin
     cRetorno := '\\'+host+'\'+CamIni2+cDadosdb;// + NomeSubDir;

  end else
     cRetorno := host+':'+CamIni2+cDadosdb;// + NomeSubDir;

result :=  cRetorno;
End;

function Mascara(edt: String;str:String):string;

var

i : integer;

begin

        for i := 1 to Length(edt) do

        begin
                if (str[i] = '9') and not (edt[i] in ['0'..'9']) and (Length(edt)=Length(str)+1) then
                    delete(edt,i,1);

                if (str[i] <> '9') and (edt[i] in ['0'..'9']) then

                insert(str[i],edt, i);

        end;

        result := edt;

end;
{*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
*  FUNÇÃO VALIDAR CNPJ
*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=}
function isCNPJ(CNPJ: string): boolean;
var   dig13, dig14: string;
    sm, i, r, peso: integer;
begin
// length - retorna o tamanho da string do CNPJ (CNPJ é um número formado por 14 dígitos)
  if ((CNPJ = '00000000000000') or (CNPJ = '11111111111111') or
      (CNPJ = '22222222222222') or (CNPJ = '33333333333333') or
      (CNPJ = '44444444444444') or (CNPJ = '55555555555555') or
      (CNPJ = '66666666666666') or (CNPJ = '77777777777777') or
      (CNPJ = '88888888888888') or
      (length(CNPJ) <> 14))
     then begin
            isCNPJ := false;
            exit;
          end;

// "try" - protege o código para eventuais erros de conversão de tipo através da função "StrToInt"
  try
{ *-- Cálculo do 1o. Digito Verificador --* }
    sm := 0;
    peso := 2;
    for i := 12 downto 1 do
    begin
// StrToInt converte o i-ésimo caractere do CNPJ em um número
      sm := sm + (StrToInt(CNPJ[i]) * peso);
      peso := peso + 1;
      if (peso = 10)
         then peso := 2;
    end;
    r := sm mod 11;
    if ((r = 0) or (r = 1))
       then dig13 := '0'
    else str((11-r):1, dig13); // converte um número no respectivo caractere numérico

{ *-- Cálculo do 2o. Digito Verificador --* }
    sm := 0;
    peso := 2;
    for i := 13 downto 1 do
    begin
      sm := sm + (StrToInt(CNPJ[i]) * peso);
      peso := peso + 1;
      if (peso = 10)
         then peso := 2;
    end;
    r := sm mod 11;
    if ((r = 0) or (r = 1))
       then dig14 := '0'
    else str((11-r):1, dig14);

{ Verifica se os digitos calculados conferem com os digitos informados. }
    if ((dig13 = CNPJ[13]) and (dig14 = CNPJ[14]))
       then isCNPJ := true
    else isCNPJ := false;
  except
    isCNPJ := false
  end;
end;






{*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
*  FUNÇÃO GRAVA AUDITOR
*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=}
Procedure Auditor(cMod,cAcao,cObs: String);
var
Estq, QtdU: Double;
cUsu, cHora, cHorAlt,cCodSql, cIteSql,cValSql : string ;
dData, dDatAlt : TDate ;
vlrv: Double;
i, tmp: Integer;
SQL2: TFdQuery;
begin
  SQL2:= TFdQuery.Create(nIL);
  cUsu    :=  nmUsuario;
  dData   :=  date ;
  cHora   :=  TimeToStr(time);

  // Grava auditor
  cCodSql:= 'Insert Into "dbconfig".auditor ( '+
                    ' adt_usuario,  adt_modulo,   adt_acao, adt_obs, adt_dtacao,   adt_HrAcao, adt_dtbase, adt_codusu, adt_codemp '+
                    ' ) values ( '+
                    ' :usuario,  :modulo,  :acao, :obs, :dtacao,  :HrAcao, :dtbase, :codusu, :codemp )';
  SQL2.Close;
  SQL2.Connection := dmEmp.SqlConSis;
  SQL2.SQL.Text := cCodSql ;
  SQL2.ParamByName('usuario').Text    :=  sysUsuario ;
  SQL2.ParamByName('modulo').Text     :=  cMod ;
  SQL2.ParamByName('acao').Text       :=  cAcao ;
  SQL2.ParamByName('obs').Text        :=  cObs ;
  SQL2.ParamByName('dtacao').AsDate   :=  now ;
  SQL2.ParamByName('HrAcao').Text     :=  cHora ;
  SQL2.ParamByName('dtbase').Text     :=  nmSchemaEmp_  ;
  SQL2.ParamByName('codusu').AsInteger:=  adm_codusu    ;
  SQL2.ParamByName('codemp').AsInteger:=  adm_codemp    ;

  SQL2.ExecSQL;
  FreeAndNil( SQL2 );
end;





function FNUMD(Objeto: TMaskEdit; Texto, VKey: String; Espaco, Decimal: Integer): String;
Var
vChar, vDiv : String;
I : Integer;
begin
   vDiv := '1';
   For I := 1 to Decimal do
     vDiv := vDiv + '0';

   vChar := copy(Texto,1,length(Texto));

   if (vchar = '') or (vchar = '0') then
      vchar := vkey
   else
      vchar := vchar + vkey;

   While ( pos( ',', vChar ) > 0 ) or ( pos( '.', vChar ) > 0 ) do
     begin
     Delete( vChar, pos( '.', vChar ), 1 );
     Delete( vChar, pos( ',', vChar ), 1 );
     end;
   Objeto.MaxLength := Espaco;
   Objeto.Text      := Format('%*.*n',[Espaco,Decimal,StrToFloat(vchar)/StrToInt(vDiv)]);
   Objeto.SelStart  := length(Objeto.text);
end;

{*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
*  FUNÇÃO FUnção para trazer T - True e F-False
*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=}
Function FormataNum( cNum: String ): Double;
Var
  Num: Double;
  x: Integer;
  cR: String;

begin

if cNum <> ''  then Begin

    cNum := RemoveChar(cNum);
    for x := 1 to Length(cNum) do Begin
         If cNum[x] = '.' then begin
            cR := cR + ','
         end else Begin
            cR :=  cR + cNum[x];
         End;
    End;
    Num  := StrToFloat( cR );

End Else begin
  Num:= 0 ;
end;
result := Num;
end;

{*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
*  FUNÇÃO FUnção para trazer T - True e F-False
*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=}
Function FormataNumInt( cNum: String ): Integer;
Var
 Num, x: Integer;
 cR: String;
begin

if ( Trim( cNum ) <> '' ) then Begin
    cNum := RemoveChar(cNum);
    for x := 1 to Length(cNum) do Begin
         If cNum[x] = '.' then begin
            cR := cR + ''
         end else Begin
            cR :=  cR + cNum[x];
         End;
    End;
    Num  := StrToInt( cR );

End Else begin
  Num:= 0 ;
end;
result := Num;
end;

{*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
*  FUNÇÃO FUnção para trazer T - True e F-False
*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=}
Function ChecaTF( checa: Boolean ): String;
begin
  if checa then
    result := 'T'
  else
    result := 'F'
end;
{*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
*  FUNÇÃO FUnção para trazer T - True e F-False
*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=}
Function ChecaFT( checa: String  ): Boolean;
begin
  if UpperCase( checa ) = 'T' then
    result := True
  else
    result := False;
end;


{*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
*  FUNÇÃO Tirar Caracteres
*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=}
function RemoveChar(texto: string): string; stdcall;
{Função que serve para nao aceitar caracteres especiais tipo !@#$%^&*()}
const
  _Remove = 'LtCmQTDqtdRKg:;.,`!@#$%^&*()_+=|\<>?/æ-';
var
  x: Integer;
  cR: String;
begin
  if Length(texto) = 0 then
    Begin
      result := '0';
       Exit;
    End;

  for x := 1 to Length(texto) do Begin
    if Pos(texto[x], _Remove) <> 0 then Begin
       If texto[x] = ',' then begin
          cR := cR + '.'
       end;

    End else Begin
      cR :=  cR + texto[x];
    End;
  End;
  result := cR;

end;

{*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
*  FUNÇÃO Tirar Caracteres
*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=}
Procedure AbrirForm(frm: TForm);
var
  Tfrm                : TForm       ;
begin
Tfrm := Tfrm;

{

        if (Form_Usuario = nil) then
        begin
        Form_Usuario := TForm_Usuario.Create(Self);
        Form_Usuario.Show;
        end
        else
        begin
        Form_Usuario.WindowState := WsNormal;
        Form_Usuario.BringToFront;
        Form_Usuario.Focused;
        end;
                          }
        frm := Tfrm.Create(Application);
        frm.FormStyle  := fsNormal ;
        frm.Visible    := False;

        frm.Show;
end;



{*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
*  FUNÇÃO Tirar Caracteres
*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=}
function RmCharValor(texto: string): string; stdcall;
{Função que serve para nao aceitar caracteres especiais tipo !@#$%^&*()}
const
  _Remove = 'LtKmgQTDqtdR:;.,`!@#$%^&*()_+=|\<>?/æ-';
var
  x: Integer;
begin
  if Length(texto) = 0 then
    Begin
      result := '0';
    End
    Else Begin
      result := '';
    End;

  for x := 1 to Length(texto) do
  if Pos(texto[x], _Remove) <> 0 then Begin
     If texto[x] = ',' then begin
        result := result + '.'
     end;
  End else
    result := result + texto[x];

end;

{*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
*  FUNÇÃO Tirar Caracteres
*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=}
function GraCharLitro(texto: string): string; stdcall;
{Função que serve para nao aceitar caracteres especiais tipo !@#$%^&*()}
const
  _Remove = 'LtKmQTDqtdR:;.,`!@#$%^&*()_+=|\<>?/æ-';
var
  x, y: Integer;
begin
  y := ( Length(Trim( texto))-4 );
  if Length(texto) = 0 then
    Begin
      result := '0';
    End
    Else Begin
      result := '';
    End;

  for x := 1 to Length(texto) do
  if ( Pos(texto[x], _Remove) <> 0 ) and
     ( x < y ) then Begin
     If texto[x] = ',' then begin
        result := result + '.'
     end;
  End else
    result := result + Trim( texto[x] );
end;

{*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
*  FUNÇÃO Tirar Caracteres
*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=}
function RmCharLitros(texto: string; Dec: Integer): Double; stdcall;
{Função que serve para nao aceitar caracteres especiais tipo !@#$%^&*()}
const
  _Remove = 'LKmQTDqtdR:;,.`!@#$%^&*()_+=|\<>?/æ-';
var
  x, nZ: Integer;
  cResult : String;
begin

  nZ := Length(texto);
  if Length(texto) = 0 then
    Begin
      result := 0;
    End;

  for x := 1 to Length(texto) do begin
      if Pos(texto[x], _Remove) <> 0 then Begin
         If ( texto[x] = '.' ) and ((Dec+1) = nZ ) then begin
            cResult := cResult + ','
         end;

      End else Begin
        cResult := cResult + texto[x];
      End;
      nZ := ( nZ - 1 )
  end;
  Result := StrToFloat( cResult )
end;

{*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
*  FUNÇÃO Tirar Caracteres
*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=}
function RmCharPorcent(texto: string; Dec: Integer): Double; stdcall;
{Função que serve para nao aceitar caracteres especiais tipo !@#$%^&*()}
const
  _Remove = 'KmQTDqtdR:;,.`!@#$%^&*()_+=|\<>?/æ-';
var
  x, nZ: Integer;
  cResult : String;
begin

  nZ := Length(texto);
  if Length(texto) = 0 then
    Begin
      result := 0;
    End;

  for x := 1 to Length(texto) do begin
      if Pos(texto[x], _Remove) <> 0 then Begin
         If ( texto[x] = '.' ) and ((Dec+1) = nZ ) then begin
            cResult := cResult + ','
         end;

      End else Begin
        cResult := cResult + texto[x];
      End;
      nZ := ( nZ - 1 )
  end;
  Result := StrToFloat( cResult )
end;

{*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
*  FUNÇÃO Tirar do Km
*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=}
function RmCharKM(texto: string): string; stdcall;
{Função que serve para nao aceitar caracteres especiais tipo !@#$%^&*()}
const
  _Remove = 'KmgQTDqtdRLt:;.,`!@#$%^&*()_+=|\<>?/æ-';
var
  x: Integer;
begin
  if Length(texto) = 0 then
    Begin
      result := '0';
    End
    Else Begin
      result := '';
    End;

  for x := 1 to Length(texto) do
      if Pos(texto[x], _Remove)=0 then Begin
        result := result + texto[x];
      End;
end;


{*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
*  FUNÇÃO Formatação de Moeda
*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=}
procedure MoedaChange(edMoeda: TMaskEdit);
var
   s : string;
   v : Double;
   I : integer;
begin
   //1º Passo : se o edit estiver vazio, nada pode ser feito.
   If (edMoeda.Text = emptystr) then
      edMoeda.Text := 'R$ 0.00;0;';

   //2º Passo : obter o texto do edit, SEM a virgula e SEM o ponto decimal:
   s := '';
   for I := 1 to length(edMoeda.Text) do Begin
       if (edMoeda.text[I] in ['0'..'9']) and (edMoeda.text[I] <>'') then  Begin
          s := s + edMoeda.text[I];
       End;
   End;

   //3º Passo : fazer com que o conteúdo do edit apresente 2 casas decimais:
   v := strtofloat(s);
   v := ( v / 1 ); // para criar 2 casa decimais

   //4º Passo : Formata o valor de (V) para aceitar valores do tipo 0,10.
   edMoeda.text := FormatFloat('R$ ###,##0.00;0;',  v );
   edMoeda.SelStart := 0;
end;
{*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
*  FUNÇÃO Formatação de Moeda
*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=}
procedure QtdChange(edMoeda: TMaskEdit);
var
   s : string;
   v : double;
   I : integer;
begin
   //1º Passo : se o edit estiver vazio, nada pode ser feito.
   If (edMoeda.Text = emptystr) then
      edMoeda.Text := ' #,##0;0;';

   //2º Passo : obter o texto do edit, SEM a virgula e SEM o ponto decimal:
   s := '';
   for I := 1 to length(edMoeda.Text) do
   if (edMoeda.text[I] in ['0'..'9']) then
      s := s + edMoeda.text[I];

   //3º Passo : fazer com que o conteúdo do edit apresente 2 casas decimais:
   v := strtofloat(s);
   v := (v /100); // para criar 2 casa decimais

   //4º Passo : Formata o valor de (V) para aceitar valores do tipo 0,10.
   edMoeda.text := FormatFloat(' #,###,###,##0;0;',v);
   edMoeda.SelStart := 0;
end;

{*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
*  FUNÇÃO Formatação de Moeda
*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=}
procedure PorcentagemChange(edPorce: TMaskEdit);
var
   s : string;
   v : double;
   I : integer;
begin
   //1º Passo : se o edit estiver vazio, nada pode ser feito.
   If (edPorce.Text = emptystr) then
      edPorce.Text := '0.00%;0;';

   //2º Passo : obter o texto do edit, SEM a virgula e SEM o ponto decimal:
   s := '';
   for I := 1 to length(edPorce.Text) do
   if (edPorce.text[I] in ['0'..'9']) then
      s := s + edPorce.text[I];

   //3º Passo : fazer com que o conteúdo do edit apresente 2 casas decimais:
   v := strtofloat(s);
   v := (v /100); // para criar 2 casa decimais

   //4º Passo : Formata o valor de (V) para aceitar valores do tipo 0,10.
   edPorce.text := FormatFloat('##0.00%;0;',v);
   edPorce.SelStart := 0;
end;

procedure MoedaKeyEdit(Key: Char; edMoeda: TMaskEdit);
var
   Texto, Texto2: string;
   i: byte;
   cCanvas : TControlCanvas;
begin

   cCanvas := TControlCanvas.Create;
   TControlCanvas(cCanvas).Control := Application.MainForm;

   if (Key in ['0'..'9',chr(vk_back)]) then
   begin
      // limito a 23 caracteres senão haverá um erro na função StrToInt64()
      if (key in ['0'..'9']) and (Length(Trim(edMoeda.Text))>23) then
         key := #0;

      // pego somente os caracteres de 0 a 9, ignorando a pontuação
      Texto2 := '0';
      Texto := Trim(edMoeda.Text)+Key;
      for i := 1 to Length(Texto) do
         if Texto[i] in ['0'..'9'] then
            Texto2 := Texto2 + Texto[i];

      // se foi pressionado BACKSPACE (única tecla válida, fora os números)
      // apago o último caractere da string
      if key = chr(vk_back) then
         Delete(Texto2,Length(Texto2),1);

      // formato o texto que depois será colocado no Edit
      Texto2 := FormatFloat('R$ ###,###,##0.00', StrToInt64(Texto2)/100);

      // preencho os espaços à esquerda, de modo a deixar o texto
      // alinhado à direita (gambiarra)
      {
      repeat
         Texto2 := ' '+Texto2;
      until  ccanvas.TextWidth(Texto2) >= edMoeda.Width;
      }

      // atribuo a string à propriedade Text do Edit

      edMoeda.Text := Texto2;

      // posiciono o cursor no fim do texto
      edMoeda.SelStart := Length(Texto2);
   end;

//   Key := #0;
end;

procedure MoedaKeyCEdit( Key: Char; edMoeda: TMaskEdit; Casa: Integer);
var
   Texto, Texto2: string;
   i: byte;
   cCanvas : TControlCanvas;
begin

   cCanvas := TControlCanvas.Create;
   TControlCanvas(cCanvas).Control := Application.MainForm;

   if (Key in ['0'..'9',chr(vk_back)]) then
   begin
      // limito a 23 caracteres senão haverá um erro na função StrToInt64()
      if (key in ['0'..'9']) and (Length(Trim(edMoeda.Text))>23) then
         key := #0;

      // pego somente os caracteres de 0 a 9, ignorando a pontuação
      Texto2 := '0';
      Texto := Trim(edMoeda.Text)+Key;
      for i := 1 to Length(Texto) do
         if Texto[i] in ['0'..'9'] then
            Texto2 := Texto2 + Texto[i];

      // se foi pressionado BACKSPACE (única tecla válida, fora os números)
      // apago o último caractere da string
      if key = chr(vk_back) then
         Delete(Texto2,Length(Texto2),1);

      // formato o texto que depois será colocado no Edit
      Texto2 := FormatFloat('R$ ###,###,##0.000', StrToInt64(Texto2)/1000);

      // preencho os espaços à esquerda, de modo a deixar o texto
      // alinhado à direita (gambiarra)
      {
      repeat
         Texto2 := ' '+Texto2;
      until  ccanvas.TextWidth(Texto2) >= edMoeda.Width;
      }

      // atribuo a string à propriedade Text do Edit

      edMoeda.Text := Texto2;

      // posiciono o cursor no fim do texto
      edMoeda.SelStart := Length(Texto2);
   end;
  FreeAndNil(cCanvas);
//   Key := #0;
end;


procedure PorcentoKeyEdit( Key: Char; edMoeda: TMaskEdit);
var
   Texto, Texto2: string;
   i: byte;
   cCanvas : TControlCanvas;
begin

   cCanvas := TControlCanvas.Create;
   TControlCanvas(cCanvas).Control := Application.MainForm;

   if (Key in ['0'..'9',chr(vk_back)]) then
   begin
      // limito a 23 caracteres senão haverá um erro na função StrToInt64()
      if (key in ['0'..'9']) and (Length(Trim(edMoeda.Text))>23) then
         key := #0;

      // pego somente os caracteres de 0 a 9, ignorando a pontuação
      Texto2 := '0';
      Texto := Trim(edMoeda.Text)+Key;
      for i := 1 to Length(Texto) do
         if Texto[i] in ['0'..'9'] then
            Texto2 := Texto2 + Texto[i];

      // se foi pressionado BACKSPACE (única tecla válida, fora os números)
      // apago o último caractere da string
      if key = chr(vk_back) then
         Delete(Texto2,Length(Texto2),1);

      // formato o texto que depois será colocado no Edit
      Texto2 := FormatFloat('##0.00%', StrToInt64(Texto2)/100);


      edMoeda.Text := Texto2;

      // posiciono o cursor no fim do texto
      edMoeda.SelStart := Length(Texto2);
   end;
  FreeAndNil(cCanvas);
//   Key := #0;
end;


procedure QtdKeyEdit(Key: Char; edMoeda: TMaskEdit);
var
   Texto, Texto2: string;
   i: byte;
   cCanvas : TControlCanvas;
begin

   cCanvas := TControlCanvas.Create;
   TControlCanvas(cCanvas).Control := Application.MainForm;

   if (Key in ['0'..'9',chr(vk_back)]) then
   begin
      // limito a 23 caracteres senão haverá um erro na função StrToInt64()
      if (key in ['0'..'9']) and (Length(Trim(edMoeda.Text))>23) then
         key := #0;

      // pego somente os caracteres de 0 a 9, ignorando a pontuação
      Texto2 := '0';
      Texto := Trim(edMoeda.Text)+Key;
      for i := 1 to Length(Texto) do
         if Texto[i] in ['0'..'9'] then
            Texto2 := Texto2 + Texto[i];

      // se foi pressionado BACKSPACE (única tecla válida, fora os números)
      // apago o último caractere da string
      if key = chr(vk_back) then
         Delete(Texto2,Length(Texto2),1);

      // formato o texto que depois será colocado no Edit
      Texto2 := FormatFloat('#,##0,000', StrToInt64(Texto2) );

      // preencho os espaços à esquerda, de modo a deixar o texto
      // alinhado à direita (gambiarra)
      {
      repeat
         Texto2 := ' '+Texto2;
      until  ccanvas.TextWidth(Texto2) >= edMoeda.Width;
      }

      // atribuo a string à propriedade Text do Edit

      edMoeda.Text := Texto2;

      // posiciono o cursor no fim do texto
      edMoeda.SelStart := Length(Texto2);
   end;
  FreeAndNil(cCanvas);
//   Key := #0;
end;

procedure QtdMaskEdit(Key: Char; edMoeda: TMaskEdit);
var
   Texto, Texto2: string;
   i: byte;
   cCanvas : TControlCanvas;
begin

   cCanvas := TControlCanvas.Create;
   TControlCanvas(cCanvas).Control := Application.MainForm;

   if (Key in ['0'..'9',chr(vk_back)]) then
   begin
      // limito a 23 caracteres senão haverá um erro na função StrToInt64()
      if (key in ['0'..'9']) and (Length(Trim(edMoeda.Text))>23) then
         key := #0;

      // pego somente os caracteres de 0 a 9, ignorando a pontuação
      Texto2 := '0';
      Texto := Trim(edMoeda.Text)+Key;
      for i := 1 to Length(Texto) do
         if Texto[i] in ['0'..'9'] then
            Texto2 := Texto2 + Texto[i];

      // se foi pressionado BACKSPACE (única tecla válida, fora os números)
      // apago o último caractere da string
      if key = chr(vk_back) then
         Delete(Texto2,Length(Texto2),1);

      // formato o texto que depois será colocado no Edit
      Texto2 := FormatFloat('#,##0.000', StrToInt64(Texto2)/1000 );

      // preencho os espaços à esquerda, de modo a deixar o texto
      // alinhado à direita (gambiarra)
      {
      repeat
         Texto2 := ' '+Texto2;
      until  ccanvas.TextWidth(Texto2) >= edMoeda.Width;
      }

      // atribuo a string à propriedade Text do Edit

      edMoeda.Text := Texto2;

      // posiciono o cursor no fim do texto
      edMoeda.SelStart := Length(Texto2);
   end;
  FreeAndNil(cCanvas);
//   Key := #0;
end;
procedure QtdMaskEdit2(Key: Char; edMoeda: TMaskEdit);
var
   Texto, Texto2: string;
   i: byte;
   cCanvas : TControlCanvas;
begin

   cCanvas := TControlCanvas.Create;
   TControlCanvas(cCanvas).Control := Application.MainForm;

   if (Key in ['0'..'9',chr(vk_back)]) then
   begin
      if (key in ['0'..'9']) and (Length(Trim(edMoeda.Text))>23) then
         key := #0;

      Texto2 := '0';
      Texto := Trim(edMoeda.Text)+Key;
      for i := 1 to Length(Texto) do
         if Texto[i] in ['0'..'9'] then
            Texto2 := Texto2 + Texto[i];

      if key = chr(vk_back) then
         Delete(Texto2,Length(Texto2),1);

      // formato o texto que depois será colocado no Edit
      Texto2 := FormatFloat('#,###,##0', StrToInt64(Texto2) );

      edMoeda.Text := Texto2;
      edMoeda.SelStart := Length(Texto2);
   end;
  FreeAndNil(cCanvas);
end;




procedure KmKeyEdit(Key: Char; edMoeda: TMaskEdit);
var
   Texto, Texto2: string;
   i: byte;
   cCanvas : TControlCanvas;
begin

   cCanvas := TControlCanvas.Create;
   TControlCanvas(cCanvas).Control := Application.MainForm;

   if (Key in ['0'..'9',chr(vk_back)]) then
   begin
      // limito a 23 caracteres senão haverá um erro na função StrToInt64()
      if (key in ['0'..'9']) and (Length(Trim(edMoeda.Text))>23) then
         key := #0;

      // pego somente os caracteres de 0 a 9, ignorando a pontuação
      Texto2 := '0';
      Texto := Trim(edMoeda.Text)+Key;
      for i := 1 to Length(Texto) do
         if Texto[i] in ['0'..'9'] then
            Texto2 := Texto2 + Texto[i];

      // se foi pressionado BACKSPACE (única tecla válida, fora os números)
      // apago o último caractere da string
      if key = chr(vk_back) then
         Delete(Texto2,Length(Texto2),1);

      // formato o texto que depois será colocado no Edit
      Texto2 := FormatFloat('Km #,###,##0', StrToInt64(Texto2));

      // preencho os espaços à esquerda, de modo a deixar o texto
      // alinhado à direita (gambiarra)
      {
      repeat
         Texto2 := ' '+Texto2;
      until  ccanvas.TextWidth(Texto2) >= edMoeda.Width;
      }

      // atribuo a string à propriedade Text do Edit

      edMoeda.Text := Texto2;

      // posiciono o cursor no fim do texto
      edMoeda.SelStart := Length(Texto2);
   end;
  FreeAndNil(cCanvas);
//   Key := #0;
end;

Function RetNumero(c: String): String;
var
   Texto, Texto2: string;
   i: byte;
begin
      Texto2 := '0';
      Texto := Trim(c);
      for i := 1 to Length(Texto) do
         if Texto[i] in ['0'..'9'] then
            Texto2 := Texto2 + Texto[i];

    Result := Texto2;
end;

procedure LtsKeyEdit(Key: Char; edMoeda: TMaskEdit);
var
   Texto, Texto2: string;
   i: byte;
   cCanvas : TControlCanvas;
begin

   cCanvas := TControlCanvas.Create;
   TControlCanvas(cCanvas).Control := Application.MainForm;

   if (Key in ['0'..'9',chr(vk_back)]) then
   begin
      // limito a 23 caracteres senão haverá um erro na função StrToInt64()
      if (key in ['0'..'9']) and (Length(Trim(edMoeda.Text))>23) then
         key := #0;

      // pego somente os caracteres de 0 a 9, ignorando a pontuação
      Texto2 := '0';
      Texto := Trim(edMoeda.Text)+Key;
      for i := 1 to Length(Texto) do
         if Texto[i] in ['0'..'9'] then
            Texto2 := Texto2 + Texto[i];

      // se foi pressionado BACKSPACE (única tecla válida, fora os números)
      // apago o último caractere da string
      if key = chr(vk_back) then
         Delete(Texto2,Length(Texto2),1);

      // formato o texto que depois será colocado no Edit
      Texto2 := FormatCurr(' ###.###.###,###', StrToInt64(Texto2));

      // preencho os espaços à esquerda, de modo a deixar o texto
      // alinhado à direita (gambiarra)
      {
      repeat
         Texto2 := ' '+Texto2;
      until  ccanvas.TextWidth(Texto2) >= edMoeda.Width;
      }

      // atribuo a string à propriedade Text do Edit

      edMoeda.Text := Texto2;

      // posiciono o cursor no fim do texto
      edMoeda.SelStart := Length(Texto2);
   end;
  FreeAndNil(cCanvas);
//   Key := #0;
end;
procedure PCTKeyEdit(Key: Char; edMoeda: TMaskEdit);
var
   Texto, Texto2: string;
   i: byte;
   cCanvas : TControlCanvas;
begin
if (Key in ['0'..'9',chr(vk_back)]) then
   begin
      // limito a 23 caracteres senão haverá um erro na função StrToInt64()
      if (key in ['0'..'9']) and (Length(Trim(edMoeda.Text))>5) then
         key := #0;

      // pego somente os caracteres de 0 a 9, ignorando a pontuação
      Texto2 := '0';
      Texto := Trim(edMoeda.Text)+Key;
      for i := 1 to Length(Texto) do
         if Texto[i] in ['0'..'9'] then
            Texto2 := Texto2 + Texto[i];

      // se foi pressionado BACKSPACE (única tecla válida, fora os números)
      // apago o último caractere da string
      if key = chr(vk_back) then
         Delete(Texto2,Length(Texto2),1);

      // formato o texto que depois será colocado no Edit
      Texto2 := FormatFloat('##0.00%',StrToInt64(Texto2)/100);

      // atribuo a string à propriedade Text do Edit
      edMoeda.Text := Texto2;

      // posiciono o cursor no fim do texto
      edMoeda.SelStart := Length(Texto2);
   end;

   Key := #0;
  FreeAndNil(cCanvas);
end;




procedure KgKeyEdit(Key: Char; edMoeda: TMaskEdit);
var
   Texto, Texto2: string;
   i: byte;
   cCanvas : TControlCanvas;
begin

   cCanvas := TControlCanvas.Create;
   TControlCanvas(cCanvas).Control := Application.MainForm;

   if (Key in ['0'..'9',chr(vk_back)]) then
   begin
      // limito a 23 caracteres senão haverá um erro na função StrToInt64()
      if (key in ['0'..'9']) and (Length(Trim(edMoeda.Text))>23) then
         key := #0;

      // pego somente os caracteres de 0 a 9, ignorando a pontuação
      Texto2 := '0';
      Texto := Trim(edMoeda.Text)+Key;
      for i := 1 to Length(Texto) do
         if Texto[i] in ['0'..'9'] then
            Texto2 := Texto2 + Texto[i];

      // se foi pressionado BACKSPACE (única tecla válida, fora os números)
      // apago o último caractere da string
      if key = chr(vk_back) then
         Delete(Texto2,Length(Texto2),1);

      // formato o texto que depois será colocado no Edit
      Texto2 := FormatFloat('Kg #,###,##0', StrToInt64(Texto2));

      // preencho os espaços à esquerda, de modo a deixar o texto
      // alinhado à direita (gambiarra)
      {
      repeat
         Texto2 := ' '+Texto2;
      until  ccanvas.TextWidth(Texto2) >= edMoeda.Width;
      }

      // atribuo a string à propriedade Text do Edit

      edMoeda.Text := Texto2;

      // posiciono o cursor no fim do texto
      edMoeda.SelStart := Length(Texto2);
   end;

//   Key := #0;
  FreeAndNil(cCanvas);
end;


procedure TanqKeyEdit(Key: Char; edMoeda: TMaskEdit);
var
   Texto, Texto2: string;
   i: byte;
   cCanvas : TControlCanvas;
begin

   cCanvas := TControlCanvas.Create;
   TControlCanvas(cCanvas).Control := Application.MainForm;

   if (Key in ['0'..'9',chr(vk_back)]) then
   begin
      // limito a 23 caracteres senão haverá um erro na função StrToInt64()
      if (key in ['0'..'9']) and (Length(Trim(edMoeda.Text))>23) then
         key := #0;

      // pego somente os caracteres de 0 a 9, ignorando a pontuação
      Texto2 := '0';
      Texto := Trim(edMoeda.Text)+Key;
      for i := 1 to Length(Texto) do
         if Texto[i] in ['0'..'9'] then
            Texto2 := Texto2 + Texto[i];

      // se foi pressionado BACKSPACE (única tecla válida, fora os números)
      // apago o último caractere da string
      if key = chr(vk_back) then
         Delete(Texto2,Length(Texto2),1);

      // formato o texto que depois será colocado no Edit
      Texto2 := FormatFloat('Lt ##,###,##0.000', StrToInt64(Texto2)/1000);

      // preencho os espaços à esquerda, de modo a deixar o texto
      // alinhado à direita (gambiarra)
      {
      repeat
         Texto2 := ' '+Texto2;
      until  ccanvas.TextWidth(Texto2) >= edMoeda.Width;
      }

      // atribuo a string à propriedade Text do Edit

      edMoeda.Text := Texto2;

      // posiciono o cursor no fim do texto
      edMoeda.SelStart := Length(Texto2);
   end;

//   Key := #0;
  FreeAndNil(cCanvas);
end;

procedure MoedaKeyMask(Key: Char; edMoeda: TMaskEdit);
var
   Texto, Texto2: string;
   i: byte;
   cCanvas : TControlCanvas;
begin
     if NOT (Key in ['0'..'9', #8, #9]) then
     key := #0;
     //Função para posicionar o cursor sempre na direita
     edMoeda.selstart := Length(edMoeda.text);
end;



procedure QtdKey(Key: Char; edMoeda: TMaskEdit);
var
   Texto, Texto2: string;
   i: byte;
   cCanvas : TControlCanvas;
begin

   cCanvas := TControlCanvas.Create;
   TControlCanvas(cCanvas).Control := Application.MainForm;

   if (Key in ['0'..'9',chr(vk_back)]) then
   begin
      // limito a 23 caracteres senão haverá um erro na função StrToInt64()
      if (key in ['0'..'9']) and (Length(Trim(edMoeda.Text))>23) then
         key := #0;

      // pego somente os caracteres de 0 a 9, ignorando a pontuação
      Texto2 := '0';
      Texto := Trim(edMoeda.Text)+Key;
      for i := 1 to Length(Texto) do
         if Texto[i] in ['0'..'9'] then
            Texto2 := Texto2 + Texto[i];

      // se foi pressionado BACKSPACE (única tecla válida, fora os números)
      // apago o último caractere da string
      if key = chr(vk_back) then
         Delete(Texto2,Length(Texto2),1);

      // formato o texto que depois será colocado no Edit
      Texto2 := FormatFloat('###,###,##0.000', StrToFloat(Texto2)/1000);

      // preencho os espaços à esquerda, de modo a deixar o texto
      // alinhado à direita (gambiarra)
      {
      repeat
         Texto2 := ' '+Texto2;
      until  ccanvas.TextWidth(Texto2) >= edMoeda.Width;
      }

      // atribuo a string à propriedade Text do Edit

      edMoeda.Text := Texto2;

      // posiciono o cursor no fim do texto
      edMoeda.SelStart := Length(Texto2);
   end;

//   Key := #0;
  FreeAndNil(cCanvas);
end;

procedure QtdKeyC2(Key: Char; edMoeda: TMaskEdit);
var
   Texto, Texto2: string;
   i: byte;
   cCanvas : TControlCanvas;
begin

   cCanvas := TControlCanvas.Create;
   TControlCanvas(cCanvas).Control := Application.MainForm;

   if (Key in ['0'..'9',chr(vk_back)]) then
   begin
      // limito a 23 caracteres senão haverá um erro na função StrToInt64()
      if (key in ['0'..'9']) and (Length(Trim(edMoeda.Text))>23) then
         key := #0;

      // pego somente os caracteres de 0 a 9, ignorando a pontuação
      Texto2 := '0';
      Texto := Trim(edMoeda.Text)+Key;
      for i := 1 to Length(Texto) do
         if Texto[i] in ['0'..'9'] then
            Texto2 := Texto2 + Texto[i];

      // se foi pressionado BACKSPACE (única tecla válida, fora os números)
      // apago o último caractere da string
      if key = chr(vk_back) then
         Delete(Texto2,Length(Texto2),1);

      // formato o texto que depois será colocado no Edit
      Texto2 := FormatFloat('Cm #,##0.00', StrToInt64(Texto2)/100);

      // preencho os espaços à esquerda, de modo a deixar o texto
      // alinhado à direita (gambiarra)
      {
      repeat
         Texto2 := ' '+Texto2;
      until  ccanvas.TextWidth(Texto2) >= edMoeda.Width;
      }

      // atribuo a string à propriedade Text do Edit

      edMoeda.Text := Texto2;

      // posiciono o cursor no fim do texto
      edMoeda.SelStart := Length(Texto2);
   end;

//   Key := #0;
  FreeAndNil(cCanvas);
end;



{*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
*  FUNÇÃO Busca CEP na Internet
*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=}

function BuscaCep(edCep: TMaskEdit; edLog, edBairro, edCidade, edUf: Tedit): Boolean;
var
   Consulta: String;
   Resposta: TStringStream;
   TSConsulta: TStringList;
   XMLBuscaCEP: TXMLdocument;
   IdHTTP1: TIdHTTP;
begin
     if (edCep.Text = '') or (Length(edCep.Text) < 8) or  (Length(edCep.Text) > 8) then
     begin
        Application.MessageBox('CEP nulo ou inválido.', 'Erro - Aviso do Sistema', mb_iconwarning+mb_ok);
        exit;
     end;
     //RichEdit1.Clear;
     Resposta   := TStringStream.Create('');
     TSConsulta := TStringList.Create;
     IdHTTP1.Request.UserAgent:='Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV2';
     TSConsulta.Values['&cep']  := edCep.Text;
     TSConsulta.Values['&formato']  := 'xml';

     //TSConsulta.Values['&formato']  := 'query_string';
     IdHTTP1.Post('http://cep.republicavirtual.com.br/web_cep.php?', TSConsulta, Resposta);
     XMLBuscaCEP.Active := True;
     XMLBuscaCEP.Encoding := 'iso-8859-1';
     XMLBuscaCEP.LoadFromStream(Resposta);

     //RichEdit1.Lines.Add(Resposta.DataString);

     //RichEdit1.Lines.Add('Tipo de logradouro: '+XMLBuscaCEP.DocumentElement.ChildNodes['tipo_logradouro'].NodeValue);
     //edlog1.Lines.Add('Logradouro: '+#9+XMLBuscaCEP.DocumentElement.ChildNodes['tipo_logradouro'].NodeValue+' '+XMLBuscaCEP.DocumentElement.ChildNodes['logradouro'].NodeValue);
     //edtLogradouro.Text := XMLBuscaCEP.DocumentElement.ChildNodes['tipo_logradouro'].NodeValue+' '+XMLBuscaCEP.DocumentElement.ChildNodes['logradouro'].NodeValue;
     edLog.Text := XMLBuscaCEP.DocumentElement.ChildNodes['tipo_logradouro'].NodeValue+' '+XMLBuscaCEP.DocumentElement.ChildNodes['logradouro'].NodeValue;
     //RichEdit1.Lines.Add('Bairro: '+#9+#9+XMLBuscaCEP.DocumentElement.ChildNodes['bairro'].NodeValue);
     edbairro.Text := XMLBuscaCEP.DocumentElement.ChildNodes['bairro'].NodeValue;

     //RichEdit1.Lines.Add('Município: '+#9+XMLBuscaCEP.DocumentElement.ChildNodes['cidade'].NodeValue);
     edCidade.Text  := XMLBuscaCEP.DocumentElement.ChildNodes['cidade'].NodeValue;
     edUf.Text      := XMLBuscaCEP.DocumentElement.ChildNodes['uf'].NodeValue;

     //RichEdit1.Lines.Add('UF: '+#9+#9+XMLBuscaCEP.DocumentElement.ChildNodes['uf'].NodeValue);
     TSConsulta.Free;
     Resposta.Free;
     XMLBuscaCEP.Active := False;

      FreeAndNil(Resposta);
      FreeAndNil(TSConsulta);

end;



{*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
*  FUNÇÃO verifica se o Componente existe
*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=}

function TestaComponente(Nome: String): boolean;
var i: integer;
begin
  result := False;
  for i := 0 to (Application.ComponentCount - 1) do begin
    result := (Application.Components[i].Name = Nome);
    if result then break;
  end;
end;



{*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
*  FUNÇÃO VALIDA EMAIL
*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=}
Function ValidaEMail(Email : String): Boolean;
   var {sintaxe: nome@provedor.com.br ou outros}
   s: String;
   EPos: Integer;
begin
   EPos:= pos('@',Email);
   if Epos > 1 then
      begin
         s:= copy(EMail,Epos+1,Length(Email));
         if (pos('.',s)> 1) and (pos('.',s)< length(s)) then
             Result := true
           else Result := False;
      end
     else
       Result := False;
End;{Verifica se é um endereço de email válido}

{*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
*  FUNÇÃO MENSAGEM
*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=}

function mensagem(Texto: string; Botao: TMsgDlgButtons = [mbOk]; Rotulo:String = 'Atenção'; Icon : TMsgDlgType = mtWarning): integer;
var
  wl_mensagem: TForm;
begin

  wl_Mensagem := CreateMessageDialog(Texto, Icon, Botao);

  (wl_mensagem.FindComponent('YES')    as TButton).Caption := '&Sim';
  (wl_mensagem.FindComponent('NO')     as TButton).Caption  := '&Não';
  (wl_mensagem.FindComponent('OK')     as TButton).Caption  := '&Ok';
  (wl_mensagem.FindComponent('CANCEL') as TButton).Caption  := '&Cancela';

  wl_mensagem.Color := clBtnFace;
  wl_mensagem.BorderStyle := bsSingle;
  wl_mensagem.BorderIcons := [];

  wl_mensagem.Caption := Rotulo;

  result := wl_mensagem.ShowModal;
end;




{*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
*  FUNCÇÃO STRZERO
*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=}

function StrZero(Num, Size: Integer): String;
var
Text: String;
i, Tam: integer;
begin
Text := IntToStr(Num);
Tam := Length(Text);
for i := 1 to (Size-Tam) do
Text := '0' + Text;
Result := Text;
end;


function StrZeroF(Num: Double; Size: Integer): String;
var
Text: String;
i, Tam: integer;
begin
Text := FloatToStr(Num);
Tam := Length(Text);
for i := 1 to (Size-Tam) do
Text := '0' + Text;
Result := FormatFloat('###,##0.00;0;',StrToCurr(Text));  ;
end;

{*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
*  FUNCÇÃO CALCULA IDADE
*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=}
function CalcIdade( DtNasc: String): Integer;
var
AnoNasc, MesNasc, DiaNasc: Integer;
AnoAtu, MesAtu, DiaAtu, Idade: Integer;
begin
AnoNasc := StrToInt(Copy(DtNasc,7,4));
MesNasc := StrToInt(Copy(DtNasc,4,2));
DiaNasc := StrToInt(Copy(DtNasc,1,2));
AnoAtu := StrToInt(Copy(DateToStr(Date()),7,4));
MesAtu := StrToInt(Copy(DateToStr(Date()),4,2));
DiaAtu := StrToInt(Copy(DateToStr(Date()),1,2));
Idade := 0;
if AnoAtu > AnoNasc then
begin
Idade := AnoAtu - AnoNasc;
if (MesAtu < MesNasc) or
((MesAtu = MesNasc) and (DiaAtu < DiaNasc)) then
Idade := Idade - 1;
end;
Result := Idade;
end;
{*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
*  FUNCÇÃO MES E ANO
*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=}

function MesAtual:String;
var
aa,mm,dd:Word;
const
Mes:array[1..12] of String = ('Janeiro','Fevereiro',
'Março','Abril','Maio','Junho','Julho','Agosto',
'Setembro','Outubro','Novembro','Dezembro');
begin
DecodeDate(Now,aa,mm,dd);
Result:=(Mes[mm]+'/'+IntToStr(aa));
end;
{*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
*  FUNCÇÃO GERA SERIAL
*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=}
function chave(cadeia:string):string;
const
  palavra:string = '123456789GHJWEBNM12FGHJKRTYUIOPASDF1212JKLZXCVLZX34567890QWERKLZXCVBNM0QTYUIOPASDFGH';
var
  comprimento, resto, produto, acumulado, valor, posicao: integer;
begin
    result := '';
    for comprimento := 1 to 16 do
    begin
      acumulado := 0;
      for posicao := 1 to length(cadeia) do
      begin
        valor:= ord(cadeia[posicao]);
        produto := valor * (length(cadeia) - posicao + 1);
        acumulado := acumulado + produto;
      end;
      resto:= (acumulado mod 73) + 1;
      result:= result + palavra[resto];
      cadeia:= cadeia + result;
    end;
    result:= copy(result,1,4)+#45+copy(result,5,4)+#45+copy(result,9,4)+#45+copy(result,13,4);
end;







function ReturnSixMonth(Actual:TDateTime):Semestre;
{Retorna 6 meses atrás da data enviada, de mes em mes}
var
  d,m,y : word;
  i : byte;
  Data : TDateTime;
begin
  for i := 6 downto 1 do begin
  Data := Actual - (30 * i);
  DecodeDate(Data,y,m,d);
  Result[i].Mes := m;
  Result[i].Ano := y;
  end;
end;

function NameMonth(Mes:Word;Abrev:Boolean):String;
{Retorna o nome de um mês abreviado ou não}
const
  NameL : array [1..12] of String[9] = ('JANEIRO','FEVEREIRO','MARÇO','ABRIL',
'MAIO','JUNHO','JULHO','AGOSTO',
'SETEMBRO','OUTUBRO','NOVEMBRO',
'DEZEMBRO');
begin
  if (Mes in [1..12]) then
  if Abrev then
  Result := Copy(NameL[Mes],1,3)
  else
  Result := NameL[Mes];
end;

function DataExtenso(Data:TDateTime): String;
{Retorna uma data por extenso}
var
  NoDia : Integer;
  DiaDaSemana : array [1..7] of String;
  Meses : array [1..12] of String;
  Dia, Mes, Ano : Word;
begin
{ Dias da Semana }
  DiaDasemana [1]:= 'Domingo';
  DiaDasemana [2]:= 'Segunda-feira';
  DiaDasemana [3]:= 'Terçafeira';
  DiaDasemana [4]:= 'Quarta-feira';
  DiaDasemana [5]:= 'Quinta-feira';
  DiaDasemana [6]:= 'Sexta-feira';
  DiaDasemana [7]:= 'Sábado';
{ Meses do ano }
  Meses [1] := 'Janeiro';
  Meses [2] := 'Fevereiro';
  Meses [3] := 'Março';
  Meses [4] := 'Abril';
  Meses [5] := 'Maio';
  Meses [6] := 'Junho';
  Meses [7] := 'Julho';
  Meses [8] := 'Agosto';
  Meses [9] := 'Setembro';
  Meses [10]:= 'Outubro';
  Meses [11]:= 'Novembro';
  Meses [12]:= 'Dezembro';
  DecodeDate (Data, Ano, Mes, Dia);
  NoDia := DayOfWeek (Data);
  Result := DiaDaSemana[NoDia] + ', ' +
  IntToStr(Dia) + ' de ' + Meses[Mes]+ ' de ' + IntToStr(Ano);
end;

function DataValida(StrD: string): Boolean;
{Testa se uma data é valida}
begin
  Result := true;
  try
  StrToDate(StrD);
  except
  on EConvertError do Result:=False;
  end;
end;

function PrimeiroDiaUtil(Data:TDateTime):TDateTime;
{Retorna data do primeiro dia Util do mes, de uma data informada}
var Ano, Mes, Dia : word;
DiaDaSemana : Integer;
begin
  DecodeDate (Data, Ano, Mes, Dia);
  Dia := 1;
  DiaDaSemana := DayOfWeek(Data);
  if DiaDaSemana in [1,7] then
  Dia := 2;
  Result := EncodeDate(Ano, Mes, Dia);
end;

function IsWeekEnd(dData : TDateTime) : boolean;
{Verifica se uma data informada cai em um final de semana}
begin
  if DayOfWeek(dData) in [1,7] then
  result := true
  else
  result := false;
end;


procedure PegarColor();
begin
Amarelo             		:= Tcolor(RGB( 255,255,0      ));
Amarelo_Esverdeado    	:= Tcolor(RGB(153,204,50      ));
Aquamarine            	:= Tcolor(RGB(112,219,147     ));
Aquamarine_Medio      	:= Tcolor(RGB(50,205,153      ));
Azul                  	:= Tcolor(RGB(0,0,255         ));
Azul_Ardosia          	:= Tcolor(RGB(0,127,255       ));
Azul_Ardosia_Escuro   	:= Tcolor(RGB(107,35,142      ));
Azul_Brilhante        	:= Tcolor(RGB(192,217,217     ));
Azul_Celeste          	:= Tcolor(RGB(50,153,204      ));
Azul_Claro            	:= Tcolor(RGB(95,159,159      ));
Azul_Corn_Flower      	:= Tcolor(RGB(66,66,111       ));
Azul_Escuro          	  := Tcolor(RGB( 0,0,156        ));
Azul_Marinho          	:= Tcolor(RGB(35,35,142       ));
Azul_Medio            	:= Tcolor(RGB(50,50,205       ));
Azul_Neon             	:= Tcolor(RGB(77,77,255       ));
Azul_Rich             	:= Tcolor(RGB(89,89,171       ));
Azul_Violeta          	:= Tcolor(RGB(159,95,159      ));
Baker_Chocolate       	:= Tcolor(RGB(92,51,23        ));
Branco                	:= Tcolor(RGB(255,255,255     ));
Bright_Ouro           	:= Tcolor(RGB(217,217,25      ));
Bronze                	:= Tcolor(RGB(219,147,112     ));
Bronze_Claro          	:= Tcolor(RGB(235,199,158     ));
Bronze_Escuro         	:= Tcolor(RGB(140,120,83      ));
Caqui                 	:= Tcolor(RGB(159,95,159      ));
Cinza                 	:= Tcolor(RGB(190,190,190     ));
Cinza_Brilhante       	:= Tcolor(RGB(168,168,168     ));
Cinza_Claro           	:= Tcolor(RGB(205,205,205     ));
Cinza_Sintilante     		:= Tcolor(RGB(232,232,232     ));
Cobre                 	:= Tcolor(RGB(217,135,25      ));
Cobre_Claro           	:= Tcolor(RGB(181,165,66      ));
Cobre_Escuro          	:= Tcolor(RGB(184,115,51      ));
Coral                 	:= Tcolor(RGB(255,127,0       ));
Cyan                  	:= Tcolor(RGB(0,255,255       ));
Escarlata            	  := Tcolor(RGB( 140,23,23      ));
Firebrick             	:= Tcolor(RGB(142,35,35       ));
Goldenrod_Medio       	:= Tcolor(RGB(234,234,174     ));
Goldenrod             	:= Tcolor(RGB( 219,219,112		));
Laranja             		:= Tcolor(RGB( 255,165,0      ));
Laranja_Mandarian   		:= Tcolor(RGB( 228,120,51     ));
Light_Steel_Blue    		:= Tcolor(RGB( 143,143,189    ));
Light_Wood          		:= Tcolor(RGB( 233,194,166    ));
Magenta             		:= Tcolor(RGB( 255,0,255      ));
Marrom_lilaz        		:= Tcolor(RGB( 142,35,107     ));
Marrom              		:= Tcolor(RGB( 165,42,42      ));
Marrom_Escuro       		:= Tcolor(RGB( 92,64,51       ));
Medium_Slate_Blue   		:= Tcolor(RGB( 127,0,255      ));
Orquidea_Escuro     		:= Tcolor(RGB( 153,50,205     ));
Orquidea_Medio      		:= Tcolor(RGB( 147,112,219    ));
Ouro                		:= Tcolor(RGB( 205,127,50     ));
Ouro_Velho          		:= Tcolor(RGB( 207,181,59     ));
Plum                		:= Tcolor(RGB( 234,173,234    ));
Preto               		:= Tcolor(RGB( 0,0,0          ));
Purpura_Escuro      		:= Tcolor(RGB( 135,31,120     ));
Quartz              		:= Tcolor(RGB( 217,217,243    ));
Rosa                		:= Tcolor(RGB( 255,192,203    ));
Rosa_Temperado      		:= Tcolor(RGB( 255,28,174     ));
Salmao              		:= Tcolor(RGB( 111,66,66      ));
Semi_Sweet_Chocolate		:= Tcolor(RGB( 107,66,38      ));
Sienna              		:= Tcolor(RGB( 142,107,35     ));
Silver              		:= Tcolor(RGB( 230,232,250    ));
Steel_Azul          		:= Tcolor(RGB( 35,107,142     ));
Summer_Sky          		:= Tcolor(RGB( 56,176,222     ));
Tan_Escuro          		:= Tcolor(RGB( 151,105,79     ));
Thistle             		:= Tcolor(RGB( 216,191,216    ));
Turquesa            		:= Tcolor(RGB( 173,234,234    ));
Turquesa_Escuro     		:= Tcolor(RGB( 112,147,219    ));
Turquesa_Medio      		:= Tcolor(RGB( 112,219,219    ));
Verde               		:= Tcolor(RGB( 0,255,0        ));
Verde_Amarelado     		:= Tcolor(RGB( 147,219,112    ));
Verde_Cobre         		:= Tcolor(RGB( 82,127,118     ));
Verde_Cobre_Escuro  		:= Tcolor(RGB( 74,118,110     ));
Verde_Escuro        		:= Tcolor(RGB( 47,79,47       ));
Verde_Floresta      		:= Tcolor(RGB( 35,142,35      ));
Verde_Floresta_Medio		:= Tcolor(RGB( 107,142,35     ));
Verde_Hunter        		:= Tcolor(RGB( 33,94,33       ));
Verde_Limao         		:= Tcolor(RGB( 50,205,50      ));
Verde_Oceano        		:= Tcolor(RGB( 66,111,66      ));
Verde_Oceano_claro  		:= Tcolor(RGB( 35,142,104     ));
Verde_Oliva_Escuro  		:= Tcolor(RGB( 79,79,47       ));
Verde_Primavera     		:= Tcolor(RGB( 0,255,127      ));
Verde_Primavera_claro	  := Tcolor(RGB( 127,255,0      ));
Vermelho            		:= Tcolor(RGB( 255,0,0        ));
Vermelho_Indiano    		:= Tcolor(RGB( 78,47,47       ));
Vermelho_Violeta    		:= Tcolor(RGB( 204,50,153     ));
Violeta             		:= Tcolor(RGB( 79,47,79       ));
Violeta_Vermelho_Medio 	:= Tcolor(RGB(219,112,147     ));
Wheat               		:= Tcolor(RGB( 216,216,191    ));
Wood_MEdio          		:= Tcolor(RGB( 165,128,100    ));


end;


function Mascarax(edt: String;str:String):string;
var
  i : integer;
begin
  for i := 1 to Length(edt) do
  begin
     if (str[i] = '9') and not (edt[i] in ['0'..'9']) and (Length(edt)=Length(str)+1) then
        delete(edt,i,1);
     if (str[i] <> '9') and (edt[i] in ['0'..'9']) then
        insert(str[i],edt, i);
  end;
  result := edt;
end;

function ChkTabCid(edNomCid: String; edUf:String):integer;
var
  i, codCid, CodEst: integer;
  SQLQ2     : TFdQuery;

begin
  SQLQ2     := TFdQuery.Create(NIL);
  //Verifica se existe a Cidade na Tabela de Cidade e Oloca la
  SQLQ2.Connection := dmEmp.SqlConSis;
  SQLQ2.Close;
  SQLQ2.SQL.Text :='SELECT * FROM '+U_funcao.SelSchema('Cidade')
                                  +' left JOIN "dbconfig".estado on est_codigo = cid_codest'
                                  +'  where upper( cid_nome ) = upper('''+edNomCid+''') and upper( est_uf ) = upper('''+edUf+''') ' ;
  SQLQ2.Open;
  if Not SQLQ2.Eof then begin
        codCid := SQLQ2.FieldByName('cid_codigo').value;
     end else  begin
        // aqui fica o CodCid de inclusão
        SQLQ2.Close;
        SQLQ2.SQL.Text :='SELECT * FROM '+U_funcao.SelSchema('estado')+' where upper( est_uf ) = upper('''+edUf+''') ';
        SQLQ2.Open;
        CodEst := SQLQ2.FieldByName('est_codigo').AsInteger ;

        SQLQ2.Close;
        SQLQ2.Connection := dmEmp.SqlConSis;
        SQLQ2.SQL.Text := 'Insert Into '+nmSchemaCfg_+'Cidade '+
                           '(cid_nome, cid_codest, cid_usuinc, cid_datinc, cid_horinc) values'+
                           '(:DbEdit2, :DbEdit3,  :UsuInc,   :DatInc,   :HorInc)';
        SQLQ2.ParamByName('UsuInc').Text     :=  nmUsuario ;
        SQLQ2.ParamByName('DatInc').AsDate   :=  Now ;
        SQLQ2.ParamByName('HorInc').Text     :=  TimeToStr(time) ;
        SQLQ2.ParamByName('DbEdit2').Text    :=  edNomCid ;
        SQLQ2.ParamByName('DbEdit3').Text    :=  IntToStr( CodEst ) ;
        SQLQ2.ExecSQL;
        //dmSistema.cliCidade.Active      := True ;
        //dmSistema.cliCidade.ApplyUpdates(0);

        //Fecha e Pega de novo
        SQLQ2.Close;
        SQLQ2.Connection := dmEmp.SqlConSis;
        SQLQ2.SQL.Text := 'SELECT * FROM '+U_funcao.SelSchema('Cidade')
                        +' left JOIN "dbconfig".estado on est_codigo = cid_codest'
                        +' where upper( cid_nome ) = upper('''+edNomCid+''') and upper( est_uf ) = upper('''+edUf+''') ' ;
        SQLQ2.Open;
        codCid := SQLQ2.FieldByName('cid_codigo').value;

    End;
    result := codCid;
    FreeAndNil( SQLQ2 )
end;

{*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
*  FUNÇÃO Tirar Caracteres
*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=}
function ChkEndRede(texto: string): string; stdcall;
{Função que serve para nao aceitar caracteres especiais tipo !@#$%^&*()}
const
  _Remove = ':';
var
  x: Integer;
begin
  if Length(texto) = 0 then
    Begin
      result := '0';
    End
    Else Begin
      result := '';
    End;

  for x := 1 to Length(texto) do
  if Pos(texto[x], _Remove) <> 0 then

  else
    result := result + texto[x];
end;





//////////////////////////////////////////////////////////////////////////////
{Funções de CONECTE}
//////////////////////////////////////////////////////////////////////////////

function CriaDir(const NomeSubDir, nmCamBanco, nmTipos: string; lSplash: Boolean ): boolean;
begin
  LeIni('R');
  Caminho := '\\'+host+'\'+CamIni2;// + NomeSubDir;
  if DirectoryExists( ChkEndRede(Caminho)) then
     begin
       //dmSistema.CriDataBase(Caminho, nmCamBanco, usuario, password, nmTipos, lSplash );
       //dmSistema.ChkTabelas(Caminho,nmCamBanco, usuario, password, nmTipos, lSplash );
       Result := true ;
     end else Begin
       CreateDir(ChkEndRede(Caminho));
       //dmSistema.CriDataBase(Caminho, nmCamBanco, usuario, usuario, nmTipos, lSplash);
       //dmSistema.ChkTabelas(Caminho,nmCamBanco, usuario, usuario, nmTipos, lSplash );
       Result := true
     End;
  end;


procedure LeIni(Modu: String);
var
  Ini: TIniFile;
  aDdIni: array of array [0..1] of string;
begin
   Ini := TIniFile.Create(CamIni+ArqIni);
   if UpperCase(Modu) = 'R' then
      Begin
       adm_TipoCnx      := Ini.ReadString('CONECTE', 'Tipo',      '' );
       adm_hostcnx      := Ini.ReadString('CONECTE', 'host',      '' );
       //adm_nmBcocnx     := Ini.ReadString('CONECTE', 'database',  '' );
       adm_usuariocnx    := Ini.ReadString('CONECTE', 'usuario',   '' );
       adm_passcnx      := Criptografar( Ini.ReadString('CONECTE', 'password',  '' ) );
       adm_diretoriocnx := Ini.ReadString('CONECTE', 'diretorio', '' );
       adm_libcnx       := Ini.ReadString('CONECTE', 'libary',    '' );
      End Else Begin
       Ini.writestring('CONECTE', 'Tipo',      adm_TipoCnx      );
       Ini.writestring('CONECTE', 'host',      adm_hostcnx      );
       Ini.writestring('CONECTE', 'database',  adm_nmBcocnx     );
       Ini.writestring('CONECTE', 'usuario',   adm_usuariocnx    );
       Ini.writestring('CONECTE', 'password',  Criptografar( adm_passcnx )  );
       Ini.writestring('CONECTE', 'diretorio', adm_diretoriocnx );
       Ini.writestring('CONECTE', 'libary',    adm_libcnx       );
      End;



    FreeAndNil( Ini )
end;
procedure variaveis();
var
  Ini: TIniFile;

begin

 CamIni     := ExtractFilePath(Application.ExeName);
 ArqIni     := 'config.Ini';
 CanBco     := 'database';
 nmBanco    := adm_nmBcocnx;
 nmPrograma := adm_nmapp ;

end;

Function VersaoExe: String;
type
PFFI = ^vs_FixedFileInfo;
var
F : PFFI;
Handle : Dword;
Len : Longint;
Data : Pchar;
Buffer : Pointer;
Tamanho : Dword;
Parquivo: Pchar;
Arquivo : String;
begin
  Arquivo := Application.ExeName;
  Parquivo := StrAlloc(Length(Arquivo) + 1);
  StrPcopy(Parquivo, Arquivo);
  Len := GetFileVersionInfoSize(Parquivo, Handle);
  Result := '';
  if Len > 0 then
    begin
    Data:=StrAlloc(Len+1);
    if GetFileVersionInfo(Parquivo,Handle,Len,Data) then
      begin
      VerQueryValue(Data, '\',Buffer,Tamanho);
      F := PFFI(Buffer);
      Result := Format('%d.%d.%d.%d',
      [HiWord(F^.dwFileVersionMs),
      LoWord(F^.dwFileVersionMs),
      HiWord(F^.dwFileVersionLs),
      Loword(F^.dwFileVersionLs)]
      );
      end;
    StrDispose(Data);
  end;
  StrDispose(Parquivo);
end;

function fIIF( pCond:Boolean; pTrue, pFalse:Variant ): Variant;
begin
  If pCond Then
     Result := pTrue
  else
     Result := pFalse;
end;

function TestaCpfCgc(Dado: string): String;
var
  i: integer;
begin
  for i:= 1 to length(Dado) do begin
    if not (Dado[i] in ['0'..'9']) then delete(Dado,i,1);
  end;
  if ((length(Dado) <> 11) and (length(Dado) <> 14))then
     MessageDlg('ATENÇÃO: O número informado NÃO representa' + #13 +
                'um CPF ou CGC válido pelas regras da Receita Federal',mtWarning,[mbOK],0);
  if length(Dado) = 14 then begin
     if TestaCGC(Dado) then begin
        insert('-',Dado,13);
        insert('/',Dado,9);
        insert('.',Dado,6);
        insert('.',Dado,3);
     end
     else MessageDlg('O número informado NÃO representa um CGC' + #13 +
                     'válido pelas regras da Receita Federal', mtWarning, [mbOK], 0);
  end;
  if length(Dado) = 11 then begin
     if TestaCPF(Dado) then begin
        insert('-',Dado,10);
        insert('.',Dado,7);
        insert('.',Dado,4);
     end
     else MessageDlg('O número informado NÃO representa um CPF' + #13 +
                     'válido pelas regras da Receita Federal', mtWarning, [mbOK], 0);
  end;
  Result := Dado;
end;

{Valida dígito verificador de CGC}
function TestaCGC(Dado : string) : boolean;
var  D1            : array[1..12] of byte;
     I,
     DF1,
     DF2,
     DF3,
     DF4,
     DF5,
     DF6,
     Resto1,
     Resto2,
     PrimeiroDigito,
     SegundoDigito : integer;
begin
     Result := true;
     if Length(Dado) = 14 then
     begin
          for I := 1 to 12 do
               if Dado[I] in ['0'..'9'] then
                   D1[I] := StrToInt(Dado[I])
               else
                    Result := false;
          if Result then
          begin
               DF1 := 0;
               DF2 := 0;
               DF3 := 0;
               DF4 := 0;
               DF5 := 0;
               DF6 := 0;
               Resto1 := 0;
               Resto2 := 0;
               PrimeiroDigito := 0;
               SegundoDigito := 0;
               DF1 := 5*D1[1] + 4*D1[2] + 3*D1[3] + 2*D1[4] + 9*D1[5] + 8*D1[6] +
                      7*D1[7] + 6*D1[8] + 5*D1[9] + 4*D1[10] + 3*D1[11] + 2*D1[12];
               DF2 := DF1 div 11;
               DF3 := DF2 * 11;
               Resto1 := DF1 - DF3;
               if (Resto1 = 0) or (Resto1 = 1) then
                    PrimeiroDigito := 0
               else
                    PrimeiroDigito := 11 - Resto1;
               DF4 := 6*D1[1] + 5*D1[2] + 4*D1[3] + 3*D1[4] + 2*D1[5] + 9*D1[6] +
                      8*D1[7] + 7*D1[8] + 6*D1[9] + 5*D1[10] + 4*D1[11] + 3*D1[12] +
                      2*PrimeiroDigito;
               DF5 := DF4 div 11;
               DF6 := DF5 * 11;
               Resto2 := DF4 - DF6;
               if (Resto2 = 0) or (Resto2 = 1) then
                    SegundoDigito := 0
               else
                    SegundoDigito := 11 - Resto2;
               if (PrimeiroDigito <> StrToInt(Dado[13])) or
                  (SegundoDigito <> StrToInt(Dado[14])) then
                    Result := false;
          end;
     end
     else
          if Length(Dado) <> 0 then
               Result := false;
end;

{Valida dígito verificador de CPF}
function TestaCPF(Dado : string) : boolean;
var  D1            : array[1..9] of byte;
     I,
     DF1,
     DF2,
     DF3,
     DF4,
     DF5,
     DF6,
     Resto1,
     Resto2,
     PrimeiroDigito,
     SegundoDigito  : integer;
     lErro          : Boolean;
begin
     Result := true;
     if Length(Dado) = 11 then
     begin
          for I := 1 to 9 do
               if Dado[I] in ['0'..'9'] then
                    D1[I] := StrToInt(Dado[I])
               else
                    Result := false;
          if Result then
          begin
               DF1 := 0;
               DF2 := 0;
               DF3 := 0;
               DF4 := 0;
               DF5 := 0;
               DF6 := 0;
               Resto1 := 0;
               Resto2 := 0;
               PrimeiroDigito := 0;
               SegundoDigito := 0;
               DF1 := 10*D1[1] + 9*D1[2] + 8*D1[3] + 7*D1[4] + 6*D1[5] + 5*D1[6] +
                      4*D1[7] + 3*D1[8] + 2*D1[9];
               DF2 := DF1 div 11;
               DF3 := DF2 * 11;
               Resto1 := DF1 - DF3;
               if (Resto1 = 0) or (Resto1 = 1) then
                    PrimeiroDigito := 0
               else
                    PrimeiroDigito := 11 - Resto1;
               DF4 := 11*D1[1] + 10*D1[2] + 9*D1[3] + 8*D1[4] + 7*D1[5] + 6*D1[6] +
                      5*D1[7] + 4*D1[8] + 3*D1[9] + 2*PrimeiroDigito;
               DF5 := DF4 div 11;
               DF6 := DF5 * 11;
               Resto2 := DF4 - DF6;
               if (Resto2 = 0) or (Resto2 = 1) then
                    SegundoDigito := 0
               else
                    SegundoDigito := 11 - Resto2;
               if (PrimeiroDigito <> StrToInt(Dado[10])) or
                  (SegundoDigito <> StrToInt(Dado[11])) then
                    Result := false;
          end;
     end
     else
          if Length(Dado) <> 0 then
               Result := false;

if Not Result then
   ShowMessage('Cpf Invalido');

end;


function ConsLike(nmTabela, Campo: string; edPesq:TEdit; Ztab:TFdQuery): String;
Var
cQuery_, nmSchemaCfg : string;
SQLP    : TFdQuery;
begin
    nmSchemaCfg  := U_funcao.SelSchemaNome(nmTabela);
    cQuery_   :=  '';
    SQLP := TFdQuery.Create(Nil);
          with SQLP do
             begin
               Close;
               if nmSchemaCfg = 'dbconfig' then Begin
                  Connection:= dmEmp.SqlConSis;
               End Else Begin
                  Connection:= dmEmp.SqlConSis;
               End;
               SQL.Text:=' SELECT table_catalog, table_schema, table_name, COLUMN_NAME, data_type, udt_name, character_maximum_length, numeric_precision_radix, numeric_scale '+
                         ' FROM information_schema.columns WHERE table_name = lower('+QuotedStr(nmTabela)+') and table_schema = '+QuotedStr(nmSchemaCfg)+' and COLUMN_NAME = lower('+QuotedStr(Campo)+') ';
               Active := True;
               Open;
             end;


    if edPesq.Text <> '' then Begin
        if SQLP.FieldByName('udt_name').asstring <> 'integer' then Begin
           cQuery_ :='  WHERE UPPER('+Campo+') like UPPER('+QuotedStr('%'+edPesq.Text+'%')+') ';
        End Else Begin
           cQuery_ :='  WHERE CAST('+Campo+' AS VARCHAR(10))  like '+QuotedStr('%'+edPesq.Text+'%');
        End;
    End;
    Result :=  cQuery_;

    FreeAndNil( SQLp )
end;

function SelSchema(nmTabela: string ): String;
Var
cQuery_ : string;
TCfg  : TConecte;
begin
    TCfg  := TConecte.GetInstance;
    if TCfg.PEGASChema(nmTabela) then Begin
        Result :=  nmSchemaCfg+'.'+nmTabela;
    End Else Begin
        Result :=  nmSchemaEmp+'.'+nmTabela;
    End;
end;

function Schema(nmTabela: string ): String;
Var
cQuery_ : string;
SQLP    : TFdQuery;
TCfg  : TConecte;
begin

    TCfg  := TConecte.GetInstance;
    if TCfg.PEGASChema(nmTabela) then Begin
        Result :=  nmSchemaCfg_+'.'+nmTabela;
    End Else Begin
        Result :=  QuotedStr( nmSchemaEmp_ )+'.'+nmTabela;
    End;
FreeAndNil( TCfg )
end;

function SelSchemaNome(nmTabela: string ): String;
Var
cQuery_, nmSchemaCfg : string;
SQLP    : TFdQuery;
begin
    nmSchemaCfg  :=  nmSchemaCfg;
    cQuery_   :=  '';
    SQLP := TFdQuery.Create(Nil);
          with SQLP do
             begin
               Close;
               Connection:= dmEmp.SqlConSis;
               SQL.Text:=' SELECT mda_tipo FROM "dbconfig".mdoacesso WHERE mda_formda = lower('+QuotedStr(nmTabela)+')  ';
               Open;
             end;

    if SQLP.FieldByName('mda_tipo').isNull then begin
        Result :=  'dbconfig';
    end else begin
      if SQLP.FieldByName('mda_tipo').Value = 'CFG' then Begin
          Result :=  'dbconfig';
      End Else Begin
          Result :=  nmSchemaEmp_;
      End;
    end;
  FreeAndNil( SQLP )
end;


function ChkVar(Tab, Cmp, tipo: String ): Boolean;
var
cSql : String;
SQLQ : TFdQuery ;
Begin
   SQLQ := TFdQuery.Create(nil) ;
   cSql:= ' SELECT DATA_TYPE as tipo FROM information_schema.columns WHERE table_name = lower('+QuotedStr(Tab)+') and COLUMN_NAME = '+QuotedStr(Cmp)+' and table_schema = '+QuotedStr( SelSchemaNome(Tab) );
   with SQLQ do
      begin
        Close;
        Connection:= dmEmp.SqlConSis;
        SQL.Text:= cSql;
        Open;
      end;

    if SQLQ.FieldByName('tipo').Value = tipo then Begin
       Result := True;
    end Else Begin;
       Result := False;
    End;

  FreeAndNil( SQLQ )
end;

Function SalvaSql(aEdits : array of TComponent; Tab,Pre:String; nNew: Integer; ECT1,ECT2, cWhere:String ): string;
Var
cScrip: String;
cUsu, cHora, ccli_horalt,cCodSql, cIteSql,cValSql, cSqlTmp : string ;
dData, dcli_datalt : TDate ;
i, tmp: Integer;

begin
  cUsu    :=  nmUsuario;
  dData   :=  Now ;
  cHora   :=  TimeToStr(time) ;


  if nNew > 0 then begin
    // Gera Scrip de Insert
    cCodSql:= 'Insert Into '+U_funcao.SelSchema(Tab)+' ( ';
    for i := 0 to Length(aEdits)-1 do begin
        IF  ( aEdits[i].name <> ECT2 )  then Begin
          If ( aEdits[i].ClassName = 'TButtonedEdit' ) and ( TButtonedEdit(aEdits[i]).Text = '') Then Begin

          End Else Begin

              If ( aEdits[i].ClassName = 'TEdit' ) and ( ( LowerCase( Copy(TEdit(aEdits[i]).Name,1,4) ) = LowerCase(Pre)  ) OR
                                                         ( LowerCase(Pre).IsEmpty )) Then
                  Begin
                      if ( TEdit(aEdits[i]).Text <> '' ) and
                         ( LowerCase( Copy(TEdit(aEdits[i]).Name,5,5) ) <> 'senha'  ) then begin // senha

                          cIteSql:= cIteSql+aEdits[i].Name+', ';
                          cValSql:=cValSql+QuotedStr( TEdit(aEdits[i]).Text)+', ';

                      end else
                      if ( TEdit(aEdits[i]).Text <> '' ) and
                         ( LowerCase( Copy(TEdit(aEdits[i]).Name,5,5) ) = 'senha'  ) then begin // senha

                          cIteSql:= cIteSql+aEdits[i].Name+', ';
                          cValSql:=cValSql+QuotedStr(   Trim( u_funcao.Criptografar( TEdit(aEdits[i]).Text ) )  )+', ';

                      end;

                  End;

              If ( aEdits[i].ClassName = 'TMaskEdit' ) Then
                  Begin
                    cIteSql:= cIteSql+aEdits[i].Name+', ';
                    if  Pos('R$',TMaskEdit(aEdits[i]).text) > 0 then Begin
                           cValSql:=cValSql+ RmCharValor( TMaskEdit(aEdits[i]).text ) +', ';
                    End Else
                    if  Pos('Km',TMaskEdit(aEdits[i]).text) > 0 then Begin
                           cValSql:=cValSql+ RmCharKm( TMaskEdit(aEdits[i]).text ) +', ';
                    End Else
                    if  Pos('Kg',TMaskEdit(aEdits[i]).text) > 0 then Begin
                           cValSql:=cValSql+ RmCharValor( TMaskEdit(aEdits[i]).text ) +', ';
                    End Else
                    if  ( Pos('Lt',TMaskEdit(aEdits[i]).text) > 0 ) or ( LowerCase( Copy(aEdits[i].Name,5,3) ) = 'lts' ) then Begin
                           cValSql:=cValSql+  RemoveChar( TMaskEdit(aEdits[i]).text ) +', ';

                    End Else
                    if  Pos('%',TMaskEdit(aEdits[i]).text) > 0 then Begin
                           cValSql:=cValSql+ RmCharValor( TMaskEdit(aEdits[i]).text ) +', ';
                    End Else
                    if  Pos('Cm',TMaskEdit(aEdits[i]).text) > 0 then Begin
                           cValSql:=cValSql+ RemoveChar( TMaskEdit(aEdits[i]).text ) +', ';
                    End Else

                    if  UpperCase(Copy(aEdits[i].Name,5,3)) = 'EST'    then Begin
                           cValSql:=cValSql+ RemoveChar( TMaskEdit(aEdits[i]).text ) +', ';
                    End Else
                    if  UpperCase(Copy(aEdits[i].Name,5,3)) = 'QTD'    then Begin
                           cValSql:=cValSql+ RemoveChar( TMaskEdit(aEdits[i]).text ) +', ';
                    End Else
                    if  UpperCase(Copy(aEdits[i].Name,5,3)) = 'NMR'    then Begin
                           cValSql:=cValSql+ RemoveChar( TMaskEdit(aEdits[i]).text ) +', ';

                    End Else begin

                        cValSql:=cValSql+QuotedStr( TMaskEdit(aEdits[i]).text)+', ';

                    end;
                  End;

              If aEdits[i].ClassName = 'TComboBox' Then
                  Begin
                      cIteSql:= cIteSql+aEdits[i].Name+', ';
                      cValSql:=cValSql+QuotedStr( TComboBox(aEdits[i]).text)+', ';
                  End;

              If ( aEdits[i].ClassName = 'TDateTimePicker' )  Then
                  Begin
                      if TDateTimePicker(aEdits[i]).Format <> '  /  /    ' then Begin
                          cIteSql:= cIteSql+aEdits[i].Name+', ';
                          cValSql:=cValSql+QuotedStr( FormatDateTime('dd-mm-yyyy',TDateTimePicker(aEdits[i]).Date))+', ';
                      End;
                  End;

              If aEdits[i].ClassName = 'TButtonedEdit' Then
                  Begin

                      if U_funcao.ChkVar(Tab, aEdits[i].name , 'integer') and ( aEdits[i].name = ECT1 ) then Begin
                      //
                      End Else Begin
                         cIteSql:= cIteSql+aEdits[i].Name+', ';
                         if U_funcao.ChkVar(Tab, aEdits[i].name , 'integer') then Begin
                            cValSql:=cValSql+ TButtonedEdit(aEdits[i]).Text +', ';
                         End Else Begin
                            cValSql:=cValSql+QuotedStr( TButtonedEdit(aEdits[i]).Text)+', ';
                         End;
                      End;
                  End;

              If aEdits[i].ClassName = 'TMemo' Then
                  Begin
                      cIteSql:= cIteSql+aEdits[i].Name+', ';
                      cValSql:=cValSql+ QuotedStr( TMemo(aEdits[i]).Text)+', ';
                  End;

              If aEdits[i].ClassName = 'TRichEdit' Then
                  Begin
                      cIteSql:= cIteSql+aEdits[i].Name+', ';
                      cValSql:=cValSql+':'+aEdits[i].Name+', ';
                      //cValSql:=cValSql+ QuotedStr( TRichEdit(aEdits[i]).Text)+', ';
                  End;


              If aEdits[i].ClassName = 'TImage' Then
                  Begin
                      cIteSql:= cIteSql+aEdits[i].Name+', ';
                      cValSql:=cValSql+':'+aEdits[i].Name+', ';
                  End;

              If aEdits[i].ClassName =  'TCheckBox' Then
                  Begin
                      cIteSql:= cIteSql+aEdits[i].Name+', ';
                      cValSql:=cValSql+QuotedStr( StrBool( TCheckBox(aEdits[i]).Checked ) )+', ';
                  End;

          End;
        End;

    end;
    if Not Pre.IsEmpty then begin
        cIteSql:= cIteSql + Pre+'usuinc, '+Pre+'datinc, '+Pre+'horinc  ) values (';
    end else
        cIteSql:= cIteSql +'usuinc, datinc, horinc  ) values (';

    cValSql:= cValSql + QuotedStr(cUsu)+ ', '+QuotedStr( FormatDateTime('dd-mm-yyyy',dData ))+','+QuotedStr(cHora)+'   )';
    cCodSql:=cCodSql+cIteSql+cValSql;

  end
  else begin
    cCodSql:= 'update '+U_funcao.SelSchema(Tab)+' set ';
    for i := 0 to Length(aEdits)-1 do begin
        IF ( aEdits[i].name <> ECT2  ) then Begin
              If ( aEdits[i].ClassName = 'TEdit' )  and ( LowerCase( Copy(TEdit(aEdits[i]).Name,1,4) ) = LowerCase(Pre)  ) Then Begin
                    if ( TEdit(aEdits[i]).Text <> '' )  and
                       ( LowerCase( Copy(TEdit(aEdits[i]).Name,5,5) ) <> 'senha'  ) then begin
                         cIteSql:= cIteSql+aEdits[i].Name+' = '+cValSql+QuotedStr( TEdit(aEdits[i]).Text)+', ';
                    end else
                    if ( TEdit(aEdits[i]).Text <> '' )  and
                       ( LowerCase( Copy(TEdit(aEdits[i]).Name,5,5) ) = 'senha'  ) then begin
                         cIteSql:= cIteSql+aEdits[i].Name+' = '+cValSql+QuotedStr( Trim( u_funcao.Criptografar( TEdit(aEdits[i]).Text ) ) )+', ';
                    end;

                  End Else
              If ( aEdits[i].ClassName = 'TMaskEdit' ) and
                 ( LowerCase( Copy(aEdits[i].Name,5,3) ) <> 'cpf'  ) and
                 ( LowerCase( Copy(aEdits[i].Name,5,3) ) <> 'cnpj' ) Then Begin
                    if  Pos('R$',TMaskEdit(aEdits[i]).text) > 0 then Begin
                        cIteSql:= cIteSql+aEdits[i].Name+' = '+RmCharValor( TMaskEdit(aEdits[i]).text ) +', ';
                    End Else
                    if  Pos('Km',TMaskEdit(aEdits[i]).text) > 0 then Begin
                        cIteSql:= cIteSql+aEdits[i].Name+' = '+RmCharKm( TMaskEdit(aEdits[i]).text ) +', ';
                    End Else
                    if  ( Pos('Lt',TMaskEdit(aEdits[i]).text) > 0 ) or ( LowerCase( Copy(aEdits[i].Name,5,3) ) = 'lts' ) then Begin
                        cIteSql:= cIteSql+aEdits[i].Name+' = '+ RemoveChar( TMaskEdit(aEdits[i]).text) +', ';
                    End Else
                    if  Pos('Kg',TMaskEdit(aEdits[i]).text) > 0 then Begin
                        cIteSql:= cIteSql+aEdits[i].Name+' = '+RemoveChar( TMaskEdit(aEdits[i]).text ) +', ';
                    End Else
                    if  Pos('%',TMaskEdit(aEdits[i]).text) > 0 then Begin
                        cIteSql:= cIteSql+aEdits[i].Name+' = '+RmCharValor( TMaskEdit(aEdits[i]).text ) +', ';
                    End Else
                    if  Pos('Cm',TMaskEdit(aEdits[i]).text) > 0 then Begin
                        cIteSql:= cIteSql+aEdits[i].Name+' = '+RemoveChar( TMaskEdit(aEdits[i]).text ) +', ';
                    End Else
                    if   UpperCase( Copy(aEdits[i].name,5,3)) = 'EST' then Begin
                        cIteSql:= cIteSql+aEdits[i].Name+' = '+RemoveChar( TMaskEdit(aEdits[i]).text ) +', ';
                    End Else
                    if   UpperCase( Copy(aEdits[i].name,5,3)) = 'QTD' then Begin
                        cIteSql:= cIteSql+aEdits[i].Name+' = '+RemoveChar( TMaskEdit(aEdits[i]).text ) +', ';

                    End Else begin
                        cIteSql:= cIteSql+aEdits[i].Name+' = '+QuotedStr( TMaskEdit(aEdits[i]).text)+', ';
                    end;
                  End Else

              If aEdits[i].ClassName = 'TComboBox' Then Begin
                      cIteSql:= cIteSql+aEdits[i].Name+' = '+QuotedStr( TComboBox(aEdits[i]).text)+', ';
                  End Else

              If aEdits[i].ClassName = 'TDateTimePicker' Then Begin
                      cIteSql:= cIteSql+aEdits[i].Name+' = '+QuotedStr( FormatDateTime('dd-mm-yyyy',TDateTimePicker(aEdits[i]).Date))+', ';
                  End Else

              If ( aEdits[i].ClassName = 'TButtonedEdit' ) and ( TButtonedEdit(aEdits[i]).Text <> '') Then Begin
                      if U_funcao.ChkVar(Tab, aEdits[i].name , 'integer') and ( aEdits[i].name = ECT1 ) then Begin
                      //
                      End Else Begin
                        if U_funcao.ChkVar(Tab, aEdits[i].name , 'integer') then Begin
                          cIteSql:= cIteSql+aEdits[i].Name+' = '+TButtonedEdit(aEdits[i]).Text +', ';
                        End Else Begin
                          cIteSql:= cIteSql+aEdits[i].Name+' = '+QuotedStr( TButtonedEdit(aEdits[i]).Text)+', ';
                        End;
                      End;
                  End Else
              If aEdits[i].ClassName = 'TMemo' Then Begin
                      cIteSql:= cIteSql+aEdits[i].Name+' = '+QuotedStr( TMemo(aEdits[i]).Text)+', ';
                  End Else
              If aEdits[i].ClassName = 'TRichEdit' Then Begin
                      cIteSql:= cIteSql+aEdits[i].Name+' = :'+aEdits[i].Name+', ';
                  End Else
              If aEdits[i].ClassName = 'TImage' Then Begin
                      cIteSql:= cIteSql+aEdits[i].Name+' = :'+aEdits[i].Name+', ';
                  End Else
              If aEdits[i].ClassName = 'TCheckBox' Then
                      cIteSql:= cIteSql+aEdits[i].Name+' = '+QuotedStr( StrBool( TCheckBox(aEdits[i]).Checked ) )+', ';
                  End Else Begin

              End;
    end;


    if Not Pre.IsEmpty then begin
        cIteSql:=cIteSql+Pre+'usualt = '+QuotedStr(cUsu)+', '+Pre+'datalt = '+QuotedStr( FormatDateTime('dd-mm-yyyy',dData ))+', '+Pre+'horalt= '+QuotedStr(cHora)+' Where '+cWhere;
    end Else
        cIteSql:=cIteSql+'usualt = '+QuotedStr(cUsu)+', datalt = '+QuotedStr( FormatDateTime('dd-mm-yyyy',dData ))+', horalt= '+QuotedStr(cHora)+' Where '+cWhere;

    cCodSql:=cCodSql+cIteSql;

  end;

  //cCodSql := StringReplace(cCodSql, '''''', 'NULL', [rfReplaceAll, rfIgnoreCase]);
  Result  := cCodSql;

End;

Function StrBool(logic: Boolean): String;
Begin
  case logic of
    True  : Result := 'T';
    False : Result := 'F';
  end;
End;

function GetVersion: string;
var
VerInfoSize: DWORD;
VerInfo: Pointer;
VerValueSize: DWORD;
VerValue: PVSFixedFileInfo;
Dummy: DWORD;
begin
VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
GetMem(VerInfo, VerInfoSize);
GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo);
VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
with VerValue^ do
begin
Result := IntToStr(dwFileVersionMS shr 16);
Result := Result + '.' + IntToStr(dwFileVersionMS and $FFFF);
Result := Result + '.' + IntToStr(dwFileVersionLS shr 16);
Result := Result + '.' + IntToStr(dwFileVersionLS and $FFFF);
end;
FreeMem(VerInfo, VerInfoSize);
end;

function chkemail(const Value: string): Boolean;
  function CheckAllowed(const s: string): Boolean;
  var
    i: Integer;
  begin
    Result := False;
    for i := 1 to Length(s) do
      if not(s[i] in ['a' .. 'z', 'A' .. 'Z', '0' .. '9', '_', '-', '.']) then
        Exit;
    Result := true;
  end;
var
  i: Integer;
  NamePart, ServerPart: string;
begin
  Result := False;
  i := Pos('@', Value);
  if i = 0 then
    Exit;
  NamePart := Copy(Value, 1, i - 1);
  ServerPart := Copy(Value, i + 1, Length(Value));
  if (Length(NamePart) = 0) or ((Length(ServerPart) < 5)) then
    Exit;
  i := Pos('.', ServerPart);
  if (i = 0) or (i > (Length(ServerPart) - 2)) then
    Exit;
  Result := CheckAllowed(NamePart) and CheckAllowed(ServerPart);
end;

{*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
*  FUNÇÃO Tirar Caracteres
*=*=*=*=*=*=*=*==**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=}
function Rem_(texto: string): string; stdcall;
{Função que serve para nao aceitar caracteres especiais tipo !@#$%^&*()}
const
  _Remove = ':;.,`!@#$%^&*()_+=|\<>?/æ-';
var
  x: Integer;
  cR: String;
begin
  if Length(texto) = 0 then
    Begin
      result := '0';
       Exit;
    End;

  for x := 1 to Length(texto) do Begin
    if Pos(texto[x], _Remove) <> 0 then Begin
       If texto[x] = ',' then begin
          cR := cR + '.'
       end;

    End else Begin
      cR :=  cR + texto[x];
    End;
  End;
  result := cR;

end;
Function CmpNulo(tabela: String; campo: TButtonedEdit ): Boolean;
Var
SQLQuery1, SQLQuery2 : TFdQuery;
cTab      : String;
indice    : integer;
Begin
  SQLQuery1 := TFdQuery.Create(Nil);
  SQLQuery2 := TFdQuery.Create(Nil);

  SQLQuery1.Close;
  SQLQuery1.Connection:= dmEmp.SqlConSis;
  SQLQuery1.Sql.Text  :=  'SELECT TABLE_CATALOG              AS BD '
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
                          +' WHERE COLUMN_NAME  = '+QuotedStr( campo.Name )
                          +' AND TABLE_SCHEMA   = '+QuotedStr( nmSchemaEmp_ );
  SQLQuery1.open;
  if ( Not SQLQuery1.Eof ) and ( SQLQuery1.FieldByName('nulo').value = 'NÃO' )then Begin
        cTab     :=  SQLQuery1.FieldByName('TABELA').Value  ;
        SQLQuery1.Close;
        SQLQuery1.Connection:= dmEmp.SqlConSis;
        SQLQuery1.Sql.Text  :=  'SELECT '
                            +'  a.attname AS atributo, '
                            +'  clf.relname AS tabela_ref, '
                            +'  af.attname AS atributo_ref  '
                            +'  FROM pg_catalog.pg_attribute a  '
                            +'  JOIN pg_catalog.pg_class cl ON (a.attrelid = cl.oid AND cl.relkind = ''r'') '
                            +'  JOIN pg_catalog.pg_namespace n ON (n.oid = cl.relnamespace) '
                            +'  JOIN pg_catalog.pg_constraint ct ON (a.attrelid = ct.conrelid AND '
                            +'       ct.confrelid != 0 AND ct.conkey[1] = a.attnum) '
                            +'  JOIN pg_catalog.pg_class clf ON (ct.confrelid = clf.oid AND clf.relkind = ''r'') '
                            +'  JOIN pg_catalog.pg_namespace nf ON (nf.oid = clf.relnamespace) '
                            +'  JOIN pg_catalog.pg_attribute af ON (af.attrelid = ct.confrelid AND '
                            +'       af.attnum = ct.confkey[1]) '
                            +'  WHERE  cl.relname = '+QuotedStr(cTab)
                            +'  And    a.attname  = '+QuotedStr( campo.Name );
        SQLQuery1.open;

        SQLQuery2.Close;
        SQLQuery2.Connection:= dmEmp.SqlConSis;
        SQLQuery2.Sql.Text  :=  'SELECT * FROM "dbconfig".mdoacesso '
                                +' where mda_formda  = '+QuotedStr( SQLQuery1.FieldByName('tabela_ref').Value );
        SQLQuery2.open;

        ShowMessage('Campo Obrigatório '+ UpperCase( SQLQuery2.FieldByName('mda_titulo').Value ) );
        Result := False;
  End Else begin
        Result := True ;
  End;

  FreeAndNil(SQLQuery1);
  FreeAndNil(SQLQuery2);
End;

Function MD5(const texto:string):string;
var
  idmd5 : TIdHashMessageDigest5;
begin
  idmd5 := TIdHashMessageDigest5.Create;
  try
    result := idmd5.HashStringAsHex(texto);
  finally
    idmd5.Free;
  end;
end;



//Para criptografar um arquivo inteiro use a função abaixo.
function MD5File(const fileName : string) : string;
var
  idmd5 : TIdHashMessageDigest5;
  fs : TFileStream;
begin
  idmd5 := TIdHashMessageDigest5.Create;

  fs := TFileStream.Create(fileName, fmOpenRead OR fmShareDenyWrite) ;
  try
    result := idmd5.HashStreamAsHex(fs);
  finally
    fs.Free;
    idmd5.Free;
  end;
end;


End.
{ pesquiza campos toos os campos

SELECT TABLE_CATALOG              AS BD
     , TABLE_SCHEMA               AS ESQUEMA_TABELA
     , TABLE_NAME                 AS TABELA
     , COLUMN_NAME                AS COLUNA
     , ORDINAL_POSITION           AS ORD_POS
     , DATA_TYPE                  AS TIPO
     , CHARACTER_MAXIMUM_LENGTH   AS TAM_CARACTER
     , DATETIME_PRECISION         AS TAM_DATA
     , NUMERIC_PRECISION          AS TAM_NUMERICO
     , CASE WHEN CHARACTER_MAXIMUM_LENGTH  IS NOT NULL THEN
                CAST(CHARACTER_MAXIMUM_LENGTH AS NUMERIC(16,6))
            WHEN DATETIME_PRECISION IS NOT NULL THEN
                CAST(DATETIME_PRECISION AS NUMERIC(16,6))
            ELSE
                CAST(CAST(NUMERIC_PRECISION AS VARCHAR) || '.' || CAST( NUMERIC_SCALE AS VARCHAR) AS NUMERIC(16,6))
       END                        AS TAM
     , CASE WHEN IS_NULLABLE = 'YES' THEN 'SIM' ELSE 'NÃO'  END  AS NULO
     , COLLATION_NAME             AS COLLATION
     , length(COLUMN_NAME)           AS TAM_NOME_COLUNA
     , length(TABLE_NAME)            AS TAM_NOME_TABELA
  FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'dbconfig'
AND   TABLE_NAME = 'tbpecas'


result

bd	  esquema_tabela	tabela	coluna	    ord_pos	tipo	      tam_caracter	tam_data	tam_numerico	tam	nulo	collation	tam_nome_coluna	tam_nome_tabela
dbsgt	dbconfig	      tbpecas	tpc_codigo	1	      integer			''                      32	          32	NÃO		          10	            7
}
