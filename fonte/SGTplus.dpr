program SGTplus;

{$R 'WebcamResource.res' 'webcam\WebcamResource.rc'}

uses
  Windows,
  Vcl.Forms,
  SysUtils,
  Controls,
  UCalculadora in 'calculadora\UCalculadora.pas' {frmCalculadora},
  U_Sys in 'U_Sys.pas' {frmSys},
  U_Pesquisa in 'U_Pesquisa.pas' {frmPesquisa},
  U_funcao in 'U_funcao.pas',
  U_INI in 'U_INI.pas' {frmIni},
  U_EMAIL in 'email\U_EMAIL.pas' {Email},
  Vcl.Themes,
  Vcl.Styles,
  U_ClasseUtil in 'U_ClasseUtil.pas',
  EditTuning in 'EditTuning.pas',
  U_EnviaEmail in 'U_EnviaEmail.pas' {frmEnviaEmail},
  POVOADO in 'POVOADO.pas',
  U_MudaSenha in 'U_MudaSenha.pas' {frmMudasenha},
  uSistema in 'uSistema.pas' {fPrincipal},
  camform in 'webcam\camform.pas' {FormWebCam},
  VFrames in 'webcam\Common\VFrames.pas',
  VSample in 'webcam\Common\VSample.pas',
  U_BarraProgresso2 in 'U_BarraProgresso2.pas' {frmProgd},
  Povoar in 'Povoar.pas',
  Wcrypt2 in 'Wcrypt2.pas',
  R_UsuarioSint in 'R_UsuarioSint.pas' {frmRUsuarioSint},
  R_RelCombustiveis in 'R_RelCombustiveis.pas' {frmRelComb},
  U_MarcaInc in 'U_MarcaInc.pas' {frmMarca},
  U_MetodosDialog in 'U_MetodosDialog.pas',
  U_CpfClass in 'U_CpfClass.pas' {frmCpfPesquisa},
  U_Licenc in 'U_Licenc.pas' {frmLicenc},
  U_FuncReg in 'ativa\U_FuncReg.pas',
  uTraducao in 'uTraducao.pas',
  U_PContas in 'U_PContas.pas' {frmPconta},
  U_ClassconsContas in 'U_ClassconsContas.pas' {FormPesqContas},
  U_BancoInc in 'U_BancoInc.pas' {frmBanco},
  U_Upload in 'U_Upload.pas' {frmUpload},
  U_ClassCad in 'U_ClassCad.pas',
  U_ctapagar in 'U_ctapagar.pas' {frmctapg},
  U_baixacnt in 'U_baixacnt.pas' {frmBaixaCnt},
  U_Categoria in 'U_Categoria.pas' {frmCategoria},
  U_Fabricante in 'U_Fabricante.pas' {frmFabricante},
  U_Produto in 'U_Produto.pas' {frmProduto},
  U_TabMulta in 'U_TabMulta.pas' {frmTabmulta},
  U_OrgTrans in 'U_OrgTrans.pas' {frmOrgTrans},
  U_Incerrante in 'U_Incerrante.pas' {frmIncerrante},
  U_CST in 'U_CST.pas' {frmCst},
  U_Atualizador in 'U_Atualizador.pas' {frmAtualizador},
  U_Imposto in 'U_Imposto.pas' {frmImposto},
  U_Multa in 'U_Multa.pas' {frmMulta},
  U_ClassConsMotorista in 'U_ClassConsMotorista.pas' {frmConsMotorista},
  U_ClassAutoriza in 'U_ClassAutoriza.pas' {frmAutoriza},
  U_PneuDimensao in 'U_PneuDimensao.pas' {frmPneuDim},
  U_PneuFabricante in 'U_PneuFabricante.pas' {frmPneuFab},
  U_PneuIventario in 'U_PneuIventario.pas' {frmPneuIve},
  U_pneucmp in 'U_pneucmp.pas' {frmpneucmp},
  U_PneuManutencao in 'U_PneuManutencao.pas' {frmPneuMnt},
  U_grupomnt in 'U_grupomnt.pas' {frmgrupomnt},
  U_Sobre in 'U_Sobre.pas' {frmSobre},
  U_SISTEMA_DADOS in 'U_SISTEMA_DADOS.pas',
  U_Munuitem in 'U_Munuitem.pas' {frmManutitem},
  U_procveic in 'U_procveic.pas' {frmprocveic},
  u_aguarde in 'u_aguarde.pas' {aguarde},
  U_testes in 'U_testes.pas' {frmTestes},
  U_ModeloInc in 'U_ModeloInc.pas' {frmModelo},
  UR_TabDepartamento in 'UR_TabDepartamento.pas' {frmRelTabDepart},
  UR_TabPais in 'UR_TabPais.pas' {frmRelTabPais},
  UR_TabCidade in 'UR_TabCidade.pas' {frmRelTabCidade},
  U_manutencao in 'U_manutencao.pas' {frmmanutcab},
  U_fabricapcs in 'U_fabricapcs.pas' {frmfabricapcs},
  U_tbpecas in 'U_tbpecas.pas' {frmtbpecas},
  U_Monitor in 'U_Monitor.pas' {frmMonitor},
  U_Roteiro in 'U_Roteiro.pas' {frmRoteiro},
  U_chamado in 'U_chamado.pas' {frmChamado},
  U_Oricarga in 'U_Oricarga.pas' {frmoricarga},
  U_trmcoleta in 'U_trmcoleta.pas' {frmTrmColeta},
  U_Navio in 'U_Navio.pas' {frmNavio},
  U_tbrecurso in 'U_tbrecurso.pas' {frmTbRecurso},
  U_ordcoleta in 'U_ordcoleta.pas' {frmordcoleta},
  U_transfin in 'U_transfin.pas' {frmTransfin},
  U_ClassMessage in 'U_ClassMessage.pas',
  UR_TabAcessorio in 'UR_TabAcessorio.pas' {frmRelTabAcessorio},
  UR_CadPesAniversariante in 'UR_CadPesAniversariante.pas' {frmRelCadPesAniverario},
  UR_CadPesHabVencida in 'UR_CadPesHabVencida.pas' {frmRelCadPesHabVen},
  UR_CadFornecedores in 'UR_CadFornecedores.pas' {frmRelCadFornecedores},
  UR_CadVeiculo in 'UR_CadVeiculo.pas' {frmRelCadVeiculo},
  UR_CadVeiculoLota in 'UR_CadVeiculoLota.pas' {frmRelCadVeiLota},
  U_ClassConecte in 'classes\U_ClassConecte.pas',
  U_Splash in 'U_Splash.pas' {FrmSplash},
  U_Login in 'U_Login.pas' {FrmLogin},
  U_CriaBanco in 'U_CriaBanco.pas' {frmCriadb},
  U_dmEmp in 'U_dmEmp.pas' {dmEmp: TDataModule},
  U_ClassConfig in 'modelos\U_ClassConfig.pas',
  U_000MdlForm in 'modelos\U_000MdlForm.pas' {frmModel},
  U_000MdlCrud in 'modelos\U_000MdlCrud.pas' {_frmModeloCrud},
  U_Empresa_ in 'U_Empresa_.pas' {frmEmpresa_},
  U_Grupo_ in 'U_Grupo_.pas' {frmGrupo},
  U_Empresa_Inc in 'U_Empresa_Inc.pas' {frmEmpresaInc},
  U_Nivel in 'U_Nivel.pas' {frmNivel},
  U_SubGrupo in 'U_SubGrupo.pas' {frmSubGrupo},
  U_Usuario in 'U_Usuario.pas' {frmUsuario},
  u_lotadoinc in 'u_lotadoinc.pas' {frmLotado},
  U_CargoInc in 'U_CargoInc.pas' {frmCargo},
  U_Pais in 'U_Pais.pas' {frmPais},
  U_Estado in 'U_Estado.pas' {frmEstado},
  U_GrupoCli in 'U_GrupoCli.pas' {frmGrupocli},
  U_CidadeInc in 'U_CidadeInc.pas' {frmCidade};

{$R *.res}

var
hMutex: THandle;

begin
hMutex := CreateMutex(nil, true, PChar('[{23B1EEFF-4775-4FA9-9C5-6BFEAC48F551}]'));
if (hMutex <> 0) and (GetLastError = 0) then
begin

  FrmSplash := TFrmSplash.Create(nil); // cria a tela de SplashScreen
  FrmSplash.Show; // exibe a tela
  FrmSplash.Update; // atualiza a tela
  Sleep(4000); // mantém a tela aberta por 4 segundos
  FrmSplash.Close; // fecha a tela
  Application.CreateForm(TdmEmp, dmEmp);
  frmLogin := TFrmLogin.Create(nil); // cria o formulário de login
  if FrmLogin.ShowModal = mrOk then // exibe e verifica se o login foi feito corretamente
  begin
    FreeAndNil(FrmLogin); // fecha e libera o formulário de login
    Application.Initialize; // inicializa a aplicação
    Application.MainFormOnTaskbar := True;
    Application.Title := '';
    Application.CreateForm(TfPrincipal, fPrincipal);
  // cria o formulário principal
    Application.Run; // executa a aplicação
  end;

end
else
  mensagem('Já Existe Uma Instância do Aplicativo Rodando...');
end.

