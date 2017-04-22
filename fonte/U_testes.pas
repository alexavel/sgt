unit U_testes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.OleCtrls, SHDocVw,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc, ActiveX;

type
  TfrmTestes = class(TForm)
    Memo1: TMemo;
    WebBrowser1: TWebBrowser;
    Button1: TButton;
    IdHTTP1: TIdHTTP;
    XMLDocument1: TXMLDocument;
    procedure Button1Click(Sender: TObject);
  private
    procedure WebBrowser1Enter(Sender: TObject);
    function pegarcep(CepEmp: string): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTestes: TfrmTestes;

implementation

{$R *.dfm}
procedure TfrmTestes.Button1Click(Sender: TObject);
var
  oStringList: TStringList;
  cSaite, HTML : string;
  tempXML       : IXMLNode;
  tempNodePAI   : IXMLNode;
  tempNodeFilho : IXMLNode;
  XMLDocument1  : IXMLDocument ;
  I :Integer;
  pPath : String;

begin

     pPath := LowerCase( ExtractFilePath(Application.ExeName));
     //XMLDocument1 := TXMLDocument.Create(nil);
     XMLDocument1.FileName := 'http://portal.detran.ce.gov.br/index.php/calendario-de-licenciamento';
     XMLDocument1.Active   := true;
     if DirectoryExists(pPath) then
        XMLDocument1.SaveToFile(pPath+FormatDateTime('ddmmyyyy_hhmmss', Now)+ '.xml');
     tempXML := XMLDocument1.DocumentElement;

end;

procedure TfrmTestes.WebBrowser1Enter(Sender: TObject);
begin
  WebBrowser1.Navigate('http://portal.detran.ce.gov.br/index.php/calendario-de-licenciamento');
end;




Function TfrmTestes.pegarcep(CepEmp: string): Boolean;
var
  tempXML       : IXMLNode;
  tempNodePAI   : IXMLNode;
  tempNodeFilho : IXMLNode;
  XMLDocument1  : IXMLDocument ;
  I :Integer;
  pPath : String;
begin

     pPath := LowerCase( ExtractFilePath(Application.ExeName));
     XMLDocument1 := TXMLDocument.Create(nil);
     ////XMLDocument1.FileName := 'http://www.devmedia.com.br/devware/cep/service/?cep='+CepEmp+'&chave='+pChave+'&formato=xml';
     XMLDocument1.FileName := CepEmp;
     XMLDocument1.Active   := False;
     XMLDocument1.Active   := true;
     if DirectoryExists(pPath) then
        XMLDocument1.SaveToFile(pPath+FormatDateTime('ddmmyyyy_hhmmss', Now)+ '.xml');
     tempXML := XMLDocument1.DocumentElement;
     {
     Try

         tempNodePAI := tempXML.ChildNodes.FindNode('tipo_logradouro');
         for i := 0 to tempNodePAI.ChildNodes.Count - 1 do
         begin
            endcep := AnsiUpperCase( tempNodePAI.ChildNodes[i].Text );
         end;
         tempNodePAI := tempXML.ChildNodes.FindNode('logradouro');
         for i := 0 to tempNodePAI.ChildNodes.Count - 1 do
         begin
            endcep := AnsiUpperCase( endcep+' '+tempNodePAI.ChildNodes[i].Text );
         end;
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
         tempNodePAI := tempXML.ChildNodes.FindNode('uf');
         for i := 0 to tempNodePAI.ChildNodes.Count - 1 do
         begin
            UfCep := AnsiUpperCase( tempNodePAI.ChildNodes[i].Text );
         end;
         // Verifica a existencia da cidade na tabela de cidade
         SQLQ := TZQuery.Create(nil);

         with SQLQ do
           begin
             Close;
             Connection:= dmCreateSys.SqlConSis;
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
               Connection:= dmCreateSys.SqlConSis;
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
             Connection:= dmCreateSys.SqlConSis;
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



         Result := True;
      except
         MessageDlg('O CEP informado não foi encontrado ou não é valido',mtError,[mbOk],0);
         Result := True;
      End;
   End;
       }
 end;


end.
