unit U_PContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ImgList, ToolWin, Grids, DBGrids, DB, ExtCtrls, StdCtrls,
  DBCtrls, Vcl.Mask, Vcl.Imaging.jpeg, Vcl.PlatformDefaultStyleActnCtrls, DBXCommon,
  System.Actions, Vcl.ActnList, Vcl.ActnMan, VirtualTrees,  SqlExpr,
  ActnCtrls, edittuning, Vcl.Buttons, U_ClasseUtil, ZDataset, System.ImageList, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client ;

type
  TfrmPconta = class(TForm)
    img_List_Usu: TImageList;
    Panel1: TPanel;
    Banner: TPanel;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    grbPainel: TGroupBox;
    Label1: TLabel;
    edNome: TEdit;
    edConta: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cbxTipo: TComboBox;
    cbxClass: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    btnCtMestre: TButton;
    btnCtAnali: TButton;
    btnExcluir: TButton;
    btnSair: TButton;
    VST: TVirtualStringTree;
    btnSalvar: TButton;
    btnCancelar: TButton;
    btnSubCnt: TButton;
    edLimite: TMaskEdit;
    edMeta: TMaskEdit;
    btnAlterar: TButton;
    imgLogo: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    Procedure RefreshGrid;
    procedure FormPaint(Sender: TObject);
    procedure FormResize(Sender: TObject);
    Procedure exclui_reg;
    procedure FormCreate(Sender: TObject);
    procedure validatela(lOp: Boolean);
    procedure btnCtMestreC(n:Integer);
    procedure VSTChecked(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VSTFocusChanged(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex);
    procedure VSTFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    function calcularNivelDependente(textoOrigem: String; adiciona : String): String ;
    procedure VSTGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean;
      var ImageIndex: Integer);
    procedure VSTGetNodeDataSize(Sender: TBaseVirtualTree;
      var NodeDataSize: Integer);
    procedure VSTGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
      Procedure ControlBut(n: Integer);
    procedure btnCtAnaliClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
Function pegacnt(pCnt, pConta:String): String;
    procedure btnSubCntClick(Sender: TObject);
    procedure btnCtMestreClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edMetaExit(Sender: TObject);
    procedure edMetaKeyPress(Sender: TObject; var Key: Char);
    procedure edLimiteKeyPress(Sender: TObject; var Key: Char);
    procedure btnAlterarClick(Sender: TObject);
    Function PgValores(n,c:string): Variant;    

  private
    { Private declarations }
  public
    acampo: integer;
    aberto: Boolean;
    nRecno, nNew: Integer;
    cNumCc, cNumCc2, cTipo, cInteger: String;
     Util: TClasseUtil;

    { Public declarations }
  end;

var
  frmPconta: TfrmPconta;
  modConsulta : integer;


implementation

uses UCalculadora,  U_dmEmp, uSistema, U_funcao, u_classCons;

{$R *.dfm}

type
  PTreeData = ^TTreeData;
  TTreeData = record
    Column0: String;
    Column1: String;
    Column2: String;
    Column3: String;
    Column4: String;
    Column5: String;
    Column6: String;
  end;


procedure TfrmPconta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmEmp.sqlPConta.Close; ;
  dmEmp.cliPConta.Active := False;
  dmEmp.dspPConta.DataSet.Active := False;
  fPrincipal.btnpconta.Enabled := True ;
  frmPConta.Release;
  action := cafree;
end;


procedure TfrmPconta.FormCreate(Sender: TObject);
begin
  if LowerCase(u_funcao.TipoCnx) = 'mysql' then Begin
     cInteger := 'UNSIGNED'
  End Else
 if LowerCase(u_funcao.TipoCnx) = 'firebird' then Begin
    cInteger := 'INTEGER'
 End;


  dmEmp.sqlPConta.Close;
  dmEmp.cliPConta.Active := True ;

 // RefreshGrid();
end;

procedure TfrmPconta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
Try
case key of
{
    VK_INSERT:
   //   btnNovo.Click;

    VK_RETURN:
     // btnAlterar.Click;

    VK_DELETE:
     // btnExcluir.Click;
 }
    VK_ESCAPE:
      Close;

end;

Except
   ShowMessage('Erro de Operação');
   //DbGrid1.SetFocus;


end;
end;

procedure TfrmPconta.FormPaint(Sender: TObject);
begin

  if aberto then Begin
     //RefreshGrid();
       aberto := false;
       fPrincipal.btnpconta.Enabled := False;
  End;

end;

procedure TfrmPconta.FormResize(Sender: TObject);
begin
    aberto := True;
//    ShowMessage('oi')

end;

procedure TfrmPconta.FormShow(Sender: TObject);
begin
  // Cor do banner
  Banner.ParentBackGround := False;
  Banner.ParentColor      := False;
  Banner.Brush.Color      := u_funcao.Bronze_Escuro ;

  // Titulos do Banner
  lbCabeca01.Caption    := 'Cadastro de Plano de Contas';
  lbCabeca02.Caption    := u_funcao.nmSistema ;
  // Cores - Titulos do Banner
  lbCabeca01.Font.Color := u_funcao.clTit_BCad ;
  lbCabeca02.Font.Color := u_funcao.clTit_BCad ;



//ShowMessage(IntToStr(u_Usuario.frmUsuario.acampo));
   edConta.MaxLength        := dmEmp.cliPConta.FieldByName('pct_codigo').Size;
   edNome.MaxLength         := dmEmp.cliPConta.FieldByName('pct_nome').Size;
   edLimite.Text            := FormatFloat('R$ #,0.00',0) ;
   edMeta.Text              := FormatFloat('R$ #,0.00',0) ;



   RefreshGrid;
 {
if u_Usuario.frmUsuario.acampo > 0 then
begin
  edCodusu.Text := '0'
end
else begin
   edCodusu.Text                := IntToStr( dmEmp.cliPConta.FieldByName('CODUSU').Value );
   edNome.Text                  := dmEmp.cliPConta.FieldByName('NOME').Value;
   edLogin.Text                 := dmEmp.cliPConta.FieldByName('LOGIN').Value;
   edSenha.Text                 := dmEmp.cliPConta.FieldByName('SENHA').Value;
   repSenha.Text                := dmEmp.cliPConta.FieldByName('SENHA').Value;
   edCodniv.Text                := dmEmp.cliPConta.FieldByName('CODNIV').Value;
   edCodGru.Text                := dmEmp.cliPConta.FieldByName('CODGRU').Value;
   EdRemetenteEmail.Text        := dmEmp.cliPConta.FieldByName('EMAIL').Value;
   EdSMTPLogin.Text             := dmEmp.cliPConta.FieldByName('usuario').Value ;
   EdSMTPSenha.Text             := dmEmp.cliPConta.FieldByName('senema').Value ;
   EdSMTPServidor.Text          := dmEmp.cliPConta.FieldByName('smtp').Value ;
   EdSMTPPorta.Text             := dmEmp.cliPConta.FieldByName('porta').Value ;
   CbMetodoTSL.Items.IndexOf(dmEmp.cliPConta.FieldByName('metodo').Value)    ;
   CbTSL.Items.IndexOf(dmEmp.cliPConta.FieldByName('TSL').Value) ;
   CbSMTPSSL.Checked            := fIIF( dmEmp.cliPConta.FieldByName('modseg').Value = 'T', True, False );
   CBAutentica.Checked          := fIIF( dmEmp.cliPConta.FieldByName('autent').Value = 'T', True, False );


end;
}
validatela(False);
ControlBut(2);
btnCtMestre.Enabled := dmEmp.chkPer( 'pconta', 'prm_gra' );
btnSubCnt.Enabled := dmEmp.chkPer( 'pconta', 'prm_gra' );
btnCtAnali.Enabled := dmEmp.chkPer( 'pconta', 'prm_gra' );

end;


procedure TfrmPconta.RefreshGrid;
Var
  Data: PTreeData;
  XNode: PVirtualNode;
  yNode: PVirtualNode;
  Rand, intLen1, intLen2, intPosIni, i: Integer;
  MyNode    : Array[0..10] of TTreeNode; {Matriz que guarda a posição dos níveis}
begin

 dmEmp.cliPConta.Active := False;
 dmEmp.sqlPConta.Close;
 dmEmp.cliPConta.Close ;
// dmEmp.cliPConta.Active := True;
 with dmEmp.sqlPConta do
   begin
     close;
     sql.Text :='SELECT * FROM  '+U_funcao.SelSchema('pconta')+' order by pct_codigo';
     Open;
 end;

  for intlen1 := 0 to 5 do
    begin
      MyNode[intLen1] := Nil;
    end;


 VST.Clear;
 intPosIni := 2;
 intLen2   := 0;
 dmEmp.sqlPConta.First;
 while not dmEmp.sqlPConta.Eof do
 begin


    intLen1   := length( dmEmp.sqlPConta.FieldByName('pct_codigo').AsString);
    if ( StrToInt( Copy( dmEmp.sqlPConta.FieldByName('pct_codigo').AsString,1, 2 ) ) > 0 ) and
       ( StrToInt( Copy( dmEmp.sqlPConta.FieldByName('pct_codigo').AsString,3, 2 ) ) = 0 ) and
       ( StrToInt( Copy( dmEmp.sqlPConta.FieldByName('pct_codigo').AsString,5, 3 ) ) = 0 ) and
       ( StrToInt( Copy( dmEmp.sqlPConta.FieldByName('pct_codigo').AsString,7, 4 ) ) = 0 ) then
       begin
       XNode:=VST.AddChild(Nil);
       if VST.AbsoluteIndex(XNode) > -1 then
           Begin
             Data := VST.GetNodeData(Xnode);
             Data^.Column0:= Copy( dmEmp.sqlPConta.FieldByName('pct_codigo').Text,1, 2 )+'.'+
                             Copy( dmEmp.sqlPConta.FieldByName('pct_codigo').Text,3, 2 )+'.'+
                             Copy( dmEmp.sqlPConta.FieldByName('pct_codigo').Text,5, 2 )+'.'+
                             Copy( dmEmp.sqlPConta.FieldByName('pct_codigo').Text,7, 4 )  ;
             Data^.Column1:= dmEmp.sqlPConta.FieldByName('pct_nome').Text ;
             Data^.Column2:= fIIF(( dmEmp.sqlPConta.FieldByName('pct_tipo').Text = 'C'),'Cred','Deb');
             Data^.Column3:= FormatFloat('R$ #,0.00', PgValores(Copy( dmEmp.sqlPConta.FieldByName('pct_codigo').Text,1,1),'pct_limite') );
             Data^.Column4:= FormatFloat('R$ #,0.00', PgValores(Copy( dmEmp.sqlPConta.FieldByName('pct_codigo').Text,1,1),'pct_meta') );

//             Data^.Column3:= FormatCurr('R$ ###,###,##0.00',dmEmp.sqlPConta.FieldByName('pct_limite').AsFloat);
//             Data^.Column4:= FormatCurr('R$ ###,###,##0.00',dmEmp.sqlPConta.FieldByName('pct_meta').AsFloat);
             Data^.Column5:= dmEmp.sqlPConta.FieldByName('pct_natureza').Text;

       End

    End else
      if ( StrToInt( Copy( dmEmp.sqlPConta.FieldByName('pct_codigo').AsString,1, 2 ) ) > 0 ) and
         ( StrToInt( Copy( dmEmp.sqlPConta.FieldByName('pct_codigo').AsString,3, 2 ) ) > 0 ) and
         ( StrToInt( Copy( dmEmp.sqlPConta.FieldByName('pct_codigo').AsString,5, 3 ) ) = 0 ) and
         ( StrToInt( Copy( dmEmp.sqlPConta.FieldByName('pct_codigo').AsString,7, 4 ) ) = 0 ) then
         begin
         XNode := VST.AddChild(VST.RootNode.LastChild);
         Data  := VST.GetNodeData(Xnode);
                  Data^.Column0:= Copy( dmEmp.sqlPConta.FieldByName('pct_codigo').Text,1, 2 )+'.'+
                                  Copy( dmEmp.sqlPConta.FieldByName('pct_codigo').Text,3, 2 )+'.'+
                                  Copy( dmEmp.sqlPConta.FieldByName('pct_codigo').Text,5, 2 )+'.'+
                                  Copy( dmEmp.sqlPConta.FieldByName('pct_codigo').Text,7, 4 )  ;

                  Data^.Column1:= dmEmp.sqlPConta.FieldByName('pct_nome').Text ;
                  Data^.Column2:= fIIF(( dmEmp.sqlPConta.FieldByName('pct_tipo').Text = 'C'),'Cred','Deb');
                  Data^.Column3:= FormatFloat('R$ #,0.00', PgValores(Copy( dmEmp.sqlPConta.FieldByName('pct_codigo').Text,1,4),'pct_limite') );
                  Data^.Column4:= FormatFloat('R$ #,0.00', PgValores(Copy( dmEmp.sqlPConta.FieldByName('pct_codigo').Text,1,4),'pct_meta') );

                  
//                  Data^.Column3:= FormatCurr('R$ ###,###,##0.00',dmEmp.sqlPConta.FieldByName('pct_limite').AsFloat);
//                  Data^.Column4:= FormatCurr('R$ ###,###,##0.00',dmEmp.sqlPConta.FieldByName('pct_meta').AsFloat);
                  Data^.Column5:= dmEmp.sqlPConta.FieldByName('pct_natureza').Text;


      end Else
      if ( StrToInt( Copy( dmEmp.sqlPConta.FieldByName('pct_codigo').AsString,1, 2 ) ) > 0 ) and
         ( StrToInt( Copy( dmEmp.sqlPConta.FieldByName('pct_codigo').AsString,3, 2 ) ) > 0 ) and
         ( StrToInt( Copy( dmEmp.sqlPConta.FieldByName('pct_codigo').AsString,5, 3 ) ) > 0 ) And
         ( StrToInt( Copy( dmEmp.sqlPConta.FieldByName('pct_codigo').AsString,7, 4 ) ) = 0 ) then
         begin
         XNode := VST.AddChild(VST.RootNode.LastChild.LastChild);
         Data  := VST.GetNodeData(Xnode);
                  Data^.Column0:= Copy( dmEmp.sqlPConta.FieldByName('pct_codigo').Text,1, 2 )+'.'+
                                  Copy( dmEmp.sqlPConta.FieldByName('pct_codigo').Text,3, 2 )+'.'+
                                  Copy( dmEmp.sqlPConta.FieldByName('pct_codigo').Text,5, 2 )+'.'+
                                  Copy( dmEmp.sqlPConta.FieldByName('pct_codigo').Text,7, 4 )  ;

                  Data^.Column1:= dmEmp.sqlPConta.FieldByName('pct_nome').Text ;
                  Data^.Column2:= fIIF(( dmEmp.sqlPConta.FieldByName('pct_tipo').Text = 'C'),'Cred','Deb');
                  Data^.Column3:= FormatFloat('R$ #,0.00', PgValores(Copy( dmEmp.sqlPConta.FieldByName('pct_codigo').Text,1,7),'pct_limite') );
                  Data^.Column4:= FormatFloat('R$ #,0.00', PgValores(Copy( dmEmp.sqlPConta.FieldByName('pct_codigo').Text,1,7),'pct_meta') );

                  Data^.Column5:= dmEmp.sqlPConta.FieldByName('pct_natureza').Text;
      end Else
      if ( StrToInt( Copy( dmEmp.sqlPConta.FieldByName('pct_codigo').AsString,7, 4 ) ) > 0 ) then
         begin
         XNode := VST.AddChild(VST.RootNode.LastChild.LastChild.LastChild);
         Data  := VST.GetNodeData(Xnode);
                  Data^.Column0:= Copy( dmEmp.sqlPConta.FieldByName('pct_codigo').Text,1, 2 )+'.'+
                                  Copy( dmEmp.sqlPConta.FieldByName('pct_codigo').Text,3, 2 )+'.'+
                                  Copy( dmEmp.sqlPConta.FieldByName('pct_codigo').Text,5, 2 )+'.'+
                                  Copy( dmEmp.sqlPConta.FieldByName('pct_codigo').Text,7, 4 )  ;

                  Data^.Column1:= dmEmp.sqlPConta.FieldByName('pct_nome').Text ;
                  Data^.Column2:= fIIF(( dmEmp.sqlPConta.FieldByName('pct_tipo').Text = 'C'),'Cred','Deb');
                  Data^.Column3:= FormatFloat('R$ #,0.00', PgValores(dmEmp.sqlPConta.FieldByName('pct_codigo').Text,'pct_limite') );
                  Data^.Column4:= FormatFloat('R$ #,0.00', PgValores(dmEmp.sqlPConta.FieldByName('pct_codigo').Text,'pct_meta') );
                  Data^.Column5:= dmEmp.sqlPConta.FieldByName('pct_natureza').Text;

      end;

    if dmEmp.sqlPConta.FieldByName('pct_natureza').Text = 'S' then Begin
       VST.Canvas.Brush.Color := TColor(clAqua ) ;
    End Else Begin
       VST.Canvas.Brush.Color := TColor(clWhite) ;
    End;

    if intLen1 <> intLen2 then
       begin
         intLen2 := intLen1;
       end;
    dmEmp.sqlPConta.Next;
 end;
 VST.FullExpand(nil);
end;

Function TfrmPconta.PgValores(n,c:string): Variant;    
Var
SQLQ : TFDQuery;
begin
  SQLQ := TFDQuery.Create(Self);
  with SQLQ do
     begin
        Close;
        Connection := dmEmp.SqlConSis;
        SQL.Text:='SELECT SUM('+c+') AS NOTA FROM  '+U_funcao.SelSchema('pconta')+' Where substring(pct_codigo From 1 for '+IntToStr(Length(n))+' ) = '''+n+'''  AND pct_natureza =  ''A'' ';
        Open;
     end;
     if Not SQLQ.FieldByName('NOTA').IsNull then Begin     
       Result := SQLQ.FieldByName('NOTA').Value
     End Else
       Result := 0
     

end;

procedure TfrmPconta.ToolButton10Click(Sender: TObject);
begin
//  frmCalend := TfrmCalend.Create(Self);
//  frmCalend.Show;

end;


procedure TfrmPconta.validatela(lOp: Boolean);
Var
i: Integer;
begin
  btnCancelar.Enabled := lOp;


  for i := 0 to grbPainel.ControlCount-1 do Begin

      if ( grbPainel.Controls[i].ClassType        = TEdit )     Then
           TEdit(grbPainel.Controls[i]).Enabled   := lOp
      Else if ( grbPainel.Controls[i].ClassType   = TMaskEdit ) Then
           TMaskEdit(grbPainel.Controls[i]).Enabled := lOp
      Else If ( grbPainel.Controls[i].ClassType   = TComboBox ) Then
           TComboBox(grbPainel.Controls[i]).Enabled := lOp

  End;


end;

procedure TfrmPconta.VSTChecked(Sender: TBaseVirtualTree; Node: PVirtualNode);
begin
  VST.Refresh;
end;

procedure TfrmPconta.VSTFocusChanged(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex);
begin
 VST.Refresh;
end;

procedure TfrmPconta.VSTFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PTreeData;
begin
  Data:=VST.GetNodeData(Node);
  if Assigned(Data) then begin
    Data^.Column0 := '';
    Data^.Column1 := '';
    Data^.Column2 := '';
  end;
end;

procedure TfrmPconta.VSTGetImageIndex(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
  var Ghosted: Boolean; var ImageIndex: Integer);
var
  Data: PTreeData;
begin
  if Kind in [ikNormal , ikSelected] then // Either Selected or not
  begin
    if (Column = 0)  then                   // if 1st Column
        ImageIndex:=0;                      // 1st Image of the ImageList1

    if Column = 1 then                      // if 2nd Column
      ImageIndex:=1;                        // 2nd Image of the ImageList1

    if Sender.FocusedNode = Node then       // Only show if Focused
      if Column =2 then                     // if 3rd Column
        ImageIndex:=214;                    // 3rd Image of the ImageList1
  end;
  {Sender.NodeHeight[node]:=40;             // If Image is big}
end;

procedure TfrmPconta.VSTGetNodeDataSize(Sender: TBaseVirtualTree;
  var NodeDataSize: Integer);
begin
 NodeDataSize := SizeOf(TTreeData);
end;

procedure TfrmPconta.VSTGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var
  Data: PTreeData;
begin
  Data := VST.GetNodeData(Node);
  case Column of
    0: CellText := Data^.Column0;
    1: CellText := Data^.Column1;
    2: CellText := Data^.Column2;
    3: CellText := Data^.Column3;
    4: CellText := Data^.Column4;
    5: CellText := Data^.Column5;
  end;
end;

procedure TfrmPconta.btnSairClick(Sender: TObject);
begin
  Close;
  frmPConta.Release;
end;

procedure TfrmPconta.btnSalvarClick(Sender: TObject);
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1   : Tdbmemo;
cUsu, cHora, cHorAlt,cCodSql, cIteSql,cValSql : string ;
dData, dDatAlt : TDate ;
i, tmp: Integer;
Trans : TDBXTransaction;  //Novo  , coloque na "Uses" = DBXCommon
XNode : PVirtualNode;
begin
  cUsu    :=  sysUsuario;
  dData   :=  date ;
  cHora   :=  TimeToStr(time) ;

  msFoto01 := TMemoryStream.Create;
  Memo1.Text := '';
  //Trans := dmEmp.SqlConSis.BeginTransaction(TDBXIsolations.ReadCommitted);
  dmEmp.sqlPconta.Close;

  if nNew = 1 then begin
    // Gera Scrip de Insert
    cCodSql:= 'Insert Into  '+U_funcao.SelSchema('pconta')+' ( pct_codigo, pct_cntmae,  pct_nome,  pct_natureza,  pct_tipo,  pct_limite,  pct_meta,  pct_UsuInc,  pct_DatInc,  pct_HorInc ) ' +
              '            values( :pct_codigo, :pct_cntmae, :pct_nome, :pct_natureza, :pct_tipo, :pct_limite, :pct_meta, :pct_UsuInc, :pct_DatInc, :pct_HorInc ) ';

  End Else Begin
    // Gera Scrip de Insert
    cCodSql:= 'update  '+U_funcao.SelSchema('pconta')+' set pct_nome = :pct_nome,  pct_limite =:pct_limite,  pct_meta = :pct_meta,  pct_UsuAlt=:pct_UsuInc, '+
                     ' pct_DatAlt=:pct_DatInc,  pct_HorAlt =:pct_HorInc WHERE pct_codigo = '''+edConta.Text+''' ';

  End;

  dmEmp.sqlPconta.SQL.Text := cCodSql ;
  if nNew = 1 then Begin
    dmEmp.sqlPconta.ParamByName('pct_codigo').Text    := edConta.Text;
    dmEmp.sqlPconta.ParamByName('pct_cntmae').Text    := edConta.Text;
    dmEmp.sqlPconta.ParamByName('pct_natureza').Text  := cbxClass.Text;
    dmEmp.sqlPconta.ParamByName('pct_tipo').Text      := cbxTipo.Text;
  End;
  dmEmp.sqlPconta.ParamByName('pct_nome').Text      := edNome.Text;
  dmEmp.sqlPconta.ParamByName('pct_limite').AsFloat := FormataNum( edLimite.Text );
  dmEmp.sqlPconta.ParamByName('pct_meta').AsFloat   := FormataNum( edMeta.Text   );
  dmEmp.sqlPconta.ParamByName('pct_UsuInc').Text    := cUsu;
  dmEmp.sqlPconta.ParamByName('pct_DatInc').AsDate  := Now;
  dmEmp.sqlPconta.ParamByName('pct_HorInc').Text    := cHora ;
  // jogando os parametros

  Try
    dmEmp.sqlPconta.ExecSQL;
    //dmEmp.SqlConSis.CommitFreeAndNil(Trans);
    RefreshGrid;
  except
     on Exc:Exception do
         begin
           ShowMessage('Ocorreu um erro na tentantiva de alterar os registro: ' + Exc.Message);
           //dmEmp.SqlConSis.RollbackFreeAndNil(Trans);
      end;
  End;
  edConta.Clear;
  edNome.Clear;
  edLimite.Clear;
  edMeta.Clear;
  validatela(False);
  ControlBut(2);
  edLimite.Text            := FormatFloat('R$ #,0.00',0) ;
  edMeta.Text              := FormatFloat('R$ #,0.00',0) ;
  VST.FullExpand(nil);
  VST.SetFocus;

end;

procedure TfrmPconta.btnSubCntClick(Sender: TObject);
begin
cbxClass.Items.IndexOf('S') ;
btnCtMestrec(1);
end;

procedure TfrmPconta.btnAlterarClick(Sender: TObject);
Var
  SQLQ : TSQLQuery;
  Data      : PTreeData;
  XNode     : PVirtualNode;
  yNode     : PVirtualNode;
  Rand, i,c : Integer;
  cTiul     : String;

begin

   edConta.Text       := RemoveChar( VST.Text[ VST.FocusedNode ,0 ] );
   edNome.Text        := VST.Text[ VST.FocusedNode ,1 ] ;
   cbxTipo.ItemIndex  := cbxTipo.Items.IndexOf(  Copy(VST.Text[ VST.FocusedNode ,2 ],1,1) ) ;
   cbxClass.ItemIndex := cbxClass.Items.IndexOf( Copy(VST.Text[ VST.FocusedNode ,5 ],1,1)) ;
   ControlBut(1);
   validatela(True);
   if VST.Text[ VST.FocusedNode ,5 ] = 'A' then Begin
       edLimite.Text      := VST.Text[ VST.FocusedNode ,3 ] ; //
       edMeta.Text        := VST.Text[ VST.FocusedNode ,4 ] ; //
   End Else Begin
       edLimite.Text            := FormatFloat('R$ #,0.00',0) ;
       edMeta.Text              := FormatFloat('R$ #,0.00',0) ;
       edLimite.Enabled         := False ;
       edMeta.Enabled         := False ;

   End;
   edConta.Enabled    := False;
   cbxClass.Enabled   := False;
   cbxTipo.Enabled    := False;
   edNome.SetFocus;
   nNew := 0;
end;

procedure TfrmPconta.btnCancelarClick(Sender: TObject);
begin
  edConta.Clear;
  edNome.Clear;
  edLimite.Clear;
  edMeta.Clear;
  validatela(False);
  ControlBut(2);
  edLimite.Text            := FormatFloat('R$ #,0.00',0) ;
  edMeta.Text              := FormatFloat('R$ #,0.00',0) ;
  VST.SetFocus;

end;

procedure TfrmPconta.btnCtAnaliClick(Sender: TObject);
Var
  Data      : PTreeData;
  XNode     : PVirtualNode;
  yNode     : PVirtualNode;
  Rand, i,c : Integer;
  cTiul     : String;
  index     : Integer;                   {Número sequencial para criação dos itens}
  intLen1   : Integer;                   {Guarda o tamanho da conta de classificação - atual}
  intLen2   : Integer;                   {Guarda o tamanho da conta de classificação - anterior}
  intPosIni : Integer;                   {Determina o tamanho da conta primeira conta de classificação}
  n, ponto, oldV, newV : Integer;
  MousePos: TPoint;
  cCnt: String;
  SQLQ : TFDQuery;
begin
  c:=0;
  nNew := 1;

  cTiul := RemoveChar( VST.Text[ VST.FocusedNode ,0 ] );
  cTipo := Copy(VST.Text[ VST.FocusedNode ,2 ],1,1);
  cCnt  := Copy( cTiul,1, 6 ) ;

  SQLQ := TFDQuery.Create(Self);
  with SQLQ do
     begin
        Close;
        Connection := dmEmp.SqlConSis;
        SQL.Text:='SELECT ( MAX( CAST(pct_codigo as integer )+1 )) AS NCONTA FROM '+U_funcao.SelSchema('pconta')+' Where substring( pct_codigo from 1 FOR 6) = '''+cCnt+''' and pct_natureza = ''A'' ';
        Open;
     end;
     if Not SQLQ.FieldByName('NCONTA').IsNull then
        cNumCc2:= IntToStr(SQLQ.FieldByName('NCONTA').Value)
     Else
        cNumCc2:= cCnt+'0001' ;


   acampo := 10;
   edConta.Text       := cNumCc2;
   cbxClass.ItemIndex := cbxClass.Items.IndexOf('A');
   cbxTipo.ItemIndex  := cbxTipo.Items.IndexOf(cTipo);
   ControlBut(1);
   validatela(True);
   edConta.Enabled    := False;
   cbxClass.Enabled   := False;
   cbxTipo.Enabled    := False;
   edNome.SetFocus;
   edLimite.Enabled   := True;
   edMeta.Enabled     := True;

end;

procedure TfrmPconta.btnCtMestrec(n: integer);
Var
  Data: PTreeData;
  XNode: PVirtualNode;
  yNode: PVirtualNode;
  Rand, i: Integer;
  cNivel: Variant;
  cTiul,cCnt: String;
  SQLQ : TSQLQuery;
  cTipo :String;
begin
nNew  := 1;
//if VST.FocusedNode = nil then
if dmEmp.sqlPConta.IsEmpty then
  Begin
     XNode    := VST.GetFirstNoInit ;
     VST.SetFocus;
     XNode    := VST.FocusedNode;
     cNumCc2  := '1000000000';
  End Else Begin
    if (VST.FocusedNode = nil) and (Not dmEmp.sqlPConta.IsEmpty) Then Begin
        ShowMessage('Selecione uma Conta');
    End Else
        cNivel := VST.GetNodeLevel(VST.FocusedNode);
        cTiul := RemoveChar( VST.Text[ VST.FocusedNode ,0 ] );
        cTipo := Copy( VST.Text[ VST.FocusedNode ,2 ],1,1);
        if Copy( VST.Text[ VST.FocusedNode ,5 ],1,1) = 'S' then Begin

          if ( StrToInt( Copy( cTiul,1, 2 ) ) > 0 ) and
             ( StrToInt( Copy( cTiul,3, 2 ) ) = 0 ) and
             ( StrToInt( Copy( cTiul,5, 2 ) ) = 0 ) then
              Begin
              cCnt  := Copy( cTiul,1, (1+n) ) ;
              cNumCc2  := pegacnt(cCnt, cTiul ) //Strzero(StrtoInt(calcularNivelDependente( cCnt , '+')),2)+Copy( cTiul,3, 2 ) +Copy( cTiul,5, 2 )+Copy( cTiul,7, 4 ) ;
          End Else
          if ( StrToInt( Copy( cTiul,1, 2 ) ) > 0 ) and
             ( StrToInt( Copy( cTiul,3, 2 ) ) > 0 ) and
             ( StrToInt( Copy( cTiul,5, 2 ) ) = 0 ) then
              Begin
              cCnt     := Copy( cTiul,1, (3+n) ) ;
              cNumCc2  := pegacnt(cCnt, cTiul ) //Strzero(StrtoInt(calcularNivelDependente( cCnt , '+')),2)+Copy( cTiul,3, 2 ) +Copy( cTiul,5, 2 )+Copy( cTiul,7, 4 ) ;
          End Else
          if ( StrToInt( Copy( cTiul,1, 2 ) ) > 0 ) and
             ( StrToInt( Copy( cTiul,3, 2 ) ) > 0 ) and
             ( StrToInt( Copy( cTiul,5, 2 ) ) > 0 ) then
              Begin
              cCnt  := Copy( cTiul,1, (5+n) ) ;
              cNumCc2  := pegacnt(cCnt, cTiul ) //Strzero(StrtoInt(calcularNivelDependente( cCnt , '+')),2)+Copy( cTiul,3, 2 ) +Copy( cTiul,5, 2 )+Copy( cTiul,7, 4 ) ;

      End;
   End Else Begin
     ShowMessage('Não é possivel criar Conta Sintética de uma Analítica');
     Exit;
   End;



              

  End;

  edConta.Text        := cNumCc2;
  cbxClass.ItemIndex  := cbxClass.Items.IndexOf('S');
  if n > 0 then Begin
    cbxTipo.ItemIndex  := cbxTipo.Items.IndexOf(cTipo);

  End;

  validatela(True);
  if n > 0 then Begin
     cbxTipo.Enabled  := False;
  End;
  edLimite.Enabled    := False;
  edMeta.Enabled      := False;  
  edConta.Enabled     := False;
  cbxClass.Enabled    := False;
  acampo              := 1;
  ControlBut(1);
  edNome.SetFocus;
end;

procedure TfrmPconta.btnCtMestreClick(Sender: TObject);
begin
btnCtMestrec(0);
end;

Function TfrmPconta.pegacnt(pCnt, pConta :String): String;
Var
  SQLQ : TFDQuery;
  cQuery: String;
Begin
  if Length(pCnt) > 1 then Begin
      cQuery  := 'SELECT ( MAX( CAST(substring(pct_codigo From 1 for '+IntToStr(Length(pCnt)+1)+' ) as integer )+1 )) AS NCONTA FROM '+U_funcao.SelSchema('pconta')+' Where substring( pct_codigo from 1 FOR '+IntToStr(Length(pCnt))+' ) = '''+pCnt+''' and pct_natureza = ''S'' ';
  End  Else
     cQuery  :=  'SELECT ( MAX( CAST(substring(pct_codigo From 1 for 1 ) as integer )+1 )) AS NCONTA FROM '+U_funcao.SelSchema('pconta')+' Where pct_natureza = ''S'' ';

  SQLQ := TFDQuery.Create(Self);
  with SQLQ do
     begin
        Close;
        Connection := dmEmp.SqlConSis;
        SQL.Text:= cQuery ;
        Open;
     end;
     if Not SQLQ.FieldByName('NCONTA').IsNull then
        if Length(pCnt) > 1 then Begin
           Result := IntToStr(SQLQ.FieldByName('NCONTA').Value)+StrZero(0,(10-(Length(pCnt)+1)) )
        End Else
           Result := IntToStr(SQLQ.FieldByName('NCONTA').Value)+StrZero(0,(10-(Length(pCnt))) )
     Else
        Result := pConta+'1000000000' ;


End;

Procedure TfrmPconta.ControlBut(n: Integer);
Begin
  if n = 1 then Begin
    btnCtMestre.Enabled := False;
    btnCtAnali.Enabled  := False;
    btnExcluir.Enabled  := False;
    btnSubCnt.Enabled   := False;
    btnAlterar.Enabled  := False;
    btnSalvar.Enabled   := ( dmEmp.chkPer( 'pconta', 'prm_gra' ) or ( dmEmp.chkPer( 'pconta', 'prm_alt' ) ) );
    btnCancelar.Enabled := True;
  End Else Begin
    btnCtMestre.Enabled := dmEmp.chkPer( 'pconta', 'prm_gra' );
    btnCtAnali.Enabled  := ( (Not dmEmp.sqlPConta.IsEmpty) and ( dmEmp.chkPer( 'pconta', 'prm_gra' ) ) );
    btnSubCnt.Enabled   := ( (Not dmEmp.sqlPConta.IsEmpty) and ( dmEmp.chkPer( 'pconta', 'prm_gra' ) ) );
    btnAlterar.Enabled  := ( (Not dmEmp.sqlPConta.IsEmpty) and ( dmEmp.chkPer( 'pconta', 'prm_alt' ) ) );
    btnExcluir.Enabled  := ( (Not dmEmp.sqlPConta.IsEmpty) and ( dmEmp.chkPer( 'pconta', 'prm_exc' ) ) );
    btnSalvar.Enabled   := False;
    btnCancelar.Enabled := False;
  End;

End;

function TfrmPconta.calcularNivelDependente(textoOrigem: String; adiciona : String): String ;
var
  nivel : array [0..20] of integer;
  i, nivelC  : SmallInt;
  niveisTxt  : TStringList;
  saida : String;
begin
  nivelC := 0;
  niveisTxt := TStringList.Create;
  for i := 0 to 10 do
    nivel[i] := -1;
  try
    niveisTxt.Text := textoOrigem ;//StringReplace(textoOrigem, '.', #13, [rfReplaceAll, rfIgnoreCase]);
    for i := 0 to niveisTxt.Count - 1 do
    begin
      nivel[i] := StrToInt(niveisTxt.Strings[i]);
      nivelC := i;
    end;
    if adiciona = '=' then
      if nivel[nivelC + 1] = -1 then
        nivel[nivelC + 1] := 1;
    if adiciona = '+' then
      if nivel[nivelC] = -1 then
        nivel[nivelC] := 1
      else
        nivel[nivelC] := nivel[nivelC] + 1;

    if adiciona = '=' then
      for i := 0 to nivelC + 1 do
        saida := saida + IntToStr(nivel[i]) ;
    if adiciona = '+' then
      for i := 0 to nivelC do
        saida := saida + IntToStr(nivel[i]) ;

    Result := saida;
  finally
    niveisTxt.Free;
  end;
end;


procedure TfrmPconta.btnExcluirClick(Sender: TObject);
begin
  exclui_reg();
  edConta.Clear;
  edNome.Clear;
  edLimite.Clear;
  edMeta.Clear;
  validatela(False);
  ControlBut(2);
  VST.SetFocus;
end;

procedure TfrmPconta.edLimiteKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  MoedaKeyEdit( Key, edLimite );
  Key := #0 ;
end;

procedure TfrmPconta.edMetaExit(Sender: TObject);
begin
  btnSalvar.SetFocus;
end;

procedure TfrmPconta.edMetaKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  MoedaKeyEdit( Key, edMeta );
  Key := #0 ;
end;

procedure TfrmPconta.exclui_reg;
var
  conta : String;
  nPosi,nQuant : integer;
Begin

  if btnExcluir.Enabled  then
     begin
     if MESSAGEBOX(Application.Handle, 'Deseja Excluir?', 'Confirma...', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin
        try
          dmEmp.sqlPConta.Close;
          dmEmp.sqlPConta.SQL.Text  :='DELETE FROM '+U_funcao.SelSchema('pconta')+' WHERE pct_codigo = :pct_codigo';
          dmEmp.sqlPConta.ParamByName('pct_codigo').Text     :=  RemoveChar( VST.Text[ VST.FocusedNode ,0 ] ) ;
          dmEmp.sqlPConta.ExecSQL;
          Auditor(Screen.activeform.Caption,'Deletou','Cód: '+conta );
          RefreshGrid();
        except
          ShowMessage('Impossivel excluir este registro! Ele faz parte de outras tabelas!'  );
          RefreshGrid();
        end;
     end;
  end;
end;


end.

