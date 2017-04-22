unit U_AbrCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, ImgList, ExtCtrls, ComCtrls, xmldom,
  XMLIntf, IdHTTP, msxmldom, XMLDoc, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, ExtDlgs, RibbonLunaStyleActnCtrls,
  ToolWin, ActnMan, ActnCtrls, jpeg, edittuning, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, U_ClasseUtil,U_Classcons, ZDataset, ZDatasetUtils,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, U_ClassCad, Datasnap.DBClient,
  Datasnap.Provider, ZAbstractRODataset, ZAbstractDataset, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client ;


type
  TfrmAbrcaixa = class(TForm)
    StatusBar1: TStatusBar;
    Banner: TPanel;
    imgLogo: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edNomCxa: TEdit;
    Label7: TLabel;
    Label2: TLabel;
    btnAbr: TButton;
    btnFch: TButton;
    edSenha: TEdit;
    edCodCxa: TEdit;
    GroupBox2: TGroupBox;
    edValor: TMaskEdit;
    Label26: TLabel;
    Label3: TLabel;
    edDatIni: TEdit;
    Label4: TLabel;
    edDatFin: TEdit;
    edHorFin: TEdit;
    edHorIni: TEdit;
    edOrdem: TEdit;
    Label5: TLabel;
    edSaldoAnt: TEdit;
    Label6: TLabel;
    edSaldoAtu: TEdit;
    Label8: TLabel;
    dspMAbrCaixa: TDataSetProvider;
    cliMAbrCaixa: TClientDataSet;
    dsMAbrCaixa: TDataSource;
    Gridcaixa: TDBGrid;
    dspCxaOrd: TDataSetProvider;
    cliCxaOrd: TClientDataSet;
    dsCxaOrd: TDataSource;
    gridBaixa: TDBGrid;
    sqlCxaOrd: TFDQuery;
    sqlMAbrCaixa: TFDQuery;
    sqlCxaOrdabc_codigo: TIntegerField;
    sqlCxaOrdabc_codcxa: TIntegerField;
    sqlCxaOrdabc_codcct: TIntegerField;
    sqlCxaOrdabc_databr: TDateField;
    sqlCxaOrdabc_datfch: TDateField;
    sqlCxaOrdabc_vlrini: TBCDField;
    sqlCxaOrdabc_vlrant: TBCDField;
    sqlCxaOrdabc_vlratu: TBCDField;
    sqlCxaOrdabc_usuinc: TStringField;
    sqlCxaOrdabc_datinc: TDateField;
    sqlCxaOrdabc_horinc: TStringField;
    sqlCxaOrdabc_usualt: TStringField;
    sqlCxaOrdabc_datalt: TDateField;
    sqlCxaOrdabc_horalt: TStringField;
    sqlCxaOrdcxa_codigo: TIntegerField;
    sqlCxaOrdcxa_codcct: TIntegerField;
    sqlCxaOrdcxa_codusu: TIntegerField;
    sqlCxaOrdcxa_ativo: TStringField;
    sqlCxaOrdcxa_usuinc: TStringField;
    sqlCxaOrdcxa_datinc: TDateField;
    sqlCxaOrdcxa_horinc: TStringField;
    sqlCxaOrdcxa_usualt: TStringField;
    sqlCxaOrdcxa_datalt: TDateField;
    sqlCxaOrdcxa_horalt: TStringField;
    sqlCxaOrdcct_codigo: TIntegerField;
    sqlCxaOrdcct_codbco: TStringField;
    sqlCxaOrdcct_agencia: TStringField;
    sqlCxaOrdcct_nrconta: TStringField;
    sqlCxaOrdcct_codpcd: TStringField;
    sqlCxaOrdcct_codpcc: TStringField;
    sqlCxaOrdcct_telef1: TStringField;
    sqlCxaOrdcct_telef2: TStringField;
    sqlCxaOrdcct_celula: TStringField;
    sqlCxaOrdcct_usuinc: TStringField;
    sqlCxaOrdcct_datinc: TDateField;
    sqlCxaOrdcct_horinc: TStringField;
    sqlCxaOrdcct_usualt: TStringField;
    sqlCxaOrdcct_datalt: TDateField;
    sqlCxaOrdcct_horalt: TStringField;
    sqlCxaOrdbco_codigo: TStringField;
    sqlCxaOrdbco_nome: TStringField;
    sqlCxaOrdbco_usuinc: TStringField;
    sqlCxaOrdbco_datinc: TDateField;
    sqlCxaOrdbco_horinc: TStringField;
    sqlCxaOrdbco_usualt: TStringField;
    sqlCxaOrdbco_datalt: TDateField;
    sqlCxaOrdbco_horalt: TStringField;
    cliCxaOrdabc_codigo: TIntegerField;
    cliCxaOrdabc_codcxa: TIntegerField;
    cliCxaOrdabc_codcct: TIntegerField;
    cliCxaOrdabc_databr: TDateField;
    cliCxaOrdabc_datfch: TDateField;
    cliCxaOrdabc_vlrini: TBCDField;
    cliCxaOrdabc_vlrant: TBCDField;
    cliCxaOrdabc_vlratu: TBCDField;
    cliCxaOrdabc_usuinc: TStringField;
    cliCxaOrdabc_datinc: TDateField;
    cliCxaOrdabc_horinc: TStringField;
    cliCxaOrdabc_usualt: TStringField;
    cliCxaOrdabc_datalt: TDateField;
    cliCxaOrdabc_horalt: TStringField;
    cliCxaOrdcxa_codigo: TIntegerField;
    cliCxaOrdcxa_codcct: TIntegerField;
    cliCxaOrdcxa_codusu: TIntegerField;
    cliCxaOrdcxa_ativo: TStringField;
    cliCxaOrdcxa_usuinc: TStringField;
    cliCxaOrdcxa_datinc: TDateField;
    cliCxaOrdcxa_horinc: TStringField;
    cliCxaOrdcxa_usualt: TStringField;
    cliCxaOrdcxa_datalt: TDateField;
    cliCxaOrdcxa_horalt: TStringField;
    cliCxaOrdcct_codigo: TIntegerField;
    cliCxaOrdcct_codbco: TStringField;
    cliCxaOrdcct_agencia: TStringField;
    cliCxaOrdcct_nrconta: TStringField;
    cliCxaOrdcct_codpcd: TStringField;
    cliCxaOrdcct_codpcc: TStringField;
    cliCxaOrdcct_telef1: TStringField;
    cliCxaOrdcct_telef2: TStringField;
    cliCxaOrdcct_celula: TStringField;
    cliCxaOrdcct_usuinc: TStringField;
    cliCxaOrdcct_datinc: TDateField;
    cliCxaOrdcct_horinc: TStringField;
    cliCxaOrdcct_usualt: TStringField;
    cliCxaOrdcct_datalt: TDateField;
    cliCxaOrdcct_horalt: TStringField;
    cliCxaOrdbco_codigo: TStringField;
    cliCxaOrdbco_nome: TStringField;
    cliCxaOrdbco_usuinc: TStringField;
    cliCxaOrdbco_datinc: TDateField;
    cliCxaOrdbco_horinc: TStringField;
    cliCxaOrdbco_usualt: TStringField;
    cliCxaOrdbco_datalt: TDateField;
    cliCxaOrdbco_horalt: TStringField;
    sqlMAbrCaixaabm_codigo: TIntegerField;
    sqlMAbrCaixaabm_codabc: TIntegerField;
    sqlMAbrCaixaabm_codcxa: TIntegerField;
    sqlMAbrCaixaabm_datmov: TDateField;
    sqlMAbrCaixaabm_hormov: TStringField;
    sqlMAbrCaixaabm_tipdoc: TStringField;
    sqlMAbrCaixaabm_numdoc: TStringField;
    sqlMAbrCaixaabm_descri: TStringField;
    sqlMAbrCaixaabm_vlrlan: TBCDField;
    sqlMAbrCaixaabm_vlrant: TBCDField;
    sqlMAbrCaixaabm_vlratu: TBCDField;
    sqlMAbrCaixaabm_usuinc: TStringField;
    sqlMAbrCaixaabm_datinc: TDateField;
    sqlMAbrCaixaabm_horinc: TStringField;
    sqlMAbrCaixaabm_usualt: TStringField;
    sqlMAbrCaixaabm_datalt: TDateField;
    sqlMAbrCaixaabm_horalt: TStringField;
    cliMAbrCaixaabm_codigo: TIntegerField;
    cliMAbrCaixaabm_codabc: TIntegerField;
    cliMAbrCaixaabm_codcxa: TIntegerField;
    cliMAbrCaixaabm_datmov: TDateField;
    cliMAbrCaixaabm_hormov: TStringField;
    cliMAbrCaixaabm_tipdoc: TStringField;
    cliMAbrCaixaabm_numdoc: TStringField;
    cliMAbrCaixaabm_descri: TStringField;
    cliMAbrCaixaabm_vlrlan: TBCDField;
    cliMAbrCaixaabm_vlrant: TBCDField;
    cliMAbrCaixaabm_vlratu: TBCDField;
    cliMAbrCaixaabm_usuinc: TStringField;
    cliMAbrCaixaabm_datinc: TDateField;
    cliMAbrCaixaabm_horinc: TStringField;
    cliMAbrCaixaabm_usualt: TStringField;
    cliMAbrCaixaabm_datalt: TDateField;
    cliMAbrCaixaabm_horalt: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnFchClick(Sender: TObject);
    procedure btnAbrClick(Sender: TObject);
    procedure edCodCxaExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edValorKeyPress(Sender: TObject; var Key: Char);
    procedure limpatela;
    procedure GridBaixas;
    procedure refrescagrids;
    procedure dsCxaOrdDataChange(Sender: TObject; Field: TField);
    procedure gridBaixaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GridcaixaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    wEmpresa, wUsuInc, wHorInc, wUsuAlt, wHorAlt : string ;
    wDatInc, wDatAlt : Tdate;
    nNew, nRecno:  Integer;
  public
    acampo: integer;
    aberto, lMostra: Boolean;
    Util: TClasseUtil;
    Pesquisa : TClasConsulta;
    sqlNew    : TFDQuery;
    cQueryPad : String;
    aEdits : TArrayComp;
    cPre, cTabela: String;


    { Public declarations }
  end;

var
  frmAbrcaixa: TfrmAbrcaixa;
  modConsulta, nOrdem : integer;
  cCodUsu, cCodCct, cSqlGridMov,cSqlGridCxa  : String;
  nVlrAnt, nVlrAtu : Real;



implementation

uses  UCalculadora,  u_DmEmp, uSistema, U_funcao, U_CnpjClass;

{$R *.dfm}


procedure TfrmAbrcaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sqlNew.Close;
    dmEmp.clicaixa.Close;
    frmAbrcaixa                   := nil ;
    action                        := cafree;
    fPrincipal.btnabrcaixa.Enabled:= True;
end;



procedure TfrmAbrcaixa.FormCreate(Sender: TObject);
Var
i: Integer;
begin
  cPre                        := 'abc_';
  cTabela                     := 'abrcaixa';
  acampo                      := 1;
  sqlNew                      := TFDQuery.Create(nil);
  sqlNew.Connection           := dmEmp.SqlConSis;
  fPrincipal.btnabrcaixa.Enabled  := False;
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;

end;

procedure TfrmAbrcaixa.FormKeyPress(Sender: TObject; var Key: Char);
Begin
  //verifica se a tecla pressionada é a tecla ENTER, conhecida como #13
  If key = #13 then Begin
    //se for, passa o foco para o próximo campo, zerando o valor da variável Key
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  End Else
    If key = #27 then Begin
       Close;
       key := #0;
    End;
end;
procedure TfrmAbrcaixa.FormShow(Sender: TObject);
var
i, tmp: Integer;
Pesquisa : TClasConsulta;
begin
  cSqlGridMov := StringReplace(sqlMAbrCaixa.SQL.Text,'"99999999999999_TESTE"',nmSchemaEmp, [rfReplaceAll, rfIgnoreCase]) ;
  cSqlGridMov := StringReplace(cSqlGridMov, #$D#$A, ' ', [rfReplaceAll, rfIgnoreCase]);
  cSqlGridCxa := StringReplace(sqlCxaOrd.SQL.Text   ,'"99999999999999_TESTE"',nmSchemaEmp, [rfReplaceAll, rfIgnoreCase]) ;
  cSqlGridCxa := StringReplace(cSqlGridCxa, #$D#$A, ' ', [rfReplaceAll, rfIgnoreCase]);

  Util:= TClasseUtil.Create;
  Pesquisa := TClasConsulta.Create;

  // Cor do banner
  Banner.ParentBackGround := False;
  Banner.ParentColor      := False;
  Banner.Brush.Color      := u_funcao.Bronze_Escuro ;

  // Titulos do Banner
  lbCabeca01.Caption    := 'Abertura de Caixa';
  lbCabeca02.Caption    := u_funcao.nmSistema ;
  // Cores - Titulos do Banner
  lbCabeca01.Font.Color := u_funcao.clTit_BCad ;
  lbCabeca02.Font.Color := u_funcao.clTit_BCad ;
  limpatela;
  GridBaixas;
end;



procedure TfrmAbrcaixa.gridBaixaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    if gdFocused in State then  begin
      gridBaixa.Canvas.Brush.Color  := Azul_Escuro;
      gridBaixa.Canvas.Font.Color   := Branco;
      gridBaixa.Canvas.FillRect(Rect);
      gridBaixa.DefaultDrawDataCell(Rect, Column.Field, State);
    end else begin

      if Odd(gridBaixa.DataSource.DataSet.RecNo) then begin
        gridBaixa.Canvas.Brush.Color  := Branco;
        gridBaixa.Canvas.Font.Color   := Preto;
        gridBaixa.Canvas.FillRect(Rect);
        gridBaixa.DefaultDrawDataCell(Rect, Column.Field, State);

      End else Begin
        gridBaixa.Canvas.Brush.Color  := Cinza_Sintilante;
        gridBaixa.Canvas.Font.Color   := Preto;
        gridBaixa.Canvas.FillRect(Rect);
        gridBaixa.DefaultDrawDataCell(Rect, Column.Field, State);
      End;
    end;

end;

procedure TfrmAbrcaixa.GridBaixas;
begin
  if edOrdem.Text = '' then Begin
      Gridcaixa.Hide;
      gridBaixa.Hide;
  End Else Begin

      Gridcaixa.Show;
      cliCxaOrd.Close;
      sqlCxaOrd.Close;
      sqlCxaOrd.SQL.Text := cSqlGridCxa+' Where abc_codcxa = '+edCodCxa.Text+' Order By abc_codigo desc';
      sqlCxaOrd.Open;
      cliCxaOrd.Active := True;
      gridBaixa.Show;
      refrescagrids;
  End;

end;

procedure TfrmAbrcaixa.GridcaixaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    if gdFocused in State then  begin
      Gridcaixa.Canvas.Brush.Color  := Azul_Escuro;
      Gridcaixa.Canvas.Font.Color   := Branco;
      Gridcaixa.Canvas.FillRect(Rect);
      Gridcaixa.DefaultDrawDataCell(Rect, Column.Field, State);
    end else begin

      if Odd(Gridcaixa.DataSource.DataSet.RecNo) then begin
        Gridcaixa.Canvas.Brush.Color  := Branco;
        Gridcaixa.Canvas.Font.Color   := Preto;
        Gridcaixa.Canvas.FillRect(Rect);
        Gridcaixa.DefaultDrawDataCell(Rect, Column.Field, State);

      End else Begin
        Gridcaixa.Canvas.Brush.Color  := Cinza_Sintilante;
        Gridcaixa.Canvas.Font.Color   := Preto;
        Gridcaixa.Canvas.FillRect(Rect);
        Gridcaixa.DefaultDrawDataCell(Rect, Column.Field, State);
      End;
    end;



end;

procedure TfrmAbrcaixa.limpatela;
begin
  edCodCxa.Clear;
  edNomCxa.Clear;
  edSenha.Clear;
  edDatIni.Clear;
  edHorIni.Clear;
  edDatFin.Clear;
  edHorFin.Clear;
  edOrdem.Clear;
  edValor.Text := FormatCurr('R$ #,###,###0.00',0);
  edSaldoAnt.Text  := FormatCurr('R$ #,###,###0.00',0);
  edSaldoAtu.Text  := FormatCurr('R$ #,###,###0.00',0);

  edValor.Enabled := False;
  btnAbr.Enabled := False;
  btnfch.Enabled := False;
  edCodCxa.SetFocus;

end;

procedure TfrmAbrcaixa.refrescagrids;
begin
  if frmAbrcaixa <> nil then Begin
      gridBaixa.Show;
      cliMAbrCaixa.Close;
      sqlMAbrCaixa.Close;
      sqlMAbrCaixa.SQL.Text := cSqlGridMov+' Where abm_codabc = '+Gridcaixa.DataSource.DataSet.FieldByName('abc_codigo').Text;
      sqlMAbrCaixa.Open;
      cliMAbrCaixa.Active := True;
  End;


end;

procedure TfrmAbrcaixa.btnAbrClick(Sender: TObject);
Var
qry,qSql,qSql1,qSql2,qSql3 : TFDQuery;
nAtu: Double;

begin
    if Not ValidaUsu(cCodUsu,edSenha.Text) then Begin
       ShowMessage('Senha Invalida' );
       edSenha.SetFocus;
       Exit;
    End;



    if MESSAGEBOX(Application.Handle, 'Confirme a Abertura do Caixa?', 'Confirma...', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin
        qry   := TFDQuery.Create(Nil);
        qSql  := TFDQuery.Create(Nil);
        qSql1 := TFDQuery.Create(Nil);
        qSql2 := TFDQuery.Create(Nil);


        try
            //Inicializa a transição de dados
            IniTransacao;
            qSql2.Connection := dmemp.SqlConSis;
            qSql2.close;
            qSql2.SQL.Text := ' Select * From  '+U_funcao.SelSchema('abrcaixa')+
                                      ' LEFT Join  '+U_funcao.SelSchema('caixa')+'  on cxa_codigo = abc_codcxa '+
                                      ' LEFT Join  '+U_funcao.SelSchema('ccorrente')+'  on cct_codigo = cxa_codcct '+
                                      ' LEFT Join  '+U_funcao.SelSchema('banco')+'  on bco_codigo = cct_codbco '+
                                      ' LEFT Join  '+U_funcao.SelSchema('usuario')+'  on usu_codusu = cxa_codusu '+
                              ' where abc_codcxa = '+edCodCxa.Text+
                              ' And   abc_databr is not NULL '+
                              ' And   abc_datfch is Not NULL '+
                              ' And   abc_codigo = (Select Max(abc_codigo) From  '+U_funcao.SelSchema('abrcaixa')+
                                    ' where abc_codcxa =  '+edCodCxa.Text+
                                    ' And   abc_databr is not NULL '+
                                    ' And   abc_datfch is not NULL )';
            qSql2.Open;
            if qSql2.IsEmpty then Begin
                nAtu  := 0;
            End Else
                nAtu  := qSql2.FieldByName('abc_vlratu').AsFloat ;

            qSql.Connection := dmemp.SqlConSis;
            qSql.SQL.Text   := 'Insert Into '+U_funcao.SelSchema('abrcaixa')+
                               ' ( abc_codcxa, abc_codcct, abc_databr,  abc_vlrini,  abc_vlrAnt,  abc_vlrAtu,  abc_usuinc,  abc_datinc,  abc_horinc ) Values ' +
                               ' ( :abc_codcxa, :abc_codcct, :abc_databr, :abc_vlrini, :abc_vlrAnt, :abc_vlrAtu,  :abc_usuinc, :abc_datinc, :abc_horinc ) ';
            qSql.ParamByName('abc_codcxa').AsInteger:= StrToInt( edCodCxa.Text );
            qSql.ParamByName('abc_codcct').AsInteger:= StrToInt( cCodCct ) ;
            qSql.ParamByName('abc_databr').AsDate   := Now;
            qSql.ParamByName('abc_vlrini').AsFloat  := FormataNum( edValor.text );
            qSql.ParamByName('abc_vlrant').AsFloat  := nAtu;
            qSql.ParamByName('abc_vlratu').AsFloat  := ( FormataNum( edSaldoAtu.text) + FormataNum(edValor.text) ) ;
            qSql.ParamByName('abc_usuinc').Text     :=  sysUsuario;
            qSql.ParamByName('abc_datinc').AsDate   := Now;
            qSql.ParamByName('abc_horinc').Text     := TimeToStr(Now);
            qSql.ExecSQL;


            //Pega a Abertura de Caixa registrada
            qSql2.Connection := dmemp.SqlConSis;
            qSql2.close;
            qSql2.SQL.Text := ' Select * From  '+U_funcao.SelSchema('abrcaixa')+
                                        ' LEFT Join  '+U_funcao.SelSchema('caixa')+'  on cxa_codigo = abc_codcxa '+
                                        ' LEFT Join  '+U_funcao.SelSchema('ccorrente')+'  on cct_codigo = cxa_codcct '+
                                        ' LEFT Join  '+U_funcao.SelSchema('banco')+'  on bco_codigo = cct_codbco '+
                                        ' LEFT Join  '+U_funcao.SelSchema('usuario')+'  on usu_codusu = cxa_codusu '+
                                ' where abc_codcxa = '+edCodCxa.Text+
                                ' And   abc_databr is not NULL '+
                                ' And   abc_datfch is NULL ';
            qSql2.Open;


            // fazendo abertura de Caixa e enviando Valores para o Caixa
            qSql1.Connection := dmemp.SqlConSis;
            qSql1.SQL.Text   := 'Insert Into '+U_funcao.SelSchema('abrcxamov')+
                                            '( abm_codabc, abm_codcxa, abm_datmov, abm_hormov, abm_tipdoc, abm_descri, '+
                                            ' abm_vlrlan, abm_vlrant, abm_vlratu, abm_usuinc, abm_datinc, abm_horinc, abm_usualt, abm_datalt, abm_horalt ) Values  '+
                                            '( :abm_codabc, :abm_codcxa, :abm_datmov, :abm_hormov, :abm_tipdoc, :abm_descri, '+
                                            ' :abm_vlrlan, :abm_vlrant, :abm_vlratu, :abm_usuinc, :abm_datinc, :abm_horinc, :abm_usualt, :abm_datalt, :abm_horalt ) ';
            qSql1.ParamByName('abm_codabc').AsInteger:= qSql2.FieldByName('abc_codigo').AsInteger;
            qSql1.ParamByName('abm_codcxa').AsInteger:= qSql2.FieldByName('abc_codcxa').AsInteger;
            qSql1.ParamByName('abm_datmov').AsDate   := Now;
            qSql1.ParamByName('abm_hormov').Text     := TimeToStr(Now);
            qSql1.ParamByName('abm_tipdoc').Text     := 'A';
            qSql1.ParamByName('abm_descri').Text     := 'ABERTURA DE CAIXA';
            qSql1.ParamByName('abm_vlrlan').AsFloat  := 0;
            qSql1.ParamByName('abm_vlrant').AsFloat  := qSql2.FieldByName('abc_vlrant').AsFloat ;
            qSql1.ParamByName('abm_vlratu').AsFloat  := qSql2.FieldByName('abc_vlrant').AsFloat ;
            qSql1.ParamByName('abm_usuinc').Text     := TimeToStr(Now);
            qSql1.ParamByName('abm_UsuAlt').Text     :=  sysUsuario;
            qSql1.ParamByName('abm_DatAlt').AsDate   := Now;
            qSql1.ParamByName('abm_HorAlt').Text     := TimeToStr(Now);
            qSql1.ParamByName('abm_codcxa').AsInteger:= StrToInt( edCodCxa.Text );
            qSql1.ParamByName('abm_usuinc').Text     :=  sysUsuario;
            qSql1.ParamByName('abm_datinc').AsDate   := Now;
            qSql1.ParamByName('abm_horinc').Text     := TimeToStr(Now);
            qSql1.ExecSQL;

            // Se ouver lançamento de caixa
            if RetMoeda(edValor.text) > 0 then begin
                qSql1.Connection := dmemp.SqlConSis;
                qSql1.SQL.Text   := 'Insert Into '+U_funcao.SelSchema('abrcxamov')+
                                                '( abm_codabc, abm_codcxa, abm_datmov, abm_hormov, abm_tipdoc, abm_descri, '+
                                                ' abm_vlrlan, abm_vlrant, abm_vlratu, abm_usuinc, abm_datinc, abm_horinc, abm_usualt, abm_datalt, abm_horalt ) Values  '+
                                                '( :abm_codabc, :abm_codcxa, :abm_datmov, :abm_hormov, :abm_tipdoc, :abm_descri, '+
                                                ' :abm_vlrlan, :abm_vlrant, :abm_vlratu, :abm_usuinc, :abm_datinc, :abm_horinc, :abm_usualt, :abm_datalt, :abm_horalt ) ';
                qSql1.ParamByName('abm_codabc').AsInteger:= qSql2.FieldByName('abc_codigo').AsInteger;
                qSql1.ParamByName('abm_codcxa').AsInteger:= qSql2.FieldByName('abc_codcxa').AsInteger;
                qSql1.ParamByName('abm_datmov').AsDate   := Now;
                qSql1.ParamByName('abm_hormov').Text     := TimeToStr(Now);
                qSql1.ParamByName('abm_tipdoc').Text     := 'C';
                qSql1.ParamByName('abm_descri').Text     := 'LANÇAMENTO DE ABERTURA';
                qSql1.ParamByName('abm_vlrlan').AsFloat  := FormataNum(edValor.text);
                qSql1.ParamByName('abm_vlrant').AsFloat  := qSql2.FieldByName('abc_vlrant').AsFloat;
                qSql1.ParamByName('abm_vlratu').AsFloat  := qSql2.FieldByName('abc_vlrant').AsFloat + FormataNum(edValor.text);
                qSql1.ParamByName('abm_usuinc').Text     := TimeToStr(Now);
                qSql1.ParamByName('abm_UsuAlt').Text     :=  sysUsuario;
                qSql1.ParamByName('abm_DatAlt').AsDate   := Now;
                qSql1.ParamByName('abm_HorAlt').Text     := TimeToStr(Now);
                qSql1.ParamByName('abm_codcxa').AsInteger:= StrToInt( edCodCxa.Text );
                qSql1.ParamByName('abm_usuinc').Text     :=  sysUsuario;
                qSql1.ParamByName('abm_datinc').AsDate   := Now;
                qSql1.ParamByName('abm_horinc').Text     := TimeToStr(Now);
                qSql1.ExecSQL;


            end;


            FimTransacao;

      except
            RollBack;
            ShowMessage('Ocorreu um erro na tentantiva de alterar os registro: ' );
            Exit;
      End;
      GridBaixas;

        {

            NumDoc // Numero do Documento
            codant // Codigo Anterior para Dividas parceladas
            codcxa // Codigo do Caixa
            codabc // Codigo de abertura de caixa
            codcct // Codigo da Conta Corrente
            codfpg // Codigo Forma de Pagamento
            codfnd // Codigo do Fornecedor
            codpss // Codigo de Pessoal
            codcli // Codigo de Clientes
            codpct // Plano de Conta
            descri // Descrição da conta
            DatEms // Data de Emissao
            DatPag // Data de Pagamento
            DatVen // Data Vencimento
            NumPar // Numero da Parcela
            TotPar // Total de Parcelas
            TipDoc // D Débito C Credito
            Status // Situação se esta em caixa ou se foi liqquidado
            tippro // Tipo de Documento - Se é compra, venda, transferencia, saida de cauxa
            period // Se vai ser uma conta periódica
            vlrApg // Valor a Pagar
            vlrPag // Valor Pago
            vlrDes // Valor do Desconto
            vlrAcr // Valor do Acrescimo
            vlrTot // Valor total do documento
            UsuInc
            DatInc
            HorInc
            UsuAlt
            DatAlt
            HorAlt
        }
        btnAbr.Enabled := False;
        btnfch.Enabled := True;
    end else begin
      edCodCxa.Clear;
      edNomCxa.Clear;
      edSenha.Clear;
    end;
    edSenha.Clear;
    edCodCxaExit(Nil);





end;

procedure TfrmAbrcaixa.btnFchClick(Sender: TObject);
Var
qSql, qSql1,qSql2 : TFDQuery;
begin
    if Not ValidaUsu(cCodUsu,edSenha.Text) then Begin
         ShowMessage('Senha Invalida' );
         edSenha.SetFocus;
         Exit;
      End;

    if MESSAGEBOX(Application.Handle, 'Confirme o Fechamento do Caixa?', 'Confirma...', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin

        try

            qSql := TFDQuery.Create(Nil);
            qSql1:= TFDQuery.Create(Nil);
            qSql2:= TFDQuery.Create(Nil);

            //Pega a Abertura de Caixa registrada
            qSql2.Connection := dmemp.SqlConSis;
            qSql2.SQL.Text := ' Select * From  '+U_funcao.SelSchema('abrcaixa')+
                                        ' LEFT Join  '+U_funcao.SelSchema('caixa')+'  on cxa_codigo = abc_codcxa '+
                                        ' LEFT Join  '+U_funcao.SelSchema('ccorrente')+'  on cct_codigo = cxa_codcct '+
                                        ' LEFT Join  '+U_funcao.SelSchema('banco')+'  on bco_codigo = cct_codbco '+
                                        ' LEFT Join  '+U_funcao.SelSchema('usuario')+'  on usu_codusu = cxa_codusu '+
                                ' where abc_codcxa = '+edCodCxa.Text+
                                ' And   abc_databr is not NULL '+
                                ' And   abc_datfch is NULL ';
            qSql2.Open;

            IniTransacao;
            qSql.Connection := dmemp.SqlConSis;
            qSql.SQL.Text   := 'update '+U_funcao.SelSchema('abrcaixa')+
                               ' Set  abc_datfch = :abc_datfch,  abc_usualt = :abc_usualt,  abc_datalt = :abc_datalt,  abc_horalt = :abc_horalt '+
                               ' where abc_codigo = '+edOrdem.Text;
            //qSql.ParamByName('abc_vlratu').AsFloat:= RetMoeda(edValor.text) ;
            qSql.ParamByName('abc_datfch').AsDate := Now;
            qSql.ParamByName('abc_usualt').Text   :=  sysUsuario;
            qSql.ParamByName('abc_datalt').AsDate := Now;
            qSql.ParamByName('abc_horalt').Text   := TimeToStr(Now);
            qSql.ExecSQL;

            // fazendo abertura de Caixa e enviando Valores para o Caixa
            qSql1.Connection := dmemp.SqlConSis;
            qSql1.SQL.Text   := 'Insert Into '+U_funcao.SelSchema('abrcxamov')+
                                            '( abm_codabc, abm_codcxa, abm_datmov, abm_hormov, abm_tipdoc, abm_descri, '+
                                            ' abm_vlrlan, abm_vlrant, abm_vlratu, abm_usuinc, abm_datinc, abm_horinc, abm_usualt, abm_datalt, abm_horalt ) Values  '+
                                            '( :abm_codabc, :abm_codcxa, :abm_datmov, :abm_hormov, :abm_tipdoc, :abm_descri, '+
                                            ' :abm_vlrlan, :abm_vlrant, :abm_vlratu, :abm_usuinc, :abm_datinc, :abm_horinc, :abm_usualt, :abm_datalt, :abm_horalt ) ';
            qSql1.ParamByName('abm_codabc').AsInteger:= qSql2.FieldByName('abc_codigo').AsInteger;
            qSql1.ParamByName('abm_codcxa').AsInteger:= qSql2.FieldByName('abc_codcxa').AsInteger;
            qSql1.ParamByName('abm_datmov').AsDate   := Now;
            qSql1.ParamByName('abm_hormov').Text     := TimeToStr(Now);
            qSql1.ParamByName('abm_tipdoc').Text     := 'F';
            qSql1.ParamByName('abm_descri').Text     := 'FECHAMENTO DE CAIXA';
            qSql1.ParamByName('abm_vlrlan').AsFloat  := 0;
            qSql1.ParamByName('abm_vlrant').AsFloat  := qSql2.FieldByName('abc_vlratu').AsFloat;
            qSql1.ParamByName('abm_vlratu').AsFloat  := qSql2.FieldByName('abc_vlratu').AsFloat;
            qSql1.ParamByName('abm_usuinc').Text     := TimeToStr(Now);
            qSql1.ParamByName('abm_UsuAlt').Text     :=  sysUsuario;
            qSql1.ParamByName('abm_DatAlt').AsDate   := Now;
            qSql1.ParamByName('abm_HorAlt').Text     := TimeToStr(Now);
            qSql1.ParamByName('abm_codcxa').AsInteger:= StrToInt( edCodCxa.Text );
            qSql1.ParamByName('abm_usuinc').Text     :=  sysUsuario;
            qSql1.ParamByName('abm_datinc').AsDate   := Now;
            qSql1.ParamByName('abm_horinc').Text     := TimeToStr(Now);
            qSql1.ExecSQL;
            // Finaliza salvando os dados
            FimTransacao;

        except
            RollBack;
            ShowMessage('Ocorreu um erro na tentantiva de alterar os registro: ' );
            Exit;
        end;
        btnAbr.Enabled := True;
        btnfch.Enabled := False;


    end else begin
      edCodCxa.Clear;
      edNomCxa.Clear;
      edSenha.Clear;
      edOrdem.Clear;
    end;
    limpatela;



end;


procedure TfrmAbrcaixa.dsCxaOrdDataChange(Sender: TObject; Field: TField);
begin
      refrescagrids;
end;

procedure TfrmAbrcaixa.edCodCxaExit(Sender: TObject);
Var
qSql, qSql2 : TFDQuery;
begin
  qSql  := TFDQuery.Create(Nil);
  qSql.Connection := dmemp.SqlConSis;
  qSql.Close;
  qSql.SQL.Text := 'Select * From '+U_funcao.SelSchema('caixa')+
                   ' Inner Join '+U_funcao.SelSchema('usuario')+' on usu_codusu = cxa_codusu '+
                   ' where cxa_codigo = '+edCodCxa.Text;
  qSql.Open;
  if qSql.IsEmpty then Begin
     ShowMessage('Caixa não existe');
     edCodCxa.SetFocus ;
  End Else Begin
     edNomCxa.Text  := qSql.FieldByName('usu_nome').Text;
     cCodUsu        := qSql.FieldByName('usu_codusu').Text ;
     cCodCct        := qSql.FieldByName('cxa_codcct').Text ;
     qSql2 := TFDQuery.Create(Nil);
     qSql2.Connection := dmemp.SqlConSis;
     qSql2.Close;
     qSql2.SQL.Text := ' Select * From  '+U_funcao.SelSchema('abrcaixa')+
                                ' LEFT Join  '+U_funcao.SelSchema('caixa')+'  on cxa_codigo = abc_codcxa '+
                                ' LEFT Join  '+U_funcao.SelSchema('ccorrente')+'  on cct_codigo = cxa_codcct '+
                                ' LEFT Join  '+U_funcao.SelSchema('banco')+'  on bco_codigo = cct_codbco '+
                                ' LEFT Join  '+U_funcao.SelSchema('usuario')+'  on usu_codusu = cxa_codusu '+
                        ' where abc_codcxa = '+edCodCxa.Text+
                        ' And   abc_databr is not NULL '+
                        ' And   abc_datfch is NULL ';
     qSql2.Open;

     if qSql2.IsEmpty Then Begin
         qSql2.Close;
         qSql2.SQL.Text := ' Select * From  '+U_funcao.SelSchema('abrcaixa')+
                                    ' LEFT Join  '+U_funcao.SelSchema('caixa')+'  on cxa_codigo = abc_codcxa '+
                                    ' LEFT Join  '+U_funcao.SelSchema('ccorrente')+'  on cct_codigo = cxa_codcct '+
                                    ' LEFT Join  '+U_funcao.SelSchema('banco')+'  on bco_codigo = cct_codbco '+
                                    ' LEFT Join  '+U_funcao.SelSchema('usuario')+'  on usu_codusu = cxa_codusu '+
                            ' where abc_codcxa = '+edCodCxa.Text+
                            ' And   abc_databr is not NULL '+
                            ' And   abc_datfch is Not NULL '+
                            ' And   abc_codigo = (Select Max(abc_codigo) From  '+U_funcao.SelSchema('abrcaixa')+
                                  ' where abc_codcxa =  '+edCodCxa.Text+
                                  ' And   abc_databr is not NULL '+
                                  ' And   abc_datfch is not NULL )';
         qSql2.Open;

         btnAbr.Enabled   := True;
         edValor.Enabled  := True;
         edValor.Text     := FormatCurr('R$ #,###,###0.00',0);
         nVlrAnt          := qSql2.FieldByName( 'abc_vlratu' ).AsFloat;
         edValor.SetFocus;

     End Else Begin
         edValor.Enabled  := False;
         edValor.Text     := FormatCurr('R$ #,###,###0.00',qSql2.FieldByName( 'abc_vlrini' ).AsFloat);
         edOrdem.Text     := qSql2.FieldByName('abc_codigo').Text;
         btnFch .Enabled  := True;
     End;
     edDatIni.Text    := qSql2.FieldByName('abc_databr').Text;
     edHorIni.Text    := qSql2.FieldByName('abc_HorInc').Text;
     edDatFin.Text    := qSql2.FieldByName('abc_datFch').Text;
     edHorFin.Text    := qSql2.FieldByName('abc_HorAlt').Text;
     edOrdem.Text     := qSql2.FieldByName('abc_codigo').Text;
     edSaldoAnt.Text  := FormatCurr('R$ #,###,###0.00',qSql2.FieldByName( 'abc_vlrant' ).AsFloat);
     edSaldoAtu.Text  := FormatCurr('R$ #,###,###0.00',qSql2.FieldByName( 'abc_vlratu' ).AsFloat);
     GridBaixas;



  End;



end;

procedure TfrmAbrcaixa.edValorKeyPress(Sender: TObject; var Key: Char);
Var
  cKey: String;
begin
  cKey:=Key;
  MoedaKeyEdit( Key, edValor );
  Key := #0 ;
end;

initialization
  RegisterClass(TfrmAbrcaixa);


end.
