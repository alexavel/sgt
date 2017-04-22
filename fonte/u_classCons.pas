unit U_Classcons;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnMan, Vcl.Buttons, Vcl.ImgList,  Menus, ComCtrls,   ToolWin, IniFiles,
  dbTables, FMTBcd, DB, SqlExpr, DBXFirebird, StrUtils, Datasnap.Provider, Datasnap.DBClient,
  Vcl.Imaging.jpeg, zdataset, System.ImageList, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Imaging.pngimage;
Type {Tipos criados}
  TArrayComp = array of TComponent;

Type
  TFormPesq = class(TForm)
    grbPesq: TGroupBox;
    dbgConsulta: TDBGrid;
    cbxIndices: TComboBox;
    edPesq: TEdit;
    imlConsulta: TImageList;
    actmConsulta: TActionManager;
    btnConfirma: TAction;
    btnNovo: TAction;
    btnSair: TAction;
    SpeedButton1: TSpeedButton;
    btnNew: TSpeedButton;
    SpeedButton3: TSpeedButton;
    HintBallooCons: TBalloonHint;
    Image1: TImage;
    FDQuery1: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure dbgConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnConfirmaExecute(Sender: TObject);
    Procedure SairPremat;
    procedure edPesqChange(Sender: TObject);
    procedure cbxIndicesChange(Sender: TObject);
    procedure btnSairExecute(Sender: TObject);
    procedure btnNovoExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edPesqKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgConsultaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    Private

    Public
    Procedure refresCons;

  End;
var
  FormPesq: TFormPesq;

type
  TClasConsulta = class
    PosLeft, PosTop: Integer;
    dsTabela: TDataSource;
//  sqlTabela: TSQLQuery ;
    sqlTabela: TFDQuery ;
    cliTabela: TClientDataSet ;
    FrmCons : Tform;
    FrmNew  : TFormClass;
    NovoCad : String;
    aPcab, aPcam, aFcab, aFcam, aTcam, aRetu, aRecebe: array of string;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject );
    function Calcula(x,y: integer): integer;
    procedure acessa(Codpes: TButtonedEdit );
    procedure AddReg(nmCampo, nmCabec, nmRetorno: String; tmColuna: Integer; nmIndice: String);
    Function RecReg(nmCampo: String): String;
    Function Relacao(cTabela: String; cCampo: TButtonedEdit; cPesq, cRet: String ): String;
    procedure trava(Sender :TObject; nNew: Integer );
    Procedure Libera;
    Private
      FObjLocalMinhaClasse: TObject;
    Public
      nmTabela, nmTitulo, QuerySql :String;
      lOk : Boolean;
      destructor Destroy; override;



  Published
    constructor create;
  end;

Var
  aFcam_, aFcab_, aTcam_, aRetu_, aRecebe_, aRetorna_, aIndices_ : array of string;
  modConsulta, nmTabela_, nmTitulo_, QuerySql_, QuerySql_x, NovoCad_, cNewSqlx, cRetorno_: String;
  lOk_ : Boolean;
  nRegistro, nOrd, nWehe: Integer;


  Form : Tform;

  FrmNew_   : TFormClass    ;
  dsTabela_ : TDataSource   ;
  sqlTabela_: TFDQuery   ;
  cliTabela_: TClientDataSet;

  aDS_s, aSql_s, aCli_s: TArrayComp;
  aFrm_s, aTab_s, aNSq_S : array of string;
  aTotCmp : array of Integer;

implementation
uses U_dmEmp, u_funcao;
{$R *.dfm}

{ TClasConsulta }
procedure TClasConsulta.acessa(Codpes: TButtonedEdit);
vAR
  XY: TPoint;
  i, ScreenT, ScreenL, TPesqT, TPesqL: Integer;
  cDefault : String;
begin

  // Pegando Configuração da Tela / Resolução
  ScreenL := Screen.Width;
  ScreenT := Screen.Height - 10;

  // Pegando as Coordenadas da posi~ção
  XY          := Point(0, 0);
  XY          := Codpes.ClientToScreen(XY);
  cDefault    := Codpes.Text ;

  //ShowMessage(Format('%d x %d ', [XY.x, XY.y]));
  PosLeft     := XY.x; // Linhas
  PosTop      := XY.y; // Coluna

  // Chamando a Tela e posicionando
  dsTabela_   :=  dsTabela;
  sqlTabela_  :=  sqlTabela;
  cliTabela_  :=  cliTabela;
  nmTabela_   :=  nmTabela;
  NovoCad_    :=  NovoCad;
    // Alimentando vetores com os componentes
  SetLength(aDS_s,Length(aDS_s)+1)  ; aDS_s[Length(aDS_s) - 1]    := dsTabela ;
  SetLength(aSql_s,Length(aSql_s)+1); aSql_s[Length(aSql_s) - 1]  := sqlTabela ;
  SetLength(aCli_s,Length(aCli_s)+1); aCli_s[Length(aCli_s) - 1]  := cliTabela ;
  SetLength(aFrm_s,Length(aFrm_s)+1); aFrm_s[Length(aFrm_s) - 1]  := NovoCad;
  SetLength(aTab_s,Length(aTab_s)+1); aTab_s[Length(aTab_s) - 1]  := nmTabela;
  SetLength(aListForm,Length(aListForm)+1); aListForm[Length(aListForm) - 1]  := nmTabela;

 // SetLength(aNSq_S,Length(aNSq_S)+1); aNSq_S[Length(aNSq_S) - 1]  := sqlTabela.SQL.Text;;
  cNewSqlx    :=  TFDQuery( aSql_s[Length(aSql_s)-1] ).SQL.Text;
  nOrd       :=  (Pos('order',cNewSqlx)-1);
  nWehe      :=  (Pos('Where',cNewSqlx)-1);
  if nOrd > 0 then
    cNewSqlx     :=  Copy( cNewSqlx,1,nOrd )   ;

 if nWehe > 0 then
    cNewSqlx     :=  Copy( cNewSqlx,1,nWehe )   ;
    cNewSqlx     := StringReplace(cNewSqlx,'"99999999999999_TESTE".',nmSchemaEmp, [rfReplaceAll, rfIgnoreCase]);


  //ShowMessage( IntToStr( Length(aSql_s) ) );

  // Define os campos
  SetLength(aFcam_, Length(aFcam));
  SetLength(aFcab_, Length(aFcab));
  SetLength(aTcam_, Length(aTcam));
  SetLength(aRetu_, Length(aRetu));

  for i := Low(aFcam) to High(aFcam) do Begin
     aFcam_[i] := aFcam[i];
     aFcab_[i] := aFcab[i];
     aTcam_[i] := aTcam[i];
     aRetu_[i] := aRetu[i];
  End;

  nmTitulo_  := nmTitulo;
  QuerySql_x := QuerySql;
  lOk        := False;

  FormPesq                  := TFormPesq.Create(FormPesq);

  // Pegando Configuração da Tela de Pesquisa
  if NovoCad.IsEmpty and ( PosTop < 400 ) then Begin
     FormPesq.Width  := ScreenL ;
     FormPesq.Height := ( ScreenT - 225 ) ;
  End;

  TPesqL := FormPesq.Width;
  TPesqT := FormPesq.Height;

  // Reposicionando a tela de consulta
  // Posição da coluna
  if ( ( PosLeft + TPesqL ) > ScreenL ) then Begin
     FormPesq.Left             := ( PosLeft - ( ( PosLeft + TPesqL ) - ScreenL ) )
  End Else Begin
     FormPesq.Left             :=  PosLeft;
  End;

  // Reposicionando a tela de consulta
  // Posição da Linha
  if ( ( ( PosTop + 25 ) + TPesqT ) > ScreenT ) then Begin
    FormPesq.Top              := PosTop - ( ( ( PosTop + TPesqT ) - ScreenT ) + 30 );// Form1.Top + Self.Top + Self.Height + 30;
  End Else Begin
    FormPesq.Top              := PosTop + 25;// Form1.Top + Self.Top + Self.Height + 30;
  End;

  FormPesq.Caption          := nmTitulo;
  FormPesq.btnNovo.Enabled  := Permissao('prm_gra',NovoCad_) ;
  FormPesq.ShowModal;
  lOk       := lOk_;

  // Coloca as inforações em um array
  if Length(aRecebe_) > 0 then Begin
      SetLength(aRecebe, Length(aRecebe_));
      for i := Low(aFcam) to High(aFcam) do Begin

         if i < Length(aRecebe_) then
            aRecebe[i] := aRecebe_[i];

      End;
  End Else Begin
         if cDefault <> '' then
            aRecebe[1] := cDefault;
  End;



end;

Function TClasConsulta.Relacao(cTabela: String; cCampo: TButtonedEdit; cPesq, cRet: String ): String;
Var
  SqlNew : TFDQuery;
  Nome, controle : string;
  nComp, indice : Integer;
  Pt: TPoint;
  Rct: TRect;
  Componente : TComponent;
  log : Boolean;
Begin
  if cCampo.Text = ''  then Begin
      if cCampo.CanFocus and ( Not lRoolBack )then begin
          if Not CmpNulo(cTabela, cCampo) then
             cCampo.SetFocus;
             exit
      end;
      if Copy( UpperCase( cRet ),5,3 ) = 'VLR' then begin
          Result := '0';
      end Else
          Result := '';

  End Else Begin

      cNewSqlx := sqlTabela.sql.text;
      if cNewSqlx.IsEmpty then
        cNewSqlx := ' Select * From '+U_funcao.SelSchema(cTabela)+' ';

      nOrd       :=  (Pos('order',cNewSqlx)-1);
      nWehe      :=  (Pos('Where',cNewSqlx)-1);
      if nOrd > 0 then
        cNewSqlx     :=  Copy( cNewSqlx,1,nOrd )   ;

     if nWehe > 0 then
        cNewSqlx     :=  Copy( cNewSqlx,1,nWehe )   ;

        cNewSqlx     := StringReplace(cNewSqlx,'"99999999999999_TESTE"',nmSchemaEmp, [rfReplaceAll, rfIgnoreCase]);
        cNewSqlx     := StringReplace(cNewSqlx, #$D#$A, ' ', [rfReplaceAll, rfIgnoreCase]);

      SqlNew   := TFDQuery.Create(Nil);
      with SqlNew do
       begin
         Close;
         Connection := sqlTabela.Connection ;
         Sql.Text   := cNewSqlx+' Where '+cPesq+' = :Codigo '+fIIF(Not QuerySql.IsEmpty, ' and '+QuerySql, '');
         if TipoCampo(cTabela, cPesq ) = 'int4' then begin
            ParamByName('Codigo').AsInteger := StrToInt( cCampo.Text );
         end else Begin
            ParamByName('Codigo').Text := cCampo.Text;
         End;
         Open;
      end;

      if Not SqlNew.Eof then Begin
         if Copy( UpperCase( cRet ),5,3 ) = 'VLR' then begin
            Result := fiif( SqlNew.FieldByName(cRet).IsNull,'0', SqlNew.FieldByName(cRet).Value )
         end Else
            Result := fiif( SqlNew.FieldByName(cRet).IsNull,'', SqlNew.FieldByName(cRet).Value )
      End Else Begin
        if  cCampo.Text = '' then Begin
           if Copy( UpperCase( cRet ),5,3 ) = 'VLR' then begin
              Result := '0';
           end Else
              Result := '';
        End Else Begin
             ShowMessage('Registro não encontrado');
             Result := '';
             cCampo.SetFocus;
        End;
      End;

  End;

End;


procedure TClasConsulta.trava(Sender: TObject; nNew: Integer);
Var
  c: String;
begin
  if ( TButtonedEdit(Sender).Text = '' ) and ( TButtonedEdit(Sender).Enabled ) then begin
      ShowMessage('Campo Obrigatório');
      TButtonedEdit(Sender).SetFocus;
  end;



end;

procedure TClasConsulta.AddReg(nmCampo, nmCabec, nmRetorno: String; tmColuna: Integer; nmIndice: String );
Var
cNome : String;
i: Integer;
Begin

 SetLength(aFcam,Length(aFcam)+1); aFcam[Length(aFcam)-1]    :=  nmCampo;
 SetLength(aFcab,Length(aFcab)+1); aFcab[Length(aFcab)-1]    :=  nmCabec;
 SetLength(aTcam,Length(aTcam)+1); aTcam[Length(aTcam)-1]    :=  IntToStr( tmColuna );
 SetLength(aRetu,Length(aRetu)+1); aRetu[Length(aRetu)-1]    :=  nmRetorno;


 // Pega os valores atuais dos gets
 cNome:='';
 for i := 0 to FrmCons.ComponentCount-1 do begin
      If (cNome <> '') then Break;
      if ( UpperCase(FrmCons.Components[i].Name) = UpperCase(nmRetorno) ) then begin
          if (FrmCons.Components[i].ClassName = 'TEdit')then Begin
              if Not Tedit(FrmCons.Components[i]).Enabled Then Begin
                  cNome := Tedit(FrmCons.Components[i]).Text ;
                  SetLength(aRetorna_,Length(aRetorna_)+1); aRetorna_[Length(aRetorna_)-1]    := cNome;

              End;

          End Else if (FrmCons.Components[i].ClassName = 'TButtonedEdit' ) then Begin
                  cNome := TButtonedEdit(FrmCons.Components[i]).Text;
                  SetLength(aRetorna_,Length(aRetorna_)+1); aRetorna_[Length(aRetorna_)-1]    := cNome;

          end;
      end;
 end;

 // Pega os indices
 if Not nmIndice.IsEmpty then
    SetLength(aIndices_,Length(aIndices_)+1); aIndices_[Length(aIndices_)-1]    :=  nmIndice;



end;

function TClasConsulta.Calcula(x, y: integer): integer;
begin
   Result := x * y;
end;

constructor TClasConsulta.create;
begin
  PosLeft :=0;
  PosTop  :=0;

  SetLength(aFcam_    ,0);
  SetLength(aFcab_    ,0);
  SetLength(aTcam_    ,0);
  SetLength(aRetu_    ,0);
  SetLength(aRecebe_  ,0);
  SetLength(aRetorna_ ,0);
  SetLength(aIndices_ ,0);

end;

destructor TClasConsulta.Destroy;
begin
  FreeAndNil( FObjLocalMinhaClasse );
  inherited;
end;

procedure TClasConsulta.FormCreate(Sender: TObject);
Var
  i : Integer;
begin

end;

procedure TClasConsulta.Libera;
begin
  //aRecebe
  ShowMessage('teste');
end;

Function TClasConsulta.RecReg(nmCampo: String): String;
Var
i: Integer;
begin
  If lOk Then Begin
      If Length( aRecebe ) > 0 Then Begin
          for i := Low(aFcam) to High(aFcam) do Begin
                if aFcam[i] = nmCampo then Begin
                       Result := aRecebe[i];
                       Exit;
                end;
          End;
      End;

  End Else
      for i := Low(aFcam) to High(aFcam) do Begin
            if aFcam[i] = nmCampo then Begin
                if Length(aRetorna_)>0 then
                   Result := aRetorna_[i];
            End;
      End;


end;


procedure TClasConsulta.Button1Click(Sender: TObject);
var
  Pt: TPoint;
  Topo: Integer;
  Eval: Integer;
begin

end;


procedure TFormPesq.btnConfirmaExecute(Sender: TObject);
Var
i: Integer;
begin
  SetLength(aRecebe_, Length(aFcam_));
  for i := Low(aFcam_) to High(aFcam_) do Begin
     if Not dbgConsulta.DataSource.DataSet.FieldByName(aFcam_[i]).IsNull then
        aRecebe_[i] := dbgConsulta.DataSource.DataSet.FieldByName(aFcam_[i]).Value;

  End;
  lOk_      := True;
  Close;
end;

procedure TFormPesq.edPesqChange(Sender: TObject);
var
cCmpPes : String;
begin
  refresCons;
end;

procedure TFormPesq.edPesqKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
      VK_CONTROL :
        cbxIndices.SetFocus;

  end;
end;

procedure TFormPesq.btnNovoExecute(Sender: TObject);
Var
  frmClass              : TFormClass  ;
  frmGer                : TForm       ;
  frm1, frm2, nmTab_    : String      ;
  i                     : Integer     ;
  aFc_, aFb_, aTm_, aRt_: array of string;
  dsTab_                : TDataSource;
  sqlTab_               : TFDQuery;
  cliTab_               : TClientDataSet ;

begin

if NovoCad_ <> '' then Begin
  frm1        := 'TFrm'+aFrm_s[Length(aFrm_s)-1];             // NovoCad_ ;
  frm2        := 'Frm'+aFrm_s[Length(aFrm_s)-1];              ///NovoCad_ ;
  nmTab_      :=  aTab_s[Length(aTab_s)-1];                   ///nmTabela_;

  // Define os campos
  SetLength(aFc_, Length(aFcam_));
  SetLength(aFb_, Length(aFcab_));
  SetLength(aTm_, Length(aTcam_));
  SetLength(aRt_, Length(aRetu_));

  for i := Low(aFcam_) to High(aFcam_) do Begin
     aFc_[i]  := aFcam_[i];
     aFb_[i]  := aFcab_[i];
     aTm_[i]  := aTcam_[i];
     aRt_[i]  := aRetu_[i];
  End;

  keybd_event(VK_F3, 0, KEYEVENTF_EXTENDEDKEY or 0, 0);
  frmClass          := TFormClass(GetClass(frm1));
  frmGer            := TForm(frm2) ;
  SetLength(aTotCmp,Length(aTotCmp)+1); aTotCmp[Length(aTotCmp) - 1]  := TFDQuery( aSql_s[Length(aSql_s)-1] ).RecordCount;
  frmGer            := frmClass.Create(self);
  frmGer.FormStyle  := fsNormal ;
  frmGer.Visible    := False;
  frmGer.ShowModal;

  if TClientDataSet( aCli_s[Length(aCli_s)-1] ).Active = False then
     TClientDataSet( aCli_s[Length(aCli_s)-1] ).Active := True;

  // Define os campos
  SetLength(aFcam_, Length(aFc_));
  SetLength(aFcab_, Length(aFb_));
  SetLength(aTcam_, Length(aTm_));
  SetLength(aRetu_, Length(aRt_));

  for i := Low(aFc_) to High(aFc_) do Begin
     aFcam_[i]:= aFc_[i];
     aFcab_[i]:= aFb_[i];
     aTcam_[i]:= aTm_[i];
     aRetu_[i]:= aRt_[i];
  End;

  refresCons;
  dbgConsulta.SetFocus;
  if TFDQuery( aSql_s[Length(aSql_s)-1] ).RecordCount > aTotCmp[Length(aTotCmp) - 1] then Begin
      dbgConsulta.DataSource.DataSet.Last;
  End;
  //dmEmp.TelaP       := 'S';

End;

end;

procedure TFormPesq.btnSairExecute(Sender: TObject);
begin
 SairPremat;
end;

procedure TFormPesq.cbxIndicesChange(Sender: TObject);
begin
edPesq.Clear;
refresCons;
edPesq.SetFocus ;
end;

procedure TFormPesq.dbgConsultaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    if gdFocused in State then  begin
      dbgConsulta.Canvas.Brush.Color  := Azul_Escuro;
      dbgConsulta.Canvas.Font.Color   := Branco;
      dbgConsulta.Canvas.FillRect(Rect);
      dbgConsulta.DefaultDrawDataCell(Rect, Column.Field, State);
    end else begin

        if Odd(dbgConsulta.DataSource.DataSet.RecNo) then begin
          dbgConsulta.Canvas.Brush.Color  := Branco;
          dbgConsulta.Canvas.Font.Color   := Preto;
          dbgConsulta.Canvas.FillRect(Rect);
          dbgConsulta.DefaultDrawDataCell(Rect, Column.Field, State);

        End else Begin
          dbgConsulta.Canvas.Brush.Color  := Cinza_Sintilante;
          dbgConsulta.Canvas.Font.Color   := Preto;
          dbgConsulta.Canvas.FillRect(Rect);
          dbgConsulta.DefaultDrawDataCell(Rect, Column.Field, State);
        End;

    end;

end;

procedure TFormPesq.dbgConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
      VK_CONTROL :
        cbxIndices.SetFocus;
      VK_RETURN:
         btnConfirma.Execute;

      VK_ESCAPE:
        SairPremat;

  end;

end;


procedure TFormPesq.FormClose(Sender: TObject; var Action: TCloseAction);
begin
// Eliminando elemento
QuerySql_ := '';
If Length(aSql_s) < 0 then Begin

End Else Begin
  TFDQuery( aSql_s[Length(aSql_s)-1] ).SQL.Text := cNewSqlx;
  SetLength(aDS_s, Length(aDS_s )-1);
  SetLength(aSql_s,Length(aSql_s)-1);
  SetLength(aCli_s,Length(aCli_s)-1);
  SetLength(aFrm_s,Length(aFrm_s)-1);
  SetLength(aTab_s,Length(aTab_s)-1);
  SetLength(aListForm,Length(aListForm)-1);

  If Length(aTotCmp) < 0 then
     SetLength(aTotCmp,Length(aTotCmp)-1);

End;



FormPesq  := nil;
action    := caFree;

end;

procedure TFormPesq.FormCreate(Sender: TObject);
Var
i: Integer;
begin
  //dmEmp.TelaP := 'S';
  {
  // Cor do banner
  Banner.ParentBackGround := False;
  Banner.ParentColor      := False;
  Banner.Brush.Color      := u_funcao.Bronze_Escuro ;

  // Titulos do Banner
  lbCabeca01.Caption    := nmTitulo_;
  lbCabeca02.Caption    := u_funcao.nmSistema ;
  // Cores - Titulos do Banner
  lbCabeca01.Font.Color := u_funcao.clTit_BCad ;
  lbCabeca02.Font.Color := u_funcao.clTit_BCad ;
   }

  grbPesq.Caption := 'Tela de Consulta ['+UpperCase(nmTitulo_)+']' ;
  //Alimenta os indices do combobox
  for i := 0 to Length(aIndices_)-1 do Begin
     if Not aIndices_[i].IsEmpty then
        cbxIndices.Items.Add(aIndices_[i]);

  End;
  cbxIndices.ItemIndex := 0;

  dbgConsulta.DataSource  :=  TDataSource( aDs_s[Length(aDS_s)-1] );
  sqlTabela_.Close;
  for i := Low(aFcam_) to High(aFcam_) do Begin
    with dbgConsulta.Columns.Add do
         begin
          Title.Caption := aFcab_[i];
          FieldName     := aFcam_[i];
          Width         := StrToInt( aTcam_[i] )*10;
         end;
  End;
  refresCons;
end;
{
          Field.ToString ;
          Field.ToString ;
          if Copy( UpperCase( aFcam_[i] ),5,3 ) = 'VLR'  then begin
            Field.EditMask := 'R$ ###,##0.00';
          end;

}

procedure TFormPesq.refresCons;
Var
cQuery_, cQBd, cTabela, cIndice : string;
SQLP    : TFDQuery;
nPos01, nPos02: Integer;
begin

//if Not dsTabela_.DataSet.Active then
//       dsTabela_.DataSet.Active := True ;
cTabela := aTab_s[Length(aTab_s)-1] ;
cIndice := aFcam_[cbxIndices.ItemIndex] ;
cQuery_ :='';
SQLP := TFDQuery.Create(Nil);
      with SQLP do
         begin
           Close;
           Connection:= sqlTabela_.Connection;
           SQL.Text:=' SELECT table_catalog, table_schema, table_name, COLUMN_NAME, data_type, udt_name, character_maximum_length, numeric_precision_radix, numeric_scale '
                     +' FROM information_schema.columns WHERE table_name = lower('+QuotedStr( cTabela )+') and table_schema = '+QuotedStr(u_funcao.SelSchemaNome(aTab_s[Length(aTab_s)-1]))+' and COLUMN_NAME = lower('+QuotedStr( cIndice )+') ';
           Active := True;
           Open;
         end;

  if ( Not QuerySql_x.IsEmpty ) then Begin
      if ( edPesq.Text <> '' )then Begin
          QuerySql_ := ' and '+QuerySql_x;
      End Else Begin
          QuerySql_ := ' Where '+QuerySql_x;
      End;
  End;

  if edPesq.Text <> '' then Begin
      if SQLP.FieldByName('data_type').asstring <> 'integer' then Begin
         cQuery_ :='  WHERE UPPER('+aFcam_[cbxIndices.ItemIndex]+') like UPPER('+QuotedStr('%'+edPesq.Text+'%')+') '+QuerySql_;
      End Else Begin
         cQuery_ :='  WHERE CAST('+aFcam_[cbxIndices.ItemIndex]+' AS VARCHAR(10))  like '+QuotedStr('%'+edPesq.Text+'%')+QuerySql_;
      End;
  End Else Begin
  if QuerySql_ <> '' then
     cQuery_ := QuerySql_;
  End;
  cNewSqlx := TFDQuery( aSql_s[Length(aSql_s)-1] ).sql.text ;
  nPos01   := Pos('order',cNewSqlx);
  if nPos01 > 0 then Begin
     cNewSqlx := Copy( cNewSqlx, 1, nPos01-1 );
     cNewSqlx := StringReplace(cNewSqlx,'order', '', [rfReplaceAll, rfIgnoreCase]);
  End;
  nPos01   := Pos('WHERE',uppercase( cNewSqlx ) );
  if nPos01 > 0 then Begin
    cNewSqlx := Copy( cNewSqlx, 1, nPos01-1 );
    cNewSqlx := StringReplace(cNewSqlx,'WHERE', '', [rfReplaceAll, rfIgnoreCase]);
  End;
  cNewSqlx    := StringReplace(cNewSqlx,'"99999999999999_TESTE"',nmSchemaEmp, [rfReplaceAll, rfIgnoreCase]);


cQBd := cNewSqlx + cQuery_ +' order by '+aFcam_[cbxIndices.ItemIndex] ;
cQBd := StringReplace(cQBd, #$D#$A, ' ', [rfReplaceAll, rfIgnoreCase]);

dbgConsulta.DataSource.DataSet.Active := False;
dsTabela_.DataSet                     := TFDQuery( aSql_s[Length(aSql_s)-1] );
dbgConsulta.DataSource                := TDataSource( aDs_s[Length(aDS_s)-1] );
sqlTabela_.Close;
sqlTabela_.SQL.Clear;
sqlTabela_.SQL.Text                   := cQBd ;
sqlTabela_.Open;
dbgConsulta.DataSource.DataSet.Active := True;

end;

procedure TFormPesq.SairPremat;
Var
i: Integer;
begin
  SetLength(aRecebe_, Length(aRetorna_));
  for i := 0 to Length(aRetorna_)-1 do Begin
     aRecebe_[i] := aRetorna_[i];
  End;
  lOk_ := False;
  Close;
end;

end.
{

Se estiver testando as teclas diretamente no formulário, lembre-se de definir sua propriedade KeyPreview para true.
Constante Valor
hexadecimal Valor
Decimal Equivalência no mouse ou teclado
VK_LBUTTON 01 01 Botão esquerdo do mouse
VK_RBUTTON 02 02 Botão direito do mouse
VK_CANCEL 03 03 Cancelar/interromper processamento
VK_MBUTTON 04 04 Botão do meio do mouse (em um mouse de três botões)
VK_XBUTTON1 05 05 Windows 2000/XP: Botão X1 do mouse
VK_XBUTTON2 06 06 Windows 2000/XP: Botão X2 do mouse
-  07 07 Não definida
VK_BACK 08 08 Tecla BACKSPACE
VK_TAB 09 09 Tecla TAB
   0A–0B 10-11 Reservado
VK_CLEAR 0C 12 Tecla CLEAR
VK_RETURN 0D 13 Tecla ENTER
-  0E–0F 14-15 Não definida
VK_SHIFT 10 16 Tecla SHIFT
VK_CONTROL 11 17 Tecla CTRL
VK_MENU 12 18 Tecla ALT
VK_PAUSE 13 19 Tecla PAUSE
VK_CAPITAL 14 20 Tecla CAPS LOCK
VK_ESCAPE 1B 27 Tecla ESC
VK_SPACE 20 32 Tecla SPACEBAR (Espaço)
VK_PRIOR 21 33 Tecla PAGE UP
VK_NEXT 22 34 Tecla PAGE DOWN
VK_END 23 35 Tecla END
VK_HOME 24 36 Tecla HOME
VK_LEFT 25 37 Tecla LEFT ARROW (Seta para a esquerda)
VK_UP 26 38 Tecla UP ARROW (Seta para cima)
VK_RIGHT 27 39 Tecla RIGHT ARROW (Seta para a direita)
VK_DOWN 28 40 Tecla DOWN ARROW (Seta para baixo)
VK_SELECT 29 41 Tecla SELECT
VK_PRINT 2A 42 Tecla PRINT
VK_EXECUTE 2B 43 Tecla EXECUTE
VK_SNAPSHOT 2C 44 Tecla PRINT SCREEN
VK_INSERT 2D 45 Tecla INS
VK_DELETE 2E 46 Tecla DEL
VK_HELP 2F 47 Tecla HELP
-  30 48 Tecla 0
-  31 49 Tecla 1
-  32 50 Tecla 2
-  33 51 Tecla 3
- 34 52 Tecla 4
- 35 53 Tecla 5
- 36 54 Tecla 6
- 37 55 Tecla 7
- 38 56 Tecla 8
- 39 57 Tecla 9
- 3A–40 58-64 Não definido
- 41 65 Tecla A
- 42 66 Tecla B
-  43 67 Tecla C
-  44 68 Tecla D
-  45 69 Tecla E
-  46 70 Tecla F
-  47 71 Tecla G
-  48 72 Tecla H
-  49 73 Tecla I
-  4A 74 Tecla J
-  4B 75 Tecla K
-  4C 76 Tecla L
-  4D 77 Tecla M
-  4E 78 Tecla N
-  4F 79 Tecla O
-  50 80 Tecla P
-  51 81 Tecla Q
-  52 82 Tecla R
-  53 83 Teclar S
-  54 84 Tecla T
-  55 85 Tecla U
-  56 86 Tecla V
-  57 87 Tecla W
-  58 88 Tecla X
-  59 89 Tecla Y
-  5A 90 Tecla Z
VK_LWIN 5B 91 Tecla Windows do lado esquerdo
VK_RWIN 5C 92 Tecla Windows do lado direito
VK_APPS 5D 93 Menu de contexto
—  5E 94 Reservado
VK_SLEEP 5F 95 Tecla Sleep
VK_NUMPAD0 60 96 Tecla 0 (T. numérico)
VK_NUMPAD1 61 97 Tecla 1 (T. numérico)
VK_NUMPAD2 62 98 Tecla 2 (T. numérico)
VK_NUMPAD3 63 99 Tecla 3 (T. numérico)
VK_NUMPAD4 64 100 Tecla 4 (T. numérico)
VK_NUMPAD5 65 101 Tecla 5 (T. numérico)
VK_NUMPAD6 66 102 Tecla 6 (T. numérico)
VK_NUMPAD7 67 103 Tecla 7 (T. numérico)
VK_NUMPAD8 68 104 Tecla 8 (T. numérico)
VK_NUMPAD9 69 105 Tecla 9 (T. numérico)
VK_MULTIPLY 6A 106 Tecla Multiplicar
VK_ADD 6B 107 Tecla Adicionar
VK_SEPARATOR 6C 108 Tecla Separador
VK_SUBTRACT 6D 109 Tecla Subtrair
VK_DECIMAL 6E 110 Tecla Decimal
VK_DIVIDE 6F 111 Tecla Dividir
VK_F1 70 112 Tecla F1
VK_F2 71 113 Tecla F2
VK_F3 72 114 Tecla F3
VK_F4 73 115 Tecla F4
VK_F5 74 116 Tecla F5
VK_F6 75 117 Tecla F6
VK_F7 76 118 Tecla F7
VK_F8 77 119 Tecla F8
VK_F9 78 120 Tecla F9
VK_F10 79 121 Tecla F10
VK_F11 7A 122 Tecla F11
VK_F12 7B 123 Tecla F12
VK_F13 7C 124 Tecla F13
VK_F14 7D 125 Tecla F14
VK_F15 7E 126 Tecla F15
VK_F16 7F 127 Tecla F16
VK_F17 80H 128 Tecla F17
VK_F18 81H 129 Tecla F18
VK_F19 82H 130 Tecla F19
VK_F20 83H 131 Tecla F20
VK_F21 84H 132 Tecla F21
VK_F22 85H 133 Tecla F22
VK_F23 86H 134 Tecla F23
VK_F24 87H 135 Tecla F24
—  88–8F 136-143 Não atribuído
VK_NUMLOCK 90 144 Tecla NUM LOCK
VK_SCROLL 91 145 Tecla SCROLL LOCK
}
