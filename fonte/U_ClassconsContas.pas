unit U_ClassconsContas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnMan, Vcl.Buttons, Vcl.ImgList,  Menus, ComCtrls,   ToolWin, IniFiles,
  dbTables, FMTBcd, DB, SqlExpr, DBXFirebird, StrUtils, Datasnap.Provider, Datasnap.DBClient,
  Vcl.Imaging.jpeg, zdataset, VirtualTrees, System.ImageList, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;
Type
  TFormPesqContas = class(TForm)
    grbPesq: TGroupBox;
    imlConsulta: TImageList;
    actmConsulta: TActionManager;
    btnConfirma: TAction;
    btnSair: TAction;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    HintBallooCons: TBalloonHint;
    VST: TVirtualStringTree;
    Image1: TImage;
    FDQuery1: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure dbgConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnConfirmaExecute(Sender: TObject);
    Procedure SairPremat;
    procedure btnSairExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure VSTGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure VSTGetNodeDataSize(Sender: TBaseVirtualTree;
      var NodeDataSize: Integer);
    procedure VSTGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean;
      var ImageIndex: Integer);
    procedure VSTFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VSTFocusChanged(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex);
    procedure VSTChecked(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure FormShow(Sender: TObject);
    procedure VSTKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    Private
    Public
    procedure RefreshGrid;

  End;
var
  FormPesqContas: TFormPesqContas;

type
  TClasConsultaConta = class
    PosLeft, PosTop: Integer;
    dsTabela: TDataSource;
//  sqlTabela: TSQLQuery ;
    sqlTabela: TFDQuery ;
    cliTabela: TClientDataSet ;
    FrmCons : Tform;
    FrmNew  : TFormClass;
    NovoCad, aRecebe : String;
    aPcab, aPcam, aFcab, aFcam, aTcam, aRetu: array of string;
    procedure FormCreate(Sender: TObject );
    function Calcula(x,y: integer): integer;
    procedure acessa(Codpes: TButtonedEdit ; Tipo: String );
    Function Relacao(cCampo, cPesq: String): String;
    Public
      nmTabela, nmTitulo, QuerySql :String;


  Published
    constructor create;
  end;

Var
  aFcam_, aFcab_, aTcam_, aRetu_, aIndices_ : array of string;
  modConsulta, nmTabela_, nmTitulo_, QuerySql_, QuerySql_x, NovoCad_, aRecebe_, aRetorna_, Tipo_ : String;
  nRegistro: Integer;
  Form : Tform;

  FrmNew_   : TFormClass    ;
  dsTabela_ : TDataSource   ;
  sqlTabela_: TFDQuery   ;
  cliTabela_: TClientDataSet;

implementation
uses U_dmEmp, u_funcao;
{$R *.dfm}
type
  PTreeData = ^TTreeData;
  TTreeData = record
    Column0: String;
    Column1: String;
    Column2: String;
  end;

{ TClasConsulta }
procedure TClasConsultaconta.acessa(Codpes: TButtonedEdit; Tipo: String );
vAR
  XY: TPoint;
  i, ScreenT, ScreenL, TPesqT, TPesqL: Integer;
begin

  // Pegando Configuração da Tela / Resolução
  ScreenL := Screen.Width;
  ScreenT := Screen.Height - 10;

  // Pegando as Coordenadas da posi~ção
  XY          := Point(0, 0);
  XY          := Codpes.ClientToScreen(XY);

  //ShowMessage(Format('%d x %d ', [XY.x, XY.y]));
  PosLeft     := XY.x; // Linhas
  PosTop      := XY.y; // Coluna

  aRetorna_ :=  Codpes.Text ;
  Tipo_     := Tipo;
  FormPesqContas                  := TFormPesqContas.Create(FormPesqContas);
    // Pegando Configuração da Tela de Pesquisa
    TPesqL := FormPesqContas.Width;
    TPesqT := FormPesqContas.Height;

  // Reposicionando a tela de consulta
  // Posição da coluna
  if ( ( PosLeft + TPesqL ) > ScreenL ) then Begin
     FormPesqContas.Left             := ( PosLeft - ( ( PosLeft + TPesqL ) - ScreenL ) )
  End Else Begin
     FormPesqContas.Left             :=  PosLeft;
  End;

  // Reposicionando a tela de consulta
  // Posição da Linha
  if ( ( ( PosTop + 25 ) + TPesqT ) > ScreenT ) then Begin
    FormPesqContas.Top              := PosTop - ( ( ( PosTop + TPesqT ) - ScreenT ) + 30 );// Form1.Top + Self.Top + Self.Height + 30;
  End Else Begin
    FormPesqContas.Top              := PosTop + 25;// Form1.Top + Self.Top + Self.Height + 30;
  End;

  FormPesqContas.ShowModal;

  // Coloca as inforações em um array

  if Length(trim( aRecebe_ ) ) > 0 then Begin
     Codpes.Text :=aRecebe_ ;
  End Else Begin
//     Codpes.Text :=aRecebe_ ;
  End;

end;

Function TClasConsultaconta.Relacao(cCampo, cPesq: String ): String;
Var
SqlNew : TFDQuery;
Begin
if cPesq.IsEmpty then begin

    Result := '';
End Else Begin
   SqlNew := TFDQuery.Create(Nil);
   with SqlNew do
     begin
       Close;
       Connection := dmEmp.SqlConSis ;
       Sql.Text   :='SELECT * FROM '+u_funcao.SelSchema('pconta')+' Where pct_codigo = :Codigo ';
       ParamByName('Codigo').Text := cPesq;
       Open;
   end;

   if Not SqlNew.Eof then Begin
     Result := SqlNew.FieldByName(cCampo).Value
   End Else Begin
      if  cCampo = '' then Begin
           Result := '';
      End Else Begin
           ShowMessage('Registro não encontrado');
           Result := '';
      End;
   End;

end;


End;


function TClasConsultaconta.Calcula(x, y: integer): integer;
begin
   Result := x * y;
end;

constructor TClasConsultaconta.create;
begin
  PosLeft :=0;
  PosTop  :=0;

  aRecebe_ := '';
  aRetorna_:= '';

end;

procedure TClasConsultaconta.FormCreate(Sender: TObject);
Var
  i : Integer;
begin

end;


procedure TFormPesqContas.btnConfirmaExecute(Sender: TObject);
Var
i: Integer;
begin
   if VST.Text[ VST.FocusedNode ,2 ] = 'A' then begin
       aRecebe_ := RemoveChar( VST.Text[ VST.FocusedNode ,0 ] ) ;
       Close;
   end else begin
       ShowMessage('Você não usar contas de nivel S=Sinteticas, '+#13+'Apenas contas tipo A=Analíticas! ');
   end;

end;

procedure TFormPesqContas.btnSairExecute(Sender: TObject);
begin
 SairPremat;
end;

procedure TFormPesqContas.dbgConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
      VK_RETURN:
         btnConfirma.Execute;

      VK_ESCAPE:
        SairPremat;

  end;

end;




procedure TFormPesqContas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//ShowMessage( Screen.FocusedForm.Name );
if Screen.FocusedForm.Name = 'FormPesqContas' then

  dmEmp.sqlPConta.Close ;
  dmEmp.cliPConta.Close ;
  dmEmp.cliPConta.Active := False ;

  action := caFree;
  FormPesqContas := nil;
end;

procedure TFormPesqContas.FormCreate(Sender: TObject);
Var
i: Integer;
begin
  TelaP := 'S';
  //dmEmp.Caption := '[ Fluxo de Contas ]' ;

  dmEmp.sqlPConta.Close; ;
  dmEmp.cliPConta.Active := True;

end;


procedure TFormPesqContas.FormShow(Sender: TObject);
begin
  RefreshGrid;
end;

procedure TFormPesqContas.SairPremat;
Var
i: Integer;
begin
   aRecebe_ := aRetorna_;
   Close
end;

procedure TFormPesqContas.VSTChecked(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
begin
 VST.Refresh;
end;

procedure TFormPesqContas.VSTFocusChanged(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex);
begin
 VST.Refresh;
end;

procedure TFormPesqContas.VSTFreeNode(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
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

procedure TFormPesqContas.VSTGetImageIndex(Sender: TBaseVirtualTree;
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

procedure TFormPesqContas.VSTGetNodeDataSize(Sender: TBaseVirtualTree;
  var NodeDataSize: Integer);
begin
 NodeDataSize := SizeOf(TTreeData);
end;

procedure TFormPesqContas.VSTGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: string);
Var
  Data: PTreeData;
begin
  Data := VST.GetNodeData(Node);
  case Column of
    0: CellText := Data^.Column0;
    1: CellText := Data^.Column1;
    2: CellText := Data^.Column2;
  end;
end;

procedure TFormPesqContas.VSTKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
      VK_RETURN:
         btnConfirma.Execute;

      VK_ESCAPE:
        SairPremat;

  end;

end;

procedure TFormPesqContas.RefreshGrid;
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
     sql.Text :='SELECT * FROM  '+U_funcao.SelSchema('pconta')+fIIF(Length( Trim(Tipo_) ) <> 0,' where pct_tipo = '+QuotedStr(Tipo_),'') +' order by pct_codigo';
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
             Data^.Column2:= dmEmp.sqlPConta.FieldByName('pct_natureza').Text;

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
                  Data^.Column2:= dmEmp.sqlPConta.FieldByName('pct_natureza').Text;


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
                  Data^.Column2:= dmEmp.sqlPConta.FieldByName('pct_natureza').Text;
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
                  Data^.Column2:= dmEmp.sqlPConta.FieldByName('pct_natureza').Text;

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

end.
