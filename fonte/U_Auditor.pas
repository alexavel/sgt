unit U_Auditor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Data.DB;

type
  TfrmAuditor = class(TForm)
    Panel1: TPanel;
    dbgAuditor: TDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    cbxUsuario: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    datini: TDateTimePicker;
    datfin: TDateTimePicker;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure RefrescaGrid;
    procedure datiniExit(Sender: TObject);
    procedure datfinExit(Sender: TObject);
    procedure cbxUsuarioChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure dbgAuditorDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAuditor: TfrmAuditor;

implementation
 Uses uSistema, U_funcao, U_dmEmp;
{$R *.dfm}

procedure TfrmAuditor.Button2Click(Sender: TObject);
begin

  dmEmp.sqlAuditor.Close;
  dmEmp.cliAuditor.Active := False;
  dmEmp.dspAuditor.DataSet.Active := False;
  frmAuditor.Close;

end;

procedure TfrmAuditor.cbxUsuarioChange(Sender: TObject);
begin
  //Auditor(Screen.activeform.Caption,'Pesquisou ',' Usuário: '+cbxUsuario.Items.Strings[cbxUsuario.ItemIndex] );
  RefrescaGrid;
end;

procedure TfrmAuditor.datfinExit(Sender: TObject);
begin
RefrescaGrid;
end;

procedure TfrmAuditor.datiniExit(Sender: TObject);
begin
RefrescaGrid;
end;

procedure TfrmAuditor.dbgAuditorDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    if gdFocused in State then  begin
      dbgAuditor.Canvas.Brush.Color  := Azul_Escuro;
      dbgAuditor.Canvas.Font.Color   := Branco;
      dbgAuditor.Canvas.FillRect(Rect);
      dbgAuditor.DefaultDrawDataCell(Rect, Column.Field, State);
    end else begin

        if Odd(dbgAuditor.DataSource.DataSet.RecNo) then begin
          dbgAuditor.Canvas.Brush.Color  := Branco;
          dbgAuditor.Canvas.Font.Color   := Preto;
          dbgAuditor.Canvas.FillRect(Rect);
          dbgAuditor.DefaultDrawDataCell(Rect, Column.Field, State);

        End else Begin
          dbgAuditor.Canvas.Brush.Color  := Cinza_Sintilante;
          dbgAuditor.Canvas.Font.Color   := Preto;
          dbgAuditor.Canvas.FillRect(Rect);
          dbgAuditor.DefaultDrawDataCell(Rect, Column.Field, State);
        End;

    end;
end;

procedure TfrmAuditor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Auditor(Screen.activeform.Caption,'Saiu','');
  dmEmp.sqlAuditor.Close;
  dmEmp.cliAuditor.Active := False;
  dmEmp.dspAuditor.DataSet.Active := False;
  frmAuditor := nil ;
  action := cafree;

end;

procedure TfrmAuditor.FormCreate(Sender: TObject);
begin
  Auditor(Screen.activeform.Caption,'Acessou','');

  //Pegar todos os Usuários
  dmEmp.sqlUsuario.Close;
  dmEmp.sqlUsuario.Sql.Text := 'Select * From "dbconfig".Usuario order by usu_login';
  dmEmp.sqlUsuario.Open;

  cbxUsuario.Clear;
  cbxUsuario.Items.Add('Todos');
  dmEmp.sqlUsuario.First ;
  while Not dmEmp.sqlUsuario.Eof do bEGIN
        cbxUsuario.Items.Add( dmEmp.sqlUsuario.FieldByName('usu_LOGIN').AsString );
        dmEmp.sqlUsuario.Next
  End;
  cbxUsuario.ItemIndex := 0;
  datini.Date := Now;
  datfin.Date := Now;
  RefrescaGrid;

end;

procedure TfrmAuditor.RefrescaGrid;
Var
cWhere : String;
begin
//     cbxUsuario.Items.Text
  If cbxUsuario.Text  <> 'Todos' Then Begin
     cWhere := 'And UPPER(adt_usuario) = UPPER(:login) ';
  End Else Begin
     cWhere := '';
  End;

      dmEmp.cliAuditor.Close;
      dmEmp.sqlAuditor.Close;
      dmEmp.cliAuditor.CommandText := 'SELECT * FROM "dbconfig".auditor WHERE adt_dtacao >= :datini and adt_dtacao <= :datfin '+cWhere+' order by adt_dtacao, adt_hracao  DESC';
      dmEmp.cliAuditor.Params.ParamByName('datini').AsDate := datini.Date ;
      dmEmp.cliAuditor.Params.ParamByName('datfin').AsDate := datini.Date ;
      If cbxUsuario.Text <> 'Todos' Then Begin
         dmEmp.cliAuditor.Params.ParamByName('Login').Text := cbxUsuario.Text ;
      End;
      dmEmp.cliAuditor.Open;
      dmEmp.cliAuditor.Active := True;
      dmEmp.cliAuditor.ApplyUpdates(0);


end;

initialization
  RegisterClass(TFrmAuditor);

end.
