
{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Projeto DadosPC
 Luiz Henrique Rosa da Silva
 WebSite: www.aguape21.com.br
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}



unit U_SISTEMA_DADOS;

interface
uses IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
classes,IdIPWatch,Windows,SysUtils;

type
TDadosPC=class
  private
  public
  function IpLocal:string; //Obter Ip Local do PC
  function IpExterno:string; //Obeter o IP Externo
  function IpReverso:string; //Obeter o IP Reverso
  function MAC:string; //Pegando o endereço mac da placa de rede
  function SeriaDiscoC(fDisco:string='C'):string; //retorna o numero de serie de um disco, iniciando como padão o "C"
  function Usuario:string;  // retorna o nome do usuario
  function Computador:string; // Retorna o nome do computador
  function PastaTemp:string; // Retorna a pasta temp
  function TamanhoDisco(fDisco:string='C'):int64; // Tomanho do disco em byte
  function TamanhoDiscoLivre(fDisco:string='C'):int64; // Tomanho do disco livre
  function TamanhoDiscoOcupado(fDisco:string='C'):int64; // Tomanho do disco Ocupado
end;

implementation

{ TDadosPC }

function TDadosPC.Computador: string;
const
   MAX_COMPUTER_LENGTH = 30;
var
   pNome : PChar;
   len : DWord;
begin
   try
      len := MAX_COMPUTER_LENGTH + 1;
      GetMem(pNome, len);
      if GetComputerName(pNome, len) then
         Result := pNome
      else
         Result := '';
   finally
      FreeMem(pNome, len);
   end;
end;

function TDadosPC.IpExterno: string;
var
 fsite,ft:string;
 http:tidhttp;
 arq:tstringstream;
begin
 {=========================
 Para uso desta função é necessário que o administrador da rede liberar
 acesso ao endereço "www.meuip.aguape21.com.br" ou se for de sua preferência
 crie seu próprio endereço e mude a variável "fSite",
  usando o seguinte código fonte PHP:
 ~~~~~~~~
  <?php
echo $_SERVER['REMOTE_ADDR'];
echo ";";
echo gethostbyaddr($_SERVER['REMOTE_ADDR']);
?>
 ~~~~~~~~
 ==========================}

 fsite:='http://'+'www.meuip.aguape21.com.br'+'/';

  http := tidhttp.Create(nil);
 arq := tstringstream.Create;



http.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; SV1; .NET CLR 1.1.4322; InfoPath.1)';
http.HandleRedirects := true;
http.RedirectMaximum := 200;
result := '';

 try
    http.Get(fsite,arq);
    ft := arq.DataString;
    delete(ft,1,pos(';',ft));
    result := copy(ft,1,pos(';',ft)-1);
 finally
  http.Disconnect;
  http.Free;
  arq.Free;
 end;

end;

function TDadosPC.IpLocal: string;
var
 fip :TIdIPWatch;
begin
  fip := TIdIPWatch.Create(nil);
  result := fip.LocalIP;
  fip.Free;
end;

function TDadosPC.IpReverso: string;
var
 fsite,ft:string;
 http:tidhttp;
 arq:tstringstream;
begin
 {=========================
 Para uso desta função é necessário que o administrador da rede liberar
 acesso ao endereço "www.meuip.aguape21.com.br" ou se for de sua preferência
 crie seu próprio endereço e mude a variável "fSite",
  usando o seguinte código fonte PHP:
 ~~~~~~~~
  <?php
echo $_SERVER['REMOTE_ADDR'];
echo ";";
echo gethostbyaddr($_SERVER['REMOTE_ADDR']);
?>
 ~~~~~~~~
 ==========================}

 fsite:='http://'+'www.meuip.aguape21.com.br'+'/';

  http := tidhttp.Create(nil);
 arq := tstringstream.Create;



http.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; SV1; .NET CLR 1.1.4322; InfoPath.1)';
http.HandleRedirects := true;
http.RedirectMaximum := 200;
result := '';

 try
    http.Get(fsite,arq);
    ft := arq.DataString;
    delete(ft,1,pos(';',ft));
    delete(ft,1,pos(';',ft));
    result := copy(ft,1,pos(';',ft)-1);
 finally
  http.Disconnect;
  http.Free;
  arq.Free;
 end;

end;

function TDadosPC.MAC: string;
var
Lib: Cardinal;
Func: function(GUID: PGUID): Longint; stdcall;
GUID1, GUID2: TGUID;
begin
{===========================
 Este código foi obtido do site
 http://www.planetadelphi.com.br/dica/6431/pegando-o-endereco-mac-da-placa-de-rede
 no dia 30/09/2012 as 15:46
============================}

Result := '';
Lib := LoadLibrary('rpcrt4.dll');
if Lib <> 0 then
begin
  @Func := GetProcAddress(Lib, 'UuidCreateSequential');
  if Assigned(Func) then
  begin
    if (Func(@GUID1) = 0) and
       (Func(@GUID2) = 0) and
       (GUID1.D4[2] = GUID2.D4[2]) and
       (GUID1.D4[3] = GUID2.D4[3]) and
       (GUID1.D4[4] = GUID2.D4[4]) and
       (GUID1.D4[5] = GUID2.D4[5]) and
       (GUID1.D4[6] = GUID2.D4[6]) and
       (GUID1.D4[7] = GUID2.D4[7]) then
    begin
      Result :=
        IntToHex(GUID1.D4[2], 2) + '-' +
        IntToHex(GUID1.D4[3], 2) + '-' +
        IntToHex(GUID1.D4[4], 2) + '-' +
        IntToHex(GUID1.D4[5], 2) + '-' +
        IntToHex(GUID1.D4[6], 2) + '-' +
        IntToHex(GUID1.D4[7], 2);
    end;
  end;
end;
end;


function TDadosPC.PastaTemp: string;
var
pNetpath: ARRAY[ 0..MAX_path - 1 ] of Char;
nlength: Cardinal;
begin
{=====================
Este código foi obtido do site:
http://www.planetadelphi.com.br/dica/1355/caminho-da-pasta-temp-do-windows.
dia 30/09/2012 as 16:13
=====================}
nlength := MAX_path;
FillChar( pNetpath, SizeOF( pNetpath ), #0 );
GetTemppath( nlength, pNetpath );
Result := StrPas( pNetpath );
end;


function TDadosPC.Usuario: string;
var
  buffer: array[0..255] of char;
  size: dword;
begin
{============================
 Este código foi obtido do site:
 http://www.arquivodecodigos.net/dicas/delphi-obtendo-o-nome-de-usuario-do-computador-2996.html
 dia 30/09/2012 as 16:06
=============================}
  size := 256;
  if GetUserName(buffer, size) then
    Result := buffer
  else
    Result := '';
end;

function TDadosPC.SeriaDiscoC(fDisco: string): string;
   Var
      Serial:DWord;
      DirLen,Flags: DWord;
      DLabel : Array[0..11] of Char;
   begin

      Try
      while (fdisco[length(fdisco)]='') or (fdisco[length(fdisco)]=':') do  delete(fDisco,length(fdisco),1);

          GetVolumeInformation(PChar(fdisco+':'),dLabel,12,@Serial,DirLen,Flags,nil,0);
         Result := IntToHex(Serial,8);
      Except Result := '';
   end;
end;

function TDadosPC.TamanhoDisco(fDisco: string): int64;
begin
  // retorna em bytes o tamanho do hd e seu espaco livre
  try
    result := SysUtils.DiskSize(byte(fdisco[1]) - $40);
 except
   result := 0;
 end;
end;

function TDadosPC.TamanhoDiscoLivre(fDisco: string): int64;
begin
  try
    result := SysUtils.DiskFree(byte(fdisco[1]) - $40);
 except
   result := 0;
 end;
end;

function TDadosPC.TamanhoDiscoOcupado(fDisco: string): int64;
begin
 result := self.TamanhoDisco(fdisco)-self.TamanhoDiscoLivre(fdisco);
end;

end.

