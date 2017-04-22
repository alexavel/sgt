unit U_Monitor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Imaging.jpeg, Vcl.ToolWin, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWCompGrids, IWDBGrids;

type
  TfrmMonitor = class(TForm)
    Banner: TPanel;
    imgLogo: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    ToolBar1: TToolBar;
    btnSaida: TToolButton;
    sqlMntVei: TZQuery;
    dspMntVei: TDataSetProvider;
    cliMntVei: TClientDataSet;
    dsMntVei: TDataSource;
    sqlMntVeitipo: TWideMemoField;
    sqlMntVeiplaca: TWideStringField;
    sqlMntVeimodelo: TWideStringField;
    sqlMntVeidetalhe: TWideMemoField;
    sqlMntVeikmrevisao: TFloatField;
    cliMntVeitipo: TWideMemoField;
    cliMntVeiplaca: TWideStringField;
    cliMntVeimodelo: TWideStringField;
    cliMntVeidetalhe: TWideMemoField;
    cliMntVeikmrevisao: TFloatField;
    PageControl1: TPageControl;
    tbsPessoal: TTabSheet;
    TreeView1: TTreeView;
    dbgVeic: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnSaidaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure TreeView1CustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure dbgVeicDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure TreeView1DblClick(Sender: TObject);
  private
    procedure RefreshDados;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMonitor: TfrmMonitor;
  ItemUltiimoCurso, ItemUltimaUnidade, ItemUltimaTurma: TTreeNode;
  xUnidadeAnt, xCursoAnt, xTurmaAnt, cVeiculo, cTipo: String;

implementation
 Uses uSistema, U_funcao, U_Classcons, U_ClasseUtil;
{$R *.dfm}

procedure TfrmMonitor.btnSaidaClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMonitor.dbgVeicDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var R : TRect;
begin
    R:=Rect;
    Dec(R.Bottom,2);

    if gdFocused in State then  begin
      dbgVeic.Canvas.Brush.Color  := Azul_Escuro;
      dbgVeic.Canvas.Font.Color   := Branco;
      dbgVeic.Canvas.FillRect(Rect);
      dbgVeic.DefaultDrawDataCell(Rect, Column.Field, State);
    end else begin

        if Odd(dbgVeic.DataSource.DataSet.RecNo) then begin
          dbgVeic.Canvas.Brush.Color  := Branco;
          dbgVeic.Canvas.Font.Color   := Preto;
          dbgVeic.Canvas.FillRect(Rect);
          dbgVeic.DefaultDrawDataCell(Rect, Column.Field, State);

        End else Begin
          dbgVeic.Canvas.Brush.Color  := Cinza_Sintilante;
          dbgVeic.Canvas.Font.Color   := Preto;
          dbgVeic.Canvas.FillRect(Rect);
          dbgVeic.DefaultDrawDataCell(Rect, Column.Field, State);
        End;

    end;

    if Column.Field=dbgVeic.DataSource.DataSet.FieldByName('tipo') then
     begin
      if not (gdSelected in State) then
          dbgVeic.Canvas.FillRect(Rect);
          dbgVeic.Canvas.TextRect(R,R.Left,R.Top,
          dbgVeic.DataSource.DataSet.FieldByName('tipo').AsString);
     end;
    if Column.Field=dbgVeic.DataSource.DataSet.FieldByName('detalhe') then
     begin
      if not (gdSelected in State) then
          dbgVeic.Canvas.FillRect(Rect);
          dbgVeic.Canvas.TextRect(R,R.Left,R.Top,
          dbgVeic.DataSource.DataSet.FieldByName('detalhe').AsString);
     end;

end;

procedure TfrmMonitor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cliMntVei.Close;
  sqlMntVei.close;
  Auditor(Screen.activeform.Caption,'Saiu','');
  frmMonitor := nil ;
  action := cafree;
  fPrincipal.btnMonitor.Enabled  := True;
end;

procedure TfrmMonitor.FormCreate(Sender: TObject);
Var
i: Integer;
begin
{
  cPre                        := 'osc_';
  cTabela                     := 'manutcab';
  acampo                      := 1;
  sqlNew                      := TZQuery.Create(nil);
  sqlNew.Connection           := dmEmp.SqlConSis;
  }
  fPrincipal.btnMonitor.Enabled  := False;
  {
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;
  }
end;

procedure TfrmMonitor.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //verifica se a tecla pressionada é a tecla ENTER, conhecida como #13
  If key = #13 then Begin
    //se for, passa o foco para o próximo campo, zerando o valor da variável Key
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  End Else
    If key = #27 then Begin
       Close;
  end;
end;

procedure TfrmMonitor.FormShow(Sender: TObject);
var
i, tmp: Integer;
Pesquisa : TClasConsulta;
begin
  cVeiculo    := '';
  cTipo       := '';
  xUnidadeAnt := '';
  xCursoAnt   := '';

  // Cor do banner
  Banner.ParentBackGround := False;
  Banner.ParentColor      := False;
  Banner.Brush.Color      := u_funcao.Bronze_Escuro ;

  // Titulos do Banner
  lbCabeca01.Caption    := 'Monitor de Eventos Sistemáticos';
  lbCabeca02.Caption    := u_funcao.nmSistema ;
  // Cores - Titulos do Banner
  lbCabeca01.Font.Color := u_funcao.clTit_BCad ;
  lbCabeca02.Font.Color := u_funcao.clTit_BCad ;
  cliMntVei.Active := True;
  RefreshDados;

  cliMntVei.First;
  while not cliMntVei.Eof do
    begin
      if xUnidadeAnt <> cliMntVei.FieldByName('PLACA').AsString then
      begin
        ItemUltimaUnidade := TreeView1.Items.AddChild(Nil,
        cliMntVei.FieldByName('PLACA').AsString+'-[Modelo: '+cliMntVei.FieldByName('modelo').AsString+']' );
        ItemUltimaUnidade.ImageIndex := 700;

      end;
      if xCursoAnt <> cliMntVei.FieldByName('TIPO').AsString then
      begin
        ItemUltiimoCurso := TreeView1.Items.AddChild(ItemUltimaUnidade,
        cliMntVei.FieldByName('TIPO').AsString);
        ItemUltiimoCurso.ImageIndex := 295;
       // ItemUltimaUnidade.TreeView.Canvas.Font.Style :=[];
      end;
      xUnidadeAnt := cliMntVei.FieldByName('PLACA').AsString;
      xCursoAnt   := cliMntVei.FieldByName('TIPO').AsString;
      cliMntVei.Next;
    end;


end;

procedure TfrmMonitor.TreeView1CustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
var
  i: integer;
begin
   if node.Level = 0 then begin
      Node.TreeView.Canvas.Font.Style :=[fsBold];
   end Else
   Node.TreeView.Canvas.Font.Style :=[];

end;

procedure TfrmMonitor.TreeView1DblClick(Sender: TObject);
begin

  If TreeView1.Items.Item[TreeView1.Selected.AbsoluteIndex].Level = 0 then
     cVeiculo := Copy( TreeView1.Items.Item[TreeView1.Selected.AbsoluteIndex].Text,1,7);

  If TreeView1.Items.Item[TreeView1.Selected.AbsoluteIndex].Level = 1 then
     cTipo    := TreeView1.Items.Item[TreeView1.Selected.AbsoluteIndex].Text;

  RefreshDados;
end;
procedure TfrmMonitor.RefreshDados;
Var
x : Integer;
cQry : String;
begin

cQry  := '';
if Not cVeiculo.IsEmpty then
  cQry := ' and vat_placa = '+QuotedStr(cVeiculo);

if Not cTipo.IsEmpty then
  //cQry := cQry+' and tipo = '+QuotedStr(cTipo);


sqlMntVei.close;
cliMntVei.close;
sqlMntVei.sql.text := ' SELECT ''MANUTENÇÃO PREVENTIVA'' AS tipo, '
                      +'                               vat_placa as placa, '
                      +'                               mdl_nome as modelo, '
                      +'                               tsm_nome as detalhe, '
                      +'( vat_kmatu - vsv_kmmanu ) as KmRevisao  from '+U_funcao.SelSchema('veiculoatv')+' '
                      +'INNER JOIN '+U_funcao.SelSchema('modelo')+' on mdl_codigo = vat_codmdl '
                      +'INNER JOIN '+U_funcao.SelSchema('modelomnt')+' on mdm_codmdl = mdl_codigo '
                      +'INNER JOIN '+U_funcao.SelSchema('veiculosrv')+' on vsv_codplc = vat_placa '
                      +'INNER JOIN '+U_funcao.SelSchema('tbservico')+' on tsm_codigo = vsv_codtsm '
                      +'WHERE  ( vat_kmatu >= vsv_kmmanu  ) '
                      +cQry
                      +'UNION '
                      +'SELECT ''RODÍZIO DE PNEU'' AS tipo, vat_placa AS placa, mdl_nome as modelo, '
                      +'CASE '
                      +'  WHEN substring(piv_locpne,1,1 ) = ''S'' THEN ''STEP ''||substring(piv_locpne,3,1) '
                      +'  ELSE ''EIXO ''||substring(piv_locpne,2,1)||'' '' '
                      +'END|| '
                      +'CASE '
                      +'  WHEN substring(piv_locpne,3,1 ) = ''D'' THEN ''DIANTEIRO'' '
                      +'  WHEN substring(piv_locpne,3,1 ) = ''T'' THEN ''TRASEIRO'' '
                      +'  ELSE '''' '
                      +'END|| '
                      +'CASE '
                      +'  WHEN substring(piv_locpne,4,1 ) = ''I'' THEN ''INTERNO'' '
                      +'  WHEN substring(piv_locpne,4,1 ) = ''E'' THEN ''EXTERNO'' '
                      +'  ELSE '''' '
                      +'END|| '
                      +'CASE '
                      +'  WHEN substring(piv_locpne,5,1 ) = ''D'' THEN ''DIREITO'' '
                      +'  WHEN substring(piv_locpne,5,1 ) = ''E'' THEN ''ESQUERDO'' '
                      +'  ELSE '''' '
                      +'END '
                      +'as detalhe,( vat_kmatu - piv_kmrodi ) as KmRevisao from '+U_funcao.SelSchema('veiculoatv')+' '
                      +'left JOIN '+U_funcao.SelSchema('modelo')+' on mdl_codigo = vat_codmdl '
                      +'left join '+U_funcao.SelSchema('pneuive')+' on piv_codplc = vat_placa '
                      +'where piv_locpne is not NULL AND piv_kmrodi <= vat_kmatu '
                      +cQry
                      +'UNION '
                      +'SELECT ''RECUPERAÇÃO DE PNEU ''||piv_nrvida||''ª VIDA'' AS tipo, vat_placa as Placa, mdl_nome as Modelo, '
                      +'CASE '
                      +'  WHEN substring(piv_locpne,1,1 ) = ''S'' THEN ''STEP ''||substring(piv_locpne,3,1) '
                      +'  ELSE ''EIXO ''||substring(piv_locpne,2,1)||'' '' '
                      +'END|| '
                      +'CASE '
                      +'  WHEN substring(piv_locpne,3,1 ) = ''D'' THEN ''DIANTEIRO'' '
                      +'  WHEN substring(piv_locpne,3,1 ) = ''T'' THEN ''TRASEIRO'' '
                      +'  ELSE '''' '
                      +'END|| '
                      +'CASE '
                      +'  WHEN substring(piv_locpne,4,1 ) = ''I'' THEN ''INTERNO'' '
                      +'  WHEN substring(piv_locpne,4,1 ) = ''E'' THEN ''EXTERNO'' '
                      +'  ELSE '''' '
                      +'END|| '
                      +'CASE '
                      +'  WHEN substring(piv_locpne,5,1 ) = ''D'' THEN ''DIREITO'' '
                      +'  WHEN substring(piv_locpne,5,1 ) = ''E'' THEN ''ESQUERDO'' '
                      +'  ELSE '''' '
                      +'END '
                      +'as detalhe,( vat_kmatu - CASE  '
                      +'  WHEN piv_nrvida = ''1'' THEN piv_kmvda1 '
                      +'  WHEN piv_nrvida = ''2'' THEN piv_kmvda2 '
                      +'  WHEN piv_nrvida = ''3'' THEN piv_kmvda3 '
                      +'  WHEN piv_nrvida = ''4'' THEN piv_kmvda4 '
                      +'  WHEN piv_nrvida = ''5'' THEN piv_kmvda5 '
                      +'  WHEN piv_nrvida = ''6'' THEN piv_kmvda6 '
                      +'  WHEN piv_nrvida = ''7'' THEN piv_kmvda7 '
                      +'  WHEN piv_nrvida = ''8'' THEN piv_kmvda8 '
                      +'  WHEN piv_nrvida = ''9'' THEN piv_kmvda9 '
                      +'END ) as KmRevisao  from '+U_funcao.SelSchema('veiculoatv')+' '
                      +'left JOIN '+U_funcao.SelSchema('modelo')+' on mdl_codigo = vat_codmdl '
                      +'left join '+U_funcao.SelSchema('pneuive')+' on piv_codplc = vat_placa '
                      +'where piv_locpne is not NULL AND CASE    '
                      +'  WHEN piv_nrvida = ''1'' THEN piv_kmvda1  '
                      +'  WHEN piv_nrvida = ''2'' THEN piv_kmvda2  '
                      +'  WHEN piv_nrvida = ''3'' THEN piv_kmvda3  '
                      +'  WHEN piv_nrvida = ''4'' THEN piv_kmvda4  '
                      +'  WHEN piv_nrvida = ''5'' THEN piv_kmvda5  '
                      +'  WHEN piv_nrvida = ''6'' THEN piv_kmvda6  '
                      +'  WHEN piv_nrvida = ''7'' THEN piv_kmvda7  '
                      +'  WHEN piv_nrvida = ''8'' THEN piv_kmvda8  '
                      +'  WHEN piv_nrvida = ''9'' THEN piv_kmvda9 '
                      +'END <= vat_kmatu '
                      +cQry
                      +'order by TIPO,placa, detalhe ' ;
sqlMntVei.open;
cliMntVei.active := True;



end;

initialization
  RegisterClass(TfrmMonitor);

end.
