unit POVOADO;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ExtCtrls, ImgList, ToolWin, IniFiles,
  dbTables, FMTBcd, DB, SqlExpr, DBXFirebird, StrUtils,StdCtrls,IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  xmldom, XMLIntf, msxmldom, XMLDoc, IdHTTP, Mask, DateUtils   ;

Type {Tipos criados}
  TSemestre = record
  Mes, Ano : Word;
 end;
  Semestre = array[0..5] of TSemestre;
Var
  c_text: String;
  procedure Povomodelo( Tabela : String );
implementation
uses U_DmEmp, U_ini;

//---------------------------------------------------------------------
//FUNÇÃO QUE ALIMENTA CADASTEO DE BANCOS
//---------------------------------------------------------------------
procedure Povomodelo( Tabela : String );
var
 Relbanco : array of array[0..4] of string;
 i,n : Integer;
 data, hora: string ;
 dD, mM, aA: Word;
 SQLQ : TSQLQuery ;
 F: TextFile;
begin
   SQLQ := TSQLQuery.Create(Nil) ;
end;

end.
