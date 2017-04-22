{
CLASSE DE UTILIDADE DI SISTEMA
PROGRAMADIR: ALESSANDRO AVELINO CAVALCANTE

}
unit U_ClasseUtil;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, ImgList, ExtCtrls, ComCtrls, xmldom,
  XMLIntf, IdHTTP, msxmldom, XMLDoc, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, ExtDlgs, RibbonLunaStyleActnCtrls, Ribbon,
  ToolWin, ActnMan, ActnCtrls, jpeg, SqlExpr, ZDataset, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client ;


type
  TClasseUtil = class
      frmGet: TForm;
      Private
      { Variaveis Privadas }
        Consulta:  String;
        Resposta:  TStringStream;
        TSConsCep: TStringList;
        IdHTTP:    TIdHTTP;
        IdTCPClient1: TIdTCPClient;
        XMLBuscaCEP: TXMLDocument ;
      Public
      { Variaveis Publicas }

        EndCep, BaiCep, ComCep, CidCep, UfCep, CodCid: String;
        Function pegarcep(CepEmp: string): Boolean;
        Procedure MondaGetPinta;
        Procedure PintaGet;
        function iif(lCondicao: boolean; xRetorno1: variant; xRetorno2: variant): variant;
        Function HintBalao(Tp: Integer; texto: String): String;
        Function _BuscaCEPNet( _aTFieldCEP: String ): Boolean;
        Function ChkCep(pCEP: String; Cod: TButtonedEdit ): Boolean;
      Published
      constructor Create;
  end;

implementation
Uses u_Funcao, uSistema, U_dmEmp;
{ TClasseUtil }

constructor TClasseUtil.Create;
begin
 EndCep:='';
 BaiCep:='';
 ComCep:='';
 CidCep:='';
 UfCep:='';
 CodCid:='';
end;

Function TClasseUtil.ChkCep(pCEP: String; Cod: TButtonedEdit): Boolean;
var
  SQLQ          : TFDQuery ;
  tempXML       : IXMLNode;
  tempNodePAI   : IXMLNode;
  tempNodeFilho : IXMLNode;
  XMLDocument1  : IXMLDocument ;
  I :Integer;
  pPath, cNomeArq : String;
begin
   if pCEP = '99999999' then Begin
         MessageDlg('O CEP não foi Informado',mtError,[mbOk],0);
         Result := False;
   End Else Begin

     pPath := LowerCase( ExtractFilePath(Application.ExeName));
     XMLDocument1 := TXMLDocument.Create(nil);

     //XMLDocument1.FileName := 'http://www.devmedia.com.br/devware/cep/service/?cep='+pCEP+'&chave='+pChave+'&formato=xml';
     XMLDocument1.FileName := 'http://cep.republicavirtual.com.br/web_cep.php?cep='+pCEP+'&formato=xml';
     XMLDocument1.FileName := 'http://api.postmon.com.br/v1/cep/'+Rem_( pCEP )+'?format=xml';
     XMLDocument1.Active   := true;
     cNomeArq     := pPath+FormatDateTime('ddmmyyyy_hhmmss', Now)+ '.xml';
     if DirectoryExists(pPath) then
        XMLDocument1.SaveToFile( cNomeArq );

     tempXML := XMLDocument1.DocumentElement;
     Try

         tempNodePAI := tempXML.ChildNodes.FindNode('logradouro');
         for i := 0 to tempNodePAI.ChildNodes.Count - 1 do
         begin
            endcep := AnsiUpperCase( tempNodePAI.ChildNodes[i].Text );
            if Pos('(',endcep ) > 0 then begin
               ComCep := Rem_( Explode(endcep, '(')[1] );
               endcep := Copy(endcep,1, ( Pos('(',endcep )-1 ) )
            end else Begin
               ComCep := ComCep ;
               endcep := endcep ;
            End;
         end;
         {
         tempNodePAI := tempXML.ChildNodes.FindNode('complemento');
         for i := 0 to tempNodePAI.ChildNodes.Count - 1 do
         begin
             ComCep := AnsiUpperCase( tempNodePAI.ChildNodes[i].Text );
         end;
         }
         tempNodePAI := tempXML.ChildNodes.FindNode('bairro');
         for i := 0 to tempNodePAI.ChildNodes.Count - 1 do
         begin
            BaiCep :=  AnsiUpperCase( tempNodePAI.ChildNodes[i].Text );
         end;
         tempNodePAI := tempXML.ChildNodes.FindNode('cidade');
         for i := 0 to tempNodePAI.ChildNodes.Count - 1 do
         begin
            CidCep :=  AnsiUpperCase( tempNodePAI.ChildNodes[i].Text ) ;
         end;
         tempNodePAI := tempXML.ChildNodes.FindNode('estado');
         for i := 0 to tempNodePAI.ChildNodes.Count - 1 do
         begin
            UfCep := AnsiUpperCase( tempNodePAI.ChildNodes[i].Text );
         end;
         // Verifica a existencia da cidade na tabela de cidade
         SQLQ := TFDQuery.Create(nil);

         with SQLQ do
           begin
             Close;
             Connection:= dmEmp.SqlConSis;
             SQL.Text:=' Select * from  '+U_funcao.SelSchema('cidade')
                      +' left join '+U_funcao.SelSchema('estado')+' on est_codigo = cid_codest '
                      +' Where UPPER(cid_nome) = UPPER('+QuotedStr(CidCep)+') and UPPER(est_uf) = UPPER('+QuotedStr(UfCep)+')';
             Active := True;
             Open;
           end;

         // Se tiver vazia ele cria a tabela
         if SQLQ.IsEmpty and ( Not CidCep.IsEmpty ) then Begin
           with SQLQ do
             begin
               Close;
               Connection:= dmEmp.SqlConSis;
               SQL.Text:=' insert into '+U_funcao.SelSchema('cidade')+' ( nome , uf , usuinc, datinc, horinc ) values ( :nome, :uf, :usu,  :data ,  :hora ) ';
               ParamByName('nome').Text   := CidCep;
               ParamByName('uf').Text     := UfCep;
               ParamByName('usu').Text    := 'WebConsulta';
               ParamByName('data').AsDate := Now;
               ParamByName('hora').Text   := TimeToStr(Time);
               ExecSQL;
             end;
         End;
         with SQLQ do
           begin
             Close;
             Connection:= dmEmp.SqlConSis;
             SQL.Text:=' Select * from  '+U_funcao.SelSchema('cidade')
                      +' left join '+U_funcao.SelSchema('estado')+' on est_codigo = cid_codest '
                      +' Where UPPER(cid_nome) = UPPER('+QuotedStr(CidCep)+') and UPPER(est_uf) = UPPER('+QuotedStr(UfCep)+')';
             Active := True;
             Open;
           end;
           // Se tiver vazia ele cria a tabela
           if Not SQLQ.IsEmpty then Begin
              Cod.Text := SQLQ.FieldByName('cid_codigo').Text;
           End;



         {
         tempNodePAI := tempXML.ChildNodes.FindNode('unidade');
         for i := 0 to tempNodePAI.ChildNodes.Count - 1 do
         begin
            tempNodeFilho := tempNodePAI.ChildNodes[i];
            memo1.Lines.Add('Unidade ...: ' +  tempNodeFilho.Text);
         end;
         tempNodePAI := tempXML.ChildNodes.FindNode('cpc');
         for i := 0 to tempNodePAI.ChildNodes.Count - 1 do
         begin
            tempNodeFilho := tempNodePAI.ChildNodes[i];
            memo1.Lines.Add('cpc ...: ' +  tempNodeFilho.Text);
         end;
          }
         Windows.DeleteFile( pchar( cNomeArq ) );
         Result := True;
      except
         MessageDlg('O CEP informado não foi encontrado ou não é valido',mtError,[mbOk],0);
         Result := True;
      End;
   End;

 end;


Function TClasseUtil._BuscaCEPNet(_aTFieldCEP: String ): Boolean;
var
  _aidHTTP: TIdHTTP;
  _ListaEndereco : TStringList;
  _varEndereco, _varBairro, _varCidade, _varUf : string;
begin
   //Todo: consultar a rua pelo cep via net
   _aidHTTP := TIdHTTP.Create(Nil);
   { Apenas vai consumir o webservices caso o checkbox esteja marcado como true e
    o endereço não estiver preenchido }
    //Cria-se uma string List
    _ListaEndereco := TStringList.Create;
    //Nesta linha busca-se a informação através da url indicada
    //StrinReplace eh utilizada para substituir os caracteres & por CR
    //UrlDecode eh para eliminar caracteres de código html para acentos
    //&formato=query_string ou xml javascript
    //ele retorna para o componente em qualquer um dos formatos acima
    //Mais detalhes entre na pagina http://republicavirtual.com.br
    Try
      _ListaEndereco.Text := StringReplace(_aidHTTP.URL.URLDecode(_aidHTTP.Get('http://republicavirtual.com.br/web_cep.php?cep='+_aTFieldCEP+'&formato=query_string')),'&',#13#10,[rfReplaceAll]);
      //_ListaEndereco vira uma matriz e fazemos o acesso aos dados...

      endcep   := AnsiUpperCase ( _ListaEndereco.Values['TIPO_LOGRADOURO']+' '+_ListaEndereco.Values['LOGRADOURO'] );
      BaiCep   := AnsiUpperCase(_ListaEndereco.Values['BAIRRO'] ) ;
      CidCep   := AnsiUpperCase(_ListaEndereco.Values['CIDADE'] );
      UfCep    := AnsiUpperCase(_ListaEndereco.Values['UF'] );
      Result := True;
    except
       MessageDlg('O CEP informado não foi encontrado ou não é valido',mtError,[mbOk],0);
       Result := False;
    End;


end;




Function TClasseUtil.pegarcep(CepEmp: string): Boolean;
Var
  _ListaEndereco : TStringList;
begin

  //verifica se o campo foi preenchido corretamente
  if (CepEmp = '') or (Length(CepEmp) < 8) then
    begin
    //Aviso caso os numeros sejam invalidos
    Application.MessageBox('CEP inválido.', 'Erro - Aviso do Sistema', mb_iconwarning+mb_ok);
    Result := False;
  end Else Begin
    Try
      //Inicia a Pesquisa no site.
      Resposta  := TStringStream.Create;
      TSConsCep := TStringList.Create;
      _ListaEndereco := TStringList.Create;
      IdHTTP    := TIdHTTP.Create;
      IdHTTP.Request.UserAgent:='Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV2';

      TSConsCep.Values['&cep'] := CepEmp;
      TSConsCep.Values['&formato'] := 'xml';
      TSConsCep.Text;

      //Link para consulta e ativação do navegador e XML de busca
//      IdHTTP.Post('http://republicavirtual.com.br/web_cep.php?', TSConsCep, Resposta);
//      Resposta.LoadFromStream := StringReplace(IdHTTP.URL.URLDecode(IdHTTP.Get('http://republicavirtual.com.br/web_cep.php?cep='+CepEmp+'&formato=query_string')),'&',#13#10,[rfReplaceAll]) ;
      XMLBuscaCEP := TXMLDocument.Create(XMLBuscaCEP);
      XMLBuscaCEP.Active := True;
      XMLBuscaCEP.Encoding := 'iso-8859-1';
      XMLBuscaCEP.LoadFromStream( Resposta );
      //escreve os dados buscados nos referidos campos.
      //Obs: Faça ele escrever os dados no banco de dados para não apagar o campo quando vc tentar voltar nele clicando com o mouse
      endcep    := UpperCase( XMLBuscaCEP.DocumentElement.ChildNodes['tipo_logradouro'].NodeValue+' '+XMLBuscaCEP.DocumentElement.ChildNodes['logradouro'].NodeValue );
      BaiCep    := UpperCase( XMLBuscaCEP.DocumentElement.ChildNodes['bairro'].NodeValue );
      CidCep    := UpperCase( XMLBuscaCEP.DocumentElement.ChildNodes['cidade'].NodeValue );
      UfCep     := UpperCase( XMLBuscaCEP.DocumentElement.ChildNodes['uf'].NodeValue );

      //Limpa a consulta da memoria.
      TSConsCep.Free;
      Resposta.Free;
      XMLBuscaCEP.Active := False;
      Result := True;
    except
       MessageDlg('O CEP informado não foi encontrado ou não é valido',mtError,[mbOk],0);
       Result := False;
    End;

  End;


end;

function TClasseUtil.HintBalao(Tp: Integer; texto: String): String;
{Função que serve para nao aceitar caracteres especiais tipo !@#$%^&*()}
const
  _Remove = ';';
  _Quebra = '+#10#13+' ;
var
  x: Integer;
  cResultado : String;
begin

  for x := 1 to Length(texto) do Begin
      if Pos(texto[x], _Remove) <> 0 then Begin
        cResultado := cResultado +_Quebra
      End else Begin
        cResultado := cResultado + texto[x];
      end;
  End;

  if Tp = 1 Then
    cResultado := ''+' Atenção |'+cResultado+'| 1'+'' ;

  ShowMessage(cResultado);
  Result := cResultado+'#10#13' ;
  ShowMessage(cResultado) ;
   //' Atenção | Para pesquisar pressione a tecça [END] '+#10#13+'do seu teclado, e aparecerá as opções da tabela  '+#10#13+' | 0'
end;

procedure TClasseUtil.MondaGetPinta;
Var
nI : Integer;
begin

      For nI := 0 to frmGet.ComponentCount-1 do Begin

       if (frmGet.Components[nI] is TEdit) then
           if Tedit(frmGet.Components[nI]).Enabled then Begin
              //(Components[nI] as TEdit).OnEnter :=
              PintaGet;
           End;

       if (frmGet.Components[nI] is TMaskEdit) then Begin
       //(Components[nI] as TMaskEdit).OnEnter :=
          PintaGet;
       End;

       if (frmGet.Components[nI] is TButtonedEdit) then Begin
       //(Components[nI] as TButtonedEdit).OnEnter :=
          PintaGet;
       End;

       if (frmGet.Components[nI] is TDateTimePicker) then Begin
       //(Components[nI] as TDateTimePicker).OnEnter :=
          PintaGet;
       End;


      End;

end;



procedure TClasseUtil.PintaGet;
var
nI: Integer;
begin
  For nI := 0 to frmGet.ComponentCount-1 do  begin

    if (frmGet.Components[nI] is TEdit)  then
      begin
        If Tedit(frmGet.Components[nI]).Enabled Then Begin
          if TEdit(frmGet.Components[nI]).Focused then
             TEdit(frmGet.Components[nI]).Color := clYellow
          else
            TEdit(frmGet.Components[nI]).Color := u_funcao.Branco;
        End;
      end;

    if (frmGet.Components[nI] is TMaskEdit) then
      begin
        if TMaskEdit(frmGet.Components[nI]).Focused then
           TMaskEdit(frmGet.Components[nI]).Color := clYellow
        else
           TMaskEdit(frmGet.Components[nI]).Color := u_funcao.Branco;
      end;

    if (frmGet.Components[nI] is TButtonedEdit) then
      begin
        if TButtonedEdit(frmGet.Components[nI]).Focused then
           TButtonedEdit(frmGet.Components[nI]).Color := clYellow
        else
          TButtonedEdit(frmGet.Components[nI]).Color := u_funcao.Branco;
      end;

    if (frmGet.Components[nI] is TDateTimePicker) then
      begin
        if TDateTimePicker(frmGet.Components[nI]).Focused then
           TDateTimePicker(frmGet.Components[nI]).Color := clYellow
        else
          TDateTimePicker(frmGet.Components[nI]).Color := u_funcao.Branco;
      end;

  end;

end;

function TClasseUtil.iif(lCondicao: boolean; xRetorno1: variant; xRetorno2: variant): variant;
begin
if lCondicao then
  result := xRetorno1
else
  result := xRetorno2;
end;
end.
