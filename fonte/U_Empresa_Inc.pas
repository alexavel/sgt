unit U_Empresa_Inc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, ImgList, ExtCtrls, ComCtrls, xmldom,
  XMLIntf, IdHTTP, msxmldom, XMLDoc, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, ExtDlgs, RibbonLunaStyleActnCtrls, Ribbon,
  ToolWin, ActnMan, ActnCtrls, jpeg, edittuning, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.Buttons, U_ClasseUtil, zdataset,
  System.ImageList, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.XPMan, Vcl.Imaging.pngimage ;

type
  TfrmEmpresaInc = class(TForm)
    Banner: TPanel;
    Status: TStatusBar;
    lbCabeca01: TLabel;
    lbCabeca02: TLabel;
    Image1: TImage;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    grpdados: TGroupBox;
    Label8: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    emp_codemp: TEdit;
    emp_Nome: TEdit;
    dtbase: TEdit;
    emp_CNPJ: TMaskEdit;
    emp_fantasia: TEdit;
    Label1: TLabel;
    Label5: TLabel;
    emp_endemp: TEdit;
    Label6: TLabel;
    emp_BaiEmp: TEdit;
    emp_codcid: TButtonedEdit;
    Label24: TLabel;
    edNomCid: TEdit;
    edUf: TEdit;
    emp_numemp: TEdit;
    Label7: TLabel;
    emp_cepemp: TMaskEdit;
    Label21: TLabel;
    Label39: TLabel;
    emp_telemp: TMaskEdit;
    emp_tl1emp: TMaskEdit;
    Label9: TLabel;
    emp_tl2emp: TMaskEdit;
    Label10: TLabel;
    Label11: TLabel;
    emp_faxemp: TMaskEdit;
    XMLBuscaCep: TXMLDocument;
    emp_Tipo: TEdit;
    Label12: TLabel;
    emp_dtAbertura: TDateTimePicker;
    Label13: TLabel;
    Label14: TLabel;
    emp_ComEmp: TEdit;
    Label15: TLabel;
    emp_Situacao: TEdit;
    btnSalvar: TButton;
    btnSair: TButton;
    ImageList1: TImageList;
    GroupBox3: TGroupBox;
    emp_logo: TImage;
    Button1: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    Label16: TLabel;
    emp_site: TEdit;
    Label17: TLabel;
    emp_email: TEdit;
    FDQuery1: TFDQuery;
    Image2: TImage;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure emp_codcidKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure emp_codcidRightButtonClick(Sender: TObject);
    procedure emp_CNPJExit(Sender: TObject);
    procedure emp_cepempExit(Sender: TObject);
    procedure emp_fantasiaExit(Sender: TObject);
    procedure LancBDE();
    procedure emp_codcidExit(Sender: TObject);
    procedure btnGravarExecute(Sender: TObject);
    procedure BtnSaindoExecute(Sender: TObject);
    Function  ChkCNPJ(CNPJ: String): Boolean;
    procedure Button1Click(Sender: TObject);
  private

    wEmpresa, wUsuInc, wHorInc, wUsuAlt, wHorAlt : string ;
    wDatInc, wDatAlt : Tdate;
    nNew, nRecno:  Integer;

    { Private declarations }
  public
    { Public declarations }
    aEdits : array of TComponent;
    Util: TClasseUtil;
  end;

var
  frmEmpresaInc: TfrmEmpresaInc;

implementation

uses U_dmEmp, uSistema, U_Pesquisa, U_funcao, U_Sys, u_classCons,
  U_CnpjClass, u_aguarde;

{$R *.dfm}


// Grava as informações no Banco de Dados
procedure TfrmEmpresaInc.btnSalvarClick(Sender: TObject);
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, cHorAlt,cCodSql, cIteSql,cValSql : string ;
dData, dDatAlt : TDate ;
i, tmp: Integer;
qSql : TFDQuery ;
begin
          cUsu    :=  'ADMINISTRADOR';
          dData   :=  date ;
          cHora   :=  TimeToStr(time) ;
          qSql    :=  TFDQuery.Create(Nil) ;
          qSql.Connection := dmEmp.SqlConSis ;
          msFoto01 := TMemoryStream.Create;
          Memo1.Text := '';
          if emp_logo.Picture.Graphic <> Nil then Begin
             emp_logo.Picture.Graphic.SaveToStream(msFoto01);
          End;
          if nNew > 0 then
          begin
            // Gera Scrip de Insert
            cCodSql:= 'Insert Into "dbconfig".Empresa ( ';
            for i := 0 to Length(aEdits)-1 do begin
                 if aEdits[i].name <> 'emp_codemp' then
                    begin

                    cIteSql:= cIteSql+aEdits[i].Name+', ';
                    cValSql:= cValSql+':'+aEdits[i].Name+', ';

                    end;
            end;
            cIteSql:= cIteSql + ' emp_dtbase, emp_logo,  emp_usuinc,  emp_datinc,  emp_horinc  ) values (';
            cValSql:= cValSql + ' :dtbase,    :logo,     :Usuario,    :data,       :hora )';
            cCodSql:=cCodSql+cIteSql+cValSql;

          end
          else begin
            // Gera Scrip de Update
            cCodSql:= 'update "dbconfig".Empresa set ';
            for i := 0 to Length(aEdits)-1 do begin
                 if aEdits[i].name <> 'emp_codemp' then
                    begin
                    cIteSql:= cIteSql+aEdits[i].Name+' = :'+aEdits[i].Name+', ';
                  end;
            end;
            cIteSql:= cIteSql + ' emp_dtbase = :dtbase, emp_logo: = :logo,  emp_usualt = :Usuario,  emp_datalt = :Data,  emp_horalt = :Hora Where emp_codemp = '+emp_codemp.Text;
            cCodSql:=cCodSql+cIteSql;
          end;

          // jogando os parametros
          qSql.sQL.Text := cCodSql ;
          for i := 0 to Length(aEdits)-1 do begin
               if aEdits[i].name <> 'emp_codemp' then
                  begin

                  If aEdits[i].ClassType = Tedit Then
                      Begin
                          qSql.ParamByName(aEdits[i].name).Text     :=  TEdit(aEdits[i]).Text ;
                      End;

                  If aEdits[i].ClassType = TMaskEdit Then
                      Begin
                          qSql.ParamByName(aEdits[i].name).Text     :=  TMaskEdit(aEdits[i]).text ;
                      End;

                  If aEdits[i].ClassType = TComboBox Then
                      Begin
                          qSql.ParamByName(aEdits[i].name).Text     :=  TComboBox(aEdits[i]).text ;
                      End;

                  If aEdits[i].ClassType = TDateTimePicker Then
                      Begin
                          qSql.ParamByName(aEdits[i].name).AsDate   :=  TDateTimePicker(aEdits[i]).Date ;
                      End;

                  If aEdits[i].ClassType = TButtonedEdit Then
                      Begin
                          qSql.ParamByName(aEdits[i].name).AsInteger:=  StrToInt( TButtonedEdit(aEdits[i]).Text ) ;
                      End;
                end;
          end;
          qSql.ParamByName('logo').LoadFromStream(msFoto01,ftBlob);
          qSql.ParamByName('dtbase').Text :=  dtbase.Text ;
          qSql.ParamByName('Usuario').Text  :=  cUsu ;
          qSql.ParamByName('Data').AsDate   :=  Now ;
          qSql.ParamByName('Hora').Text     :=  cHora ;
          Try
            qSql.ExecSQL;
            dmEmp.SqlConSis.Commit; //(dmEmp.Transacao);
          except
             on Exc:Exception do
                 begin
                   ShowMessage('Ocorreu um erro na tentantiva de alterar os registro: ' + Exc.Message);
                   dmEmp.SqlConSis.Rollback;//(dmEmp.Transacao);
              end;
          End;
          FreeAndNil( qSql );
          FreeAndNil( msFoto01 );
          adm_codusu := 1;
          adm_codemp := 1;
          Auditor(Screen.activeform.Caption,'Instalação','Cód: 1');
          Close;

end;

procedure TfrmEmpresaInc.Button1Click(Sender: TObject);
Var
BMP: TBitmap;
JPG: TJPegImage;

begin

if openpicturedialog1.Execute then
  begin
    emp_logo.Picture.LoadFromFile(openpicturedialog1.FileName);
  end;
end;


procedure TfrmEmpresaInc.btnGravarExecute(Sender: TObject);
Var
foto: TFileStream;
msFoto01: TMemoryStream;
Memo1: Tdbmemo;
cUsu, cHora, cHorAlt,cCodSql, cIteSql,cValSql : string ;
dData, dDatAlt : TDate ;
i, tmp: Integer;

begin
  cUsu    :=  sysUsuario;
  dData   :=  date ;
  cHora   :=  TimeToStr(time) ;

  msFoto01 := TMemoryStream.Create;
  emp_logo.Picture.Graphic.SaveToStream(msFoto01);
  Memo1.Text := '';

  dmEmp.Transacao.TransactionID := 1;
  dmEmp.SqlConSis.StartTransaction;//(dmEmp.Transacao);
  dmEmp.sqlEmpresa.Close;
  if nNew > 0 then
  begin
    // Gera Scrip de Insert
    cCodSql:= 'Insert Into "dbconfig".Empresa ( ';
    for i := 0 to Length(aEdits)-1 do begin
         if aEdits[i].name <> 'emp_codemp' then
            begin

            cIteSql:= cIteSql+aEdits[i].Name+', ';
            cValSql:= cValSql+':'+aEdits[i].Name+', ';

            end;
    end;
    cIteSql:= cIteSql + ' emp_dtbase,  emp_usuinc,  emp_datinc,  emp_horinc  ) values (';
    cValSql:= cValSql + ' :dtbase, :Usuario, :data, :hora )';
    cCodSql:=cCodSql+cIteSql+cValSql;

  end
  else begin
    // Gera Scrip de Update
    cCodSql:= 'update "dbconfig".Empresa set ';
    for i := 0 to Length(aEdits)-1 do begin
         if aEdits[i].name <> 'emp_codemp' then
            begin
            cIteSql:= cIteSql+aEdits[i].Name+' = :'+aEdits[i].Name+', ';
          end;
    end;
    cIteSql:= cIteSql + ' emp_dtbase = :dtbase,  emp_usualt = :Usuario,  emp_datalt = :Data,  emp_horalt = :Hora Where emp_codemp = '+emp_codemp.Text;
    cCodSql:=cCodSql+cIteSql;

  end;
  // jogando os parametros
  dmEmp.sqlEmpresa.sQL.Text := cCodSql ;
  for i := 0 to Length(aEdits)-1 do begin
       if aEdits[i].name <> 'emp_codemp' then
          begin

          If aEdits[i].ClassType = Tedit Then
              Begin
                  dmEmp.sqlEmpresa.ParamByName(aEdits[i].name).Text     :=  TEdit(aEdits[i]).Text ;
              End;

          If aEdits[i].ClassType = TMaskEdit Then
              Begin
                  dmEmp.sqlEmpresa.ParamByName(aEdits[i].name).Text     :=  TMaskEdit(aEdits[i]).text ;
              End;

          If aEdits[i].ClassType = TComboBox Then
              Begin
                  dmEmp.sqlEmpresa.ParamByName(aEdits[i].name).Text     :=  TComboBox(aEdits[i]).text ;
              End;

          If aEdits[i].ClassType = TDateTimePicker Then
              Begin
                  dmEmp.sqlEmpresa.ParamByName(aEdits[i].name).AsDate   :=  TDateTimePicker(aEdits[i]).Date ;
              End;

          If aEdits[i].ClassType = TButtonedEdit Then
              Begin
                  dmEmp.sqlEmpresa.ParamByName(aEdits[i].name).Text     :=  TButtonedEdit(aEdits[i]).Text ;
              End;
        end;
  end;
  dmEmp.sqlEmpresa.ParamByName('logo').LoadFromStream(msFoto01,ftBlob);
  dmEmp.sqlEmpresa.ParamByName('dtbase').Text :=  dtbase.Text ;
  dmEmp.sqlEmpresa.ParamByName('Usuario').Text  :=  cUsu ;
  dmEmp.sqlEmpresa.ParamByName('Data').AsDate   :=  Now ;
  dmEmp.sqlEmpresa.ParamByName('Hora').Text     :=  cHora ;
  Try
    dmEmp.sqlEmpresa.ExecSQL;
    dmEmp.SqlConSis.Commit;//(dmEmp.Transacao);

    if Not dmEmp.cliEmpresa.Active then
        dmEmp.cliEmpresa.Active := True;

        dmEmp.cliEmpresa.ApplyUpdates(0);
  except
     on Exc:Exception do
         begin
           ShowMessage('Ocorreu um erro na tentantiva de alterar os registro: ' + Exc.Message);
           dmEmp.SqlConSis.Rollback;///(dmEmp.Transacao);
      end;
  End;

  if Not dmEmp.cliEmpresa.Active then
    dmEmp.cliEmpresa.Active := True;

  if ( TelaP = 'N' ) or ( TelaP =''  ) then Begin

      if nNew = 0 then begin
      end else begin
        dmEmp.cliEmpresa.last ;
      end;
      if ( nNew > 0 ) then Begin
         //U_funcao.LeIni;
      End;
      Close;

   End Else Begin
      if ( TelaP = 'S' ) then Begin
          //frmPesquisa.atualizando();
      End;
      if ( TelaP = 'A' ) then Begin
      End;
      Close;
   End;


end;

procedure TfrmEmpresaInc.BtnSaindoExecute(Sender: TObject);
begin
  if ( TelaP = 'N' ) or ( TelaP = '' ) then Begin
     Close;
   End Else Begin
      Close;
      if ( TelaP = 'S' ) then
          //frmPesquisa.atualizando();

      if ( TelaP = 'A' ) then
          fPrincipal.Sair;

   End
end;

procedure TfrmEmpresaInc.btnSairClick(Sender: TObject);
begin
  if ( TelaP = 'N' ) or ( TelaP = '' ) then Begin
     Close;
   End Else Begin
      Close;
      if ( TelaP = 'S' ) then
          //frmPesquisa.atualizando();

      if ( TelaP = 'A' ) then
          fPrincipal.Sair;

   End
end;


procedure TfrmEmpresaInc.emp_cepempExit(Sender: TObject);
begin
 verificacep( Sender, emp_endemp, emp_ComEmp, emp_Baiemp, edNomCid, edUf, emp_codcid  );
end;

procedure TfrmEmpresaInc.emp_CNPJExit(Sender: TObject);
Var
cNmDataBase: String;
Empresa: TfrmCnpj;

begin

Empresa:= TfrmCnpj.Create;
  if  (emp_CNPJ.Text <> '99999999999999') and (ChkCNPJ(emp_CNPJ.Text)) then Begin
    iF isCNPJ(emp_CNPJ.Text) then Begin

        If Empresa.PagaCnpj(emp_CNPJ.Text)  then Begin
            emp_Tipo.Text:= Empresa.Tipo;
            if Empresa.Abertura <> '' then
               emp_dtAbertura.Date := StrToDate(Empresa.Abertura);

            emp_nome.Text:= Empresa.RazaoSocial;
            if RemoveChar(Empresa.Fantasia) = '' then Begin
                emp_fantasia.Text:= Empresa.RazaoSocial;
            End Else Begin
                emp_fantasia.Text:= Empresa.Fantasia;
            End;
            emp_EndEmp.Text:= Empresa.Endereco;
            emp_NumEmp.Text:= Empresa.Numero;
            emp_ComEmp.Text:= Empresa.Complemento;
            emp_CepEmp.Text:= RemoveChar(Empresa.CEP);
            emp_BaiEmp.Text:= Empresa.Bairro;
            edNomCid.Text:= Empresa.Cidade;
            EdUF.Text:= Empresa.UF;
            emp_Situacao.Text:= Empresa.Situacao;

            if emp_codcid.Text = '' then
               emp_codcid.Text := IntToStr( ChkTabCid( edNomCid.Text, EdUF.Text ) );

            LancBDE();
            emp_Tipo.SetFocus;
        End Else
            emp_CNPJ.setfocus;
    End Else Begin
       ShowMessage('Erro de CNPJ'  );
       emp_CNPJ.SetFocus ;
    End;
  End Else Begin
    if  (emp_CNPJ.Text <> '99999999999999') Then Begin
        emp_CNPJ.SetFocus ;
    End Else Begin
        // Passa
        emp_EndEmp.Text:= 'Endereço';
        emp_NumEmp.Text:= '999';
        emp_ComEmp.Text:= 'Complemento';
        edNomCid.Text:= 'Fortaleza';
        EdUF.Text:= 'CE';
        if emp_codcid.Text = '' then
           emp_codcid.Text := IntToStr( ChkTabCid( edNomCid.Text, EdUF.Text ) );

        LancBDE();
        emp_Tipo.SetFocus;
    End;
  End;

end;

Function  TfrmEmpresaInc.ChkCNPJ(CNPJ: String): Boolean;
Var
SQLQuery1 : TFDQuery;
Begin
  SQLQuery1 := TFDQuery.Create(Nil);
  SQLQuery1.Close;
  SQLQuery1.Connection:= dmEmp.SqlConSis;
  SQLQuery1.Sql.Text  :='Select * FROM "dbconfig".Empresa WHERE cnpj = :cnpj';
  SQLQuery1.ParamByName('cnpj').Text     :=  CNPJ ;
  SQLQuery1.open;
//  dmEmp.SQLQuery1.FieldByName('Nome').ToString
  if ( Not SQLQuery1.Eof ) and (Not CNPJ.IsEmpty)then Begin
     ShowMessage('Já existe um registro com esse CNPJ');
     Result := False;
  End Else begin
     Result := True ;
  End;


End;

procedure TfrmEmpresaInc.emp_codcidExit(Sender: TObject);
Var
Pesquisa : TClasConsulta;
begin

  // Função que confirma os dados relacionados
  Pesquisa := TClasConsulta.Create;
  if  emp_codcid.Text <> '' Then Begin
      Pesquisa.sqlTabela :=  dmEmp.sqlCIdade ;
      edNomCid.Text :=  Pesquisa.Relacao('cidade',emp_codcid,'cid_codigo','cid_nome');
      edUf.Text     :=  Pesquisa.Relacao('cidade',emp_codcid,'cid_codigo','est_uf');
  End;

end;

procedure TfrmEmpresaInc.emp_codcidKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Try
case key of
    VK_END:
      emp_codcidRightButtonClick(Self);
  end;
Finally

End;

end;

procedure TfrmEmpresaInc.emp_codcidRightButtonClick(Sender: TObject);
var
aPcab, aPcam, aFcab, aFcam, aTcam: array of string;
nmNivel: String;
Pesquisa : TClasConsulta;
begin
  // Inniciando o Formulário de Consulta
  Pesquisa := TClasConsulta.Create;
  Pesquisa.dsTabela  :=  dmEmp.dsCidade ;
  Pesquisa.sqlTabela :=  dmEmp.sqlCIdade ;
  Pesquisa.cliTabela :=  dmEmp.cliCIdade ;
  Pesquisa.FrmCons   :=  Screen.ActiveForm ;
  Pesquisa.nmTitulo  := 'Tabela de Cidades';
  Pesquisa.nmTabela  := 'Cidade';
  // Display        campo   cabecalho           get         tan  indices
  Pesquisa.AddReg('cid_codigo','Código'           ,'codcid'    ,5  ,'por Código' );
  Pesquisa.AddReg('cid_nome'  ,'Nome da Cidade'   ,'edNomCId'  ,20 ,'por Cidade' );
  Pesquisa.AddReg('est_uf'    ,'Uf'               ,'edUF'      ,5  ,'por Estado' );
  Pesquisa.acessa(emp_CodCid);
  emp_codcid.text   :=  Pesquisa.RecReg('cid_codigo');
  edNomCId.text :=  Pesquisa.RecReg('cid_nome');
  edUF.text     :=  Pesquisa.RecReg('est_uf');
  Pesquisa.Destroy

 end;

procedure TfrmEmpresaInc.emp_fantasiaExit(Sender: TObject);
begin
  LancBDE();
end;

procedure TfrmEmpresaInc.LancBDE();
var
  cNmDataBase: string;
Begin
   if (emp_fantasia.Text <> '') and (emp_CNPJ.Text <> '') and (dtbase.Text = '') then Begin
      cNmDataBase:=emp_CNPJ.Text+'_'+Copy(emp_fantasia.Text,0,5);
      dtbase.Text := cNmDataBase;
   End Else If (emp_fantasia.Text = '') or (emp_CNPJ.Text = '') Then Begin
      emp_fantasia.SetFocus;
   End;
End;



procedure TfrmEmpresaInc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    frmEmpresaInc := nil ;
    action        := cafree;
end;

procedure TfrmEmpresaInc.FormKeyPress(Sender: TObject; var Key: Char);
begin

  If key = #13 then
  Begin
    //se for, passa o foco para o próximo campo, zerando o valor da variável Key
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;

  IF Key =  #27 then btnSairClick(self);

end;

procedure TfrmEmpresaInc.FormShow(Sender: TObject);
var
i, tmp: Integer;
Pesquisa : TClasConsulta;
MemoryStream  : TMemoryStream;
JPEG          : TJpegImage;
begin
  Util:= TClasseUtil.Create;
  Pesquisa := TClasConsulta.Create;

  // Cor do banner
  Banner.ParentBackGround := False;
  Banner.ParentColor      := False;
  Banner.Brush.Color      := u_funcao.Bronze_Escuro ;

  // Titulos do Banner
  lbCabeca01.Caption    := 'Tabela de Empresas';
  lbCabeca02.Caption    := u_funcao.nmSistema ;
  // Cores - Titulos do Banner
  lbCabeca01.Font.Color := u_funcao.clTit_BCad ;
  lbCabeca02.Font.Color := u_funcao.clTit_BCad ;

  // Gera o Array com os Componentes
  for i := 0 to ComponentCount-1 do begin
      if (Components[i].ClassType <> TLabel ) then
          begin
            //Pega todos o TEduits
            if (Components[i].ClassType = Tedit) and Tedit(Components[i]).Enabled then
                Begin
                   SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := Tedit( Components[i] ) ;
                End;

            If  Components[i].Name = 'emp_codemp' Then
                Begin
                    SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := Tedit( Components[i] ) ;
                End;
            end;


          //Pega todos o TMaskEdit
          if Components[i].ClassType = TMaskEdit then
          Begin
              SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := TMaskEdit( Components[i] ) ;
          End;

          //Pega todos o TComboBox
          if Components[i].ClassType = TComboBox then
          Begin
              SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := TComboBox( Components[i] ) ;
          End;

          //Pega todos o TDateTimePiker
          if Components[i].ClassType = TDateTimePicker then
          Begin
              SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := TDateTimePicker( Components[i] ) ;
          End;

          //Pega todos o TButtonedEdit
          if Components[i].ClassType = TButtonedEdit then
          Begin
              SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := TButtonedEdit( Components[i] ) ;
          End;

          //Pega todos o TImage
          if ( Components[i].ClassType = TImage ) and (  Components[i].Name = 'logo' ) then
          Begin
              SetLength(aEdits,Length(aEdits)+1); aEdits[Length(aEdits) - 1] := TImage( Components[i] ) ;
          End;

  end;

  // Alimenta os componentes com os tamanho dos campos
  for i := 0 to Length(aEdits)-1 do begin
      //     TEdit(aEdits[i]).MaxLength := dmEmp.sqlEmpresa.FieldByName( aEdits[i].name ).Size;
      If aEdits[i].ClassType = Tedit Then
          Begin
              TEdit(aEdits[i]).MaxLength := dmEmp.cliEmpresa.FieldByName( aEdits[i].name ).Size;
          End;

      If aEdits[i].ClassType = TMaskEdit Then
          Begin
              TMaskEdit(aEdits[i]).MaxLength := dmEmp.cliEmpresa.FieldByName( aEdits[i].name ).Size;
          End;

      If aEdits[i].ClassType = TComboBox Then
          Begin
              TComboBox(aEdits[i]).MaxLength := dmEmp.cliEmpresa.FieldByName( aEdits[i].name ).Size;
          End;

      If aEdits[i].ClassType = TDateTimePicker Then
          Begin
              TDateTimePicker(aEdits[i]).Date := dmEmp.cliEmpresa.FieldByName( aEdits[i].name ).Size;
          End;

      If aEdits[i].ClassType = TButtonedEdit Then
          Begin
              TButtonedEdit(aEdits[i]).MaxLength := dmEmp.cliEmpresa.FieldByName( aEdits[i].name ).Size;
          End;


  end;

  nNew := 1;
  // Definindo os Hints dos Botões e Busca dos Relacionamentos
  for i := 0 to ComponentCount-1 do begin
    if (Components[i].ClassType = TButtonedEdit ) then Begin
        if ( TelaP = 'N' ) THEN
           TButtonedEdit(Components[i]).CustomHint :=  fPrincipal.HintBalloo ;

        TButtonedEdit(Components[i]).ShowHint   :=  True;
        TButtonedEdit(Components[i]).Hint       := 'Atenção | Para pesquisar pressione a tecla [END] '+#13#10+' do seu teclado e aparecerá as opções de consulta '+#13#10+' | 256';
        If TButtonedEdit(Components[i]).Text <> '' Then Begin
           TButtonedEdit(Components[i]).OnExit(Self);

        End;
    End;
  end;


  if emp_CNPJ.Enabled then begin
     emp_CNPJ.SetFocus;
  end else
     emp_Nome.SetFocus;
end;

initialization
  RegisterClass(TFrmEmpresaInc);


end.
