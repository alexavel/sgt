unit U_ClassCad;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnMan, Vcl.Buttons, Vcl.ImgList,  Menus, ComCtrls,   ToolWin, IniFiles,
  dbTables, FMTBcd, DB, SqlExpr, DBXFirebird, StrUtils, Datasnap.Provider, Datasnap.DBClient,
  Vcl.Imaging.jpeg, zdataset, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  xmldom, XMLIntf, msxmldom, XMLDoc, IdHTTP, Mask, DateUtils, zlib,
  ZAbstractConnection, ZConnection, ZAbstractRODataset, ZAbstractDataset, ActnCtrls,
   FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

Type {Tipos criados}
  TSemestre = record
  Mes, Ano : Word;
 end;

 Type {Tipos criados}
  TArrayComp = array of TComponent;
  TArrayDim2 = array of array[0..1] of string;



  Semestre = array[0..5] of TSemestre;
Var
    // variáveis de cores
    cTexto01, cOpeQuery: String;
procedure ativaget2(aEdits: TArrayComp ; cCod, cTab: String; lGrava, lMostra : Boolean );
procedure limpaget2(aEdits: TArrayComp);
Function PegaCmpFrm(ClassComponent: Tcomponent;cPre: String ): Tcomponent ;
Procedure RefreshDialog2(cPre: String; campo: Integer; frm : TForm; sqlNew: TFdQuery; aEdits: TArrayComp);
procedure gravadados2(cTab,cPre,cCamp01,cCamp02,cQuery: String; nNew: Integer; frm: TForm; zConn: TFdConnection; aEdits: array of TComponent );
Function PegaUltCodSalvo( cTab, cCamp01,cPre :String ): String;
procedure ativaButoes2(tipo:Integer; btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt: TAction; sqlNew: TFdQuery);
Procedure navegacao2(Ord, acampo: Integer; btnIni, btnAnt, btnProx, btnUlt: TAction; sqlNew, zSqlPri: TFdQuery; EditBut: TButtonedEdit; cWhere : String );
procedure RefreshDados2(acampo:Integer; tipo, cFil: String; EditBut: TButtonedEdit; sqlNew, zSqlPri: TFdQuery);
Function GravarSub(cTab,cPre,cCamp01,cCamp02,cQuery: String; nN, aC: Integer; frm: TForm; zConn: TFdConnection; aEdits: TArrayComp; sqlNew, zSqlPri: TFdQuery; EdButon : TButtonedEdit  ):Integer;
Function Exclui2(cTab:String; aSubTab : TArrayDim2 ; cod: TButtonedEdit; btnExc: TAction): Boolean;
implementation

uses  U_funcao,  u_aguarde, U_DmEmp, uSistema;

{ Inicio de Funções e procedures }
{*************************************************************************
 Modulo de Exclusão de Registros
*************************************************************************}
Function Exclui2(cTab:String; aSubTab : TArrayDim2 ; cod: TButtonedEdit; btnExc: TAction): Boolean;
var
  codemp, namecomp : String;
  lOkDel : Boolean;
  nPosi,nQuant,i   : integer;
  qDel : TFdQuery;
Begin

 with Taguarde.ShowWaitForm('') do
     try

        codemp          := cod.Text;
        namecomp        := cod.Name;
        qDel            := TFdQuery.Create(Nil);



        if btnExc.Enabled  then
           begin
           if MESSAGEBOX(Application.Handle, 'Deseja Excluir?', 'Confirma...', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin
              IniTransacao;
              try
                lOkDel := False;
                // Verifica se tem SubTabelas para excluir
                if Length(aSubTab)>0 then Begin
                    For i := 0 to Length(aSubTab)-1 do  Begin
                       // Fazendo a Exclusão de Itens relacionandos nas SubTabelas
                       qDel.Connection  := dmEmp.SqlConSis;
                       qDel.Close;
                       qDel.SQl.Text    :='DELETE FROM   '+U_funcao.SelSchema(aSubTab[i][0])+' WHERE '+aSubTab[i][1]+' = :codemp';
                       qDel.ParamByName('codemp').Text  :=  codemp ;
                       qDel.ExecSQL;
                       if aSubTab[i][0] = cTab then
                          lOkDel := True;

                    End;
                End;
                if Not lOkDel then begin
                    qDel.Connection  := dmEmp.SqlConSis;
                    qDel.Close;
                    qDel.SQl.Text  :='DELETE FROM   '+U_funcao.SelSchema(cTab)+' WHERE '+namecomp+' = :codemp';
                    qDel.ParamByName('codemp').Text  :=  codemp ;
                    qDel.ExecSQL;
                end;
                Auditor(Screen.activeform.Caption,'Deletou','Cód: '+codemp );
                FimTransacao;
                Result := True;
              except
                RollBack;
                ShowMessage('Este registro esta sendo utilizado por outra tabela!'  );
                Result := False;
              end;
           End Else Begin
               Result := False;
           end;
        end else begin
           Result := False;
        end;

    finally
      AllowClose;
      Free;
    end;


end;


{*************************************************************************
 Modulo de Atualização de vizualização de Base
*************************************************************************}
Function GravarSub(cTab,cPre,cCamp01,cCamp02,cQuery: String; nN, aC: Integer; frm: TForm; zConn: TFdConnection; aEdits: TArrayComp; sqlNew, zSqlPri: TFdQuery; EdButon : TButtonedEdit ):Integer;
Var
PosReg : String;
begin
  if nN = 1 then Begin
       if MESSAGEBOX(Application.Handle, 'Atenção!'+'Você ainda não não gravou as informações do cabecalho!'+'Para inserir itens neste registro é necessário gravar.', 'Gravar Cabeçalho de Registro', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin
          gravadados2(cTab,cPre,cCamp01,cCamp02,cQuery, nN, frm, zConn, aEdits );
          aC      := 0;
          nN      := aC;
          PosReg  := 'T' ;
          if LowerCase( Copy(EdButon.Name,5,3)) <> 'cod' then
             PosReg  := 'S';

          RefreshDados2(aC,PosReg,'',EdButon, sqlNew, zSqlPri );
          sqlNew.Last;
          RefreshDialog2(cPre, aC, frm, sqlNew, aEdits);
          Result  := 0;
       end Else Begin
          ShowMessage('Item nao pode ser incluido!');
          Result := 1;
       End;
  End Else Begin
          Result := 0;
  End;

end;
{*************************************************************************
 Modulo de Atualização de vizualização de Base
*************************************************************************}
procedure RefreshDados2(acampo:Integer; tipo, cFil: String; EditBut: TButtonedEdit; sqlNew, zSqlPri: TFdQuery);
var
  i,nOrd, nWehe: integer;
  cWhere, cQuery, cOrder: String;

begin
 cOpeQuery  := tipo ;
 cQuery     := zSqlPri.SQL.Text ;
 nOrd       :=  (Pos('order', LowerCase(cQuery))-1);
 nWehe      :=  (Pos('where', LowerCase(cQuery))-1);
 if nOrd > 0 then
    cQuery     :=  Copy( cQuery,1,nOrd )   ;

 if nWehe > 0 then
    cQuery     :=  Copy( cQuery,1,nWehe )   ;

 cQuery     := StringReplace(cQuery,'"99999999999999_TESTE"',nmSchemaEmp, [rfReplaceAll, rfIgnoreCase]);
 cQuery     := StringReplace(cQuery,#$D#$A,' ', [rfReplaceAll, rfIgnoreCase]);
 cOrder     := ' order by '+EditBut.Name ;

 if tipo = 'S' then begin
    if cFil.IsEmpty  then begin
      cWhere := cQuery+' Where '+EditBut.Name+' = '+fIIF(( length( Trim( EditBut.Text )) > 0 ) and (acampo = 0 )  , QuotedStr( EditBut.Text ),QuotedStr( '0' ) );
    end else begin
      cWhere := cQuery+' Where '+cFil+' and '+EditBut.Name+' = '+fIIF(( length( Trim( EditBut.Text )) > 0 ) and (acampo = 0 )  , QuotedStr( EditBut.Text ),QuotedStr( '0' ) );
    end;
 End Else
  if tipo = 'D' then begin
    if cFil.IsEmpty  then begin
        cWhere := cQuery;
    end else begin
        cWhere := cQuery+' Where '+cFil
    end;
 end Else begin
    if cFil.IsEmpty  then begin
        cWhere := cQuery;
    end else begin
        cWhere := cQuery+' Where '+cFil
    end;
 end;

 with sqlNew do
   begin
     Sql.Text := cWhere+cOrder;
     Open;
 end;

end;



{*************************************************************************
 Modula a navegação
**************************************************************************}
procedure navegacao2(Ord, acampo: Integer; btnIni, btnAnt, btnProx, btnUlt: TAction; sqlNew, zSqlPri: TFdQuery; EditBut: TButtonedEdit; cWhere : String );
begin

// Controle de Navegação de Registros
   if (Ord <> 5) and ( Pos( 'where',LowerCase( sqlNew.SQL.Text ) ) > 0 ) then begin
      RefreshDados2(acampo, 'T', cWhere, EditBut, sqlNew, zSqlPri )
   end;

   if Not sqlNew.IsEmpty then begin

      if Ord = 1 then Begin
             sqlNew.RecNo :=  Ord ;
             sqlNew.First;
      End Else
          if Ord = 2 then Begin
             sqlNew.RecNo :=  Ord ;
             sqlNew.Prior;
      End Else
          if Ord = 3 then Begin
             sqlNew.RecNo :=  Ord ;
             sqlNew.Next;
      End Else
          if Ord = 4 then Begin
             sqlNew.RecNo :=  Ord ;
             sqlNew.Last;
      End Else
          if Ord = 5 then Begin
             sqlNew.RecNo :=  Ord ;
      End Else
          if Ord = 6 then Begin
             cWhere :=  EditBut.Name+' = '+fIIF( ( length( Trim( EditBut.Text )) > 0 ),EditBut.Text,'0' );
             RefreshDados2(acampo, 'T', cWhere, EditBut, sqlNew, zSqlPri ) ;
      End;
      Ord         := sqlNew.RecNo ;
      btnIni.Enabled := ( ( not sqlNew.Bof ) and ( Ord <> 0 ) );
      btnAnt.Enabled := ( ( not sqlNew.Bof ) and ( Ord <> 0 ) );
      btnProx.Enabled:= ( ( not sqlNew.Eof ) and ( Ord <> 0 ) );
      btnUlt.Enabled := ( ( not sqlNew.Eof ) and ( Ord <> 0 ) );

   end;


end;

{*************************************************************************
 Ativa Botões definição
**************************************************************************}
procedure ativaButoes2(tipo:Integer; btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt: TAction; sqlNew: TFdQuery);
Var
  i: Integer;
  cTab : string;
begin
  lRoolBack := False;
  cTab      :=  Copy( sqlNew.SQL.Text, Pos('".',sqlNew.SQL.Text)+2,          20 );
  if Pos(#$D,cTab) > 0 then begin
      cTab := LowerCase( Copy( cTab, 1                         , Pos(#$D,cTab)) );
  end Else begin
      cTab := LowerCase( Copy( cTab, 1                         , Pos(' ',cTab)) );
  end;
  cTab := TRim(cTab);
  //btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt
   btnNovo.Enabled     := (( Not btnGrava.Enabled )   and DmEmp.chkPer( cTab, 'prm_gra')  );
   btnAlterar.Enabled  := (( Not sqlNew.Eof )         and (Not btnGrava.Enabled)
                                                      and DmEmp.chkPer( cTab, 'prm_alt') );

   btnExcluir.Enabled  := (( Not sqlNew.Eof )         and (Not btnGrava.Enabled)
                                                      and DmEmp.chkPer( cTab, 'prm_exc') );

   btnGrava.Enabled    := (( ((Not btnNovo.Enabled)   and (Not btnAlterar.Enabled))
                          or ((Not btnNovo.Enabled)   and (btnAlterar.Enabled)) )
                                                      and ( DmEmp.chkPer( cTab, 'prm_gra') or DmEmp.chkPer( cTab, 'prm_alt' ) ) );

   btnCancela.Enabled := btnGrava.Enabled ;
   if Tipo = 0 then begin
     btnIni.Enabled     := ( (sqlNew.RecordCount > 0) and (Not btnGrava.Enabled) );
     btnAnt.Enabled     := ( (sqlNew.RecordCount > 0) and (Not btnGrava.Enabled) );
     btnProx.Enabled    := ( (sqlNew.RecordCount > 0) and (Not btnGrava.Enabled) );
     btnUlt.Enabled     := ( (sqlNew.RecordCount > 0) and (Not btnGrava.Enabled) );
   end Else
     btnIni.Enabled     := False;
     btnAnt.Enabled     := False;
     btnProx.Enabled    := False;
     btnUlt.Enabled     := False;

end;

{*************************************************************************
 Procedure que limpa os Get
**************************************************************************}
procedure limpaget2(aEdits: TArrayComp);
Var
i: Integer;
begin
  for i := 0 to Length(aEdits)-1 do begin
      If aEdits[i].ClassName = 'TEdit' Then Begin
              TEdit(aEdits[i]).clear;
          End Else
      If aEdits[i].ClassName = 'TMaskEdit' Then Begin
            if Copy( UpperCase( aEdits[i].name),5,3 ) = 'VLR' then Begin
               TMaskEdit(aEdits[i]).Text := FormatCurr('R$ ###,###,##0.00',0)
            End Else
            if Copy( UpperCase( aEdits[i].name),5,2 ) = 'KM' then Begin
               TMaskEdit(aEdits[i]).Text := FormatCurr('Km #,###,##0',0)
            End Else
            if Copy( UpperCase( aEdits[i].name),5,3 ) = 'LTS' then begin
               TMaskEdit(aEdits[i]).Text := FormatCurr('Lt #,###,##0.000',0)
            End Else
            if Copy( UpperCase( aEdits[i].name),5,3 ) = 'HOR' then
               TMaskEdit(aEdits[i]).Text := pegahora
            Else
              TMaskEdit(aEdits[i]).Clear;
          End Else
      If aEdits[i].ClassName = 'TComboBox' Then Begin
             TComboBox(aEdits[i]).ItemIndex := 0;
          End Else
      If aEdits[i].ClassName = 'TDateTimePicker' Then Begin
              TDateTimePicker(aEdits[i]).Date := now;
          End Else
      If aEdits[i].ClassName = 'TButtonedEdit' Then Begin
              TButtonedEdit(aEdits[i]).Clear;
          End Else
      If aEdits[i].ClassName = 'TRichEdit' Then Begin
              TRichEdit(aEdits[i]).Clear;
          End Else
      If aEdits[i].ClassName = 'TMemo' Then Begin
            TMemo(aEdits[i]).Clear;
          End Else
      If aEdits[i].ClassName = 'TCheckBox' Then Begin
            TCheckBox(aEdits[i]).Checked := True;
          End Else
      If aEdits[i].ClassName = 'TImage' Then Begin
          TImage(aEdits[i]).Picture.Bitmap.Assign(Nil);
          TImage(aEdits[i]).Parent.Repaint;
      End;
  end;

End;

{*************************************************************************
 Procedure que habilita ou desabilita os Gets
**************************************************************************}
procedure ativaget2(aEdits: TArrayComp; cCod, cTab: String; lGrava, lMostra : Boolean );
Var
i: Integer;
SQLP : TFdQuery ;
begin
 for i := 0 to Length(aEdits)-1 do begin
      if (aEdits[i].ClassName = 'TEdit') Then Begin

          SQLP := TFdQuery.Create(Nil);
          with SQLP do
            begin
               Close;
               Connection:= dmEmp.SqlConSis;
               SQL.Text:=' SELECT table_catalog, table_schema, table_name, COLUMN_NAME, data_type, udt_name, character_maximum_length, numeric_precision_radix, numeric_scale '+
                         ' FROM information_schema.columns WHERE table_name = lower('+QuotedStr(cTab)+') and table_schema = '+QuotedStr( SelSchemaNome( cTab ) )+' and COLUMN_NAME = lower('+QuotedStr( aEdits[i].Name )+') ';
               Active := True;
               Open;
            end;

            if  ( LowerCase( Copy(aEdits[i].Name,1,2) ) <> 'ed' ) and ( ( ( LowerCase( Copy(aEdits[i].Name,5,3) ) <> 'cod' ) or
                ( LowerCase( Copy(aEdits[i].Name,5,6) ) = 'codbar' ) ) ) Then Begin
                Tedit( aEdits[i] ).Enabled         := lGrava ;
            End Else
            if (( SQLP.FieldByName('data_type').asstring = 'integer' )  and ( LowerCase( Copy(aEdits[i].Name,5,3) ) = 'cod' ))
                                                                     or  ( LowerCase( Copy(aEdits[i].Name,1,2) ) = 'ed' ) Then Begin
                Tedit( aEdits[i] ).Enabled         := False ;
            End Else Begin
                Tedit( aEdits[i] ).Enabled         := lGrava ;
            End;
      End Else
      if aEdits[i].ClassName = 'TMaskEdit' then Begin
          TMaskEdit( aEdits[i] ).Enabled        := lGrava  ;
      End Else
      if aEdits[i].ClassName = 'TComboBox' then Begin
          TComboBox( aEdits[i] ).Enabled        := lGrava  ;
      End Else
      if aEdits[i].ClassName = 'TDateTimePicker' then Begin
          TDateTimePicker( aEdits[i] ).Enabled  := lGrava  ;
      End Else
      if ( aEdits[i].ClassName = 'TButtonedEdit' ) Then Begin
          SQLP := TFdQuery.Create(Nil);
          with SQLP do
            begin
               Close;
               Connection:= dmEmp.SqlConSis;
               SQL.Text:=' SELECT table_catalog, table_schema, table_name, COLUMN_NAME, data_type, udt_name, character_maximum_length, numeric_precision_radix, numeric_scale '+
                         ' FROM information_schema.columns WHERE table_name = lower('+QuotedStr(cTab)+') and table_schema = '+QuotedStr( SelSchemaNome( cTab ) )+' and COLUMN_NAME = lower('+QuotedStr( aEdits[i].Name )+') ';
               Active := True;
               Open;
            end;
            //if ( Not QuerySql_x.IsEmpty ) then Begin
            if  ( SQLP.FieldByName('data_type').asstring = 'integer' )  and
                ( aEdits[i].Name = cCod )                            and
                ( LowerCase( Copy(aEdits[i].Name,5,3) ) = 'cod' )    then Begin

                  TButtonedEdit( aEdits[i] ).Enabled    := ( Not lGrava )  ;
            End Else
            if  ( SQLP.FieldByName('data_type').asstring <> 'integer' ) and
                ( aEdits[i].Name = cCod )                            and
                ( LowerCase( Copy(aEdits[i].Name,5,3) ) = 'cod' )    then Begin

                  TButtonedEdit( aEdits[i] ).Enabled    := ( Not lMostra )  ;
            End Else

            if  ( SQLP.FieldByName('data_type').asstring <> 'integer' ) and
                ( aEdits[i].Name <> cCod )                            and
                ( LowerCase( Copy(aEdits[i].Name,5,3) ) = 'cod' )    then Begin

                  TButtonedEdit( aEdits[i] ).Enabled    := ( lGrava )  ;

            End Else
            if  ( SQLP.FieldByName('data_type').asstring = 'integer' )   and
                ( aEdits[i].Name <> cCod )                            and
                ( LowerCase( Copy(aEdits[i].Name,5,3) ) = 'cod' ) then Begin

                 TButtonedEdit( aEdits[i] ).Enabled    := ( lGrava )  ;
            End Else
            if ( LowerCase( Copy(aEdits[i].Name,5,6) ) = 'codplc' ) or
               ( LowerCase( Copy(aEdits[i].Name,5,6) ) = 'codpcv' ) or
               ( LowerCase( Copy(aEdits[i].Name,5,6) ) = 'codpcr' ) or
               ( LowerCase( Copy(aEdits[i].Name,5,6) ) = 'codpct' ) then Begin

                TButtonedEdit( aEdits[i] ).Enabled    := ( lGrava )  ;
            End Else
            if ( aEdits[i].Name = cCod )                              and
               ( LowerCase( Copy(aEdits[i].Name,5,3) ) <> 'cod' ) then Begin

                TButtonedEdit( aEdits[i] ).Enabled    := ( lMostra )  ;
            End;

      End Else
        if ( aEdits[i].ClassName = 'TButtonedEdit' ) and  ( aEdits[i].Name <> cCod ) then Begin
          TButtonedEdit( aEdits[i] ).Enabled    := lGrava  ;
      End Else
      if aEdits[i].ClassName = 'TRichEdit' then Begin
          TRichEdit( aEdits[i] ).ReadOnly       := ( Not lGrava )  ;
      End Else
      if aEdits[i].ClassName = 'TMemo' then Begin
          TMemo( aEdits[i] ).Enabled            := lGrava  ;
      End Else
      if aEdits[i].ClassName = 'TCheckBox' then Begin
          TCheckBox( aEdits[i] ).Enabled        := lGrava  ;
      End Else
      if ( aEdits[i].ClassName =  'TImage' ) and ( aEdits[i].Name <> 'imgLogo') then Begin
          TImage( aEdits[i] ).Enabled           := lGrava  ;
      End;
  end;
end;

{*************************************************************************
 Pega componentes
**************************************************************************}
Function PegaCmpFrm(ClassComponent: Tcomponent; cPre: String ): Tcomponent ;
var
i, tmp: Integer;
Matraiz : TArrayComp;
begin
      //Pega todos o TEduits
      if (ClassComponent.ClassName = 'TEdit')  Then Begin
         Result  := Tedit( ClassComponent ) ;
      End Else
      //Pega todos o TMaskEdit
      if ( ClassComponent.ClassName = 'TMaskEdit' ) and  ( UpperCase( Copy( ClassComponent.Name,1,4) ) = UpperCase( cPre ) )  then  Begin
          Result  := TMaskEdit( ClassComponent ) ;
      End Else
      //Pega todos o TComboBox
      if ( ClassComponent.ClassName = 'TComboBox' ) and  ( UpperCase( Copy( ClassComponent.Name,1,4) ) = UpperCase( cPre ) )  then  Begin
          Result  := TComboBox( ClassComponent ) ;
      End Else
      //Pega todos o TDateTimePiker
      if ( ClassComponent.ClassName = 'TDateTimePicker' ) and  ( UpperCase( Copy( ClassComponent.Name,1,4) ) = UpperCase( cPre ) ) then  Begin
          Result  := TDateTimePicker( ClassComponent ) ;
      End Else
      //Pega todos o TButtonedEdit
      if ( ClassComponent.ClassName = 'TButtonedEdit' ) and  ( UpperCase( Copy( ClassComponent.Name,1,4) ) = UpperCase( cPre ) )  then Begin
          Result  := TButtonedEdit( ClassComponent ) ;
      End Else
      //Pega todos o TMemo
      if ClassComponent.ClassName = 'TRichEdit' then Begin
          Result  := TRichEdit( ClassComponent ) ;
      End Else
      //Pega todos o TMemo
      if ClassComponent.ClassName = 'TMemo' then Begin
          Result  := TMemo( ClassComponent ) ;
      End Else
      if ( ClassComponent.ClassName = 'TImage' ) and ( UpperCase( Copy( ClassComponent.Name,1,4) ) = UpperCase( cPre ) ) then Begin
          Result  := TImage( ClassComponent ) ;
      End Else
      If  ClassComponent.ClassName = 'TCheckBox' Then Begin
          Result  := TCheckBox( ClassComponent ) ;
      End Else Begin
          Result  := Nil;
      End;



End;

{*************************************************************************
 Procedure que alimenta os get de inserções com os dados atualizado
**************************************************************************}
Procedure RefreshDialog2(cPre: String; campo: Integer; frm : TForm; sqlNew: TFdQuery; aEdits: TArrayComp);
var
i, tmp: Integer;
aMatriz: array Of TComponent;
begin
i := 0;
 { Se o Campo for igual 1 ele acrecenta novo resitrto e se for campo = 0 apenas altera }
 if ( campo = 1 ) or (sqlNew.IsEmpty) then Begin
    For i := 0 to Length(aEdits)-1 do begin
        If ( aEdits[i].ClassName = 'TEdit' ) and ( LowerCase( Copy(TEdit(aEdits[i]).Name,1,4) ) = LowerCase(cPre)  ) Then  Begin
                TEdit(aEdits[i]).MaxLength := sqlNew.FieldByName( aEdits[i].name ).Size;
            End Else
        If aEdits[i].ClassName = 'TMaskEdit' Then Begin
              if Copy( UpperCase( aEdits[i].name),5,3 ) = 'VLR' then Begin
                 TMaskEdit(aEdits[i]).Text := FormatCurr('R$ ###,###,##0.00',0)
              End Else
              if Copy( UpperCase( aEdits[i].name),5,3 ) = 'NMR' then Begin
                 TMaskEdit(aEdits[i]).Text := FormatCurr('##0',0)
              End Else
              if ( Copy( UpperCase( aEdits[i].name),5,4 ) = 'TANQ' ) or
                 ( Copy( UpperCase( aEdits[i].name),5,3 ) = 'LTS' ) then Begin
                 TMaskEdit(aEdits[i]).Text := FormatCurr('Lt ###,##0.000',0)
              End Else
              if Copy( UpperCase( aEdits[i].name),5,2 ) = 'KG' then Begin
                 TMaskEdit(aEdits[i]).Text := FormatCurr('Kg ###,##0.000',0)
              End Else
              if Copy( UpperCase( aEdits[i].name),5,2 ) = 'KM' then begin
                 TMaskEdit(aEdits[i]).Text := FormatCurr('Km #,###,##0',0)
              End Else
              if Copy( UpperCase( aEdits[i].name),5,3 ) = 'PCT' then begin
                 TMaskEdit(aEdits[i]).Text := FormatCurr('##0.00%',0)
              End Else
              if Copy( UpperCase( aEdits[i].name),5,3 ) = 'QTD' then begin
                 TMaskEdit(aEdits[i]).Text := FormatCurr('###1',0)
              End Else
              if Copy( UpperCase( aEdits[i].name),5,3 ) = 'EST' then begin
                 TMaskEdit(aEdits[i]).Text := FormatCurr('###,##0.000',0)
              End Else
                 TMaskEdit(aEdits[i]).MaxLength := sqlNew.FieldByName( aEdits[i].name ).Size;
          End Else
        If aEdits[i].ClassName = 'TComboBox' Then Begin
                TComboBox(aEdits[i]).MaxLength := sqlNew.FieldByName( aEdits[i].name ).Size;
            End Else
        If aEdits[i].ClassName = 'TDateTimePicker' Then Begin
                TDateTimePicker(aEdits[i]).Date := Now;
            End Else
        If aEdits[i].ClassName = 'TButtonedEdit' Then Begin
                TButtonedEdit(aEdits[i]).MaxLength := sqlNew.FieldByName( aEdits[i].name ).Size;
            End Else
        If aEdits[i].ClassName = 'TRichEdit' Then Begin
                TRichEdit(aEdits[i]).MaxLength := sqlNew.FieldByName( aEdits[i].name ).Size;
            End Else
        If aEdits[i].ClassName = 'TMemo' Then Begin
                TMemo(aEdits[i]).text := sqlNew.FieldByName( aEdits[i].name ).AsString
            End Else
        If aEdits[i].ClassName = 'TCheckBox' Then Begin
                TCheckBox(aEdits[i]).Checked := False;
            End Else
        If aEdits[i].ClassName = 'TImage' Then Begin
            TImage(aEdits[i]).Picture.Bitmap.Assign(Nil);
            TImage(aEdits[i]).Parent.Repaint;
            End;
    End;
 End Else Begin
    For i := 0 to Length(aEdits)-1 do begin
        If ( aEdits[i].ClassName = 'TEdit' ) and ( LowerCase( Copy(TEdit(aEdits[i]).Name,1,4) ) = LowerCase(cPre)  ) Then Begin
              if sqlNew.FieldByName( aEdits[i].name ).Text = '' then Begin
                  TEdit(aEdits[i]).Clear
              End Else
              If ( aEdits[i].ClassName = 'TEdit' ) and
                 ( LowerCase( Copy(aEdits[i].Name,1,4) ) = LowerCase(cPre)  ) and
                 ( LowerCase( Copy(aEdits[i].Name,5,5) ) = 'senha'  )  Then  Begin
                  TEdit(aEdits[i]).Text := Trim( u_funcao.Criptografar( sqlNew.FieldByName( aEdits[i].name ).Value ) ) ;
              End Else Begin
                  TEdit(aEdits[i]).Text := sqlNew.FieldByName( aEdits[i].name ).Value;
              End;
           End Else
        If aEdits[i].ClassName = 'TMaskEdit' Then Begin
              if Copy( UpperCase( aEdits[i].name),5,3 ) = 'VLR' then Begin
                 TMaskEdit(aEdits[i]).Text := FormatCurr('R$ #,###,##0.00',sqlNew.FieldByName( aEdits[i].name ).Value)
              End Else
              if Copy( UpperCase( aEdits[i].name),5,3 ) = 'NMR' then Begin
                 TMaskEdit(aEdits[i]).Text := FormatCurr('##0',sqlNew.FieldByName( aEdits[i].name ).Value)
              End Else
              if ( Copy( UpperCase( aEdits[i].name),5,4 ) = 'TANQ' ) or
                 ( Copy( UpperCase( aEdits[i].name),5,3 ) = 'LTS' ) then Begin
                 TMaskEdit(aEdits[i]).Text := FormatCurr('Lt ###,##0.000',sqlNew.FieldByName( aEdits[i].name ).Value)
              End Else
              if Copy( UpperCase( aEdits[i].name),5,2 ) = 'KG' then Begin
                 TMaskEdit(aEdits[i]).Text := FormatCurr('Kg ###,##0.000',sqlNew.FieldByName( aEdits[i].name ).Value)
              End Else
              if Copy( UpperCase( aEdits[i].name),5,2 ) = 'LT' then Begin
                 TMaskEdit(aEdits[i]).Text := FormatCurr('Lt ###,##0.000',sqlNew.FieldByName( aEdits[i].name ).Value)
              End Else
              if Copy( UpperCase( aEdits[i].name),5,3 ) = 'PCT' then Begin
                 TMaskEdit(aEdits[i]).Text := FormatCurr('##0.00%',sqlNew.FieldByName( aEdits[i].name ).Value)
              End Else
              if Copy( UpperCase( aEdits[i].name),5,3 ) = 'EST' then Begin
                 TMaskEdit(aEdits[i]).Text := FormatCurr('###,##0.000',sqlNew.FieldByName( aEdits[i].name ).Value)
              End Else
              if Copy( UpperCase( aEdits[i].name),5,3 ) = 'QTD' then Begin
                 TMaskEdit(aEdits[i]).Text := sqlNew.FieldByName( aEdits[i].name ).Value
              End Else
                 if Copy( UpperCase( aEdits[i].name),5,2 ) = 'KM' then
                 TMaskEdit(aEdits[i]).Text := FormatCurr('Km #,###,##0',sqlNew.FieldByName( aEdits[i].name ).Value)
              Else
                if Not sqlNew.FieldByName( aEdits[i].name ).IsNull then begin
                    TMaskEdit(aEdits[i]).Text := sqlNew.FieldByName( aEdits[i].name ).Value;
                end Else Begin
                    //TMaskEdit(aEdits[i]).Text := sqlNew.FieldByName( aEdits[i].name ).;
                End;
        End Else
        If aEdits[i].ClassName = 'TComboBox' Then Begin
               TComboBox(aEdits[i]).ItemIndex :=  TComboBox(aEdits[i]).Items.IndexOf(sqlNew.FieldByName( aEdits[i].name ).Text);
            End Else
        If aEdits[i].ClassName = 'TDateTimePicker' Then Begin
                if Not sqlNew.FieldByName( aEdits[i].name ).IsNull then Begin
                   TDateTimePicker(aEdits[i]).Format := '';
                   TDateTimePicker(aEdits[i]).Date := sqlNew.FieldByName( aEdits[i].name ).Value;
                End Else
                   TDateTimePicker(aEdits[i]).Format := '  /  /    ';
            End Else
        If aEdits[i].ClassName = 'TButtonedEdit' Then Begin
                if sqlNew.FieldByName( aEdits[i].name ).Text = '' then Begin
                   TButtonedEdit(aEdits[i]).Clear;
                End Else Begin
                  TButtonedEdit(aEdits[i]).Text := sqlNew.FieldByName( aEdits[i].name ).Value;
                End;
            End Else
        If aEdits[i].ClassName = 'TRichEdit' Then Begin
                TRichEdit(aEdits[i]).Text := sqlNew.FieldByName( aEdits[i].name ).Value ;
            End Else
        If aEdits[i].ClassName = 'TMemo' Then Begin
              TMemo(aEdits[i]).Text := sqlNew.FieldByName( aEdits[i].name ).AsString
            End Else
        If aEdits[i].ClassName = 'TCheckBox' Then Begin
              TCheckBox(aEdits[i]).Checked:= sqlNew.FieldByName( aEdits[i].name ).AsBoolean
            End Else
        If aEdits[i].ClassName = 'TImage' Then Begin
            if Not TBlobField( sqlNew.FieldByName( aEdits[i].Name ) ).IsNull then begin
               If LoadImage( TImage(aEdits[i]), TBlobField( sqlNew.FieldByName( aEdits[i].Name ) ) ) then
            End Else Begin
              TImage(aEdits[i]).Picture.Bitmap.Assign(Nil);
              TImage(aEdits[i]).Parent.Repaint;
            End;

          End
    end;

  End;

  // Definindo os Hints dos Botões e Busca dos Relacionamentos
  For i := 0 to Length(aEdits)-1 do begin
    if (aEdits[i].ClassName = 'TButtonedEdit' ) and ( TButtonedEdit(aEdits[i]).Hint = '' ) then Begin
        TButtonedEdit(aEdits[i]).CustomHint :=  FPrincipal.HintBalloo ;
        TButtonedEdit(aEdits[i]).ShowHint   :=  True;
        TButtonedEdit(aEdits[i]).Hint       := 'Atenção | Para pesquisar pressione a tecla [END] '+#13#10+' do seu teclado e aparecerá as opções de consulta '+#13#10+' | 256';
        If TButtonedEdit(aEdits[i]).Text <> '' Then Begin
           //TButtonedEdit(Components[i]).OnExit(Self);
        End;
    End;
  end;

end;


{*************************************************************************
 Procedure que salva os dados
**************************************************************************}
procedure gravadados2(cTab,cPre,cCamp01,cCamp02,cQuery: String; nNew: Integer; frm: TForm; zConn: TFdConnection; aEdits: array of TComponent );
Var
foto: TFileStream;
BinFile : TMemoryStream;
cUsu, cHora, ccmb_horalt,cCodSql, cIteSql,cValSql,cCodMnt : string ;
dData, dcmb_datalt : TDate ;
i, tmp, indice: Integer;
qGrava : TFdQuery ;
Stream    : TMemoryStream;

begin

 with Taguarde.ShowWaitForm('') do
     try

        // Criando query par gravar
        qGrava            := TFdQuery.Create(Nil) ;
        qGrava.Connection := zConn;

        // Montando o Código
        cCodMnt           := '00001';
        cUsu              := nmUsuario;
        dData             := date ;
        cHora             := TimeToStr(time) ;

        BinFile           := TMemoryStream.Create;
        Stream            := TMemoryStream.Create;


        for i := 0 to Length(aEdits)-1 do begin
            if  LowerCase( aEdits[i].Name ) = LowerCase( cCamp01 ) then
                indice := i;
        end;
        cQuery :=   cCamp01+' = '+QuotedStr( TButtonedEdit(aEdits[indice]).Text );


        {  Rotina de Inclusão e alteração
                             ___________________________________________________________________________________ Array de Componentes
                             |        __________________________________________________________________________ Tabela onde será gravador
                             |        |    _____________________________________________________________________ Pré-Fixo dos campos
                             |        |    |    ________________________________________________________________ Define se é novo registro ou alteração
                             |        |    |    |      _________________________________________________________ Campo 01 para não ser visto pela rotina
                             |        |    |    |      |        ________________________________________________ Campo 02 para não ser visto pela rotina
                             |        |    |    |      |        |        _______________________________________ Query de Pesquisa para alteração
                             |        |    |    |      |        |        |    |                    |                                             }
        cCodSql:= SalvaSql(aEdits, cTab, cPre, nNew,cCamp01, cCamp02,  cQuery  );
        qGrava.SQL.Text := cCodSql ;

        {  Verifica campos como Fotos e Memos}
          For i := 0 to Length(aEdits)-1 do begin

              If aEdits[i].ClassName = 'TRichEdit' Then Begin
                  TRichEdit(aEdits[i]).Lines.SaveToStream(Stream);
                  qGrava.ParamByName(aEdits[i].Name).AsMemo  := TRichEdit(aEdits[i]).Lines.GetText;
                  End Else
              If aEdits[i].ClassName = 'TImage' Then Begin
                  if TImage(aEdits[i]).Picture.Graphic <> Nil then Begin
                     TImage(aEdits[i]).Picture.Graphic.SaveToStream(BinFile);
                  End;
                  qGrava.ParamByName(aEdits[i].Name).LoadFromStream(BinFile, ftBlob);
              End
          end;

        Try
          IniTransacao;
          qGrava.ExecSQL;
          FimTransacao

        except
            on Exc:Exception do
               begin
                RollBack;
                ShowMessage('erro : ' + Exc.Message);
            end;

        End;

        { Registra as ações na tabela de auditoria do sistema}
        if nNew > 0  then begin
          //if UpperCase( Copy( cCamp01,5,3 ) ) = 'COD'   then Begin
           If U_funcao.ChkVar(cTab, cCamp01 , 'integer') then begin
             Auditor( frm.Caption, 'Inseriu','Cód: '+PegaUltCodSalvo( cTab, cCamp01, cPre ) );
          End Else
             Auditor( frm.Caption, 'Inseriu','Reg: '+ TButtonedEdit(aEdits[indice]).Text );
        end else begin
          Auditor(frm.Caption,'Alterou','Cód: '+ TButtonedEdit(aEdits[indice]).Text );
        end;

        //if DmEmp.TelaP = 'R' then begin
        //   qGrava.Close;
        //end;

    finally
      AllowClose;
      Free;
    end;


end;

Function PegaUltCodSalvo( cTab, cCamp01, cPre :String ): String;
Var
qSql : TFdQuery;
cSql,cCampo : String;
Begin
      cCampo := cPre+cCamp01;
      cCamp01 := cCamp01+'_seq' ;
      qSql    := TFdQuery.Create(Nil);
      qSql.Close;
      if SelSchemaNome( cTab ) = 'dbconfig' then Begin
         qSql.Connection  := DmEmp.sqlConSis;
         cSql             := 'SELECT last_value FROM "'+SelSchemaNome( cTab )+'".'+cTab+'_'+cCamp01;
      End Else Begin
         qSql.Connection  := DmEmp.sqlConSis;
         cSql             := 'SELECT last_value FROM "'+SelSchemaNome( cTab )+'".'+cTab+'_'+cCamp01;
      End;
      qSql.SQL.Text := cSql;
      qSql.Open;
      Result := qSql.FieldByName('last_value').Text ;

End;


end.


{
********************************************************************************
********************************************************************************
********************************************************************************

Metodos que devem ser alterados

USES U_ClassCad;

public
    aEdits : TArrayComp;
    cPre, cTabela: String;

 -> NA PESQUISA DE CODIGO DO REGISTRO
  if Pesquisa.lOk then Begin
     acampo             := 0;
     RefreshDados('S');
     btnNovo.Enabled    := False;
     btnAlterar.Enabled := True;
     ativaButoes(1);
     ativaget;
     navegacao(5);
  End;


procedure TfrmTipo.FormCreate(Sender: TObject);
Var
i: Integer;
begin
  cPre                        := 'tip_';
  cTabela                     := 'tipo';
  acampo                      := 1;
  sqlNew                      := TFdQuery.Create(nil);
  sqlNew.Connection           := DmEmp.sqlConSis;
  fPrincipal.btntipo.Enabled  := False;
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;
end;


procedure TfrmTipo.gravadados;
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, ctip_horalt,cCodSql, cIteSql,cValSql,cCodMnt : string ;
dData, dtip_datalt : TDate ;
i, tmp: Integer;
SQLQ : TFdQuery ;
begin
   gravadados2(cTabela,cPre,cPre+'codigo','X','', nNew, frmTipo, DmEmp.sqlConSis, aEdits );
end;

procedure TfrmTipo.limpaget;
Var
i: Integer;
begin
  limpaget2(aEdits);
end;

procedure TfrmTipo.navegacao(Ord: Integer);
begin
  navegacao2( Ord, acampo, btnIni, btnAnt, btnProx, btnUlt, sqlNew, DmEmp.sqlTipo, tip_codigo );
  acampo := 0;
  RefreshDialog2(cPre,acampo, frmTipo, sqlNew, aEdits);
  acampo := 1;
end;

procedure TfrmTipo.RefreshDados(tipo: String);
var
  i: integer;
  cWhere, cQuery, cOrder: String;

begin
  RefreshDados2(acampo, tipo,  tip_codigo, sqlNew, DmEmp.sqlTipo );
end;


procedure TfrmTipo.RefreshDialog;
var
  i, tmp: Integer;
  frmx : TForm ;
begin
  RefreshDialog2(cPre,acampo, frmTipo, sqlNew, aEdits);
end;


procedure TfrmTipo.ativaButoes(tipo:Integer);
begin
ativaButoes2(Tipo,  btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt, sqlNew);
end;

procedure TfrmTipo.ativaget;
begin
  ativaget2(aEdits,cPre+'codigo', btnGrava.Enabled, lMostra );
end;


procedure TfrmMarca.btnExcluirExecute(Sender: TObject);
Var
aSubTab : TArrayDim2;
n: Integer;
begin
   //SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'acessoratv';     aSubTab[n][1] := '';
   If Exclui2(cTabela, aSubTab,  vat_placa, btnExcluir) Then Begin;
       RefreshDados('T');
       ativaButoes(1);
       limpaget;
       lMostra := True;
       ativaget;
       navegacao(4);
       acampo := 1;
       nNew   := acampo;
   End;
end;


***************************************************************
***************************************************************
***************************************************************
***************************************************************
***************************************************************
***************************************************************
***************************************************************
**** paaa inclusão nos pontes de inserção de itens
***************************************************************
 nNew := GravarSub(cTabela,cPre,cPre+'codigo','X','', nNew, aCampo, frmPontoAbt, DmEmp.sqlConSis, aEdits, sqlNew, DmEmp.sqlPontoAbt, pab_codigo );
 if nNew > 0 then begin
     Exit;
 End;



}
