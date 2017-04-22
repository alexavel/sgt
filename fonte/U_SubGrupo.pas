unit U_SubGrupo;

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
  Vcl.Imaging.pngimage, U_Classcons, EditTuning ;

type
  TfrmSubGrupo = class(T_frmModeloCrud)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    sgr_codgru: TButtonedEdit;
    edNomGru: TEdit;
    sgr_nome: TEdit;
    sgr_codniv: TButtonedEdit;
    edNomNiv: TEdit;
    dbgNivel: TDBGrid;
    RadioButton3: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton1: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton9: TRadioButton;
    sgr_codigo: TEdit;
    procedure sgr_codgruRightButtonClick(Sender: TObject);
    procedure sgr_codgruKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgr_codgruExit(Sender: TObject);
    procedure sgr_codnivRightButtonClick(Sender: TObject);
    procedure sgr_codnivKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgr_codnivExit(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure RadioButton9Click(Sender: TObject);
    procedure dbgNivelDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnNovoExecute(Sender: TObject);
    procedure btnEditarExecute(Sender: TObject);
    procedure btnExcluirExecute(Sender: TObject);
    procedure btnVizualizaExecute(Sender: TObject);
  private
    procedure chkradio(Sender: TObject);
    procedure RefreshGrid;
    { Private declarations }
  public
     Pesquisa : TClasConsulta;
    { Public declarations }
  end;

var
  frmSubGrupo: TfrmSubGrupo;
  cWhere: String;

implementation

Uses U_dmEmp, uSistema, U_funcao;

{$R *.dfm}

procedure TfrmSubGrupo.dbgNivelDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
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

procedure TfrmSubGrupo.RadioButton1Click(Sender: TObject);
begin
  inherited;
  chkradio(Sender);
end;

procedure TfrmSubGrupo.RadioButton2Click(Sender: TObject);
begin
  inherited;
  chkradio(Sender);
end;

procedure TfrmSubGrupo.RadioButton3Click(Sender: TObject);
begin
  inherited;
  chkradio(Sender);
end;

procedure TfrmSubGrupo.RadioButton4Click(Sender: TObject);
begin
  inherited;
  chkradio(Sender);
end;

procedure TfrmSubGrupo.RadioButton5Click(Sender: TObject);
begin
  inherited;
  chkradio(Sender);
end;

procedure TfrmSubGrupo.RadioButton6Click(Sender: TObject);
begin
  inherited;
  chkradio(Sender);
end;

procedure TfrmSubGrupo.RadioButton9Click(Sender: TObject);
begin
  inherited;
  chkradio(Sender);
end;

procedure TfrmSubGrupo.btnEditarExecute(Sender: TObject);
begin
  inherited;
  RefreshGrid;
end;

procedure TfrmSubGrupo.btnExcluirExecute(Sender: TObject);
begin
  inherited;
  RefreshGrid;
end;

procedure TfrmSubGrupo.btnNovoExecute(Sender: TObject);
begin
  inherited;
  RefreshGrid;
end;

procedure TfrmSubGrupo.btnVizualizaExecute(Sender: TObject);
begin
  inherited;
  RefreshGrid;
end;

procedure TfrmSubGrupo.chkradio(Sender: TObject);
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

procedure TfrmSubGrupo.sgr_codgruExit(Sender: TObject);
begin
  inherited;

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela  :=  dmEmp.sqlgrupo ;
  edNomGru.Text       :=  Pesquisa.Relacao('grupo',sgr_codgru,'gru_codigo','gru_grupo');


end;

procedure TfrmSubGrupo.sgr_codgruKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 Try
case key of
    VK_END:
      sgr_codgruRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmSubGrupo.sgr_codgruRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  inherited;

  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsgrupo ;
  Pesquisa.sqlTabela :=  dmEmp.sqlgrupo ;
  Pesquisa.cliTabela :=  dmEmp.cligrupo ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Grupos de Usuários';
  Pesquisa.nmTabela  := 'grupo' ;
  Pesquisa.NovoCad   := 'grupo' ;
  // Display        campo      cabecalho            get         tan  indices
  Pesquisa.AddReg('gru_codigo'  ,'Código'                  ,'sgr_codgru' ,5  ,'por Código'       );
  Pesquisa.AddReg('gru_grupo'   ,'Grupos'                  ,'edNomGru'  ,30 ,'por Grupo'         );


  Pesquisa.acessa(sgr_codgru);
  sgr_codgru.text   :=  Pesquisa.RecReg('gru_codigo');
  edNomGru.text     :=  Pesquisa.RecReg('gru_grupo');

  Pesquisa.Destroy;


end;

procedure TfrmSubGrupo.sgr_codnivExit(Sender: TObject);
begin
  inherited;

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela  :=  dmEmp.sqlNivel;
  edNomNiv.Text       :=  Pesquisa.Relacao('Nivel',sgr_codniv,'niv_codigo','niv_nivel'  );
  RefreshGrid();


end;

procedure TfrmSubGrupo.RefreshGrid;
begin

  dmEmp.cliNivAces.Close  ;
  dmEmp.sqlNivAces.Close  ;
  dmEmp.sqlNivAces.SQL.Text :='SELECT * FROM  '+U_funcao.SelSchema('NivAces')
                                   +' Where nva_codniv = '+fIIF(sgr_codniv.Text <>'',sgr_codniv.Text,'0')+' '+cWhere+' Order By nva_Modl, nva_Titulo';
  dmEmp.sqlNivAces.Open;
  dmEmp.cliNivAces.Active := True;
  dbgNivel.Visible := (Not dmEmp.cliNivAces.eof ) ;


end;


procedure TfrmSubGrupo.sgr_codnivKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 Try
case key of
    VK_END:
      sgr_codnivRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmSubGrupo.sgr_codnivRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  inherited;
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsNivel ;
  Pesquisa.sqlTabela :=  dmEmp.sqlNivel ;
  Pesquisa.cliTabela :=  dmEmp.cliNivel ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Níveis de Acesso';
  Pesquisa.nmTabela  := 'nivel';
  Pesquisa.NovoCad   := 'nivel' ;
  // Display        campo   cabecalho             get         tan  indices
  Pesquisa.AddReg('niv_codigo','Código'          ,'sgr_codniv' ,5  ,'por Código' );
  Pesquisa.AddReg('niv_nivel' ,'Nível de Acesso' ,'edNomNiv'   ,20 ,'por Nivel' );

  Pesquisa.acessa(sgr_codniv);
  sgr_codniv.text   :=  Pesquisa.RecReg('niv_codigo');
  edNomNiv.text     :=  Pesquisa.RecReg('niv_nivel');
  Pesquisa.Destroy;

end;

end.
