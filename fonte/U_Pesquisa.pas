unit U_Pesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ImgList,  Db, Mask,
  DBCtrls, ExtCtrls,  IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl,  CheckLst,  IniFiles,
  dbTables, FMTBcd, SqlExpr, DBXFirebird, StrUtils, Datasnap.Provider, Datasnap.DBClient,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, System.ImageList;

Type
  TfrmPesq = class(TForm)

  end;
type
  TfrmPesquisa = class
    dbgPesq: TDBGrid;
    cbxPesq: TComboBox;
    edCons: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    btnNew: TButton;
    ImageList1: TImageList;
    ZQuery1: TZQuery;
    procedure dbgPesqKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edConsChange(Sender: TObject);
    procedure cbxPesqChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
  private
    aTPcab, aTPcam: array of string;
    procedure FormPos(Form: TForm; const Horz, Vert: byte);
    { Private declarations }
  public
    ed_, ed0: TButtonedEdit;
    ed2: Tedit;
    ed1_, ed2_, ed3_ : Tedit;
    ed1a, ed2a, ed3a : TMaskEdit;
    qDb1: TZQuery;
    Dts1: TDataSource;
    cDb1, nmForm, cWhere_, Titulo: String;
    aCam1, aFil1 : array of string;
    aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
    cbxIndex: Integer;
    ResT, ResL, nMdEstoque: Integer;
    { Public declarations }
    Procedure   ChkRelac( cDb, cCmp1,cCmp2,cCmp3: String; ed1: TButtonedEdit; ed2, ed3: Tedit; qDb: TZQuery; Dts: TDataSource ) ;
    Procedure   ChkRelac2( cDb,cCmp1,cCmp2,cCmp3,cCmp4,cCmp5: String; ed1: TButtonedEdit; ed2, ed3, ed4, ed5: Tedit; qDb: TZQuery; Dts: TDataSource ) ;
    Procedure   ChkRelac3( cDb,cCmp1,cCmp2,cCmp3: String; ed1: TButtonedEdit; ed2: Tedit; ed3: TButtonedEdit; qDb: TZQuery; Dts: TDataSource ) ;
    Procedure   ChkEstoque( cDb,cCmp1,cCmp2,cCmp3: String; ed1: TButtonedEdit; ed2: Tedit; ed3: TMaskEdit; qDb: TZQuery; Dts: TDataSource ) ;
    procedure   atualizando();
  published
    constructor TelaPesq(AOwner: TComponent; db:TClientDataSet );
    constructor Create(AOwner : TComponent; pTitulo, cDb: String; FrmOut: TForm; ed: TButtonedEdit; ed1: Tedit; qDb: TZQuery; Dts: TDataSource; var pFcab, pFcam, pTam : array of string; cWhere: String; nfd: Integer    );
    constructor CreateForm(AOwner : TComponent; pTitulo, cDb: String; FrmOut: TForm; ed: TButtonedEdit; ed1: Tedit; qDb: TZQuery; Dts: TDataSource; var pFcab, pFcam, pTam : array of string; cWhere: String; nfd: Integer; frmAdtivo: String    );
    constructor Create2(AOwner : TComponent; pTitulo, cDb: String; FrmOut: TForm; ed: TButtonedEdit; ed1, ed2, ed3, ed4: Tedit; qDb: TZQuery; Dts: TDataSource; var pFcab, pFcam, pTam : array of string; cWhere: String; nfd: Integer );
    constructor Create3(AOwner : TComponent; pTitulo, cDb: String; FrmOut: TForm; ed: TButtonedEdit; ed1: Tedit; ed2, ed3, ed4: TMaskEdit; qDb: TZQuery; Dts: TDataSource; var pFcab, pFcam, pTam : array of string; cWhere: String; nfd: Integer );

  end;

var
  frmPesquisa: TfrmPesquisa;

implementation

uses U_funcao;

constructor TfrmPesquisa.Create(AOwner : TComponent; pTitulo, cDb: String; FrmOut: TForm; ed: TButtonedEdit; ed1: Tedit; qDb: TZQuery; Dts: TDataSource; var pFcab, pFcam, pTam : array of string; cWhere: String; nfd: Integer );
Var
i, y, k: Integer;
cHwewa: String;

begin
  nMdEstoque := 0;
  ResT    := Screen.Width ;
  ResL    := Screen.Height;


  ed0   := ed;
  ed2   := ed1;
  qDb1  := qDb;
  Dts1  := Dts;
  cDb1  := cDb;
  cWhere_:=cWhere;

  Dts1.DataSet.Open;
  qDb1.Active := true;

  qDb1.Close;
  qDb1.Sql.Clear;
  qDb1.Sql.Add('SELECT * from '+cDb1+' '+cWhere );
  qDb1.Open;

  Titulo  := pTitulo;

  cbxPesq.Text := pFcab[1];
  dbgPesq.Columns.Clear;
  dbgPesq.DataSource := Dts1;

if Length(pFcab) >= 1 then
   begin
    dbgPesq.Columns.Add;
    dbgPesq.Columns[0].Title.Caption  := pFcab[0] ;
    dbgPesq.Columns[0].FieldName      := pFcam[0] ;
    dbgPesq.Columns[0].Width          := StrToInt(pTam[0]);
   end;

if Length(pFcab) >= 2 then
    begin
    dbgPesq.Columns.Add;
    dbgPesq.Columns[1].Title.Caption  := pFcab[1] ;
    dbgPesq.Columns[1].FieldName      := pFcam[1] ;
    dbgPesq.Columns[1].Width          := StrToInt(pTam[1]);
    end;

If Length(pFcab) >= 3 then
    begin
    dbgPesq.Columns.Add;
    dbgPesq.Columns[1].Title.Caption  := pFcab[1] ;
    dbgPesq.Columns[1].fieldName      := pFcam[1] ;
    dbgPesq.Columns[1].Width          := StrToInt(pTam[1]);
    end;

If Length(pFcab) >= 4 then
    begin
    dbgPesq.Columns.Add;
    dbgPesq.Columns[1].Title.Caption  := pFcab[1] ;
    dbgPesq.Columns[1].fieldName      := pFcam[1] ;
    dbgPesq.Columns[1].Width          := StrToInt(pTam[1]);
    end;

  SetLength(aCam1, Length(pFcab));
  SetLength(aFil1, Length(pFcab));
  for i := 0 to Length(pFcab)-1 do
      begin
      cbxPesq.Items.Add(pFcab[i]); // Add the correct element!
      aCam1[i] :=pFcab[i];
      aFil1[i] :=pFcam[i];
      end;


// ResT - FrmOut.top
  //Left := ed.Left + ( FrmOut.left + (ed.Width+40) ) ;
  //Top  :=  ( (FrmOut.Top + 50) + ( nfd + ed.Top) )   ;
//  ShowMessage(InttoStr(Top));
// ( ResL - ( FrmOut.ClientHeight + FrmOut.Top ) ) ;


end;

constructor TfrmPesquisa.CreateForm(AOwner : TComponent; pTitulo, cDb: String; FrmOut: TForm; ed: TButtonedEdit; ed1: Tedit; qDb: TZQuery; Dts: TDataSource; var pFcab, pFcam, pTam : array of string; cWhere: String; nfd: Integer; frmAdtivo: String );
Var
i, y, k: Integer;
cHwewa: String;

begin
  nMdEstoque := 0;
  ResT    :=  Screen.Width ;
  ResL    :=  Screen.Height;
  nmForm  :=  frmAdtivo;
 cWhere_  :=cWhere;

  ed0     := ed;
  ed2     := ed1;
  qDb1    := qDb;
  Dts1    := Dts;
  cDb1    := cDb;



  Dts1.DataSet.Open;
  qDb1.Active := true;

  qDb1.Close;
  qDb1.Sql.Clear;
  qDb1.Sql.Add('SELECT * from '+cDb1+' '+cWhere );
  qDb1.Open;

//  qDb1.FieldByName('codalu').AsInteger;
//  qDb1.FieldByName('nome').Text;

  Titulo  := pTitulo;

  cbxPesq.Text := pFcab[1];
  dbgPesq.Columns.Clear;
  dbgPesq.DataSource := Dts1;

if Length(pFcab) >= 1 then
   begin
    dbgPesq.Columns.Add;
    dbgPesq.Columns[0].Title.Caption  := pFcab[0] ;
    dbgPesq.Columns[0].FieldName      := pFcam[0] ;
    dbgPesq.Columns[0].Width          := StrToInt(pTam[0]);
   end;

if Length(pFcab) >= 2 then
    begin
    dbgPesq.Columns.Add;
    dbgPesq.Columns[1].Title.Caption  := pFcab[1] ;
    dbgPesq.Columns[1].FieldName      := pFcam[1] ;
    dbgPesq.Columns[1].Width          := StrToInt(pTam[1]);
    end;

If Length(pFcab) >= 3 then
    begin
    dbgPesq.Columns.Add;
    dbgPesq.Columns[1].Title.Caption  := pFcab[1] ;
    dbgPesq.Columns[1].fieldName      := pFcam[1] ;
    dbgPesq.Columns[1].Width          := StrToInt(pTam[1]);
    end;

If Length(pFcab) >= 4 then
    begin
    dbgPesq.Columns.Add;
    dbgPesq.Columns[1].Title.Caption  := pFcab[1] ;
    dbgPesq.Columns[1].fieldName      := pFcam[1] ;
    dbgPesq.Columns[1].Width          := StrToInt(pTam[1]);
    end;

  SetLength(aCam1, Length(pFcab));
  SetLength(aFil1, Length(pFcab));
  for i := 0 to Length(pFcab)-1 do
      begin
      cbxPesq.Items.Add(pFcab[i]); // Add the correct element!
      aCam1[i] :=pFcab[i];
      aFil1[i] :=pFcam[i];
      end;


// ResT - FrmOut.top
 // Left := ed.Left + ( FrmOut.left + (ed.Width+40) ) ;
//  Top  :=  ( (FrmOut.Top + 50) + ( nfd + ed.Top) )   ;
//  ShowMessage(InttoStr(Top));
// ( ResL - ( FrmOut.ClientHeight + FrmOut.Top ) ) ;
btnNew.Enabled := (nmForm <> '')

end;


constructor TfrmPesquisa.Create2(AOwner : TComponent; pTitulo, cDb: String; FrmOut: TForm; ed: TButtonedEdit; ed1, ed2, ed3, ed4: Tedit; qDb: TZQuery; Dts: TDataSource; var pFcab, pFcam, pTam : array of string; cWhere: String; nfd: Integer );
Var
i: Integer;
cHwewa: String;

begin
  nMdEstoque := 0;
  ResT := Screen.Width ;
  ResL := Screen.Height;

ed0   := ed;

ed_   := ed;
ed1_  := ed1;
ed2_  := ed2;
ed3_  := ed3;
qDb1  := qDb;
Dts1  := Dts;
cDb1  := cDb;




  Dts1.DataSet.Open;
  qDb1.Active := true;

  qDb1.Close;
  qDb1.Sql.Clear;
  qDb1.Sql.Add('SELECT * from '+cDb1+' '+cWhere );
  qDb1.Open;

//  qDb1.FieldByName('codalu').AsInteger;
//  qDb1.FieldByName('nome').Text;

  Titulo  := pTitulo;

  cbxPesq.Text := pFcab[1];
  dbgPesq.Columns.Clear;
  dbgPesq.DataSource := Dts1;

if Length(pFcab) >= 1 then
   begin
    dbgPesq.Columns.Add;
    dbgPesq.Columns[0].Title.Caption  := pFcab[0] ;
    dbgPesq.Columns[0].FieldName      := pFcam[0] ;
    dbgPesq.Columns[0].Width          := StrToInt(pTam[0]);
   end;

if Length(pFcab) >= 2 then
    begin
    dbgPesq.Columns.Add;
    dbgPesq.Columns[1].Title.Caption  := pFcab[1] ;
    dbgPesq.Columns[1].FieldName      := pFcam[1] ;
    dbgPesq.Columns[1].Width          := StrToInt(pTam[1]);
    end;

If Length(pFcab) >= 3 then
    begin
    dbgPesq.Columns.Add;
    dbgPesq.Columns[1].Title.Caption  := pFcab[1] ;
    dbgPesq.Columns[1].fieldName      := pFcam[1] ;
    dbgPesq.Columns[1].Width          := StrToInt(pTam[1]);
    end;

If Length(pFcab) >= 4 then
    begin
    dbgPesq.Columns.Add;
    dbgPesq.Columns[1].Title.Caption  := pFcab[1] ;
    dbgPesq.Columns[1].fieldName      := pFcam[1] ;
    dbgPesq.Columns[1].Width          := StrToInt(pTam[1]);
    end;

  SetLength(aCam1, Length(pFcab));
  SetLength(aFil1, Length(pFcab));
  for i := 0 to Length(pFcab)-1 do
      begin
      cbxPesq.Items.Add(pFcab[i]); // Add the correct element!
      aCam1[i] :=pFcab[i];
      aFil1[i] :=pFcam[i];
      end;


// ResT - FrmOut.top
//  Left := ed.Left + ( FrmOut.left + (ed.Width+40) ) ;
//  Top  :=  ( (FrmOut.Top + 50) + ( nfd + ed.Top) )   ;
//  ShowMessage(InttoStr(Top));
// ( ResL - ( FrmOut.ClientHeight + FrmOut.Top ) ) ;

end;


constructor TfrmPesquisa.Create3(AOwner : TComponent; pTitulo, cDb: String; FrmOut: TForm; ed: TButtonedEdit; ed1: Tedit; ed2, ed3, ed4: TMaskEdit; qDb: TZQuery; Dts: TDataSource; var pFcab, pFcam, pTam : array of string; cWhere: String; nfd: Integer );
Var
i: Integer;
cHwewa: String;

begin
  nMdEstoque := 1;
  ResT := Screen.Width ;
  ResL := Screen.Height;

ed0   := ed;

ed_   := ed;
ed1_  := ed1;
ed2a  := ed2;
ed3a  := ed3;
qDb1  := qDb;
Dts1  := Dts;
cDb1  := cDb;



  Dts1.DataSet.Open;
  qDb1.Active := true;

  qDb1.Close;
  qDb1.Sql.Clear;
  qDb1.Sql.Add( ' SELECT A.*, B.NOME AS DSMATERIAL, C.NOME AS DSALMOX from ESTOQUE AS A '+
                ' LEFT JOIN MATERIAL AS B ON B.CODMTR = A.CODMTR '+
                ' LEFT JOIN ALMOXARIFADO AS C ON C.CODALM = A.CODALM ORDER BY A.CODALM, A.CODMTR '+cWhere);
  qDb1.Open;

//  qDb1.FieldByName('CODMTR').AsInteger;
//  qDb1.FieldByName('nome').Text;

  Titulo  := pTitulo;

  cbxPesq.Text := pFcab[1];
  dbgPesq.Columns.Clear;
  dbgPesq.DataSource := Dts1;

if Length(pFcab) >= 1 then
   begin
    dbgPesq.Columns.Add;
    dbgPesq.Columns[0].Title.Caption  := pFcab[0] ;
    dbgPesq.Columns[0].FieldName      := pFcam[0] ;
    dbgPesq.Columns[0].Width          := StrToInt(pTam[0]);
   end;

if Length(pFcab) >= 2 then
    begin
    dbgPesq.Columns.Add;
    dbgPesq.Columns[1].Title.Caption  := pFcab[1] ;
    dbgPesq.Columns[1].FieldName      := pFcam[1] ;
    dbgPesq.Columns[1].Width          := StrToInt(pTam[1]);
    end;

If Length(pFcab) >= 3 then
    begin
    dbgPesq.Columns.Add;
    dbgPesq.Columns[2].Title.Caption  := pFcab[2] ;
    dbgPesq.Columns[2].fieldName      := pFcam[2] ;
    dbgPesq.Columns[2].Width          := StrToInt(pTam[2]);
    end;

If Length(pFcab) >= 4 then
    begin
    dbgPesq.Columns.Add;
    dbgPesq.Columns[3].Title.Caption  := pFcab[3] ;
    dbgPesq.Columns[3].fieldName      := pFcam[3] ;
    dbgPesq.Columns[3].Width          := StrToInt(pTam[3]);
    end;

  SetLength(aCam1, Length(pFcab));
  SetLength(aFil1, Length(pFcab));
  for i := 0 to Length(pFcab)-1 do
      begin
      cbxPesq.Items.Add(pFcab[i]); // Add the correct element!
      aCam1[i] :=pFcab[i];
      aFil1[i] :=pFcam[i];
      end;


// ResT - FrmOut.top
//  Left := ed.Left + ( FrmOut.left + (ed.Width+40) ) ;
//  Top  :=  ( (FrmOut.Top + 50) + ( nfd + ed.Top) )   ;
//  ShowMessage(InttoStr(Top));
// ( ResL - ( FrmOut.ClientHeight + FrmOut.Top ) ) ;

end;

{$R *.dfm}

procedure TfrmPesquisa.Button1Click(Sender: TObject);
begin
    if nMdEstoque = 0 Then
        begin
          ed0.Text := dbgPesq.Columns.Grid.Fields[0].DisplayText;
          ed_.Text := dbgPesq.Columns.Grid.Fields[0].DisplayText;
          ed2.Text := dbgPesq.Columns.Grid.Fields[1].DisplayText;
          ed1_.Text := dbgPesq.Columns.Grid.Fields[1].DisplayText;
          End
        Else Begin
          ed_.Text   := dbgPesq.Columns.Grid.Fields[0].DisplayText;
          ed1_.Text  := dbgPesq.Columns.Grid.Fields[1].DisplayText;
          ed2a.Text  := dbgPesq.Columns.Grid.Fields[2].DisplayText;
        End;
end;

procedure TfrmPesquisa.btnNewClick(Sender: TObject);
var

formX : Tform;
begin

  if nmForm <> '' then
      Begin
        //dm.TelaP := 'S';
       // Application.CreateForm(TfrmCidadeInc, frmCidadeInc);
        //frmCidadeInc := TfrmCidadeInc.Create(Self);
        //frmCidadeInc.Show;

      End;



end;
procedure TfrmPesquisa.atualizando();
Begin

      qDb1.Close;
      qDb1.Sql.Clear;
      qDb1.Sql.Add('SELECT * from '+cDb1+' '+cWhere_ );
      qDb1.Open;

      dbgPesq.DataSource := Dts1 ;
      dbgPesq.DataSource.DataSet.Last ;
      dbgPesq.SetFocus ;
      dbgPesq.refresh  ;

End;

procedure TfrmPesquisa.cbxPesqChange(Sender: TObject);
begin
  cbxIndex := cbxPesq.ItemIndex;
end;

Procedure TfrmPesquisa.ChkRelac( cDb,cCmp1,cCmp2,cCmp3: String; ed1: TButtonedEdit; ed2, ed3: Tedit; qDb: TZQuery; Dts: TDataSource ) ;

begin

try
  if ed1.Text = '' then
  begin
     mensagem('Este Código não foi Informado Corretamente', [mbOk], 'Atenção',mtWarning);
     if ed2.SelLength > 0 then;
        ed2.Clear;
     if ed3.Showing then;
        ed3.Clear;

    end
  Else Begin
    qDb.Close;
    qDb.Sql.Clear;
    qDb.Sql.Add('SELECT * from '+cDb+' where '+cCmp1+' = '+ed1.Text);
    qDb.Open;
    if qDb.Eof then
      begin
        MessageDlg('Codigo de Consulta Não Existente',mtError,[mbOk],0);
       if ed2 <> nil then;
          begin
            ed2.Clear;
          end;
       if ed3 <> nil then;
          begin
            ed3.Clear;
          end;
          ed1.SetFocus;
      end
      else begin
           if ed2 <> nil then;
              begin
              ed2.Text := qDb.fieldByname(cCmp2).AsString;
           end;
           if ed3 <> nil then;
              begin
              ed3.Text := qDb.fieldByname(cCmp3).AsString;
           end;

      end;
  End;
except

end;


end;

Procedure TfrmPesquisa.ChkRelac2( cDb,cCmp1,cCmp2,cCmp3,cCmp4,cCmp5: String; ed1: TButtonedEdit; ed2, ed3, ed4, ed5: Tedit; qDb: TZQuery; Dts: TDataSource ) ;

begin

try
  if ed1.Text = '' then
  begin
     mensagem('Este Código não foi Informado Corretamente', [mbOk], 'Atenção',mtWarning);
     if ed2.SelLength > 0 then;
        ed2.Clear;
     if ed3.Showing then;
        ed3.Clear;

    end
  Else Begin
    qDb.Close;
    qDb.Sql.Clear;
    qDb.Sql.Add('SELECT * from '+cDb+' where '+cCmp1+' = '+ed1.Text);
    qDb.Open;
    if qDb.Eof then
      begin
        MessageDlg('Codigo de Consulta Não Existente',mtError,[mbOk],0);
       if ed2 <> nil then;
          begin
            ed2.Clear;
          end;
       if ed3 <> nil then;
          begin
            ed3.Clear;
          end;
       if ed4 <> nil then;
          begin
            ed4.Clear;
          end;
       if ed5 <> nil then;
          begin
            ed5.Clear;
          end;
          ed1.SetFocus;
      end
      else begin
           if ed2 <> nil then;
              begin
              ed2.Text := qDb.fieldByname(cCmp2).AsString;
           end;
           if ed3 <> nil then;
              begin
              ed3.Text := qDb.fieldByname(cCmp3).AsString;
           end;
           if ed4 <> nil then;
              begin
              ed4.Text := qDb.fieldByname(cCmp4).AsString;
           end;
           if ed5 <> nil then;
              begin
              ed5.Text := qDb.fieldByname(cCmp5).AsString;
           end;

      end;
  End;
except

end;


end;


Procedure TfrmPesquisa.ChkRelac3( cDb,cCmp1,cCmp2,cCmp3: String; ed1: TButtonedEdit; ed2: Tedit; ed3: TButtonedEdit; qDb: TZQuery; Dts: TDataSource ) ;

begin

try
  if ed1.Text = '' then
  begin
     mensagem('Este Código não foi Informado Corretamente', [mbOk], 'Atenção',mtWarning);
     if ed2.SelLength > 0 then;
        ed2.Clear;
     if ed3.Showing then;
        ed3.Clear;

    end
  Else Begin
    qDb.Close;
    qDb.Sql.Clear;
    qDb.Sql.Add('SELECT * from '+cDb+' where '+cCmp1+' = '+ed1.Text);
    qDb.Open;
    if qDb.Eof then
      begin
        MessageDlg('Codigo de Consulta Não Existente',mtError,[mbOk],0);
       if ed2 <> nil then;
          begin
            ed2.Clear;
          end;
       if ed3 <> nil then;
          begin
            ed3.Clear;
          end;
          ed1.SetFocus;
      end
      else begin
           if ed2 <> nil then;
              begin
              ed2.Text := qDb.fieldByname(cCmp2).AsString;
           end;
           if ed3 <> nil then;
              begin
              ed3.Text := qDb.fieldByname(cCmp3).AsString;
           end;

      end;
  End;
except

end;


end;

Procedure TfrmPesquisa.ChkEstoque( cDb,cCmp1,cCmp2,cCmp3: String; ed1: TButtonedEdit; ed2: Tedit; ed3: TMaskEdit; qDb: TZQuery; Dts: TDataSource ) ;

begin

try
  if ed1.Text = '' then
  begin
     mensagem('Este Código não foi Informado Corretamente', [mbOk], 'Atenção',mtWarning);
     if ed2.SelLength > 0 then;
        ed2.Clear;
     if ed3.Showing then;
        ed3.Clear;

    end
  Else Begin
    qDb.Close;
    qDb.Sql.Clear;
    qDb.Sql.Add('SELECT * from '+cDb+' where '+cCmp1+' = '+ed1.Text);
    qDb.Open;
    if qDb.Eof then
      begin
        MessageDlg('Codigo de Consulta Não Existente',mtError,[mbOk],0);
       if ed2 <> nil then;
          begin
            ed2.Clear;
          end;
       if ed3 <> nil then;
          begin
            ed3.Clear;
          end;
          ed1.SetFocus;
      end
      else begin
           if ed2 <> nil then;
              begin
              ed2.Text := qDb.fieldByname(cCmp2).AsString;
           end;
           if ed3 <> nil then;
              begin
              ed3.Text := qDb.fieldByname(cCmp3).AsString;
           end;

      end;
  End;
except

end;


end;



procedure TfrmPesquisa.dbgPesqKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if  key = VK_RETURN then
    begin
    if nMdEstoque = 0 Then
        begin
          ed0.Text := dbgPesq.Columns.Grid.Fields[0].DisplayText;
          ed_.Text := dbgPesq.Columns.Grid.Fields[0].DisplayText;
          ed2.Text := dbgPesq.Columns.Grid.Fields[1].DisplayText;
          ed1_.Text := dbgPesq.Columns.Grid.Fields[1].DisplayText;

          End
        Else Begin
          ed_.Text   := dbgPesq.Columns.Grid.Fields[0].DisplayText;
          ed1_.Text  := dbgPesq.Columns.Grid.Fields[1].DisplayText;
          ed2a.Text  := dbgPesq.Columns.Grid.Fields[2].DisplayText;

        End;

end;
if  key = VK_ESCAPE then
    begin

end;

end;


procedure TfrmPesquisa.edConsChange(Sender: TObject);
var
cCmpPes : String;
begin

case cbxIndex  of
 0: cCmpPes := aFil1[0] ;
 1: cCmpPes := aFil1[1] ;
end;
qDb1.Close;
qDb1.SQL.Clear;
qDb1.SQL.Add('SELECT * FROM '+cDb1+' WHERE UPPER('+cCmpPes+') like UPPER('+QuotedStr('%'+edCons.Text+'%')+') order by '+cCmpPes+' ');
qDb1.Open;
dbgPesq.DataSource := Dts1;
dbgPesq.Refresh;

end;



procedure TfrmPesquisa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   //dm.TelaP := 'N';
end;

procedure TfrmPesquisa.FormPos(Form: TForm; const Horz, Vert: byte);
{ Horz: 1=esquerda, 2=centro, 3=direita Vert: 1=topo, 2=centro, 3=em baixo }
var
  R: TRect;

begin
  if not SystemParametersInfo(SPI_GETWORKAREA, 0, @R, 0) then
    R := Rect(0, 0, Screen.Width, Screen.Height);
  with Form do
    case Horz of
      1: Form.Left := 0;
      2: Form.Left := (R.Right - R.Left - Width) div 2;
      3: Form.Left := R.Right - Width;
    end;
  with Form do
    case Vert of
      1: Form.Top := 0;
      2: Form.Top := (R.Bottom - R.Top - Height) div 2;
      3: Form.Top := R.Bottom - Height;
    end;
end;



procedure TfrmPesquisa.FormShow(Sender: TObject);
begin
  cbxIndex := 1;
end;

constructor TfrmPesquisa.TelaPesq(AOwner: TComponent; db: TClientDataSet);
begin
  Titulo:='Tabela de Cidade';
  // -----------------------  CAMPOS DO DBGRID -----------------------------//
  // arrays de TITULOS de pesquisa co combobox
  SetLength(aFcab,Length(aFcab)+1); aFcab[Length(aFcab)-1] :='Código';
  SetLength(aFcab,Length(aFcab)+1); aFcab[Length(aFcab)-1] :='Cidade';
  SetLength(aFcab,Length(aFcab)+1); aFcab[Length(aFcab)-1] :='Estado';

  // arrays de CAMPOSde pesquisa co combobox
  SetLength(aFcam,Length(aFcam)+1); aFcam[Length(aFcam)-1] :='codcid';
  SetLength(aFcam,Length(aFcam)+1); aFcam[Length(aFcam)-1] :='nome';
  SetLength(aFcam,Length(aFcam)+1); aFcam[Length(aFcam)-1] :='UF';

  // arrays de TAMANHO DOS CAMPOS de pesquisa co combobox
  SetLength(aTcam,Length(aTcam)+1); aTcam[Length(aTcam)-1] :='50';
  SetLength(aTcam,Length(aTcam)+1); aTcam[Length(aTcam)-1] :='250';
  SetLength(aTcam,Length(aTcam)+1); aTcam[Length(aTcam)-1] :='50';

end;

end.
