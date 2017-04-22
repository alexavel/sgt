unit U_Abertura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ImgList, ToolWin, Grids, DBGrids, DB, ExtCtrls, StdCtrls,
  DBCtrls, Vcl.Imaging.jpeg, U_ClasseUtil, SqlExpr, Vcl.Mask, edittuning, ZDataset,
  System.ImageList;

type
  TfrmAbertura = class(TForm)
    img_List_Usu: TImageList;
    Panel1: TPanel;
    Label1: TLabel;
    Banner: TPanel;
    Image1: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    abt_codcxa: TButtonedEdit;
    edNomCxa: TEdit;
    btnAbrir: TButton;
    btnFecha: TButton;
    btnSair: TButton;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    abt_vlrCre: TMaskEdit;
    cre: TLabel;
    pSaldoIni: TPanel;
    pTotCred: TPanel;
    pTraCred: TPanel;
    pTotDeb: TPanel;
    pTraDeb: TPanel;
    pSaldoFin: TPanel;
    Label8: TLabel;
    pAbertura: TPanel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure RefreshGrid;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure abt_codcxaExit(Sender: TObject);
    procedure abt_codcxaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure abt_codcxaRightButtonClick(Sender: TObject);
    Procedure ChkCaixa;
    Function GravaCxa(nMod:Integer):Boolean;
    procedure btnAbrirClick(Sender: TObject);
    procedure btnFechaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure abt_vlrCreKeyPress(Sender: TObject; var Key: Char);
    Procedure atualizagets;
    procedure atualizasaldo;
    procedure abt_vlrCreExit(Sender: TObject);
    Procedure RefreshGridCxa;
    procedure RefreshGridMovCxa;
    Procedure MovCaixa;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    acampo: integer;
    aberto: Boolean;
    nRecno: Integer;
    codabt: String;
    { Public declarations }
  end;

var
  frmAbertura: TfrmAbertura;
  modConsulta : integer;
  Util: TClasseUtil;
  vcred: Double;


implementation

uses u_DmEmp, UCalculadora,  uSistema, U_funcao, u_classCons;

{$R *.dfm}

procedure TfrmAbertura.abt_codcxaExit(Sender: TObject);
Var
Pesquisa : TClasConsulta;
begin
  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqlcaixa ;
  EdNomCxa.Text   :=  Pesquisa.Relacao('caixa',abt_codcxa,'cxa_codcxa','cxa_nome');
  if (Not btnSair.MouseInClient) and (Not DBGrid1.MouseInClient) then Begin

      if ( abt_codcxa.text <> '') and U_funcao.ChkCaixa(abt_codcxa.Text ) then Begin
         ChkCaixa;
      End Else Begin
         atualizagets;
      End;

  End;


end;

procedure TfrmAbertura.abt_codcxaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Try
  case key of
      VK_END:
        abt_codcxaRightButtonClick(Self);
    end;
  Finally

  End;


end;

procedure TfrmAbertura.abt_codcxaRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dscaixa ;
  Pesquisa.sqlTabela :=  dmEmp.sqlcaixa ;
  Pesquisa.cliTabela :=  dmEmp.clicaixa ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Caixas';
  Pesquisa.nmTabela  := 'caixa' ;
  Pesquisa.NovoCad   := 'caixa' ;
  // Display        campo   cabecalho           get         tan  indices
  Pesquisa.AddReg('cxa_codcxa','Código'       ,'abt_codcxa' ,5  ,'por Código' );
  Pesquisa.AddReg('cxa_nome'  ,'Nome do Caixa','EdNomCxa'   ,30 ,'por Nome do Caixa' );

  Pesquisa.acessa(abt_codcxa);
  abt_codcxa.text   :=  Pesquisa.RecReg('cxa_codcxa');
  edNomCxa.text     :=  Pesquisa.RecReg('cxa_nome');
  Pesquisa.Destroy  ;
  if ( abt_codcxa.text <> '') and U_funcao.ChkCaixa(abt_codcxa.Text ) then Begin
     ChkCaixa;
  End Else Begin
     atualizagets;
  End;
  if abt_vlrcre.Enabled = True then
     abt_vlrcre.setfocus;

end;

procedure TfrmAbertura.abt_vlrCreExit(Sender: TObject);
begin
  atualizasaldo;
end;

procedure TfrmAbertura.abt_vlrCreKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  MoedaKeyEdit( Key, abt_vlrCre );
  Key := #0 ;
end;

procedure TfrmAbertura.atualizagets;
begin
  if (Components[i].ClassType = TMaskEdit ) and
     ( pos('vlr', LowerCase( TMaskEdit(Components[i]).Name)) > 0 ) then  Begin
     if TMaskEdit(Components[i]).Text = '' then Begin
         TMaskEdit(Components[i]).Text := FormatCurr('R$ ###,###,##0.00', 0 );
     End Else Begin
         TMaskEdit(Components[i]).Text := FormatCurr('R$ ###,###,##0.00', StrToFloat( TMaskEdit(Components[i]).Text ) );
     End;
  End;
  btnFecha.Enabled  := False;
  btnAbrir.Enabled  := False;
  abt_vlrcre.Clear    ;
  abt_vlrcre.Enabled  := False;
  abt_codcxa.Clear ;
  abt_codcxa.SetFocus ;
  edNomCxa.Clear ;


end;

procedure TfrmAbertura.atualizasaldo;
Var
  SQLQ : TZQuery ;
begin
    if abt_codcxa.Text = '' then
       abt_codcxa.Text := ' ';

        SQLQ := TZQuery.Create(self);
        with SQLQ do
           begin
             Close;
             Connection:= dmEmp.SqlConEmp;
             Sql.Text:=' Select abt_codabt, abt_codcxa, abt_databt, abt_datfch, abt_vlrIni, abt_vlrfin, abt_vlrCre  '+
                          ' from  '+U_funcao.SelSchema('abertura')+' '+
                          ' Where abt_codabt = (Select  max(abt_codabt) from  '+U_funcao.SelSchema('abertura')+'  Where abt_codcxa = ' +QuotedStr(abt_codcxa.Text)+')';
             Active := True;
             Open;
           end;

      if Not SQLQ.IsEmpty then Begin
          pSaldoIni.Caption   := FormatCurr('R$ ###,###,##0.00 ', fIIF(modConsulta = 0,SQLQ.FieldByName('abt_vlrIni').AsFloat,SQLQ.FieldByName('abt_vlrfin').AsFloat )) ;
          pAbertura.Caption   := FormatCurr('R$ ###,###,##0.00 ', fIIF(modConsulta = 0,SQLQ.FieldByName('abt_vlrCre').AsFloat,  FormataNum( abt_vlrCre.Text) ) ) ;
          pTotCred.Caption    := FormatCurr('R$ ###,###,##0.00 ', 0 ) ;
          pTraCred.Caption    := FormatCurr('R$ ###,###,##0.00 ', 0 ) ;
          pTotDeb.Caption     := FormatCurr('R$ ###,###,##0.00 ', 0 ) ;
          pTraDeb.Caption     := FormatCurr('R$ ###,###,##0.00 ', 0 ) ;
          pSaldoFin.Caption   := FormatCurr('R$ ###,###,##0.00 ', fIIF(modConsulta = 0,SQLQ.FieldByName('abt_vlrFin').AsFloat, SQLQ.FieldByName('abt_vlrfin').AsFloat + FormataNum( abt_vlrCre.Text)) );
          codabt              := SQLQ.FieldByName('abt_codabt').text;
      End Else Begin
          pSaldoIni.Caption   := FormatCurr('R$ ###,###,##0.00 ', 0 ) ;
          pAbertura.Caption   := FormatCurr('R$ ###,###,##0.00 ', FormataNum( abt_vlrCre.Text) ) ;
          pTotCred.Caption    := FormatCurr('R$ ###,###,##0.00 ', 0 ) ;
          pTraCred.Caption    := FormatCurr('R$ ###,###,##0.00 ', 0 ) ;
          pTotDeb.Caption     := FormatCurr('R$ ###,###,##0.00 ', 0 ) ;
          pTraDeb.Caption     := FormatCurr('R$ ###,###,##0.00 ', 0 ) ;
          pSaldoFin.Caption   := FormatCurr('R$ ###,###,##0.00 ', FormataNum( abt_vlrCre.Text) ) ;
      End;



end;

procedure TfrmAbertura.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmAbertura:= nil ;
  action := cafree;
end;

procedure TfrmAbertura.FormCreate(Sender: TObject);
begin
  dmEmp.sqlabertura.Close;
  // RefreshGrid();
end;



procedure TfrmAbertura.FormResize(Sender: TObject);
begin
    aberto := True;
//    ShowMessage('oi')

end;

procedure TfrmAbertura.FormShow(Sender: TObject);
begin
  Util:= TClasseUtil.Create;
  // Cor do banner
  Banner.ParentBackGround := False;
  Banner.ParentColor      := False;
  Banner.Brush.Color      := u_funcao.Bronze_Escuro ;

  // Titulos do Banner
  lbCabeca01.Caption    := 'Abertura de Caixas';
  lbCabeca02.Caption    := u_funcao.nmSistema ;
  // Cores - Titulos do Banner
  lbCabeca01.Font.Color := u_funcao.clTit_BCad ;
  lbCabeca02.Font.Color := u_funcao.clTit_BCad ;

//  dm.tbabertura.Active := True;
//  dm.dsabertura.DataSet.Open;
//  dmEmp.sqlabertura.Active := true;

btnAbrir.Enabled := False;
btnFecha.Enabled := False;
atualizagets;
RefreshGridCxa;

end;

function TfrmAbertura.GravaCxa(nMod:Integer): Boolean;
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, ctbs_horalt,cCodSql, cIteSql,cValSql, cSqlTmp : string ;
dData, dtbs_datalt : TDate ;
i, tmp: Integer;
SQLQ : TZQuery ;
begin

  cUsu    :=  sysUsuario;
  dData   :=  date ;
  cHora   :=  TimeToStr(time) ;

  if nMod = 1 then begin
    SQLQ := TZQuery.Create(self);
    with SQLQ do
       begin
         Close;
         Connection:= dmEmp.SqlConEmp;
         sql.Text   :=' Select abt_vlrfin, max(abt_datfch) as datfec '+
                      ' from '+U_funcao.SelSchema('abertura')+' ' +
                      ' Where abt_datfch is not null ' +
                      '  And abt_codcxa = ' +QuotedStr(abt_codcxa.Text)+' ' +
                      '  group by abt_vlrfin ';
         Active := True;
         Open;
       end;
      if SQLQ.IsEmpty then Begin
         vcred := 0 ;
      End Else Begin
        if SQLQ.FieldByName('abt_vlrfin').AsFloat > 0 then Begin
           vcred := SQLQ.FieldByName('abt_vlrfin').AsFloat ;
        End Else Begin
           vcred := 0 + FormataNum( abt_vlrcre.text );
        End;

      End;
  end;


  msFoto01 := TMemoryStream.Create;
  Memo1.Text := '';
  dmEmp.Transacao.TransactionID := 1;
  dmEmp.SqlConEmp.StartTransaction;//(dmEmp.Transacao);


  // Faz a Abertura do Caixa
  dmEmp.sqlAbertura.Close;
  if nMod = 1 then begin
    cCodSql:= 'Insert Into '+U_funcao.SelSchema('abertura')+' ( abt_codcxa, abt_vlrcre, abt_vlrini, abt_vlrfin, abt_databt, abt_usuinc,  abt_datinc,  abt_horinc  ) values ( '+
                                     ':codcxa,    :vlrcre,    :vlrini,    :vlrfin,    :databt,    :Usuario,    :data,       :hora      )';
  end Else Begin
    cCodSql:= 'update '+U_funcao.SelSchema('abertura')+' set abt_datfch = :datfch, abt_usualt = :Usuario,  abt_datalt = :Data,  abt_horalt = :Hora Where abt_codabt = '+ codabt
  End;
  dmEmp.sqlAbertura.SQL.Text := cCodSql ;
  if nMod = 1 then begin
       dmEmp.sqlAbertura.ParamByName('codcxa').Text     := abt_codcxa.Text ;
       dmEmp.sqlAbertura.ParamByName('databt').AsDate   := Now ;
       dmEmp.sqlAbertura.ParamByName('vlrcre').AsFloat  := FormataNum( abt_vlrcre.text ) ;
       dmEmp.sqlAbertura.ParamByName('vlrini').AsFloat  := FormataNum( pSaldoIni.Caption )  ;
       dmEmp.sqlAbertura.ParamByName('vlrfin').AsFloat  := FormataNum( pSaldoFin.Caption ) ;
  End Else Begin
       dmEmp.sqlAbertura.ParamByName('datFch').AsDate:=  Now ;
  end;
  dmEmp.sqlAbertura.ParamByName('Usuario').Text  :=  cUsu ;
  dmEmp.sqlAbertura.ParamByName('Data').AsDate   :=  Now ;
  dmEmp.sqlAbertura.ParamByName('Hora').Text     :=  cHora ;

   if nMod = 1 then begin
      // Credita a Conta
      dmEmp.sqlCcorrente.Close;
      cCodSql:= 'update '+U_funcao.SelSchema('Ccorrente')+' set cct_vlrsal = cct_vlrsal + :saldoabr Where cct_codcxa = '+ QuotedStr( abt_codcxa.Text );

      dmEmp.sqlCcorrente.SQL.Text := cCodSql ;
      dmEmp.sqlCcorrente.ParamByName('saldoabr').AsFloat  := FormataNum( abt_vlrcre.text ) ;
      dmEmp.sqlCcorrente.ExecSQL;
   end;


  Try
    dmEmp.sqlAbertura.ExecSQL;
    atualizasaldo;
    MovCaixa ;
    dmEmp.SqlConEmp.Commit;//(dmEmp.Transacao);
//    dmEmp.cliAbertura.ApplyUpdates(0);


    atualizagets;
    atualizasaldo;

    if nMod = 1 then begin
      Auditor(Screen.activeform.Caption,'Abriu Caixa','Cxa: '+abt_codcxa.text );
      ShowMessage('Caixa Aberto Com Sucesso');
    end else begin
      Auditor(Screen.activeform.Caption,'Fechou Caixa','Cxa: '+abt_codcxa.text );
      ShowMessage('Caixa Fechado Com Sucesso');
    end;

  except
     on Exc:Exception do
         begin
           ShowMessage('Ocorreu um erro na tentantiva de alterar os registro: ' + Exc.Message);
           dmEmp.SqlConEmp.Rollback;//(dmEmp.Transacao);
      end;
  End;

  RefreshGridCxa;

end;

procedure TfrmAbertura.MovCaixa;
Var
cCodSql : String;
begin
  dmEmp.sqlMovCxa.Close;
  cCodSql:= 'Insert Into '+U_funcao.SelSchema('movcxa')+' (	mvc_codcxa,	mvc_codabt, ' +
                                  ' mvc_codbco, mvc_agencia,' +
                                  ' mvc_conta,  mvc_tipo,  	mvc_parcel, mvc_Datlan, mvc_DatEmi,' +
                                  ' mvc_DatPag, mvc_numdoc, mvc_tipdoc, mvc_vlrApg, mvc_vlrPgo, ' +
                                  ' mvc_SalAnt, mvc_SalAtu, mvc_codcon, mvc_tipfin, mvc_HisFnc, ' +
                                  ' mvc_descri, mvc_UsuInc, mvc_DatInc, mvc_HorInc )' +
                                  ' Values ' +
                                  '(:mvc_codcxa, :mvc_codabt,  ' +
                                  ' :mvc_codbco, :mvc_agencia, ' +
                                  ' :mvc_conta,  :mvc_tipo,  	:mvc_parcel, :mvc_Datlan, :mvc_DatEmi, ' +
                                  ' :mvc_DatPag, :mvc_numdoc, :mvc_tipdoc, :mvc_vlrApg, :mvc_vlrPgo, ' +
                                  ' :mvc_SalAnt, :mvc_SalAtu, :mvc_codcon, :mvc_tipfin, :mvc_HisFnc, ' +
                                  ' :mvc_descri, :UsuInc, :DatInc, :HorInc ) ';
  dmEmp.sqlMovCxa.Sql.Text := cCodSql ;
  dmEmp.sqlMovCxa.ParamByName('mvc_codcxa').Text    := abt_codcxa.Text ;
  dmEmp.sqlMovCxa.ParamByName('mvc_codabt').Text    := codabt;
  dmEmp.sqlMovCxa.ParamByName('mvc_codbco').Text    := U_funcao.PgDadosBanco(abt_codcxa.Text,'codban');
  dmEmp.sqlMovCxa.ParamByName('mvc_agencia').Text   := U_funcao.PgDadosBanco(abt_codcxa.Text,'agencia');
  dmEmp.sqlMovCxa.ParamByName('mvc_conta').Text     := U_funcao.PgDadosBanco(abt_codcxa.Text,'conta');
  dmEmp.sqlMovCxa.ParamByName('mvc_tipo').Text      := fIIF(modConsulta = 1,'ABT','FCH');
  dmEmp.sqlMovCxa.ParamByName('mvc_parcel').Text    := '1/1';
  dmEmp.sqlMovCxa.ParamByName('mvc_Datlan').AsDate  := Now;
  dmEmp.sqlMovCxa.ParamByName('mvc_DatEmi').AsDate  := Now;
  dmEmp.sqlMovCxa.ParamByName('mvc_DatPag').AsDate  := Now;
  dmEmp.sqlMovCxa.ParamByName('mvc_numdoc').Text    := codabt;
  dmEmp.sqlMovCxa.ParamByName('mvc_tipdoc').Text    := fIIF(modConsulta = 1, 'Aberura','Fechamento');
  dmEmp.sqlMovCxa.ParamByName('mvc_vlrApg').AsFloat := fIIF(modConsulta = 1, FormataNum( abt_vlrcre.text ),0);
  dmEmp.sqlMovCxa.ParamByName('mvc_vlrPgo').AsFloat := fIIF(modConsulta = 1, FormataNum( abt_vlrcre.text ),0);
  dmEmp.sqlMovCxa.ParamByName('mvc_SalAnt').AsFloat := U_funcao.PgSaldo(codabt, abt_codcxa.Text,1) ;
  dmEmp.sqlMovCxa.ParamByName('mvc_SalAtu').AsFloat := U_funcao.PgSaldo(codabt, abt_codcxa.Text,1)+fIIF(modConsulta = 1, FormataNum( abt_vlrcre.text ),0) ;
  dmEmp.sqlMovCxa.ParamByName('mvc_codcon').Text    := '';
  dmEmp.sqlMovCxa.ParamByName('mvc_tipfin').Text    := fIIF(modConsulta = 1,'ABT','FCH');
  dmEmp.sqlMovCxa.ParamByName('mvc_HisFnc').Text    := 'ABERTURA DE CAIXA '+abt_codcxa.Text;
  dmEmp.sqlMovCxa.ParamByName('mvc_descri').Text    := 'ABERTURA DE CAIXA '+abt_codcxa.Text;
  dmEmp.sqlMovCxa.ParamByName('UsuInc').Text        := sysUsuario;
  dmEmp.sqlMovCxa.ParamByName('DatInc').AsDate      := Now;
  dmEmp.sqlMovCxa.ParamByName('HorInc').Text        := TimeToStr(time);
  dmEmp.sqlMovCxa.ExecSQL;

end;

procedure TfrmAbertura.RefreshGrid;
begin
 dmEmp.sqlabertura.Close;
 dmEmp.cliabertura.Close ;

 with dmEmp.sqlabertura do
   begin
     sql.Text :='SELECT * FROM '+U_funcao.SelSchema('abertura')+' order by abt_codabt ';
     Open;
 end;
 dmEmp.cliabertura.Active := True;
end;

procedure TfrmAbertura.RefreshGridCxa;
begin
 dmEmp.sqlAbertura.Close;
 dmEmp.cliAbertura.Close ;

 with dmEmp.sqlAbertura do
   begin
     Sql.Text :='SELECT * FROM '+U_funcao.SelSchema('abertura')+' Where abt_datfch is null order by abt_codcxa';
     Open;
 end;
 dmEmp.cliAbertura.Active := True;
 RefreshGridMovCxa;
end;

procedure TfrmAbertura.RefreshGridMovCxa;
Var
mCodAbt : String;
begin
 mCodAbt := '0';
 if DBGrid1.DataSource.DataSet.FieldByName('abt_codabt').Text <> '' then
    mCodAbt := DBGrid1.DataSource.DataSet.FieldByName('abt_codabt').Text;

 dmEmp.sqlMovCxa.Close;
 dmEmp.cliMovCxa.Close ;

 with dmEmp.sqlMovCxa do
   begin
     Sql.Text :=' SELECT * FROM '+U_funcao.SelSchema('movcxa')+' Where mvc_codcxa = ' +QuotedStr(DBGrid1.DataSource.DataSet.FieldByName('abt_codcxa').Text)+' ' +
                   '                        and mvc_codabt = '+mCodAbt+' '+
                   '    order by mvc_codmvc ';
     Open;
 end;
 dmEmp.cliMovCxa.Active := True;
end;


procedure TfrmAbertura.btnAbrirClick(Sender: TObject);
begin
 GravaCxa(1);
end;

procedure TfrmAbertura.btnFechaClick(Sender: TObject);
begin
   GravaCxa(0);
end;

procedure TfrmAbertura.btnSairClick(Sender: TObject);
begin
  dmEmp.sqlabertura.Close;
  dmEmp.cliabertura.Active          := False;
  dmEmp.dspabertura.DataSet.Active  := False;
  Close;

end;


procedure TfrmAbertura.ChkCaixa;
Var
SQLQ : TZQuery ;
begin
    SQLQ := TZQuery.Create(self);
    with SQLQ do
       begin
         Close;
         Connection:= dmEmp.SqlConEmp;
         SQl.Text:='SELECT * from '+U_funcao.SelSchema('abertura')+' where abt_codcxa = '+QuotedStr(abt_codcxa.Text)+' and abt_databt is not null and abt_datfch is null ';
         Active := True;
         Open;
       end;
    if Not SQLQ.IsEmpty then Begin
        btnFecha.Enabled    := True;
        btnAbrir.Enabled    := False;
        abt_vlrcre.text     := FormatCurr('R$ ###,###,##0.00', SQLQ.FieldByName('abt_vlrcre').asFloat ) ;
        abt_vlrcre.Enabled  := False;
        codabt := SQLQ.FieldByName('abt_codabt').Text ;
        modConsulta := 0;
    end else begin
        btnFecha.Enabled    := False;
        btnAbrir.Enabled    := True;
        abt_vlrcre.Enabled  := True;
        modConsulta := 1;
    End;
    atualizasaldo
end;

procedure TfrmAbertura.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
RefreshGridMovCxa;
end;

procedure TfrmAbertura.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
RefreshGridMovCxa;
end;

procedure TfrmAbertura.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
RefreshGridMovCxa;
end;

end.
