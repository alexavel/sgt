unit U_MetodosDialog;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ExtCtrls, ImgList, ToolWin, IniFiles,
  dbTables, FMTBcd, DB, SqlExpr, DBXFirebird, StrUtils,StdCtrls,IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  xmldom, XMLIntf, msxmldom, XMLDoc, IdHTTP, Mask, DateUtils, Zdataset, jpeg;

  procedure navegacao(frmUlt : TForm; Ord: Integer; sqlNew : TZQuery);

implementation

procedure navegacao(frmUlt: TForm ; Ord: Integer; sqlNew : TZQuery );
begin
{
// Controle de Navegação de Registros
   if sqlNew.IsEmpty then begin
      frmUlt.RefreshDados('N');
      frmUlt.btnNovo.Enabled := False;
      frmUlt.btnAlterar.Enabled := True;
      frmUlt.ativaButoes(0);
   end;

   if Not frmUlt.sqlNew.IsEmpty then begin

      if Ord = 1 then Begin
             frmUlt.sqlNew.First;
      End Else
          if Ord = 2 then Begin
             frmUlt.sqlNew.Prior;
      End Else
          if Ord = 3 then Begin
             frmUlt.sqlNew.Next;
      End Else
          if Ord = 4 then Begin
             frmUlt.sqlNew.Last;
      End Else
          if Ord = 5 then Begin
             frmUlt.sqlNew.RecNo :=  frmUlt.nOrdem ;

      End;
      frmUlt.nOrdem         := frmUlt.sqlNew.RecNo ;
      frmUlt.btnIni.Enabled := ( ( not sqlNew.Bof ) and ( Ord <> 0 ) );
      frmUlt.btnAnt.Enabled := ( ( not sqlNew.Bof ) and ( Ord <> 0 ) );
      frmUlt.btnProx.Enabled:= ( ( not sqlNew.Eof ) and ( Ord <> 0 ) );
      frmUlt.btnUlt.Enabled := ( ( not sqlNew.Eof ) and ( Ord <> 0 ) );
      frmUlt.acampo := 0;
      frmUlt.RefreshDialog;
      frmUlt.acampo := 1;
      frmUlt.tip_teixoChange(Nil);
   end;
   }
end;

end.
