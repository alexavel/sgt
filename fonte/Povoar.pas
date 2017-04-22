unit Povoar;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ExtCtrls, ImgList, ToolWin, IniFiles,
  dbTables, FMTBcd, DB, SqlExpr, DBXFirebird, StrUtils,StdCtrls,IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  xmldom, XMLIntf, msxmldom, XMLDoc, IdHTTP, Mask, DateUtils, ZDataset, ZConnection, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client ;

  procedure PovoaMarca( Tabela : String );
  procedure PovoaModelo( Tabela : String );
  procedure PovoaCombustivel( Tabela : String );
  procedure PovoaAcessorio( Tabela : String );
  procedure PovoaCargo( Tabela : String );
  procedure PovoaCor( Tabela : String );
  procedure PovoaOrgTran( Tabela : String );
  procedure PovoaNCM( Tabela : String );
  procedure PovoaCFOP( Tabela : String );
  procedure PovoaCST( Tabela : String );
  procedure PovoaMedida( Tabela : String );
  procedure PovoaPais( Tabela : String );
  procedure PovoaUnifed( Tabela : String );
  procedure PovoaServicos( Tabela : String );
  procedure PovoaFamilia( Tabela : String );
  procedure PovoaMServ( Tabela : String );
  procedure AlterSeq(cTab,cPre: String; Conn: TFDConnection);
  procedure PovoaMulta( Tabela : String );
  procedure pneuDim( Tabela : String );
  procedure pneuFab( Tabela : String );
  procedure pais( Tabela : String );
  procedure estado( Tabela : String );
  procedure cidade( Tabela : String );
  procedure Grupomnt( Tabela : String );
  procedure pconta( Tabela : String );
  procedure CTECFG( Tabela : String );

implementation

uses uSistema, U_dmEmp, U_funcao, U_ini,  U_BarraProgresso, U_BarraProgresso2;


//---------------------------------------------------------------------
//FUNÇÃO QUE ALIMENTA NIVEIS DE USUARIOS
//---------------------------------------------------------------------
procedure cidade( Tabela : String );
var
aInss : array of string;
data, hora, Pref: string ;
dD, mM, aA: Word;
datas : TDate;
{-----}
linha, cDiret, cArquivo, Commando : string;
nreg, i, Linhas: integer; nota1, nota2, media: real;
codigo,  nome,  codest,  codpai,  infrat,  local,  pontos,  valor: String;
arq: TextFile;
Lista: TStringList;
SQLE : TFDQuery;
begin
  Pref := 'cid_';
  SQLE := TFDQuery.Create(nIL);

  frmProgresso := TfrmProgresso.Create(nil);
  frmProgresso.Show;

  cDiret  := ExtractFilePath(Application.ExeName);
  cArquivo:= cDiret+'docs\cidade.docs';

  Lista             := TStringList.Create;

  Lista.LoadFromFile(cArquivo);
  Linhas            := Lista.Count;

  frmProgresso.ProgressBar1.Max  := Linhas;
  frmProgresso.lTabela.Caption := 'Tabela: '+cTab2;
  frmProgresso.lTabela.Repaint;

  AssignFile(arq, cArquivo);
  if frmIni <> Nil then Begin
    frmIni.lbInfo.Caption := 'Tabela '+cTab;
    frmIni.lbInfo.Refresh ;
  End;

  Reset(arq); { abre o arquivo texto para leitura }
  nreg := 0;
  while (not Eof(arq)) do{ enquanto não atingir a marca de final de arquivo }
    begin Readln(arq, linha); { lê uma linha, com os dados de um aluno, do arquivo }
      nreg := nreg + 1;
      i := pos('|', linha);
      codigo   := copy(linha, 1, i-1); { recupera o nome do aluno }
      delete(linha, 1, i);

      i := pos('|', linha);
      nome := RemoveAcentos( copy(linha, 1, i-1) ); // recupera a 1a. nota do aluno
      delete(linha, 1, i);

      i := pos('|', linha);
      codest := copy(linha, 1, i-1); // recupera a 1a. nota do aluno
      delete(linha, 1, i);

      i := pos('|', linha);
      codpai := copy(linha, 1, i-1); // recupera a 1a. nota do aluno
      delete(linha, 1, i);
      // Gera a Linha para povoar a tabela
      Commando:= 'insert into '+U_funcao.SelSchema(Tabela)+' (  '+Pref+'cidnum, '+Pref+'nome,  '+Pref+'codest,  '+Pref+'codpai, '+Pref+'UsuInc,  '+Pref+'DatInc,  '+Pref+'HorInc ) '+
                                                    ' values ( :'+Pref+'cidnum, :'+Pref+'nome, :'+Pref+'codest, :'+Pref+'codpai, :'+Pref+'UsuInc, :'+Pref+'DatInc, :'+Pref+'HorInc ) ';


      SQLE.Close;
      SQLE.Connection:= dmEmp.SqlConSis;
      SQLE.SQL.Text  := Commando ;
      SQLE.ParamByName(Pref+'cidnum').AsInteger:= StrToInt( codigo );
      SQLE.ParamByName(Pref+'nome').Text       := nome;
      SQLE.ParamByName(Pref+'codest').AsInteger:= StrToInt(codest);
      SQLE.ParamByName(Pref+'codpai').AsInteger:= StrToInt(codpai);
      SQLE.ParamByName(Pref+'UsuInc').Text     := 'Administrador';
      SQLE.ParamByName(Pref+'DatInc').AsDate   := datas ;
      SQLE.ParamByName(Pref+'HorInc').Text     := TimeToStr(time) ;
      SQLE.ExecSQL;
      frmProgresso.ProgressBar1.Position:= frmProgresso.ProgressBar1.Position + 1;
      frmProgresso.lcontador.Caption := 'Registro(s) '+IntToStr(frmProgresso.ProgressBar1.Position)+'/'+IntToStr(Linhas);
      frmProgresso.lcontador.Repaint;

    end;
    FreeAndNil( SQLE );
    AlterSeq(Tabela,Pref+'codigo',dmEmp.sqlConSis);
    CloseFile(arq);
    frmProgresso.Close;

End;

procedure estado( Tabela : String );
var
aInss : array of string;
data, hora, Pref: string ;
dD, mM, aA: Word;
datas : TDate;
{-----}
linha, cDiret, cArquivo, Commando : string;
nreg, i, Linhas: integer; nota1, nota2, media: real;
codigo,  nome,  uf,  codpai,  infrat,  local,  pontos,  valor: String;
arq: TextFile;
Lista: TStringList;
SQLE : TFDQuery;
begin
  Pref := 'est_';
  SQLE := TFDQuery.Create(nIL);

  frmProgresso := TfrmProgresso.Create(nil);
  frmProgresso.Show;

  cDiret  := ExtractFilePath(Application.ExeName);
  cArquivo:= cDiret+'docs\estado.docs';

  Lista             := TStringList.Create;

  Lista.LoadFromFile(cArquivo);
  Linhas            := Lista.Count;

  frmProgresso.ProgressBar1.Max  := Linhas;
  frmProgresso.lTabela.Caption := 'Tabela: '+cTab2;
  frmProgresso.lTabela.Repaint;

  AssignFile(arq, cArquivo);
  if frmIni <> Nil then Begin
    frmIni.lbInfo.Caption := 'Tabela '+cTab;
    frmIni.lbInfo.Refresh ;
  End;

  Reset(arq); { abre o arquivo texto para leitura }
  nreg := 0;
  while (not Eof(arq)) do{ enquanto não atingir a marca de final de arquivo }
    begin Readln(arq, linha); { lê uma linha, com os dados de um aluno, do arquivo }
      nreg := nreg + 1;
      i := pos('|', linha);
      codigo   := copy(linha, 1, i-1); { recupera o nome do aluno }
      delete(linha, 1, i);

      i := pos('|', linha);
      uf := copy(linha, 1, i-1); // recupera a 1a. nota do aluno
      delete(linha, 1, i);


      i := pos('|', linha);
      nome := copy(linha, 1, i-1); // recupera a 1a. nota do aluno
      delete(linha, 1, i);

      i := pos('|', linha);
      codpai := copy(linha, 1, i-1); // recupera a 1a. nota do aluno
      delete(linha, 1, i);



      // Gera a Linha para povoar a tabela
      Commando:= 'insert into '+U_funcao.SelSchema(Tabela)+' (  '+Pref+'codigo, '+Pref+'nome,  '+Pref+'uf,  '+Pref+'codpai, '+Pref+'UsuInc,  '+Pref+'DatInc,  '+Pref+'HorInc ) '+
                                 ' values ( :'+Pref+'codigo, :'+Pref+'nome, :'+Pref+'uf, :'+Pref+'codpai, :'+Pref+'UsuInc, :'+Pref+'DatInc, :'+Pref+'HorInc ) ';


      SQLE.Close;
      SQLE.Connection:= dmEmp.sqlConSis;
      SQLE.SQL.Text  := Commando ;
      SQLE.ParamByName(Pref+'codigo').AsInteger:= StrToInt( codigo );
      SQLE.ParamByName(Pref+'nome').Text       := nome;
      SQLE.ParamByName(Pref+'uf').Text         := uf;
      SQLE.ParamByName(Pref+'codpai').AsInteger:= StrToInt(codpai);
      SQLE.ParamByName(Pref+'UsuInc').Text     := 'Administrador';
      SQLE.ParamByName(Pref+'DatInc').AsDate   := datas ;
      SQLE.ParamByName(Pref+'HorInc').Text     := TimeToStr(time) ;
      SQLE.ExecSQL;
      frmProgresso.ProgressBar1.Position:= frmProgresso.ProgressBar1.Position + 1;
      frmProgresso.lcontador.Caption := 'Registro(s) '+IntToStr(frmProgresso.ProgressBar1.Position)+'/'+IntToStr(Linhas);
      frmProgresso.lcontador.Repaint;
    end;
    AlterSeq(Tabela,Pref+'codigo',dmEmp.sqlConSis);
    FreeAndNil( SQLE );
    CloseFile(arq);
    frmProgresso.Close;

End;

procedure pais( Tabela : String );
var
aInss : array of string;
data, hora, Pref: string ;
dD, mM, aA: Word;
datas : TDate;
{-----}
linha, cDiret, cArquivo, Commando : string;
nreg, i, Linhas: integer; nota1, nota2, media: real;
codigo,  nome,  ampleg,  gravid,  infrat,  local,  pontos,  valor: String;
arq: TextFile;
Lista: TStringList;
SQLE : TFDQuery;
begin
  Pref := 'pai_';
  SQLE := TFDQuery.Create(nIL);

  frmProgresso := TfrmProgresso.Create(nil);
  frmProgresso.Show;

  cDiret  := ExtractFilePath(Application.ExeName);
  cArquivo:= cDiret+'docs\pais.docs';

  Lista             := TStringList.Create;

  Lista.LoadFromFile(cArquivo);
  Linhas            := Lista.Count;

  frmProgresso.ProgressBar1.Max  := Linhas;
  frmProgresso.lTabela.Caption := 'Tabela: '+cTab2;
  frmProgresso.lTabela.Repaint;

  AssignFile(arq, cArquivo);
  if frmIni <> Nil then Begin
    frmIni.lbInfo.Caption := 'Tabela '+cTab;
    frmIni.lbInfo.Refresh ;
  End;

  Reset(arq); { abre o arquivo texto para leitura }
  nreg := 0;
  while (not Eof(arq)) do{ enquanto não atingir a marca de final de arquivo }
    begin Readln(arq, linha); { lê uma linha, com os dados de um aluno, do arquivo }
      nreg := nreg + 1;
      i := pos('|', linha);
      codigo   := copy(linha, 1, i-1); { recupera o nome do aluno }
      delete(linha, 1, i);

      i := pos('|', linha);
      nome := copy(linha, 1, i-1); // recupera a 1a. nota do aluno
      delete(linha, 1, i);



      // Gera a Linha para povoar a tabela
      Commando:= 'insert into '+U_funcao.SelSchema(Tabela)+' (  '+Pref+'codigo, '+Pref+'nome,  '+Pref+'UsuInc,  '+Pref+'DatInc,  '+Pref+'HorInc ) '+
                                 ' values ( :'+Pref+'codigo, :'+Pref+'nome, :'+Pref+'UsuInc, :'+Pref+'DatInc, :'+Pref+'HorInc ) ';


      SQLE.Close;
      SQLE.Connection:= dmEmp.sqlConSis;
      SQLE.SQL.Text  := Commando ;
      SQLE.ParamByName(Pref+'codigo').AsInteger:= StrToInt( codigo );
      SQLE.ParamByName(Pref+'nome').Text       := nome;
      SQLE.ParamByName(Pref+'UsuInc').Text     := 'Administrador';
      SQLE.ParamByName(Pref+'DatInc').AsDate   := datas ;
      SQLE.ParamByName(Pref+'HorInc').Text     := TimeToStr(time) ;
      SQLE.ExecSQL;
      frmProgresso.ProgressBar1.Position:= frmProgresso.ProgressBar1.Position + 1;
      frmProgresso.lcontador.Caption := 'Registro(s) '+IntToStr(frmProgresso.ProgressBar1.Position)+'/'+IntToStr(Linhas);
      frmProgresso.lcontador.Repaint;
    end;
    AlterSeq(Tabela,Pref+'codigo',dmEmp.sqlConSis);
    FreeAndNil( SQLE );
    CloseFile(arq);
    frmProgresso.Close;

End;

procedure pneuFab( Tabela : String );
var
aInss : array of string;
data, hora, Pref: string ;
dD, mM, aA: Word;
datas : TDate;
{-----}
linha, cDiret, cArquivo, Commando : string;
nreg, i, Linhas: integer; nota1, nota2, media: real;
codigo,  nome,  ampleg,  gravid,  infrat,  local,  pontos,  valor: String;
arq: TextFile;
Lista: TStringList;
SQLE : TFDQuery;
begin
  Pref := 'pfb_';
  SQLE := TFDQuery.Create(nIL);

  frmProgresso := TfrmProgresso.Create(nil);
  frmProgresso.Show;

  cDiret  := ExtractFilePath(Application.ExeName);
  cArquivo:= cDiret+'docs\pneufab.docs';

  Lista             := TStringList.Create;

  Lista.LoadFromFile(cArquivo);
  Linhas            := Lista.Count;

  frmProgresso.ProgressBar1.Max  := Linhas;
  frmProgresso.lTabela.Caption := 'Tabela: '+cTab2;
  frmProgresso.lTabela.Repaint;

  AssignFile(arq, cArquivo);
  if frmIni <> Nil then Begin
    frmIni.lbInfo.Caption := 'Tabela '+cTab;
    frmIni.lbInfo.Refresh ;
  End;

  Reset(arq); { abre o arquivo texto para leitura }
  nreg := 0;
  while (not Eof(arq)) do{ enquanto não atingir a marca de final de arquivo }
    begin Readln(arq, linha); { lê uma linha, com os dados de um aluno, do arquivo }
      nreg := nreg + 1;
      i := pos('|', linha);
      codigo   := copy(linha, 1, i-1); { recupera o nome do aluno }
      delete(linha, 1, i);

      i := pos('|', linha);
      nome := copy(linha, 1, i-1); // recupera a 1a. nota do aluno
      delete(linha, 1, i);



      // Gera a Linha para povoar a tabela
      Commando:= 'insert into '+U_funcao.SelSchema(Tabela)+' (  '+Pref+'nome,  '+Pref+'UsuInc,  '+Pref+'DatInc,  '+Pref+'HorInc ) '+
                                 ' values (:'+Pref+'nome, :'+Pref+'UsuInc, :'+Pref+'DatInc, :'+Pref+'HorInc ) ';


      SQLE.Close;
      SQLE.Connection:= dmEmp.sqlConSis;
      SQLE.SQL.Text  := Commando ;
      SQLE.ParamByName(Pref+'nome').Text       := nome;
      SQLE.ParamByName(Pref+'UsuInc').Text     := 'Administrador';
      SQLE.ParamByName(Pref+'DatInc').AsDate   := datas ;
      SQLE.ParamByName(Pref+'HorInc').Text     := TimeToStr(time) ;
      SQLE.ExecSQL;
      frmProgresso.ProgressBar1.Position:= frmProgresso.ProgressBar1.Position + 1;
      frmProgresso.lcontador.Caption := 'Registro(s) '+IntToStr(frmProgresso.ProgressBar1.Position)+'/'+IntToStr(Linhas);
      frmProgresso.lcontador.Repaint;
    end;
    FreeAndNil( SQLE );
    AlterSeq(Tabela,Pref+'codigo',dmEmp.sqlConSis);
    CloseFile(arq);
    frmProgresso.Close;

End;
procedure Grupomnt( Tabela : String );
var
aInss : array of string;
data, hora, Pref: string ;
dD, mM, aA: Word;
datas : TDate;
{-----}
linha, cDiret, cArquivo, Commando : string;
nreg, i, Linhas: integer; nota1, nota2, media: real;
codigo,  nome,  ampleg,  gravid,  infrat,  local,  pontos,  valor: String;
arq: TextFile;
Lista: TStringList;
SQLE : TFDQuery;
begin
  Pref := 'grm_';
  SQLE := TFDQuery.Create(nIL);

  frmProgresso := TfrmProgresso.Create(nil);
  frmProgresso.Show;

  cDiret  := ExtractFilePath(Application.ExeName);
  cArquivo:= cDiret+'docs\grupomnt.docs';

  Lista             := TStringList.Create;

  Lista.LoadFromFile(cArquivo);
  Linhas            := Lista.Count;

  frmProgresso.ProgressBar1.Max  := Linhas;
  frmProgresso.lTabela.Caption := 'Tabela: '+cTab2;
  frmProgresso.lTabela.Repaint;

  AssignFile(arq, cArquivo);
  if frmIni <> Nil then Begin
    frmIni.lbInfo.Caption := 'Tabela '+cTab;
    frmIni.lbInfo.Refresh ;
  End;

  Reset(arq); { abre o arquivo texto para leitura }
  nreg := 0;
  while (not Eof(arq)) do{ enquanto não atingir a marca de final de arquivo }
    begin Readln(arq, linha); { lê uma linha, com os dados de um aluno, do arquivo }
      nreg := nreg + 1;
      i := pos('|', linha);
      codigo   := copy(linha, 1, i-1); { recupera o nome do aluno }
      delete(linha, 1, i);

      i := pos('|', linha);
      nome := copy(linha, 1, i-1); // recupera a 1a. nota do aluno
      delete(linha, 1, i);



      // Gera a Linha para povoar a tabela
      Commando:= 'insert into '+U_funcao.SelSchema(Tabela)+' (  '+Pref+'codigo, '+Pref+'nome,  '+Pref+'UsuInc,  '+Pref+'DatInc,  '+Pref+'HorInc ) '+
                                 ' values (:'+Pref+'codigo, :'+Pref+'nome, :'+Pref+'UsuInc, :'+Pref+'DatInc, :'+Pref+'HorInc ) ';


      SQLE.Close;
      SQLE.Connection:= dmEmp.sqlConSis;
      SQLE.SQL.Text  := Commando ;
      SQLE.ParamByName(Pref+'codigo').AsInteger:= StrToInt( codigo );
      SQLE.ParamByName(Pref+'nome').Text       := nome;
      SQLE.ParamByName(Pref+'UsuInc').Text     := 'Administrador';
      SQLE.ParamByName(Pref+'DatInc').AsDate   := datas ;
      SQLE.ParamByName(Pref+'HorInc').Text     := TimeToStr(time) ;
      SQLE.ExecSQL;
      frmProgresso.ProgressBar1.Position:= frmProgresso.ProgressBar1.Position + 1;
      frmProgresso.lcontador.Caption := 'Registro(s) '+IntToStr(frmProgresso.ProgressBar1.Position)+'/'+IntToStr(Linhas);
      frmProgresso.lcontador.Repaint;
    end;
    FreeAndNil( SQLE );
    AlterSeq(Tabela,Pref+'codigo',dmEmp.sqlConSis);
    CloseFile(arq);
    frmProgresso.Close;

End;

procedure CTECFG( Tabela : String );
var
aInss : array of string;
data, hora, Pref: string ;
dD, mM, aA: Word;
datas : TDate;
{-----}
linha, cDiret, cArquivo, Commando : string;
nreg, i, Linhas: integer; nota1, nota2, media: real;
codigo,  nome,  ampleg,  gravid,  infrat,  local,  pontos,  valor: String;
arq: TextFile;
Lista: TStringList;
SQLE : TFDQuery;
Camin, Senha, NumSerie, LogoMarca, PathSalvar, UF,
Host, Porta, User, Pass, CNPJ, IE, RazaoSocial, Fantasia, Fone, CEP, Logradouro, Numero, Complemento, Bairro, CodCidade, Cidade, UFEMITE, EMAHost, EMAPort, EMAUser, EMAPass, Assunto, Mensagem: String;
DACTE, FormaEmissao, Ambiente : Integer;
Salvar, Visualizar, SSL : Boolean ;
begin

  Camin       :='';
  Senha       :='' ;
  NumSerie    :='6AB2C13A8EA4F3AA403ADEB1628ADB75';
  DACTE       :=0;
  FormaEmissao:=3;
  LogoMarca   :='C:\Erp\Logo.JPG';
  Salvar      :=True;
  PathSalvar  :='C:\Erp\DFe';
  UF          :='CE';
  Ambiente    :=1;
  Visualizar  :=True;
  Host        :='';
  Porta       :='';
  User        :='';
  Pass        :='';
  CNPJ        :='123.456.789/0001-00';
  IE          :='123.456.789';
  RazaoSocial :='Empresa XYZ';
  Fantasia    :='XYZ';
  Fone        :='16';
  CEP         :='14800';
  Logradouro  :='rua';
  Numero      :='150';
  Complemento :='';
  Bairro      :='centro';
  CodCidade   :='3503208';
  Cidade      :='Araraquara';
  UFEMITE     :='SP';
  EMAHost     :='smtp.provedor.com.br';
  EMAPort     :='25';
  EMAUser     :='email@provedor.com.br';
  EMAPass     :='senhaemail';
  Assunto     :='CT-e';
  SSL         :=False;
  Mensagem    :='536567756520656D20416E65786F206F20584D4C';

  Pref := 'grm_';
  SQLE := TFDQuery.Create(nIL);

  AssignFile(arq, cArquivo);
  if frmIni <> Nil then Begin
    frmIni.lbInfo.Caption := 'Tabela '+cTab;
    frmIni.lbInfo.Refresh ;
  End;


    // Gera a Linha para povoar a tabela
    Commando:= 'insert into '+U_funcao.SelSchema(Tabela)
                                      +' ( cte_caminho,     cte_senha,        cte_dacte,        cte_formaemiss,   cte_logomarca,    '
                                      +'   cte_salvar,      cte_PathSalvar,   cte_uf,           cte_Ambiente,     cte_Visualizar,   '
                                      +'   cte_Host,        cte_Porta,        cte_User,         cte_Pass,         cte_CNPJ,         '
                                      +'   cte_IE,          cte_RazaoSocial,  cte_Fantasia,     cte_Fone,         cte_cep,          '
                                      +'   cte_Logradouro,  cte_Numero,       cte_Complemento,  cte_Bairro,       cte_CodCidade,    '
                                      +'   cte_Cidade,      cte_UFEMITE,      cte_EMAHOST,      cte_EMAPORT,      cte_EMAUSER,      '
                                      +'   cte_EMAPASS,     cte_EMAASSUNTO,   cte_EMAASSL,      cte_Mensagem,     cte_NumSerie,     '
                                      +'   cte_UsuInc,      cte_DatInc,       cte_HorInc )                                                            '
                                      +' values                                                                                     '
                                      +' (:Camin,           :Senha,           :DACTE,           :FormaEmissao,    :LogoMarca,       '
                                      +'  :Salvar,          :PathSalvar,      :UF,              :Ambiente,        :Visualizar,      '
                                      +'  :Host,            :Porta,           :User,            :Pass,            :CNPJ,            '
                                      +'  :IE,              :RazaoSocial,     :Fantasia,        :Fone,            :CEP,             '
                                      +'  :Logradouro,      :Numero,          :Complemento,     :Bairro,          :CodCidade,       '
                                      +'  :Cidade,          :UFEMITE,         :EMAHost,         :EMAPort,         :EMAUser,         '
                                      +'  :EMAPass,         :Assunto,         :SSL,             :Mensagem,        :NumSerie,        '
                                      +'  :UsuInc,          :DatInc,          :HorInc  )                                            ';


    SQLE.Close;
    SQLE.Connection:= dmEmp.sqlConSis;
    SQLE.SQL.Text  := Commando ;
    SQLE.ParamByName('Camin').Text            := Camin ;
    SQLE.ParamByName('Senha').Text            := Senha ;
    SQLE.ParamByName('NumSerie').Text         := NumSerie ;
    SQLE.ParamByName('DACTE').AsInteger       := DACTE;
    SQLE.ParamByName('FormaEmissao').AsInteger:= FormaEmissao ;
    SQLE.ParamByName('LogoMarca').Text        := LogoMarca ;
    SQLE.ParamByName('Salvar').AsBoolean      := Salvar ;
    SQLE.ParamByName('PathSalvar').Text       := PathSalvar ;
    SQLE.ParamByName('UF').Text               := UF ;
    SQLE.ParamByName('Ambiente').AsInteger    := Ambiente ;
    SQLE.ParamByName('Visualizar').AsBoolean  := Visualizar ;
    SQLE.ParamByName('Host').Text             := Host ;
    SQLE.ParamByName('Porta').Text            := Porta ;
    SQLE.ParamByName('User').Text             := User ;
    SQLE.ParamByName('Pass').Text             := Pass ;
    SQLE.ParamByName('CNPJ').Text             := CNPJ ;
    SQLE.ParamByName('IE').Text               := IE ;
    SQLE.ParamByName('RazaoSocial').Text      := RazaoSocial ;
    SQLE.ParamByName('Fantasia').Text         := Fantasia ;
    SQLE.ParamByName('Fone').Text             := Fone ;
    SQLE.ParamByName('CEP').Text              := CEP  ;
    SQLE.ParamByName('Logradouro').Text       := Logradouro ;
    SQLE.ParamByName('Numero').Text           := Numero     ;
    SQLE.ParamByName('Complemento').Text      := Complemento;
    SQLE.ParamByName('Bairro').Text           := Bairro     ;
    SQLE.ParamByName('CodCidade').Text        := CodCidade  ;
    SQLE.ParamByName('Cidade').Text           := Cidade     ;
    SQLE.ParamByName('UFEMITE').Text          := UFEMITE    ;
    SQLE.ParamByName('EMAHost').Text          := EMAHost    ;
    SQLE.ParamByName('EMAPort').Text          := EMAPort    ;
    SQLE.ParamByName('EMAUser').Text          := EMAUser    ;
    SQLE.ParamByName('EMAPass').Text          := EMAPass    ;
    SQLE.ParamByName('Assunto').Text          := Assunto    ;
    SQLE.ParamByName('SSL').AsBoolean         := SSL;
    SQLE.ParamByName('Mensagem').Text         := Mensagem;
    SQLE.ParamByName('UsuInc').Text           := 'Administrador';
    SQLE.ParamByName('DatInc').AsDate         := datas ;
    SQLE.ParamByName('HorInc').Text           := TimeToStr(time) ;
    SQLE.ExecSQL;

    FreeAndNil(SQLE);

End;


procedure pconta( Tabela : String );
var
aInss : array of string;
data, hora, Pref: string ;
dD, mM, aA: Word;
datas : TDate;
{-----}
linha, cDiret, cArquivo, Commando : string;
nreg, i, Linhas: integer; nota1, nota2, media: real;
codigo,  nome,  ampleg,  gravid,  infrat,  local,  pontos,  valor, cntmae, natureza, tipo, limite, meta: String;
arq: TextFile;
Lista: TStringList;
SQLE : TFDQuery;
begin
  Pref := 'pct_';
  SQLE := TFDQuery.Create(nIL);

  frmProgresso := TfrmProgresso.Create(nil);
  frmProgresso.Show;

  cDiret  := ExtractFilePath(Application.ExeName);
  cArquivo:= cDiret+'docs\pconta.docs';

  Lista             := TStringList.Create;

  Lista.LoadFromFile(cArquivo);
  Linhas            := Lista.Count;

  frmProgresso.ProgressBar1.Max  := Linhas;
  frmProgresso.lTabela.Caption := 'Tabela: '+cTab2;
  frmProgresso.lTabela.Repaint;

  AssignFile(arq, cArquivo);
  if frmIni <> Nil then Begin
    frmIni.lbInfo.Caption := 'Tabela '+cTab;
    frmIni.lbInfo.Refresh ;
  End;

  Reset(arq); { abre o arquivo texto para leitura }
  nreg := 0;
  while (not Eof(arq)) do{ enquanto não atingir a marca de final de arquivo }
    begin Readln(arq, linha); { lê uma linha, com os dados de um aluno, do arquivo }
      nreg := nreg + 1;
      i := pos('|', linha);
      codigo   := copy(linha, 1, i-1); { recupera o nome do aluno }
      delete(linha, 1, i);

      i := pos('|', linha);
      cntmae   := copy(linha, 1, i-1); { recupera o nome do aluno }
      delete(linha, 1, i);

      i := pos('|', linha);
      nome := copy(linha, 1, i-1); // recupera a 1a. nota do aluno
      delete(linha, 1, i);

      i := pos('|', linha);
      natureza   := copy(linha, 1, i-1); { recupera o nome do aluno }
      delete(linha, 1, i);

      i := pos('|', linha);
      tipo   := copy(linha, 1, i-1); { recupera o nome do aluno }
      delete(linha, 1, i);

      i := pos('|', linha);
      limite   := copy(linha, 1, i-1); { recupera o nome do aluno }
      delete(linha, 1, i);

      i := pos('|', linha);
      meta   := copy(linha, 1, i-1); { recupera o nome do aluno }
      delete(linha, 1, i);

      // Gera a Linha para povoar a tabela
      Commando:= 'insert into '+U_funcao.SelSchema(Tabela)+' (  '+Pref+'codigo, '+Pref+'nome, '+Pref+'cntmae,  '+Pref+'natureza,  '+Pref+'tipo,  '+Pref+'limite,  '+Pref+'meta, '+Pref+'UsuInc,  '+Pref+'DatInc,  '+Pref+'HorInc ) '+
                                 ' values (:'+Pref+'codigo, :'+Pref+'nome, :'+Pref+'cntmae,  :'+Pref+'natureza,  :'+Pref+'tipo,  :'+Pref+'limite,  :'+Pref+'meta,  :'+Pref+'UsuInc, :'+Pref+'DatInc, :'+Pref+'HorInc ) ';

      SQLE.Close;
      SQLE.Connection:= dmEmp.sqlConSis;
      SQLE.SQL.Text  := Commando ;
      SQLE.ParamByName(Pref+'codigo').AsInteger:= StrToInt( codigo );
      SQLE.ParamByName(Pref+'nome').Text       := nome;
      SQLE.ParamByName(Pref+'cntmae').Text     := cntmae;
      SQLE.ParamByName(Pref+'natureza').Text   := natureza;
      SQLE.ParamByName(Pref+'tipo').Text       := tipo;
      SQLE.ParamByName(Pref+'limite').AsFloat  := 0;
      SQLE.ParamByName(Pref+'meta').AsFloat    := 0;
      SQLE.ParamByName(Pref+'UsuInc').Text     := 'Administrador';
      SQLE.ParamByName(Pref+'DatInc').AsDate   := datas ;
      SQLE.ParamByName(Pref+'HorInc').Text     := TimeToStr(time) ;
      SQLE.ExecSQL;
      frmProgresso.ProgressBar1.Position:= frmProgresso.ProgressBar1.Position + 1;
      frmProgresso.lcontador.Caption := 'Registro(s) '+IntToStr(frmProgresso.ProgressBar1.Position)+'/'+IntToStr(Linhas);
      frmProgresso.lcontador.Repaint;
    end;
    FreeAndNil( SQLE );
    //AlterSeq(Tabela,Pref+'codigo',dmEmp.sqlConSis);
    CloseFile(arq);
    frmProgresso.Close;

End;


procedure pneuDim( Tabela : String );
var
aInss : array of string;
data, hora, Pref: string ;
dD, mM, aA: Word;
datas : TDate;
{-----}
linha, cDiret, cArquivo, Commando : string;
nreg, i, Linhas: integer; nota1, nota2, media: real;
codigo,  nome,  ampleg,  gravid,  infrat,  local,  pontos,  valor: String;
arq: TextFile;
Lista: TStringList;
SQLE : TFDQuery;
begin
  Pref := 'pdm_';
  SQLE := TFDQuery.Create(nIL);

  frmProgresso := TfrmProgresso.Create(nil);
  frmProgresso.Show;

  cDiret  := ExtractFilePath(Application.ExeName);
  cArquivo:= cDiret+'docs\pneudim.docs';

  Lista             := TStringList.Create;

  Lista.LoadFromFile(cArquivo);
  Linhas            := Lista.Count;

  frmProgresso.ProgressBar1.Max  := Linhas;
  frmProgresso.lTabela.Caption := 'Tabela: '+cTab2;
  frmProgresso.lTabela.Repaint;

  AssignFile(arq, cArquivo);
  if frmIni <> Nil then Begin
    frmIni.lbInfo.Caption := 'Tabela '+cTab;
    frmIni.lbInfo.Refresh ;
  End;

  Reset(arq); { abre o arquivo texto para leitura }
  nreg := 0;
  while (not Eof(arq)) do{ enquanto não atingir a marca de final de arquivo }
    begin Readln(arq, linha); { lê uma linha, com os dados de um aluno, do arquivo }
      nreg := nreg + 1;
      i := pos('|', linha);
      codigo   := copy(linha, 1, i-1); { recupera o nome do aluno }
      delete(linha, 1, i);

      i := pos('|', linha);
      nome := copy(linha, 1, i-1); // recupera a 1a. nota do aluno
      delete(linha, 1, i);



      // Gera a Linha para povoar a tabela
      Commando:= 'insert into '+U_funcao.SelSchema(Tabela)+' (  '+Pref+'nome,  '+Pref+'UsuInc,  '+Pref+'DatInc,  '+Pref+'HorInc ) '+
                                 ' values (:'+Pref+'nome, :'+Pref+'UsuInc, :'+Pref+'DatInc, :'+Pref+'HorInc ) ';


      SQLE.Close;
      SQLE.Connection:= dmEmp.sqlConSis;
      SQLE.SQL.Text  := Commando ;
      SQLE.ParamByName(Pref+'nome').Text       := nome;
      SQLE.ParamByName(Pref+'UsuInc').Text     := 'Administrador';
      SQLE.ParamByName(Pref+'DatInc').AsDate   := datas ;
      SQLE.ParamByName(Pref+'HorInc').Text     := TimeToStr(time) ;
      SQLE.ExecSQL;
      frmProgresso.ProgressBar1.Position:= frmProgresso.ProgressBar1.Position + 1;
      frmProgresso.lcontador.Caption := 'Registro(s) '+IntToStr(frmProgresso.ProgressBar1.Position)+'/'+IntToStr(Linhas);
      frmProgresso.lcontador.Repaint;
    end;
    FreeAndNil( SQLE );
    AlterSeq(Tabela,Pref+'codigo',dmEmp.sqlConSis);
    CloseFile(arq);
    frmProgresso.Close;

End;


procedure PovoaMulta( Tabela : String );
var
aInss : array of string;
data, hora, Pref: string ;
dD, mM, aA: Word;
datas : TDate;
{-----}
linha, cDiret, cArquivo, Commando : string;
nreg, i, Linhas: integer; nota1, nota2, media: real;
codigo,  nome,  ampleg,  gravid,  infrat,  local,  pontos,  valor: String;
arq: TextFile;
Lista: TStringList;
SQLE : TFDQuery;
begin
  Pref := 'tmt_';
  SQLE := TFDQuery.Create(nIL);

  frmProgresso := TfrmProgresso.Create(nil);
  frmProgresso.Show;

  cDiret  := ExtractFilePath(Application.ExeName);
  cArquivo:= cDiret+'docs\tabmultas.docs';

  Lista             := TStringList.Create;

  Lista.LoadFromFile(cArquivo);
  Linhas            := Lista.Count;

  frmProgresso.ProgressBar1.Max  := Linhas;
  frmProgresso.lTabela.Caption := 'Tabela: '+cTab2;
  frmProgresso.lTabela.Repaint;

  AssignFile(arq, cArquivo);
  if frmIni <> Nil then Begin
    frmIni.lbInfo.Caption := 'Tabela '+cTab;
    frmIni.lbInfo.Refresh ;
  End;

  Reset(arq); { abre o arquivo texto para leitura }
  nreg := 0;
  while (not Eof(arq)) do{ enquanto não atingir a marca de final de arquivo }
    begin Readln(arq, linha); { lê uma linha, com os dados de um aluno, do arquivo }
      nreg := nreg + 1;
      i := pos('|', linha);
      codigo   := copy(linha, 1, i-1); { recupera o nome do aluno }
      delete(linha, 1, i);

      i := pos('|', linha);
      nome := copy(linha, 1, i-1); // recupera a 1a. nota do aluno
      delete(linha, 1, i);

      i := pos('|', linha);
      ampleg := copy(linha, 1, i-1); // recupera a 1a. nota do aluno
      delete(linha, 1, i);

      i := pos('|', linha);
      gravid := copy(linha, 1, i-1); // recupera a 1a. nota do aluno
      delete(linha, 1, i);

      i := pos('|', linha);
      infrat := copy(linha, 1, i-1); // recupera a 1a. nota do aluno
      delete(linha, 1, i);

      i := pos('|', linha);
      local := copy(linha, 1, i-1); // recupera a 1a. nota do aluno
      delete(linha, 1, i);

      i := pos('|', linha);
      pontos := copy(linha, 1, i-1); // recupera a 1a. nota do aluno
      delete(linha, 1, i);

      i := pos('|', linha);
      valor := copy(linha, 1, i-1); // recupera a 1a. nota do aluno
      delete(linha, 1, i);


      // Gera a Linha para povoar a tabela
      Commando:= 'insert into '+U_funcao.SelSchema(Tabela)+' (  tmt_codigo,  tmt_nome,  tmt_ampleg,  tmt_gravid,  tmt_infrat,  tmt_local,  tmt_nmrpts,  tmt_vlrmul,  tmt_UsuInc,  tmt_DatInc,  tmt_HorInc ) '+
                                                    ' values ( :tmt_codigo, :tmt_nome, :tmt_ampleg, :tmt_gravid, :tmt_infrat, :tmt_local, :tmt_pontos, :tmt_valor, :tmt_UsuInc, :tmt_DatInc, :tmt_HorInc ) ';


      SQLE.Close;
      SQLE.Connection:= dmEmp.sqlConSis;
      SQLE.SQL.Text  := Commando ;
      SQLE.ParamByName('tmt_codigo').AsInteger:= StrToInt( RetNumero(codigo) ) ;
      SQLE.ParamByName('tmt_nome').Text       := nome;
      SQLE.ParamByName('tmt_ampleg').Text     := ampleg;
      SQLE.ParamByName('tmt_gravid').Text     := gravid;
      SQLE.ParamByName('tmt_infrat').Text     := infrat;
      SQLE.ParamByName('tmt_local').Text      := local;
      SQLE.ParamByName('tmt_pontos').AsInteger:= FormataNumInt( pontos );
      SQLE.ParamByName('tmt_valor').AsFloat   := StrToFloat( StringReplace(valor, '.', ',', [rfReplaceAll, rfIgnoreCase] ) );
      SQLE.ParamByName('tmt_UsuInc').Text     := 'Administrador';
      SQLE.ParamByName('tmt_DatInc').AsDate   := datas ;
      SQLE.ParamByName('tmt_HorInc').Text     := TimeToStr(time) ;
      SQLE.ExecSQL;
      frmProgresso.ProgressBar1.Position:= frmProgresso.ProgressBar1.Position + 1;
      frmProgresso.lcontador.Caption := 'Registro(s) '+IntToStr(frmProgresso.ProgressBar1.Position)+'/'+IntToStr(Linhas);
      frmProgresso.lcontador.Repaint;
    end;
    //AlterSeq(Tabela,Pref+'codigo',dmEmp.sqlConSis);
    FreeAndNil( SQLE );
    CloseFile(arq);
    frmProgresso.Close;

End;


procedure PovoaMServ( Tabela : String );
var
aInss : array of string;
data, hora, Pref: string ;
dD, mM, aA: Word;
datas : TDate;
{-----}
linha, cod, nome, sigla, pais, cDiret, cArquivo, Commando : string;
nreg, i, Linhas: integer; nota1, nota2, media: real;
arq: TextFile;
Lista: TStringList;
SQLQ, SQLP, SQLE : TFDQuery;



begin
  Pref:='svr_';
  frmProgd := TfrmProgd.Create(nil);
  frmProgd.Show;

  // Pega os Serviços cadastrados na Tabela
  SQLQ := TFDQuery.Create(Nil) ;
  SQLE := TFDQuery.Create(Nil) ;
  with SQLQ do  begin
        Close;
        Connection:= dmEmp.sqlConSis;
        SQL.Text  :='SELECT * FROM '+nmSchemaEmp+'tabserv order by tbs_codtbs';
        Open;
   end;

  frmProgd.ProgressBar1.Max  := SQLQ.RecordCount;
  frmProgd.lTabela.Caption := 'Consultando Tabela de Serviços... ';
  frmProgd.lTabela.Repaint;

   SQLQ.First;
   while (not (SQLQ.EOF)) do begin
          frmProgd.ProgressBar1.Position:= frmProgd.ProgressBar1.Position + 1;
          frmProgd.lcontador.Caption := 'Consultando Serviços '+IntToStr(frmProgd.ProgressBar1.Position)+'/'+IntToStr(SQLQ.RecordCount);
          frmProgd.lcontador.Repaint;


          // Pega os Modelos
          SQLP := TFDQuery.Create(Nil) ;
          with SQLP do  begin
                Close;
                Connection:= dmEmp.sqlConSis;
                SQL.Text  :='SELECT * FROM '+nmSchemaEmp+'modelo order by mdl_codmdl';
                Open;
           end;
          frmProgd.ProgressBar2.Max  := SQLP.RecordCount;
          frmProgd.ProgressBar2.Position:= 0;
          frmProgd.lTabela.Caption := 'Tabala: '+Tabela;
          frmProgd.lTabela.Repaint;


           SQLP.First;
           while (not (SQLP.EOF)) do begin
              // Gera a Linha para povoar a tabela
              Commando:= 'insert into '+U_funcao.SelSchema(Tabela)+' (srv_codigo, srv_codmdl, srv_codmrc,  srv_UsuInc,      srv_DatInc, srv_HorInc )'+
                                    '     values ( '+ SQLQ.FieldByName('tbs_codtbs').Text+', '+
                                                      QuotedStr(SQLP.FieldByName('mdl_codmdl').Text)+', '+
                                                      QuotedStr(SQLP.FieldByName('mdl_codmrc').Text)+', ''administrador'', :DatInc,    :HorInc )';

              //ShowMessage(Commando);
              SQLE.Close;
              SQLE.Connection:= dmEmp.sqlConSis;
              SQLE.SQL.Text  := Commando ;
              SQLE.ParamByName('DatInc').AsDate  :=  datas ;
              SQLE.ParamByName('HorInc').Text    :=  TimeToStr(time) ;
              SQLE.ExecSQL;


              frmProgd.ProgressBar2.Position:= frmProgd.ProgressBar2.Position + 1;
              frmProgd.lsubcontador.Caption := 'Registrando '+IntToStr(frmProgd.ProgressBar2.Position)+'/'+IntToStr(SQLP.RecordCount);
              frmProgd.lsubcontador.Repaint;

               SQLP.Next;
           end;
           SQLP.Close;

      SQLQ.Next;
   end;
   FreeAndNil( SQLE );
   SQLQ.Close;
   AlterSeq(Tabela,Pref+'codigo',dmEmp.sqlConSis);

   frmProgresso.Close;

End;

procedure PovoaFamilia( Tabela : String );
var
aInss : array of string;
data, hora, Pref: string ;
dD, mM, aA: Word;
datas : TDate;
{-----}
linha, cod, nome, sigla, pais, cDiret, cArquivo, Commando : string;
nreg, i, Linhas: integer; nota1, nota2, media: real;
arq: TextFile;
Lista: TStringList;
SQLE : TFDQuery;
begin
  Pref := 'fml_';
  SQLE := TFDQuery.Create(nIL);
  frmProgresso := TfrmProgresso.Create(nil);
  frmProgresso.Show;

  cDiret  := ExtractFilePath(Application.ExeName);
  cArquivo:= cDiret+'docs\familia.docs';

  Lista             := TStringList.Create;

  Lista.LoadFromFile(cArquivo);
  Linhas            := Lista.Count;

  frmProgresso.ProgressBar1.Max  := Linhas;
  frmProgresso.lTabela.Caption := 'Tabala: '+Tabela;
  frmProgresso.lTabela.Repaint;

  AssignFile(arq, cArquivo);
  if frmIni <> Nil then Begin
    frmIni.lbInfo.Caption := 'Tabela '+cTab;
    frmIni.lbInfo.Refresh ;
  End;

  Reset(arq); { abre o arquivo texto para leitura }
  nreg := 0;
  while (not Eof(arq)) do{ enquanto não atingir a marca de final de arquivo }
    begin Readln(arq, linha); { lê uma linha, com os dados de um aluno, do arquivo }
      nreg := nreg + 1;

      i := pos('|', linha);
      cod   := copy(linha, 1, i-1); { recupera o nome do aluno }
      delete(linha, 1, i);

      i := pos('|', linha);
      nome := copy(linha, 1, i-1); // recupera a 1a. nota do aluno
      delete(linha, 1, i);

      // Gera a Linha para povoar a tabela
      Commando:= 'insert into  '+U_funcao.SelSchema(Tabela)+' (fml_codigo, fml_nome,  fml_UsuInc,      fml_DatInc, fml_HorInc )'+
                            'values ( '+cod+', '''+nome+''', ''administrador'', :DatInc,    :HorInc )';

      //ShowMessage(Commando);
      SQLE.Close;
      SQLE.Connection:= dmEmp.sqlConSis;
      SQLE.SQL.Text  := Commando ;
      SQLE.ParamByName('DatInc').AsDate  :=  datas ;
      SQLE.ParamByName('HorInc').Text    :=  TimeToStr(time) ;
      SQLE.ExecSQL;
      frmProgresso.ProgressBar1.Position:= frmProgresso.ProgressBar1.Position + 1;
      frmProgresso.lcontador.Caption := 'Registro(s) '+IntToStr(frmProgresso.ProgressBar1.Position)+'/'+IntToStr(Linhas);
      frmProgresso.lcontador.Repaint;
    end;
    AlterSeq(Tabela,Pref+'codigo',dmEmp.sqlConSis);
    FreeAndNil( SQLE );
    CloseFile(arq);
    frmProgresso.Close;

End;


procedure PovoaServicos( Tabela : String );
var
aInss : array of string;
data, hora,pref: string ;
dD, mM, aA: Word;
datas : TDate;
{-----}
linha, cod, nome, sigla, cod2, cDiret, cArquivo, Commando : string;
nreg, i, Linhas: integer; nota1, nota2, media: real;
arq: TextFile;
Lista: TStringList;
SQLE : TFDQuery;
begin
  Pref := 'tbs_';
  SQLE := TFDQuery.Create(nIL);

  frmProgresso := TfrmProgresso.Create(nil);
  frmProgresso.Show;

  cDiret  := ExtractFilePath(Application.ExeName);
  cArquivo:= cDiret+'docs\tabserv.docs';

  Lista             := TStringList.Create;

  Lista.LoadFromFile(cArquivo);
  Linhas            := Lista.Count;

  frmProgresso.ProgressBar1.Max  := Linhas;
  frmProgresso.lTabela.Caption := 'Tabela: '+cTab2;
  frmProgresso.lTabela.Repaint;

  AssignFile(arq, cArquivo);
  if frmIni <> Nil then Begin
    frmIni.lbInfo.Caption := 'Tabela '+cTab;
    frmIni.lbInfo.Refresh ;
  End;

  Reset(arq); { abre o arquivo texto para leitura }
  nreg := 0;
  while (not Eof(arq)) do{ enquanto não atingir a marca de final de arquivo }
    begin Readln(arq, linha); { lê uma linha, com os dados de um aluno, do arquivo }
      nreg := nreg + 1;
      i := pos('|', linha);
      cod   := copy(linha, 1, i-1); { recupera o nome do aluno }
      delete(linha, 1, i);

      i := pos('|', linha);
      nome := copy(linha, 1, i-1); // recupera a 1a. nota do aluno
      delete(linha, 1, i);

      i := pos('|', linha);
      sigla := copy(linha, 1, i-1); // recupera a 1a. nota do aluno
      delete(linha, 1, i);

      i := pos('|', linha);
      cod2 := copy(linha, 1, i-1); // recupera a 1a. nota do aluno
      delete(linha, 1, i);


      // Gera a Linha para povoar a tabela
      Commando:= 'insert into  '+U_funcao.SelSchema(Tabela)+' (tbs_codigo, tbs_nome, tbs_proced, tbs_codfml,  tbs_UsuInc,      tbs_DatInc, tbs_HorInc )'+
                            'values ( '+QuotedStr(cod)+', '+QuotedStr(nome)+', '+QuotedStr(sigla)+', '+QuotedStr(cod2)+', ''administrador'', :DatInc,    :HorInc )';

      //ShowMessage(Commando);
      SQLE.Close;
      SQLE.Connection:= dmEmp.sqlConSis;
      SQLE.SQL.Text  := Commando ;
      SQLE.ParamByName('DatInc').AsDate  :=  datas ;
      SQLE.ParamByName('HorInc').Text    :=  TimeToStr(time) ;
      SQLE.ExecSQL;
      frmProgresso.ProgressBar1.Position:= frmProgresso.ProgressBar1.Position + 1;
      frmProgresso.lcontador.Caption := 'Registro(s) '+IntToStr(frmProgresso.ProgressBar1.Position)+'/'+IntToStr(Linhas);
      frmProgresso.lcontador.Repaint;
    end;
    FreeAndNil( SQLE );
    AlterSeq(Tabela,Pref+'codigo',dmEmp.sqlConSis);
    CloseFile(arq);
    frmProgresso.Close;

End;


procedure PovoaUnifed( Tabela : String );
var
aInss : array of string;
data, hora, Pref: string ;
dD, mM, aA: Word;
datas : TDate;
{-----}
linha, cod, nome, sigla, pais, cDiret, cArquivo, Commando : string;
nreg, i, Linhas: integer; nota1, nota2, media: real;
arq: TextFile;
Lista: TStringList;
SQLE : TFDQuery;
begin
  Pref :='ufd_';
  SQLE := TFDQuery.Create(nIL);

  frmProgresso := TfrmProgresso.Create(nil);
  frmProgresso.Show;

  cDiret  := ExtractFilePath(Application.ExeName);
  cArquivo:= cDiret+'docs\uf.docs';

  Lista             := TStringList.Create;

  Lista.LoadFromFile(cArquivo);
  Linhas            := Lista.Count;

  frmProgresso.ProgressBar1.Max  := Linhas;
  frmProgresso.lTabela.Caption := 'Tabela: '+cTab2;
  frmProgresso.lTabela.Repaint;

  AssignFile(arq, cArquivo);
  if frmIni <> Nil then Begin
    frmIni.lbInfo.Caption := 'Tabela '+cTab;
    frmIni.lbInfo.Refresh ;
  End;

  Reset(arq); { abre o arquivo texto para leitura }
  nreg := 0;
  while (not Eof(arq)) do{ enquanto não atingir a marca de final de arquivo }
    begin Readln(arq, linha); { lê uma linha, com os dados de um aluno, do arquivo }
      nreg := nreg + 1;
      i := pos('|', linha);
      cod   := copy(linha, 1, i-1); { recupera o nome do aluno }
      delete(linha, 1, i);

      i := pos('|', linha);
      nome := copy(linha, 1, i-1); // recupera a 1a. nota do aluno
      delete(linha, 1, i);

      i := pos('|', linha);
      sigla := copy(linha, 1, i-1); //recupera a 2a. nota do aluno
      delete(linha, 1, i);

      i := pos('|', linha);
      pais := copy(linha, 1, i-1); //recupera a 2a. nota do aluno
      delete(linha, 1, i);


      // Gera a Linha para povoar a tabela
      Commando:= 'insert into '+U_funcao.SelSchema(Tabela)+' (ufd_codigo, ufd_nome,  ufd_sigla,  ufd_codpai,    ufd_UsuInc,      ufd_DatInc, ufd_HorInc )'+
                            'values (  '+cod+' , '''+nome+''',  '''+sigla+''',  '+pais+',  ''administrador'', :DatInc,    :HorInc )';

      //ShowMessage(Commando);
      SQLE.Close;
      SQLE.Connection:= dmEmp.sqlConSis;
      SQLE.SQL.Text  := Commando ;
      SQLE.ParamByName('DatInc').AsDate  :=  datas ;
      SQLE.ParamByName('HorInc').Text    :=  TimeToStr(time) ;
      SQLE.ExecSQL;
      frmProgresso.ProgressBar1.Position:= frmProgresso.ProgressBar1.Position + 1;
      frmProgresso.lcontador.Caption := 'Registro(s) '+IntToStr(frmProgresso.ProgressBar1.Position)+'/'+IntToStr(Linhas);
      frmProgresso.lcontador.Repaint;
    end;
    FreeAndNil( SQLE );
    AlterSeq(Tabela,Pref+'codigo',dmEmp.sqlConSis);
    CloseFile(arq);
    frmProgresso.Close;

End;


procedure PovoaPais( Tabela : String );
var
aInss : array of string;
data, hora, Pref: string ;
dD, mM, aA: Word;
datas : TDate;
{-----}
linha, cod, nome, cDiret, cArquivo, Commando : string;
nreg, i, Linhas: integer; nota1, nota2, media: real;
arq: TextFile;
Lista: TStringList;
SQLE : TFDQuery;
begin
  Pref := 'pai_';
  SQLE := TFDQuery.Create(nIL);

  frmProgresso := TfrmProgresso.Create(nil);
  frmProgresso.Show;

  cDiret  := ExtractFilePath(Application.ExeName);
  cArquivo:= cDiret+'docs\pais.docs';

  Lista             := TStringList.Create;

  Lista.LoadFromFile(cArquivo);
  Linhas            := Lista.Count;

  frmProgresso.ProgressBar1.Max  := Linhas;
  frmProgresso.lTabela.Caption := 'Tabela: '+cTab2;
  frmProgresso.lTabela.Repaint;

  AssignFile(arq, cArquivo);
  if frmIni <> Nil then Begin
    frmIni.lbInfo.Caption := 'Tabela '+cTab;
    frmIni.lbInfo.Refresh ;
  End;

  Reset(arq); { abre o arquivo texto para leitura }
  nreg := 0;
  while (not Eof(arq)) do{ enquanto não atingir a marca de final de arquivo }
    begin Readln(arq, linha); { lê uma linha, com os dados de um aluno, do arquivo }
      nreg := nreg + 1;
      i := pos('|', linha);
      cod   := copy(linha, 1, i-1); { recupera o nome do aluno }
      delete(linha, 1, i);

      i := pos('|', linha);
      nome := copy(linha, 1, i-1); // recupera a 1a. nota do aluno
      delete(linha, 1, i);
     {
      i := pos('|', linha);
      nota2 := StrToFloat(copy(linha, 1, i-1)); //recupera a 2a. nota do aluno
      }
      // Gera a Linha para povoar a tabela
      Commando:= 'insert into '+Tabela+' (pai_codigo, pai_nome,        pai_UsuInc,      pai_DatInc, pai_HorInc )'+
                            'values (  '+cod+' , '''+nome+''', ''administrador'', :DatInc,    :HorInc )';


      SQLE.Close;
      SQLE.Connection:= dmEmp.sqlConSis;
      SQLE.SQL.Text  := Commando ;
      SQLE.ParamByName('DatInc').AsDate  :=  datas ;
      SQLE.ParamByName('HorInc').Text    :=  TimeToStr(time) ;
      SQLE.ExecSQL;
      frmProgresso.ProgressBar1.Position:= frmProgresso.ProgressBar1.Position + 1;
      frmProgresso.lcontador.Caption := 'Registro(s) '+IntToStr(frmProgresso.ProgressBar1.Position)+'/'+IntToStr(Linhas);
      frmProgresso.lcontador.Repaint;
    end;
    FreeAndNil( SQLE );
    //AlterSeq(Tabela,Pref+'codigo',dmEmp.sqlConSis);
    CloseFile(arq);
    frmProgresso.Close;

End;

procedure PovoaMarca( Tabela : String );
var
aInss : array of string;
data, hora: string ;
dD, mM, aA: Word;
datas : TDate;
{-----}
linha, cod, marca, cDiret, cArquivo, Commando : string;
nreg, i, Linhas: integer; nota1, nota2, media: real;
arq: TextFile;
Lista: TStringList;
SQLE : TFDQuery;
begin
  SQLE := TFDQuery.Create(nIL);

  frmProgresso := TfrmProgresso.Create(nil);
  frmProgresso.Show;

  cDiret  := ExtractFilePath(Application.ExeName);
  cArquivo:= cDiret+'docs\marca.docs';

  Lista             := TStringList.Create;

  Lista.LoadFromFile(cArquivo);
  Linhas            := Lista.Count;

  frmProgresso.ProgressBar1.Max  := Linhas;
  frmProgresso.lTabela.Caption := 'Tabela: '+cTab2;
  frmProgresso.lTabela.Repaint;

  AssignFile(arq, cArquivo);
  if frmIni <> Nil then Begin
    frmIni.lbInfo.Caption := 'Tabela '+cTab;
    frmIni.lbInfo.Refresh ;
  End;

  Reset(arq); { abre o arquivo texto para leitura }
  nreg := 0;
  while (not Eof(arq)) do{ enquanto não atingir a marca de final de arquivo }
    begin Readln(arq, linha); { lê uma linha, com os dados de um aluno, do arquivo }
      nreg := nreg + 1;
      i := pos('|', linha);
      cod   := copy(linha, 1, i-1); { recupera o nome do aluno }
      delete(linha, 1, i);

      i := pos('|', linha);
      marca := copy(linha, 1, i-1); // recupera a 1a. nota do aluno
      delete(linha, 1, i);
     {
      i := pos('|', linha);
      nota2 := StrToFloat(copy(linha, 1, i-1)); //recupera a 2a. nota do aluno
      }
      // Gera a Linha para povoar a tabela
      Commando:= 'insert into '+U_funcao.SelSchema(Tabela)+' (mrc_codigo, mrc_nome,        mrc_UsuInc,      mrc_DatInc, mrc_HorInc )'+
                            'values (  '+cod+' , '''+marca+''', ''administrador'', :DatInc,    :HorInc )';


      SQLE.Close;
      SQLE.Connection:= dmEmp.sqlConSis;
      SQLE.SQL.Text  := Commando ;
      SQLE.ParamByName('DatInc').AsDate  :=  datas ;
      SQLE.ParamByName('HorInc').Text    :=  TimeToStr(time) ;
      SQLE.ExecSQL;
      frmProgresso.ProgressBar1.Position:= frmProgresso.ProgressBar1.Position + 1;
      frmProgresso.lcontador.Caption := 'Registro(s) '+IntToStr(frmProgresso.ProgressBar1.Position)+'/'+IntToStr(Linhas);
      frmProgresso.lcontador.Repaint;
    end;
    FreeAndNil( SQLE );
    AlterSeq(Tabela,'mrc_codigo',dmEmp.sqlConSis);
    CloseFile(arq);
    frmProgresso.Close;

End;

procedure PovoaCombustivel( Tabela : String );
var
aInss : array of string;
data, hora: string ;
dD, mM, aA: Word;
datas : TDate;
{-----}
linha, cod, marca, cDiret, cArquivo, Commando : string;
nreg, i, Linhas: integer; nota1, nota2, media: real;
arq: TextFile;
Lista: TStringList;
SQLE : TFDQuery;
begin
  SQLE := TFDQuery.Create(nIL);

  frmProgresso := TfrmProgresso.Create(nil);
  frmProgresso.Show;

  cDiret  := ExtractFilePath(Application.ExeName);
  cArquivo:= cDiret+'docs\combustivel.docs';

  Lista             := TStringList.Create;

  Lista.LoadFromFile(cArquivo);
  Linhas            := Lista.Count;

  frmProgresso.ProgressBar1.Max  := Linhas;
  frmProgresso.lTabela.Caption := 'Tabela: '+cTab2;
  frmProgresso.lTabela.Repaint;

  AssignFile(arq, cArquivo);
  if frmIni <> Nil then Begin
    frmIni.lbInfo.Caption := 'Tabela '+cTab;
    frmIni.lbInfo.Refresh ;
  End;

  Reset(arq); { abre o arquivo texto para leitura }
  nreg := 0;
  while (not Eof(arq)) do{ enquanto não atingir a marca de final de arquivo }
    begin Readln(arq, linha); { lê uma linha, com os dados de um aluno, do arquivo }
      nreg := nreg + 1;
      i := pos('|', linha);
      marca   := copy(linha, 1, i-1); { recupera o nome do aluno }
      delete(linha, 1, i);

     {
      i := pos('|', linha);
      nota2 := StrToFloat(copy(linha, 1, i-1)); //recupera a 2a. nota do aluno
      }
      // Gera a Linha para povoar a tabela
      Commando:= 'insert into '+U_funcao.SelSchema(Tabela)+' (cmb_nome,        cmb_UsuInc,      cmb_DatInc, cmb_HorInc )'+
                            'values (  '''+marca+''', ''administrador'', :DatInc,    :HorInc )';


      SQLE.Close;
      SQLE.Connection:= dmEmp.sqlConSis;
      SQLE.SQL.Text  := Commando ;
      SQLE.ParamByName('DatInc').AsDate  :=  datas ;
      SQLE.ParamByName('HorInc').Text    :=  TimeToStr(time) ;
      SQLE.ExecSQL;
      frmProgresso.ProgressBar1.Position:= frmProgresso.ProgressBar1.Position + 1;
      frmProgresso.lcontador.Caption := 'Registro(s) '+IntToStr(frmProgresso.ProgressBar1.Position)+'/'+IntToStr(Linhas);
      frmProgresso.lcontador.Repaint;
    end;
    //AlterSeq(Tabela,'mrc_codigo',dmEmp.sqlConSis);
    FreeAndNil( SQLE );
    CloseFile(arq);
    frmProgresso.Close;

End;

procedure PovoaAcessorio( Tabela : String );
var
aInss : array of string;
data, hora: string ;
dD, mM, aA: Word;
datas : TDate;
{-----}
linha, cod, marca, cDiret, cArquivo, Commando : string;
nreg, i, Linhas: integer; nota1, nota2, media: real;
arq: TextFile;
Lista: TStringList;
SQLE : TFDQuery;
begin
  SQLE := TFDQuery.Create(nIL);

  frmProgresso := TfrmProgresso.Create(nil);
  frmProgresso.Show;

  cDiret  := ExtractFilePath(Application.ExeName);
  cArquivo:= cDiret+'docs\'+Tabela+'.docs';

  Lista             := TStringList.Create;

  Lista.LoadFromFile(cArquivo);
  Linhas            := Lista.Count;

  frmProgresso.ProgressBar1.Max  := Linhas;
  frmProgresso.lTabela.Caption := 'Tabela: '+cTab2;
  frmProgresso.lTabela.Repaint;

  AssignFile(arq, cArquivo);
  if frmIni <> Nil then Begin
    frmIni.lbInfo.Caption := 'Tabela '+cTab;
    frmIni.lbInfo.Refresh ;
  End;

  Reset(arq); { abre o arquivo texto para leitura }
  nreg := 0;
  while (not Eof(arq)) do{ enquanto não atingir a marca de final de arquivo }
    begin Readln(arq, linha); { lê uma linha, com os dados de um aluno, do arquivo }
      nreg := nreg + 1;
      i := pos('|', linha);
      marca   := copy(linha, 1, i-1); { recupera o nome do aluno }
      delete(linha, 1, i);

     {
      i := pos('|', linha);
      nota2 := StrToFloat(copy(linha, 1, i-1)); //recupera a 2a. nota do aluno
      }
      // Gera a Linha para povoar a tabela
      Commando:= 'insert into '+U_funcao.SelSchema(Tabela)+' (acs_nome,        acs_UsuInc,      acs_DatInc, acs_HorInc )'+
                            'values (  '''+marca+''', ''administrador'', :DatInc,    :HorInc )';


      SQLE.Close;
      SQLE.Connection:= dmEmp.sqlConSis;
      SQLE.SQL.Text  := Commando ;
      SQLE.ParamByName('DatInc').AsDate  :=  datas ;
      SQLE.ParamByName('HorInc').Text    :=  TimeToStr(time) ;
      SQLE.ExecSQL;
      frmProgresso.ProgressBar1.Position:= frmProgresso.ProgressBar1.Position + 1;
      frmProgresso.lcontador.Caption := 'Registro(s) '+IntToStr(frmProgresso.ProgressBar1.Position)+'/'+IntToStr(Linhas);
      frmProgresso.lcontador.Repaint;
    end;
    FreeAndNil( SQLE );
    //AlterSeq(Tabela,'mrc_codigo',dmEmp.sqlConSis);
    CloseFile(arq);
    frmProgresso.Close;

End;

procedure PovoaCargo( Tabela : String );
var
aInss : array of string;
data, hora: string ;
dD, mM, aA: Word;
datas : TDate;
{-----}
linha, cod, marca, cDiret, cArquivo, Commando : string;
nreg, i, Linhas: integer; nota1, nota2, media: real;
arq: TextFile;
Lista: TStringList;
SQLE : TFDQuery;
begin
  SQLE := TFDQuery.Create(nIL);

  frmProgresso := TfrmProgresso.Create(nil);
  frmProgresso.Show;

  cDiret  := ExtractFilePath(Application.ExeName);
  cArquivo:= cDiret+'docs\'+Tabela+'.docs';

  Lista             := TStringList.Create;

  Lista.LoadFromFile(cArquivo);
  Linhas            := Lista.Count;

  frmProgresso.ProgressBar1.Max  := Linhas;
  frmProgresso.lTabela.Caption := 'Tabela: '+cTab2;
  frmProgresso.lTabela.Repaint;

  AssignFile(arq, cArquivo);
  if frmIni <> Nil then Begin
    frmIni.lbInfo.Caption := 'Tabela '+cTab;
    frmIni.lbInfo.Refresh ;
  End;

  Reset(arq); { abre o arquivo texto para leitura }
  nreg := 0;
  while (not Eof(arq)) do{ enquanto não atingir a marca de final de arquivo }
    begin Readln(arq, linha); { lê uma linha, com os dados de um aluno, do arquivo }
      nreg := nreg + 1;
      i := pos('|', linha);
      marca   := copy(linha, 1, i-1); { recupera o nome do aluno }
      delete(linha, 1, i);

     {
      i := pos('|', linha);
      nota2 := StrToFloat(copy(linha, 1, i-1)); //recupera a 2a. nota do aluno
      }
      // Gera a Linha para povoar a tabela
      Commando:= 'insert into '+U_funcao.SelSchema(Tabela)+' (cgo_nome,        cgo_UsuInc,      cgo_DatInc, cgo_HorInc )'+
                            'values (  '''+marca+''', ''administrador'', :DatInc,    :HorInc )';


      SQLE.Close;
      SQLE.Connection:= dmEmp.sqlConSis;
      SQLE.SQL.Text  := Commando ;
      SQLE.ParamByName('DatInc').AsDate  :=  datas ;
      SQLE.ParamByName('HorInc').Text    :=  TimeToStr(time) ;
      SQLE.ExecSQL;
      frmProgresso.ProgressBar1.Position:= frmProgresso.ProgressBar1.Position + 1;
      frmProgresso.lcontador.Caption := 'Registro(s) '+IntToStr(frmProgresso.ProgressBar1.Position)+'/'+IntToStr(Linhas);
      frmProgresso.lcontador.Repaint;
    end;
    FreeAndNil( SQLE );
    //AlterSeq(Tabela,'mrc_codigo',dmEmp.sqlConSis);
    CloseFile(arq);
    frmProgresso.Close;

End;

procedure PovoaCor( Tabela : String );
var
aInss : array of string;
data, hora: string ;
dD, mM, aA: Word;
datas : TDate;
{-----}
linha, cod, marca, cDiret, cArquivo, Commando : string;
nreg, i, Linhas: integer; nota1, nota2, media: real;
arq: TextFile;
Lista: TStringList;
SQLE : TFDQuery;
begin
  SQLE := TFDQuery.Create(nIL);

  frmProgresso := TfrmProgresso.Create(nil);
  frmProgresso.Show;

  cDiret  := ExtractFilePath(Application.ExeName);
  cArquivo:= cDiret+'docs\'+Tabela+'.docs';

  Lista             := TStringList.Create;

  Lista.LoadFromFile(cArquivo);
  Linhas            := Lista.Count;

  frmProgresso.ProgressBar1.Max  := Linhas;
  frmProgresso.lTabela.Caption := 'Tabela: '+cTab2;
  frmProgresso.lTabela.Repaint;

  AssignFile(arq, cArquivo);
  if frmIni <> Nil then Begin
    frmIni.lbInfo.Caption := 'Tabela '+cTab;
    frmIni.lbInfo.Refresh ;
  End;

  Reset(arq); { abre o arquivo texto para leitura }
  nreg := 0;
  while (not Eof(arq)) do{ enquanto não atingir a marca de final de arquivo }
    begin Readln(arq, linha); { lê uma linha, com os dados de um aluno, do arquivo }
      nreg := nreg + 1;
      i := pos('|', linha);
      marca   := copy(linha, 1, i-1); { recupera o nome do aluno }
      delete(linha, 1, i);

     {
      i := pos('|', linha);
      nota2 := StrToFloat(copy(linha, 1, i-1)); //recupera a 2a. nota do aluno
      }
      // Gera a Linha para povoar a tabela
      Commando:= 'insert into '+U_funcao.SelSchema(Tabela)+' (cor_nome,        cor_UsuInc,      cor_DatInc, cor_HorInc )'+
                            'values (  '''+marca+''', ''administrador'', :DatInc,    :HorInc )';


      SQLE.Close;
      SQLE.Connection:= dmEmp.sqlConSis;
      SQLE.SQL.Text  := Commando ;
      SQLE.ParamByName('DatInc').AsDate  :=  datas ;
      SQLE.ParamByName('HorInc').Text    :=  TimeToStr(time) ;
      SQLE.ExecSQL;
      frmProgresso.ProgressBar1.Position:= frmProgresso.ProgressBar1.Position + 1;
      frmProgresso.lcontador.Caption := 'Registro(s) '+IntToStr(frmProgresso.ProgressBar1.Position)+'/'+IntToStr(Linhas);
      frmProgresso.lcontador.Repaint;
    end;
    FreeAndNil( SQLE );
    //AlterSeq(Tabela,'mrc_codigo',dmEmp.sqlConSis);
    CloseFile(arq);
    frmProgresso.Close;

End;

procedure PovoaOrgTran( Tabela : String );
var
aInss : array of string;
data, hora: string ;
dD, mM, aA: Word;
datas : TDate;
{-----}
linha, cod, marca, sigla, cDiret, cArquivo, Commando : string;
nreg, i, Linhas: integer; nota1, nota2, media: real;
arq: TextFile;
Lista: TStringList;
SQLE : TFDQuery;
begin
  SQLE := TFDQuery.Create(nIL);

  frmProgresso := TfrmProgresso.Create(nil);
  frmProgresso.Show;

  cDiret  := ExtractFilePath(Application.ExeName);
  cArquivo:= cDiret+'docs\'+Tabela+'.docs';

  Lista             := TStringList.Create;

  Lista.LoadFromFile(cArquivo);
  Linhas            := Lista.Count;

  frmProgresso.ProgressBar1.Max  := Linhas;
  frmProgresso.lTabela.Caption := 'Tabela: '+cTab2;
  frmProgresso.lTabela.Repaint;

  AssignFile(arq, cArquivo);
  if frmIni <> Nil then Begin
    frmIni.lbInfo.Caption := 'Tabela '+cTab;
    frmIni.lbInfo.Refresh ;
  End;

  Reset(arq); { abre o arquivo texto para leitura }
  nreg := 0;
  while (not Eof(arq)) do{ enquanto não atingir a marca de final de arquivo }
    begin Readln(arq, linha); { lê uma linha, com os dados de um aluno, do arquivo }
      nreg := nreg + 1;
      i := pos('|', linha);
      marca   := copy(linha, 1, i-1); { recupera o nome do aluno }
      delete(linha, 1, i);

      i := pos('|', linha);
      sigla := copy(linha, 1, i-1); //recupera a 2a. nota do aluno

      // Gera a Linha para povoar a tabela
      Commando:= 'insert into '+U_funcao.SelSchema(Tabela)+' (ogt_nome, ogt_sigla,   ogt_telef01, ogt_telef02, ogt_UsuInc,      ogt_DatInc, ogt_HorInc )'+
                            'values (  '''+marca+''', '''+sigla+''', '''','''', ''administrador'', :DatInc,    :HorInc )';


      SQLE.Close;
      SQLE.Connection:= dmEmp.sqlConSis;
      SQLE.SQL.Text  := Commando ;
      SQLE.ParamByName('DatInc').AsDate  :=  datas ;
      SQLE.ParamByName('HorInc').Text    :=  TimeToStr(time) ;
      SQLE.ExecSQL;
      frmProgresso.ProgressBar1.Position:= frmProgresso.ProgressBar1.Position + 1;
      frmProgresso.lcontador.Caption := 'Registro(s) '+IntToStr(frmProgresso.ProgressBar1.Position)+'/'+IntToStr(Linhas);
      frmProgresso.lcontador.Repaint;
    end;
    FreeAndNil( SQLE );
    //AlterSeq(Tabela,'mrc_codigo',dmEmp.sqlConSis);
    CloseFile(arq);
    frmProgresso.Close;

End;



procedure PovoaMedida( Tabela : String );
var
aInss : array of string;
data, hora,Pref: string ;
dD, mM, aA: Word;
datas : TDate;
{-----}
linha, cod, nome, cDiret, cArquivo, Commando : string;
nreg, i, Linhas: integer; nota1, nota2, media: real;
arq: TextFile;
Lista: TStringList;
SQLE : TFDQuery;
begin
  Pref :='mdd_';
  SQLE := TFDQuery.Create(nIL);

  frmProgresso := TfrmProgresso.Create(nil);
  frmProgresso.Show;

  cDiret  := ExtractFilePath(Application.ExeName);
  cArquivo:= cDiret+'docs\medida.docs';

  Lista             := TStringList.Create;

  Lista.LoadFromFile(cArquivo);
  Linhas            := Lista.Count;

  frmProgresso.ProgressBar1.Max  := Linhas;
  frmProgresso.lTabela.Caption := 'Tabela: '+cTab2;
  frmProgresso.lTabela.Repaint;

  AssignFile(arq, cArquivo);
  if frmIni <> Nil then Begin
    frmIni.lbInfo.Caption := 'Tabela '+cTab;
    frmIni.lbInfo.Refresh ;
  End;

  Reset(arq); { abre o arquivo texto para leitura }
  nreg := 0;
  while (not Eof(arq)) do{ enquanto não atingir a marca de final de arquivo }
    begin Readln(arq, linha); { lê uma linha, com os dados de um aluno, do arquivo }
      nreg := nreg + 1;
      i := pos('|', linha);
      cod   := copy(linha, 1, i-1); { recupera o nome do aluno }
      delete(linha, 1, i);

      i := pos('|', linha);
      nome := copy(linha, 1, i-1); // recupera a 1a. nota do aluno
      delete(linha, 1, i);
     {
      i := pos('|', linha);
      nota2 := StrToFloat(copy(linha, 1, i-1)); //recupera a 2a. nota do aluno
      }
      // Gera a Linha para povoar a tabela
      Commando:= 'insert into '+U_funcao.SelSchema(Tabela)+'(mdd_codigo, mdd_nome,        mdd_UsuInc,      mdd_DatInc, mdd_HorInc )'+
                            'values (  '+cod+' , '''+nome+''', ''administrador'', :DatInc,    :HorInc )';


      SQLE.Close;
      SQLE.Connection:= dmEmp.sqlConSis;
      SQLE.SQL.Text  := Commando ;
      SQLE.ParamByName('DatInc').AsDate  :=  datas ;
      SQLE.ParamByName('HorInc').Text    :=  TimeToStr(time) ;
      SQLE.ExecSQL;
      frmProgresso.ProgressBar1.Position:= frmProgresso.ProgressBar1.Position + 1;
      frmProgresso.lcontador.Caption := 'Registro(s) '+IntToStr(frmProgresso.ProgressBar1.Position)+'/'+IntToStr(Linhas);
      frmProgresso.lcontador.Repaint;
    end;
    FreeAndNil( SQLE );
    AlterSeq(Tabela,Pref+'codigo',dmEmp.sqlConSis);
    CloseFile(arq);
    frmProgresso.Close;

End;

//---------------------------------------------------------------------
//FUNÇÃO QUE ALIMENTA NIVEIS DE USUARIOS
//---------------------------------------------------------------------
procedure PovoaModelo( Tabela : String );
var
aInss : array of string;
data, hora: string ;
dD, mM, aA: Word;
datas : TDate;
{-----}
linha, cod, modelo, codmrc, cDiret, cArquivo, Commando, codgrm : string;
nreg, i, Linhas: integer; nota1, nota2, media: real;
arq: TextFile;
Lista: TStringList;
SQLE : TFDQuery;
begin
  SQLE := TFDQuery.Create(nIL);

  frmProgresso := TfrmProgresso.Create(nil);
  frmProgresso.Show;

  cDiret  := ExtractFilePath(Application.ExeName);
  cArquivo:= cDiret+'docs\modelo.docs';

  Lista             := TStringList.Create;

  Lista.LoadFromFile(cArquivo);
  Linhas            := Lista.Count;
  frmProgresso.ProgressBar1.Max  := lista.Count;
  frmProgresso.lTabela.Caption := 'Tabela: '+cTab2;
  frmProgresso.lTabela.Repaint;

  AssignFile(arq, cArquivo);
  if frmIni <> Nil then Begin
    frmIni.lbInfo.Caption := 'Tabela '+cTab;
    frmIni.lbInfo.Refresh ;
  End;

  Reset(arq); { abre o arquivo texto para leitura }
  nreg := 0;
  frmProgresso.ProgressBar1.Position:= 0;
  while (not Eof(arq)) do{ enquanto não atingir a marca de final de arquivo }
    begin Readln(arq, linha); { lê uma linha, com os dados de um aluno, do arquivo }
      nreg := nreg + 1;
      i := pos('|', linha);
      cod   := copy(linha, 1, i-1); { recupera o nome do aluno }
      delete(linha, 1, i);

      i := pos('|', linha);
      modelo := copy(linha, 1, i-1); // recupera a 1a. nota do aluno
      delete(linha, 1, i);

      i := pos('|', linha);
      codmrc := copy(linha, 1, i-1); //recupera a 2a. nota do aluno
      delete(linha, 1, i);

        // Aqui vai passando os barras ate chegar no codigo do grupo de manuitenção
        i := pos('|', linha);
        codgrm := copy(linha, 1, i-1); //recupera a 2a. nota do aluno
        delete(linha, 1, i);

        i := pos('|', linha);
        codgrm := copy(linha, 1, i-1); //recupera a 2a. nota do aluno
        delete(linha, 1, i);

        i := pos('|', linha);
        codgrm := copy(linha, 1, i-1); //recupera a 2a. nota do aluno
        delete(linha, 1, i);


      // Gera a Linha para povoar a tabela
      Commando:= 'insert into '+U_funcao.SelSchema(Tabela)+' (mdl_codigo,  mdl_nome,  mdl_codmrc,   mdl_codfip, mdl_codgrm, mdl_UsuInc,      mdl_DatInc, mdl_HorInc )'+
                            'values (  '+cod+' , '''+modelo+''', '+codmrc+',''0'', '+codgrm+', ''administrador'', '+QuotedStr( FormatDateTime('yyyy-mm-dd',now) )+',  '+QuotedStr( TimeToStr(time) )+')';


      SQLE.Close;
      SQLE.Connection:= dmEmp.sqlConSis;
      SQLE.SQL.Text  := Commando ;
      SQLE.ExecSQL;
      frmProgresso.ProgressBar1.Position:= frmProgresso.ProgressBar1.Position + 1;
      frmProgresso.lcontador.Caption := 'Registro(s) '+IntToStr(frmProgresso.ProgressBar1.Position)+'/'+IntToStr(Linhas);
      frmProgresso.lcontador.Repaint;
    end;

    AlterSeq(Tabela,'mdl_codigo',dmEmp.sqlConSis);
    FreeAndNil( SQLE );
    CloseFile(arq);
    frmProgresso.Close;

End;

procedure AlterSeq(cTab,cPre: String; Conn: TFDConnection);
Var
cCod : string;
SQLE :TFDQuery;
Begin
  SQLE := TFDQuery.Create(nIL);
  SQLE.Connection:= Conn;

  SQLE.Close;
  SQLE.SQL.Text  := 'Select Max('+cPre+')+1 as Cod From '+U_funcao.SelSchema(cTab);
  SQLE.Open;
  cCod := SQLE.FieldByName('Cod').Text;

  SQLE.Close;
  SQLE.SQL.Text  := 'ALTER SEQUENCE "'+SelSchemaNome( cTab )+'".'+cTab+'_'+cPre+'_seq RESTART WITH '+cCod  ;
  Try
    SQLE.ExecSQL;
  Except
      FreeAndNil(SQLE);
  End;
  FreeAndNil(SQLE);


End;
procedure PovoaCFOP( Tabela : String );
var
aInss : array of string;
data, hora: string ;
dD, mM, aA: Word;
datas : TDate;
{-----}
linha, Pref, cod, modelo, codmrc, cDiret, cArquivo, Commando : string;
nreg, i, Linhas: integer; nota1, nota2, media: real;
arq: TextFile;
Lista: TStringList;
SQLE : TFDQuery;
begin
  SQLE := TFDQuery.Create(nIL);

  frmProgresso := TfrmProgresso.Create(nil);
  frmProgresso.Show;

  cDiret  := ExtractFilePath(Application.ExeName);
  cArquivo:= cDiret+'docs\cfop.docs';
  Pref    := 'cfo_';
  Lista             := TStringList.Create;

  Lista.LoadFromFile(cArquivo);
  Linhas            := Lista.Count;
  frmProgresso.ProgressBar1.Max  := lista.Count;
  frmProgresso.lTabela.Caption := 'Tabela: '+cTab2;
  frmProgresso.lTabela.Repaint;

  AssignFile(arq, cArquivo);
  if frmIni <> Nil then Begin
    frmIni.lbInfo.Caption := 'Tabela '+cTab2;
    frmIni.lbInfo.Refresh ;
  End;

  Reset(arq); { abre o arquivo texto para leitura }
  nreg := 0;
  frmProgresso.ProgressBar1.Position:= 0;
  while (not Eof(arq)) do{ enquanto não atingir a marca de final de arquivo }
    begin Readln(arq, linha); { lê uma linha, com os dados de um aluno, do arquivo }
      nreg := nreg + 1;
      i := pos('|', linha);
      cod   := copy(linha, 1, i-1); { recupera o nome do aluno }
      delete(linha, 1, i);

      i := pos('|', linha);
      modelo := copy(linha, 1,i-1); // recupera a 1a. nota do aluno
      delete(linha, 1, i);
                                              {
      i := pos('|', linha);
      codmrc := copy(linha, 1, i-1); //recupera a 2a. nota do aluno
      delete(linha, 1, i);
                                }
      // Gera a Linha para povoar a tabela
      Commando:= 'insert into '+U_funcao.SelSchema(Tabela)+' ('+Pref+'codigo, '+Pref+'nome,  '+Pref+'UsuInc,     '+Pref+'DatInc, '+Pref+'HorInc )'+
                            'values (  '+QuotedStr( cod )+' , '+UpperCase( QuotedStr( modelo) )+',  ''administrador'', '+QuotedStr( FormatDateTime('yyyy-mm-dd',now) )+',  '+QuotedStr( TimeToStr(time) )+')';


      SQLE.Close;
      SQLE.Connection:= dmEmp.sqlConSis;
      SQLE.SQL.Text  := Commando ;
      SQLE.ExecSQL;
      frmProgresso.ProgressBar1.Position:= frmProgresso.ProgressBar1.Position + 1;
      frmProgresso.lcontador.Caption := 'Registro(s) '+IntToStr(frmProgresso.ProgressBar1.Position)+'/'+IntToStr(Linhas);
      frmProgresso.lcontador.Repaint;
    end;
    //AlterSeq(Tabela,Pref+'codigo',dmEmp.sqlConSis);
    FreeAndNil( SQLE );
    CloseFile(arq);
    frmProgresso.Close;

End;
procedure PovoaCST( Tabela : String );
var
aInss : array of string;
data, hora: string ;
dD, mM, aA: Word;
datas : TDate;
{-----}
linha, Pref, cod, desc1,desc2, cfo1, cfo2, cfo3, cDiret, cArquivo, Commando : string;
nreg, i, Linhas: integer; nota1, nota2, media: real;
arq: TextFile;
Lista: TStringList;
SQLE : TFDQuery;
begin
  SQLE := TFDQuery.Create(nIL);

  frmProgresso := TfrmProgresso.Create(nil);
  frmProgresso.Show;

  cDiret  := ExtractFilePath(Application.ExeName);
  cArquivo:= cDiret+'docs\cst.docs';
  Pref    := 'cst_';
  Lista             := TStringList.Create;

  Lista.LoadFromFile(cArquivo);
  Linhas            := Lista.Count;
  frmProgresso.ProgressBar1.Max  := lista.Count;
  frmProgresso.lTabela.Caption := 'Tabela: '+cTab2;
  frmProgresso.lTabela.Repaint;

  AssignFile(arq, cArquivo);
  if frmIni <> Nil then Begin
    frmIni.lbInfo.Caption := 'Tabela '+cTab2;
    frmIni.lbInfo.Refresh ;
  End;

  Reset(arq); { abre o arquivo texto para leitura }
  nreg := 0;
  frmProgresso.ProgressBar1.Position:= 0;
  while (not Eof(arq)) do{ enquanto não atingir a marca de final de arquivo }
    begin Readln(arq, linha); { lê uma linha, com os dados de um aluno, do arquivo }
      nreg := nreg + 1;
      i := pos('|', linha);
      cod   := copy(linha, 1, i-1); { recupera o nome do aluno }
      delete(linha, 1, i);

      i := pos('|', linha);
      desc1 := copy(linha, 1,i-1); // recupera a 1a. nota do aluno
      delete(linha, 1, i);

      i := pos('|', linha);
      desc2 := copy(linha, 1,i-1); // recupera a 1a. nota do aluno
      delete(linha, 1, i);

      i := pos('|', linha);
      cfo1 := copy(linha, 1, i-1); //recupera a 2a. nota do aluno
      delete(linha, 1, i);

      // Gera a Linha para povoar a tabela
      Commando:= 'insert into '+U_funcao.SelSchema(Tabela)+' ('+Pref+'codigo, '+Pref+'descri, '+Pref+'clcicm, '+Pref+'cf, '+Pref+'UsuInc,     '+Pref+'DatInc, '+Pref+'HorInc )'+
                            'values (  '+QuotedStr( cod )+' , '+  UpperCase( QuotedStr( desc1) )+', '+UpperCase( Trim( QuotedStr( desc2) ) )+', '+QuotedStr( Trim( cfo1 ) )+', ''administrador'', '+QuotedStr( FormatDateTime('yyyy-mm-dd',now) )+',  '+QuotedStr( TimeToStr(time) )+')';


      SQLE.Close;
      SQLE.Connection:= dmEmp.sqlConSis;
      SQLE.SQL.Text  := Commando ;
      SQLE.ExecSQL;
      frmProgresso.ProgressBar1.Position:= frmProgresso.ProgressBar1.Position + 1;
      frmProgresso.lcontador.Caption := 'Registro(s) '+IntToStr(frmProgresso.ProgressBar1.Position)+'/'+IntToStr(Linhas);
      frmProgresso.lcontador.Repaint;
    end;
    //AlterSeq(Tabela,Pref+'codigo',dmEmp.sqlConSis);
    FreeAndNil( SQLE );
    CloseFile(arq);
    frmProgresso.Close;

End;



//---------------------------------------------------------------------
//FUNÇÃO QUE ALIMENTA CADASTEO DE BANCOS
//---------------------------------------------------------------------
procedure PovoaNCM( Tabela : String );
var
aInss : array of string;
data, hora: string ;
dD, mM, aA: Word;
datas : TDate;
{-----}
linha, Pref, cod, modelo, codmrc, cDiret, cArquivo, Commando : string;
nreg, i, Linhas: integer; nota1, nota2, media: real;
arq: TextFile;
Lista: TStringList;
SQLE : TFDQuery;
begin
  SQLE := TFDQuery.Create(nIL);
  frmProgresso := TfrmProgresso.Create(nil);
  frmProgresso.Show;

  cDiret  := ExtractFilePath(Application.ExeName);
  cArquivo:= cDiret+'docs\ncm.docs';
  Pref    := 'ncm_';
  Lista             := TStringList.Create;

  Lista.LoadFromFile(cArquivo);
  Linhas            := Lista.Count;
  frmProgresso.ProgressBar1.Max  := lista.Count;
  frmProgresso.lTabela.Caption := 'Tabela: '+cTab2;
  frmProgresso.lTabela.Repaint;

  AssignFile(arq, cArquivo);
  if frmIni <> Nil then Begin
    frmIni.lbInfo.Caption := 'Tabela '+cTab2;
    frmIni.lbInfo.Refresh ;
  End;

  Reset(arq); { abre o arquivo texto para leitura }
  nreg := 0;
  frmProgresso.ProgressBar1.Position:= 0;
  while (not Eof(arq)) do{ enquanto não atingir a marca de final de arquivo }
    begin Readln(arq, linha); { lê uma linha, com os dados de um aluno, do arquivo }
      nreg := nreg + 1;
      i := pos('|', linha);
      cod   := copy(linha, 1, i-1); { recupera o nome do aluno }
      delete(linha, 1, i);

      i := pos('|', linha);
      modelo := copy(linha, 1, i-1); // recupera a 1a. nota do aluno
      delete(linha, 1, i);
                                              {
      i := pos('|', linha);
      codmrc := copy(linha, 1, i-1); //recupera a 2a. nota do aluno
      delete(linha, 1, i);
                                }
      // Gera a Linha para povoar a tabela
      Commando:= 'insert into '+U_funcao.SelSchema(Tabela)+' ('+Pref+'codigo, '+Pref+'nome,  '+Pref+'UsuInc,     '+Pref+'DatInc, '+Pref+'HorInc )'+
                            'values (  '+QuotedStr( modelo )+' , '+QuotedStr( cod )+',  ''administrador'', '+QuotedStr( FormatDateTime('yyyy-mm-dd',now) )+',  '+QuotedStr( TimeToStr(time) )+')';


      SQLE.Close;
      SQLE.Connection:= dmEmp.sqlConSis;
      SQLE.SQL.Text  := Commando ;
      SQLE.ExecSQL;
      frmProgresso.ProgressBar1.Position:= frmProgresso.ProgressBar1.Position + 1;
      frmProgresso.lcontador.Caption := 'Registro(s) '+IntToStr(frmProgresso.ProgressBar1.Position)+'/'+IntToStr(Linhas);
      frmProgresso.lcontador.Repaint;
    end;
    //AlterSeq(Tabela,Pref+'codigo',dmEmp.sqlConSis);
    FreeAndNil( SQLE );
    CloseFile(arq);
    frmProgresso.Close;
end;


end.
