unit U_TipoInc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, ImgList, ExtCtrls, ComCtrls, xmldom,
  XMLIntf, IdHTTP, msxmldom, XMLDoc, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, ExtDlgs, RibbonLunaStyleActnCtrls,
  ToolWin, ActnMan, ActnCtrls, jpeg, edittuning, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, U_ClasseUtil,U_Classcons, ZDataset, ZDatasetUtils,
  Vcl.Buttons, Vcl.Imaging.pngimage, U_ClassCad, System.ImageList, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client ;

type
  TfrmTipo = class(TForm)
    StatusBar1: TStatusBar;
    Banner: TPanel;
    imgLogo: TImage;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    imgpneus: TImageList;
    ToolBar1: TToolBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    tip_codigo: TButtonedEdit;
    Label4: TLabel;
    tip_nome: TEdit;
    ActDlg: TActionManager;
    btnNovo: TAction;
    SpeedButton1: TSpeedButton;
    btnAlterar: TAction;
    btnExcluir: TAction;
    btnGrava: TAction;
    btnCancela: TAction;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    btnIni: TAction;
    btnAnt: TAction;
    btnProx: TAction;
    btnUlt: TAction;
    btnSair: TAction;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    tip_teixo: TComboBox;
    Label25: TLabel;
    GroupBox2: TGroupBox;
    eixo01: TImage;
    eixo02: TImage;
    eixo03: TImage;
    eixo06: TImage;
    eixo05: TImage;
    eixo04: TImage;
    eixo07: TImage;
    eixo08: TImage;
    pEsqInt01: TImage;
    pdirInt01: TImage;
    pdirInt02: TImage;
    pdirext02: TImage;
    pEsqInt02: TImage;
    pEsqExt02: TImage;
    pEsqExt01: TImage;
    pdirext01: TImage;
    pdirInt03: TImage;
    pdirext03: TImage;
    pEsqInt03: TImage;
    pEsqExt03: TImage;
    pdirext04: TImage;
    pdirInt04: TImage;
    pEsqInt04: TImage;
    pEsqExt04: TImage;
    pdirext05: TImage;
    pdirInt05: TImage;
    pEsqInt05: TImage;
    pEsqExt05: TImage;
    pdirext06: TImage;
    pdirInt06: TImage;
    pEsqInt06: TImage;
    pEsqExt06: TImage;
    pdirext07: TImage;
    pdirInt07: TImage;
    pEsqInt07: TImage;
    pEsqExt07: TImage;
    pdirext08: TImage;
    pdirInt08: TImage;
    pEsqInt08: TImage;
    pEsqExt08: TImage;
    eixo09: TImage;
    pdirext09: TImage;
    pdirInt09: TImage;
    pEsqInt09: TImage;
    pEsqExt09: TImage;
    step02: TImage;
    step01: TImage;
    step03: TImage;
    step04: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    ImageList1: TImageList;
    tip_tipo: TComboBox;
    Label6: TLabel;
    tip_step: TComboBox;
    Label7: TLabel;
    tip_trac: TComboBox;
    Label8: TLabel;
    Panel1: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure RefreshDialog;
    Procedure RefreshDados(tipo: String);
    procedure tip_codigoExit(Sender: TObject);
    procedure tip_codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tip_codigoRightButtonClick(Sender: TObject);
    procedure ativaget;
    procedure limpaget;
    procedure ativaButoes(tipo:Integer);
    procedure FormCreate(Sender: TObject);
    procedure gravadados;
    procedure navegacao(Ord: Integer);
    procedure btnNovoExecute(Sender: TObject);
    procedure btnAlterarExecute(Sender: TObject);
    procedure btnExcluirExecute(Sender: TObject);
    procedure btnGravaExecute(Sender: TObject);
    procedure btnCancelaExecute(Sender: TObject);
    procedure btnIniExecute(Sender: TObject);
    procedure btnAntExecute(Sender: TObject);
    procedure btnProxExecute(Sender: TObject);
    procedure btnUltExecute(Sender: TObject);
    procedure btnSairExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure tip_teixoChange(Sender: TObject);
    procedure tip_codigoChange(Sender: TObject);
    Procedure ChkEixo(QTdEixo, Tipo, Trac, Step : string);
    procedure pdirext01MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Panel1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
  private
    { Private declarations }
    wEmpresa, wUsuInc, wHorInc, wUsuAlt, wHorAlt : string ;
    wDatInc, wDatAlt : Tdate;
    nNew, nRecno:  Integer;
  public
    acampo: integer;
    aberto, lMostra: Boolean;
    aEdits :  TArrayComp;
    Util: TClasseUtil;
    Pesquisa : TClasConsulta;
    sqlNew    : TFDQuery;
    cPre, cTabela: String;
    { Public declarations }
  end;

var
  frmTipo: TfrmTipo;
  modConsulta, nOrdem : integer;


implementation

uses  UCalculadora,  u_DmEmp, uSistema, U_funcao, U_CnpjClass,
  U_MetodosDialog;

{$R *.dfm}

procedure TfrmTipo.tip_codigoChange(Sender: TObject);
begin
  tip_teixoChange(Nil);
end;

procedure TfrmTipo.tip_codigoExit(Sender: TObject);
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  Pesquisa.sqlTabela :=  dmEmp.sqltipo ;
  tip_nome.Text :=  Pesquisa.Relacao('tipo',tip_codigo,'tip_codigo','tip_nome');
  navegacao(5);

end;

procedure TfrmTipo.tip_codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      tip_codigoRightButtonClick(Self);
    VK_UP     : navegacao(1);
    VK_LEFT   : navegacao(2);
    VK_RIGHT  : navegacao(3);
    VK_DOWN   : navegacao(4);
  end;
Finally

End;

end;

procedure TfrmTipo.tip_codigoRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
if btnGrava.Enabled then
   Exit;

  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dstipo ;
  Pesquisa.sqlTabela :=  dmEmp.sqlTipo ;
  Pesquisa.cliTabela :=  dmEmp.clitipo ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Tipos de Veículos';
  Pesquisa.nmTabela  := 'tipo';
  //Pesquisa.NovoCad   := 'tipo' ;
  // Display        campo   cabecalho           get           tan  indices
  Pesquisa.AddReg('tip_codigo','Código'         ,'tip_codigo' ,5  ,'por Código' );
  Pesquisa.AddReg('tip_nome'  ,'Tipos'          ,'tip_nome'   ,20 ,'por Tipos' );

  Pesquisa.acessa(tip_codigo);
  tip_codigo.text   :=  Pesquisa.RecReg('tip_codigo');
  tip_nome.text     :=  Pesquisa.RecReg('tip_nome');
  Pesquisa.Destroy;
  {Class}
  if Pesquisa.lOk then Begin
     acampo             := 0;
     RefreshDados('S');
     btnNovo.Enabled    := False;
     btnAlterar.Enabled := True;
     ativaButoes(1);
     ativaget;
     navegacao(5);
  End;

 end;

procedure TfrmTipo.tip_teixoChange(Sender: TObject);
Var
i, nImg: Integer;
Qtd : String;
begin

  // Checar a tração
  if ( tip_trac.Text = 'Truck'     ) and
     ( tip_tipo.Text = 'automóvel' ) then
      tip_trac.ItemIndex := 0;


  if StrToInt( tip_teixo.Text ) >= 1 then Begin
     imgpneus.GetBitmap(0,eixo01.Picture.Bitmap);

     imgpneus.GetBitmap(1,pdirInt01.Picture.Bitmap);
     imgpneus.GetBitmap(1,pEsqInt01.Picture.Bitmap);

     if ( ( tip_tipo.Text <> 'automóvel'          ) and
          ( tip_tipo.Text <> 'camioneta'          ) and
          ( tip_tipo.Text <> 'caminhão'           ) and
          ( tip_tipo.Text <> 'caminhão-trator'    ) and
          ( tip_tipo.Text <> 'microônibus'        ) and
          ( tip_tipo.Text <> 'motoneta'           ) and
          ( tip_tipo.Text <> 'quadriciclo'        ) and
          ( tip_tipo.Text <> 'trator de rodas'    ) and
          ( tip_tipo.Text <> 'trator de esteiras' ) and
          ( tip_tipo.Text <> 'trator misto'       ) and
          ( tip_tipo.Text <> 'triciclo'           ) and
          ( tip_tipo.Text <> 'ônibus'             ) and
          ( tip_tipo.Text <> 'caminhonete'        ) ) and ( tip_trac.Text <> 'Normal' )  then Begin

        imgpneus.GetBitmap(1,pdirext01.Picture.Bitmap);
        imgpneus.GetBitmap(1,pEsqext01.Picture.Bitmap);
     End Else Begin
        pdirext01.Picture := Nil ;
        pEsqext01.Picture := Nil ;
     End;

  End Else Begin
      eixo01.Picture    := Nil ;
      pdirext01.Picture := Nil ;
      pEsqext01.Picture := Nil ;
      pdirInt01.Picture := Nil ;
      pEsqInt01.Picture := Nil ;
  End;

  if StrToInt( tip_teixo.Text ) >= 2 then Begin
      imgpneus.GetBitmap(0,eixo02.Picture.Bitmap);
      imgpneus.GetBitmap(1,pdirInt02.Picture.Bitmap);
      imgpneus.GetBitmap(1,pEsqInt02.Picture.Bitmap);

      if ( tip_tipo.Text <> 'automóvel' ) and ( tip_trac.Text <> 'Normal' ) then Begin
          imgpneus.GetBitmap(1,pdirext02.Picture.Bitmap);
          imgpneus.GetBitmap(1,pEsqext02.Picture.Bitmap);
       End ELse Begin
          pdirext02.Picture := Nil ;
          pEsqext02.Picture := Nil ;
      End;

  End Else Begin
      eixo02.Picture    := Nil ;
      pdirext02.Picture := Nil ;
      pEsqext02.Picture := Nil ;
      pdirInt02.Picture := Nil ;
      pEsqInt02.Picture := Nil ;
  End;

  if ( StrToInt( tip_teixo.Text ) >= 3 ) and ( tip_tipo.Text <> 'automóvel' ) then Begin
      imgpneus.GetBitmap(0,eixo03.Picture.Bitmap);
      imgpneus.GetBitmap(1,pdirInt03.Picture.Bitmap);
      imgpneus.GetBitmap(1,pEsqInt03.Picture.Bitmap);

      if (( tip_tipo.Text = 'carroceria' ) or ( tip_tipo.Text = 'camioneta' ) or ( tip_tipo.Text = 'caminhonete' ) ) and ( tip_trac.Text <> 'Normal' ) then Begin
        imgpneus.GetBitmap(1,pdirext03.Picture.Bitmap);
        imgpneus.GetBitmap(1,pEsqext03.Picture.Bitmap);
       End ELse Begin
        pdirext03.Picture := Nil ;
        pEsqext03.Picture := Nil ;
      End;

  End Else Begin
      eixo03.Picture    := Nil ;
      pdirext03.Picture := Nil ;
      pEsqext03.Picture := Nil ;
      pdirInt03.Picture := Nil ;
      pEsqInt03.Picture := Nil ;
  End;


  if ( StrToInt( tip_teixo.Text ) >= 4 ) and ( tip_tipo.Text <> 'automóvel' ) then Begin
      imgpneus.GetBitmap(0,eixo04.Picture.Bitmap);
      imgpneus.GetBitmap(1,pdirInt04.Picture.Bitmap);
      imgpneus.GetBitmap(1,pEsqInt04.Picture.Bitmap);

      if (( tip_tipo.Text = 'carroceria' ) or ( tip_tipo.Text = 'camioneta' ) or ( tip_tipo.Text = 'caminhonete' ) ) and ( tip_trac.Text <> 'Normal' ) then Begin
        imgpneus.GetBitmap(1,pdirext04.Picture.Bitmap);
        imgpneus.GetBitmap(1,pEsqext04.Picture.Bitmap);
       End ELse Begin
        pdirext04.Picture := Nil ;
        pEsqext04.Picture := Nil ;
      End;

  End Else Begin
      eixo04.Picture    := Nil ;
      pdirext04.Picture := Nil ;
      pEsqext04.Picture := Nil ;
      pdirInt04.Picture := Nil ;
      pEsqInt04.Picture := Nil ;
  End;

  if ( StrToInt( tip_teixo.Text ) >= 5 ) and ( tip_tipo.Text <> 'automóvel' ) then Begin
      imgpneus.GetBitmap(0,eixo05.Picture.Bitmap);
      imgpneus.GetBitmap(1,pdirInt05.Picture.Bitmap);
      imgpneus.GetBitmap(1,pEsqInt05.Picture.Bitmap);

      if (( tip_tipo.Text = 'carroceria' ) or ( tip_tipo.Text = 'camioneta' ) or ( tip_tipo.Text = 'caminhonete' ) ) and ( tip_trac.Text <> 'Normal' ) then Begin
        imgpneus.GetBitmap(1,pdirext05.Picture.Bitmap);
        imgpneus.GetBitmap(1,pEsqext05.Picture.Bitmap);
       End ELse Begin
        pdirext05.Picture := Nil ;
        pEsqext05.Picture := Nil ;
      End;

  End Else Begin
      eixo05.Picture    := Nil ;
      pdirext05.Picture := Nil ;
      pEsqext05.Picture := Nil ;
      pdirInt05.Picture := Nil ;
      pEsqInt05.Picture := Nil ;
  End;

  if ( StrToInt( tip_teixo.Text ) >= 6 ) and ( tip_tipo.Text <> 'automóvel' ) then Begin
      imgpneus.GetBitmap(0,eixo06.Picture.Bitmap);
      imgpneus.GetBitmap(1,pdirInt06.Picture.Bitmap);
      imgpneus.GetBitmap(1,pEsqInt06.Picture.Bitmap);

      if (( tip_tipo.Text = 'carroceria' ) or ( tip_tipo.Text = 'camioneta' ) or ( tip_tipo.Text = 'caminhonete' ) ) and ( tip_trac.Text <> 'Normal' ) then Begin
        imgpneus.GetBitmap(1,pdirext06.Picture.Bitmap);
        imgpneus.GetBitmap(1,pEsqext06.Picture.Bitmap);
       End ELse Begin
        pdirext06.Picture := Nil ;
        pEsqext06.Picture := Nil ;
      End;

  End Else Begin
      eixo06.Picture    := Nil ;
      pdirext06.Picture := Nil ;
      pEsqext06.Picture := Nil ;
      pdirInt06.Picture := Nil ;
      pEsqInt06.Picture := Nil ;
  End;

  if ( StrToInt( tip_teixo.Text ) >= 7 ) and ( tip_tipo.Text <> 'automóvel' ) then Begin
      imgpneus.GetBitmap(0,eixo07.Picture.Bitmap);
      imgpneus.GetBitmap(1,pdirInt07.Picture.Bitmap);
      imgpneus.GetBitmap(1,pEsqInt07.Picture.Bitmap);

      if (( tip_tipo.Text = 'carroceria' ) or ( tip_tipo.Text = 'camioneta' ) or ( tip_tipo.Text = 'caminhonete' ) ) and ( tip_trac.Text <> 'Normal' ) then Begin
        imgpneus.GetBitmap(1,pdirext07.Picture.Bitmap);
        imgpneus.GetBitmap(1,pEsqext07.Picture.Bitmap);
       End ELse Begin
        pdirext07.Picture := Nil ;
        pEsqext07.Picture := Nil ;
      End;

  End Else Begin
      eixo07.Picture    := Nil ;
      pdirext07.Picture := Nil ;
      pEsqext07.Picture := Nil ;
      pdirInt07.Picture := Nil ;
      pEsqInt07.Picture := Nil ;
  End;

  if ( StrToInt( tip_teixo.Text ) >= 8 ) and ( tip_tipo.Text <> 'automóvel' ) then Begin
      imgpneus.GetBitmap(0,eixo08.Picture.Bitmap);
      imgpneus.GetBitmap(1,pdirInt08.Picture.Bitmap);
      imgpneus.GetBitmap(1,pEsqInt08.Picture.Bitmap);

      if (( tip_tipo.Text = 'carroceria' ) or ( tip_tipo.Text = 'camioneta' ) or ( tip_tipo.Text = 'caminhonete' ) ) and ( tip_trac.Text <> 'Normal' ) then Begin
        imgpneus.GetBitmap(1,pdirext08.Picture.Bitmap);
        imgpneus.GetBitmap(1,pEsqext08.Picture.Bitmap);
       End ELse Begin
        pdirext08.Picture := Nil ;
        pEsqext08.Picture := Nil ;
      End;

  End Else Begin
      eixo08.Picture    := Nil ;
      pdirext08.Picture := Nil ;
      pEsqext08.Picture := Nil ;
      pdirInt08.Picture := Nil ;
      pEsqInt08.Picture := Nil ;
  End;

  if ( StrToInt( tip_teixo.Text ) >= 9 ) and ( tip_tipo.Text <> 'automóvel' ) then Begin
      imgpneus.GetBitmap(0,eixo09.Picture.Bitmap);
      imgpneus.GetBitmap(1,pdirInt09.Picture.Bitmap);
      imgpneus.GetBitmap(1,pEsqInt09.Picture.Bitmap);

      if (( tip_tipo.Text = 'carroceria' ) or ( tip_tipo.Text = 'camioneta' ) or ( tip_tipo.Text = 'caminhonete' ) ) and ( tip_trac.Text <> 'Normal' ) then Begin
        imgpneus.GetBitmap(1,pdirext09.Picture.Bitmap);
        imgpneus.GetBitmap(1,pEsqext09.Picture.Bitmap);
       End ELse Begin
        pdirext09.Picture := Nil ;
        pEsqext09.Picture := Nil ;
      End;

  End Else Begin
      eixo09.Picture    := Nil ;
      pdirext09.Picture := Nil ;
      pEsqext09.Picture := Nil ;
      pdirInt09.Picture := Nil ;
      pEsqInt09.Picture := Nil ;
  End;

 If  StrToInt( tip_step.Text ) >=1  Then
     imgpneus.GetBitmap(1,step01.Picture.Bitmap)
 Else
     ( step01.Picture := Nil ) ;


  If StrToInt( tip_step.Text ) >=2 Then
     imgpneus.GetBitmap(1,step02.Picture.Bitmap)
  Else
  ( step02.Picture := Nil ) ;

  If  StrToInt( tip_step.Text ) >=3 Then
      imgpneus.GetBitmap(1,step03.Picture.Bitmap)
  Else
      step03.Picture := Nil  ;

  If StrToInt( tip_step.Text ) >=4 Then
     imgpneus.GetBitmap(1,step04.Picture.Bitmap)
  Else
     step04.Picture := Nil  ;

end;

procedure TfrmTipo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sqlNew.Close;
    dmEmp.clitipo.Close;
    frmtipo                   := nil ;
    action                       := cafree;
    fPrincipal.btntipo.Enabled := True;
end;


{Class}
procedure TfrmTipo.FormCreate(Sender: TObject);
Var
i: Integer;
begin
  cPre                        := 'tip_';
  cTabela                     := 'tipo';
  acampo                      := 1;
  sqlNew                      := TFDQuery.Create(nil);
  sqlNew.Connection           := dmEmp.SqlConSis;
  fPrincipal.btntipo.Enabled  := False;
  for i := 0 to ComponentCount -1 do begin
      If PegaCmpFrm(Components[i],cPre) <> Nil Then Begin
         SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := PegaCmpFrm(Components[i],cPre)  ;
      End;
  end;
end;

procedure TfrmTipo.FormKeyPress(Sender: TObject; var Key: Char);
Begin
  //verifica se a tecla pressionada é a tecla ENTER, conhecida como #13
  If key = #13 then Begin
    //se for, passa o foco para o próximo campo, zerando o valor da variável Key
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  End Else
    If key = #27 then Begin
       if Not btnGrava.Enabled then begin
          Close;
       end else begin
          btnCancelaExecute(nil);
          key := #0;
       end;

  end;
end;

procedure TfrmTipo.FormShow(Sender: TObject);
var
i, tmp: Integer;
Pesquisa : TClasConsulta;
begin

  Util:= TClasseUtil.Create;
  Pesquisa := TClasConsulta.Create;

  // Cor do banner
  Banner.ParentBackGround := False;
  Banner.ParentColor      := False;
  Banner.Brush.Color      := u_funcao.Bronze_Escuro ;

  // Titulos do Banner
  lbCabeca01.Caption    := 'Tabela de Tipos de Veículos';
  lbCabeca02.Caption    := u_funcao.nmSistema ;
  // Cores - Titulos do Banner
  lbCabeca01.Font.Color := u_funcao.clTit_BCad ;
  lbCabeca02.Font.Color := u_funcao.clTit_BCad ;
  RefreshDados('T');
  btnGrava.Enabled := False;
  ativaButoes(1);
  RefreshDialog;
  lMostra := True;
  ativaget;
  navegacao(1);

  btnNovo.Caption    := 'Novo'+#13 +'[F3]';
  btnAlterar.Caption := 'Editar'+#13 +'[F4]';
  btnGrava.Caption   := 'Salvar'+#13 +'[F5]';
  btnExcluir.Caption := 'Excluir'+#13 +'[Alt+Del]';
  btnCancela.Caption := 'Cancelar'+#13 +'[F12]';

  tip_tipo.Clear;
  for I := 0 to Length(aTipoVeic)-1 do begin
      tip_tipo.Items.Add( aTipoVeic[I] );
  end;
  tip_tipo.ItemIndex := 0;

end;

{Class}
procedure TfrmTipo.gravadados;
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, ctip_horalt,cCodSql, cIteSql,cValSql,cCodMnt : string ;
dData, dtip_datalt : TDate ;
i, tmp: Integer;
SQLQ : TFDQuery ;

begin
   gravadados2(cTabela,cPre,cPre+'codigo','X','', nNew, frmTipo, dmEmp.SqlConSis, aEdits );
end;

{Class}
procedure TfrmTipo.limpaget;
Var
i: Integer;
begin
  limpaget2(aEdits);
end;

{Class}
procedure TfrmTipo.navegacao(Ord: Integer);
begin
  if btnGrava.Enabled then
     Exit;

  navegacao2( Ord, acampo, btnIni, btnAnt, btnProx, btnUlt, sqlNew, dmEmp.sqlTipo, tip_codigo,'' );
  acampo := 0;
  RefreshDialog2(cPre,acampo, frmTipo, sqlNew, aEdits);
  acampo := 1;
  tip_teixoChange(Nil);
end;

procedure TfrmTipo.Panel1DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
if Source = pdirext01 then pdirext01.EndDrag(True); // finaliza o processo

end;

procedure TfrmTipo.Panel1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
if Source = pdirext01 then
   Accept := True; // aceita a ação

end;

procedure TfrmTipo.pdirext01MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Sender = pdirext01) and (Button = mbLeft) then pdirext01.BeginDrag(False); // inicia a operacao

end;

{Class}
procedure TfrmTipo.RefreshDados(tipo: String);
var
  i: integer;
  cWhere, cQuery, cOrder: String;

begin
  RefreshDados2(acampo, tipo,'',  tip_codigo, sqlNew, dmEmp.sqlTipo );
end;

{Class}
procedure TfrmTipo.RefreshDialog;
var
  i, tmp: Integer;
  frmx : TForm ;
begin
  RefreshDialog2(cPre,acampo, frmTipo, sqlNew, aEdits);
end;

procedure TfrmTipo.ToolButton9Click(Sender: TObject);
begin
  frmCalculadora := TfrmCalculadora.Create(Self);
  frmCalculadora.Show;

end;

{ Class}
procedure TfrmTipo.ativaButoes(tipo:Integer);
begin
ativaButoes2(Tipo,  btnNovo, btnAlterar, btnExcluir, btnGrava, btnCancela, btnIni, btnAnt, btnProx, btnUlt, sqlNew);
end;

{ Class }
procedure TfrmTipo.ativaget;
begin
  ativaget2(aEdits,cPre+'codigo',cTabela, btnGrava.Enabled, lMostra );
end;

procedure TfrmTipo.btnAlterarExecute(Sender: TObject);
begin
   nOrdem             := sqlNew.RecNo ;
   btnNovo.Enabled    := False;
   btnAlterar.Enabled := False;
   btnGrava.Enabled   := True;
   ativaButoes(1);
   lMostra := True;
   ativaget;
   RefreshDialog;
   tip_nome.SetFocus;
   acampo := 0;
   nNew   := acampo;
   navegacao(0);

end;

procedure TfrmTipo.btnAntExecute(Sender: TObject);
begin
  navegacao(2);
end;

procedure TfrmTipo.btnCancelaExecute(Sender: TObject);
begin
   acampo := 1;
   nNew             := acampo;
   btnNovo.Enabled  := True;
   btnGrava.Enabled := False;
   RefreshDados('T');
   ativaButoes(1);
   lMostra := True;
   ativaget;
   navegacao(4);

   tip_codigo.SetFocus;

end;

procedure TfrmTipo.btnExcluirExecute(Sender: TObject);
Var
aSubTab : TArrayDim2;
n: Integer;
begin
   //SetLength(aSubTab, Length(aSubTab)+1); n:= Length(aSubTab)-1; aSubTab[n][0] := 'acessoratv';     aSubTab[n][1] := '';
   If Exclui2(cTabela, aSubTab,  tip_codigo, btnExcluir) Then Begin;
       RefreshDados('T');
       ativaButoes(1);
       limpaget;
       lMostra := True;
       ativaget;
       navegacao(4);
       acampo := 1;
       nNew   := acampo;
   End;
end;

procedure TfrmTipo.btnGravaExecute(Sender: TObject);
begin
   gravadados;
   if FechaSubFrm(cTabela) then Close;

   acampo := 1;
   nNew   := acampo;
   btnNovo.Enabled := True;
   btnGrava.Enabled:= False;
   RefreshDados('T');
   ativaButoes(0);
   limpaget;
   lMostra := True;
   ativaget;

    Case lMostra of
      False  : navegacao(4);
      True   : navegacao(5);
     end;

   tip_codigo.SetFocus;
end;

procedure TfrmTipo.btnIniExecute(Sender: TObject);
begin
  navegacao(1);
end;

procedure TfrmTipo.btnNovoExecute(Sender: TObject);
begin
   acampo := 1;
   nNew   := acampo;
   btnGrava.Enabled := True;
   RefreshDados('S');
   limpaget;
   ativaButoes(1);
   lMostra := False;
   ativaget;
   tip_nome.SetFocus;
end;

procedure TfrmTipo.btnProxExecute(Sender: TObject);
begin
  navegacao(3);
end;

procedure TfrmTipo.btnSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmTipo.btnUltExecute(Sender: TObject);
begin
  navegacao(4);
end;

procedure TfrmTipo.ChkEixo(QTdEixo, Tipo, Trac, Step: string);
Var
nImg : Integer;
begin
{ Formação da função para Habilitar os pneus}
  nImg := ( Strtoint(QTdEixo) - 1 ) ;


  imgpneus.GetBitmap(nImg,TImage('eixo'+QTdEixo).Picture.Bitmap);
  imgpneus.GetBitmap(nImg,TImage('pdirInt'+QTdEixo).Picture.Bitmap);
  imgpneus.GetBitmap(nImg,TImage('pExqInt'+QTdEixo).Picture.Bitmap);
  imgpneus.GetBitmap(nImg,TImage('pdirExt'+QTdEixo).Picture.Bitmap);
  imgpneus.GetBitmap(nImg,TImage('pExqExt'+QTdEixo).Picture.Bitmap);


end;

initialization
  RegisterClass(TfrmTipo);


end.
