unit U_Nivel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_000MdlCrud, Data.DB,
  FireDAC.Phys.MySQLDef, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.ExtDlgs,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Bind.Components,
  Data.Bind.DBScope, FireDAC.Phys, FireDAC.Phys.MySQL, System.ImageList,
  Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, U_Classcons,EditTuning ;

type
  TfrmNivel = class(T_frmModeloCrud)
    Label1: TLabel;
    Label4: TLabel;
    niv_nivel: TEdit;
    GroupBox2: TGroupBox;
    dbgNivel: TDBGrid;
    RadioButton3: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton1: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton9: TRadioButton;
    niv_codigo: TEdit;
    Button1: TButton;
    procedure dbgNivelDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgNivelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgNivelCellClick(Column: TColumn);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure RadioButton9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNovoExecute(Sender: TObject);
    procedure btnEditarExecute(Sender: TObject);
    procedure btnExcluirExecute(Sender: TObject);
    procedure btnVizualizaExecute(Sender: TObject);
    procedure niv_nivelExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    wEmpresa, wUsuInc, wHorInc, wUsuAlt, wHorAlt, cWhere : string ;
    procedure chkradio(Sender: TObject);
    procedure RefreshGrid;
    procedure PovoPermissao(Tabela: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNivel: TfrmNivel;

implementation

{$R *.dfm}

uses U_dmEmp, U_funcao, U_ClassCad;

procedure TfrmNivel.dbgNivelCellClick(Column: TColumn);
Var
qSql : TFDQuery;
begin
  inherited;
  //Desenha um checkbox no dbgrid
  if Column.Field.DataType = ftBoolean then begin
      qSql := TFDQuery.Create(Nil);
      IniTransacao;
      qSql.Connection := dmEmp.SqlConSis;
      qSql.Close;
      if Column.FieldName = 'nva_lei' then begin
        if dbgNivel.DataSource.DataSet.FieldByName(Column.FieldName).AsBoolean then begin
           qSql.SQL.Text := 'Update '+U_funcao.SelSchema('NivAces')
           +' Set nva_lei = False, nva_gra = False, nva_alt = False, nva_exc = False WHERE nva_codigo = '+dbgNivel.DataSource.DataSet.FieldByName('nva_codigo').Text;
        end else  begin
           qSql.SQL.Text := 'Update '+U_funcao.SelSchema('NivAces')
           +' Set nva_lei = True, nva_gra = True, nva_alt = True, nva_exc = True WHERE nva_codigo = '+dbgNivel.DataSource.DataSet.FieldByName('nva_codigo').Text;
        end;

      end Else begin
        if dbgNivel.DataSource.DataSet.FieldByName( Column.FieldName ).AsBoolean then begin
           qSql.SQL.Text := 'Update '+U_funcao.SelSchema('NivAces')
           +' Set '+Column.FieldName+' = False WHERE nva_codigo = '+dbgNivel.DataSource.DataSet.FieldByName('nva_codigo').Text;
        end else  begin
           qSql.SQL.Text := 'Update '+U_funcao.SelSchema('NivAces')
           +' Set '+Column.FieldName+' = True WHERE nva_codigo = '+dbgNivel.DataSource.DataSet.FieldByName('nva_codigo').Text;
        end;
      end;

      qSql.ExecSQL;
      dbgNivel.DataSource.DataSet.Refresh;
  end;


end;

procedure TfrmNivel.btnEditarExecute(Sender: TObject);
begin
  inherited;
  RefreshGrid;
  RadioButton1.Checked := True ;
end;

procedure TfrmNivel.btnExcluirExecute(Sender: TObject);
begin
  inherited;
  RefreshGrid;
  RadioButton1.Checked := True ;
end;

procedure TfrmNivel.btnNovoExecute(Sender: TObject);
begin
  inherited;

  RefreshGrid;
  RadioButton1.Checked := True ;
end;

procedure TfrmNivel.btnVizualizaExecute(Sender: TObject);
begin
  inherited;
  RefreshGrid;
  RadioButton1.Checked := True ;
end;

procedure TfrmNivel.Button1Click(Sender: TObject);
begin
  inherited;
  if  ( niv_codigo.Text = '' ) and ( niv_nivel.Text <> '' ) then begin
      GravarDados ;
      PovoPermissao( 'nivaces' );
      RefreshGrid;
  End Else Begin
      ShowMessage('Permissões Já Existentes');
  end;

end;

procedure TfrmNivel.chkradio(Sender: TObject);
Var
cCompon : Integer;
begin
  cWhere                          := '';
  TRadioButton( Sender ).Checked  := True;
  if TRadioButton( Sender ).Tag > 0 then begin
     cWhere:= ' and nva_modl = '+QuotedStr( IntToStr( TRadioButton( Sender ).Tag ));
  End;
  RefreshGrid();
end;

procedure TfrmNivel.RadioButton1Click(Sender: TObject);
begin
  inherited;
  chkradio(Sender);
end;

procedure TfrmNivel.RadioButton2Click(Sender: TObject);
begin
  inherited;
  chkradio(Sender);
end;

procedure TfrmNivel.RadioButton3Click(Sender: TObject);
begin
  inherited;
  chkradio(Sender);
end;

procedure TfrmNivel.RadioButton4Click(Sender: TObject);
begin
  inherited;
  chkradio(Sender);
end;

procedure TfrmNivel.RadioButton5Click(Sender: TObject);
begin
  inherited;
  chkradio(Sender);
end;

procedure TfrmNivel.RadioButton6Click(Sender: TObject);
begin
  inherited;
  chkradio(Sender);
end;

procedure TfrmNivel.RadioButton9Click(Sender: TObject);
begin
  inherited;
  chkradio(Sender);
end;

procedure Tfrmnivel.RefreshGrid;
begin

  dmEmp.cliNivAces.Close  ;
  dmEmp.sqlNivAces.Close  ;
  dmEmp.sqlNivAces.SQL.Text :='SELECT * FROM  '+U_funcao.SelSchema('NivAces')
                                   +' Where nva_codniv = '+fIIF(niv_codigo.Text <>'',niv_codigo.Text,'0')+' '+cWhere+' Order By nva_Modl, nva_Titulo';
  dmEmp.sqlNivAces.Open;
  dmEmp.cliNivAces.Active := True;
  dbgNivel.Visible := (Not dmEmp.cliNivAces.eof ) ;



end;

procedure TfrmNivel.dbgNivelDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
Check: Integer;
R: TRect;
begin
    inherited;
    if gdFocused in State then  begin
      dbgNivel.Canvas.Brush.Color  := Azul_Escuro;
      dbgNivel.Canvas.Font.Color   := Branco;
      dbgNivel.Canvas.FillRect(Rect);
      dbgNivel.DefaultDrawDataCell(Rect, Column.Field, State);
    end else begin

        if Odd(dbgNivel.DataSource.DataSet.RecNo) then begin
          dbgNivel.Canvas.Brush.Color  := Branco;
          dbgNivel.Canvas.Font.Color   := Preto;
          dbgNivel.Canvas.FillRect(Rect);
          dbgNivel.DefaultDrawDataCell(Rect, Column.Field, State);

        End else Begin
          dbgNivel.Canvas.Brush.Color  := Cinza_Sintilante;
          dbgNivel.Canvas.Font.Color   := Preto;
          dbgNivel.Canvas.FillRect(Rect);
          dbgNivel.DefaultDrawDataCell(Rect, Column.Field, State);
        End;

    end;

    //Desenha um checkbox no dbgrid
    if Column.Field.DataType = ftBoolean then begin
        dbgNivel.Canvas.FillRect(Rect);
        Check := 0;
        if dbgNivel.DataSource.DataSet.FieldByName( Column.FieldName ).AsBoolean = True then Begin
            Check := DFCS_CHECKED
        End else Begin
            Check := 0;
        End;
        R:=Rect;
        InflateRect(R,-2,-2); {Diminue o tamanho do CheckBox}
        DrawFrameControl(dbgNivel.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
    end;


end;

procedure TfrmNivel.dbgNivelKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
qSql : TFDQuery;
begin
  inherited;
  if ( Key = VK_SPACE ) and
     ( Not dbgNivel.DataSource.DataSet.eof) then Begin

      if dbgNivel.Columns.Grid.SelectedField.DataType = ftBoolean then begin
          qSql := TFDQuery.Create(Nil);
          IniTransacao;

          qSql.Connection := dmEmp.SqlConSis;
          qSql.Close;

          if ( dbgNivel.Columns.Grid.SelectedField.FieldName = 'nva_lei' ) or
             ( dbgNivel.Columns.Grid.SelectedField.FieldName = 'nva_titulo' ) then begin
            if ( dbgNivel.DataSource.DataSet.FieldByName(dbgNivel.Columns.Grid.SelectedField.FieldName).AsBoolean ) or
               ( dbgNivel.SelectedRows.Count > 1 ) then begin
               qSql.SQL.Text := 'Update '+U_funcao.SelSchema('NivAces')
               +' Set nva_lei = False, nva_gra = False, nva_alt = False, nva_exc = False WHERE nva_codigo = '+dbgNivel.DataSource.DataSet.FieldByName('nva_codigo').Text;
            end else  begin
               qSql.SQL.Text := 'Update '+U_funcao.SelSchema('NivAces')
               +' Set nva_lei = True, nva_gra = True, nva_alt = True, nva_exc = True WHERE nva_codigo = '+dbgNivel.DataSource.DataSet.FieldByName('nva_codigo').Text;
            end;

          end Else begin
            if dbgNivel.DataSource.DataSet.FieldByName( dbgNivel.Columns.Grid.SelectedField.FieldName ).AsBoolean then begin
               qSql.SQL.Text := 'Update '+U_funcao.SelSchema('NivAces')
               +' Set '+dbgNivel.Columns.Grid.SelectedField.FieldName+' = False WHERE nva_codigo = '+dbgNivel.DataSource.DataSet.FieldByName('nva_codigo').Text;
            end else  begin
               qSql.SQL.Text := 'Update '+SelSchema('NivAces')
               +' Set '+dbgNivel.Columns.Grid.SelectedField.FieldName+' = True WHERE nva_codigo = '+dbgNivel.DataSource.DataSet.FieldByName('nva_codigo').Text;
            end;
          end;
          qSql.ExecSQL;
          dbgNivel.DataSource.DataSet.Refresh;
      end;

  End;

end;

procedure TfrmNivel.FormShow(Sender: TObject);
Var
 n: Integer;
begin
  inherited;
  RefreshGrid;
  SetLength(aTabDel, Length(aTabDel)+1); n:= Length(aTabDel)-1; aTabDel[n][0] := 'nivaces';     aTabDel[n][1] := 'nva_codniv';
end;


procedure TfrmNivel.niv_nivelExit(Sender: TObject);
begin
  inherited;



end;

//---------------------------------------------------------------------
//FUNÇÃO QUE ALIMENTA TABELA DE PERMISSAO DE USUARIOS
//---------------------------------------------------------------------
Procedure Tfrmnivel.PovoPermissao( Tabela: String );
var
  cont, ncolunas: integer;
  SQLQ,SQLQ2  : TFDQuery;
begin
  SQLQ := TFDQuery.Create(Nil);
  SQLQ2 := TFDQuery.Create(Nil);

  SQLQ2.Close;
  SQLQ2.Connection := dmEmp.SqlConSis;
  SQLQ2.Sql.Text:='SELECT * FROM  "dbconfig".mdoacesso order by mda_codmda';
  SQLQ2.Open;

  SQLQ2.First;
  while (not (SQLQ2.EOF)) do
  begin
        SQLQ.Close;
        SQLQ.Connection := dmEmp.SqlConSis ;
        SQLQ.sql.Text := 'SELECT * FROM '+U_funcao.SelSchema('nivaces')+' where nva_codniv = '+QuotedStr(niv_codigo.Text)+' and nva_formda = '+QuotedStr(SQLQ2.FieldByName('mda_FORMDA').AsString);
        SQLQ.Open;
        if ( SQLQ.RecordCount = 0 ) and
           ( SQLQ2.FieldByName('mda_modl').AsString <> 'S' ) then Begin

           dmEmp.sqlNivAces.Close;
           dmEmp.sqlNivAces.Sql.Text := 'insert into '+U_funcao.SelSchema('nivaces')+' (nva_codniv, nva_formda, nva_titulo, nva_modl, nva_lei, nva_Gra, nva_Alt, nva_Exc, nva_UsuInc, nva_DatInc, nva_HorInc )'+
                                'values ( :codniv, :formda, :titulo, :modl, :lei, :Gra, :Alt, :Exc, :UsuInc, :DatInc, :HorInc )';
           dmEmp.sqlNivAces.ParamByName('codniv').AsInteger := StrToInt( niv_codigo.Text );
           dmEmp.sqlNivAces.ParamByName('formda').Text      := SQLQ2.FieldByName('mda_FORMDA').AsString ;
           dmEmp.sqlNivAces.ParamByName('titulo').Text      := SQLQ2.FieldByName('mda_TITULO').AsString ;
           dmEmp.sqlNivAces.ParamByName('modl').Text        := SQLQ2.FieldByName('mda_MODl').AsString ;
           dmEmp.sqlNivAces.ParamByName('lei').AsBoolean    := False ;
           dmEmp.sqlNivAces.ParamByName('Gra').AsBoolean    := False ;
           dmEmp.sqlNivAces.ParamByName('Alt').AsBoolean    := False ;
           dmEmp.sqlNivAces.ParamByName('Exc').AsBoolean    := False ;
           dmEmp.sqlNivAces.ParamByName('UsuInc').Text      := sysUsuario ;
           dmEmp.sqlNivAces.ParamByName('DatInc').AsDate    := Now ;
           dmEmp.sqlNivAces.ParamByName('HorInc').Text      := TimeToStr(time) ;
           dmEmp.sqlNivAces.ExecSQL;
        End;
        SQLQ2.Next;
  end;
  FreeAndNil(SQLQ);
  FreeAndNil(SQLQ2);
end;



end.
