object dmEmp: TdmEmp
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 2228
  Width = 2161
  object SqlConSis: TFDConnection
    Params.Strings = (
      'Database=dbsgt'
      'User_Name=postgres'
      'Password=12936511'
      'Server=127.0.0.1'
      'CharacterSet=WIN1252'
      'DriverID=PG')
    LoginPrompt = False
    AfterConnect = SqlConSisAfterConnect
    BeforeConnect = SqlConSisBeforeConnect
    Left = 32
    Top = 16
  end
  object FDQuery1: TFDQuery
    Connection = SqlConSis
    Left = 864
    Top = 16
  end
  object fdpPostgres: TFDPhysPgDriverLink
    VendorLib = 'C:\Windows\DllSys\libpq.dll'
    Left = 220
    Top = 16
  end
  object fdpMySql: TFDPhysMySQLDriverLink
    Left = 304
    Top = 16
  end
  object fdpFirebird: TFDPhysFBDriverLink
    VendorLib = 'C:\Program Files (x86)\Firebird\Firebird_2_5\bin\fbclient.dll'
    Left = 388
    Top = 16
  end
  object fdpMsSql: TFDPhysMSSQLDriverLink
    ODBCDriver = 'ODBC Driver 11 for SQL Server'
    Left = 472
    Top = 16
  end
  object dsEmpresa: TDataSource
    DataSet = cliEmpresa
    Left = 240
    Top = 318
  end
  object cliEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpresa'
    Left = 168
    Top = 318
    object cliEmpresaemp_codemp: TIntegerField
      FieldName = 'emp_codemp'
      Origin = 'emp_codemp'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cliEmpresaemp_nome: TStringField
      FieldName = 'emp_nome'
      Origin = 'emp_nome'
      Size = 100
    end
    object cliEmpresaemp_fantasia: TStringField
      FieldName = 'emp_fantasia'
      Origin = 'emp_fantasia'
      Size = 70
    end
    object cliEmpresaemp_cnpj: TStringField
      FieldName = 'emp_cnpj'
      Origin = 'emp_cnpj'
      Size = 14
    end
    object cliEmpresaemp_dtbase: TStringField
      FieldName = 'emp_dtbase'
      Origin = 'emp_dtbase'
    end
    object cliEmpresaemp_tipo: TStringField
      FieldName = 'emp_tipo'
      Origin = 'emp_tipo'
    end
    object cliEmpresaemp_situacao: TStringField
      FieldName = 'emp_situacao'
      Origin = 'emp_situacao'
    end
    object cliEmpresaemp_dtabertura: TDateField
      FieldName = 'emp_dtabertura'
      Origin = 'emp_dtabertura'
    end
    object cliEmpresaemp_endemp: TStringField
      FieldName = 'emp_endemp'
      Origin = 'emp_endemp'
      Size = 45
    end
    object cliEmpresaemp_numemp: TStringField
      FieldName = 'emp_numemp'
      Origin = 'emp_numemp'
      Size = 10
    end
    object cliEmpresaemp_comemp: TStringField
      FieldName = 'emp_comemp'
      Origin = 'emp_comemp'
      Size = 50
    end
    object cliEmpresaemp_baiemp: TStringField
      FieldName = 'emp_baiemp'
      Origin = 'emp_baiemp'
      Size = 50
    end
    object cliEmpresaemp_codcid: TIntegerField
      FieldName = 'emp_codcid'
      Origin = 'emp_codcid'
    end
    object cliEmpresaemp_cepemp: TStringField
      FieldName = 'emp_cepemp'
      Origin = 'emp_cepemp'
      Size = 8
    end
    object cliEmpresaemp_telemp: TStringField
      FieldName = 'emp_telemp'
      Origin = 'emp_telemp'
      Size = 11
    end
    object cliEmpresaemp_tl1emp: TStringField
      FieldName = 'emp_tl1emp'
      Origin = 'emp_tl1emp'
      Size = 11
    end
    object cliEmpresaemp_tl2emp: TStringField
      FieldName = 'emp_tl2emp'
      Origin = 'emp_tl2emp'
      Size = 11
    end
    object cliEmpresaemp_faxemp: TStringField
      FieldName = 'emp_faxemp'
      Origin = 'emp_faxemp'
      Size = 11
    end
    object cliEmpresaemp_insces: TStringField
      FieldName = 'emp_insces'
      Origin = 'emp_insces'
    end
    object cliEmpresaemp_inscmu: TStringField
      FieldName = 'emp_inscmu'
      Origin = 'emp_inscmu'
    end
    object cliEmpresaemp_sufram: TStringField
      FieldName = 'emp_sufram'
      Origin = 'emp_sufram'
      Size = 10
    end
    object cliEmpresaemp_codcna: TStringField
      FieldName = 'emp_codcna'
      Origin = 'emp_codcna'
      Size = 7
    end
    object cliEmpresaemp_codcrt: TStringField
      FieldName = 'emp_codcrt'
      Origin = 'emp_codcrt'
      Size = 1
    end
    object cliEmpresaemp_irpj: TBCDField
      FieldName = 'emp_irpj'
      Origin = 'emp_irpj'
      Precision = 5
      Size = 2
    end
    object cliEmpresaemp_pispasep: TBCDField
      FieldName = 'emp_pispasep'
      Origin = 'emp_pispasep'
      Precision = 5
      Size = 2
    end
    object cliEmpresaemp_csll: TBCDField
      FieldName = 'emp_csll'
      Origin = 'emp_csll'
      Precision = 5
      Size = 2
    end
    object cliEmpresaemp_cofins: TBCDField
      FieldName = 'emp_cofins'
      Origin = 'emp_cofins'
      Precision = 5
      Size = 2
    end
    object cliEmpresaemp_inss: TBCDField
      FieldName = 'emp_inss'
      Origin = 'emp_inss'
      Precision = 5
      Size = 2
    end
    object cliEmpresaemp_iss: TBCDField
      FieldName = 'emp_iss'
      Origin = 'emp_iss'
      Precision = 5
      Size = 2
    end
    object cliEmpresaemp_csticms: TStringField
      FieldName = 'emp_csticms'
      Origin = 'emp_csticms'
      Size = 3
    end
    object cliEmpresaemp_cstpis: TStringField
      FieldName = 'emp_cstpis'
      Origin = 'emp_cstpis'
      Size = 3
    end
    object cliEmpresaemp_cstcofins: TStringField
      FieldName = 'emp_cstcofins'
      Origin = 'emp_cstcofins'
      Size = 3
    end
    object cliEmpresaemp_cstipi: TStringField
      FieldName = 'emp_cstipi'
      Origin = 'emp_cstipi'
      Size = 3
    end
    object cliEmpresaemp_natcnpj: TStringField
      FieldName = 'emp_natcnpj'
      Origin = 'emp_natcnpj'
      Size = 2
    end
    object cliEmpresaemp_atvprep: TStringField
      FieldName = 'emp_atvprep'
      Origin = 'emp_atvprep'
      Size = 2
    end
    object cliEmpresaemp_datexe: TDateField
      FieldName = 'emp_datexe'
      Origin = 'emp_datexe'
    end
    object cliEmpresaemp_horexe: TStringField
      FieldName = 'emp_horexe'
      Origin = 'emp_horexe'
      Size = 8
    end
    object cliEmpresaemp_logo: TBlobField
      FieldName = 'emp_logo'
      Origin = 'emp_logo'
    end
    object cliEmpresaemp_site: TStringField
      FieldName = 'emp_site'
      Origin = 'emp_site'
      Size = 100
    end
    object cliEmpresaemp_email: TStringField
      FieldName = 'emp_email'
      Origin = 'emp_email'
      Size = 100
    end
    object cliEmpresaemp_usuinc: TStringField
      FieldName = 'emp_usuinc'
      Origin = 'emp_usuinc'
      Size = 15
    end
    object cliEmpresaemp_datinc: TDateField
      FieldName = 'emp_datinc'
      Origin = 'emp_datinc'
    end
    object cliEmpresaemp_horinc: TStringField
      FieldName = 'emp_horinc'
      Origin = 'emp_horinc'
      Size = 8
    end
    object cliEmpresaemp_usualt: TStringField
      FieldName = 'emp_usualt'
      Origin = 'emp_usualt'
      Size = 15
    end
    object cliEmpresaemp_datalt: TDateField
      FieldName = 'emp_datalt'
      Origin = 'emp_datalt'
    end
    object cliEmpresaemp_horalt: TStringField
      FieldName = 'emp_horalt'
      Origin = 'emp_horalt'
      Size = 8
    end
    object cliEmpresacid_codigo: TIntegerField
      FieldName = 'cid_codigo'
      Origin = 'cid_codigo'
    end
    object cliEmpresacid_cidnum: TStringField
      FieldName = 'cid_cidnum'
      Origin = 'cid_cidnum'
      Size = 8
    end
    object cliEmpresacid_nome: TStringField
      FieldName = 'cid_nome'
      Origin = 'cid_nome'
      Size = 35
    end
    object cliEmpresacid_codest: TIntegerField
      FieldName = 'cid_codest'
      Origin = 'cid_codest'
    end
    object cliEmpresacid_codpai: TIntegerField
      FieldName = 'cid_codpai'
      Origin = 'cid_codpai'
    end
    object cliEmpresacid_usuinc: TStringField
      FieldName = 'cid_usuinc'
      Origin = 'cid_usuinc'
      Size = 15
    end
    object cliEmpresacid_datinc: TDateField
      FieldName = 'cid_datinc'
      Origin = 'cid_datinc'
    end
    object cliEmpresacid_horinc: TStringField
      FieldName = 'cid_horinc'
      Origin = 'cid_horinc'
      Size = 8
    end
    object cliEmpresacid_usualt: TStringField
      FieldName = 'cid_usualt'
      Origin = 'cid_usualt'
      Size = 15
    end
    object cliEmpresacid_datalt: TDateField
      FieldName = 'cid_datalt'
      Origin = 'cid_datalt'
    end
    object cliEmpresacid_horalt: TStringField
      FieldName = 'cid_horalt'
      Origin = 'cid_horalt'
      Size = 8
    end
    object cliEmpresaest_codigo: TIntegerField
      FieldName = 'est_codigo'
      Origin = 'est_codigo'
    end
    object cliEmpresaest_nome: TStringField
      FieldName = 'est_nome'
      Origin = 'est_nome'
      Size = 50
    end
    object cliEmpresaest_uf: TStringField
      FieldName = 'est_uf'
      Origin = 'est_uf'
      Size = 2
    end
    object cliEmpresaest_codpai: TIntegerField
      FieldName = 'est_codpai'
      Origin = 'est_codpai'
    end
    object cliEmpresaest_usuinc: TStringField
      FieldName = 'est_usuinc'
      Origin = 'est_usuinc'
      Size = 15
    end
    object cliEmpresaest_datinc: TDateField
      FieldName = 'est_datinc'
      Origin = 'est_datinc'
    end
    object cliEmpresaest_horinc: TStringField
      FieldName = 'est_horinc'
      Origin = 'est_horinc'
      Size = 8
    end
    object cliEmpresaest_usualt: TStringField
      FieldName = 'est_usualt'
      Origin = 'est_usualt'
      Size = 15
    end
    object cliEmpresaest_datalt: TDateField
      FieldName = 'est_datalt'
      Origin = 'est_datalt'
    end
    object cliEmpresaest_horalt: TStringField
      FieldName = 'est_horalt'
      Origin = 'est_horalt'
      Size = 8
    end
    object cliEmpresapai_codigo: TIntegerField
      FieldName = 'pai_codigo'
      Origin = 'pai_codigo'
    end
    object cliEmpresapai_nome: TStringField
      FieldName = 'pai_nome'
      Origin = 'pai_nome'
      Size = 50
    end
    object cliEmpresapai_usuinc: TStringField
      FieldName = 'pai_usuinc'
      Origin = 'pai_usuinc'
      Size = 15
    end
    object cliEmpresapai_datinc: TDateField
      FieldName = 'pai_datinc'
      Origin = 'pai_datinc'
    end
    object cliEmpresapai_horinc: TStringField
      FieldName = 'pai_horinc'
      Origin = 'pai_horinc'
      Size = 8
    end
    object cliEmpresapai_usualt: TStringField
      FieldName = 'pai_usualt'
      Origin = 'pai_usualt'
      Size = 15
    end
    object cliEmpresapai_datalt: TDateField
      FieldName = 'pai_datalt'
      Origin = 'pai_datalt'
    end
    object cliEmpresapai_horalt: TStringField
      FieldName = 'pai_horalt'
      Origin = 'pai_horalt'
      Size = 8
    end
  end
  object dsCidade: TDataSource
    DataSet = cliCidade
    Left = 240
    Top = 368
  end
  object cliCidade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCidade'
    Left = 168
    Top = 368
    object cliCidadecid_codigo: TIntegerField
      FieldName = 'cid_codigo'
    end
    object cliCidadecid_cidnum: TStringField
      FieldName = 'cid_cidnum'
      Size = 8
    end
    object cliCidadecid_nome: TStringField
      FieldName = 'cid_nome'
      Size = 35
    end
    object cliCidadecid_codest: TIntegerField
      FieldName = 'cid_codest'
    end
    object cliCidadecid_codpai: TIntegerField
      FieldName = 'cid_codpai'
    end
    object cliCidadecid_usuinc: TStringField
      FieldName = 'cid_usuinc'
      Size = 15
    end
    object cliCidadecid_datinc: TDateField
      FieldName = 'cid_datinc'
    end
    object cliCidadecid_horinc: TStringField
      FieldName = 'cid_horinc'
      Size = 8
    end
    object cliCidadecid_usualt: TStringField
      FieldName = 'cid_usualt'
      Size = 15
    end
    object cliCidadecid_datalt: TDateField
      FieldName = 'cid_datalt'
    end
    object cliCidadecid_horalt: TStringField
      FieldName = 'cid_horalt'
      Size = 8
    end
    object cliCidadepai_codigo: TIntegerField
      FieldName = 'pai_codigo'
    end
    object cliCidadepai_nome: TStringField
      FieldName = 'pai_nome'
      Size = 50
    end
    object cliCidadepai_usuinc: TStringField
      FieldName = 'pai_usuinc'
      Size = 15
    end
    object cliCidadepai_datinc: TDateField
      FieldName = 'pai_datinc'
    end
    object cliCidadepai_horinc: TStringField
      FieldName = 'pai_horinc'
      Size = 8
    end
    object cliCidadepai_usualt: TStringField
      FieldName = 'pai_usualt'
      Size = 15
    end
    object cliCidadepai_datalt: TDateField
      FieldName = 'pai_datalt'
    end
    object cliCidadepai_horalt: TStringField
      FieldName = 'pai_horalt'
      Size = 8
    end
    object cliCidadeest_codigo: TIntegerField
      FieldName = 'est_codigo'
    end
    object cliCidadeest_nome: TStringField
      FieldName = 'est_nome'
      Size = 50
    end
    object cliCidadeest_uf: TStringField
      FieldName = 'est_uf'
      Size = 2
    end
    object cliCidadeest_codpai: TIntegerField
      FieldName = 'est_codpai'
    end
    object cliCidadeest_usuinc: TStringField
      FieldName = 'est_usuinc'
      Size = 15
    end
    object cliCidadeest_datinc: TDateField
      FieldName = 'est_datinc'
    end
    object cliCidadeest_horinc: TStringField
      FieldName = 'est_horinc'
      Size = 8
    end
    object cliCidadeest_usualt: TStringField
      FieldName = 'est_usualt'
      Size = 15
    end
    object cliCidadeest_datalt: TDateField
      FieldName = 'est_datalt'
    end
    object cliCidadeest_horalt: TStringField
      FieldName = 'est_horalt'
      Size = 8
    end
  end
  object dspCidade: TDataSetProvider
    DataSet = sqlCidade
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 96
    Top = 368
  end
  object dsUsuario: TDataSource
    DataSet = cliUsuario
    Left = 240
    Top = 152
  end
  object cliUsuario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsuario'
    Left = 168
    Top = 152
    object cliUsuariousu_codusu: TIntegerField
      FieldName = 'usu_codusu'
      Origin = 'usu_codusu'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cliUsuariousu_nome: TStringField
      FieldName = 'usu_nome'
      Origin = 'usu_nome'
      Size = 50
    end
    object cliUsuariousu_login: TStringField
      FieldName = 'usu_login'
      Origin = 'usu_login'
      Size = 15
    end
    object cliUsuariousu_senha: TStringField
      FieldName = 'usu_senha'
      Origin = 'usu_senha'
      Size = 10
    end
    object cliUsuariousu_codgru: TIntegerField
      FieldName = 'usu_codgru'
      Origin = 'usu_codgru'
    end
    object cliUsuariousu_codsgr: TIntegerField
      FieldName = 'usu_codsgr'
      Origin = 'usu_codsgr'
    end
    object cliUsuariousu_codltd: TIntegerField
      FieldName = 'usu_codltd'
      Origin = 'usu_codltd'
    end
    object cliUsuariousu_email: TStringField
      FieldName = 'usu_email'
      Origin = 'usu_email'
      Size = 100
    end
    object cliUsuariousu_usuario: TStringField
      FieldName = 'usu_usuario'
      Origin = 'usu_usuario'
      Size = 100
    end
    object cliUsuariousu_senema: TStringField
      FieldName = 'usu_senema'
      Origin = 'usu_senema'
    end
    object cliUsuariousu_smtp: TStringField
      FieldName = 'usu_smtp'
      Origin = 'usu_smtp'
      Size = 100
    end
    object cliUsuariousu_porta: TStringField
      FieldName = 'usu_porta'
      Origin = 'usu_porta'
      Size = 5
    end
    object cliUsuariousu_tsl: TStringField
      FieldName = 'usu_tsl'
      Origin = 'usu_tsl'
      Size = 15
    end
    object cliUsuariousu_metodo: TStringField
      FieldName = 'usu_metodo'
      Origin = 'usu_metodo'
      Size = 15
    end
    object cliUsuariousu_modseg: TStringField
      FieldName = 'usu_modseg'
      Origin = 'usu_modseg'
      FixedChar = True
      Size = 1
    end
    object cliUsuariousu_autent: TStringField
      FieldName = 'usu_autent'
      Origin = 'usu_autent'
      FixedChar = True
      Size = 1
    end
    object cliUsuariousu_foto: TBlobField
      FieldName = 'usu_foto'
      Origin = 'usu_foto'
    end
    object cliUsuariousu_database: TStringField
      FieldName = 'usu_database'
      Origin = 'usu_database'
      Size = 70
    end
    object cliUsuariousu_autoriza: TBooleanField
      FieldName = 'usu_autoriza'
      Origin = 'usu_autoriza'
    end
    object cliUsuariousu_usuinc: TStringField
      FieldName = 'usu_usuinc'
      Origin = 'usu_usuinc'
      Size = 15
    end
    object cliUsuariousu_datinc: TDateField
      FieldName = 'usu_datinc'
      Origin = 'usu_datinc'
    end
    object cliUsuariousu_horinc: TStringField
      FieldName = 'usu_horinc'
      Origin = 'usu_horinc'
      Size = 8
    end
    object cliUsuariousu_usualt: TStringField
      FieldName = 'usu_usualt'
      Origin = 'usu_usualt'
      Size = 15
    end
    object cliUsuariousu_datalt: TDateField
      FieldName = 'usu_datalt'
      Origin = 'usu_datalt'
    end
    object cliUsuariousu_horalt: TStringField
      FieldName = 'usu_horalt'
      Origin = 'usu_horalt'
      Size = 8
    end
  end
  object dspUsuario: TDataSetProvider
    DataSet = sqlUsuario
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 96
    Top = 152
  end
  object dspAuditor: TDataSetProvider
    DataSet = sqlAuditor
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 96
    Top = 424
  end
  object cliAuditor: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAuditor'
    Left = 168
    Top = 424
    object cliAuditoradt_codaud: TIntegerField
      FieldName = 'adt_codaud'
      Origin = 'adt_codaud'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cliAuditoradt_usuario: TStringField
      FieldName = 'adt_usuario'
      Origin = 'adt_usuario'
      Size = 15
    end
    object cliAuditoradt_modulo: TStringField
      FieldName = 'adt_modulo'
      Origin = 'adt_modulo'
      Size = 150
    end
    object cliAuditoradt_acao: TStringField
      FieldName = 'adt_acao'
      Origin = 'adt_acao'
      Size = 150
    end
    object cliAuditoradt_obs: TStringField
      FieldName = 'adt_obs'
      Origin = 'adt_obs'
      Size = 80
    end
    object cliAuditoradt_dtacao: TDateField
      FieldName = 'adt_dtacao'
      Origin = 'adt_dtacao'
    end
    object cliAuditoradt_hracao: TStringField
      FieldName = 'adt_hracao'
      Origin = 'adt_hracao'
      Size = 8
    end
    object cliAuditoradt_dtbase: TStringField
      FieldName = 'adt_dtbase'
      Origin = 'adt_dtbase'
    end
    object cliAuditoradt_codemp: TIntegerField
      FieldName = 'adt_codemp'
      Origin = 'adt_codemp'
    end
    object cliAuditoradt_codusu: TIntegerField
      FieldName = 'adt_codusu'
      Origin = 'adt_codusu'
    end
  end
  object dsAuditor: TDataSource
    DataSet = cliAuditor
    Left = 240
    Top = 424
  end
  object dsPermissao: TDataSource
    DataSet = cliPermissao
    Left = 240
    Top = 488
  end
  object dsplPermissao: TDataSetProvider
    DataSet = sqlPermissao
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 96
    Top = 488
  end
  object cliPermissao: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dsplPermissao'
    Left = 168
    Top = 488
    object cliPermissaoprm_codper: TIntegerField
      FieldName = 'prm_codper'
    end
    object cliPermissaoprm_codusu: TIntegerField
      FieldName = 'prm_codusu'
    end
    object cliPermissaoprm_codniv: TIntegerField
      FieldName = 'prm_codniv'
    end
    object cliPermissaoprm_codgru: TIntegerField
      FieldName = 'prm_codgru'
    end
    object cliPermissaoprm_formda: TStringField
      FieldName = 'prm_formda'
    end
    object cliPermissaoprm_titulo: TStringField
      FieldName = 'prm_titulo'
      Size = 35
    end
    object cliPermissaoprm_modl: TStringField
      FieldName = 'prm_modl'
      Size = 1
    end
    object cliPermissaoprm_lei: TBooleanField
      FieldName = 'prm_lei'
    end
    object cliPermissaoprm_gra: TBooleanField
      FieldName = 'prm_gra'
    end
    object cliPermissaoprm_alt: TBooleanField
      FieldName = 'prm_alt'
    end
    object cliPermissaoprm_exc: TBooleanField
      FieldName = 'prm_exc'
    end
    object cliPermissaoprm_usuinc: TStringField
      FieldName = 'prm_usuinc'
      Size = 15
    end
    object cliPermissaoprm_datinc: TDateField
      FieldName = 'prm_datinc'
    end
    object cliPermissaoprm_horinc: TStringField
      FieldName = 'prm_horinc'
      Size = 8
    end
    object cliPermissaoprm_usualt: TStringField
      FieldName = 'prm_usualt'
      Size = 15
    end
    object cliPermissaoprm_datalt: TDateField
      FieldName = 'prm_datalt'
    end
    object cliPermissaoprm_horalt: TStringField
      FieldName = 'prm_horalt'
      Size = 8
    end
  end
  object dspEmpresa: TDataSetProvider
    DataSet = sqlEmpresa
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 96
    Top = 318
  end
  object dspConfigura: TDataSetProvider
    DataSet = sqlConfigura
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 96
    Top = 544
  end
  object cliConfigura: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspConfigura'
    Left = 168
    Top = 544
    object cliConfiguracfg_codigo: TIntegerField
      FieldName = 'cfg_codigo'
    end
    object cliConfiguracfg_empresa: TStringField
      FieldName = 'cfg_empresa'
      Size = 61
    end
    object cliConfiguracfg_fantasia: TStringField
      FieldName = 'cfg_fantasia'
      Size = 50
    end
    object cliConfiguracfg_cnpj: TStringField
      FieldName = 'cfg_cnpj'
      Size = 15
    end
    object cliConfiguracfg_endereco: TStringField
      FieldName = 'cfg_endereco'
      Size = 30
    end
    object cliConfiguracfg_numero: TStringField
      FieldName = 'cfg_numero'
      Size = 5
    end
    object cliConfiguracfg_comple: TStringField
      FieldName = 'cfg_comple'
    end
    object cliConfiguracfg_bairro: TStringField
      FieldName = 'cfg_bairro'
      Size = 50
    end
    object cliConfiguracfg_codcid: TIntegerField
      FieldName = 'cfg_codcid'
    end
    object cliConfiguracfg_telef1: TStringField
      FieldName = 'cfg_telef1'
      Size = 10
    end
    object cliConfiguracfg_telef2: TStringField
      FieldName = 'cfg_telef2'
      Size = 10
    end
    object cliConfiguracfg_cep: TStringField
      FieldName = 'cfg_cep'
      Size = 8
    end
    object cliConfiguracfg_site: TStringField
      FieldName = 'cfg_site'
      Size = 100
    end
    object cliConfiguracfg_email: TStringField
      FieldName = 'cfg_email'
      Size = 100
    end
    object cliConfiguracfg_conexao: TStringField
      FieldName = 'cfg_conexao'
      Size = 50
    end
    object cliConfiguracfg_usucon: TStringField
      FieldName = 'cfg_usucon'
      Size = 50
    end
    object cliConfiguracfg_sencon: TStringField
      FieldName = 'cfg_sencon'
      Size = 50
    end
    object cliConfiguracfg_portacon: TStringField
      FieldName = 'cfg_portacon'
      Size = 4
    end
    object cliConfiguracfg_hostcon: TStringField
      FieldName = 'cfg_hostcon'
      Size = 50
    end
    object cliConfiguracfg_autenticon: TStringField
      FieldName = 'cfg_autenticon'
      FixedChar = True
      Size = 1
    end
    object cliConfiguracfg_seguricon: TStringField
      FieldName = 'cfg_seguricon'
      FixedChar = True
      Size = 1
    end
    object cliConfiguracfg_tsl: TStringField
      FieldName = 'cfg_tsl'
      Size = 15
    end
    object cliConfiguracfg_metodo: TStringField
      FieldName = 'cfg_metodo'
      Size = 15
    end
    object cliConfiguracfg_foto: TBlobField
      FieldName = 'cfg_foto'
    end
    object cliConfiguracfg_ofctransf: TMemoField
      FieldName = 'cfg_ofctransf'
      BlobType = ftMemo
    end
    object cliConfiguracfg_qtdprc: TStringField
      FieldName = 'cfg_qtdprc'
      Size = 2
    end
    object cliConfiguracfg_new: TStringField
      FieldName = 'cfg_new'
      Size = 15
    end
    object cliConfiguracfg_endtablic: TStringField
      FieldName = 'cfg_endtablic'
      Size = 150
    end
    object cliConfiguracfg_datexe: TDateField
      FieldName = 'cfg_datexe'
    end
    object cliConfiguracfg_horexe: TStringField
      FieldName = 'cfg_horexe'
      Size = 8
    end
    object cliConfiguracfg_usuinc: TStringField
      FieldName = 'cfg_usuinc'
      Size = 15
    end
    object cliConfiguracfg_datinc: TDateField
      FieldName = 'cfg_datinc'
    end
    object cliConfiguracfg_matcon: TStringField
      FieldName = 'cfg_matcon'
      Size = 10
    end
    object cliConfiguracfg_mencon: TStringField
      FieldName = 'cfg_mencon'
      Size = 10
    end
    object cliConfiguracfg_mtrcon: TStringField
      FieldName = 'cfg_mtrcon'
      Size = 10
    end
    object cliConfiguracfg_mntcnt: TStringField
      FieldName = 'cfg_mntcnt'
      Size = 3
    end
    object cliConfiguracfg_mntimpr: TStringField
      FieldName = 'cfg_mntimpr'
      FixedChar = True
      Size = 1
    end
    object cliConfiguracfg_totpar: TStringField
      FieldName = 'cfg_totpar'
      Size = 3
    end
    object cliConfiguracfg_atcpf: TStringField
      FieldName = 'cfg_atcpf'
      FixedChar = True
      Size = 1
    end
    object cliConfiguracfg_atcnpj: TStringField
      FieldName = 'cfg_atcnpj'
      FixedChar = True
      Size = 1
    end
    object cliConfiguracfg_atcep: TStringField
      FieldName = 'cfg_atcep'
      FixedChar = True
      Size = 1
    end
    object cliConfiguracfg_kmveri: TBCDField
      FieldName = 'cfg_kmveri'
      Precision = 7
      Size = 0
    end
  end
  object dsConfigura: TDataSource
    DataSet = cliConfigura
    Left = 240
    Top = 544
  end
  object dspGrupo: TDataSetProvider
    DataSet = sqlGrupo
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 96
    Top = 600
  end
  object cliGrupo: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspGrupo'
    Left = 168
    Top = 600
    object cliGrupogru_codigo: TIntegerField
      FieldName = 'gru_codigo'
    end
    object cliGrupogru_grupo: TStringField
      FieldName = 'gru_grupo'
    end
    object cliGrupogru_usuinc: TStringField
      FieldName = 'gru_usuinc'
      Size = 15
    end
    object cliGrupogru_datinc: TDateField
      FieldName = 'gru_datinc'
    end
    object cliGrupogru_horinc: TStringField
      FieldName = 'gru_horinc'
      Size = 8
    end
    object cliGrupogru_usualt: TStringField
      FieldName = 'gru_usualt'
      Size = 15
    end
    object cliGrupogru_datalt: TDateField
      FieldName = 'gru_datalt'
    end
    object cliGrupogru_horalt: TStringField
      FieldName = 'gru_horalt'
      Size = 8
    end
  end
  object dsGrupo: TDataSource
    DataSet = cliGrupo
    Left = 240
    Top = 600
  end
  object dspAcesso: TDataSetProvider
    DataSet = sqlAcesso
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 96
    Top = 710
  end
  object cliAcesso: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    CommandText = 'Select * From  mdoacesso'
    Params = <>
    ProviderName = 'dspAcesso'
    Left = 168
    Top = 710
  end
  object dsAcesso: TDataSource
    DataSet = cliAcesso
    Left = 240
    Top = 710
  end
  object dspNivel: TDataSetProvider
    DataSet = sqlNivel
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 96
    Top = 766
  end
  object cliNivel: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspNivel'
    Left = 168
    Top = 766
    object cliNivelniv_codigo: TIntegerField
      FieldName = 'niv_codigo'
    end
    object cliNivelniv_nivel: TStringField
      FieldName = 'niv_nivel'
    end
    object cliNivelniv_usuinc: TStringField
      FieldName = 'niv_usuinc'
      Size = 15
    end
    object cliNivelniv_datinc: TDateField
      FieldName = 'niv_datinc'
    end
    object cliNivelniv_horinc: TStringField
      FieldName = 'niv_horinc'
      Size = 8
    end
    object cliNivelniv_usualt: TStringField
      FieldName = 'niv_usualt'
      Size = 15
    end
    object cliNivelniv_datalt: TDateField
      FieldName = 'niv_datalt'
    end
    object cliNivelniv_horalt: TStringField
      FieldName = 'niv_horalt'
      Size = 8
    end
  end
  object dsNivel: TDataSource
    DataSet = cliNivel
    Left = 240
    Top = 766
  end
  object dspNivAces: TDataSetProvider
    DataSet = sqlNivAces
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 96
    Top = 822
  end
  object cliNivAces: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspNivAces'
    Left = 168
    Top = 826
    object cliNivAcesnva_codigo: TIntegerField
      FieldName = 'nva_codigo'
      Origin = 'nva_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cliNivAcesnva_codniv: TIntegerField
      FieldName = 'nva_codniv'
      Origin = 'nva_codniv'
    end
    object cliNivAcesnva_formda: TStringField
      FieldName = 'nva_formda'
      Origin = 'nva_formda'
    end
    object cliNivAcesnva_titulo: TStringField
      FieldName = 'nva_titulo'
      Origin = 'nva_titulo'
      Size = 35
    end
    object cliNivAcesnva_modl: TStringField
      FieldName = 'nva_modl'
      Origin = 'nva_modl'
      Size = 1
    end
    object cliNivAcesnva_lei: TBooleanField
      FieldName = 'nva_lei'
      Origin = 'nva_lei'
    end
    object cliNivAcesnva_gra: TBooleanField
      FieldName = 'nva_gra'
      Origin = 'nva_gra'
    end
    object cliNivAcesnva_alt: TBooleanField
      FieldName = 'nva_alt'
      Origin = 'nva_alt'
    end
    object cliNivAcesnva_exc: TBooleanField
      FieldName = 'nva_exc'
      Origin = 'nva_exc'
    end
    object cliNivAcesnva_usuinc: TStringField
      FieldName = 'nva_usuinc'
      Origin = 'nva_usuinc'
      Size = 15
    end
    object cliNivAcesnva_datinc: TDateField
      FieldName = 'nva_datinc'
      Origin = 'nva_datinc'
    end
    object cliNivAcesnva_horinc: TStringField
      FieldName = 'nva_horinc'
      Origin = 'nva_horinc'
      Size = 8
    end
    object cliNivAcesnva_usualt: TStringField
      FieldName = 'nva_usualt'
      Origin = 'nva_usualt'
      Size = 15
    end
    object cliNivAcesnva_datalt: TDateField
      FieldName = 'nva_datalt'
      Origin = 'nva_datalt'
    end
    object cliNivAcesnva_horalt: TStringField
      FieldName = 'nva_horalt'
      Origin = 'nva_horalt'
      Size = 8
    end
  end
  object dsNivAces: TDataSource
    DataSet = cliNivAces
    Left = 240
    Top = 822
  end
  object dspUsuCaixa: TDataSetProvider
    DataSet = sqlUsuCaixa
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 96
    Top = 208
  end
  object cliUsuCaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsuCaixa'
    Left = 168
    Top = 208
    object cliUsuCaixause_codeus: TIntegerField
      FieldName = 'use_codeus'
    end
    object cliUsuCaixause_codemp: TIntegerField
      FieldName = 'use_codemp'
    end
    object cliUsuCaixause_codusu: TIntegerField
      FieldName = 'use_codusu'
    end
    object cliUsuCaixause_usuinc: TStringField
      FieldName = 'use_usuinc'
      Size = 15
    end
    object cliUsuCaixause_datinc: TDateField
      FieldName = 'use_datinc'
    end
    object cliUsuCaixause_horinc: TStringField
      FieldName = 'use_horinc'
      Size = 8
    end
    object cliUsuCaixause_usualt: TStringField
      FieldName = 'use_usualt'
      Size = 15
    end
    object cliUsuCaixause_datalt: TDateField
      FieldName = 'use_datalt'
    end
    object cliUsuCaixause_horalt: TStringField
      FieldName = 'use_horalt'
      Size = 8
    end
  end
  object dsUsuCaixa: TDataSource
    DataSet = cliUsuCaixa
    Left = 240
    Top = 208
  end
  object dspUsuEmp: TDataSetProvider
    DataSet = sqlUsuEmp
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 96
    Top = 264
  end
  object dsUsuEmp: TDataSource
    DataSet = cliUsuEmp
    Left = 240
    Top = 264
  end
  object cliUsuEmp: TClientDataSet
    Aggregates = <>
    CommandText = 'Select * From "dbconfig".usuempresa'
    Params = <>
    ProviderName = 'dspUsuEmp'
    Left = 168
    Top = 264
    object cliUsuEmpuse_codeus: TIntegerField
      FieldName = 'use_codeus'
    end
    object cliUsuEmpuse_codemp: TIntegerField
      FieldName = 'use_codemp'
    end
    object cliUsuEmpuse_codusu: TIntegerField
      FieldName = 'use_codusu'
    end
    object cliUsuEmpuse_usuinc: TStringField
      FieldName = 'use_usuinc'
      Size = 15
    end
    object cliUsuEmpuse_datinc: TDateField
      FieldName = 'use_datinc'
    end
    object cliUsuEmpuse_horinc: TStringField
      FieldName = 'use_horinc'
      Size = 8
    end
    object cliUsuEmpuse_usualt: TStringField
      FieldName = 'use_usualt'
      Size = 15
    end
    object cliUsuEmpuse_datalt: TDateField
      FieldName = 'use_datalt'
    end
    object cliUsuEmpuse_horalt: TStringField
      FieldName = 'use_horalt'
      Size = 8
    end
  end
  object dspComb: TDataSetProvider
    DataSet = sqlComb
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 880
  end
  object cliComb: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspComb'
    Left = 170
    Top = 880
    object cliCombcmb_codigo: TIntegerField
      FieldName = 'cmb_codigo'
    end
    object cliCombcmb_nome: TStringField
      FieldName = 'cmb_nome'
    end
    object cliCombcmb_usuinc: TStringField
      FieldName = 'cmb_usuinc'
      Size = 15
    end
    object cliCombcmb_datinc: TDateField
      FieldName = 'cmb_datinc'
    end
    object cliCombcmb_horinc: TStringField
      FieldName = 'cmb_horinc'
      Size = 8
    end
    object cliCombcmb_usualt: TStringField
      FieldName = 'cmb_usualt'
      Size = 15
    end
    object cliCombcmb_datalt: TDateField
      FieldName = 'cmb_datalt'
    end
    object cliCombcmb_horalt: TStringField
      FieldName = 'cmb_horalt'
      Size = 8
    end
  end
  object dsComb: TDataSource
    DataSet = cliComb
    Left = 242
    Top = 880
  end
  object dspMarca: TDataSetProvider
    DataSet = sqlMarca
    UpdateMode = upWhereKeyOnly
    Left = 408
    Top = 152
  end
  object cliMarca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMarca'
    Left = 480
    Top = 152
    object cliMarcamrc_codigo: TIntegerField
      FieldName = 'mrc_codigo'
    end
    object cliMarcamrc_nome: TStringField
      FieldName = 'mrc_nome'
      Size = 25
    end
    object cliMarcamrc_usuinc: TStringField
      FieldName = 'mrc_usuinc'
      Size = 15
    end
    object cliMarcamrc_datinc: TDateField
      FieldName = 'mrc_datinc'
    end
    object cliMarcamrc_horinc: TStringField
      FieldName = 'mrc_horinc'
      Size = 8
    end
    object cliMarcamrc_usualt: TStringField
      FieldName = 'mrc_usualt'
      Size = 15
    end
    object cliMarcamrc_datalt: TDateField
      FieldName = 'mrc_datalt'
    end
    object cliMarcamrc_horalt: TStringField
      FieldName = 'mrc_horalt'
      Size = 8
    end
  end
  object dsMarca: TDataSource
    DataSet = cliMarca
    Left = 552
    Top = 152
  end
  object dspModelo: TDataSetProvider
    DataSet = sqlModelo
    UpdateMode = upWhereKeyOnly
    Left = 408
    Top = 208
  end
  object cliModelo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspModelo'
    Left = 480
    Top = 208
    object cliModelomdl_codigo: TIntegerField
      FieldName = 'mdl_codigo'
    end
    object cliModelomdl_nome: TStringField
      FieldName = 'mdl_nome'
      Size = 25
    end
    object cliModelomdl_codfip: TStringField
      FieldName = 'mdl_codfip'
      Size = 10
    end
    object cliModelomdl_codmrc: TIntegerField
      FieldName = 'mdl_codmrc'
    end
    object cliModelomdl_codgrm: TIntegerField
      FieldName = 'mdl_codgrm'
    end
    object cliModelomdl_usuinc: TStringField
      FieldName = 'mdl_usuinc'
      Size = 15
    end
    object cliModelomdl_datinc: TDateField
      FieldName = 'mdl_datinc'
    end
    object cliModelomdl_horinc: TStringField
      FieldName = 'mdl_horinc'
      Size = 8
    end
    object cliModelomdl_usualt: TStringField
      FieldName = 'mdl_usualt'
      Size = 15
    end
    object cliModelomdl_datalt: TDateField
      FieldName = 'mdl_datalt'
    end
    object cliModelomdl_horalt: TStringField
      FieldName = 'mdl_horalt'
      Size = 8
    end
    object cliModelomrc_codigo: TIntegerField
      FieldName = 'mrc_codigo'
    end
    object cliModelomrc_nome: TStringField
      FieldName = 'mrc_nome'
      Size = 25
    end
    object cliModelomrc_usuinc: TStringField
      FieldName = 'mrc_usuinc'
      Size = 15
    end
    object cliModelomrc_datinc: TDateField
      FieldName = 'mrc_datinc'
    end
    object cliModelomrc_horinc: TStringField
      FieldName = 'mrc_horinc'
      Size = 8
    end
    object cliModelomrc_usualt: TStringField
      FieldName = 'mrc_usualt'
      Size = 15
    end
    object cliModelomrc_datalt: TDateField
      FieldName = 'mrc_datalt'
    end
    object cliModelomrc_horalt: TStringField
      FieldName = 'mrc_horalt'
      Size = 8
    end
    object cliModelogrm_codigo: TIntegerField
      FieldName = 'grm_codigo'
    end
    object cliModelogrm_nome: TStringField
      FieldName = 'grm_nome'
      Size = 40
    end
    object cliModelogrm_usuinc: TStringField
      FieldName = 'grm_usuinc'
      Size = 15
    end
    object cliModelogrm_datinc: TDateField
      FieldName = 'grm_datinc'
    end
    object cliModelogrm_horinc: TStringField
      FieldName = 'grm_horinc'
      Size = 8
    end
    object cliModelogrm_usualt: TStringField
      FieldName = 'grm_usualt'
      Size = 15
    end
    object cliModelogrm_datalt: TDateField
      FieldName = 'grm_datalt'
    end
    object cliModelogrm_horalt: TStringField
      FieldName = 'grm_horalt'
      Size = 8
    end
  end
  object dsModelo: TDataSource
    DataSet = cliModelo
    Left = 552
    Top = 208
  end
  object dspAcessorio: TDataSetProvider
    DataSet = sqlAcessorio
    UpdateMode = upWhereKeyOnly
    Left = 408
    Top = 311
  end
  object cliAcessorio: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAcessorio'
    Left = 480
    Top = 311
    object cliAcessorioacs_codigo: TIntegerField
      FieldName = 'acs_codigo'
    end
    object cliAcessorioacs_nome: TStringField
      FieldName = 'acs_nome'
      Size = 25
    end
    object cliAcessorioacs_usuinc: TStringField
      FieldName = 'acs_usuinc'
      Size = 15
    end
    object cliAcessorioacs_datinc: TDateField
      FieldName = 'acs_datinc'
    end
    object cliAcessorioacs_horinc: TStringField
      FieldName = 'acs_horinc'
      Size = 8
    end
    object cliAcessorioacs_usualt: TStringField
      FieldName = 'acs_usualt'
      Size = 15
    end
    object cliAcessorioacs_datalt: TDateField
      FieldName = 'acs_datalt'
    end
    object cliAcessorioacs_horalt: TStringField
      FieldName = 'acs_horalt'
      Size = 8
    end
  end
  object dsAcessorio: TDataSource
    DataSet = cliAcessorio
    Left = 552
    Top = 311
  end
  object dspTipo: TDataSetProvider
    DataSet = sqlTipo
    UpdateMode = upWhereKeyOnly
    Left = 408
    Top = 367
  end
  object cliTipo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipo'
    Left = 480
    Top = 367
    object cliTipotip_codigo: TIntegerField
      FieldName = 'tip_codigo'
    end
    object cliTipotip_nome: TStringField
      FieldName = 'tip_nome'
      Size = 25
    end
    object cliTipotip_teixo: TBCDField
      FieldName = 'tip_teixo'
      Precision = 1
      Size = 0
    end
    object cliTipotip_usuinc: TStringField
      FieldName = 'tip_usuinc'
      Size = 15
    end
    object cliTipotip_step: TBCDField
      FieldName = 'tip_step'
      Precision = 1
      Size = 0
    end
    object cliTipotip_tipo: TStringField
      FieldName = 'tip_tipo'
      Size = 15
    end
    object cliTipotip_trac: TStringField
      FieldName = 'tip_trac'
      Size = 15
    end
    object cliTipotip_datinc: TDateField
      FieldName = 'tip_datinc'
    end
    object cliTipotip_horinc: TStringField
      FieldName = 'tip_horinc'
      Size = 8
    end
    object cliTipotip_usualt: TStringField
      FieldName = 'tip_usualt'
      Size = 15
    end
    object cliTipotip_datalt: TDateField
      FieldName = 'tip_datalt'
    end
    object cliTipotip_horalt: TStringField
      FieldName = 'tip_horalt'
      Size = 8
    end
  end
  object dsTipo: TDataSource
    DataSet = cliTipo
    Left = 552
    Top = 367
  end
  object dspLotado: TDataSetProvider
    DataSet = sqlLotado
    UpdateMode = upWhereKeyOnly
    Left = 408
    Top = 423
  end
  object cliLotado: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLotado'
    Left = 480
    Top = 423
    object cliLotadoltd_codigo: TIntegerField
      FieldName = 'ltd_codigo'
    end
    object cliLotadoltd_nome: TStringField
      FieldName = 'ltd_nome'
      Size = 35
    end
    object cliLotadoltd_sigla: TStringField
      FieldName = 'ltd_sigla'
      Size = 5
    end
    object cliLotadoltd_endereco: TStringField
      FieldName = 'ltd_endereco'
      Size = 35
    end
    object cliLotadoltd_numend: TStringField
      FieldName = 'ltd_numend'
      Size = 5
    end
    object cliLotadoltd_complem: TStringField
      FieldName = 'ltd_complem'
      Size = 25
    end
    object cliLotadoltd_bairro: TStringField
      FieldName = 'ltd_bairro'
      Size = 50
    end
    object cliLotadoltd_cep: TStringField
      FieldName = 'ltd_cep'
      Size = 8
    end
    object cliLotadoltd_codcid: TIntegerField
      FieldName = 'ltd_codcid'
    end
    object cliLotadoltd_telef1: TStringField
      FieldName = 'ltd_telef1'
      Size = 12
    end
    object cliLotadoltd_telef2: TStringField
      FieldName = 'ltd_telef2'
      Size = 12
    end
    object cliLotadoltd_celula: TStringField
      FieldName = 'ltd_celula'
      Size = 12
    end
    object cliLotadoltd_usuinc: TStringField
      FieldName = 'ltd_usuinc'
      Size = 15
    end
    object cliLotadoltd_datinc: TDateField
      FieldName = 'ltd_datinc'
    end
    object cliLotadoltd_horinc: TStringField
      FieldName = 'ltd_horinc'
      Size = 8
    end
    object cliLotadoltd_usualt: TStringField
      FieldName = 'ltd_usualt'
      Size = 15
    end
    object cliLotadoltd_datalt: TDateField
      FieldName = 'ltd_datalt'
    end
    object cliLotadoltd_horalt: TStringField
      FieldName = 'ltd_horalt'
      Size = 8
    end
    object cliLotadocid_codigo: TIntegerField
      FieldName = 'cid_codigo'
    end
    object cliLotadocid_cidnum: TStringField
      FieldName = 'cid_cidnum'
      Size = 8
    end
    object cliLotadocid_nome: TStringField
      FieldName = 'cid_nome'
      Size = 35
    end
    object cliLotadocid_codest: TIntegerField
      FieldName = 'cid_codest'
    end
    object cliLotadocid_codpai: TIntegerField
      FieldName = 'cid_codpai'
    end
    object cliLotadocid_usuinc: TStringField
      FieldName = 'cid_usuinc'
      Size = 15
    end
    object cliLotadocid_datinc: TDateField
      FieldName = 'cid_datinc'
    end
    object cliLotadocid_horinc: TStringField
      FieldName = 'cid_horinc'
      Size = 8
    end
    object cliLotadocid_usualt: TStringField
      FieldName = 'cid_usualt'
      Size = 15
    end
    object cliLotadocid_datalt: TDateField
      FieldName = 'cid_datalt'
    end
    object cliLotadocid_horalt: TStringField
      FieldName = 'cid_horalt'
      Size = 8
    end
  end
  object dsLotado: TDataSource
    DataSet = cliLotado
    Left = 552
    Top = 423
  end
  object dspCor: TDataSetProvider
    DataSet = sqlCor
    UpdateMode = upWhereKeyOnly
    Left = 408
    Top = 479
  end
  object cliCor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCor'
    Left = 480
    Top = 479
    object cliCorcor_codigo: TIntegerField
      FieldName = 'cor_codigo'
    end
    object cliCorcor_nome: TStringField
      FieldName = 'cor_nome'
      Size = 35
    end
    object cliCorcor_usuinc: TStringField
      FieldName = 'cor_usuinc'
      Size = 15
    end
    object cliCorcor_datinc: TDateField
      FieldName = 'cor_datinc'
    end
    object cliCorcor_horinc: TStringField
      FieldName = 'cor_horinc'
      Size = 8
    end
    object cliCorcor_usualt: TStringField
      FieldName = 'cor_usualt'
      Size = 15
    end
    object cliCorcor_datalt: TDateField
      FieldName = 'cor_datalt'
    end
    object cliCorcor_horalt: TStringField
      FieldName = 'cor_horalt'
      Size = 8
    end
  end
  object dsCor: TDataSource
    DataSet = cliCor
    Left = 552
    Top = 479
  end
  object dspCargo: TDataSetProvider
    DataSet = sqlCargo
    UpdateMode = upWhereKeyOnly
    Left = 408
    Top = 535
  end
  object cliCargo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCargo'
    Left = 480
    Top = 535
    object cliCargocgo_codigo: TIntegerField
      FieldName = 'cgo_codigo'
    end
    object cliCargocgo_nome: TStringField
      FieldName = 'cgo_nome'
      Size = 35
    end
    object cliCargocgo_usuinc: TStringField
      FieldName = 'cgo_usuinc'
      Size = 15
    end
    object cliCargocgo_datinc: TDateField
      FieldName = 'cgo_datinc'
    end
    object cliCargocgo_horinc: TStringField
      FieldName = 'cgo_horinc'
      Size = 8
    end
    object cliCargocgo_usualt: TStringField
      FieldName = 'cgo_usualt'
      Size = 15
    end
    object cliCargocgo_datalt: TDateField
      FieldName = 'cgo_datalt'
    end
    object cliCargocgo_horalt: TStringField
      FieldName = 'cgo_horalt'
      Size = 8
    end
  end
  object dsCargo: TDataSource
    DataSet = cliCargo
    Left = 552
    Top = 535
  end
  object dspPconta: TDataSetProvider
    DataSet = sqlPconta
    UpdateMode = upWhereKeyOnly
    Left = 408
    Top = 591
  end
  object cliPconta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPconta'
    Left = 480
    Top = 591
    object cliPcontapct_codigo: TStringField
      FieldName = 'pct_codigo'
      Size = 10
    end
    object cliPcontapct_cntmae: TStringField
      FieldName = 'pct_cntmae'
      Size = 10
    end
    object cliPcontapct_nome: TStringField
      FieldName = 'pct_nome'
      Size = 50
    end
    object cliPcontapct_natureza: TStringField
      FieldName = 'pct_natureza'
      Size = 1
    end
    object cliPcontapct_tipo: TStringField
      FieldName = 'pct_tipo'
      Size = 1
    end
    object cliPcontapct_limite: TBCDField
      FieldName = 'pct_limite'
      Precision = 15
      Size = 2
    end
    object cliPcontapct_meta: TBCDField
      FieldName = 'pct_meta'
      Precision = 15
      Size = 2
    end
    object cliPcontapct_ord: TBCDField
      FieldName = 'pct_ord'
      Precision = 1
      Size = 0
    end
    object cliPcontapct_usuinc: TStringField
      FieldName = 'pct_usuinc'
      Size = 15
    end
    object cliPcontapct_datinc: TDateField
      FieldName = 'pct_datinc'
    end
    object cliPcontapct_horinc: TStringField
      FieldName = 'pct_horinc'
      Size = 8
    end
    object cliPcontapct_usualt: TStringField
      FieldName = 'pct_usualt'
      Size = 15
    end
    object cliPcontapct_datalt: TDateField
      FieldName = 'pct_datalt'
    end
    object cliPcontapct_horalt: TStringField
      FieldName = 'pct_horalt'
      Size = 8
    end
  end
  object dsPconta: TDataSource
    DataSet = cliPconta
    Left = 552
    Top = 591
  end
  object dspFormapgm: TDataSetProvider
    DataSet = sqlFormapgm
    UpdateMode = upWhereKeyOnly
    Left = 408
    Top = 647
  end
  object cliFormapgm: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFormapgm'
    Left = 480
    Top = 647
    object cliFormapgmfpg_codigo: TIntegerField
      FieldName = 'fpg_codigo'
    end
    object cliFormapgmfpg_nome: TStringField
      FieldName = 'fpg_nome'
    end
    object cliFormapgmfpg_codpct: TStringField
      FieldName = 'fpg_codpct'
      Size = 10
    end
    object cliFormapgmfpg_acao: TStringField
      FieldName = 'fpg_acao'
      Size = 3
    end
    object cliFormapgmfpg_parcela: TStringField
      FieldName = 'fpg_parcela'
      Size = 3
    end
    object cliFormapgmfpg_pctdesc: TBCDField
      FieldName = 'fpg_pctdesc'
      Precision = 5
      Size = 2
    end
    object cliFormapgmfpg_pctacre: TBCDField
      FieldName = 'fpg_pctacre'
      Precision = 5
      Size = 2
    end
    object cliFormapgmfpg_usuinc: TStringField
      FieldName = 'fpg_usuinc'
      Size = 15
    end
    object cliFormapgmfpg_datinc: TDateField
      FieldName = 'fpg_datinc'
    end
    object cliFormapgmfpg_horinc: TStringField
      FieldName = 'fpg_horinc'
      Size = 8
    end
    object cliFormapgmfpg_usualt: TStringField
      FieldName = 'fpg_usualt'
      Size = 15
    end
    object cliFormapgmfpg_datalt: TDateField
      FieldName = 'fpg_datalt'
    end
    object cliFormapgmfpg_horalt: TStringField
      FieldName = 'fpg_horalt'
      Size = 8
    end
    object cliFormapgmpct_codigo: TStringField
      FieldName = 'pct_codigo'
      Size = 10
    end
    object cliFormapgmpct_cntmae: TStringField
      FieldName = 'pct_cntmae'
      Size = 10
    end
    object cliFormapgmpct_nome: TStringField
      FieldName = 'pct_nome'
      Size = 50
    end
    object cliFormapgmpct_natureza: TStringField
      FieldName = 'pct_natureza'
      Size = 1
    end
    object cliFormapgmpct_tipo: TStringField
      FieldName = 'pct_tipo'
      Size = 1
    end
    object cliFormapgmpct_limite: TBCDField
      FieldName = 'pct_limite'
      Precision = 15
      Size = 2
    end
    object cliFormapgmpct_meta: TBCDField
      FieldName = 'pct_meta'
      Precision = 15
      Size = 2
    end
    object cliFormapgmpct_ord: TBCDField
      FieldName = 'pct_ord'
      Precision = 1
      Size = 0
    end
    object cliFormapgmpct_usuinc: TStringField
      FieldName = 'pct_usuinc'
      Size = 15
    end
    object cliFormapgmpct_datinc: TDateField
      FieldName = 'pct_datinc'
    end
    object cliFormapgmpct_horinc: TStringField
      FieldName = 'pct_horinc'
      Size = 8
    end
    object cliFormapgmpct_usualt: TStringField
      FieldName = 'pct_usualt'
      Size = 15
    end
    object cliFormapgmpct_datalt: TDateField
      FieldName = 'pct_datalt'
    end
    object cliFormapgmpct_horalt: TStringField
      FieldName = 'pct_horalt'
      Size = 8
    end
  end
  object dsFormapgm: TDataSource
    DataSet = cliFormapgm
    Left = 552
    Top = 647
  end
  object dspBanco: TDataSetProvider
    DataSet = sqlBanco
    UpdateMode = upWhereKeyOnly
    Left = 408
    Top = 698
  end
  object cliBanco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBanco'
    Left = 488
    Top = 698
    object cliBancobco_codigo: TStringField
      FieldName = 'bco_codigo'
      Size = 6
    end
    object cliBancobco_nome: TStringField
      FieldName = 'bco_nome'
      Size = 70
    end
    object cliBancobco_usuinc: TStringField
      FieldName = 'bco_usuinc'
      Size = 15
    end
    object cliBancobco_datinc: TDateField
      FieldName = 'bco_datinc'
    end
    object cliBancobco_horinc: TStringField
      FieldName = 'bco_horinc'
      Size = 8
    end
    object cliBancobco_usualt: TStringField
      FieldName = 'bco_usualt'
      Size = 15
    end
    object cliBancobco_datalt: TDateField
      FieldName = 'bco_datalt'
    end
    object cliBancobco_horalt: TStringField
      FieldName = 'bco_horalt'
      Size = 8
    end
  end
  object dsBanco: TDataSource
    DataSet = cliBanco
    Left = 560
    Top = 698
  end
  object dspMateriapri: TDataSetProvider
    DataSet = sqlMateriapri
    UpdateMode = upWhereKeyOnly
    Left = 408
    Top = 754
  end
  object cliMateriapri: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMateriapri'
    Left = 488
    Top = 754
    object cliMateriaprimpr_codigo: TIntegerField
      FieldName = 'mpr_codigo'
    end
    object cliMateriaprimpr_nome: TStringField
      FieldName = 'mpr_nome'
      Size = 40
    end
    object cliMateriaprimpr_usuinc: TStringField
      FieldName = 'mpr_usuinc'
      Size = 15
    end
    object cliMateriaprimpr_datinc: TDateField
      FieldName = 'mpr_datinc'
    end
    object cliMateriaprimpr_horinc: TStringField
      FieldName = 'mpr_horinc'
      Size = 8
    end
    object cliMateriaprimpr_usualt: TStringField
      FieldName = 'mpr_usualt'
      Size = 15
    end
    object cliMateriaprimpr_datalt: TDateField
      FieldName = 'mpr_datalt'
    end
    object cliMateriaprimpr_horalt: TStringField
      FieldName = 'mpr_horalt'
      Size = 8
    end
  end
  object dsMateriapri: TDataSource
    DataSet = cliMateriapri
    Left = 560
    Top = 754
  end
  object dspcategoria: TDataSetProvider
    DataSet = sqlCategoria
    UpdateMode = upWhereKeyOnly
    Left = 408
    Top = 810
  end
  object cliCategoria: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspcategoria'
    Left = 488
    Top = 810
    object cliCategoriactg_codigo: TIntegerField
      FieldName = 'ctg_codigo'
    end
    object cliCategoriactg_nome: TStringField
      FieldName = 'ctg_nome'
      Size = 40
    end
    object cliCategoriactg_usuinc: TStringField
      FieldName = 'ctg_usuinc'
      Size = 15
    end
    object cliCategoriactg_datinc: TDateField
      FieldName = 'ctg_datinc'
    end
    object cliCategoriactg_horinc: TStringField
      FieldName = 'ctg_horinc'
      Size = 8
    end
    object cliCategoriactg_usualt: TStringField
      FieldName = 'ctg_usualt'
      Size = 15
    end
    object cliCategoriactg_datalt: TDateField
      FieldName = 'ctg_datalt'
    end
    object cliCategoriactg_horalt: TStringField
      FieldName = 'ctg_horalt'
      Size = 8
    end
  end
  object dsCategoria: TDataSource
    DataSet = cliCategoria
    Left = 560
    Top = 810
  end
  object dspFabricante: TDataSetProvider
    DataSet = sqlFabricante
    UpdateMode = upWhereKeyOnly
    Left = 408
    Top = 866
  end
  object cliFabricante: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFabricante'
    Left = 488
    Top = 866
    object cliFabricantefbt_codigo: TIntegerField
      FieldName = 'fbt_codigo'
    end
    object cliFabricantefbt_nome: TStringField
      FieldName = 'fbt_nome'
      Size = 40
    end
    object cliFabricantefbt_usuinc: TStringField
      FieldName = 'fbt_usuinc'
      Size = 15
    end
    object cliFabricantefbt_datinc: TDateField
      FieldName = 'fbt_datinc'
    end
    object cliFabricantefbt_horinc: TStringField
      FieldName = 'fbt_horinc'
      Size = 8
    end
    object cliFabricantefbt_usualt: TStringField
      FieldName = 'fbt_usualt'
      Size = 15
    end
    object cliFabricantefbt_datalt: TDateField
      FieldName = 'fbt_datalt'
    end
    object cliFabricantefbt_horalt: TStringField
      FieldName = 'fbt_horalt'
      Size = 8
    end
  end
  object dsFabricante: TDataSource
    DataSet = cliFabricante
    Left = 560
    Top = 866
  end
  object dspcfop: TDataSetProvider
    DataSet = sqlCfop
    UpdateMode = upWhereKeyOnly
    Left = 408
    Top = 922
  end
  object clicfop: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspcfop'
    Left = 488
    Top = 922
    object clicfopcfo_codigo: TStringField
      FieldName = 'cfo_codigo'
      Size = 4
    end
    object clicfopcfo_nome: TStringField
      FieldName = 'cfo_nome'
      Size = 350
    end
    object clicfopcfo_usuinc: TStringField
      FieldName = 'cfo_usuinc'
      Size = 15
    end
    object clicfopcfo_datinc: TDateField
      FieldName = 'cfo_datinc'
    end
    object clicfopcfo_horinc: TStringField
      FieldName = 'cfo_horinc'
      Size = 8
    end
    object clicfopcfo_usualt: TStringField
      FieldName = 'cfo_usualt'
      Size = 15
    end
    object clicfopcfo_datalt: TDateField
      FieldName = 'cfo_datalt'
    end
    object clicfopcfo_horalt: TStringField
      FieldName = 'cfo_horalt'
      Size = 8
    end
  end
  object dscfop: TDataSource
    DataSet = clicfop
    Left = 560
    Top = 922
  end
  object dspNcm: TDataSetProvider
    DataSet = sqlNcm
    UpdateMode = upWhereKeyOnly
    Left = 408
    Top = 1042
  end
  object cliNcm: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNcm'
    Left = 488
    Top = 1042
    object cliNcmncm_codigo: TStringField
      FieldName = 'ncm_codigo'
      Size = 10
    end
    object cliNcmncm_nome: TStringField
      FieldName = 'ncm_nome'
      Size = 350
    end
    object cliNcmncm_usuinc: TStringField
      FieldName = 'ncm_usuinc'
      Size = 15
    end
    object cliNcmncm_datinc: TDateField
      FieldName = 'ncm_datinc'
    end
    object cliNcmncm_horinc: TStringField
      FieldName = 'ncm_horinc'
      Size = 8
    end
    object cliNcmncm_usualt: TStringField
      FieldName = 'ncm_usualt'
      Size = 15
    end
    object cliNcmncm_datalt: TDateField
      FieldName = 'ncm_datalt'
    end
    object cliNcmncm_horalt: TStringField
      FieldName = 'ncm_horalt'
      Size = 8
    end
  end
  object dsNcm: TDataSource
    DataSet = cliNcm
    Left = 560
    Top = 1042
  end
  object dsptabmulta: TDataSetProvider
    DataSet = sqltabmulta
    UpdateMode = upWhereKeyOnly
    Left = 408
    Top = 1098
  end
  object clitabmulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsptabmulta'
    Left = 488
    Top = 1098
    object clitabmultatmt_codigo: TStringField
      FieldName = 'tmt_codigo'
      Size = 7
    end
    object clitabmultatmt_nome: TStringField
      FieldName = 'tmt_nome'
      Size = 200
    end
    object clitabmultatmt_ampleg: TStringField
      FieldName = 'tmt_ampleg'
    end
    object clitabmultatmt_gravid: TStringField
      FieldName = 'tmt_gravid'
    end
    object clitabmultatmt_infrat: TStringField
      FieldName = 'tmt_infrat'
    end
    object clitabmultatmt_local: TStringField
      FieldName = 'tmt_local'
    end
    object clitabmultatmt_nmrpts: TIntegerField
      FieldName = 'tmt_nmrpts'
    end
    object clitabmultatmt_vlrmul: TBCDField
      FieldName = 'tmt_vlrmul'
      Precision = 12
      Size = 2
    end
    object clitabmultatmt_usuinc: TStringField
      FieldName = 'tmt_usuinc'
      Size = 15
    end
    object clitabmultatmt_datinc: TDateField
      FieldName = 'tmt_datinc'
    end
    object clitabmultatmt_horinc: TStringField
      FieldName = 'tmt_horinc'
      Size = 8
    end
    object clitabmultatmt_usualt: TStringField
      FieldName = 'tmt_usualt'
      Size = 15
    end
    object clitabmultatmt_datalt: TDateField
      FieldName = 'tmt_datalt'
    end
    object clitabmultatmt_horalt: TStringField
      FieldName = 'tmt_horalt'
      Size = 8
    end
  end
  object dstabmulta: TDataSource
    DataSet = clitabmulta
    Left = 560
    Top = 1098
  end
  object dsporgtrans: TDataSetProvider
    DataSet = sqlorgtrans
    UpdateMode = upWhereKeyOnly
    Left = 408
    Top = 1154
  end
  object cliorgtrans: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsporgtrans'
    Left = 488
    Top = 1154
    object cliorgtransogt_codigo: TIntegerField
      FieldName = 'ogt_codigo'
    end
    object cliorgtransogt_nome: TStringField
      FieldName = 'ogt_nome'
      Size = 60
    end
    object cliorgtransogt_sigla: TStringField
      FieldName = 'ogt_sigla'
      Size = 10
    end
    object cliorgtransogt_telef01: TStringField
      FieldName = 'ogt_telef01'
      Size = 11
    end
    object cliorgtransogt_telef02: TStringField
      FieldName = 'ogt_telef02'
      Size = 11
    end
    object cliorgtransogt_codpct: TStringField
      FieldName = 'ogt_codpct'
      Size = 10
    end
    object cliorgtransogt_usuinc: TStringField
      FieldName = 'ogt_usuinc'
      Size = 15
    end
    object cliorgtransogt_datinc: TDateField
      FieldName = 'ogt_datinc'
    end
    object cliorgtransogt_horinc: TStringField
      FieldName = 'ogt_horinc'
      Size = 8
    end
    object cliorgtransogt_usualt: TStringField
      FieldName = 'ogt_usualt'
      Size = 15
    end
    object cliorgtransogt_datalt: TDateField
      FieldName = 'ogt_datalt'
    end
    object cliorgtransogt_horalt: TStringField
      FieldName = 'ogt_horalt'
      Size = 8
    end
  end
  object dsorgtrans: TDataSource
    DataSet = cliorgtrans
    Left = 560
    Top = 1154
  end
  object dspCst: TDataSetProvider
    DataSet = sqlCst
    UpdateMode = upWhereKeyOnly
    Left = 408
    Top = 986
  end
  object cliCst: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCst'
    Left = 488
    Top = 986
    object cliCstcst_codigo: TStringField
      FieldName = 'cst_codigo'
      Size = 2
    end
    object cliCstcst_descri: TStringField
      FieldName = 'cst_descri'
      Size = 100
    end
    object cliCstcst_clcicm: TBooleanField
      FieldName = 'cst_clcicm'
    end
    object cliCstcst_cf: TStringField
      FieldName = 'cst_cf'
      Size = 5
    end
    object cliCstcst_usuinc: TStringField
      FieldName = 'cst_usuinc'
      Size = 15
    end
    object cliCstcst_datinc: TDateField
      FieldName = 'cst_datinc'
    end
    object cliCstcst_horinc: TStringField
      FieldName = 'cst_horinc'
      Size = 8
    end
    object cliCstcst_usualt: TStringField
      FieldName = 'cst_usualt'
      Size = 15
    end
    object cliCstcst_datalt: TDateField
      FieldName = 'cst_datalt'
    end
    object cliCstcst_horalt: TStringField
      FieldName = 'cst_horalt'
      Size = 8
    end
  end
  object dsCst: TDataSource
    DataSet = cliCst
    Left = 560
    Top = 986
  end
  object dspImposto: TDataSetProvider
    DataSet = sqlImposto
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 936
  end
  object cliImposto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspImposto'
    Left = 170
    Top = 936
    object cliImpostoipt_codigo: TIntegerField
      FieldName = 'ipt_codigo'
    end
    object cliImpostoipt_nome: TStringField
      FieldName = 'ipt_nome'
    end
    object cliImpostoipt_codpct: TStringField
      FieldName = 'ipt_codpct'
      Size = 10
    end
    object cliImpostoipt_usuinc: TStringField
      FieldName = 'ipt_usuinc'
      Size = 15
    end
    object cliImpostoipt_datinc: TDateField
      FieldName = 'ipt_datinc'
    end
    object cliImpostoipt_horinc: TStringField
      FieldName = 'ipt_horinc'
      Size = 8
    end
    object cliImpostoipt_usualt: TStringField
      FieldName = 'ipt_usualt'
      Size = 15
    end
    object cliImpostoipt_datalt: TDateField
      FieldName = 'ipt_datalt'
    end
    object cliImpostoipt_horalt: TStringField
      FieldName = 'ipt_horalt'
      Size = 8
    end
    object cliImpostopct_codigo: TStringField
      FieldName = 'pct_codigo'
      Size = 10
    end
    object cliImpostopct_cntmae: TStringField
      FieldName = 'pct_cntmae'
      Size = 10
    end
    object cliImpostopct_nome: TStringField
      FieldName = 'pct_nome'
      Size = 50
    end
    object cliImpostopct_natureza: TStringField
      FieldName = 'pct_natureza'
      Size = 1
    end
    object cliImpostopct_tipo: TStringField
      FieldName = 'pct_tipo'
      Size = 1
    end
    object cliImpostopct_limite: TBCDField
      FieldName = 'pct_limite'
      Precision = 15
      Size = 2
    end
    object cliImpostopct_meta: TBCDField
      FieldName = 'pct_meta'
      Precision = 15
      Size = 2
    end
    object cliImpostopct_ord: TBCDField
      FieldName = 'pct_ord'
      Precision = 1
      Size = 0
    end
    object cliImpostopct_usuinc: TStringField
      FieldName = 'pct_usuinc'
      Size = 15
    end
    object cliImpostopct_datinc: TDateField
      FieldName = 'pct_datinc'
    end
    object cliImpostopct_horinc: TStringField
      FieldName = 'pct_horinc'
      Size = 8
    end
    object cliImpostopct_usualt: TStringField
      FieldName = 'pct_usualt'
      Size = 15
    end
    object cliImpostopct_datalt: TDateField
      FieldName = 'pct_datalt'
    end
    object cliImpostopct_horalt: TStringField
      FieldName = 'pct_horalt'
      Size = 8
    end
  end
  object dsImposto: TDataSource
    DataSet = cliImposto
    Left = 242
    Top = 936
  end
  object dspPneuDes: TDataSetProvider
    DataSet = sqlPneuDes
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 992
  end
  object cliPneuDes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPneuDes'
    Left = 170
    Top = 992
    object cliPneuDespds_codigo: TIntegerField
      FieldName = 'pds_codigo'
    end
    object cliPneuDespds_nome: TStringField
      FieldName = 'pds_nome'
    end
    object cliPneuDespds_sucos: TStringField
      FieldName = 'pds_sucos'
      Size = 1
    end
    object cliPneuDespds_usuinc: TStringField
      FieldName = 'pds_usuinc'
      Size = 15
    end
    object cliPneuDespds_datinc: TDateField
      FieldName = 'pds_datinc'
    end
    object cliPneuDespds_horinc: TStringField
      FieldName = 'pds_horinc'
      Size = 8
    end
    object cliPneuDespds_usualt: TStringField
      FieldName = 'pds_usualt'
      Size = 15
    end
    object cliPneuDespds_datalt: TDateField
      FieldName = 'pds_datalt'
    end
    object cliPneuDespds_horalt: TStringField
      FieldName = 'pds_horalt'
      Size = 8
    end
  end
  object dsPneuDes: TDataSource
    DataSet = cliPneuDes
    Left = 242
    Top = 992
  end
  object dspPneuDim: TDataSetProvider
    DataSet = sqlPneuDim
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 1048
  end
  object cliPneuDim: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPneuDim'
    Left = 170
    Top = 1048
    object cliPneuDimpdm_codigo: TIntegerField
      FieldName = 'pdm_codigo'
    end
    object cliPneuDimpdm_nome: TStringField
      FieldName = 'pdm_nome'
    end
    object cliPneuDimpdm_usuinc: TStringField
      FieldName = 'pdm_usuinc'
      Size = 15
    end
    object cliPneuDimpdm_datinc: TDateField
      FieldName = 'pdm_datinc'
    end
    object cliPneuDimpdm_horinc: TStringField
      FieldName = 'pdm_horinc'
      Size = 8
    end
    object cliPneuDimpdm_usualt: TStringField
      FieldName = 'pdm_usualt'
      Size = 15
    end
    object cliPneuDimpdm_datalt: TDateField
      FieldName = 'pdm_datalt'
    end
    object cliPneuDimpdm_horalt: TStringField
      FieldName = 'pdm_horalt'
      Size = 8
    end
  end
  object dsPneuDim: TDataSource
    DataSet = cliPneuDim
    Left = 242
    Top = 1048
  end
  object dspPneuFab: TDataSetProvider
    DataSet = sqlPneuFab
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 1104
  end
  object cliPneuFab: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPneuFab'
    Left = 170
    Top = 1104
    object cliPneuFabpfb_codigo: TIntegerField
      FieldName = 'pfb_codigo'
    end
    object cliPneuFabpfb_nome: TStringField
      FieldName = 'pfb_nome'
      Size = 40
    end
    object cliPneuFabpfb_usuinc: TStringField
      FieldName = 'pfb_usuinc'
      Size = 15
    end
    object cliPneuFabpfb_datinc: TDateField
      FieldName = 'pfb_datinc'
    end
    object cliPneuFabpfb_horinc: TStringField
      FieldName = 'pfb_horinc'
      Size = 8
    end
    object cliPneuFabpfb_usualt: TStringField
      FieldName = 'pfb_usualt'
      Size = 15
    end
    object cliPneuFabpfb_datalt: TDateField
      FieldName = 'pfb_datalt'
    end
    object cliPneuFabpfb_horalt: TStringField
      FieldName = 'pfb_horalt'
      Size = 8
    end
  end
  object dsPneuFab: TDataSource
    DataSet = cliPneuFab
    Left = 242
    Top = 1104
  end
  object dspPais: TDataSetProvider
    DataSet = sqlPais
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 1158
  end
  object cliPais: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPais'
    Left = 170
    Top = 1158
    object cliPaispai_codigo: TIntegerField
      FieldName = 'pai_codigo'
    end
    object cliPaispai_nome: TStringField
      FieldName = 'pai_nome'
      Size = 50
    end
    object cliPaispai_usuinc: TStringField
      FieldName = 'pai_usuinc'
      Size = 15
    end
    object cliPaispai_datinc: TDateField
      FieldName = 'pai_datinc'
    end
    object cliPaispai_horinc: TStringField
      FieldName = 'pai_horinc'
      Size = 8
    end
    object cliPaispai_usualt: TStringField
      FieldName = 'pai_usualt'
      Size = 15
    end
    object cliPaispai_datalt: TDateField
      FieldName = 'pai_datalt'
    end
    object cliPaispai_horalt: TStringField
      FieldName = 'pai_horalt'
      Size = 8
    end
  end
  object dsPais: TDataSource
    DataSet = cliPais
    Left = 242
    Top = 1158
  end
  object dspEstado: TDataSetProvider
    DataSet = sqlEstado
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 1214
  end
  object cliEstado: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstado'
    Left = 170
    Top = 1214
    object cliEstadoest_codigo: TIntegerField
      FieldName = 'est_codigo'
    end
    object cliEstadoest_nome: TStringField
      FieldName = 'est_nome'
      Size = 50
    end
    object cliEstadoest_uf: TStringField
      FieldName = 'est_uf'
      Size = 2
    end
    object cliEstadoest_codpai: TIntegerField
      FieldName = 'est_codpai'
    end
    object cliEstadoest_usuinc: TStringField
      FieldName = 'est_usuinc'
      Size = 15
    end
    object cliEstadoest_datinc: TDateField
      FieldName = 'est_datinc'
    end
    object cliEstadoest_horinc: TStringField
      FieldName = 'est_horinc'
      Size = 8
    end
    object cliEstadoest_usualt: TStringField
      FieldName = 'est_usualt'
      Size = 15
    end
    object cliEstadoest_datalt: TDateField
      FieldName = 'est_datalt'
    end
    object cliEstadoest_horalt: TStringField
      FieldName = 'est_horalt'
      Size = 8
    end
    object cliEstadopai_codigo: TIntegerField
      FieldName = 'pai_codigo'
    end
    object cliEstadopai_nome: TStringField
      FieldName = 'pai_nome'
      Size = 50
    end
    object cliEstadopai_usuinc: TStringField
      FieldName = 'pai_usuinc'
      Size = 15
    end
    object cliEstadopai_datinc: TDateField
      FieldName = 'pai_datinc'
    end
    object cliEstadopai_horinc: TStringField
      FieldName = 'pai_horinc'
      Size = 8
    end
    object cliEstadopai_usualt: TStringField
      FieldName = 'pai_usualt'
      Size = 15
    end
    object cliEstadopai_datalt: TDateField
      FieldName = 'pai_datalt'
    end
    object cliEstadopai_horalt: TStringField
      FieldName = 'pai_horalt'
      Size = 8
    end
  end
  object dsEstado: TDataSource
    DataSet = cliEstado
    Left = 242
    Top = 1214
  end
  object dspgrupomnt: TDataSetProvider
    DataSet = sqlgrupomnt
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 1270
  end
  object cligrupomnt: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspgrupomnt'
    Left = 170
    Top = 1270
    object cligrupomntgrm_codigo: TIntegerField
      FieldName = 'grm_codigo'
    end
    object cligrupomntgrm_nome: TStringField
      FieldName = 'grm_nome'
      Size = 40
    end
    object cligrupomntgrm_usuinc: TStringField
      FieldName = 'grm_usuinc'
      Size = 15
    end
    object cligrupomntgrm_datinc: TDateField
      FieldName = 'grm_datinc'
    end
    object cligrupomntgrm_horinc: TStringField
      FieldName = 'grm_horinc'
      Size = 8
    end
    object cligrupomntgrm_usualt: TStringField
      FieldName = 'grm_usualt'
      Size = 15
    end
    object cligrupomntgrm_datalt: TDateField
      FieldName = 'grm_datalt'
    end
    object cligrupomntgrm_horalt: TStringField
      FieldName = 'grm_horalt'
      Size = 8
    end
    object cligrupomntsgm_codgrm: TIntegerField
      FieldName = 'sgm_codgrm'
    end
  end
  object dsgrupomnt: TDataSource
    DataSet = cligrupomnt
    Left = 242
    Top = 1270
  end
  object dspsubgrpmnt: TDataSetProvider
    DataSet = sqlsubgrpmnt
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 1334
  end
  object clisubgrpmnt: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspsubgrpmnt'
    Left = 170
    Top = 1334
    object clisubgrpmntsgm_codigo: TIntegerField
      FieldName = 'sgm_codigo'
    end
    object clisubgrpmntsgm_nome: TStringField
      FieldName = 'sgm_nome'
      Size = 25
    end
    object clisubgrpmntsgm_codgrm: TIntegerField
      FieldName = 'sgm_codgrm'
    end
    object clisubgrpmntsgm_usuinc: TStringField
      FieldName = 'sgm_usuinc'
      Size = 15
    end
    object clisubgrpmntsgm_datinc: TDateField
      FieldName = 'sgm_datinc'
    end
    object clisubgrpmntsgm_horinc: TStringField
      FieldName = 'sgm_horinc'
      Size = 8
    end
    object clisubgrpmntsgm_usualt: TStringField
      FieldName = 'sgm_usualt'
      Size = 15
    end
    object clisubgrpmntsgm_datalt: TDateField
      FieldName = 'sgm_datalt'
    end
    object clisubgrpmntsgm_horalt: TStringField
      FieldName = 'sgm_horalt'
      Size = 8
    end
    object clisubgrpmntgrm_codigo: TIntegerField
      FieldName = 'grm_codigo'
    end
    object clisubgrpmntgrm_nome: TStringField
      FieldName = 'grm_nome'
      Size = 40
    end
    object clisubgrpmntgrm_usuinc: TStringField
      FieldName = 'grm_usuinc'
      Size = 15
    end
    object clisubgrpmntgrm_datinc: TDateField
      FieldName = 'grm_datinc'
    end
    object clisubgrpmntgrm_horinc: TStringField
      FieldName = 'grm_horinc'
      Size = 8
    end
    object clisubgrpmntgrm_usualt: TStringField
      FieldName = 'grm_usualt'
      Size = 15
    end
    object clisubgrpmntgrm_datalt: TDateField
      FieldName = 'grm_datalt'
    end
    object clisubgrpmntgrm_horalt: TStringField
      FieldName = 'grm_horalt'
      Size = 8
    end
  end
  object dssubgrpmnt: TDataSource
    DataSet = clisubgrpmnt
    Left = 242
    Top = 1334
  end
  object dspManuitem: TDataSetProvider
    DataSet = sqlManuitem
    UpdateMode = upWhereKeyOnly
    Left = 408
    Top = 1210
  end
  object cliManuitem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspManuitem'
    Left = 488
    Top = 1210
    object cliManuitemmit_codigo: TIntegerField
      FieldName = 'mit_codigo'
    end
    object cliManuitemmit_nome: TStringField
      FieldName = 'mit_nome'
      Size = 25
    end
    object cliManuitemmit_kmmanu: TBCDField
      FieldName = 'mit_kmmanu'
      Precision = 7
      Size = 0
    end
    object cliManuitemmit_period: TStringField
      FieldName = 'mit_period'
      Size = 4
    end
    object cliManuitemmit_codsgm: TIntegerField
      FieldName = 'mit_codsgm'
    end
    object cliManuitemmit_usuinc: TStringField
      FieldName = 'mit_usuinc'
      Size = 15
    end
    object cliManuitemmit_datinc: TDateField
      FieldName = 'mit_datinc'
    end
    object cliManuitemmit_horinc: TStringField
      FieldName = 'mit_horinc'
      Size = 8
    end
    object cliManuitemmit_usualt: TStringField
      FieldName = 'mit_usualt'
      Size = 15
    end
    object cliManuitemmit_datalt: TDateField
      FieldName = 'mit_datalt'
    end
    object cliManuitemmit_horalt: TStringField
      FieldName = 'mit_horalt'
      Size = 8
    end
    object cliManuitemsgm_codigo: TIntegerField
      FieldName = 'sgm_codigo'
    end
    object cliManuitemsgm_nome: TStringField
      FieldName = 'sgm_nome'
      Size = 25
    end
    object cliManuitemsgm_codgrm: TIntegerField
      FieldName = 'sgm_codgrm'
    end
    object cliManuitemsgm_usuinc: TStringField
      FieldName = 'sgm_usuinc'
      Size = 15
    end
    object cliManuitemsgm_datinc: TDateField
      FieldName = 'sgm_datinc'
    end
    object cliManuitemsgm_horinc: TStringField
      FieldName = 'sgm_horinc'
      Size = 8
    end
    object cliManuitemsgm_usualt: TStringField
      FieldName = 'sgm_usualt'
      Size = 15
    end
    object cliManuitemsgm_datalt: TDateField
      FieldName = 'sgm_datalt'
    end
    object cliManuitemsgm_horalt: TStringField
      FieldName = 'sgm_horalt'
      Size = 8
    end
    object cliManuitemgrm_codigo: TIntegerField
      FieldName = 'grm_codigo'
    end
    object cliManuitemgrm_nome: TStringField
      FieldName = 'grm_nome'
      Size = 40
    end
    object cliManuitemgrm_usuinc: TStringField
      FieldName = 'grm_usuinc'
      Size = 15
    end
    object cliManuitemgrm_datinc: TDateField
      FieldName = 'grm_datinc'
    end
    object cliManuitemgrm_horinc: TStringField
      FieldName = 'grm_horinc'
      Size = 8
    end
    object cliManuitemgrm_usualt: TStringField
      FieldName = 'grm_usualt'
      Size = 15
    end
    object cliManuitemgrm_datalt: TDateField
      FieldName = 'grm_datalt'
    end
    object cliManuitemgrm_horalt: TStringField
      FieldName = 'grm_horalt'
      Size = 8
    end
  end
  object dsManuitem: TDataSource
    DataSet = cliManuitem
    Left = 560
    Top = 1210
  end
  object dsptbservico: TDataSetProvider
    DataSet = sqltbservico
    UpdateMode = upWhereKeyOnly
    Left = 408
    Top = 1266
  end
  object clitbservico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsptbservico'
    Left = 488
    Top = 1266
    object clitbservicotsm_codigo: TIntegerField
      FieldName = 'tsm_codigo'
    end
    object clitbservicotsm_nome: TStringField
      FieldName = 'tsm_nome'
      Size = 25
    end
    object clitbservicotsm_vlrhor: TBCDField
      FieldName = 'tsm_vlrhor'
      Precision = 12
      Size = 2
    end
    object clitbservicotsm_codsgm: TIntegerField
      FieldName = 'tsm_codsgm'
    end
    object clitbservicotsm_usuinc: TStringField
      FieldName = 'tsm_usuinc'
      Size = 15
    end
    object clitbservicotsm_datinc: TDateField
      FieldName = 'tsm_datinc'
    end
    object clitbservicotsm_horinc: TStringField
      FieldName = 'tsm_horinc'
      Size = 8
    end
    object clitbservicotsm_usualt: TStringField
      FieldName = 'tsm_usualt'
      Size = 15
    end
    object clitbservicotsm_datalt: TDateField
      FieldName = 'tsm_datalt'
    end
    object clitbservicotsm_horalt: TStringField
      FieldName = 'tsm_horalt'
      Size = 8
    end
    object clitbservicosgm_codigo: TIntegerField
      FieldName = 'sgm_codigo'
    end
    object clitbservicosgm_nome: TStringField
      FieldName = 'sgm_nome'
      Size = 25
    end
    object clitbservicosgm_codgrm: TIntegerField
      FieldName = 'sgm_codgrm'
    end
    object clitbservicosgm_usuinc: TStringField
      FieldName = 'sgm_usuinc'
      Size = 15
    end
    object clitbservicosgm_datinc: TDateField
      FieldName = 'sgm_datinc'
    end
    object clitbservicosgm_horinc: TStringField
      FieldName = 'sgm_horinc'
      Size = 8
    end
    object clitbservicosgm_usualt: TStringField
      FieldName = 'sgm_usualt'
      Size = 15
    end
    object clitbservicosgm_datalt: TDateField
      FieldName = 'sgm_datalt'
    end
    object clitbservicosgm_horalt: TStringField
      FieldName = 'sgm_horalt'
      Size = 8
    end
    object clitbservicogrm_codigo: TIntegerField
      FieldName = 'grm_codigo'
    end
    object clitbservicogrm_nome: TStringField
      FieldName = 'grm_nome'
      Size = 40
    end
    object clitbservicogrm_usuinc: TStringField
      FieldName = 'grm_usuinc'
      Size = 15
    end
    object clitbservicogrm_datinc: TDateField
      FieldName = 'grm_datinc'
    end
    object clitbservicogrm_horinc: TStringField
      FieldName = 'grm_horinc'
      Size = 8
    end
    object clitbservicogrm_usualt: TStringField
      FieldName = 'grm_usualt'
      Size = 15
    end
    object clitbservicogrm_datalt: TDateField
      FieldName = 'grm_datalt'
    end
    object clitbservicogrm_horalt: TStringField
      FieldName = 'grm_horalt'
      Size = 8
    end
  end
  object dstbservico: TDataSource
    DataSet = clitbservico
    Left = 560
    Top = 1266
  end
  object dspmanutitens: TDataSetProvider
    DataSet = sqlmanutitens
    UpdateMode = upWhereKeyOnly
    Left = 408
    Top = 1322
  end
  object climanutitens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspmanutitens'
    Left = 488
    Top = 1322
    object climanutitensitm_codigo: TIntegerField
      FieldName = 'itm_codigo'
    end
    object climanutitensitm_codmit: TIntegerField
      FieldName = 'itm_codmit'
    end
    object climanutitensitm_codtsm: TIntegerField
      FieldName = 'itm_codtsm'
    end
    object climanutitensitm_usuinc: TStringField
      FieldName = 'itm_usuinc'
      Size = 15
    end
    object climanutitensitm_datinc: TDateField
      FieldName = 'itm_datinc'
    end
    object climanutitensitm_horinc: TStringField
      FieldName = 'itm_horinc'
      Size = 8
    end
    object climanutitensitm_usualt: TStringField
      FieldName = 'itm_usualt'
      Size = 15
    end
    object climanutitensitm_datalt: TDateField
      FieldName = 'itm_datalt'
    end
    object climanutitensitm_horalt: TStringField
      FieldName = 'itm_horalt'
      Size = 8
    end
    object climanutitenstsm_codigo: TIntegerField
      FieldName = 'tsm_codigo'
    end
    object climanutitenstsm_nome: TStringField
      FieldName = 'tsm_nome'
      Size = 25
    end
    object climanutitenstsm_vlrhor: TBCDField
      FieldName = 'tsm_vlrhor'
      Precision = 12
      Size = 2
    end
    object climanutitenstsm_codsgm: TIntegerField
      FieldName = 'tsm_codsgm'
    end
    object climanutitenstsm_usuinc: TStringField
      FieldName = 'tsm_usuinc'
      Size = 15
    end
    object climanutitenstsm_datinc: TDateField
      FieldName = 'tsm_datinc'
    end
    object climanutitenstsm_horinc: TStringField
      FieldName = 'tsm_horinc'
      Size = 8
    end
    object climanutitenstsm_usualt: TStringField
      FieldName = 'tsm_usualt'
      Size = 15
    end
    object climanutitenstsm_datalt: TDateField
      FieldName = 'tsm_datalt'
    end
    object climanutitenstsm_horalt: TStringField
      FieldName = 'tsm_horalt'
      Size = 8
    end
  end
  object dsmanutitens: TDataSource
    DataSet = climanutitens
    Left = 560
    Top = 1322
  end
  object dspSubGrupo: TDataSetProvider
    DataSet = sqlSubGrupo
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 96
    Top = 656
  end
  object cliSubGrupo: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspSubGrupo'
    Left = 168
    Top = 656
    object cliSubGruposgr_codigo: TIntegerField
      FieldName = 'sgr_codigo'
    end
    object cliSubGruposgr_codgru: TIntegerField
      FieldName = 'sgr_codgru'
    end
    object cliSubGruposgr_codniv: TIntegerField
      FieldName = 'sgr_codniv'
    end
    object cliSubGruposgr_nome: TStringField
      FieldName = 'sgr_nome'
    end
    object cliSubGruposgr_usuinc: TStringField
      FieldName = 'sgr_usuinc'
      Size = 15
    end
    object cliSubGruposgr_datinc: TDateField
      FieldName = 'sgr_datinc'
    end
    object cliSubGruposgr_horinc: TStringField
      FieldName = 'sgr_horinc'
      Size = 8
    end
    object cliSubGruposgr_usualt: TStringField
      FieldName = 'sgr_usualt'
      Size = 15
    end
    object cliSubGruposgr_datalt: TDateField
      FieldName = 'sgr_datalt'
    end
    object cliSubGruposgr_horalt: TStringField
      FieldName = 'sgr_horalt'
      Size = 8
    end
    object cliSubGrupogru_codigo: TIntegerField
      FieldName = 'gru_codigo'
    end
    object cliSubGrupogru_grupo: TStringField
      FieldName = 'gru_grupo'
    end
    object cliSubGrupogru_usuinc: TStringField
      FieldName = 'gru_usuinc'
      Size = 15
    end
    object cliSubGrupogru_datinc: TDateField
      FieldName = 'gru_datinc'
    end
    object cliSubGrupogru_horinc: TStringField
      FieldName = 'gru_horinc'
      Size = 8
    end
    object cliSubGrupogru_usualt: TStringField
      FieldName = 'gru_usualt'
      Size = 15
    end
    object cliSubGrupogru_datalt: TDateField
      FieldName = 'gru_datalt'
    end
    object cliSubGrupogru_horalt: TStringField
      FieldName = 'gru_horalt'
      Size = 8
    end
    object cliSubGruponiv_codigo: TIntegerField
      FieldName = 'niv_codigo'
    end
    object cliSubGruponiv_nivel: TStringField
      FieldName = 'niv_nivel'
    end
    object cliSubGruponiv_usuinc: TStringField
      FieldName = 'niv_usuinc'
      Size = 15
    end
    object cliSubGruponiv_datinc: TDateField
      FieldName = 'niv_datinc'
    end
    object cliSubGruponiv_horinc: TStringField
      FieldName = 'niv_horinc'
      Size = 8
    end
    object cliSubGruponiv_usualt: TStringField
      FieldName = 'niv_usualt'
      Size = 15
    end
    object cliSubGruponiv_datalt: TDateField
      FieldName = 'niv_datalt'
    end
    object cliSubGruponiv_horalt: TStringField
      FieldName = 'niv_horalt'
      Size = 8
    end
  end
  object dsSubGrupo: TDataSource
    DataSet = cliSubGrupo
    Left = 240
    Top = 656
  end
  object dspModeloMnt: TDataSetProvider
    DataSet = sqlModeloMnt
    UpdateMode = upWhereKeyOnly
    Left = 408
    Top = 261
  end
  object cliModeloMnt: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspModeloMnt'
    Left = 480
    Top = 261
    object cliModeloMntmdm_codigo: TIntegerField
      FieldName = 'mdm_codigo'
    end
    object cliModeloMntmdm_codtsm: TIntegerField
      FieldName = 'mdm_codtsm'
    end
    object cliModeloMntmdm_codmdl: TIntegerField
      FieldName = 'mdm_codmdl'
    end
    object cliModeloMntmdm_kmmanu: TBCDField
      FieldName = 'mdm_kmmanu'
      Precision = 7
      Size = 0
    end
    object cliModeloMntmdm_datmnt: TDateField
      FieldName = 'mdm_datmnt'
    end
    object cliModeloMntmdm_ativo: TBooleanField
      FieldName = 'mdm_ativo'
    end
    object cliModeloMntmdm_usuinc: TStringField
      FieldName = 'mdm_usuinc'
      Size = 15
    end
    object cliModeloMntmdm_datinc: TDateField
      FieldName = 'mdm_datinc'
    end
    object cliModeloMntmdm_horinc: TStringField
      FieldName = 'mdm_horinc'
      Size = 8
    end
    object cliModeloMntmdm_usualt: TStringField
      FieldName = 'mdm_usualt'
      Size = 15
    end
    object cliModeloMntmdm_datalt: TDateField
      FieldName = 'mdm_datalt'
    end
    object cliModeloMntmdm_horalt: TStringField
      FieldName = 'mdm_horalt'
      Size = 8
    end
    object cliModeloMnttsm_codigo: TIntegerField
      FieldName = 'tsm_codigo'
    end
    object cliModeloMnttsm_nome: TStringField
      FieldName = 'tsm_nome'
      Size = 25
    end
    object cliModeloMnttsm_vlrhor: TBCDField
      FieldName = 'tsm_vlrhor'
      Precision = 12
      Size = 2
    end
    object cliModeloMnttsm_codsgm: TIntegerField
      FieldName = 'tsm_codsgm'
    end
    object cliModeloMnttsm_usuinc: TStringField
      FieldName = 'tsm_usuinc'
      Size = 15
    end
    object cliModeloMnttsm_datinc: TDateField
      FieldName = 'tsm_datinc'
    end
    object cliModeloMnttsm_horinc: TStringField
      FieldName = 'tsm_horinc'
      Size = 8
    end
    object cliModeloMnttsm_usualt: TStringField
      FieldName = 'tsm_usualt'
      Size = 15
    end
    object cliModeloMnttsm_datalt: TDateField
      FieldName = 'tsm_datalt'
    end
    object cliModeloMnttsm_horalt: TStringField
      FieldName = 'tsm_horalt'
      Size = 8
    end
  end
  object dsModeloMnt: TDataSource
    DataSet = cliModeloMnt
    Left = 552
    Top = 261
  end
  object dspfabricapcs: TDataSetProvider
    DataSet = sqlfabricapcs
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 1392
  end
  object clifabricapcs: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspfabricapcs'
    Left = 170
    Top = 1392
    object clifabricapcsfbp_codigo: TIntegerField
      FieldName = 'fbp_codigo'
    end
    object clifabricapcsfbp_rsocial: TStringField
      FieldName = 'fbp_rsocial'
      Size = 40
    end
    object clifabricapcsfbp_nome: TStringField
      FieldName = 'fbp_nome'
      Size = 30
    end
    object clifabricapcsfbp_cpfcnpj: TStringField
      FieldName = 'fbp_cpfcnpj'
      Size = 14
    end
    object clifabricapcsfbp_codpct: TStringField
      FieldName = 'fbp_codpct'
      Size = 10
    end
    object clifabricapcsfbp_endereco: TStringField
      FieldName = 'fbp_endereco'
      Size = 35
    end
    object clifabricapcsfbp_numend: TStringField
      FieldName = 'fbp_numend'
      Size = 5
    end
    object clifabricapcsfbp_complem: TStringField
      FieldName = 'fbp_complem'
      Size = 25
    end
    object clifabricapcsfbp_bairro: TStringField
      FieldName = 'fbp_bairro'
      Size = 50
    end
    object clifabricapcsfbp_cep: TStringField
      FieldName = 'fbp_cep'
      Size = 8
    end
    object clifabricapcsfbp_codcid: TIntegerField
      FieldName = 'fbp_codcid'
    end
    object clifabricapcsfbp_telef1: TStringField
      FieldName = 'fbp_telef1'
      Size = 12
    end
    object clifabricapcsfbp_telef2: TStringField
      FieldName = 'fbp_telef2'
      Size = 12
    end
    object clifabricapcsfbp_celula: TStringField
      FieldName = 'fbp_celula'
      Size = 12
    end
    object clifabricapcsfbp_obs: TMemoField
      FieldName = 'fbp_obs'
      BlobType = ftMemo
    end
    object clifabricapcsfbp_ativo: TStringField
      FieldName = 'fbp_ativo'
      Size = 3
    end
    object clifabricapcsfbp_usuinc: TStringField
      FieldName = 'fbp_usuinc'
      Size = 15
    end
    object clifabricapcsfbp_datinc: TDateField
      FieldName = 'fbp_datinc'
    end
    object clifabricapcsfbp_horinc: TStringField
      FieldName = 'fbp_horinc'
      Size = 8
    end
    object clifabricapcsfbp_usualt: TStringField
      FieldName = 'fbp_usualt'
      Size = 15
    end
    object clifabricapcsfbp_datalt: TDateField
      FieldName = 'fbp_datalt'
    end
    object clifabricapcsfbp_horalt: TStringField
      FieldName = 'fbp_horalt'
      Size = 8
    end
    object clifabricapcscid_codigo: TIntegerField
      FieldName = 'cid_codigo'
    end
    object clifabricapcscid_cidnum: TStringField
      FieldName = 'cid_cidnum'
      Size = 8
    end
    object clifabricapcscid_nome: TStringField
      FieldName = 'cid_nome'
      Size = 35
    end
    object clifabricapcscid_codest: TIntegerField
      FieldName = 'cid_codest'
    end
    object clifabricapcscid_codpai: TIntegerField
      FieldName = 'cid_codpai'
    end
    object clifabricapcscid_usuinc: TStringField
      FieldName = 'cid_usuinc'
      Size = 15
    end
    object clifabricapcscid_datinc: TDateField
      FieldName = 'cid_datinc'
    end
    object clifabricapcscid_horinc: TStringField
      FieldName = 'cid_horinc'
      Size = 8
    end
    object clifabricapcscid_usualt: TStringField
      FieldName = 'cid_usualt'
      Size = 15
    end
    object clifabricapcscid_datalt: TDateField
      FieldName = 'cid_datalt'
    end
    object clifabricapcscid_horalt: TStringField
      FieldName = 'cid_horalt'
      Size = 8
    end
    object clifabricapcspct_codigo: TStringField
      FieldName = 'pct_codigo'
      Size = 10
    end
    object clifabricapcspct_cntmae: TStringField
      FieldName = 'pct_cntmae'
      Size = 10
    end
    object clifabricapcspct_nome: TStringField
      FieldName = 'pct_nome'
      Size = 50
    end
    object clifabricapcspct_natureza: TStringField
      FieldName = 'pct_natureza'
      Size = 1
    end
    object clifabricapcspct_tipo: TStringField
      FieldName = 'pct_tipo'
      Size = 1
    end
    object clifabricapcspct_limite: TBCDField
      FieldName = 'pct_limite'
      Precision = 15
      Size = 2
    end
    object clifabricapcspct_meta: TBCDField
      FieldName = 'pct_meta'
      Precision = 15
      Size = 2
    end
    object clifabricapcspct_ord: TBCDField
      FieldName = 'pct_ord'
      Precision = 1
      Size = 0
    end
    object clifabricapcspct_usuinc: TStringField
      FieldName = 'pct_usuinc'
      Size = 15
    end
    object clifabricapcspct_datinc: TDateField
      FieldName = 'pct_datinc'
    end
    object clifabricapcspct_horinc: TStringField
      FieldName = 'pct_horinc'
      Size = 8
    end
    object clifabricapcspct_usualt: TStringField
      FieldName = 'pct_usualt'
      Size = 15
    end
    object clifabricapcspct_datalt: TDateField
      FieldName = 'pct_datalt'
    end
    object clifabricapcspct_horalt: TStringField
      FieldName = 'pct_horalt'
      Size = 8
    end
  end
  object dsfabricapcs: TDataSource
    DataSet = clifabricapcs
    Left = 242
    Top = 1392
  end
  object dstbpecas: TDataSource
    DataSet = clitbpecas
    Left = 242
    Top = 1448
  end
  object clitbpecas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsptbpecas'
    Left = 170
    Top = 1448
    object clitbpecastpc_codigo: TIntegerField
      FieldName = 'tpc_codigo'
    end
    object clitbpecastpc_codfbp: TIntegerField
      FieldName = 'tpc_codfbp'
    end
    object clitbpecastpc_codsgm: TIntegerField
      FieldName = 'tpc_codsgm'
    end
    object clitbpecastpc_codncm: TStringField
      FieldName = 'tpc_codncm'
      Size = 10
    end
    object clitbpecastpc_codcfo: TStringField
      FieldName = 'tpc_codcfo'
      Size = 4
    end
    object clitbpecastpc_codcst: TStringField
      FieldName = 'tpc_codcst'
      Size = 2
    end
    object clitbpecastpc_cdbarra: TStringField
      FieldName = 'tpc_cdbarra'
      Size = 15
    end
    object clitbpecastpc_referen: TStringField
      FieldName = 'tpc_referen'
    end
    object clitbpecastpc_nome: TStringField
      FieldName = 'tpc_nome'
      Size = 40
    end
    object clitbpecastpc_medida: TStringField
      FieldName = 'tpc_medida'
      Size = 3
    end
    object clitbpecastpc_kgpeso: TBCDField
      FieldName = 'tpc_kgpeso'
      Precision = 15
      Size = 3
    end
    object clitbpecastpc_kgcubag: TBCDField
      FieldName = 'tpc_kgcubag'
      Precision = 15
      Size = 3
    end
    object clitbpecastpc_ativo: TBooleanField
      FieldName = 'tpc_ativo'
    end
    object clitbpecastpc_datpro: TDateField
      FieldName = 'tpc_datpro'
    end
    object clitbpecastpc_datems: TDateField
      FieldName = 'tpc_datems'
    end
    object clitbpecastpc_usuinc: TStringField
      FieldName = 'tpc_usuinc'
      Size = 15
    end
    object clitbpecastpc_datinc: TDateField
      FieldName = 'tpc_datinc'
    end
    object clitbpecastpc_horinc: TStringField
      FieldName = 'tpc_horinc'
      Size = 8
    end
    object clitbpecastpc_usualt: TStringField
      FieldName = 'tpc_usualt'
      Size = 15
    end
    object clitbpecastpc_datalt: TDateField
      FieldName = 'tpc_datalt'
    end
    object clitbpecastpc_horalt: TStringField
      FieldName = 'tpc_horalt'
      Size = 8
    end
    object clitbpecasfbp_codigo: TIntegerField
      FieldName = 'fbp_codigo'
    end
    object clitbpecasfbp_rsocial: TStringField
      FieldName = 'fbp_rsocial'
      Size = 40
    end
    object clitbpecasfbp_nome: TStringField
      FieldName = 'fbp_nome'
      Size = 30
    end
    object clitbpecasfbp_cpfcnpj: TStringField
      FieldName = 'fbp_cpfcnpj'
      Size = 14
    end
    object clitbpecasfbp_codpct: TStringField
      FieldName = 'fbp_codpct'
      Size = 10
    end
    object clitbpecasfbp_endereco: TStringField
      FieldName = 'fbp_endereco'
      Size = 35
    end
    object clitbpecasfbp_numend: TStringField
      FieldName = 'fbp_numend'
      Size = 5
    end
    object clitbpecasfbp_complem: TStringField
      FieldName = 'fbp_complem'
      Size = 25
    end
    object clitbpecasfbp_bairro: TStringField
      FieldName = 'fbp_bairro'
      Size = 50
    end
    object clitbpecasfbp_cep: TStringField
      FieldName = 'fbp_cep'
      Size = 8
    end
    object clitbpecasfbp_codcid: TIntegerField
      FieldName = 'fbp_codcid'
    end
    object clitbpecasfbp_telef1: TStringField
      FieldName = 'fbp_telef1'
      Size = 12
    end
    object clitbpecasfbp_telef2: TStringField
      FieldName = 'fbp_telef2'
      Size = 12
    end
    object clitbpecasfbp_celula: TStringField
      FieldName = 'fbp_celula'
      Size = 12
    end
    object clitbpecasfbp_obs: TMemoField
      FieldName = 'fbp_obs'
      BlobType = ftMemo
    end
    object clitbpecasfbp_ativo: TStringField
      FieldName = 'fbp_ativo'
      Size = 3
    end
    object clitbpecasfbp_usuinc: TStringField
      FieldName = 'fbp_usuinc'
      Size = 15
    end
    object clitbpecasfbp_datinc: TDateField
      FieldName = 'fbp_datinc'
    end
    object clitbpecasfbp_horinc: TStringField
      FieldName = 'fbp_horinc'
      Size = 8
    end
    object clitbpecasfbp_usualt: TStringField
      FieldName = 'fbp_usualt'
      Size = 15
    end
    object clitbpecasfbp_datalt: TDateField
      FieldName = 'fbp_datalt'
    end
    object clitbpecasfbp_horalt: TStringField
      FieldName = 'fbp_horalt'
      Size = 8
    end
    object clitbpecasncm_codigo: TStringField
      FieldName = 'ncm_codigo'
      Size = 10
    end
    object clitbpecasncm_nome: TStringField
      FieldName = 'ncm_nome'
      Size = 350
    end
    object clitbpecasncm_usuinc: TStringField
      FieldName = 'ncm_usuinc'
      Size = 15
    end
    object clitbpecasncm_datinc: TDateField
      FieldName = 'ncm_datinc'
    end
    object clitbpecasncm_horinc: TStringField
      FieldName = 'ncm_horinc'
      Size = 8
    end
    object clitbpecasncm_usualt: TStringField
      FieldName = 'ncm_usualt'
      Size = 15
    end
    object clitbpecasncm_datalt: TDateField
      FieldName = 'ncm_datalt'
    end
    object clitbpecasncm_horalt: TStringField
      FieldName = 'ncm_horalt'
      Size = 8
    end
    object clitbpecascfo_codigo: TStringField
      FieldName = 'cfo_codigo'
      Size = 4
    end
    object clitbpecascfo_nome: TStringField
      FieldName = 'cfo_nome'
      Size = 350
    end
    object clitbpecascfo_usuinc: TStringField
      FieldName = 'cfo_usuinc'
      Size = 15
    end
    object clitbpecascfo_datinc: TDateField
      FieldName = 'cfo_datinc'
    end
    object clitbpecascfo_horinc: TStringField
      FieldName = 'cfo_horinc'
      Size = 8
    end
    object clitbpecascfo_usualt: TStringField
      FieldName = 'cfo_usualt'
      Size = 15
    end
    object clitbpecascfo_datalt: TDateField
      FieldName = 'cfo_datalt'
    end
    object clitbpecascfo_horalt: TStringField
      FieldName = 'cfo_horalt'
      Size = 8
    end
    object clitbpecascst_codigo: TStringField
      FieldName = 'cst_codigo'
      Size = 2
    end
    object clitbpecascst_descri: TStringField
      FieldName = 'cst_descri'
      Size = 100
    end
    object clitbpecascst_clcicm: TBooleanField
      FieldName = 'cst_clcicm'
    end
    object clitbpecascst_cf: TStringField
      FieldName = 'cst_cf'
      Size = 5
    end
    object clitbpecascst_usuinc: TStringField
      FieldName = 'cst_usuinc'
      Size = 15
    end
    object clitbpecascst_datinc: TDateField
      FieldName = 'cst_datinc'
    end
    object clitbpecascst_horinc: TStringField
      FieldName = 'cst_horinc'
      Size = 8
    end
    object clitbpecascst_usualt: TStringField
      FieldName = 'cst_usualt'
      Size = 15
    end
    object clitbpecascst_datalt: TDateField
      FieldName = 'cst_datalt'
    end
    object clitbpecascst_horalt: TStringField
      FieldName = 'cst_horalt'
      Size = 8
    end
    object clitbpecassgm_codigo: TIntegerField
      FieldName = 'sgm_codigo'
    end
    object clitbpecassgm_nome: TStringField
      FieldName = 'sgm_nome'
      Size = 25
    end
    object clitbpecassgm_codgrm: TIntegerField
      FieldName = 'sgm_codgrm'
    end
    object clitbpecassgm_usuinc: TStringField
      FieldName = 'sgm_usuinc'
      Size = 15
    end
    object clitbpecassgm_datinc: TDateField
      FieldName = 'sgm_datinc'
    end
    object clitbpecassgm_horinc: TStringField
      FieldName = 'sgm_horinc'
      Size = 8
    end
    object clitbpecassgm_usualt: TStringField
      FieldName = 'sgm_usualt'
      Size = 15
    end
    object clitbpecassgm_datalt: TDateField
      FieldName = 'sgm_datalt'
    end
    object clitbpecassgm_horalt: TStringField
      FieldName = 'sgm_horalt'
      Size = 8
    end
    object clitbpecasgrm_codigo: TIntegerField
      FieldName = 'grm_codigo'
    end
    object clitbpecasgrm_nome: TStringField
      FieldName = 'grm_nome'
      Size = 40
    end
    object clitbpecasgrm_usuinc: TStringField
      FieldName = 'grm_usuinc'
      Size = 15
    end
    object clitbpecasgrm_datinc: TDateField
      FieldName = 'grm_datinc'
    end
    object clitbpecasgrm_horinc: TStringField
      FieldName = 'grm_horinc'
      Size = 8
    end
    object clitbpecasgrm_usualt: TStringField
      FieldName = 'grm_usualt'
      Size = 15
    end
    object clitbpecasgrm_datalt: TDateField
      FieldName = 'grm_datalt'
    end
    object clitbpecasgrm_horalt: TStringField
      FieldName = 'grm_horalt'
      Size = 8
    end
  end
  object dsptbpecas: TDataSetProvider
    DataSet = sqltbpecas
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 1448
  end
  object dspGrupocli: TDataSetProvider
    DataSet = sqlGrupocli
    UpdateMode = upWhereKeyOnly
    Left = 408
    Top = 1378
  end
  object cliGrupocli: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrupocli'
    Left = 488
    Top = 1378
    object cliGrupocligcl_codigo: TIntegerField
      FieldName = 'gcl_codigo'
    end
    object cliGrupocligcl_nome: TStringField
      FieldName = 'gcl_nome'
    end
    object cliGrupocligcl_usuinc: TStringField
      FieldName = 'gcl_usuinc'
      Size = 15
    end
    object cliGrupocligcl_datinc: TDateField
      FieldName = 'gcl_datinc'
    end
    object cliGrupocligcl_horinc: TStringField
      FieldName = 'gcl_horinc'
      Size = 8
    end
    object cliGrupocligcl_usualt: TStringField
      FieldName = 'gcl_usualt'
      Size = 15
    end
    object cliGrupocligcl_datalt: TDateField
      FieldName = 'gcl_datalt'
    end
    object cliGrupocligcl_horalt: TStringField
      FieldName = 'gcl_horalt'
      Size = 8
    end
  end
  object dsGrupocli: TDataSource
    DataSet = cliGrupocli
    Left = 560
    Top = 1378
  end
  object dsTbrecurso: TDataSource
    DataSet = cliTbrecurso
    Left = 242
    Top = 1504
  end
  object cliTbrecurso: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTbrecurso'
    Left = 170
    Top = 1504
    object cliTbrecursotbr_codigo: TIntegerField
      FieldName = 'tbr_codigo'
    end
    object cliTbrecursotbr_nome: TStringField
      FieldName = 'tbr_nome'
      Size = 25
    end
    object cliTbrecursotbr_codpct: TStringField
      FieldName = 'tbr_codpct'
      Size = 10
    end
    object cliTbrecursotbr_vlrrec: TBCDField
      FieldName = 'tbr_vlrrec'
      Precision = 15
      Size = 2
    end
    object cliTbrecursotbr_usuinc: TStringField
      FieldName = 'tbr_usuinc'
      Size = 15
    end
    object cliTbrecursotbr_datinc: TDateField
      FieldName = 'tbr_datinc'
    end
    object cliTbrecursotbr_horinc: TStringField
      FieldName = 'tbr_horinc'
      Size = 8
    end
    object cliTbrecursotbr_usualt: TStringField
      FieldName = 'tbr_usualt'
      Size = 15
    end
    object cliTbrecursotbr_datalt: TDateField
      FieldName = 'tbr_datalt'
    end
    object cliTbrecursotbr_horalt: TStringField
      FieldName = 'tbr_horalt'
      Size = 8
    end
  end
  object dspTbrecurso: TDataSetProvider
    DataSet = sqlTbrecurso
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 1504
  end
  object sqlUsuario: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * From "dbconfig".Usuario')
    Left = 32
    Top = 152
    object sqlUsuariousu_codusu: TIntegerField
      FieldName = 'usu_codusu'
      Origin = 'usu_codusu'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlUsuariousu_nome: TStringField
      FieldName = 'usu_nome'
      Origin = 'usu_nome'
      Size = 50
    end
    object sqlUsuariousu_login: TStringField
      FieldName = 'usu_login'
      Origin = 'usu_login'
      Size = 15
    end
    object sqlUsuariousu_senha: TStringField
      FieldName = 'usu_senha'
      Origin = 'usu_senha'
      Size = 10
    end
    object sqlUsuariousu_codgru: TIntegerField
      FieldName = 'usu_codgru'
      Origin = 'usu_codgru'
    end
    object sqlUsuariousu_codsgr: TIntegerField
      FieldName = 'usu_codsgr'
      Origin = 'usu_codsgr'
    end
    object sqlUsuariousu_codltd: TIntegerField
      FieldName = 'usu_codltd'
      Origin = 'usu_codltd'
    end
    object sqlUsuariousu_email: TStringField
      FieldName = 'usu_email'
      Origin = 'usu_email'
      Size = 100
    end
    object sqlUsuariousu_usuario: TStringField
      FieldName = 'usu_usuario'
      Origin = 'usu_usuario'
      Size = 100
    end
    object sqlUsuariousu_senema: TStringField
      FieldName = 'usu_senema'
      Origin = 'usu_senema'
    end
    object sqlUsuariousu_smtp: TStringField
      FieldName = 'usu_smtp'
      Origin = 'usu_smtp'
      Size = 100
    end
    object sqlUsuariousu_porta: TStringField
      FieldName = 'usu_porta'
      Origin = 'usu_porta'
      Size = 5
    end
    object sqlUsuariousu_tsl: TStringField
      FieldName = 'usu_tsl'
      Origin = 'usu_tsl'
      Size = 15
    end
    object sqlUsuariousu_metodo: TStringField
      FieldName = 'usu_metodo'
      Origin = 'usu_metodo'
      Size = 15
    end
    object sqlUsuariousu_modseg: TStringField
      FieldName = 'usu_modseg'
      Origin = 'usu_modseg'
      FixedChar = True
      Size = 1
    end
    object sqlUsuariousu_autent: TStringField
      FieldName = 'usu_autent'
      Origin = 'usu_autent'
      FixedChar = True
      Size = 1
    end
    object sqlUsuariousu_foto: TBlobField
      FieldName = 'usu_foto'
      Origin = 'usu_foto'
    end
    object sqlUsuariousu_database: TStringField
      FieldName = 'usu_database'
      Origin = 'usu_database'
      Size = 70
    end
    object sqlUsuariousu_autoriza: TBooleanField
      FieldName = 'usu_autoriza'
      Origin = 'usu_autoriza'
    end
    object sqlUsuariousu_usuinc: TStringField
      FieldName = 'usu_usuinc'
      Origin = 'usu_usuinc'
      Size = 15
    end
    object sqlUsuariousu_datinc: TDateField
      FieldName = 'usu_datinc'
      Origin = 'usu_datinc'
    end
    object sqlUsuariousu_horinc: TStringField
      FieldName = 'usu_horinc'
      Origin = 'usu_horinc'
      Size = 8
    end
    object sqlUsuariousu_usualt: TStringField
      FieldName = 'usu_usualt'
      Origin = 'usu_usualt'
      Size = 15
    end
    object sqlUsuariousu_datalt: TDateField
      FieldName = 'usu_datalt'
      Origin = 'usu_datalt'
    end
    object sqlUsuariousu_horalt: TStringField
      FieldName = 'usu_horalt'
      Origin = 'usu_horalt'
      Size = 8
    end
  end
  object sqlCfop: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'SELECT * From "dbconfig".cfop')
    Left = 336
    Top = 920
    object sqlCfopcfo_codigo: TStringField
      FieldName = 'cfo_codigo'
      Origin = 'cfo_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 4
    end
    object sqlCfopcfo_nome: TStringField
      FieldName = 'cfo_nome'
      Origin = 'cfo_nome'
      Size = 350
    end
    object sqlCfopcfo_usuinc: TStringField
      FieldName = 'cfo_usuinc'
      Origin = 'cfo_usuinc'
      Size = 15
    end
    object sqlCfopcfo_datinc: TDateField
      FieldName = 'cfo_datinc'
      Origin = 'cfo_datinc'
    end
    object sqlCfopcfo_horinc: TStringField
      FieldName = 'cfo_horinc'
      Origin = 'cfo_horinc'
      Size = 8
    end
    object sqlCfopcfo_usualt: TStringField
      FieldName = 'cfo_usualt'
      Origin = 'cfo_usualt'
      Size = 15
    end
    object sqlCfopcfo_datalt: TDateField
      FieldName = 'cfo_datalt'
      Origin = 'cfo_datalt'
    end
    object sqlCfopcfo_horalt: TStringField
      FieldName = 'cfo_horalt'
      Origin = 'cfo_horalt'
      Size = 8
    end
  end
  object sqlUsuCaixa: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * From "dbconfig".usuempresa')
    Left = 32
    Top = 208
    object sqlUsuCaixause_codeus: TIntegerField
      FieldName = 'use_codeus'
      Origin = 'use_codeus'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlUsuCaixause_codemp: TIntegerField
      FieldName = 'use_codemp'
      Origin = 'use_codemp'
    end
    object sqlUsuCaixause_codusu: TIntegerField
      FieldName = 'use_codusu'
      Origin = 'use_codusu'
    end
    object sqlUsuCaixause_usuinc: TStringField
      FieldName = 'use_usuinc'
      Origin = 'use_usuinc'
      Size = 15
    end
    object sqlUsuCaixause_datinc: TDateField
      FieldName = 'use_datinc'
      Origin = 'use_datinc'
    end
    object sqlUsuCaixause_horinc: TStringField
      FieldName = 'use_horinc'
      Origin = 'use_horinc'
      Size = 8
    end
    object sqlUsuCaixause_usualt: TStringField
      FieldName = 'use_usualt'
      Origin = 'use_usualt'
      Size = 15
    end
    object sqlUsuCaixause_datalt: TDateField
      FieldName = 'use_datalt'
      Origin = 'use_datalt'
    end
    object sqlUsuCaixause_horalt: TStringField
      FieldName = 'use_horalt'
      Origin = 'use_horalt'
      Size = 8
    end
  end
  object sqlUsuEmp: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * From "dbconfig".usuempresa')
    Left = 32
    Top = 264
  end
  object sqlEmpresa: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * from "dbconfig".empresa '
      'LEFT JOIN "dbconfig".cidade on cid_codigo = emp_codcid'
      'LEFT JOIN "dbconfig".estado on est_codigo = cid_codest'
      'LEFT JOIN "dbconfig".pais on pai_codigo = cid_codpai')
    Left = 32
    Top = 320
    object sqlEmpresaemp_codemp: TIntegerField
      FieldName = 'emp_codemp'
      Origin = 'emp_codemp'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlEmpresaemp_nome: TStringField
      FieldName = 'emp_nome'
      Origin = 'emp_nome'
      Size = 100
    end
    object sqlEmpresaemp_fantasia: TStringField
      FieldName = 'emp_fantasia'
      Origin = 'emp_fantasia'
      Size = 70
    end
    object sqlEmpresaemp_cnpj: TStringField
      FieldName = 'emp_cnpj'
      Origin = 'emp_cnpj'
      Size = 14
    end
    object sqlEmpresaemp_dtbase: TStringField
      FieldName = 'emp_dtbase'
      Origin = 'emp_dtbase'
    end
    object sqlEmpresaemp_tipo: TStringField
      FieldName = 'emp_tipo'
      Origin = 'emp_tipo'
    end
    object sqlEmpresaemp_situacao: TStringField
      FieldName = 'emp_situacao'
      Origin = 'emp_situacao'
    end
    object sqlEmpresaemp_dtabertura: TDateField
      FieldName = 'emp_dtabertura'
      Origin = 'emp_dtabertura'
    end
    object sqlEmpresaemp_endemp: TStringField
      FieldName = 'emp_endemp'
      Origin = 'emp_endemp'
      Size = 45
    end
    object sqlEmpresaemp_numemp: TStringField
      FieldName = 'emp_numemp'
      Origin = 'emp_numemp'
      Size = 10
    end
    object sqlEmpresaemp_comemp: TStringField
      FieldName = 'emp_comemp'
      Origin = 'emp_comemp'
      Size = 50
    end
    object sqlEmpresaemp_baiemp: TStringField
      FieldName = 'emp_baiemp'
      Origin = 'emp_baiemp'
      Size = 50
    end
    object sqlEmpresaemp_codcid: TIntegerField
      FieldName = 'emp_codcid'
      Origin = 'emp_codcid'
    end
    object sqlEmpresaemp_cepemp: TStringField
      FieldName = 'emp_cepemp'
      Origin = 'emp_cepemp'
      Size = 8
    end
    object sqlEmpresaemp_telemp: TStringField
      FieldName = 'emp_telemp'
      Origin = 'emp_telemp'
      Size = 11
    end
    object sqlEmpresaemp_tl1emp: TStringField
      FieldName = 'emp_tl1emp'
      Origin = 'emp_tl1emp'
      Size = 11
    end
    object sqlEmpresaemp_tl2emp: TStringField
      FieldName = 'emp_tl2emp'
      Origin = 'emp_tl2emp'
      Size = 11
    end
    object sqlEmpresaemp_faxemp: TStringField
      FieldName = 'emp_faxemp'
      Origin = 'emp_faxemp'
      Size = 11
    end
    object sqlEmpresaemp_insces: TStringField
      FieldName = 'emp_insces'
      Origin = 'emp_insces'
    end
    object sqlEmpresaemp_inscmu: TStringField
      FieldName = 'emp_inscmu'
      Origin = 'emp_inscmu'
    end
    object sqlEmpresaemp_sufram: TStringField
      FieldName = 'emp_sufram'
      Origin = 'emp_sufram'
      Size = 10
    end
    object sqlEmpresaemp_codcna: TStringField
      FieldName = 'emp_codcna'
      Origin = 'emp_codcna'
      Size = 7
    end
    object sqlEmpresaemp_codcrt: TStringField
      FieldName = 'emp_codcrt'
      Origin = 'emp_codcrt'
      Size = 1
    end
    object sqlEmpresaemp_irpj: TBCDField
      FieldName = 'emp_irpj'
      Origin = 'emp_irpj'
      Precision = 5
      Size = 2
    end
    object sqlEmpresaemp_pispasep: TBCDField
      FieldName = 'emp_pispasep'
      Origin = 'emp_pispasep'
      Precision = 5
      Size = 2
    end
    object sqlEmpresaemp_csll: TBCDField
      FieldName = 'emp_csll'
      Origin = 'emp_csll'
      Precision = 5
      Size = 2
    end
    object sqlEmpresaemp_cofins: TBCDField
      FieldName = 'emp_cofins'
      Origin = 'emp_cofins'
      Precision = 5
      Size = 2
    end
    object sqlEmpresaemp_inss: TBCDField
      FieldName = 'emp_inss'
      Origin = 'emp_inss'
      Precision = 5
      Size = 2
    end
    object sqlEmpresaemp_iss: TBCDField
      FieldName = 'emp_iss'
      Origin = 'emp_iss'
      Precision = 5
      Size = 2
    end
    object sqlEmpresaemp_csticms: TStringField
      FieldName = 'emp_csticms'
      Origin = 'emp_csticms'
      Size = 3
    end
    object sqlEmpresaemp_cstpis: TStringField
      FieldName = 'emp_cstpis'
      Origin = 'emp_cstpis'
      Size = 3
    end
    object sqlEmpresaemp_cstcofins: TStringField
      FieldName = 'emp_cstcofins'
      Origin = 'emp_cstcofins'
      Size = 3
    end
    object sqlEmpresaemp_cstipi: TStringField
      FieldName = 'emp_cstipi'
      Origin = 'emp_cstipi'
      Size = 3
    end
    object sqlEmpresaemp_natcnpj: TStringField
      FieldName = 'emp_natcnpj'
      Origin = 'emp_natcnpj'
      Size = 2
    end
    object sqlEmpresaemp_atvprep: TStringField
      FieldName = 'emp_atvprep'
      Origin = 'emp_atvprep'
      Size = 2
    end
    object sqlEmpresaemp_datexe: TDateField
      FieldName = 'emp_datexe'
      Origin = 'emp_datexe'
    end
    object sqlEmpresaemp_horexe: TStringField
      FieldName = 'emp_horexe'
      Origin = 'emp_horexe'
      Size = 8
    end
    object sqlEmpresaemp_logo: TBlobField
      FieldName = 'emp_logo'
      Origin = 'emp_logo'
    end
    object sqlEmpresaemp_site: TStringField
      FieldName = 'emp_site'
      Origin = 'emp_site'
      Size = 100
    end
    object sqlEmpresaemp_email: TStringField
      FieldName = 'emp_email'
      Origin = 'emp_email'
      Size = 100
    end
    object sqlEmpresaemp_usuinc: TStringField
      FieldName = 'emp_usuinc'
      Origin = 'emp_usuinc'
      Size = 15
    end
    object sqlEmpresaemp_datinc: TDateField
      FieldName = 'emp_datinc'
      Origin = 'emp_datinc'
    end
    object sqlEmpresaemp_horinc: TStringField
      FieldName = 'emp_horinc'
      Origin = 'emp_horinc'
      Size = 8
    end
    object sqlEmpresaemp_usualt: TStringField
      FieldName = 'emp_usualt'
      Origin = 'emp_usualt'
      Size = 15
    end
    object sqlEmpresaemp_datalt: TDateField
      FieldName = 'emp_datalt'
      Origin = 'emp_datalt'
    end
    object sqlEmpresaemp_horalt: TStringField
      FieldName = 'emp_horalt'
      Origin = 'emp_horalt'
      Size = 8
    end
    object sqlEmpresacid_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cid_codigo'
      Origin = 'cid_codigo'
    end
    object sqlEmpresacid_cidnum: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_cidnum'
      Origin = 'cid_cidnum'
      Size = 8
    end
    object sqlEmpresacid_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_nome'
      Origin = 'cid_nome'
      Size = 35
    end
    object sqlEmpresacid_codest: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cid_codest'
      Origin = 'cid_codest'
    end
    object sqlEmpresacid_codpai: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cid_codpai'
      Origin = 'cid_codpai'
    end
    object sqlEmpresacid_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_usuinc'
      Origin = 'cid_usuinc'
      Size = 15
    end
    object sqlEmpresacid_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cid_datinc'
      Origin = 'cid_datinc'
    end
    object sqlEmpresacid_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_horinc'
      Origin = 'cid_horinc'
      Size = 8
    end
    object sqlEmpresacid_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_usualt'
      Origin = 'cid_usualt'
      Size = 15
    end
    object sqlEmpresacid_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cid_datalt'
      Origin = 'cid_datalt'
    end
    object sqlEmpresacid_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_horalt'
      Origin = 'cid_horalt'
      Size = 8
    end
    object sqlEmpresaest_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'est_codigo'
      Origin = 'est_codigo'
    end
    object sqlEmpresaest_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'est_nome'
      Origin = 'est_nome'
      Size = 50
    end
    object sqlEmpresaest_uf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'est_uf'
      Origin = 'est_uf'
      Size = 2
    end
    object sqlEmpresaest_codpai: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'est_codpai'
      Origin = 'est_codpai'
    end
    object sqlEmpresaest_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'est_usuinc'
      Origin = 'est_usuinc'
      Size = 15
    end
    object sqlEmpresaest_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'est_datinc'
      Origin = 'est_datinc'
    end
    object sqlEmpresaest_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'est_horinc'
      Origin = 'est_horinc'
      Size = 8
    end
    object sqlEmpresaest_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'est_usualt'
      Origin = 'est_usualt'
      Size = 15
    end
    object sqlEmpresaest_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'est_datalt'
      Origin = 'est_datalt'
    end
    object sqlEmpresaest_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'est_horalt'
      Origin = 'est_horalt'
      Size = 8
    end
    object sqlEmpresapai_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'pai_codigo'
      Origin = 'pai_codigo'
    end
    object sqlEmpresapai_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pai_nome'
      Origin = 'pai_nome'
      Size = 50
    end
    object sqlEmpresapai_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pai_usuinc'
      Origin = 'pai_usuinc'
      Size = 15
    end
    object sqlEmpresapai_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pai_datinc'
      Origin = 'pai_datinc'
    end
    object sqlEmpresapai_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pai_horinc'
      Origin = 'pai_horinc'
      Size = 8
    end
    object sqlEmpresapai_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pai_usualt'
      Origin = 'pai_usualt'
      Size = 15
    end
    object sqlEmpresapai_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pai_datalt'
      Origin = 'pai_datalt'
    end
    object sqlEmpresapai_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pai_horalt'
      Origin = 'pai_horalt'
      Size = 8
    end
  end
  object sqlCidade: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * From "dbconfig".Cidade'
      'left join "dbconfig".pais on pai_codigo = cid_codpai'
      'left join "dbconfig".estado on est_codigo = cid_codest')
    Left = 32
    Top = 370
    object sqlCidadecid_codigo: TIntegerField
      FieldName = 'cid_codigo'
      Origin = 'cid_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlCidadecid_cidnum: TStringField
      FieldName = 'cid_cidnum'
      Origin = 'cid_cidnum'
      Size = 8
    end
    object sqlCidadecid_nome: TStringField
      FieldName = 'cid_nome'
      Origin = 'cid_nome'
      Size = 35
    end
    object sqlCidadecid_codest: TIntegerField
      FieldName = 'cid_codest'
      Origin = 'cid_codest'
    end
    object sqlCidadecid_codpai: TIntegerField
      FieldName = 'cid_codpai'
      Origin = 'cid_codpai'
    end
    object sqlCidadecid_usuinc: TStringField
      FieldName = 'cid_usuinc'
      Origin = 'cid_usuinc'
      Size = 15
    end
    object sqlCidadecid_datinc: TDateField
      FieldName = 'cid_datinc'
      Origin = 'cid_datinc'
    end
    object sqlCidadecid_horinc: TStringField
      FieldName = 'cid_horinc'
      Origin = 'cid_horinc'
      Size = 8
    end
    object sqlCidadecid_usualt: TStringField
      FieldName = 'cid_usualt'
      Origin = 'cid_usualt'
      Size = 15
    end
    object sqlCidadecid_datalt: TDateField
      FieldName = 'cid_datalt'
      Origin = 'cid_datalt'
    end
    object sqlCidadecid_horalt: TStringField
      FieldName = 'cid_horalt'
      Origin = 'cid_horalt'
      Size = 8
    end
    object sqlCidadepai_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'pai_codigo'
      Origin = 'pai_codigo'
    end
    object sqlCidadepai_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pai_nome'
      Origin = 'pai_nome'
      Size = 50
    end
    object sqlCidadepai_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pai_usuinc'
      Origin = 'pai_usuinc'
      Size = 15
    end
    object sqlCidadepai_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pai_datinc'
      Origin = 'pai_datinc'
    end
    object sqlCidadepai_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pai_horinc'
      Origin = 'pai_horinc'
      Size = 8
    end
    object sqlCidadepai_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pai_usualt'
      Origin = 'pai_usualt'
      Size = 15
    end
    object sqlCidadepai_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pai_datalt'
      Origin = 'pai_datalt'
    end
    object sqlCidadepai_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pai_horalt'
      Origin = 'pai_horalt'
      Size = 8
    end
    object sqlCidadeest_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'est_codigo'
      Origin = 'est_codigo'
    end
    object sqlCidadeest_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'est_nome'
      Origin = 'est_nome'
      Size = 50
    end
    object sqlCidadeest_uf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'est_uf'
      Origin = 'est_uf'
      Size = 2
    end
    object sqlCidadeest_codpai: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'est_codpai'
      Origin = 'est_codpai'
    end
    object sqlCidadeest_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'est_usuinc'
      Origin = 'est_usuinc'
      Size = 15
    end
    object sqlCidadeest_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'est_datinc'
      Origin = 'est_datinc'
    end
    object sqlCidadeest_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'est_horinc'
      Origin = 'est_horinc'
      Size = 8
    end
    object sqlCidadeest_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'est_usualt'
      Origin = 'est_usualt'
      Size = 15
    end
    object sqlCidadeest_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'est_datalt'
      Origin = 'est_datalt'
    end
    object sqlCidadeest_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'est_horalt'
      Origin = 'est_horalt'
      Size = 8
    end
  end
  object sqlAuditor: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * From "dbconfig".auditor')
    Left = 32
    Top = 426
    object sqlAuditoradt_codaud: TIntegerField
      FieldName = 'adt_codaud'
      Origin = 'adt_codaud'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlAuditoradt_usuario: TStringField
      FieldName = 'adt_usuario'
      Origin = 'adt_usuario'
      Size = 15
    end
    object sqlAuditoradt_modulo: TStringField
      FieldName = 'adt_modulo'
      Origin = 'adt_modulo'
      Size = 150
    end
    object sqlAuditoradt_acao: TStringField
      FieldName = 'adt_acao'
      Origin = 'adt_acao'
      Size = 150
    end
    object sqlAuditoradt_obs: TStringField
      FieldName = 'adt_obs'
      Origin = 'adt_obs'
      Size = 80
    end
    object sqlAuditoradt_dtacao: TDateField
      FieldName = 'adt_dtacao'
      Origin = 'adt_dtacao'
    end
    object sqlAuditoradt_hracao: TStringField
      FieldName = 'adt_hracao'
      Origin = 'adt_hracao'
      Size = 8
    end
    object sqlAuditoradt_dtbase: TStringField
      FieldName = 'adt_dtbase'
      Origin = 'adt_dtbase'
    end
    object sqlAuditoradt_codemp: TIntegerField
      FieldName = 'adt_codemp'
      Origin = 'adt_codemp'
    end
    object sqlAuditoradt_codusu: TIntegerField
      FieldName = 'adt_codusu'
      Origin = 'adt_codusu'
    end
  end
  object sqlPermissao: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select *  From "dbconfig".permissao')
    Left = 31
    Top = 488
    object sqlPermissaoprm_codper: TIntegerField
      FieldName = 'prm_codper'
      Origin = 'prm_codper'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlPermissaoprm_codusu: TIntegerField
      FieldName = 'prm_codusu'
      Origin = 'prm_codusu'
    end
    object sqlPermissaoprm_codniv: TIntegerField
      FieldName = 'prm_codniv'
      Origin = 'prm_codniv'
    end
    object sqlPermissaoprm_codgru: TIntegerField
      FieldName = 'prm_codgru'
      Origin = 'prm_codgru'
    end
    object sqlPermissaoprm_formda: TStringField
      FieldName = 'prm_formda'
      Origin = 'prm_formda'
    end
    object sqlPermissaoprm_titulo: TStringField
      FieldName = 'prm_titulo'
      Origin = 'prm_titulo'
      Size = 35
    end
    object sqlPermissaoprm_modl: TStringField
      FieldName = 'prm_modl'
      Origin = 'prm_modl'
      Size = 1
    end
    object sqlPermissaoprm_lei: TBooleanField
      FieldName = 'prm_lei'
      Origin = 'prm_lei'
    end
    object sqlPermissaoprm_gra: TBooleanField
      FieldName = 'prm_gra'
      Origin = 'prm_gra'
    end
    object sqlPermissaoprm_alt: TBooleanField
      FieldName = 'prm_alt'
      Origin = 'prm_alt'
    end
    object sqlPermissaoprm_exc: TBooleanField
      FieldName = 'prm_exc'
      Origin = 'prm_exc'
    end
    object sqlPermissaoprm_usuinc: TStringField
      FieldName = 'prm_usuinc'
      Origin = 'prm_usuinc'
      Size = 15
    end
    object sqlPermissaoprm_datinc: TDateField
      FieldName = 'prm_datinc'
      Origin = 'prm_datinc'
    end
    object sqlPermissaoprm_horinc: TStringField
      FieldName = 'prm_horinc'
      Origin = 'prm_horinc'
      Size = 8
    end
    object sqlPermissaoprm_usualt: TStringField
      FieldName = 'prm_usualt'
      Origin = 'prm_usualt'
      Size = 15
    end
    object sqlPermissaoprm_datalt: TDateField
      FieldName = 'prm_datalt'
      Origin = 'prm_datalt'
    end
    object sqlPermissaoprm_horalt: TStringField
      FieldName = 'prm_horalt'
      Origin = 'prm_horalt'
      Size = 8
    end
  end
  object sqlConfigura: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * From "dbconfig".configura')
    Left = 32
    Top = 544
    object sqlConfiguracfg_codigo: TIntegerField
      FieldName = 'cfg_codigo'
      Origin = 'cfg_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlConfiguracfg_empresa: TStringField
      FieldName = 'cfg_empresa'
      Origin = 'cfg_empresa'
      Size = 61
    end
    object sqlConfiguracfg_fantasia: TStringField
      FieldName = 'cfg_fantasia'
      Origin = 'cfg_fantasia'
      Size = 50
    end
    object sqlConfiguracfg_cnpj: TStringField
      FieldName = 'cfg_cnpj'
      Origin = 'cfg_cnpj'
      Size = 15
    end
    object sqlConfiguracfg_endereco: TStringField
      FieldName = 'cfg_endereco'
      Origin = 'cfg_endereco'
      Size = 30
    end
    object sqlConfiguracfg_numero: TStringField
      FieldName = 'cfg_numero'
      Origin = 'cfg_numero'
      Size = 5
    end
    object sqlConfiguracfg_comple: TStringField
      FieldName = 'cfg_comple'
      Origin = 'cfg_comple'
    end
    object sqlConfiguracfg_bairro: TStringField
      FieldName = 'cfg_bairro'
      Origin = 'cfg_bairro'
      Size = 50
    end
    object sqlConfiguracfg_codcid: TIntegerField
      FieldName = 'cfg_codcid'
      Origin = 'cfg_codcid'
    end
    object sqlConfiguracfg_telef1: TStringField
      FieldName = 'cfg_telef1'
      Origin = 'cfg_telef1'
      Size = 10
    end
    object sqlConfiguracfg_telef2: TStringField
      FieldName = 'cfg_telef2'
      Origin = 'cfg_telef2'
      Size = 10
    end
    object sqlConfiguracfg_cep: TStringField
      FieldName = 'cfg_cep'
      Origin = 'cfg_cep'
      Size = 8
    end
    object sqlConfiguracfg_site: TStringField
      FieldName = 'cfg_site'
      Origin = 'cfg_site'
      Size = 100
    end
    object sqlConfiguracfg_email: TStringField
      FieldName = 'cfg_email'
      Origin = 'cfg_email'
      Size = 100
    end
    object sqlConfiguracfg_conexao: TStringField
      FieldName = 'cfg_conexao'
      Origin = 'cfg_conexao'
      Size = 50
    end
    object sqlConfiguracfg_usucon: TStringField
      FieldName = 'cfg_usucon'
      Origin = 'cfg_usucon'
      Size = 50
    end
    object sqlConfiguracfg_sencon: TStringField
      FieldName = 'cfg_sencon'
      Origin = 'cfg_sencon'
      Size = 50
    end
    object sqlConfiguracfg_portacon: TStringField
      FieldName = 'cfg_portacon'
      Origin = 'cfg_portacon'
      Size = 4
    end
    object sqlConfiguracfg_hostcon: TStringField
      FieldName = 'cfg_hostcon'
      Origin = 'cfg_hostcon'
      Size = 50
    end
    object sqlConfiguracfg_autenticon: TStringField
      FieldName = 'cfg_autenticon'
      Origin = 'cfg_autenticon'
      FixedChar = True
      Size = 1
    end
    object sqlConfiguracfg_seguricon: TStringField
      FieldName = 'cfg_seguricon'
      Origin = 'cfg_seguricon'
      FixedChar = True
      Size = 1
    end
    object sqlConfiguracfg_tsl: TStringField
      FieldName = 'cfg_tsl'
      Origin = 'cfg_tsl'
      Size = 15
    end
    object sqlConfiguracfg_metodo: TStringField
      FieldName = 'cfg_metodo'
      Origin = 'cfg_metodo'
      Size = 15
    end
    object sqlConfiguracfg_foto: TBlobField
      FieldName = 'cfg_foto'
      Origin = 'cfg_foto'
    end
    object sqlConfiguracfg_ofctransf: TMemoField
      FieldName = 'cfg_ofctransf'
      Origin = 'cfg_ofctransf'
      BlobType = ftMemo
    end
    object sqlConfiguracfg_qtdprc: TStringField
      FieldName = 'cfg_qtdprc'
      Origin = 'cfg_qtdprc'
      Size = 2
    end
    object sqlConfiguracfg_new: TStringField
      FieldName = 'cfg_new'
      Origin = 'cfg_new'
      Size = 15
    end
    object sqlConfiguracfg_endtablic: TStringField
      FieldName = 'cfg_endtablic'
      Origin = 'cfg_endtablic'
      Size = 150
    end
    object sqlConfiguracfg_datexe: TDateField
      FieldName = 'cfg_datexe'
      Origin = 'cfg_datexe'
    end
    object sqlConfiguracfg_horexe: TStringField
      FieldName = 'cfg_horexe'
      Origin = 'cfg_horexe'
      Size = 8
    end
    object sqlConfiguracfg_usuinc: TStringField
      FieldName = 'cfg_usuinc'
      Origin = 'cfg_usuinc'
      Size = 15
    end
    object sqlConfiguracfg_datinc: TDateField
      FieldName = 'cfg_datinc'
      Origin = 'cfg_datinc'
    end
    object sqlConfiguracfg_matcon: TStringField
      FieldName = 'cfg_matcon'
      Origin = 'cfg_matcon'
      Size = 10
    end
    object sqlConfiguracfg_mencon: TStringField
      FieldName = 'cfg_mencon'
      Origin = 'cfg_mencon'
      Size = 10
    end
    object sqlConfiguracfg_mtrcon: TStringField
      FieldName = 'cfg_mtrcon'
      Origin = 'cfg_mtrcon'
      Size = 10
    end
    object sqlConfiguracfg_mntcnt: TStringField
      FieldName = 'cfg_mntcnt'
      Origin = 'cfg_mntcnt'
      Size = 3
    end
    object sqlConfiguracfg_mntimpr: TStringField
      FieldName = 'cfg_mntimpr'
      Origin = 'cfg_mntimpr'
      FixedChar = True
      Size = 1
    end
    object sqlConfiguracfg_totpar: TStringField
      FieldName = 'cfg_totpar'
      Origin = 'cfg_totpar'
      Size = 3
    end
    object sqlConfiguracfg_atcpf: TStringField
      FieldName = 'cfg_atcpf'
      Origin = 'cfg_atcpf'
      FixedChar = True
      Size = 1
    end
    object sqlConfiguracfg_atcnpj: TStringField
      FieldName = 'cfg_atcnpj'
      Origin = 'cfg_atcnpj'
      FixedChar = True
      Size = 1
    end
    object sqlConfiguracfg_atcep: TStringField
      FieldName = 'cfg_atcep'
      Origin = 'cfg_atcep'
      FixedChar = True
      Size = 1
    end
    object sqlConfiguracfg_kmveri: TBCDField
      FieldName = 'cfg_kmveri'
      Origin = 'cfg_kmveri'
      Precision = 7
      Size = 0
    end
  end
  object sqlGrupo: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'select * from "dbconfig".grupo ')
    Left = 32
    Top = 602
    object sqlGrupogru_codigo: TIntegerField
      FieldName = 'gru_codigo'
      Origin = 'gru_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlGrupogru_grupo: TStringField
      FieldName = 'gru_grupo'
      Origin = 'gru_grupo'
    end
    object sqlGrupogru_usuinc: TStringField
      FieldName = 'gru_usuinc'
      Origin = 'gru_usuinc'
      Size = 15
    end
    object sqlGrupogru_datinc: TDateField
      FieldName = 'gru_datinc'
      Origin = 'gru_datinc'
    end
    object sqlGrupogru_horinc: TStringField
      FieldName = 'gru_horinc'
      Origin = 'gru_horinc'
      Size = 8
    end
    object sqlGrupogru_usualt: TStringField
      FieldName = 'gru_usualt'
      Origin = 'gru_usualt'
      Size = 15
    end
    object sqlGrupogru_datalt: TDateField
      FieldName = 'gru_datalt'
      Origin = 'gru_datalt'
    end
    object sqlGrupogru_horalt: TStringField
      FieldName = 'gru_horalt'
      Origin = 'gru_horalt'
      Size = 8
    end
  end
  object sqlSubGrupo: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'select * from "dbconfig".subgrupo'
      'LEFT JOIN "dbconfig".grupo on gru_codigo = sgr_codgru'
      'LEFT JOIN "dbconfig".nivel on niv_codigo = sgr_codniv')
    Left = 32
    Top = 658
    object sqlSubGruposgr_codigo: TIntegerField
      FieldName = 'sgr_codigo'
      Origin = 'sgr_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlSubGruposgr_codgru: TIntegerField
      FieldName = 'sgr_codgru'
      Origin = 'sgr_codgru'
    end
    object sqlSubGruposgr_codniv: TIntegerField
      FieldName = 'sgr_codniv'
      Origin = 'sgr_codniv'
    end
    object sqlSubGruposgr_nome: TStringField
      FieldName = 'sgr_nome'
      Origin = 'sgr_nome'
    end
    object sqlSubGruposgr_usuinc: TStringField
      FieldName = 'sgr_usuinc'
      Origin = 'sgr_usuinc'
      Size = 15
    end
    object sqlSubGruposgr_datinc: TDateField
      FieldName = 'sgr_datinc'
      Origin = 'sgr_datinc'
    end
    object sqlSubGruposgr_horinc: TStringField
      FieldName = 'sgr_horinc'
      Origin = 'sgr_horinc'
      Size = 8
    end
    object sqlSubGruposgr_usualt: TStringField
      FieldName = 'sgr_usualt'
      Origin = 'sgr_usualt'
      Size = 15
    end
    object sqlSubGruposgr_datalt: TDateField
      FieldName = 'sgr_datalt'
      Origin = 'sgr_datalt'
    end
    object sqlSubGruposgr_horalt: TStringField
      FieldName = 'sgr_horalt'
      Origin = 'sgr_horalt'
      Size = 8
    end
    object sqlSubGrupogru_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'gru_codigo'
      Origin = 'gru_codigo'
    end
    object sqlSubGrupogru_grupo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'gru_grupo'
      Origin = 'gru_grupo'
    end
    object sqlSubGrupogru_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'gru_usuinc'
      Origin = 'gru_usuinc'
      Size = 15
    end
    object sqlSubGrupogru_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'gru_datinc'
      Origin = 'gru_datinc'
    end
    object sqlSubGrupogru_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'gru_horinc'
      Origin = 'gru_horinc'
      Size = 8
    end
    object sqlSubGrupogru_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'gru_usualt'
      Origin = 'gru_usualt'
      Size = 15
    end
    object sqlSubGrupogru_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'gru_datalt'
      Origin = 'gru_datalt'
    end
    object sqlSubGrupogru_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'gru_horalt'
      Origin = 'gru_horalt'
      Size = 8
    end
    object sqlSubGruponiv_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'niv_codigo'
      Origin = 'niv_codigo'
    end
    object sqlSubGruponiv_nivel: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'niv_nivel'
      Origin = 'niv_nivel'
    end
    object sqlSubGruponiv_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'niv_usuinc'
      Origin = 'niv_usuinc'
      Size = 15
    end
    object sqlSubGruponiv_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'niv_datinc'
      Origin = 'niv_datinc'
    end
    object sqlSubGruponiv_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'niv_horinc'
      Origin = 'niv_horinc'
      Size = 8
    end
    object sqlSubGruponiv_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'niv_usualt'
      Origin = 'niv_usualt'
      Size = 15
    end
    object sqlSubGruponiv_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'niv_datalt'
      Origin = 'niv_datalt'
    end
    object sqlSubGruponiv_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'niv_horalt'
      Origin = 'niv_horalt'
      Size = 8
    end
  end
  object sqlAcesso: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * From  mdoacesso')
    Left = 32
    Top = 712
    object sqlAcessosgr_codigo: TIntegerField
      FieldName = 'sgr_codigo'
      Origin = 'sgr_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlAcessosgr_codgru: TIntegerField
      FieldName = 'sgr_codgru'
      Origin = 'sgr_codgru'
    end
    object sqlAcessosgr_codniv: TIntegerField
      FieldName = 'sgr_codniv'
      Origin = 'sgr_codniv'
    end
    object sqlAcessosgr_nome: TStringField
      FieldName = 'sgr_nome'
      Origin = 'sgr_nome'
    end
    object sqlAcessosgr_usuinc: TStringField
      FieldName = 'sgr_usuinc'
      Origin = 'sgr_usuinc'
      Size = 15
    end
    object sqlAcessosgr_datinc: TDateField
      FieldName = 'sgr_datinc'
      Origin = 'sgr_datinc'
    end
    object sqlAcessosgr_horinc: TStringField
      FieldName = 'sgr_horinc'
      Origin = 'sgr_horinc'
      Size = 8
    end
    object sqlAcessosgr_usualt: TStringField
      FieldName = 'sgr_usualt'
      Origin = 'sgr_usualt'
      Size = 15
    end
    object sqlAcessosgr_datalt: TDateField
      FieldName = 'sgr_datalt'
      Origin = 'sgr_datalt'
    end
    object sqlAcessosgr_horalt: TStringField
      FieldName = 'sgr_horalt'
      Origin = 'sgr_horalt'
      Size = 8
    end
    object sqlAcessogru_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'gru_codigo'
      Origin = 'gru_codigo'
    end
    object sqlAcessogru_grupo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'gru_grupo'
      Origin = 'gru_grupo'
    end
    object sqlAcessogru_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'gru_usuinc'
      Origin = 'gru_usuinc'
      Size = 15
    end
    object sqlAcessogru_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'gru_datinc'
      Origin = 'gru_datinc'
    end
    object sqlAcessogru_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'gru_horinc'
      Origin = 'gru_horinc'
      Size = 8
    end
    object sqlAcessogru_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'gru_usualt'
      Origin = 'gru_usualt'
      Size = 15
    end
    object sqlAcessogru_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'gru_datalt'
      Origin = 'gru_datalt'
    end
    object sqlAcessogru_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'gru_horalt'
      Origin = 'gru_horalt'
      Size = 8
    end
    object sqlAcessoniv_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'niv_codigo'
      Origin = 'niv_codigo'
    end
    object sqlAcessoniv_nivel: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'niv_nivel'
      Origin = 'niv_nivel'
    end
    object sqlAcessoniv_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'niv_usuinc'
      Origin = 'niv_usuinc'
      Size = 15
    end
    object sqlAcessoniv_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'niv_datinc'
      Origin = 'niv_datinc'
    end
    object sqlAcessoniv_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'niv_horinc'
      Origin = 'niv_horinc'
      Size = 8
    end
    object sqlAcessoniv_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'niv_usualt'
      Origin = 'niv_usualt'
      Size = 15
    end
    object sqlAcessoniv_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'niv_datalt'
      Origin = 'niv_datalt'
    end
    object sqlAcessoniv_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'niv_horalt'
      Origin = 'niv_horalt'
      Size = 8
    end
  end
  object sqlNivel: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'select * from "dbconfig".nivel ')
    Left = 32
    Top = 768
    object sqlNivelniv_codigo: TIntegerField
      FieldName = 'niv_codigo'
      Origin = 'niv_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlNivelniv_nivel: TStringField
      FieldName = 'niv_nivel'
      Origin = 'niv_nivel'
    end
    object sqlNivelniv_usuinc: TStringField
      FieldName = 'niv_usuinc'
      Origin = 'niv_usuinc'
      Size = 15
    end
    object sqlNivelniv_datinc: TDateField
      FieldName = 'niv_datinc'
      Origin = 'niv_datinc'
    end
    object sqlNivelniv_horinc: TStringField
      FieldName = 'niv_horinc'
      Origin = 'niv_horinc'
      Size = 8
    end
    object sqlNivelniv_usualt: TStringField
      FieldName = 'niv_usualt'
      Origin = 'niv_usualt'
      Size = 15
    end
    object sqlNivelniv_datalt: TDateField
      FieldName = 'niv_datalt'
      Origin = 'niv_datalt'
    end
    object sqlNivelniv_horalt: TStringField
      FieldName = 'niv_horalt'
      Origin = 'niv_horalt'
      Size = 8
    end
  end
  object sqlNivAces: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'SELECT * FROM "dbconfig".NIVACES')
    Left = 32
    Top = 824
    object sqlNivAcesnva_codigo: TIntegerField
      FieldName = 'nva_codigo'
      Origin = 'nva_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlNivAcesnva_codniv: TIntegerField
      FieldName = 'nva_codniv'
      Origin = 'nva_codniv'
    end
    object sqlNivAcesnva_formda: TStringField
      FieldName = 'nva_formda'
      Origin = 'nva_formda'
    end
    object sqlNivAcesnva_titulo: TStringField
      FieldName = 'nva_titulo'
      Origin = 'nva_titulo'
      Size = 35
    end
    object sqlNivAcesnva_modl: TStringField
      FieldName = 'nva_modl'
      Origin = 'nva_modl'
      Size = 1
    end
    object sqlNivAcesnva_lei: TBooleanField
      FieldName = 'nva_lei'
      Origin = 'nva_lei'
    end
    object sqlNivAcesnva_gra: TBooleanField
      FieldName = 'nva_gra'
      Origin = 'nva_gra'
    end
    object sqlNivAcesnva_alt: TBooleanField
      FieldName = 'nva_alt'
      Origin = 'nva_alt'
    end
    object sqlNivAcesnva_exc: TBooleanField
      FieldName = 'nva_exc'
      Origin = 'nva_exc'
    end
    object sqlNivAcesnva_usuinc: TStringField
      FieldName = 'nva_usuinc'
      Origin = 'nva_usuinc'
      Size = 15
    end
    object sqlNivAcesnva_datinc: TDateField
      FieldName = 'nva_datinc'
      Origin = 'nva_datinc'
    end
    object sqlNivAcesnva_horinc: TStringField
      FieldName = 'nva_horinc'
      Origin = 'nva_horinc'
      Size = 8
    end
    object sqlNivAcesnva_usualt: TStringField
      FieldName = 'nva_usualt'
      Origin = 'nva_usualt'
      Size = 15
    end
    object sqlNivAcesnva_datalt: TDateField
      FieldName = 'nva_datalt'
      Origin = 'nva_datalt'
    end
    object sqlNivAcesnva_horalt: TStringField
      FieldName = 'nva_horalt'
      Origin = 'nva_horalt'
      Size = 8
    end
  end
  object sqlComb: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'SELECT * From "dbconfig".combustivel')
    Left = 32
    Top = 880
    object sqlCombcmb_codigo: TIntegerField
      FieldName = 'cmb_codigo'
      Origin = 'cmb_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlCombcmb_nome: TStringField
      FieldName = 'cmb_nome'
      Origin = 'cmb_nome'
    end
    object sqlCombcmb_usuinc: TStringField
      FieldName = 'cmb_usuinc'
      Origin = 'cmb_usuinc'
      Size = 15
    end
    object sqlCombcmb_datinc: TDateField
      FieldName = 'cmb_datinc'
      Origin = 'cmb_datinc'
    end
    object sqlCombcmb_horinc: TStringField
      FieldName = 'cmb_horinc'
      Origin = 'cmb_horinc'
      Size = 8
    end
    object sqlCombcmb_usualt: TStringField
      FieldName = 'cmb_usualt'
      Origin = 'cmb_usualt'
      Size = 15
    end
    object sqlCombcmb_datalt: TDateField
      FieldName = 'cmb_datalt'
      Origin = 'cmb_datalt'
    end
    object sqlCombcmb_horalt: TStringField
      FieldName = 'cmb_horalt'
      Origin = 'cmb_horalt'
      Size = 8
    end
  end
  object sqlImposto: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'SELECT * From "dbconfig".imposto'
      'left join "dbconfig".pconta on pct_codigo = ipt_codpct')
    Left = 32
    Top = 936
    object sqlImpostoipt_codigo: TIntegerField
      FieldName = 'ipt_codigo'
      Origin = 'ipt_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlImpostoipt_nome: TStringField
      FieldName = 'ipt_nome'
      Origin = 'ipt_nome'
    end
    object sqlImpostoipt_codpct: TStringField
      FieldName = 'ipt_codpct'
      Origin = 'ipt_codpct'
      Size = 10
    end
    object sqlImpostoipt_usuinc: TStringField
      FieldName = 'ipt_usuinc'
      Origin = 'ipt_usuinc'
      Size = 15
    end
    object sqlImpostoipt_datinc: TDateField
      FieldName = 'ipt_datinc'
      Origin = 'ipt_datinc'
    end
    object sqlImpostoipt_horinc: TStringField
      FieldName = 'ipt_horinc'
      Origin = 'ipt_horinc'
      Size = 8
    end
    object sqlImpostoipt_usualt: TStringField
      FieldName = 'ipt_usualt'
      Origin = 'ipt_usualt'
      Size = 15
    end
    object sqlImpostoipt_datalt: TDateField
      FieldName = 'ipt_datalt'
      Origin = 'ipt_datalt'
    end
    object sqlImpostoipt_horalt: TStringField
      FieldName = 'ipt_horalt'
      Origin = 'ipt_horalt'
      Size = 8
    end
    object sqlImpostopct_codigo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_codigo'
      Origin = 'pct_codigo'
      Size = 10
    end
    object sqlImpostopct_cntmae: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_cntmae'
      Origin = 'pct_cntmae'
      Size = 10
    end
    object sqlImpostopct_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_nome'
      Origin = 'pct_nome'
      Size = 50
    end
    object sqlImpostopct_natureza: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_natureza'
      Origin = 'pct_natureza'
      Size = 1
    end
    object sqlImpostopct_tipo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_tipo'
      Origin = 'pct_tipo'
      Size = 1
    end
    object sqlImpostopct_limite: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'pct_limite'
      Origin = 'pct_limite'
      Precision = 15
      Size = 2
    end
    object sqlImpostopct_meta: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'pct_meta'
      Origin = 'pct_meta'
      Precision = 15
      Size = 2
    end
    object sqlImpostopct_ord: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'pct_ord'
      Origin = 'pct_ord'
      Precision = 1
      Size = 0
    end
    object sqlImpostopct_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_usuinc'
      Origin = 'pct_usuinc'
      Size = 15
    end
    object sqlImpostopct_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pct_datinc'
      Origin = 'pct_datinc'
    end
    object sqlImpostopct_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_horinc'
      Origin = 'pct_horinc'
      Size = 8
    end
    object sqlImpostopct_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_usualt'
      Origin = 'pct_usualt'
      Size = 15
    end
    object sqlImpostopct_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pct_datalt'
      Origin = 'pct_datalt'
    end
    object sqlImpostopct_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_horalt'
      Origin = 'pct_horalt'
      Size = 8
    end
  end
  object sqlPneuDes: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'SELECT * From "dbconfig".PneuDes')
    Left = 32
    Top = 992
    object sqlPneuDespds_codigo: TIntegerField
      FieldName = 'pds_codigo'
      Origin = 'pds_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlPneuDespds_nome: TStringField
      FieldName = 'pds_nome'
      Origin = 'pds_nome'
    end
    object sqlPneuDespds_sucos: TStringField
      FieldName = 'pds_sucos'
      Origin = 'pds_sucos'
      Size = 1
    end
    object sqlPneuDespds_usuinc: TStringField
      FieldName = 'pds_usuinc'
      Origin = 'pds_usuinc'
      Size = 15
    end
    object sqlPneuDespds_datinc: TDateField
      FieldName = 'pds_datinc'
      Origin = 'pds_datinc'
    end
    object sqlPneuDespds_horinc: TStringField
      FieldName = 'pds_horinc'
      Origin = 'pds_horinc'
      Size = 8
    end
    object sqlPneuDespds_usualt: TStringField
      FieldName = 'pds_usualt'
      Origin = 'pds_usualt'
      Size = 15
    end
    object sqlPneuDespds_datalt: TDateField
      FieldName = 'pds_datalt'
      Origin = 'pds_datalt'
    end
    object sqlPneuDespds_horalt: TStringField
      FieldName = 'pds_horalt'
      Origin = 'pds_horalt'
      Size = 8
    end
  end
  object sqlPneuDim: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'SELECT * From "dbconfig".PneuDim')
    Left = 32
    Top = 1048
    object sqlPneuDimpdm_codigo: TIntegerField
      FieldName = 'pdm_codigo'
      Origin = 'pdm_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlPneuDimpdm_nome: TStringField
      FieldName = 'pdm_nome'
      Origin = 'pdm_nome'
    end
    object sqlPneuDimpdm_usuinc: TStringField
      FieldName = 'pdm_usuinc'
      Origin = 'pdm_usuinc'
      Size = 15
    end
    object sqlPneuDimpdm_datinc: TDateField
      FieldName = 'pdm_datinc'
      Origin = 'pdm_datinc'
    end
    object sqlPneuDimpdm_horinc: TStringField
      FieldName = 'pdm_horinc'
      Origin = 'pdm_horinc'
      Size = 8
    end
    object sqlPneuDimpdm_usualt: TStringField
      FieldName = 'pdm_usualt'
      Origin = 'pdm_usualt'
      Size = 15
    end
    object sqlPneuDimpdm_datalt: TDateField
      FieldName = 'pdm_datalt'
      Origin = 'pdm_datalt'
    end
    object sqlPneuDimpdm_horalt: TStringField
      FieldName = 'pdm_horalt'
      Origin = 'pdm_horalt'
      Size = 8
    end
  end
  object sqlPneuFab: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'SELECT * From "dbconfig".PneuFab')
    Left = 32
    Top = 1104
    object sqlPneuFabpfb_codigo: TIntegerField
      FieldName = 'pfb_codigo'
      Origin = 'pfb_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlPneuFabpfb_nome: TStringField
      FieldName = 'pfb_nome'
      Origin = 'pfb_nome'
      Size = 40
    end
    object sqlPneuFabpfb_usuinc: TStringField
      FieldName = 'pfb_usuinc'
      Origin = 'pfb_usuinc'
      Size = 15
    end
    object sqlPneuFabpfb_datinc: TDateField
      FieldName = 'pfb_datinc'
      Origin = 'pfb_datinc'
    end
    object sqlPneuFabpfb_horinc: TStringField
      FieldName = 'pfb_horinc'
      Origin = 'pfb_horinc'
      Size = 8
    end
    object sqlPneuFabpfb_usualt: TStringField
      FieldName = 'pfb_usualt'
      Origin = 'pfb_usualt'
      Size = 15
    end
    object sqlPneuFabpfb_datalt: TDateField
      FieldName = 'pfb_datalt'
      Origin = 'pfb_datalt'
    end
    object sqlPneuFabpfb_horalt: TStringField
      FieldName = 'pfb_horalt'
      Origin = 'pfb_horalt'
      Size = 8
    end
  end
  object sqlPais: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'SELECT * From "dbconfig".pais')
    Left = 32
    Top = 1158
    object sqlPaispai_codigo: TIntegerField
      FieldName = 'pai_codigo'
      Origin = 'pai_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlPaispai_nome: TStringField
      FieldName = 'pai_nome'
      Origin = 'pai_nome'
      Size = 50
    end
    object sqlPaispai_usuinc: TStringField
      FieldName = 'pai_usuinc'
      Origin = 'pai_usuinc'
      Size = 15
    end
    object sqlPaispai_datinc: TDateField
      FieldName = 'pai_datinc'
      Origin = 'pai_datinc'
    end
    object sqlPaispai_horinc: TStringField
      FieldName = 'pai_horinc'
      Origin = 'pai_horinc'
      Size = 8
    end
    object sqlPaispai_usualt: TStringField
      FieldName = 'pai_usualt'
      Origin = 'pai_usualt'
      Size = 15
    end
    object sqlPaispai_datalt: TDateField
      FieldName = 'pai_datalt'
      Origin = 'pai_datalt'
    end
    object sqlPaispai_horalt: TStringField
      FieldName = 'pai_horalt'
      Origin = 'pai_horalt'
      Size = 8
    end
  end
  object sqlEstado: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'SELECT * From "dbconfig".estado '
      'LEFT JOIN "dbconfig".pais on pai_codigo = est_codpai')
    Left = 32
    Top = 1214
    object sqlEstadoest_codigo: TIntegerField
      FieldName = 'est_codigo'
      Origin = 'est_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlEstadoest_nome: TStringField
      FieldName = 'est_nome'
      Origin = 'est_nome'
      Size = 50
    end
    object sqlEstadoest_uf: TStringField
      FieldName = 'est_uf'
      Origin = 'est_uf'
      Size = 2
    end
    object sqlEstadoest_codpai: TIntegerField
      FieldName = 'est_codpai'
      Origin = 'est_codpai'
    end
    object sqlEstadoest_usuinc: TStringField
      FieldName = 'est_usuinc'
      Origin = 'est_usuinc'
      Size = 15
    end
    object sqlEstadoest_datinc: TDateField
      FieldName = 'est_datinc'
      Origin = 'est_datinc'
    end
    object sqlEstadoest_horinc: TStringField
      FieldName = 'est_horinc'
      Origin = 'est_horinc'
      Size = 8
    end
    object sqlEstadoest_usualt: TStringField
      FieldName = 'est_usualt'
      Origin = 'est_usualt'
      Size = 15
    end
    object sqlEstadoest_datalt: TDateField
      FieldName = 'est_datalt'
      Origin = 'est_datalt'
    end
    object sqlEstadoest_horalt: TStringField
      FieldName = 'est_horalt'
      Origin = 'est_horalt'
      Size = 8
    end
    object sqlEstadopai_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'pai_codigo'
      Origin = 'pai_codigo'
    end
    object sqlEstadopai_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pai_nome'
      Origin = 'pai_nome'
      Size = 50
    end
    object sqlEstadopai_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pai_usuinc'
      Origin = 'pai_usuinc'
      Size = 15
    end
    object sqlEstadopai_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pai_datinc'
      Origin = 'pai_datinc'
    end
    object sqlEstadopai_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pai_horinc'
      Origin = 'pai_horinc'
      Size = 8
    end
    object sqlEstadopai_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pai_usualt'
      Origin = 'pai_usualt'
      Size = 15
    end
    object sqlEstadopai_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pai_datalt'
      Origin = 'pai_datalt'
    end
    object sqlEstadopai_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pai_horalt'
      Origin = 'pai_horalt'
      Size = 8
    end
  end
  object sqlgrupomnt: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      
        'SELECT DISTINCT grm_codigo, grm_nome, grm_usuinc, grm_datinc, gr' +
        'm_horinc, grm_usualt, grm_datalt, grm_horalt, sgm_codgrm From "d' +
        'bconfig".grupomnt'
      'LEFT JOIN dbconfig.subgrpmnt on sgm_codgrm = grm_codigo')
    Left = 30
    Top = 1270
    object sqlgrupomntgrm_codigo: TIntegerField
      FieldName = 'grm_codigo'
      Origin = 'grm_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlgrupomntgrm_nome: TStringField
      FieldName = 'grm_nome'
      Origin = 'grm_nome'
      Size = 40
    end
    object sqlgrupomntgrm_usuinc: TStringField
      FieldName = 'grm_usuinc'
      Origin = 'grm_usuinc'
      Size = 15
    end
    object sqlgrupomntgrm_datinc: TDateField
      FieldName = 'grm_datinc'
      Origin = 'grm_datinc'
    end
    object sqlgrupomntgrm_horinc: TStringField
      FieldName = 'grm_horinc'
      Origin = 'grm_horinc'
      Size = 8
    end
    object sqlgrupomntgrm_usualt: TStringField
      FieldName = 'grm_usualt'
      Origin = 'grm_usualt'
      Size = 15
    end
    object sqlgrupomntgrm_datalt: TDateField
      FieldName = 'grm_datalt'
      Origin = 'grm_datalt'
    end
    object sqlgrupomntgrm_horalt: TStringField
      FieldName = 'grm_horalt'
      Origin = 'grm_horalt'
      Size = 8
    end
    object sqlgrupomntsgm_codgrm: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_codgrm'
      Origin = 'sgm_codgrm'
    end
  end
  object sqlsubgrpmnt: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'SELECT * From "dbconfig".subgrpmnt'
      'left join "dbconfig".grupomnt on grm_codigo = sgm_codgrm')
    Left = 30
    Top = 1334
    object sqlsubgrpmntsgm_codigo: TIntegerField
      FieldName = 'sgm_codigo'
      Origin = 'sgm_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlsubgrpmntsgm_nome: TStringField
      FieldName = 'sgm_nome'
      Origin = 'sgm_nome'
      Size = 25
    end
    object sqlsubgrpmntsgm_codgrm: TIntegerField
      FieldName = 'sgm_codgrm'
      Origin = 'sgm_codgrm'
    end
    object sqlsubgrpmntsgm_usuinc: TStringField
      FieldName = 'sgm_usuinc'
      Origin = 'sgm_usuinc'
      Size = 15
    end
    object sqlsubgrpmntsgm_datinc: TDateField
      FieldName = 'sgm_datinc'
      Origin = 'sgm_datinc'
    end
    object sqlsubgrpmntsgm_horinc: TStringField
      FieldName = 'sgm_horinc'
      Origin = 'sgm_horinc'
      Size = 8
    end
    object sqlsubgrpmntsgm_usualt: TStringField
      FieldName = 'sgm_usualt'
      Origin = 'sgm_usualt'
      Size = 15
    end
    object sqlsubgrpmntsgm_datalt: TDateField
      FieldName = 'sgm_datalt'
      Origin = 'sgm_datalt'
    end
    object sqlsubgrpmntsgm_horalt: TStringField
      FieldName = 'sgm_horalt'
      Origin = 'sgm_horalt'
      Size = 8
    end
    object sqlsubgrpmntgrm_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'grm_codigo'
      Origin = 'grm_codigo'
    end
    object sqlsubgrpmntgrm_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grm_nome'
      Origin = 'grm_nome'
      Size = 40
    end
    object sqlsubgrpmntgrm_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grm_usuinc'
      Origin = 'grm_usuinc'
      Size = 15
    end
    object sqlsubgrpmntgrm_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'grm_datinc'
      Origin = 'grm_datinc'
    end
    object sqlsubgrpmntgrm_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grm_horinc'
      Origin = 'grm_horinc'
      Size = 8
    end
    object sqlsubgrpmntgrm_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grm_usualt'
      Origin = 'grm_usualt'
      Size = 15
    end
    object sqlsubgrpmntgrm_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'grm_datalt'
      Origin = 'grm_datalt'
    end
    object sqlsubgrpmntgrm_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grm_horalt'
      Origin = 'grm_horalt'
      Size = 8
    end
  end
  object sqlfabricapcs: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * from "dbconfig".fabricapcs'
      'LEFT JOIN "dbconfig".cidade on cid_codigo= fbp_codcid'
      'LEFT JOIN "dbconfig".pconta on pct_codigo = fbp_codpct ')
    Left = 30
    Top = 1390
    object sqlfabricapcsfbp_codigo: TIntegerField
      FieldName = 'fbp_codigo'
      Origin = 'fbp_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlfabricapcsfbp_rsocial: TStringField
      FieldName = 'fbp_rsocial'
      Origin = 'fbp_rsocial'
      Size = 40
    end
    object sqlfabricapcsfbp_nome: TStringField
      FieldName = 'fbp_nome'
      Origin = 'fbp_nome'
      Size = 30
    end
    object sqlfabricapcsfbp_cpfcnpj: TStringField
      FieldName = 'fbp_cpfcnpj'
      Origin = 'fbp_cpfcnpj'
      Size = 14
    end
    object sqlfabricapcsfbp_codpct: TStringField
      FieldName = 'fbp_codpct'
      Origin = 'fbp_codpct'
      Size = 10
    end
    object sqlfabricapcsfbp_endereco: TStringField
      FieldName = 'fbp_endereco'
      Origin = 'fbp_endereco'
      Size = 35
    end
    object sqlfabricapcsfbp_numend: TStringField
      FieldName = 'fbp_numend'
      Origin = 'fbp_numend'
      Size = 5
    end
    object sqlfabricapcsfbp_complem: TStringField
      FieldName = 'fbp_complem'
      Origin = 'fbp_complem'
      Size = 25
    end
    object sqlfabricapcsfbp_bairro: TStringField
      FieldName = 'fbp_bairro'
      Origin = 'fbp_bairro'
      Size = 50
    end
    object sqlfabricapcsfbp_cep: TStringField
      FieldName = 'fbp_cep'
      Origin = 'fbp_cep'
      Size = 8
    end
    object sqlfabricapcsfbp_codcid: TIntegerField
      FieldName = 'fbp_codcid'
      Origin = 'fbp_codcid'
    end
    object sqlfabricapcsfbp_telef1: TStringField
      FieldName = 'fbp_telef1'
      Origin = 'fbp_telef1'
      Size = 12
    end
    object sqlfabricapcsfbp_telef2: TStringField
      FieldName = 'fbp_telef2'
      Origin = 'fbp_telef2'
      Size = 12
    end
    object sqlfabricapcsfbp_celula: TStringField
      FieldName = 'fbp_celula'
      Origin = 'fbp_celula'
      Size = 12
    end
    object sqlfabricapcsfbp_obs: TMemoField
      FieldName = 'fbp_obs'
      Origin = 'fbp_obs'
      BlobType = ftMemo
    end
    object sqlfabricapcsfbp_ativo: TStringField
      FieldName = 'fbp_ativo'
      Origin = 'fbp_ativo'
      Size = 3
    end
    object sqlfabricapcsfbp_usuinc: TStringField
      FieldName = 'fbp_usuinc'
      Origin = 'fbp_usuinc'
      Size = 15
    end
    object sqlfabricapcsfbp_datinc: TDateField
      FieldName = 'fbp_datinc'
      Origin = 'fbp_datinc'
    end
    object sqlfabricapcsfbp_horinc: TStringField
      FieldName = 'fbp_horinc'
      Origin = 'fbp_horinc'
      Size = 8
    end
    object sqlfabricapcsfbp_usualt: TStringField
      FieldName = 'fbp_usualt'
      Origin = 'fbp_usualt'
      Size = 15
    end
    object sqlfabricapcsfbp_datalt: TDateField
      FieldName = 'fbp_datalt'
      Origin = 'fbp_datalt'
    end
    object sqlfabricapcsfbp_horalt: TStringField
      FieldName = 'fbp_horalt'
      Origin = 'fbp_horalt'
      Size = 8
    end
    object sqlfabricapcscid_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cid_codigo'
      Origin = 'cid_codigo'
    end
    object sqlfabricapcscid_cidnum: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_cidnum'
      Origin = 'cid_cidnum'
      Size = 8
    end
    object sqlfabricapcscid_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_nome'
      Origin = 'cid_nome'
      Size = 35
    end
    object sqlfabricapcscid_codest: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cid_codest'
      Origin = 'cid_codest'
    end
    object sqlfabricapcscid_codpai: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cid_codpai'
      Origin = 'cid_codpai'
    end
    object sqlfabricapcscid_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_usuinc'
      Origin = 'cid_usuinc'
      Size = 15
    end
    object sqlfabricapcscid_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cid_datinc'
      Origin = 'cid_datinc'
    end
    object sqlfabricapcscid_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_horinc'
      Origin = 'cid_horinc'
      Size = 8
    end
    object sqlfabricapcscid_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_usualt'
      Origin = 'cid_usualt'
      Size = 15
    end
    object sqlfabricapcscid_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cid_datalt'
      Origin = 'cid_datalt'
    end
    object sqlfabricapcscid_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_horalt'
      Origin = 'cid_horalt'
      Size = 8
    end
    object sqlfabricapcspct_codigo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_codigo'
      Origin = 'pct_codigo'
      Size = 10
    end
    object sqlfabricapcspct_cntmae: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_cntmae'
      Origin = 'pct_cntmae'
      Size = 10
    end
    object sqlfabricapcspct_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_nome'
      Origin = 'pct_nome'
      Size = 50
    end
    object sqlfabricapcspct_natureza: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_natureza'
      Origin = 'pct_natureza'
      Size = 1
    end
    object sqlfabricapcspct_tipo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_tipo'
      Origin = 'pct_tipo'
      Size = 1
    end
    object sqlfabricapcspct_limite: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'pct_limite'
      Origin = 'pct_limite'
      Precision = 15
      Size = 2
    end
    object sqlfabricapcspct_meta: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'pct_meta'
      Origin = 'pct_meta'
      Precision = 15
      Size = 2
    end
    object sqlfabricapcspct_ord: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'pct_ord'
      Origin = 'pct_ord'
      Precision = 1
      Size = 0
    end
    object sqlfabricapcspct_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_usuinc'
      Origin = 'pct_usuinc'
      Size = 15
    end
    object sqlfabricapcspct_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pct_datinc'
      Origin = 'pct_datinc'
    end
    object sqlfabricapcspct_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_horinc'
      Origin = 'pct_horinc'
      Size = 8
    end
    object sqlfabricapcspct_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_usualt'
      Origin = 'pct_usualt'
      Size = 15
    end
    object sqlfabricapcspct_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pct_datalt'
      Origin = 'pct_datalt'
    end
    object sqlfabricapcspct_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_horalt'
      Origin = 'pct_horalt'
      Size = 8
    end
  end
  object sqltbpecas: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * from "dbconfig".tbpecas'
      'LEFT JOIN "dbconfig".fabricapcs on fbp_codigo= tpc_codfbp'
      'LEFT JOIN "dbconfig".ncm on ncm_codigo = tpc_codncm '
      'LEFT JOIN "dbconfig".cfop on cfo_codigo = tpc_codcfo'
      'LEFT JOIN "dbconfig".cst on cst_codigo = tpc_codcst'
      'LEFT JOIN "dbconfig".subgrpmnt on sgm_codigo = tpc_codsgm'
      'LEFT JOIN "dbconfig".grupomnt on grm_codigo = sgm_codgrm')
    Left = 30
    Top = 1446
    object sqltbpecastpc_codigo: TIntegerField
      FieldName = 'tpc_codigo'
      Origin = 'tpc_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqltbpecastpc_codfbp: TIntegerField
      FieldName = 'tpc_codfbp'
      Origin = 'tpc_codfbp'
    end
    object sqltbpecastpc_codsgm: TIntegerField
      FieldName = 'tpc_codsgm'
      Origin = 'tpc_codsgm'
    end
    object sqltbpecastpc_codncm: TStringField
      FieldName = 'tpc_codncm'
      Origin = 'tpc_codncm'
      Size = 10
    end
    object sqltbpecastpc_codcfo: TStringField
      FieldName = 'tpc_codcfo'
      Origin = 'tpc_codcfo'
      Size = 4
    end
    object sqltbpecastpc_codcst: TStringField
      FieldName = 'tpc_codcst'
      Origin = 'tpc_codcst'
      Size = 2
    end
    object sqltbpecastpc_cdbarra: TStringField
      FieldName = 'tpc_cdbarra'
      Origin = 'tpc_cdbarra'
      Size = 15
    end
    object sqltbpecastpc_referen: TStringField
      FieldName = 'tpc_referen'
      Origin = 'tpc_referen'
    end
    object sqltbpecastpc_nome: TStringField
      FieldName = 'tpc_nome'
      Origin = 'tpc_nome'
      Size = 40
    end
    object sqltbpecastpc_medida: TStringField
      FieldName = 'tpc_medida'
      Origin = 'tpc_medida'
      Size = 3
    end
    object sqltbpecastpc_kgpeso: TBCDField
      FieldName = 'tpc_kgpeso'
      Origin = 'tpc_kgpeso'
      Precision = 15
      Size = 3
    end
    object sqltbpecastpc_kgcubag: TBCDField
      FieldName = 'tpc_kgcubag'
      Origin = 'tpc_kgcubag'
      Precision = 15
      Size = 3
    end
    object sqltbpecastpc_ativo: TBooleanField
      FieldName = 'tpc_ativo'
      Origin = 'tpc_ativo'
    end
    object sqltbpecastpc_datpro: TDateField
      FieldName = 'tpc_datpro'
      Origin = 'tpc_datpro'
    end
    object sqltbpecastpc_datems: TDateField
      FieldName = 'tpc_datems'
      Origin = 'tpc_datems'
    end
    object sqltbpecastpc_usuinc: TStringField
      FieldName = 'tpc_usuinc'
      Origin = 'tpc_usuinc'
      Size = 15
    end
    object sqltbpecastpc_datinc: TDateField
      FieldName = 'tpc_datinc'
      Origin = 'tpc_datinc'
    end
    object sqltbpecastpc_horinc: TStringField
      FieldName = 'tpc_horinc'
      Origin = 'tpc_horinc'
      Size = 8
    end
    object sqltbpecastpc_usualt: TStringField
      FieldName = 'tpc_usualt'
      Origin = 'tpc_usualt'
      Size = 15
    end
    object sqltbpecastpc_datalt: TDateField
      FieldName = 'tpc_datalt'
      Origin = 'tpc_datalt'
    end
    object sqltbpecastpc_horalt: TStringField
      FieldName = 'tpc_horalt'
      Origin = 'tpc_horalt'
      Size = 8
    end
    object sqltbpecasfbp_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'fbp_codigo'
      Origin = 'fbp_codigo'
    end
    object sqltbpecasfbp_rsocial: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fbp_rsocial'
      Origin = 'fbp_rsocial'
      Size = 40
    end
    object sqltbpecasfbp_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fbp_nome'
      Origin = 'fbp_nome'
      Size = 30
    end
    object sqltbpecasfbp_cpfcnpj: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fbp_cpfcnpj'
      Origin = 'fbp_cpfcnpj'
      Size = 14
    end
    object sqltbpecasfbp_codpct: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fbp_codpct'
      Origin = 'fbp_codpct'
      Size = 10
    end
    object sqltbpecasfbp_endereco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fbp_endereco'
      Origin = 'fbp_endereco'
      Size = 35
    end
    object sqltbpecasfbp_numend: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fbp_numend'
      Origin = 'fbp_numend'
      Size = 5
    end
    object sqltbpecasfbp_complem: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fbp_complem'
      Origin = 'fbp_complem'
      Size = 25
    end
    object sqltbpecasfbp_bairro: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fbp_bairro'
      Origin = 'fbp_bairro'
      Size = 50
    end
    object sqltbpecasfbp_cep: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fbp_cep'
      Origin = 'fbp_cep'
      Size = 8
    end
    object sqltbpecasfbp_codcid: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'fbp_codcid'
      Origin = 'fbp_codcid'
    end
    object sqltbpecasfbp_telef1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fbp_telef1'
      Origin = 'fbp_telef1'
      Size = 12
    end
    object sqltbpecasfbp_telef2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fbp_telef2'
      Origin = 'fbp_telef2'
      Size = 12
    end
    object sqltbpecasfbp_celula: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fbp_celula'
      Origin = 'fbp_celula'
      Size = 12
    end
    object sqltbpecasfbp_obs: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'fbp_obs'
      Origin = 'fbp_obs'
      BlobType = ftMemo
    end
    object sqltbpecasfbp_ativo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fbp_ativo'
      Origin = 'fbp_ativo'
      Size = 3
    end
    object sqltbpecasfbp_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fbp_usuinc'
      Origin = 'fbp_usuinc'
      Size = 15
    end
    object sqltbpecasfbp_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'fbp_datinc'
      Origin = 'fbp_datinc'
    end
    object sqltbpecasfbp_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fbp_horinc'
      Origin = 'fbp_horinc'
      Size = 8
    end
    object sqltbpecasfbp_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fbp_usualt'
      Origin = 'fbp_usualt'
      Size = 15
    end
    object sqltbpecasfbp_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'fbp_datalt'
      Origin = 'fbp_datalt'
    end
    object sqltbpecasfbp_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fbp_horalt'
      Origin = 'fbp_horalt'
      Size = 8
    end
    object sqltbpecasncm_codigo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ncm_codigo'
      Origin = 'ncm_codigo'
      Size = 10
    end
    object sqltbpecasncm_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ncm_nome'
      Origin = 'ncm_nome'
      Size = 350
    end
    object sqltbpecasncm_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ncm_usuinc'
      Origin = 'ncm_usuinc'
      Size = 15
    end
    object sqltbpecasncm_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'ncm_datinc'
      Origin = 'ncm_datinc'
    end
    object sqltbpecasncm_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ncm_horinc'
      Origin = 'ncm_horinc'
      Size = 8
    end
    object sqltbpecasncm_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ncm_usualt'
      Origin = 'ncm_usualt'
      Size = 15
    end
    object sqltbpecasncm_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'ncm_datalt'
      Origin = 'ncm_datalt'
    end
    object sqltbpecasncm_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ncm_horalt'
      Origin = 'ncm_horalt'
      Size = 8
    end
    object sqltbpecascfo_codigo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cfo_codigo'
      Origin = 'cfo_codigo'
      Size = 4
    end
    object sqltbpecascfo_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cfo_nome'
      Origin = 'cfo_nome'
      Size = 350
    end
    object sqltbpecascfo_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cfo_usuinc'
      Origin = 'cfo_usuinc'
      Size = 15
    end
    object sqltbpecascfo_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cfo_datinc'
      Origin = 'cfo_datinc'
    end
    object sqltbpecascfo_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cfo_horinc'
      Origin = 'cfo_horinc'
      Size = 8
    end
    object sqltbpecascfo_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cfo_usualt'
      Origin = 'cfo_usualt'
      Size = 15
    end
    object sqltbpecascfo_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cfo_datalt'
      Origin = 'cfo_datalt'
    end
    object sqltbpecascfo_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cfo_horalt'
      Origin = 'cfo_horalt'
      Size = 8
    end
    object sqltbpecascst_codigo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cst_codigo'
      Origin = 'cst_codigo'
      Size = 2
    end
    object sqltbpecascst_descri: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cst_descri'
      Origin = 'cst_descri'
      Size = 100
    end
    object sqltbpecascst_clcicm: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'cst_clcicm'
      Origin = 'cst_clcicm'
    end
    object sqltbpecascst_cf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cst_cf'
      Origin = 'cst_cf'
      Size = 5
    end
    object sqltbpecascst_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cst_usuinc'
      Origin = 'cst_usuinc'
      Size = 15
    end
    object sqltbpecascst_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cst_datinc'
      Origin = 'cst_datinc'
    end
    object sqltbpecascst_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cst_horinc'
      Origin = 'cst_horinc'
      Size = 8
    end
    object sqltbpecascst_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cst_usualt'
      Origin = 'cst_usualt'
      Size = 15
    end
    object sqltbpecascst_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cst_datalt'
      Origin = 'cst_datalt'
    end
    object sqltbpecascst_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cst_horalt'
      Origin = 'cst_horalt'
      Size = 8
    end
    object sqltbpecassgm_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_codigo'
      Origin = 'sgm_codigo'
    end
    object sqltbpecassgm_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_nome'
      Origin = 'sgm_nome'
      Size = 25
    end
    object sqltbpecassgm_codgrm: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_codgrm'
      Origin = 'sgm_codgrm'
    end
    object sqltbpecassgm_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_usuinc'
      Origin = 'sgm_usuinc'
      Size = 15
    end
    object sqltbpecassgm_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_datinc'
      Origin = 'sgm_datinc'
    end
    object sqltbpecassgm_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_horinc'
      Origin = 'sgm_horinc'
      Size = 8
    end
    object sqltbpecassgm_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_usualt'
      Origin = 'sgm_usualt'
      Size = 15
    end
    object sqltbpecassgm_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_datalt'
      Origin = 'sgm_datalt'
    end
    object sqltbpecassgm_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_horalt'
      Origin = 'sgm_horalt'
      Size = 8
    end
    object sqltbpecasgrm_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'grm_codigo'
      Origin = 'grm_codigo'
    end
    object sqltbpecasgrm_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grm_nome'
      Origin = 'grm_nome'
      Size = 40
    end
    object sqltbpecasgrm_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grm_usuinc'
      Origin = 'grm_usuinc'
      Size = 15
    end
    object sqltbpecasgrm_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'grm_datinc'
      Origin = 'grm_datinc'
    end
    object sqltbpecasgrm_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grm_horinc'
      Origin = 'grm_horinc'
      Size = 8
    end
    object sqltbpecasgrm_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grm_usualt'
      Origin = 'grm_usualt'
      Size = 15
    end
    object sqltbpecasgrm_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'grm_datalt'
      Origin = 'grm_datalt'
    end
    object sqltbpecasgrm_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grm_horalt'
      Origin = 'grm_horalt'
      Size = 8
    end
  end
  object sqlTbrecurso: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * from "dbconfig".tbrecurso')
    Left = 30
    Top = 1502
    object sqlTbrecursotbr_codigo: TIntegerField
      FieldName = 'tbr_codigo'
      Origin = 'tbr_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlTbrecursotbr_nome: TStringField
      FieldName = 'tbr_nome'
      Origin = 'tbr_nome'
      Size = 25
    end
    object sqlTbrecursotbr_codpct: TStringField
      FieldName = 'tbr_codpct'
      Origin = 'tbr_codpct'
      Size = 10
    end
    object sqlTbrecursotbr_vlrrec: TBCDField
      FieldName = 'tbr_vlrrec'
      Origin = 'tbr_vlrrec'
      Precision = 15
      Size = 2
    end
    object sqlTbrecursotbr_usuinc: TStringField
      FieldName = 'tbr_usuinc'
      Origin = 'tbr_usuinc'
      Size = 15
    end
    object sqlTbrecursotbr_datinc: TDateField
      FieldName = 'tbr_datinc'
      Origin = 'tbr_datinc'
    end
    object sqlTbrecursotbr_horinc: TStringField
      FieldName = 'tbr_horinc'
      Origin = 'tbr_horinc'
      Size = 8
    end
    object sqlTbrecursotbr_usualt: TStringField
      FieldName = 'tbr_usualt'
      Origin = 'tbr_usualt'
      Size = 15
    end
    object sqlTbrecursotbr_datalt: TDateField
      FieldName = 'tbr_datalt'
      Origin = 'tbr_datalt'
    end
    object sqlTbrecursotbr_horalt: TStringField
      FieldName = 'tbr_horalt'
      Origin = 'tbr_horalt'
      Size = 8
    end
  end
  object sqlMarca: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'SELECT * From "dbconfig".marca')
    Left = 336
    Top = 152
    object sqlMarcamrc_codigo: TIntegerField
      FieldName = 'mrc_codigo'
      Origin = 'mrc_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlMarcamrc_nome: TStringField
      FieldName = 'mrc_nome'
      Origin = 'mrc_nome'
      Size = 25
    end
    object sqlMarcamrc_usuinc: TStringField
      FieldName = 'mrc_usuinc'
      Origin = 'mrc_usuinc'
      Size = 15
    end
    object sqlMarcamrc_datinc: TDateField
      FieldName = 'mrc_datinc'
      Origin = 'mrc_datinc'
    end
    object sqlMarcamrc_horinc: TStringField
      FieldName = 'mrc_horinc'
      Origin = 'mrc_horinc'
      Size = 8
    end
    object sqlMarcamrc_usualt: TStringField
      FieldName = 'mrc_usualt'
      Origin = 'mrc_usualt'
      Size = 15
    end
    object sqlMarcamrc_datalt: TDateField
      FieldName = 'mrc_datalt'
      Origin = 'mrc_datalt'
    end
    object sqlMarcamrc_horalt: TStringField
      FieldName = 'mrc_horalt'
      Origin = 'mrc_horalt'
      Size = 8
    end
  end
  object sqlModelo: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'SELECT * From "dbconfig".modelo'
      'left join "dbconfig".marca on mrc_codigo = mdl_codmrc'
      'left join "dbconfig".grupomnt on grm_codigo = mdl_codgrm')
    Left = 336
    Top = 208
    object sqlModelomdl_codigo: TIntegerField
      FieldName = 'mdl_codigo'
      Origin = 'mdl_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlModelomdl_nome: TStringField
      FieldName = 'mdl_nome'
      Origin = 'mdl_nome'
      Size = 25
    end
    object sqlModelomdl_codfip: TStringField
      FieldName = 'mdl_codfip'
      Origin = 'mdl_codfip'
      Size = 10
    end
    object sqlModelomdl_codmrc: TIntegerField
      FieldName = 'mdl_codmrc'
      Origin = 'mdl_codmrc'
    end
    object sqlModelomdl_codgrm: TIntegerField
      FieldName = 'mdl_codgrm'
      Origin = 'mdl_codgrm'
    end
    object sqlModelomdl_usuinc: TStringField
      FieldName = 'mdl_usuinc'
      Origin = 'mdl_usuinc'
      Size = 15
    end
    object sqlModelomdl_datinc: TDateField
      FieldName = 'mdl_datinc'
      Origin = 'mdl_datinc'
    end
    object sqlModelomdl_horinc: TStringField
      FieldName = 'mdl_horinc'
      Origin = 'mdl_horinc'
      Size = 8
    end
    object sqlModelomdl_usualt: TStringField
      FieldName = 'mdl_usualt'
      Origin = 'mdl_usualt'
      Size = 15
    end
    object sqlModelomdl_datalt: TDateField
      FieldName = 'mdl_datalt'
      Origin = 'mdl_datalt'
    end
    object sqlModelomdl_horalt: TStringField
      FieldName = 'mdl_horalt'
      Origin = 'mdl_horalt'
      Size = 8
    end
    object sqlModelomrc_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'mrc_codigo'
      Origin = 'mrc_codigo'
    end
    object sqlModelomrc_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mrc_nome'
      Origin = 'mrc_nome'
      Size = 25
    end
    object sqlModelomrc_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mrc_usuinc'
      Origin = 'mrc_usuinc'
      Size = 15
    end
    object sqlModelomrc_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'mrc_datinc'
      Origin = 'mrc_datinc'
    end
    object sqlModelomrc_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mrc_horinc'
      Origin = 'mrc_horinc'
      Size = 8
    end
    object sqlModelomrc_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mrc_usualt'
      Origin = 'mrc_usualt'
      Size = 15
    end
    object sqlModelomrc_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'mrc_datalt'
      Origin = 'mrc_datalt'
    end
    object sqlModelomrc_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mrc_horalt'
      Origin = 'mrc_horalt'
      Size = 8
    end
    object sqlModelogrm_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'grm_codigo'
      Origin = 'grm_codigo'
    end
    object sqlModelogrm_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grm_nome'
      Origin = 'grm_nome'
      Size = 40
    end
    object sqlModelogrm_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grm_usuinc'
      Origin = 'grm_usuinc'
      Size = 15
    end
    object sqlModelogrm_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'grm_datinc'
      Origin = 'grm_datinc'
    end
    object sqlModelogrm_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grm_horinc'
      Origin = 'grm_horinc'
      Size = 8
    end
    object sqlModelogrm_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grm_usualt'
      Origin = 'grm_usualt'
      Size = 15
    end
    object sqlModelogrm_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'grm_datalt'
      Origin = 'grm_datalt'
    end
    object sqlModelogrm_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grm_horalt'
      Origin = 'grm_horalt'
      Size = 8
    end
  end
  object sqlModeloMnt: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * from "dbconfig".modelomnt '
      'LEFT JOIN "dbconfig".tbservico on tsm_codigo = mdm_codtsm')
    Left = 336
    Top = 264
    object sqlModeloMntmdm_codigo: TIntegerField
      FieldName = 'mdm_codigo'
      Origin = 'mdm_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlModeloMntmdm_codtsm: TIntegerField
      FieldName = 'mdm_codtsm'
      Origin = 'mdm_codtsm'
    end
    object sqlModeloMntmdm_codmdl: TIntegerField
      FieldName = 'mdm_codmdl'
      Origin = 'mdm_codmdl'
    end
    object sqlModeloMntmdm_kmmanu: TBCDField
      FieldName = 'mdm_kmmanu'
      Origin = 'mdm_kmmanu'
      Precision = 7
      Size = 0
    end
    object sqlModeloMntmdm_datmnt: TDateField
      FieldName = 'mdm_datmnt'
      Origin = 'mdm_datmnt'
    end
    object sqlModeloMntmdm_ativo: TBooleanField
      FieldName = 'mdm_ativo'
      Origin = 'mdm_ativo'
    end
    object sqlModeloMntmdm_usuinc: TStringField
      FieldName = 'mdm_usuinc'
      Origin = 'mdm_usuinc'
      Size = 15
    end
    object sqlModeloMntmdm_datinc: TDateField
      FieldName = 'mdm_datinc'
      Origin = 'mdm_datinc'
    end
    object sqlModeloMntmdm_horinc: TStringField
      FieldName = 'mdm_horinc'
      Origin = 'mdm_horinc'
      Size = 8
    end
    object sqlModeloMntmdm_usualt: TStringField
      FieldName = 'mdm_usualt'
      Origin = 'mdm_usualt'
      Size = 15
    end
    object sqlModeloMntmdm_datalt: TDateField
      FieldName = 'mdm_datalt'
      Origin = 'mdm_datalt'
    end
    object sqlModeloMntmdm_horalt: TStringField
      FieldName = 'mdm_horalt'
      Origin = 'mdm_horalt'
      Size = 8
    end
    object sqlModeloMnttsm_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_codigo'
      Origin = 'tsm_codigo'
    end
    object sqlModeloMnttsm_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_nome'
      Origin = 'tsm_nome'
      Size = 25
    end
    object sqlModeloMnttsm_vlrhor: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_vlrhor'
      Origin = 'tsm_vlrhor'
      Precision = 12
      Size = 2
    end
    object sqlModeloMnttsm_codsgm: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_codsgm'
      Origin = 'tsm_codsgm'
    end
    object sqlModeloMnttsm_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_usuinc'
      Origin = 'tsm_usuinc'
      Size = 15
    end
    object sqlModeloMnttsm_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_datinc'
      Origin = 'tsm_datinc'
    end
    object sqlModeloMnttsm_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_horinc'
      Origin = 'tsm_horinc'
      Size = 8
    end
    object sqlModeloMnttsm_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_usualt'
      Origin = 'tsm_usualt'
      Size = 15
    end
    object sqlModeloMnttsm_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_datalt'
      Origin = 'tsm_datalt'
    end
    object sqlModeloMnttsm_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_horalt'
      Origin = 'tsm_horalt'
      Size = 8
    end
  end
  object sqlAcessorio: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'SELECT * From "dbconfig".Acessorio')
    Left = 336
    Top = 315
    object sqlAcessorioacs_codigo: TIntegerField
      FieldName = 'acs_codigo'
      Origin = 'acs_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlAcessorioacs_nome: TStringField
      FieldName = 'acs_nome'
      Origin = 'acs_nome'
      Size = 25
    end
    object sqlAcessorioacs_usuinc: TStringField
      FieldName = 'acs_usuinc'
      Origin = 'acs_usuinc'
      Size = 15
    end
    object sqlAcessorioacs_datinc: TDateField
      FieldName = 'acs_datinc'
      Origin = 'acs_datinc'
    end
    object sqlAcessorioacs_horinc: TStringField
      FieldName = 'acs_horinc'
      Origin = 'acs_horinc'
      Size = 8
    end
    object sqlAcessorioacs_usualt: TStringField
      FieldName = 'acs_usualt'
      Origin = 'acs_usualt'
      Size = 15
    end
    object sqlAcessorioacs_datalt: TDateField
      FieldName = 'acs_datalt'
      Origin = 'acs_datalt'
    end
    object sqlAcessorioacs_horalt: TStringField
      FieldName = 'acs_horalt'
      Origin = 'acs_horalt'
      Size = 8
    end
  end
  object sqlTipo: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'SELECT * From "dbconfig".Tipo')
    Left = 336
    Top = 371
    object sqlTipotip_codigo: TIntegerField
      FieldName = 'tip_codigo'
      Origin = 'tip_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlTipotip_nome: TStringField
      FieldName = 'tip_nome'
      Origin = 'tip_nome'
      Size = 25
    end
    object sqlTipotip_teixo: TBCDField
      FieldName = 'tip_teixo'
      Origin = 'tip_teixo'
      Precision = 1
      Size = 0
    end
    object sqlTipotip_usuinc: TStringField
      FieldName = 'tip_usuinc'
      Origin = 'tip_usuinc'
      Size = 15
    end
    object sqlTipotip_step: TBCDField
      FieldName = 'tip_step'
      Origin = 'tip_step'
      Precision = 1
      Size = 0
    end
    object sqlTipotip_tipo: TStringField
      FieldName = 'tip_tipo'
      Origin = 'tip_tipo'
      Size = 15
    end
    object sqlTipotip_trac: TStringField
      FieldName = 'tip_trac'
      Origin = 'tip_trac'
      Size = 15
    end
    object sqlTipotip_datinc: TDateField
      FieldName = 'tip_datinc'
      Origin = 'tip_datinc'
    end
    object sqlTipotip_horinc: TStringField
      FieldName = 'tip_horinc'
      Origin = 'tip_horinc'
      Size = 8
    end
    object sqlTipotip_usualt: TStringField
      FieldName = 'tip_usualt'
      Origin = 'tip_usualt'
      Size = 15
    end
    object sqlTipotip_datalt: TDateField
      FieldName = 'tip_datalt'
      Origin = 'tip_datalt'
    end
    object sqlTipotip_horalt: TStringField
      FieldName = 'tip_horalt'
      Origin = 'tip_horalt'
      Size = 8
    end
  end
  object sqlLotado: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * from "dbconfig".lotado '
      'LEFT JOIN "dbconfig".cidade on cid_codigo = ltd_codcid')
    Left = 336
    Top = 427
    object sqlLotadoltd_codigo: TIntegerField
      FieldName = 'ltd_codigo'
      Origin = 'ltd_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlLotadoltd_nome: TStringField
      FieldName = 'ltd_nome'
      Origin = 'ltd_nome'
      Size = 35
    end
    object sqlLotadoltd_sigla: TStringField
      FieldName = 'ltd_sigla'
      Origin = 'ltd_sigla'
      Size = 5
    end
    object sqlLotadoltd_endereco: TStringField
      FieldName = 'ltd_endereco'
      Origin = 'ltd_endereco'
      Size = 35
    end
    object sqlLotadoltd_numend: TStringField
      FieldName = 'ltd_numend'
      Origin = 'ltd_numend'
      Size = 5
    end
    object sqlLotadoltd_complem: TStringField
      FieldName = 'ltd_complem'
      Origin = 'ltd_complem'
      Size = 25
    end
    object sqlLotadoltd_bairro: TStringField
      FieldName = 'ltd_bairro'
      Origin = 'ltd_bairro'
      Size = 50
    end
    object sqlLotadoltd_cep: TStringField
      FieldName = 'ltd_cep'
      Origin = 'ltd_cep'
      Size = 8
    end
    object sqlLotadoltd_codcid: TIntegerField
      FieldName = 'ltd_codcid'
      Origin = 'ltd_codcid'
    end
    object sqlLotadoltd_telef1: TStringField
      FieldName = 'ltd_telef1'
      Origin = 'ltd_telef1'
      Size = 12
    end
    object sqlLotadoltd_telef2: TStringField
      FieldName = 'ltd_telef2'
      Origin = 'ltd_telef2'
      Size = 12
    end
    object sqlLotadoltd_celula: TStringField
      FieldName = 'ltd_celula'
      Origin = 'ltd_celula'
      Size = 12
    end
    object sqlLotadoltd_usuinc: TStringField
      FieldName = 'ltd_usuinc'
      Origin = 'ltd_usuinc'
      Size = 15
    end
    object sqlLotadoltd_datinc: TDateField
      FieldName = 'ltd_datinc'
      Origin = 'ltd_datinc'
    end
    object sqlLotadoltd_horinc: TStringField
      FieldName = 'ltd_horinc'
      Origin = 'ltd_horinc'
      Size = 8
    end
    object sqlLotadoltd_usualt: TStringField
      FieldName = 'ltd_usualt'
      Origin = 'ltd_usualt'
      Size = 15
    end
    object sqlLotadoltd_datalt: TDateField
      FieldName = 'ltd_datalt'
      Origin = 'ltd_datalt'
    end
    object sqlLotadoltd_horalt: TStringField
      FieldName = 'ltd_horalt'
      Origin = 'ltd_horalt'
      Size = 8
    end
    object sqlLotadocid_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cid_codigo'
      Origin = 'cid_codigo'
    end
    object sqlLotadocid_cidnum: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_cidnum'
      Origin = 'cid_cidnum'
      Size = 8
    end
    object sqlLotadocid_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_nome'
      Origin = 'cid_nome'
      Size = 35
    end
    object sqlLotadocid_codest: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cid_codest'
      Origin = 'cid_codest'
    end
    object sqlLotadocid_codpai: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cid_codpai'
      Origin = 'cid_codpai'
    end
    object sqlLotadocid_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_usuinc'
      Origin = 'cid_usuinc'
      Size = 15
    end
    object sqlLotadocid_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cid_datinc'
      Origin = 'cid_datinc'
    end
    object sqlLotadocid_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_horinc'
      Origin = 'cid_horinc'
      Size = 8
    end
    object sqlLotadocid_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_usualt'
      Origin = 'cid_usualt'
      Size = 15
    end
    object sqlLotadocid_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cid_datalt'
      Origin = 'cid_datalt'
    end
    object sqlLotadocid_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_horalt'
      Origin = 'cid_horalt'
      Size = 8
    end
  end
  object sqlCor: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'SELECT * From "dbconfig".cor')
    Left = 336
    Top = 483
    object sqlCorcor_codigo: TIntegerField
      FieldName = 'cor_codigo'
      Origin = 'cor_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlCorcor_nome: TStringField
      FieldName = 'cor_nome'
      Origin = 'cor_nome'
      Size = 35
    end
    object sqlCorcor_usuinc: TStringField
      FieldName = 'cor_usuinc'
      Origin = 'cor_usuinc'
      Size = 15
    end
    object sqlCorcor_datinc: TDateField
      FieldName = 'cor_datinc'
      Origin = 'cor_datinc'
    end
    object sqlCorcor_horinc: TStringField
      FieldName = 'cor_horinc'
      Origin = 'cor_horinc'
      Size = 8
    end
    object sqlCorcor_usualt: TStringField
      FieldName = 'cor_usualt'
      Origin = 'cor_usualt'
      Size = 15
    end
    object sqlCorcor_datalt: TDateField
      FieldName = 'cor_datalt'
      Origin = 'cor_datalt'
    end
    object sqlCorcor_horalt: TStringField
      FieldName = 'cor_horalt'
      Origin = 'cor_horalt'
      Size = 8
    end
  end
  object sqlCargo: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'SELECT * From "dbconfig".cargo ')
    Left = 336
    Top = 539
    object sqlCargocgo_codigo: TIntegerField
      FieldName = 'cgo_codigo'
      Origin = 'cgo_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlCargocgo_nome: TStringField
      FieldName = 'cgo_nome'
      Origin = 'cgo_nome'
      Size = 35
    end
    object sqlCargocgo_usuinc: TStringField
      FieldName = 'cgo_usuinc'
      Origin = 'cgo_usuinc'
      Size = 15
    end
    object sqlCargocgo_datinc: TDateField
      FieldName = 'cgo_datinc'
      Origin = 'cgo_datinc'
    end
    object sqlCargocgo_horinc: TStringField
      FieldName = 'cgo_horinc'
      Origin = 'cgo_horinc'
      Size = 8
    end
    object sqlCargocgo_usualt: TStringField
      FieldName = 'cgo_usualt'
      Origin = 'cgo_usualt'
      Size = 15
    end
    object sqlCargocgo_datalt: TDateField
      FieldName = 'cgo_datalt'
      Origin = 'cgo_datalt'
    end
    object sqlCargocgo_horalt: TStringField
      FieldName = 'cgo_horalt'
      Origin = 'cgo_horalt'
      Size = 8
    end
  end
  object sqlPconta: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'SELECT * From "dbconfig".Pconta')
    Left = 338
    Top = 592
    object sqlPcontapct_codigo: TStringField
      FieldName = 'pct_codigo'
      Origin = 'pct_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 10
    end
    object sqlPcontapct_cntmae: TStringField
      FieldName = 'pct_cntmae'
      Origin = 'pct_cntmae'
      Size = 10
    end
    object sqlPcontapct_nome: TStringField
      FieldName = 'pct_nome'
      Origin = 'pct_nome'
      Size = 50
    end
    object sqlPcontapct_natureza: TStringField
      FieldName = 'pct_natureza'
      Origin = 'pct_natureza'
      Size = 1
    end
    object sqlPcontapct_tipo: TStringField
      FieldName = 'pct_tipo'
      Origin = 'pct_tipo'
      Size = 1
    end
    object sqlPcontapct_limite: TBCDField
      FieldName = 'pct_limite'
      Origin = 'pct_limite'
      Precision = 15
      Size = 2
    end
    object sqlPcontapct_meta: TBCDField
      FieldName = 'pct_meta'
      Origin = 'pct_meta'
      Precision = 15
      Size = 2
    end
    object sqlPcontapct_ord: TBCDField
      FieldName = 'pct_ord'
      Origin = 'pct_ord'
      Precision = 1
      Size = 0
    end
    object sqlPcontapct_usuinc: TStringField
      FieldName = 'pct_usuinc'
      Origin = 'pct_usuinc'
      Size = 15
    end
    object sqlPcontapct_datinc: TDateField
      FieldName = 'pct_datinc'
      Origin = 'pct_datinc'
    end
    object sqlPcontapct_horinc: TStringField
      FieldName = 'pct_horinc'
      Origin = 'pct_horinc'
      Size = 8
    end
    object sqlPcontapct_usualt: TStringField
      FieldName = 'pct_usualt'
      Origin = 'pct_usualt'
      Size = 15
    end
    object sqlPcontapct_datalt: TDateField
      FieldName = 'pct_datalt'
      Origin = 'pct_datalt'
    end
    object sqlPcontapct_horalt: TStringField
      FieldName = 'pct_horalt'
      Origin = 'pct_horalt'
      Size = 8
    end
  end
  object sqlFormapgm: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * from "dbconfig".formapgm'
      'LEFT JOIN "dbconfig".pconta on pct_codigo = fpg_codpct'
      '')
    Left = 336
    Top = 651
    object sqlFormapgmfpg_codigo: TIntegerField
      FieldName = 'fpg_codigo'
      Origin = 'fpg_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlFormapgmfpg_nome: TStringField
      FieldName = 'fpg_nome'
      Origin = 'fpg_nome'
    end
    object sqlFormapgmfpg_codpct: TStringField
      FieldName = 'fpg_codpct'
      Origin = 'fpg_codpct'
      Size = 10
    end
    object sqlFormapgmfpg_acao: TStringField
      FieldName = 'fpg_acao'
      Origin = 'fpg_acao'
      Size = 3
    end
    object sqlFormapgmfpg_parcela: TStringField
      FieldName = 'fpg_parcela'
      Origin = 'fpg_parcela'
      Size = 3
    end
    object sqlFormapgmfpg_pctdesc: TBCDField
      FieldName = 'fpg_pctdesc'
      Origin = 'fpg_pctdesc'
      Precision = 5
      Size = 2
    end
    object sqlFormapgmfpg_pctacre: TBCDField
      FieldName = 'fpg_pctacre'
      Origin = 'fpg_pctacre'
      Precision = 5
      Size = 2
    end
    object sqlFormapgmfpg_usuinc: TStringField
      FieldName = 'fpg_usuinc'
      Origin = 'fpg_usuinc'
      Size = 15
    end
    object sqlFormapgmfpg_datinc: TDateField
      FieldName = 'fpg_datinc'
      Origin = 'fpg_datinc'
    end
    object sqlFormapgmfpg_horinc: TStringField
      FieldName = 'fpg_horinc'
      Origin = 'fpg_horinc'
      Size = 8
    end
    object sqlFormapgmfpg_usualt: TStringField
      FieldName = 'fpg_usualt'
      Origin = 'fpg_usualt'
      Size = 15
    end
    object sqlFormapgmfpg_datalt: TDateField
      FieldName = 'fpg_datalt'
      Origin = 'fpg_datalt'
    end
    object sqlFormapgmfpg_horalt: TStringField
      FieldName = 'fpg_horalt'
      Origin = 'fpg_horalt'
      Size = 8
    end
    object sqlFormapgmpct_codigo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_codigo'
      Origin = 'pct_codigo'
      Size = 10
    end
    object sqlFormapgmpct_cntmae: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_cntmae'
      Origin = 'pct_cntmae'
      Size = 10
    end
    object sqlFormapgmpct_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_nome'
      Origin = 'pct_nome'
      Size = 50
    end
    object sqlFormapgmpct_natureza: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_natureza'
      Origin = 'pct_natureza'
      Size = 1
    end
    object sqlFormapgmpct_tipo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_tipo'
      Origin = 'pct_tipo'
      Size = 1
    end
    object sqlFormapgmpct_limite: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'pct_limite'
      Origin = 'pct_limite'
      Precision = 15
      Size = 2
    end
    object sqlFormapgmpct_meta: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'pct_meta'
      Origin = 'pct_meta'
      Precision = 15
      Size = 2
    end
    object sqlFormapgmpct_ord: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'pct_ord'
      Origin = 'pct_ord'
      Precision = 1
      Size = 0
    end
    object sqlFormapgmpct_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_usuinc'
      Origin = 'pct_usuinc'
      Size = 15
    end
    object sqlFormapgmpct_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pct_datinc'
      Origin = 'pct_datinc'
    end
    object sqlFormapgmpct_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_horinc'
      Origin = 'pct_horinc'
      Size = 8
    end
    object sqlFormapgmpct_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_usualt'
      Origin = 'pct_usualt'
      Size = 15
    end
    object sqlFormapgmpct_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pct_datalt'
      Origin = 'pct_datalt'
    end
    object sqlFormapgmpct_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_horalt'
      Origin = 'pct_horalt'
      Size = 8
    end
  end
  object sqlBanco: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'SELECT * From "dbconfig".Banco')
    Left = 336
    Top = 696
    object sqlBancobco_codigo: TStringField
      FieldName = 'bco_codigo'
      Origin = 'bco_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 6
    end
    object sqlBancobco_nome: TStringField
      FieldName = 'bco_nome'
      Origin = 'bco_nome'
      Size = 70
    end
    object sqlBancobco_usuinc: TStringField
      FieldName = 'bco_usuinc'
      Origin = 'bco_usuinc'
      Size = 15
    end
    object sqlBancobco_datinc: TDateField
      FieldName = 'bco_datinc'
      Origin = 'bco_datinc'
    end
    object sqlBancobco_horinc: TStringField
      FieldName = 'bco_horinc'
      Origin = 'bco_horinc'
      Size = 8
    end
    object sqlBancobco_usualt: TStringField
      FieldName = 'bco_usualt'
      Origin = 'bco_usualt'
      Size = 15
    end
    object sqlBancobco_datalt: TDateField
      FieldName = 'bco_datalt'
      Origin = 'bco_datalt'
    end
    object sqlBancobco_horalt: TStringField
      FieldName = 'bco_horalt'
      Origin = 'bco_horalt'
      Size = 8
    end
  end
  object sqlMateriapri: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'SELECT * From "dbconfig".Materiapri')
    Left = 336
    Top = 752
    object sqlMateriaprimpr_codigo: TIntegerField
      FieldName = 'mpr_codigo'
      Origin = 'mpr_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlMateriaprimpr_nome: TStringField
      FieldName = 'mpr_nome'
      Origin = 'mpr_nome'
      Size = 40
    end
    object sqlMateriaprimpr_usuinc: TStringField
      FieldName = 'mpr_usuinc'
      Origin = 'mpr_usuinc'
      Size = 15
    end
    object sqlMateriaprimpr_datinc: TDateField
      FieldName = 'mpr_datinc'
      Origin = 'mpr_datinc'
    end
    object sqlMateriaprimpr_horinc: TStringField
      FieldName = 'mpr_horinc'
      Origin = 'mpr_horinc'
      Size = 8
    end
    object sqlMateriaprimpr_usualt: TStringField
      FieldName = 'mpr_usualt'
      Origin = 'mpr_usualt'
      Size = 15
    end
    object sqlMateriaprimpr_datalt: TDateField
      FieldName = 'mpr_datalt'
      Origin = 'mpr_datalt'
    end
    object sqlMateriaprimpr_horalt: TStringField
      FieldName = 'mpr_horalt'
      Origin = 'mpr_horalt'
      Size = 8
    end
  end
  object sqlCategoria: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'SELECT * From "dbconfig".categoria')
    Left = 336
    Top = 808
    object sqlCategoriactg_codigo: TIntegerField
      FieldName = 'ctg_codigo'
      Origin = 'ctg_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlCategoriactg_nome: TStringField
      FieldName = 'ctg_nome'
      Origin = 'ctg_nome'
      Size = 40
    end
    object sqlCategoriactg_usuinc: TStringField
      FieldName = 'ctg_usuinc'
      Origin = 'ctg_usuinc'
      Size = 15
    end
    object sqlCategoriactg_datinc: TDateField
      FieldName = 'ctg_datinc'
      Origin = 'ctg_datinc'
    end
    object sqlCategoriactg_horinc: TStringField
      FieldName = 'ctg_horinc'
      Origin = 'ctg_horinc'
      Size = 8
    end
    object sqlCategoriactg_usualt: TStringField
      FieldName = 'ctg_usualt'
      Origin = 'ctg_usualt'
      Size = 15
    end
    object sqlCategoriactg_datalt: TDateField
      FieldName = 'ctg_datalt'
      Origin = 'ctg_datalt'
    end
    object sqlCategoriactg_horalt: TStringField
      FieldName = 'ctg_horalt'
      Origin = 'ctg_horalt'
      Size = 8
    end
  end
  object sqlFabricante: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'SELECT * From "dbconfig".Fabricante')
    Left = 336
    Top = 864
    object sqlFabricantefbt_codigo: TIntegerField
      FieldName = 'fbt_codigo'
      Origin = 'fbt_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlFabricantefbt_nome: TStringField
      FieldName = 'fbt_nome'
      Origin = 'fbt_nome'
      Size = 40
    end
    object sqlFabricantefbt_usuinc: TStringField
      FieldName = 'fbt_usuinc'
      Origin = 'fbt_usuinc'
      Size = 15
    end
    object sqlFabricantefbt_datinc: TDateField
      FieldName = 'fbt_datinc'
      Origin = 'fbt_datinc'
    end
    object sqlFabricantefbt_horinc: TStringField
      FieldName = 'fbt_horinc'
      Origin = 'fbt_horinc'
      Size = 8
    end
    object sqlFabricantefbt_usualt: TStringField
      FieldName = 'fbt_usualt'
      Origin = 'fbt_usualt'
      Size = 15
    end
    object sqlFabricantefbt_datalt: TDateField
      FieldName = 'fbt_datalt'
      Origin = 'fbt_datalt'
    end
    object sqlFabricantefbt_horalt: TStringField
      FieldName = 'fbt_horalt'
      Origin = 'fbt_horalt'
      Size = 8
    end
  end
  object sqlCst: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'SELECT * from "dbconfig".cst')
    Left = 336
    Top = 984
    object sqlCstcst_codigo: TStringField
      FieldName = 'cst_codigo'
      Origin = 'cst_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlCstcst_descri: TStringField
      FieldName = 'cst_descri'
      Origin = 'cst_descri'
      Size = 100
    end
    object sqlCstcst_clcicm: TBooleanField
      FieldName = 'cst_clcicm'
      Origin = 'cst_clcicm'
    end
    object sqlCstcst_cf: TStringField
      FieldName = 'cst_cf'
      Origin = 'cst_cf'
      Size = 5
    end
    object sqlCstcst_usuinc: TStringField
      FieldName = 'cst_usuinc'
      Origin = 'cst_usuinc'
      Size = 15
    end
    object sqlCstcst_datinc: TDateField
      FieldName = 'cst_datinc'
      Origin = 'cst_datinc'
    end
    object sqlCstcst_horinc: TStringField
      FieldName = 'cst_horinc'
      Origin = 'cst_horinc'
      Size = 8
    end
    object sqlCstcst_usualt: TStringField
      FieldName = 'cst_usualt'
      Origin = 'cst_usualt'
      Size = 15
    end
    object sqlCstcst_datalt: TDateField
      FieldName = 'cst_datalt'
      Origin = 'cst_datalt'
    end
    object sqlCstcst_horalt: TStringField
      FieldName = 'cst_horalt'
      Origin = 'cst_horalt'
      Size = 8
    end
  end
  object sqlNcm: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'SELECT * From "dbconfig".Ncm')
    Left = 336
    Top = 1040
    object sqlNcmncm_codigo: TStringField
      FieldName = 'ncm_codigo'
      Origin = 'ncm_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 10
    end
    object sqlNcmncm_nome: TStringField
      FieldName = 'ncm_nome'
      Origin = 'ncm_nome'
      Size = 350
    end
    object sqlNcmncm_usuinc: TStringField
      FieldName = 'ncm_usuinc'
      Origin = 'ncm_usuinc'
      Size = 15
    end
    object sqlNcmncm_datinc: TDateField
      FieldName = 'ncm_datinc'
      Origin = 'ncm_datinc'
    end
    object sqlNcmncm_horinc: TStringField
      FieldName = 'ncm_horinc'
      Origin = 'ncm_horinc'
      Size = 8
    end
    object sqlNcmncm_usualt: TStringField
      FieldName = 'ncm_usualt'
      Origin = 'ncm_usualt'
      Size = 15
    end
    object sqlNcmncm_datalt: TDateField
      FieldName = 'ncm_datalt'
      Origin = 'ncm_datalt'
    end
    object sqlNcmncm_horalt: TStringField
      FieldName = 'ncm_horalt'
      Origin = 'ncm_horalt'
      Size = 8
    end
  end
  object sqltabmulta: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'SELECT * From "dbconfig".tabmulta')
    Left = 336
    Top = 1096
    object sqltabmultatmt_codigo: TStringField
      FieldName = 'tmt_codigo'
      Origin = 'tmt_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 7
    end
    object sqltabmultatmt_nome: TStringField
      FieldName = 'tmt_nome'
      Origin = 'tmt_nome'
      Size = 200
    end
    object sqltabmultatmt_ampleg: TStringField
      FieldName = 'tmt_ampleg'
      Origin = 'tmt_ampleg'
    end
    object sqltabmultatmt_gravid: TStringField
      FieldName = 'tmt_gravid'
      Origin = 'tmt_gravid'
    end
    object sqltabmultatmt_infrat: TStringField
      FieldName = 'tmt_infrat'
      Origin = 'tmt_infrat'
    end
    object sqltabmultatmt_local: TStringField
      FieldName = 'tmt_local'
      Origin = 'tmt_local'
    end
    object sqltabmultatmt_nmrpts: TIntegerField
      FieldName = 'tmt_nmrpts'
      Origin = 'tmt_nmrpts'
    end
    object sqltabmultatmt_vlrmul: TBCDField
      FieldName = 'tmt_vlrmul'
      Origin = 'tmt_vlrmul'
      Precision = 12
      Size = 2
    end
    object sqltabmultatmt_usuinc: TStringField
      FieldName = 'tmt_usuinc'
      Origin = 'tmt_usuinc'
      Size = 15
    end
    object sqltabmultatmt_datinc: TDateField
      FieldName = 'tmt_datinc'
      Origin = 'tmt_datinc'
    end
    object sqltabmultatmt_horinc: TStringField
      FieldName = 'tmt_horinc'
      Origin = 'tmt_horinc'
      Size = 8
    end
    object sqltabmultatmt_usualt: TStringField
      FieldName = 'tmt_usualt'
      Origin = 'tmt_usualt'
      Size = 15
    end
    object sqltabmultatmt_datalt: TDateField
      FieldName = 'tmt_datalt'
      Origin = 'tmt_datalt'
    end
    object sqltabmultatmt_horalt: TStringField
      FieldName = 'tmt_horalt'
      Origin = 'tmt_horalt'
      Size = 8
    end
  end
  object sqlorgtrans: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'SELECT * From "dbconfig".orgtrans')
    Left = 336
    Top = 1154
    object sqlorgtransogt_codigo: TIntegerField
      FieldName = 'ogt_codigo'
      Origin = 'ogt_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlorgtransogt_nome: TStringField
      FieldName = 'ogt_nome'
      Origin = 'ogt_nome'
      Size = 60
    end
    object sqlorgtransogt_sigla: TStringField
      FieldName = 'ogt_sigla'
      Origin = 'ogt_sigla'
      Size = 10
    end
    object sqlorgtransogt_telef01: TStringField
      FieldName = 'ogt_telef01'
      Origin = 'ogt_telef01'
      Size = 11
    end
    object sqlorgtransogt_telef02: TStringField
      FieldName = 'ogt_telef02'
      Origin = 'ogt_telef02'
      Size = 11
    end
    object sqlorgtransogt_codpct: TStringField
      FieldName = 'ogt_codpct'
      Origin = 'ogt_codpct'
      Size = 10
    end
    object sqlorgtransogt_usuinc: TStringField
      FieldName = 'ogt_usuinc'
      Origin = 'ogt_usuinc'
      Size = 15
    end
    object sqlorgtransogt_datinc: TDateField
      FieldName = 'ogt_datinc'
      Origin = 'ogt_datinc'
    end
    object sqlorgtransogt_horinc: TStringField
      FieldName = 'ogt_horinc'
      Origin = 'ogt_horinc'
      Size = 8
    end
    object sqlorgtransogt_usualt: TStringField
      FieldName = 'ogt_usualt'
      Origin = 'ogt_usualt'
      Size = 15
    end
    object sqlorgtransogt_datalt: TDateField
      FieldName = 'ogt_datalt'
      Origin = 'ogt_datalt'
    end
    object sqlorgtransogt_horalt: TStringField
      FieldName = 'ogt_horalt'
      Origin = 'ogt_horalt'
      Size = 8
    end
  end
  object sqlManuitem: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * from "dbconfig".manutitem'
      'LEFT JOIN "dbconfig".subgrpmnt on sgm_codigo = mit_codsgm'
      'LEFT JOIN "dbconfig".grupomnt  on grm_codigo = sgm_codgrm')
    Left = 336
    Top = 1208
    object sqlManuitemmit_codigo: TIntegerField
      FieldName = 'mit_codigo'
      Origin = 'mit_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlManuitemmit_nome: TStringField
      FieldName = 'mit_nome'
      Origin = 'mit_nome'
      Size = 25
    end
    object sqlManuitemmit_kmmanu: TBCDField
      FieldName = 'mit_kmmanu'
      Origin = 'mit_kmmanu'
      Precision = 7
      Size = 0
    end
    object sqlManuitemmit_period: TStringField
      FieldName = 'mit_period'
      Origin = 'mit_period'
      Size = 4
    end
    object sqlManuitemmit_codsgm: TIntegerField
      FieldName = 'mit_codsgm'
      Origin = 'mit_codsgm'
    end
    object sqlManuitemmit_usuinc: TStringField
      FieldName = 'mit_usuinc'
      Origin = 'mit_usuinc'
      Size = 15
    end
    object sqlManuitemmit_datinc: TDateField
      FieldName = 'mit_datinc'
      Origin = 'mit_datinc'
    end
    object sqlManuitemmit_horinc: TStringField
      FieldName = 'mit_horinc'
      Origin = 'mit_horinc'
      Size = 8
    end
    object sqlManuitemmit_usualt: TStringField
      FieldName = 'mit_usualt'
      Origin = 'mit_usualt'
      Size = 15
    end
    object sqlManuitemmit_datalt: TDateField
      FieldName = 'mit_datalt'
      Origin = 'mit_datalt'
    end
    object sqlManuitemmit_horalt: TStringField
      FieldName = 'mit_horalt'
      Origin = 'mit_horalt'
      Size = 8
    end
    object sqlManuitemsgm_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_codigo'
      Origin = 'sgm_codigo'
    end
    object sqlManuitemsgm_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_nome'
      Origin = 'sgm_nome'
      Size = 25
    end
    object sqlManuitemsgm_codgrm: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_codgrm'
      Origin = 'sgm_codgrm'
    end
    object sqlManuitemsgm_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_usuinc'
      Origin = 'sgm_usuinc'
      Size = 15
    end
    object sqlManuitemsgm_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_datinc'
      Origin = 'sgm_datinc'
    end
    object sqlManuitemsgm_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_horinc'
      Origin = 'sgm_horinc'
      Size = 8
    end
    object sqlManuitemsgm_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_usualt'
      Origin = 'sgm_usualt'
      Size = 15
    end
    object sqlManuitemsgm_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_datalt'
      Origin = 'sgm_datalt'
    end
    object sqlManuitemsgm_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_horalt'
      Origin = 'sgm_horalt'
      Size = 8
    end
    object sqlManuitemgrm_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'grm_codigo'
      Origin = 'grm_codigo'
    end
    object sqlManuitemgrm_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grm_nome'
      Origin = 'grm_nome'
      Size = 40
    end
    object sqlManuitemgrm_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grm_usuinc'
      Origin = 'grm_usuinc'
      Size = 15
    end
    object sqlManuitemgrm_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'grm_datinc'
      Origin = 'grm_datinc'
    end
    object sqlManuitemgrm_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grm_horinc'
      Origin = 'grm_horinc'
      Size = 8
    end
    object sqlManuitemgrm_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grm_usualt'
      Origin = 'grm_usualt'
      Size = 15
    end
    object sqlManuitemgrm_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'grm_datalt'
      Origin = 'grm_datalt'
    end
    object sqlManuitemgrm_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grm_horalt'
      Origin = 'grm_horalt'
      Size = 8
    end
  end
  object sqltbservico: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * from "dbconfig".tbservico'
      'LEFT JOIN "dbconfig".subgrpmnt on sgm_codigo = tsm_codsgm'
      'LEFT JOIN "dbconfig".grupomnt  on grm_codigo = sgm_codgrm')
    Left = 336
    Top = 1264
    object sqltbservicotsm_codigo: TIntegerField
      FieldName = 'tsm_codigo'
      Origin = 'tsm_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqltbservicotsm_nome: TStringField
      FieldName = 'tsm_nome'
      Origin = 'tsm_nome'
      Size = 25
    end
    object sqltbservicotsm_vlrhor: TBCDField
      FieldName = 'tsm_vlrhor'
      Origin = 'tsm_vlrhor'
      Precision = 12
      Size = 2
    end
    object sqltbservicotsm_codsgm: TIntegerField
      FieldName = 'tsm_codsgm'
      Origin = 'tsm_codsgm'
    end
    object sqltbservicotsm_usuinc: TStringField
      FieldName = 'tsm_usuinc'
      Origin = 'tsm_usuinc'
      Size = 15
    end
    object sqltbservicotsm_datinc: TDateField
      FieldName = 'tsm_datinc'
      Origin = 'tsm_datinc'
    end
    object sqltbservicotsm_horinc: TStringField
      FieldName = 'tsm_horinc'
      Origin = 'tsm_horinc'
      Size = 8
    end
    object sqltbservicotsm_usualt: TStringField
      FieldName = 'tsm_usualt'
      Origin = 'tsm_usualt'
      Size = 15
    end
    object sqltbservicotsm_datalt: TDateField
      FieldName = 'tsm_datalt'
      Origin = 'tsm_datalt'
    end
    object sqltbservicotsm_horalt: TStringField
      FieldName = 'tsm_horalt'
      Origin = 'tsm_horalt'
      Size = 8
    end
    object sqltbservicosgm_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_codigo'
      Origin = 'sgm_codigo'
    end
    object sqltbservicosgm_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_nome'
      Origin = 'sgm_nome'
      Size = 25
    end
    object sqltbservicosgm_codgrm: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_codgrm'
      Origin = 'sgm_codgrm'
    end
    object sqltbservicosgm_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_usuinc'
      Origin = 'sgm_usuinc'
      Size = 15
    end
    object sqltbservicosgm_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_datinc'
      Origin = 'sgm_datinc'
    end
    object sqltbservicosgm_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_horinc'
      Origin = 'sgm_horinc'
      Size = 8
    end
    object sqltbservicosgm_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_usualt'
      Origin = 'sgm_usualt'
      Size = 15
    end
    object sqltbservicosgm_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_datalt'
      Origin = 'sgm_datalt'
    end
    object sqltbservicosgm_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_horalt'
      Origin = 'sgm_horalt'
      Size = 8
    end
    object sqltbservicogrm_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'grm_codigo'
      Origin = 'grm_codigo'
    end
    object sqltbservicogrm_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grm_nome'
      Origin = 'grm_nome'
      Size = 40
    end
    object sqltbservicogrm_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grm_usuinc'
      Origin = 'grm_usuinc'
      Size = 15
    end
    object sqltbservicogrm_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'grm_datinc'
      Origin = 'grm_datinc'
    end
    object sqltbservicogrm_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grm_horinc'
      Origin = 'grm_horinc'
      Size = 8
    end
    object sqltbservicogrm_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grm_usualt'
      Origin = 'grm_usualt'
      Size = 15
    end
    object sqltbservicogrm_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'grm_datalt'
      Origin = 'grm_datalt'
    end
    object sqltbservicogrm_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grm_horalt'
      Origin = 'grm_horalt'
      Size = 8
    end
  end
  object sqlmanutitens: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * from "dbconfig".manutitens'
      'LEFT JOIN "dbconfig".tbservico on tsm_codigo = itm_codtsm')
    Left = 336
    Top = 1320
    object sqlmanutitensitm_codigo: TIntegerField
      FieldName = 'itm_codigo'
      Origin = 'itm_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlmanutitensitm_codmit: TIntegerField
      FieldName = 'itm_codmit'
      Origin = 'itm_codmit'
    end
    object sqlmanutitensitm_codtsm: TIntegerField
      FieldName = 'itm_codtsm'
      Origin = 'itm_codtsm'
    end
    object sqlmanutitensitm_usuinc: TStringField
      FieldName = 'itm_usuinc'
      Origin = 'itm_usuinc'
      Size = 15
    end
    object sqlmanutitensitm_datinc: TDateField
      FieldName = 'itm_datinc'
      Origin = 'itm_datinc'
    end
    object sqlmanutitensitm_horinc: TStringField
      FieldName = 'itm_horinc'
      Origin = 'itm_horinc'
      Size = 8
    end
    object sqlmanutitensitm_usualt: TStringField
      FieldName = 'itm_usualt'
      Origin = 'itm_usualt'
      Size = 15
    end
    object sqlmanutitensitm_datalt: TDateField
      FieldName = 'itm_datalt'
      Origin = 'itm_datalt'
    end
    object sqlmanutitensitm_horalt: TStringField
      FieldName = 'itm_horalt'
      Origin = 'itm_horalt'
      Size = 8
    end
    object sqlmanutitenstsm_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_codigo'
      Origin = 'tsm_codigo'
    end
    object sqlmanutitenstsm_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_nome'
      Origin = 'tsm_nome'
      Size = 25
    end
    object sqlmanutitenstsm_vlrhor: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_vlrhor'
      Origin = 'tsm_vlrhor'
      Precision = 12
      Size = 2
    end
    object sqlmanutitenstsm_codsgm: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_codsgm'
      Origin = 'tsm_codsgm'
    end
    object sqlmanutitenstsm_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_usuinc'
      Origin = 'tsm_usuinc'
      Size = 15
    end
    object sqlmanutitenstsm_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_datinc'
      Origin = 'tsm_datinc'
    end
    object sqlmanutitenstsm_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_horinc'
      Origin = 'tsm_horinc'
      Size = 8
    end
    object sqlmanutitenstsm_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_usualt'
      Origin = 'tsm_usualt'
      Size = 15
    end
    object sqlmanutitenstsm_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_datalt'
      Origin = 'tsm_datalt'
    end
    object sqlmanutitenstsm_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_horalt'
      Origin = 'tsm_horalt'
      Size = 8
    end
  end
  object sqlGrupocli: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'SELECT * From "dbconfig".Grupocli')
    Left = 336
    Top = 1376
    object sqlGrupocligcl_codigo: TIntegerField
      FieldName = 'gcl_codigo'
      Origin = 'gcl_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlGrupocligcl_nome: TStringField
      FieldName = 'gcl_nome'
      Origin = 'gcl_nome'
    end
    object sqlGrupocligcl_usuinc: TStringField
      FieldName = 'gcl_usuinc'
      Origin = 'gcl_usuinc'
      Size = 15
    end
    object sqlGrupocligcl_datinc: TDateField
      FieldName = 'gcl_datinc'
      Origin = 'gcl_datinc'
    end
    object sqlGrupocligcl_horinc: TStringField
      FieldName = 'gcl_horinc'
      Origin = 'gcl_horinc'
      Size = 8
    end
    object sqlGrupocligcl_usualt: TStringField
      FieldName = 'gcl_usualt'
      Origin = 'gcl_usualt'
      Size = 15
    end
    object sqlGrupocligcl_datalt: TDateField
      FieldName = 'gcl_datalt'
      Origin = 'gcl_datalt'
    end
    object sqlGrupocligcl_horalt: TStringField
      FieldName = 'gcl_horalt'
      Origin = 'gcl_horalt'
      Size = 8
    end
  end
  object dspveiculoatv: TDataSetProvider
    DataSet = sqlveiculoatv
    UpdateMode = upWhereKeyOnly
    Left = 720
    Top = 208
  end
  object cliveiculoatv: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspveiculoatv'
    Left = 800
    Top = 208
    object cliveiculoatvvat_placa: TStringField
      FieldName = 'vat_placa'
      Size = 7
    end
    object cliveiculoatvvat_nrfrota: TStringField
      FieldName = 'vat_nrfrota'
      Size = 5
    end
    object cliveiculoatvvat_paestversa: TStringField
      FieldName = 'vat_paestversa'
      Size = 5
    end
    object cliveiculoatvvat_chip: TStringField
      FieldName = 'vat_chip'
      Size = 10
    end
    object cliveiculoatvvat_cartao: TStringField
      FieldName = 'vat_cartao'
      Size = 15
    end
    object cliveiculoatvvat_chassi: TStringField
      FieldName = 'vat_chassi'
      Size = 17
    end
    object cliveiculoatvvat_licenc: TStringField
      FieldName = 'vat_licenc'
      Size = 15
    end
    object cliveiculoatvvat_renavan: TStringField
      FieldName = 'vat_renavan'
      Size = 15
    end
    object cliveiculoatvvat_dut: TStringField
      FieldName = 'vat_dut'
      Size = 10
    end
    object cliveiculoatvvat_codltd: TIntegerField
      FieldName = 'vat_codltd'
    end
    object cliveiculoatvvat_codtip: TIntegerField
      FieldName = 'vat_codtip'
    end
    object cliveiculoatvvat_codmdl: TIntegerField
      FieldName = 'vat_codmdl'
    end
    object cliveiculoatvvat_codmrc: TIntegerField
      FieldName = 'vat_codmrc'
    end
    object cliveiculoatvvat_codcor: TIntegerField
      FieldName = 'vat_codcor'
    end
    object cliveiculoatvvat_codcid: TIntegerField
      FieldName = 'vat_codcid'
    end
    object cliveiculoatvvat_codgrm: TIntegerField
      FieldName = 'vat_codgrm'
    end
    object cliveiculoatvvat_cor: TStringField
      FieldName = 'vat_cor'
    end
    object cliveiculoatvvat_status: TStringField
      FieldName = 'vat_status'
      Size = 15
    end
    object cliveiculoatvvat_tanque1: TBCDField
      FieldName = 'vat_tanque1'
      Precision = 7
      Size = 0
    end
    object cliveiculoatvvat_tanque2: TBCDField
      FieldName = 'vat_tanque2'
      Precision = 7
      Size = 0
    end
    object cliveiculoatvvat_tanque3: TBCDField
      FieldName = 'vat_tanque3'
      Precision = 7
      Size = 0
    end
    object cliveiculoatvvat_kmini: TBCDField
      FieldName = 'vat_kmini'
      Precision = 7
      Size = 0
    end
    object cliveiculoatvvat_kmatu: TBCDField
      FieldName = 'vat_kmatu'
      Precision = 7
      Size = 0
    end
    object cliveiculoatvvat_anofbmd: TStringField
      FieldName = 'vat_anofbmd'
      Size = 8
    end
    object cliveiculoatvvat_termo: TStringField
      FieldName = 'vat_termo'
      Size = 8
    end
    object cliveiculoatvvat_tombo: TStringField
      FieldName = 'vat_tombo'
      Size = 10
    end
    object cliveiculoatvvat_estado: TStringField
      FieldName = 'vat_estado'
      Size = 15
    end
    object cliveiculoatvvat_qtdpass: TStringField
      FieldName = 'vat_qtdpass'
      Size = 2
    end
    object cliveiculoatvvat_potenc: TStringField
      FieldName = 'vat_potenc'
      Size = 5
    end
    object cliveiculoatvvat_kgbruto: TBCDField
      FieldName = 'vat_kgbruto'
      Precision = 7
      Size = 0
    end
    object cliveiculoatvvat_kgcarga: TBCDField
      FieldName = 'vat_kgcarga'
      Precision = 7
      Size = 0
    end
    object cliveiculoatvvat_clindad: TStringField
      FieldName = 'vat_clindad'
      Size = 4
    end
    object cliveiculoatvvat_nrmotor: TStringField
      FieldName = 'vat_nrmotor'
      Size = 15
    end
    object cliveiculoatvvat_cavalo: TStringField
      FieldName = 'vat_cavalo'
      Size = 10
    end
    object cliveiculoatvvat_foto: TBlobField
      FieldName = 'vat_foto'
    end
    object cliveiculoatvvat_obs: TMemoField
      FieldName = 'vat_obs'
      BlobType = ftMemo
    end
    object cliveiculoatvvat_vlrcmp: TBCDField
      FieldName = 'vat_vlrcmp'
      Precision = 15
      Size = 2
    end
    object cliveiculoatvvat_datcmp: TDateField
      FieldName = 'vat_datcmp'
    end
    object cliveiculoatvvat_nfecmp: TStringField
      FieldName = 'vat_nfecmp'
      Size = 10
    end
    object cliveiculoatvvat_usuinc: TStringField
      FieldName = 'vat_usuinc'
      Size = 15
    end
    object cliveiculoatvvat_datinc: TDateField
      FieldName = 'vat_datinc'
    end
    object cliveiculoatvvat_horinc: TStringField
      FieldName = 'vat_horinc'
      Size = 8
    end
    object cliveiculoatvvat_usualt: TStringField
      FieldName = 'vat_usualt'
      Size = 15
    end
    object cliveiculoatvvat_datalt: TDateField
      FieldName = 'vat_datalt'
    end
    object cliveiculoatvvat_horalt: TStringField
      FieldName = 'vat_horalt'
      Size = 8
    end
    object cliveiculoatvltd_codigo: TIntegerField
      FieldName = 'ltd_codigo'
    end
    object cliveiculoatvltd_nome: TStringField
      FieldName = 'ltd_nome'
      Size = 35
    end
    object cliveiculoatvltd_sigla: TStringField
      FieldName = 'ltd_sigla'
      Size = 5
    end
    object cliveiculoatvltd_endereco: TStringField
      FieldName = 'ltd_endereco'
      Size = 35
    end
    object cliveiculoatvltd_numend: TStringField
      FieldName = 'ltd_numend'
      Size = 5
    end
    object cliveiculoatvltd_complem: TStringField
      FieldName = 'ltd_complem'
      Size = 25
    end
    object cliveiculoatvltd_bairro: TStringField
      FieldName = 'ltd_bairro'
      Size = 50
    end
    object cliveiculoatvltd_cep: TStringField
      FieldName = 'ltd_cep'
      Size = 8
    end
    object cliveiculoatvltd_codcid: TIntegerField
      FieldName = 'ltd_codcid'
    end
    object cliveiculoatvltd_telef1: TStringField
      FieldName = 'ltd_telef1'
      Size = 12
    end
    object cliveiculoatvltd_telef2: TStringField
      FieldName = 'ltd_telef2'
      Size = 12
    end
    object cliveiculoatvltd_celula: TStringField
      FieldName = 'ltd_celula'
      Size = 12
    end
    object cliveiculoatvltd_usuinc: TStringField
      FieldName = 'ltd_usuinc'
      Size = 15
    end
    object cliveiculoatvltd_datinc: TDateField
      FieldName = 'ltd_datinc'
    end
    object cliveiculoatvltd_horinc: TStringField
      FieldName = 'ltd_horinc'
      Size = 8
    end
    object cliveiculoatvltd_usualt: TStringField
      FieldName = 'ltd_usualt'
      Size = 15
    end
    object cliveiculoatvltd_datalt: TDateField
      FieldName = 'ltd_datalt'
    end
    object cliveiculoatvltd_horalt: TStringField
      FieldName = 'ltd_horalt'
      Size = 8
    end
    object cliveiculoatvmdl_codigo: TIntegerField
      FieldName = 'mdl_codigo'
    end
    object cliveiculoatvmdl_nome: TStringField
      FieldName = 'mdl_nome'
      Size = 25
    end
    object cliveiculoatvmdl_codfip: TStringField
      FieldName = 'mdl_codfip'
      Size = 10
    end
    object cliveiculoatvmdl_codmrc: TIntegerField
      FieldName = 'mdl_codmrc'
    end
    object cliveiculoatvmdl_codgrm: TIntegerField
      FieldName = 'mdl_codgrm'
    end
    object cliveiculoatvmdl_usuinc: TStringField
      FieldName = 'mdl_usuinc'
      Size = 15
    end
    object cliveiculoatvmdl_datinc: TDateField
      FieldName = 'mdl_datinc'
    end
    object cliveiculoatvmdl_horinc: TStringField
      FieldName = 'mdl_horinc'
      Size = 8
    end
    object cliveiculoatvmdl_usualt: TStringField
      FieldName = 'mdl_usualt'
      Size = 15
    end
    object cliveiculoatvmdl_datalt: TDateField
      FieldName = 'mdl_datalt'
    end
    object cliveiculoatvmdl_horalt: TStringField
      FieldName = 'mdl_horalt'
      Size = 8
    end
    object cliveiculoatvmrc_codigo: TIntegerField
      FieldName = 'mrc_codigo'
    end
    object cliveiculoatvmrc_nome: TStringField
      FieldName = 'mrc_nome'
      Size = 25
    end
    object cliveiculoatvmrc_usuinc: TStringField
      FieldName = 'mrc_usuinc'
      Size = 15
    end
    object cliveiculoatvmrc_datinc: TDateField
      FieldName = 'mrc_datinc'
    end
    object cliveiculoatvmrc_horinc: TStringField
      FieldName = 'mrc_horinc'
      Size = 8
    end
    object cliveiculoatvmrc_usualt: TStringField
      FieldName = 'mrc_usualt'
      Size = 15
    end
    object cliveiculoatvmrc_datalt: TDateField
      FieldName = 'mrc_datalt'
    end
    object cliveiculoatvmrc_horalt: TStringField
      FieldName = 'mrc_horalt'
      Size = 8
    end
    object cliveiculoatvcid_codigo: TIntegerField
      FieldName = 'cid_codigo'
    end
    object cliveiculoatvcid_cidnum: TStringField
      FieldName = 'cid_cidnum'
      Size = 8
    end
    object cliveiculoatvcid_nome: TStringField
      FieldName = 'cid_nome'
      Size = 35
    end
    object cliveiculoatvcid_codest: TIntegerField
      FieldName = 'cid_codest'
    end
    object cliveiculoatvcid_codpai: TIntegerField
      FieldName = 'cid_codpai'
    end
    object cliveiculoatvcid_usuinc: TStringField
      FieldName = 'cid_usuinc'
      Size = 15
    end
    object cliveiculoatvcid_datinc: TDateField
      FieldName = 'cid_datinc'
    end
    object cliveiculoatvcid_horinc: TStringField
      FieldName = 'cid_horinc'
      Size = 8
    end
    object cliveiculoatvcid_usualt: TStringField
      FieldName = 'cid_usualt'
      Size = 15
    end
    object cliveiculoatvcid_datalt: TDateField
      FieldName = 'cid_datalt'
    end
    object cliveiculoatvcid_horalt: TStringField
      FieldName = 'cid_horalt'
      Size = 8
    end
    object cliveiculoatvtip_codigo: TIntegerField
      FieldName = 'tip_codigo'
    end
    object cliveiculoatvtip_nome: TStringField
      FieldName = 'tip_nome'
      Size = 25
    end
    object cliveiculoatvtip_teixo: TBCDField
      FieldName = 'tip_teixo'
      Precision = 1
      Size = 0
    end
    object cliveiculoatvtip_usuinc: TStringField
      FieldName = 'tip_usuinc'
      Size = 15
    end
    object cliveiculoatvtip_step: TBCDField
      FieldName = 'tip_step'
      Precision = 1
      Size = 0
    end
    object cliveiculoatvtip_tipo: TStringField
      FieldName = 'tip_tipo'
      Size = 15
    end
    object cliveiculoatvtip_trac: TStringField
      FieldName = 'tip_trac'
      Size = 15
    end
    object cliveiculoatvtip_datinc: TDateField
      FieldName = 'tip_datinc'
    end
    object cliveiculoatvtip_horinc: TStringField
      FieldName = 'tip_horinc'
      Size = 8
    end
    object cliveiculoatvtip_usualt: TStringField
      FieldName = 'tip_usualt'
      Size = 15
    end
    object cliveiculoatvtip_datalt: TDateField
      FieldName = 'tip_datalt'
    end
    object cliveiculoatvtip_horalt: TStringField
      FieldName = 'tip_horalt'
      Size = 8
    end
    object cliveiculoatvcor_codigo: TIntegerField
      FieldName = 'cor_codigo'
    end
    object cliveiculoatvcor_nome: TStringField
      FieldName = 'cor_nome'
      Size = 35
    end
    object cliveiculoatvcor_usuinc: TStringField
      FieldName = 'cor_usuinc'
      Size = 15
    end
    object cliveiculoatvcor_datinc: TDateField
      FieldName = 'cor_datinc'
    end
    object cliveiculoatvcor_horinc: TStringField
      FieldName = 'cor_horinc'
      Size = 8
    end
    object cliveiculoatvcor_usualt: TStringField
      FieldName = 'cor_usualt'
      Size = 15
    end
    object cliveiculoatvcor_datalt: TDateField
      FieldName = 'cor_datalt'
    end
    object cliveiculoatvcor_horalt: TStringField
      FieldName = 'cor_horalt'
      Size = 8
    end
    object cliveiculoatvgrm_codigo: TIntegerField
      FieldName = 'grm_codigo'
    end
    object cliveiculoatvgrm_nome: TStringField
      FieldName = 'grm_nome'
      Size = 40
    end
    object cliveiculoatvgrm_usuinc: TStringField
      FieldName = 'grm_usuinc'
      Size = 15
    end
    object cliveiculoatvgrm_datinc: TDateField
      FieldName = 'grm_datinc'
    end
    object cliveiculoatvgrm_horinc: TStringField
      FieldName = 'grm_horinc'
      Size = 8
    end
    object cliveiculoatvgrm_usualt: TStringField
      FieldName = 'grm_usualt'
      Size = 15
    end
    object cliveiculoatvgrm_datalt: TDateField
      FieldName = 'grm_datalt'
    end
    object cliveiculoatvgrm_horalt: TStringField
      FieldName = 'grm_horalt'
      Size = 8
    end
  end
  object dsveiculoatv: TDataSource
    DataSet = cliveiculoatv
    Left = 872
    Top = 208
  end
  object dspacsatv: TDataSetProvider
    DataSet = sqlacsatv
    UpdateMode = upWhereKeyOnly
    Left = 720
    Top = 256
  end
  object cliacsatv: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspacsatv'
    Left = 800
    Top = 256
    object cliacsatvaat_codigo: TIntegerField
      FieldName = 'aat_codigo'
    end
    object cliacsatvaat_placa: TStringField
      FieldName = 'aat_placa'
      Size = 7
    end
    object cliacsatvaat_codacs: TIntegerField
      FieldName = 'aat_codacs'
    end
    object cliacsatvacs_nome: TStringField
      FieldName = 'acs_nome'
      Size = 25
    end
    object cliacsatvaat_usuinc: TStringField
      FieldName = 'aat_usuinc'
      Size = 15
    end
    object cliacsatvaat_datinc: TDateField
      FieldName = 'aat_datinc'
    end
    object cliacsatvaat_horinc: TStringField
      FieldName = 'aat_horinc'
      Size = 8
    end
    object cliacsatvaat_usualt: TStringField
      FieldName = 'aat_usualt'
      Size = 15
    end
    object cliacsatvaat_datalt: TDateField
      FieldName = 'aat_datalt'
    end
    object cliacsatvaat_horalt: TStringField
      FieldName = 'aat_horalt'
      Size = 8
    end
  end
  object dsacsatv: TDataSource
    DataSet = cliacsatv
    Left = 872
    Top = 256
  end
  object dspCmbAtv: TDataSetProvider
    DataSet = sqlCmbAtv
    UpdateMode = upWhereKeyOnly
    Left = 720
    Top = 307
  end
  object cliCmbAtv: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCmbAtv'
    Left = 800
    Top = 307
    object cliCmbAtvcat_codigo: TIntegerField
      FieldName = 'cat_codigo'
    end
    object cliCmbAtvcat_placa: TStringField
      FieldName = 'cat_placa'
      Size = 7
    end
    object cliCmbAtvcat_codcmb: TIntegerField
      FieldName = 'cat_codcmb'
    end
    object cliCmbAtvcmb_nome: TStringField
      FieldName = 'cmb_nome'
    end
    object cliCmbAtvcat_usuinc: TStringField
      FieldName = 'cat_usuinc'
      Size = 15
    end
    object cliCmbAtvcat_datinc: TDateField
      FieldName = 'cat_datinc'
    end
    object cliCmbAtvcat_horinc: TStringField
      FieldName = 'cat_horinc'
      Size = 8
    end
    object cliCmbAtvcat_usualt: TStringField
      FieldName = 'cat_usualt'
      Size = 15
    end
    object cliCmbAtvcat_datalt: TDateField
      FieldName = 'cat_datalt'
    end
    object cliCmbAtvcat_horalt: TStringField
      FieldName = 'cat_horalt'
      Size = 8
    end
  end
  object dsCmbAtv: TDataSource
    DataSet = cliCmbAtv
    Left = 872
    Top = 307
  end
  object dspPessoal: TDataSetProvider
    DataSet = sqlPessoal
    UpdateMode = upWhereKeyOnly
    Left = 720
    Top = 152
  end
  object cliPessoal: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPessoal'
    Left = 800
    Top = 152
    object cliPessoalpss_codigo: TIntegerField
      FieldName = 'pss_codigo'
    end
    object cliPessoalpss_nome: TStringField
      FieldName = 'pss_nome'
      Size = 50
    end
    object cliPessoalpss_apelido: TStringField
      FieldName = 'pss_apelido'
    end
    object cliPessoalpss_codcgo: TIntegerField
      FieldName = 'pss_codcgo'
    end
    object cliPessoalpss_codltd: TIntegerField
      FieldName = 'pss_codltd'
    end
    object cliPessoalpss_datnas: TDateField
      FieldName = 'pss_datnas'
    end
    object cliPessoalpss_sexo: TStringField
      FieldName = 'pss_sexo'
      Size = 1
    end
    object cliPessoalpss_ecivil: TStringField
      FieldName = 'pss_ecivil'
      Size = 15
    end
    object cliPessoalpss_tpsangue: TStringField
      FieldName = 'pss_tpsangue'
      Size = 3
    end
    object cliPessoalpss_nompal: TStringField
      FieldName = 'pss_nompal'
      Size = 50
    end
    object cliPessoalpss_nommae: TStringField
      FieldName = 'pss_nommae'
      Size = 50
    end
    object cliPessoalpss_cpf: TStringField
      FieldName = 'pss_cpf'
      Size = 11
    end
    object cliPessoalpss_rg: TStringField
      FieldName = 'pss_rg'
      Size = 15
    end
    object cliPessoalpss_rgexped: TStringField
      FieldName = 'pss_rgexped'
    end
    object cliPessoalpss_rgdata: TDateField
      FieldName = 'pss_rgdata'
    end
    object cliPessoalpss_pispasep: TStringField
      FieldName = 'pss_pispasep'
      Size = 14
    end
    object cliPessoalpss_numctps: TStringField
      FieldName = 'pss_numctps'
      Size = 14
    end
    object cliPessoalpss_habilitac: TStringField
      FieldName = 'pss_habilitac'
      Size = 11
    end
    object cliPessoalpss_hbemite: TDateField
      FieldName = 'pss_hbemite'
    end
    object cliPessoalpss_hbvalid: TDateField
      FieldName = 'pss_hbvalid'
    end
    object cliPessoalpss_hbcateg: TStringField
      FieldName = 'pss_hbcateg'
      Size = 4
    end
    object cliPessoalpss_nrtitulo: TStringField
      FieldName = 'pss_nrtitulo'
      Size = 14
    end
    object cliPessoalpss_nrreserv: TStringField
      FieldName = 'pss_nrreserv'
      Size = 14
    end
    object cliPessoalpss_cep: TStringField
      FieldName = 'pss_cep'
      Size = 8
    end
    object cliPessoalpss_endereco: TStringField
      FieldName = 'pss_endereco'
      Size = 50
    end
    object cliPessoalpss_complem: TStringField
      FieldName = 'pss_complem'
      Size = 25
    end
    object cliPessoalpss_numres: TStringField
      FieldName = 'pss_numres'
      Size = 6
    end
    object cliPessoalpss_bairro: TStringField
      FieldName = 'pss_bairro'
      Size = 50
    end
    object cliPessoalpss_codcid: TIntegerField
      FieldName = 'pss_codcid'
    end
    object cliPessoalpss_tpimove: TStringField
      FieldName = 'pss_tpimove'
      Size = 15
    end
    object cliPessoalpss_tpresid: TStringField
      FieldName = 'pss_tpresid'
      Size = 15
    end
    object cliPessoalpss_telef01: TStringField
      FieldName = 'pss_telef01'
      Size = 12
    end
    object cliPessoalpss_telef02: TStringField
      FieldName = 'pss_telef02'
      Size = 12
    end
    object cliPessoalpss_celular: TStringField
      FieldName = 'pss_celular'
      Size = 12
    end
    object cliPessoalpss_email: TStringField
      FieldName = 'pss_email'
      Size = 100
    end
    object cliPessoalpss_status: TStringField
      FieldName = 'pss_status'
      Size = 15
    end
    object cliPessoalpss_foto: TBlobField
      FieldName = 'pss_foto'
    end
    object cliPessoalpss_obs: TMemoField
      FieldName = 'pss_obs'
      BlobType = ftMemo
    end
    object cliPessoalpss_vlrrenda: TBCDField
      FieldName = 'pss_vlrrenda'
      Precision = 15
      Size = 2
    end
    object cliPessoalpss_vlrvale: TBCDField
      FieldName = 'pss_vlrvale'
      Precision = 15
      Size = 2
    end
    object cliPessoalpss_datcmp: TDateField
      FieldName = 'pss_datcmp'
    end
    object cliPessoalpss_nfecmp: TStringField
      FieldName = 'pss_nfecmp'
      Size = 10
    end
    object cliPessoalpss_codpcv: TStringField
      FieldName = 'pss_codpcv'
      Size = 10
    end
    object cliPessoalpss_codpcr: TStringField
      FieldName = 'pss_codpcr'
      Size = 10
    end
    object cliPessoalpss_usuinc: TStringField
      FieldName = 'pss_usuinc'
      Size = 15
    end
    object cliPessoalpss_datinc: TDateField
      FieldName = 'pss_datinc'
    end
    object cliPessoalpss_horinc: TStringField
      FieldName = 'pss_horinc'
      Size = 8
    end
    object cliPessoalpss_usualt: TStringField
      FieldName = 'pss_usualt'
      Size = 15
    end
    object cliPessoalpss_datalt: TDateField
      FieldName = 'pss_datalt'
    end
    object cliPessoalpss_horalt: TStringField
      FieldName = 'pss_horalt'
      Size = 8
    end
    object cliPessoalcid_codigo: TIntegerField
      FieldName = 'cid_codigo'
    end
    object cliPessoalcid_cidnum: TStringField
      FieldName = 'cid_cidnum'
      Size = 8
    end
    object cliPessoalcid_nome: TStringField
      FieldName = 'cid_nome'
      Size = 35
    end
    object cliPessoalcid_codest: TIntegerField
      FieldName = 'cid_codest'
    end
    object cliPessoalcid_codpai: TIntegerField
      FieldName = 'cid_codpai'
    end
    object cliPessoalcid_usuinc: TStringField
      FieldName = 'cid_usuinc'
      Size = 15
    end
    object cliPessoalcid_datinc: TDateField
      FieldName = 'cid_datinc'
    end
    object cliPessoalcid_horinc: TStringField
      FieldName = 'cid_horinc'
      Size = 8
    end
    object cliPessoalcid_usualt: TStringField
      FieldName = 'cid_usualt'
      Size = 15
    end
    object cliPessoalcid_datalt: TDateField
      FieldName = 'cid_datalt'
    end
    object cliPessoalcid_horalt: TStringField
      FieldName = 'cid_horalt'
      Size = 8
    end
    object cliPessoalltd_codigo: TIntegerField
      FieldName = 'ltd_codigo'
    end
    object cliPessoalltd_nome: TStringField
      FieldName = 'ltd_nome'
      Size = 35
    end
    object cliPessoalltd_sigla: TStringField
      FieldName = 'ltd_sigla'
      Size = 5
    end
    object cliPessoalltd_endereco: TStringField
      FieldName = 'ltd_endereco'
      Size = 35
    end
    object cliPessoalltd_numend: TStringField
      FieldName = 'ltd_numend'
      Size = 5
    end
    object cliPessoalltd_complem: TStringField
      FieldName = 'ltd_complem'
      Size = 25
    end
    object cliPessoalltd_bairro: TStringField
      FieldName = 'ltd_bairro'
      Size = 50
    end
    object cliPessoalltd_cep: TStringField
      FieldName = 'ltd_cep'
      Size = 8
    end
    object cliPessoalltd_codcid: TIntegerField
      FieldName = 'ltd_codcid'
    end
    object cliPessoalltd_telef1: TStringField
      FieldName = 'ltd_telef1'
      Size = 12
    end
    object cliPessoalltd_telef2: TStringField
      FieldName = 'ltd_telef2'
      Size = 12
    end
    object cliPessoalltd_celula: TStringField
      FieldName = 'ltd_celula'
      Size = 12
    end
    object cliPessoalltd_usuinc: TStringField
      FieldName = 'ltd_usuinc'
      Size = 15
    end
    object cliPessoalltd_datinc: TDateField
      FieldName = 'ltd_datinc'
    end
    object cliPessoalltd_horinc: TStringField
      FieldName = 'ltd_horinc'
      Size = 8
    end
    object cliPessoalltd_usualt: TStringField
      FieldName = 'ltd_usualt'
      Size = 15
    end
    object cliPessoalltd_datalt: TDateField
      FieldName = 'ltd_datalt'
    end
    object cliPessoalltd_horalt: TStringField
      FieldName = 'ltd_horalt'
      Size = 8
    end
    object cliPessoalcgo_codigo: TIntegerField
      FieldName = 'cgo_codigo'
    end
    object cliPessoalcgo_nome: TStringField
      FieldName = 'cgo_nome'
      Size = 35
    end
    object cliPessoalcgo_usuinc: TStringField
      FieldName = 'cgo_usuinc'
      Size = 15
    end
    object cliPessoalcgo_datinc: TDateField
      FieldName = 'cgo_datinc'
    end
    object cliPessoalcgo_horinc: TStringField
      FieldName = 'cgo_horinc'
      Size = 8
    end
    object cliPessoalcgo_usualt: TStringField
      FieldName = 'cgo_usualt'
      Size = 15
    end
    object cliPessoalcgo_datalt: TDateField
      FieldName = 'cgo_datalt'
    end
    object cliPessoalcgo_horalt: TStringField
      FieldName = 'cgo_horalt'
      Size = 8
    end
    object cliPessoalest_codigo: TIntegerField
      FieldName = 'est_codigo'
    end
    object cliPessoalest_nome: TStringField
      FieldName = 'est_nome'
      Size = 50
    end
    object cliPessoalest_uf: TStringField
      FieldName = 'est_uf'
      Size = 2
    end
    object cliPessoalest_codpai: TIntegerField
      FieldName = 'est_codpai'
    end
    object cliPessoalest_usuinc: TStringField
      FieldName = 'est_usuinc'
      Size = 15
    end
    object cliPessoalest_datinc: TDateField
      FieldName = 'est_datinc'
    end
    object cliPessoalest_horinc: TStringField
      FieldName = 'est_horinc'
      Size = 8
    end
    object cliPessoalest_usualt: TStringField
      FieldName = 'est_usualt'
      Size = 15
    end
    object cliPessoalest_datalt: TDateField
      FieldName = 'est_datalt'
    end
    object cliPessoalest_horalt: TStringField
      FieldName = 'est_horalt'
      Size = 8
    end
  end
  object dsPessoal: TDataSource
    DataSet = cliPessoal
    Left = 872
    Top = 152
  end
  object dspFornecedor: TDataSetProvider
    DataSet = sqlFornecedor
    UpdateMode = upWhereKeyOnly
    Left = 720
    Top = 474
  end
  object cliFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFornecedor'
    Left = 800
    Top = 474
    object cliFornecedorfnd_codigo: TIntegerField
      FieldName = 'fnd_codigo'
    end
    object cliFornecedorfnd_ativo: TStringField
      FieldName = 'fnd_ativo'
      Size = 3
    end
    object cliFornecedorfnd_nome: TStringField
      FieldName = 'fnd_nome'
      Size = 50
    end
    object cliFornecedorfnd_rsocial: TStringField
      FieldName = 'fnd_rsocial'
      Size = 50
    end
    object cliFornecedorfnd_tipopes: TStringField
      FieldName = 'fnd_tipopes'
      Size = 8
    end
    object cliFornecedorfnd_cpfcnpj: TStringField
      FieldName = 'fnd_cpfcnpj'
      Size = 14
    end
    object cliFornecedorfnd_codpct: TStringField
      FieldName = 'fnd_codpct'
      Size = 10
    end
    object cliFornecedorfnd_endereco: TStringField
      FieldName = 'fnd_endereco'
      Size = 35
    end
    object cliFornecedorfnd_numend: TStringField
      FieldName = 'fnd_numend'
      Size = 5
    end
    object cliFornecedorfnd_complem: TStringField
      FieldName = 'fnd_complem'
      Size = 25
    end
    object cliFornecedorfnd_bairro: TStringField
      FieldName = 'fnd_bairro'
      Size = 50
    end
    object cliFornecedorfnd_cep: TStringField
      FieldName = 'fnd_cep'
      Size = 8
    end
    object cliFornecedorfnd_codcid: TIntegerField
      FieldName = 'fnd_codcid'
    end
    object cliFornecedorfnd_telef1: TStringField
      FieldName = 'fnd_telef1'
      Size = 12
    end
    object cliFornecedorfnd_telef2: TStringField
      FieldName = 'fnd_telef2'
      Size = 12
    end
    object cliFornecedorfnd_celula: TStringField
      FieldName = 'fnd_celula'
      Size = 12
    end
    object cliFornecedorfnd_obs: TMemoField
      FieldName = 'fnd_obs'
      BlobType = ftMemo
    end
    object cliFornecedorfnd_usuinc: TStringField
      FieldName = 'fnd_usuinc'
      Size = 15
    end
    object cliFornecedorfnd_datinc: TDateField
      FieldName = 'fnd_datinc'
    end
    object cliFornecedorfnd_horinc: TStringField
      FieldName = 'fnd_horinc'
      Size = 8
    end
    object cliFornecedorfnd_usualt: TStringField
      FieldName = 'fnd_usualt'
      Size = 15
    end
    object cliFornecedorfnd_datalt: TDateField
      FieldName = 'fnd_datalt'
    end
    object cliFornecedorfnd_horalt: TStringField
      FieldName = 'fnd_horalt'
      Size = 8
    end
    object cliFornecedorcid_codigo: TIntegerField
      FieldName = 'cid_codigo'
    end
    object cliFornecedorcid_cidnum: TStringField
      FieldName = 'cid_cidnum'
      Size = 8
    end
    object cliFornecedorcid_nome: TStringField
      FieldName = 'cid_nome'
      Size = 35
    end
    object cliFornecedorcid_codest: TIntegerField
      FieldName = 'cid_codest'
    end
    object cliFornecedorcid_codpai: TIntegerField
      FieldName = 'cid_codpai'
    end
    object cliFornecedorcid_usuinc: TStringField
      FieldName = 'cid_usuinc'
      Size = 15
    end
    object cliFornecedorcid_datinc: TDateField
      FieldName = 'cid_datinc'
    end
    object cliFornecedorcid_horinc: TStringField
      FieldName = 'cid_horinc'
      Size = 8
    end
    object cliFornecedorcid_usualt: TStringField
      FieldName = 'cid_usualt'
      Size = 15
    end
    object cliFornecedorcid_datalt: TDateField
      FieldName = 'cid_datalt'
    end
    object cliFornecedorcid_horalt: TStringField
      FieldName = 'cid_horalt'
      Size = 8
    end
    object cliFornecedorpct_codigo: TStringField
      FieldName = 'pct_codigo'
      Size = 10
    end
    object cliFornecedorpct_cntmae: TStringField
      FieldName = 'pct_cntmae'
      Size = 10
    end
    object cliFornecedorpct_nome: TStringField
      FieldName = 'pct_nome'
      Size = 50
    end
    object cliFornecedorpct_natureza: TStringField
      FieldName = 'pct_natureza'
      Size = 1
    end
    object cliFornecedorpct_tipo: TStringField
      FieldName = 'pct_tipo'
      Size = 1
    end
    object cliFornecedorpct_limite: TBCDField
      FieldName = 'pct_limite'
      Precision = 15
      Size = 2
    end
    object cliFornecedorpct_meta: TBCDField
      FieldName = 'pct_meta'
      Precision = 15
      Size = 2
    end
    object cliFornecedorpct_ord: TBCDField
      FieldName = 'pct_ord'
      Precision = 1
      Size = 0
    end
    object cliFornecedorpct_usuinc: TStringField
      FieldName = 'pct_usuinc'
      Size = 15
    end
    object cliFornecedorpct_datinc: TDateField
      FieldName = 'pct_datinc'
    end
    object cliFornecedorpct_horinc: TStringField
      FieldName = 'pct_horinc'
      Size = 8
    end
    object cliFornecedorpct_usualt: TStringField
      FieldName = 'pct_usualt'
      Size = 15
    end
    object cliFornecedorpct_datalt: TDateField
      FieldName = 'pct_datalt'
    end
    object cliFornecedorpct_horalt: TStringField
      FieldName = 'pct_horalt'
      Size = 8
    end
  end
  object dsFornecedor: TDataSource
    DataSet = cliFornecedor
    Left = 872
    Top = 474
  end
  object dspccorrente: TDataSetProvider
    DataSet = sqlccorrente
    UpdateMode = upWhereKeyOnly
    Left = 720
    Top = 530
  end
  object cliccorrente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspccorrente'
    Left = 800
    Top = 530
    object cliccorrentecct_codigo: TIntegerField
      FieldName = 'cct_codigo'
    end
    object cliccorrentecct_codbco: TStringField
      FieldName = 'cct_codbco'
      Size = 6
    end
    object cliccorrentecct_agencia: TStringField
      FieldName = 'cct_agencia'
      Size = 9
    end
    object cliccorrentecct_nrconta: TStringField
      FieldName = 'cct_nrconta'
      Size = 9
    end
    object cliccorrentecct_codpcd: TStringField
      FieldName = 'cct_codpcd'
      Size = 10
    end
    object cliccorrentecct_codpcc: TStringField
      FieldName = 'cct_codpcc'
      Size = 10
    end
    object cliccorrentecct_telef1: TStringField
      FieldName = 'cct_telef1'
      Size = 12
    end
    object cliccorrentecct_telef2: TStringField
      FieldName = 'cct_telef2'
      Size = 12
    end
    object cliccorrentecct_celula: TStringField
      FieldName = 'cct_celula'
      Size = 12
    end
    object cliccorrentecct_usuinc: TStringField
      FieldName = 'cct_usuinc'
      Size = 15
    end
    object cliccorrentecct_datinc: TDateField
      FieldName = 'cct_datinc'
    end
    object cliccorrentecct_horinc: TStringField
      FieldName = 'cct_horinc'
      Size = 8
    end
    object cliccorrentecct_usualt: TStringField
      FieldName = 'cct_usualt'
      Size = 15
    end
    object cliccorrentecct_datalt: TDateField
      FieldName = 'cct_datalt'
    end
    object cliccorrentecct_horalt: TStringField
      FieldName = 'cct_horalt'
      Size = 8
    end
    object cliccorrentebco_codigo: TStringField
      FieldName = 'bco_codigo'
      Size = 6
    end
    object cliccorrentebco_nome: TStringField
      FieldName = 'bco_nome'
      Size = 70
    end
    object cliccorrentebco_usuinc: TStringField
      FieldName = 'bco_usuinc'
      Size = 15
    end
    object cliccorrentebco_datinc: TDateField
      FieldName = 'bco_datinc'
    end
    object cliccorrentebco_horinc: TStringField
      FieldName = 'bco_horinc'
      Size = 8
    end
    object cliccorrentebco_usualt: TStringField
      FieldName = 'bco_usualt'
      Size = 15
    end
    object cliccorrentebco_datalt: TDateField
      FieldName = 'bco_datalt'
    end
    object cliccorrentebco_horalt: TStringField
      FieldName = 'bco_horalt'
      Size = 8
    end
    object cliccorrentecxa_codigo: TIntegerField
      FieldName = 'cxa_codigo'
    end
    object cliccorrentecxa_codcct: TIntegerField
      FieldName = 'cxa_codcct'
    end
    object cliccorrentecxa_codusu: TIntegerField
      FieldName = 'cxa_codusu'
    end
    object cliccorrentecxa_ativo: TStringField
      FieldName = 'cxa_ativo'
      FixedChar = True
      Size = 1
    end
    object cliccorrentecxa_usuinc: TStringField
      FieldName = 'cxa_usuinc'
      Size = 15
    end
    object cliccorrentecxa_datinc: TDateField
      FieldName = 'cxa_datinc'
    end
    object cliccorrentecxa_horinc: TStringField
      FieldName = 'cxa_horinc'
      Size = 8
    end
    object cliccorrentecxa_usualt: TStringField
      FieldName = 'cxa_usualt'
      Size = 15
    end
    object cliccorrentecxa_datalt: TDateField
      FieldName = 'cxa_datalt'
    end
    object cliccorrentecxa_horalt: TStringField
      FieldName = 'cxa_horalt'
      Size = 8
    end
    object cliccorrenteabc_codigo: TIntegerField
      FieldName = 'abc_codigo'
    end
    object cliccorrenteabc_codcxa: TIntegerField
      FieldName = 'abc_codcxa'
    end
    object cliccorrenteabc_codcct: TIntegerField
      FieldName = 'abc_codcct'
    end
    object cliccorrenteabc_databr: TDateField
      FieldName = 'abc_databr'
    end
    object cliccorrenteabc_datfch: TDateField
      FieldName = 'abc_datfch'
    end
    object cliccorrenteabc_vlrini: TBCDField
      FieldName = 'abc_vlrini'
      Precision = 15
      Size = 2
    end
    object cliccorrenteabc_vlrant: TBCDField
      FieldName = 'abc_vlrant'
      Precision = 15
      Size = 2
    end
    object cliccorrenteabc_vlratu: TBCDField
      FieldName = 'abc_vlratu'
      Precision = 15
      Size = 2
    end
    object cliccorrenteabc_usuinc: TStringField
      FieldName = 'abc_usuinc'
      Size = 15
    end
    object cliccorrenteabc_datinc: TDateField
      FieldName = 'abc_datinc'
    end
    object cliccorrenteabc_horinc: TStringField
      FieldName = 'abc_horinc'
      Size = 8
    end
    object cliccorrenteabc_usualt: TStringField
      FieldName = 'abc_usualt'
      Size = 15
    end
    object cliccorrenteabc_datalt: TDateField
      FieldName = 'abc_datalt'
    end
    object cliccorrenteabc_horalt: TStringField
      FieldName = 'abc_horalt'
      Size = 8
    end
  end
  object dsccorrente: TDataSource
    DataSet = cliccorrente
    Left = 872
    Top = 530
  end
  object dspCaixa: TDataSetProvider
    DataSet = sqlCaixa
    UpdateMode = upWhereKeyOnly
    Left = 720
    Top = 586
  end
  object cliCaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCaixa'
    Left = 800
    Top = 586
    object cliCaixacxa_codigo: TIntegerField
      FieldName = 'cxa_codigo'
    end
    object cliCaixacxa_codcct: TIntegerField
      FieldName = 'cxa_codcct'
    end
    object cliCaixacxa_codusu: TIntegerField
      FieldName = 'cxa_codusu'
    end
    object cliCaixacxa_ativo: TStringField
      FieldName = 'cxa_ativo'
      FixedChar = True
      Size = 1
    end
    object cliCaixacxa_usuinc: TStringField
      FieldName = 'cxa_usuinc'
      Size = 15
    end
    object cliCaixacxa_datinc: TDateField
      FieldName = 'cxa_datinc'
    end
    object cliCaixacxa_horinc: TStringField
      FieldName = 'cxa_horinc'
      Size = 8
    end
    object cliCaixacxa_usualt: TStringField
      FieldName = 'cxa_usualt'
      Size = 15
    end
    object cliCaixacxa_datalt: TDateField
      FieldName = 'cxa_datalt'
    end
    object cliCaixacxa_horalt: TStringField
      FieldName = 'cxa_horalt'
      Size = 8
    end
    object cliCaixacct_codigo: TIntegerField
      FieldName = 'cct_codigo'
    end
    object cliCaixacct_codbco: TStringField
      FieldName = 'cct_codbco'
      Size = 6
    end
    object cliCaixacct_agencia: TStringField
      FieldName = 'cct_agencia'
      Size = 9
    end
    object cliCaixacct_nrconta: TStringField
      FieldName = 'cct_nrconta'
      Size = 9
    end
    object cliCaixacct_codpcd: TStringField
      FieldName = 'cct_codpcd'
      Size = 10
    end
    object cliCaixacct_codpcc: TStringField
      FieldName = 'cct_codpcc'
      Size = 10
    end
    object cliCaixacct_telef1: TStringField
      FieldName = 'cct_telef1'
      Size = 12
    end
    object cliCaixacct_telef2: TStringField
      FieldName = 'cct_telef2'
      Size = 12
    end
    object cliCaixacct_celula: TStringField
      FieldName = 'cct_celula'
      Size = 12
    end
    object cliCaixacct_usuinc: TStringField
      FieldName = 'cct_usuinc'
      Size = 15
    end
    object cliCaixacct_datinc: TDateField
      FieldName = 'cct_datinc'
    end
    object cliCaixacct_horinc: TStringField
      FieldName = 'cct_horinc'
      Size = 8
    end
    object cliCaixacct_usualt: TStringField
      FieldName = 'cct_usualt'
      Size = 15
    end
    object cliCaixacct_datalt: TDateField
      FieldName = 'cct_datalt'
    end
    object cliCaixacct_horalt: TStringField
      FieldName = 'cct_horalt'
      Size = 8
    end
    object cliCaixabco_codigo: TStringField
      FieldName = 'bco_codigo'
      Size = 6
    end
    object cliCaixabco_nome: TStringField
      FieldName = 'bco_nome'
      Size = 70
    end
    object cliCaixabco_usuinc: TStringField
      FieldName = 'bco_usuinc'
      Size = 15
    end
    object cliCaixabco_datinc: TDateField
      FieldName = 'bco_datinc'
    end
    object cliCaixabco_horinc: TStringField
      FieldName = 'bco_horinc'
      Size = 8
    end
    object cliCaixabco_usualt: TStringField
      FieldName = 'bco_usualt'
      Size = 15
    end
    object cliCaixabco_datalt: TDateField
      FieldName = 'bco_datalt'
    end
    object cliCaixabco_horalt: TStringField
      FieldName = 'bco_horalt'
      Size = 8
    end
  end
  object dsCaixa: TDataSource
    DataSet = cliCaixa
    Left = 872
    Top = 586
  end
  object dspveicitemnt: TDataSetProvider
    DataSet = sqlveicitemnt
    UpdateMode = upWhereKeyOnly
    Left = 720
    Top = 363
  end
  object cliveicitemnt: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspveicitemnt'
    Left = 800
    Top = 363
    object cliveicitemntvim_codigo: TIntegerField
      FieldName = 'vim_codigo'
    end
    object cliveicitemntvim_codplc: TStringField
      FieldName = 'vim_codplc'
      Size = 7
    end
    object cliveicitemntvim_codmit: TIntegerField
      FieldName = 'vim_codmit'
    end
    object cliveicitemntvim_codsgm: TIntegerField
      FieldName = 'vim_codsgm'
    end
    object cliveicitemntvim_kmmanu: TBCDField
      FieldName = 'vim_kmmanu'
      Precision = 7
      Size = 0
    end
    object cliveicitemntvim_datmnt: TDateField
      FieldName = 'vim_datmnt'
    end
    object cliveicitemntvim_ativo: TBooleanField
      FieldName = 'vim_ativo'
    end
    object cliveicitemntvim_usuinc: TStringField
      FieldName = 'vim_usuinc'
      Size = 15
    end
    object cliveicitemntvim_datinc: TDateField
      FieldName = 'vim_datinc'
    end
    object cliveicitemntvim_horinc: TStringField
      FieldName = 'vim_horinc'
      Size = 8
    end
    object cliveicitemntvim_usualt: TStringField
      FieldName = 'vim_usualt'
      Size = 15
    end
    object cliveicitemntvim_datalt: TDateField
      FieldName = 'vim_datalt'
    end
    object cliveicitemntvim_horalt: TStringField
      FieldName = 'vim_horalt'
      Size = 8
    end
    object cliveicitemntmit_codigo: TIntegerField
      FieldName = 'mit_codigo'
    end
    object cliveicitemntmit_nome: TStringField
      FieldName = 'mit_nome'
      Size = 25
    end
    object cliveicitemntmit_kmmanu: TBCDField
      FieldName = 'mit_kmmanu'
      Precision = 7
      Size = 0
    end
    object cliveicitemntmit_period: TStringField
      FieldName = 'mit_period'
      Size = 4
    end
    object cliveicitemntmit_codsgm: TIntegerField
      FieldName = 'mit_codsgm'
    end
    object cliveicitemntmit_usuinc: TStringField
      FieldName = 'mit_usuinc'
      Size = 15
    end
    object cliveicitemntmit_datinc: TDateField
      FieldName = 'mit_datinc'
    end
    object cliveicitemntmit_horinc: TStringField
      FieldName = 'mit_horinc'
      Size = 8
    end
    object cliveicitemntmit_usualt: TStringField
      FieldName = 'mit_usualt'
      Size = 15
    end
    object cliveicitemntmit_datalt: TDateField
      FieldName = 'mit_datalt'
    end
    object cliveicitemntmit_horalt: TStringField
      FieldName = 'mit_horalt'
      Size = 8
    end
    object cliveicitemntsgm_codigo: TIntegerField
      FieldName = 'sgm_codigo'
    end
    object cliveicitemntsgm_nome: TStringField
      FieldName = 'sgm_nome'
      Size = 25
    end
    object cliveicitemntsgm_codgrm: TIntegerField
      FieldName = 'sgm_codgrm'
    end
    object cliveicitemntsgm_usuinc: TStringField
      FieldName = 'sgm_usuinc'
      Size = 15
    end
    object cliveicitemntsgm_datinc: TDateField
      FieldName = 'sgm_datinc'
    end
    object cliveicitemntsgm_horinc: TStringField
      FieldName = 'sgm_horinc'
      Size = 8
    end
    object cliveicitemntsgm_usualt: TStringField
      FieldName = 'sgm_usualt'
      Size = 15
    end
    object cliveicitemntsgm_datalt: TDateField
      FieldName = 'sgm_datalt'
    end
    object cliveicitemntsgm_horalt: TStringField
      FieldName = 'sgm_horalt'
      Size = 8
    end
  end
  object dsveicitemnt: TDataSource
    DataSet = cliveicitemnt
    Left = 872
    Top = 363
  end
  object dspveiculosrv: TDataSetProvider
    DataSet = sqlveiculosrv
    UpdateMode = upWhereKeyOnly
    Left = 720
    Top = 418
  end
  object cliveiculosrv: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspveiculosrv'
    Left = 801
    Top = 418
    object cliveiculosrvvsv_codigo: TIntegerField
      FieldName = 'vsv_codigo'
    end
    object cliveiculosrvvsv_codplc: TStringField
      FieldName = 'vsv_codplc'
      Size = 7
    end
    object cliveiculosrvvsv_codmdm: TIntegerField
      FieldName = 'vsv_codmdm'
    end
    object cliveiculosrvvsv_codtsm: TIntegerField
      FieldName = 'vsv_codtsm'
    end
    object cliveiculosrvvsv_kmmant: TBCDField
      FieldName = 'vsv_kmmant'
      Precision = 7
      Size = 0
    end
    object cliveiculosrvvsv_kmmanu: TBCDField
      FieldName = 'vsv_kmmanu'
      Precision = 7
      Size = 0
    end
    object cliveiculosrvvsv_datmnt: TDateField
      FieldName = 'vsv_datmnt'
    end
    object cliveiculosrvvsv_ativo: TBooleanField
      FieldName = 'vsv_ativo'
    end
    object cliveiculosrvvsv_usuinc: TStringField
      FieldName = 'vsv_usuinc'
      Size = 15
    end
    object cliveiculosrvvsv_datinc: TDateField
      FieldName = 'vsv_datinc'
    end
    object cliveiculosrvvsv_horinc: TStringField
      FieldName = 'vsv_horinc'
      Size = 8
    end
    object cliveiculosrvvsv_usualt: TStringField
      FieldName = 'vsv_usualt'
      Size = 15
    end
    object cliveiculosrvvsv_datalt: TDateField
      FieldName = 'vsv_datalt'
    end
    object cliveiculosrvvsv_horalt: TStringField
      FieldName = 'vsv_horalt'
      Size = 8
    end
    object cliveiculosrvvat_placa: TStringField
      FieldName = 'vat_placa'
      Size = 7
    end
    object cliveiculosrvvat_nrfrota: TStringField
      FieldName = 'vat_nrfrota'
      Size = 5
    end
    object cliveiculosrvvat_paestversa: TStringField
      FieldName = 'vat_paestversa'
      Size = 5
    end
    object cliveiculosrvvat_chip: TStringField
      FieldName = 'vat_chip'
      Size = 10
    end
    object cliveiculosrvvat_cartao: TStringField
      FieldName = 'vat_cartao'
      Size = 15
    end
    object cliveiculosrvvat_chassi: TStringField
      FieldName = 'vat_chassi'
      Size = 17
    end
    object cliveiculosrvvat_licenc: TStringField
      FieldName = 'vat_licenc'
      Size = 15
    end
    object cliveiculosrvvat_renavan: TStringField
      FieldName = 'vat_renavan'
      Size = 15
    end
    object cliveiculosrvvat_dut: TStringField
      FieldName = 'vat_dut'
      Size = 10
    end
    object cliveiculosrvvat_codltd: TIntegerField
      FieldName = 'vat_codltd'
    end
    object cliveiculosrvvat_codtip: TIntegerField
      FieldName = 'vat_codtip'
    end
    object cliveiculosrvvat_codmdl: TIntegerField
      FieldName = 'vat_codmdl'
    end
    object cliveiculosrvvat_codmrc: TIntegerField
      FieldName = 'vat_codmrc'
    end
    object cliveiculosrvvat_codcor: TIntegerField
      FieldName = 'vat_codcor'
    end
    object cliveiculosrvvat_codcid: TIntegerField
      FieldName = 'vat_codcid'
    end
    object cliveiculosrvvat_codgrm: TIntegerField
      FieldName = 'vat_codgrm'
    end
    object cliveiculosrvvat_cor: TStringField
      FieldName = 'vat_cor'
    end
    object cliveiculosrvvat_status: TStringField
      FieldName = 'vat_status'
      Size = 15
    end
    object cliveiculosrvvat_tanque1: TBCDField
      FieldName = 'vat_tanque1'
      Precision = 7
      Size = 0
    end
    object cliveiculosrvvat_tanque2: TBCDField
      FieldName = 'vat_tanque2'
      Precision = 7
      Size = 0
    end
    object cliveiculosrvvat_tanque3: TBCDField
      FieldName = 'vat_tanque3'
      Precision = 7
      Size = 0
    end
    object cliveiculosrvvat_kmini: TBCDField
      FieldName = 'vat_kmini'
      Precision = 7
      Size = 0
    end
    object cliveiculosrvvat_kmatu: TBCDField
      FieldName = 'vat_kmatu'
      Precision = 7
      Size = 0
    end
    object cliveiculosrvvat_anofbmd: TStringField
      FieldName = 'vat_anofbmd'
      Size = 8
    end
    object cliveiculosrvvat_termo: TStringField
      FieldName = 'vat_termo'
      Size = 8
    end
    object cliveiculosrvvat_tombo: TStringField
      FieldName = 'vat_tombo'
      Size = 10
    end
    object cliveiculosrvvat_estado: TStringField
      FieldName = 'vat_estado'
      Size = 15
    end
    object cliveiculosrvvat_qtdpass: TStringField
      FieldName = 'vat_qtdpass'
      Size = 2
    end
    object cliveiculosrvvat_potenc: TStringField
      FieldName = 'vat_potenc'
      Size = 5
    end
    object cliveiculosrvvat_kgbruto: TBCDField
      FieldName = 'vat_kgbruto'
      Precision = 7
      Size = 0
    end
    object cliveiculosrvvat_kgcarga: TBCDField
      FieldName = 'vat_kgcarga'
      Precision = 7
      Size = 0
    end
    object cliveiculosrvvat_clindad: TStringField
      FieldName = 'vat_clindad'
      Size = 4
    end
    object cliveiculosrvvat_nrmotor: TStringField
      FieldName = 'vat_nrmotor'
      Size = 15
    end
    object cliveiculosrvvat_cavalo: TStringField
      FieldName = 'vat_cavalo'
      Size = 10
    end
    object cliveiculosrvvat_foto: TBlobField
      FieldName = 'vat_foto'
    end
    object cliveiculosrvvat_obs: TMemoField
      FieldName = 'vat_obs'
      BlobType = ftMemo
    end
    object cliveiculosrvvat_vlrcmp: TBCDField
      FieldName = 'vat_vlrcmp'
      Precision = 15
      Size = 2
    end
    object cliveiculosrvvat_datcmp: TDateField
      FieldName = 'vat_datcmp'
    end
    object cliveiculosrvvat_nfecmp: TStringField
      FieldName = 'vat_nfecmp'
      Size = 10
    end
    object cliveiculosrvvat_usuinc: TStringField
      FieldName = 'vat_usuinc'
      Size = 15
    end
    object cliveiculosrvvat_datinc: TDateField
      FieldName = 'vat_datinc'
    end
    object cliveiculosrvvat_horinc: TStringField
      FieldName = 'vat_horinc'
      Size = 8
    end
    object cliveiculosrvvat_usualt: TStringField
      FieldName = 'vat_usualt'
      Size = 15
    end
    object cliveiculosrvvat_datalt: TDateField
      FieldName = 'vat_datalt'
    end
    object cliveiculosrvvat_horalt: TStringField
      FieldName = 'vat_horalt'
      Size = 8
    end
    object cliveiculosrvtsm_codigo: TIntegerField
      FieldName = 'tsm_codigo'
    end
    object cliveiculosrvtsm_nome: TStringField
      FieldName = 'tsm_nome'
      Size = 25
    end
    object cliveiculosrvtsm_vlrhor: TBCDField
      FieldName = 'tsm_vlrhor'
      Precision = 12
      Size = 2
    end
    object cliveiculosrvtsm_codsgm: TIntegerField
      FieldName = 'tsm_codsgm'
    end
    object cliveiculosrvtsm_usuinc: TStringField
      FieldName = 'tsm_usuinc'
      Size = 15
    end
    object cliveiculosrvtsm_datinc: TDateField
      FieldName = 'tsm_datinc'
    end
    object cliveiculosrvtsm_horinc: TStringField
      FieldName = 'tsm_horinc'
      Size = 8
    end
    object cliveiculosrvtsm_usualt: TStringField
      FieldName = 'tsm_usualt'
      Size = 15
    end
    object cliveiculosrvtsm_datalt: TDateField
      FieldName = 'tsm_datalt'
    end
    object cliveiculosrvtsm_horalt: TStringField
      FieldName = 'tsm_horalt'
      Size = 8
    end
    object cliveiculosrvmdm_codigo: TIntegerField
      FieldName = 'mdm_codigo'
    end
    object cliveiculosrvmdm_codtsm: TIntegerField
      FieldName = 'mdm_codtsm'
    end
    object cliveiculosrvmdm_codmdl: TIntegerField
      FieldName = 'mdm_codmdl'
    end
    object cliveiculosrvmdm_kmmanu: TBCDField
      FieldName = 'mdm_kmmanu'
      Precision = 7
      Size = 0
    end
    object cliveiculosrvmdm_datmnt: TDateField
      FieldName = 'mdm_datmnt'
    end
    object cliveiculosrvmdm_ativo: TBooleanField
      FieldName = 'mdm_ativo'
    end
    object cliveiculosrvmdm_usuinc: TStringField
      FieldName = 'mdm_usuinc'
      Size = 15
    end
    object cliveiculosrvmdm_datinc: TDateField
      FieldName = 'mdm_datinc'
    end
    object cliveiculosrvmdm_horinc: TStringField
      FieldName = 'mdm_horinc'
      Size = 8
    end
    object cliveiculosrvmdm_usualt: TStringField
      FieldName = 'mdm_usualt'
      Size = 15
    end
    object cliveiculosrvmdm_datalt: TDateField
      FieldName = 'mdm_datalt'
    end
    object cliveiculosrvmdm_horalt: TStringField
      FieldName = 'mdm_horalt'
      Size = 8
    end
  end
  object dsveiculosrv: TDataSource
    DataSet = cliveiculosrv
    Left = 870
    Top = 418
  end
  object sqlPessoal: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * from "99999999999999_TESTE".pessoal '
      'left join  "dbconfig".cidade on cid_codigo = pss_codcid '
      'left join  "dbconfig".lotado on ltd_codigo = pss_codltd'
      'left join  "dbconfig".cargo on cgo_codigo = pss_codcgo'
      'left join  "dbconfig".estado on est_codigo = cid_codest')
    Left = 648
    Top = 152
    object sqlPessoalpss_codigo: TIntegerField
      FieldName = 'pss_codigo'
      Origin = 'pss_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlPessoalpss_nome: TStringField
      FieldName = 'pss_nome'
      Origin = 'pss_nome'
      Size = 50
    end
    object sqlPessoalpss_apelido: TStringField
      FieldName = 'pss_apelido'
      Origin = 'pss_apelido'
    end
    object sqlPessoalpss_codcgo: TIntegerField
      FieldName = 'pss_codcgo'
      Origin = 'pss_codcgo'
    end
    object sqlPessoalpss_codltd: TIntegerField
      FieldName = 'pss_codltd'
      Origin = 'pss_codltd'
    end
    object sqlPessoalpss_datnas: TDateField
      FieldName = 'pss_datnas'
      Origin = 'pss_datnas'
    end
    object sqlPessoalpss_sexo: TStringField
      FieldName = 'pss_sexo'
      Origin = 'pss_sexo'
      Size = 1
    end
    object sqlPessoalpss_ecivil: TStringField
      FieldName = 'pss_ecivil'
      Origin = 'pss_ecivil'
      Size = 15
    end
    object sqlPessoalpss_tpsangue: TStringField
      FieldName = 'pss_tpsangue'
      Origin = 'pss_tpsangue'
      Size = 3
    end
    object sqlPessoalpss_nompal: TStringField
      FieldName = 'pss_nompal'
      Origin = 'pss_nompal'
      Size = 50
    end
    object sqlPessoalpss_nommae: TStringField
      FieldName = 'pss_nommae'
      Origin = 'pss_nommae'
      Size = 50
    end
    object sqlPessoalpss_cpf: TStringField
      FieldName = 'pss_cpf'
      Origin = 'pss_cpf'
      Size = 11
    end
    object sqlPessoalpss_rg: TStringField
      FieldName = 'pss_rg'
      Origin = 'pss_rg'
      Size = 15
    end
    object sqlPessoalpss_rgexped: TStringField
      FieldName = 'pss_rgexped'
      Origin = 'pss_rgexped'
    end
    object sqlPessoalpss_rgdata: TDateField
      FieldName = 'pss_rgdata'
      Origin = 'pss_rgdata'
    end
    object sqlPessoalpss_pispasep: TStringField
      FieldName = 'pss_pispasep'
      Origin = 'pss_pispasep'
      Size = 14
    end
    object sqlPessoalpss_numctps: TStringField
      FieldName = 'pss_numctps'
      Origin = 'pss_numctps'
      Size = 14
    end
    object sqlPessoalpss_habilitac: TStringField
      FieldName = 'pss_habilitac'
      Origin = 'pss_habilitac'
      Size = 11
    end
    object sqlPessoalpss_hbemite: TDateField
      FieldName = 'pss_hbemite'
      Origin = 'pss_hbemite'
    end
    object sqlPessoalpss_hbvalid: TDateField
      FieldName = 'pss_hbvalid'
      Origin = 'pss_hbvalid'
    end
    object sqlPessoalpss_hbcateg: TStringField
      FieldName = 'pss_hbcateg'
      Origin = 'pss_hbcateg'
      Size = 4
    end
    object sqlPessoalpss_nrtitulo: TStringField
      FieldName = 'pss_nrtitulo'
      Origin = 'pss_nrtitulo'
      Size = 14
    end
    object sqlPessoalpss_nrreserv: TStringField
      FieldName = 'pss_nrreserv'
      Origin = 'pss_nrreserv'
      Size = 14
    end
    object sqlPessoalpss_cep: TStringField
      FieldName = 'pss_cep'
      Origin = 'pss_cep'
      Size = 8
    end
    object sqlPessoalpss_endereco: TStringField
      FieldName = 'pss_endereco'
      Origin = 'pss_endereco'
      Size = 50
    end
    object sqlPessoalpss_complem: TStringField
      FieldName = 'pss_complem'
      Origin = 'pss_complem'
      Size = 25
    end
    object sqlPessoalpss_numres: TStringField
      FieldName = 'pss_numres'
      Origin = 'pss_numres'
      Size = 6
    end
    object sqlPessoalpss_bairro: TStringField
      FieldName = 'pss_bairro'
      Origin = 'pss_bairro'
      Size = 50
    end
    object sqlPessoalpss_codcid: TIntegerField
      FieldName = 'pss_codcid'
      Origin = 'pss_codcid'
    end
    object sqlPessoalpss_tpimove: TStringField
      FieldName = 'pss_tpimove'
      Origin = 'pss_tpimove'
      Size = 15
    end
    object sqlPessoalpss_tpresid: TStringField
      FieldName = 'pss_tpresid'
      Origin = 'pss_tpresid'
      Size = 15
    end
    object sqlPessoalpss_telef01: TStringField
      FieldName = 'pss_telef01'
      Origin = 'pss_telef01'
      Size = 12
    end
    object sqlPessoalpss_telef02: TStringField
      FieldName = 'pss_telef02'
      Origin = 'pss_telef02'
      Size = 12
    end
    object sqlPessoalpss_celular: TStringField
      FieldName = 'pss_celular'
      Origin = 'pss_celular'
      Size = 12
    end
    object sqlPessoalpss_email: TStringField
      FieldName = 'pss_email'
      Origin = 'pss_email'
      Size = 100
    end
    object sqlPessoalpss_status: TStringField
      FieldName = 'pss_status'
      Origin = 'pss_status'
      Size = 15
    end
    object sqlPessoalpss_foto: TBlobField
      FieldName = 'pss_foto'
      Origin = 'pss_foto'
    end
    object sqlPessoalpss_obs: TMemoField
      FieldName = 'pss_obs'
      Origin = 'pss_obs'
      BlobType = ftMemo
    end
    object sqlPessoalpss_vlrrenda: TBCDField
      FieldName = 'pss_vlrrenda'
      Origin = 'pss_vlrrenda'
      Precision = 15
      Size = 2
    end
    object sqlPessoalpss_vlrvale: TBCDField
      FieldName = 'pss_vlrvale'
      Origin = 'pss_vlrvale'
      Precision = 15
      Size = 2
    end
    object sqlPessoalpss_datcmp: TDateField
      FieldName = 'pss_datcmp'
      Origin = 'pss_datcmp'
    end
    object sqlPessoalpss_nfecmp: TStringField
      FieldName = 'pss_nfecmp'
      Origin = 'pss_nfecmp'
      Size = 10
    end
    object sqlPessoalpss_codpcv: TStringField
      FieldName = 'pss_codpcv'
      Origin = 'pss_codpcv'
      Size = 10
    end
    object sqlPessoalpss_codpcr: TStringField
      FieldName = 'pss_codpcr'
      Origin = 'pss_codpcr'
      Size = 10
    end
    object sqlPessoalpss_usuinc: TStringField
      FieldName = 'pss_usuinc'
      Origin = 'pss_usuinc'
      Size = 15
    end
    object sqlPessoalpss_datinc: TDateField
      FieldName = 'pss_datinc'
      Origin = 'pss_datinc'
    end
    object sqlPessoalpss_horinc: TStringField
      FieldName = 'pss_horinc'
      Origin = 'pss_horinc'
      Size = 8
    end
    object sqlPessoalpss_usualt: TStringField
      FieldName = 'pss_usualt'
      Origin = 'pss_usualt'
      Size = 15
    end
    object sqlPessoalpss_datalt: TDateField
      FieldName = 'pss_datalt'
      Origin = 'pss_datalt'
    end
    object sqlPessoalpss_horalt: TStringField
      FieldName = 'pss_horalt'
      Origin = 'pss_horalt'
      Size = 8
    end
    object sqlPessoalcid_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cid_codigo'
      Origin = 'cid_codigo'
    end
    object sqlPessoalcid_cidnum: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_cidnum'
      Origin = 'cid_cidnum'
      Size = 8
    end
    object sqlPessoalcid_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_nome'
      Origin = 'cid_nome'
      Size = 35
    end
    object sqlPessoalcid_codest: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cid_codest'
      Origin = 'cid_codest'
    end
    object sqlPessoalcid_codpai: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cid_codpai'
      Origin = 'cid_codpai'
    end
    object sqlPessoalcid_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_usuinc'
      Origin = 'cid_usuinc'
      Size = 15
    end
    object sqlPessoalcid_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cid_datinc'
      Origin = 'cid_datinc'
    end
    object sqlPessoalcid_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_horinc'
      Origin = 'cid_horinc'
      Size = 8
    end
    object sqlPessoalcid_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_usualt'
      Origin = 'cid_usualt'
      Size = 15
    end
    object sqlPessoalcid_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cid_datalt'
      Origin = 'cid_datalt'
    end
    object sqlPessoalcid_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_horalt'
      Origin = 'cid_horalt'
      Size = 8
    end
    object sqlPessoalltd_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_codigo'
      Origin = 'ltd_codigo'
    end
    object sqlPessoalltd_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_nome'
      Origin = 'ltd_nome'
      Size = 35
    end
    object sqlPessoalltd_sigla: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_sigla'
      Origin = 'ltd_sigla'
      Size = 5
    end
    object sqlPessoalltd_endereco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_endereco'
      Origin = 'ltd_endereco'
      Size = 35
    end
    object sqlPessoalltd_numend: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_numend'
      Origin = 'ltd_numend'
      Size = 5
    end
    object sqlPessoalltd_complem: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_complem'
      Origin = 'ltd_complem'
      Size = 25
    end
    object sqlPessoalltd_bairro: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_bairro'
      Origin = 'ltd_bairro'
      Size = 50
    end
    object sqlPessoalltd_cep: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_cep'
      Origin = 'ltd_cep'
      Size = 8
    end
    object sqlPessoalltd_codcid: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_codcid'
      Origin = 'ltd_codcid'
    end
    object sqlPessoalltd_telef1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_telef1'
      Origin = 'ltd_telef1'
      Size = 12
    end
    object sqlPessoalltd_telef2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_telef2'
      Origin = 'ltd_telef2'
      Size = 12
    end
    object sqlPessoalltd_celula: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_celula'
      Origin = 'ltd_celula'
      Size = 12
    end
    object sqlPessoalltd_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_usuinc'
      Origin = 'ltd_usuinc'
      Size = 15
    end
    object sqlPessoalltd_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_datinc'
      Origin = 'ltd_datinc'
    end
    object sqlPessoalltd_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_horinc'
      Origin = 'ltd_horinc'
      Size = 8
    end
    object sqlPessoalltd_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_usualt'
      Origin = 'ltd_usualt'
      Size = 15
    end
    object sqlPessoalltd_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_datalt'
      Origin = 'ltd_datalt'
    end
    object sqlPessoalltd_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_horalt'
      Origin = 'ltd_horalt'
      Size = 8
    end
    object sqlPessoalcgo_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cgo_codigo'
      Origin = 'cgo_codigo'
    end
    object sqlPessoalcgo_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cgo_nome'
      Origin = 'cgo_nome'
      Size = 35
    end
    object sqlPessoalcgo_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cgo_usuinc'
      Origin = 'cgo_usuinc'
      Size = 15
    end
    object sqlPessoalcgo_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cgo_datinc'
      Origin = 'cgo_datinc'
    end
    object sqlPessoalcgo_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cgo_horinc'
      Origin = 'cgo_horinc'
      Size = 8
    end
    object sqlPessoalcgo_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cgo_usualt'
      Origin = 'cgo_usualt'
      Size = 15
    end
    object sqlPessoalcgo_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cgo_datalt'
      Origin = 'cgo_datalt'
    end
    object sqlPessoalcgo_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cgo_horalt'
      Origin = 'cgo_horalt'
      Size = 8
    end
    object sqlPessoalest_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'est_codigo'
      Origin = 'est_codigo'
    end
    object sqlPessoalest_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'est_nome'
      Origin = 'est_nome'
      Size = 50
    end
    object sqlPessoalest_uf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'est_uf'
      Origin = 'est_uf'
      Size = 2
    end
    object sqlPessoalest_codpai: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'est_codpai'
      Origin = 'est_codpai'
    end
    object sqlPessoalest_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'est_usuinc'
      Origin = 'est_usuinc'
      Size = 15
    end
    object sqlPessoalest_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'est_datinc'
      Origin = 'est_datinc'
    end
    object sqlPessoalest_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'est_horinc'
      Origin = 'est_horinc'
      Size = 8
    end
    object sqlPessoalest_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'est_usualt'
      Origin = 'est_usualt'
      Size = 15
    end
    object sqlPessoalest_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'est_datalt'
      Origin = 'est_datalt'
    end
    object sqlPessoalest_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'est_horalt'
      Origin = 'est_horalt'
      Size = 8
    end
  end
  object sqlveiculoatv: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * from "99999999999999_TESTE".veiculoatv'
      'left JOIN "dbconfig".lotado on ltd_codigo = vat_codltd'
      'left JOIN "dbconfig".modelo on mdl_codigo = vat_codmdl'
      'left JOIN "dbconfig".marca '#9'on mrc_codigo = vat_codmrc'
      'left JOIN "dbconfig".cidade on  cid_codigo    = vat_codcid'
      'left JOIN "dbconfig".tipo   on tip_codigo = vat_codtip'
      'left JOIN "dbconfig".cor   '#9'on cor_codigo = vat_codcor'
      'left JOIN "dbconfig".grupomnt on grm_codigo = vat_codgrm')
    Left = 648
    Top = 208
    object sqlveiculoatvvat_placa: TStringField
      FieldName = 'vat_placa'
      Origin = 'vat_placa'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 7
    end
    object sqlveiculoatvvat_nrfrota: TStringField
      FieldName = 'vat_nrfrota'
      Origin = 'vat_nrfrota'
      Size = 5
    end
    object sqlveiculoatvvat_paestversa: TStringField
      FieldName = 'vat_paestversa'
      Origin = 'vat_paestversa'
      Size = 5
    end
    object sqlveiculoatvvat_chip: TStringField
      FieldName = 'vat_chip'
      Origin = 'vat_chip'
      Size = 10
    end
    object sqlveiculoatvvat_cartao: TStringField
      FieldName = 'vat_cartao'
      Origin = 'vat_cartao'
      Size = 15
    end
    object sqlveiculoatvvat_chassi: TStringField
      FieldName = 'vat_chassi'
      Origin = 'vat_chassi'
      Size = 17
    end
    object sqlveiculoatvvat_licenc: TStringField
      FieldName = 'vat_licenc'
      Origin = 'vat_licenc'
      Size = 15
    end
    object sqlveiculoatvvat_renavan: TStringField
      FieldName = 'vat_renavan'
      Origin = 'vat_renavan'
      Size = 15
    end
    object sqlveiculoatvvat_dut: TStringField
      FieldName = 'vat_dut'
      Origin = 'vat_dut'
      Size = 10
    end
    object sqlveiculoatvvat_codltd: TIntegerField
      FieldName = 'vat_codltd'
      Origin = 'vat_codltd'
    end
    object sqlveiculoatvvat_codtip: TIntegerField
      FieldName = 'vat_codtip'
      Origin = 'vat_codtip'
    end
    object sqlveiculoatvvat_codmdl: TIntegerField
      FieldName = 'vat_codmdl'
      Origin = 'vat_codmdl'
    end
    object sqlveiculoatvvat_codmrc: TIntegerField
      FieldName = 'vat_codmrc'
      Origin = 'vat_codmrc'
    end
    object sqlveiculoatvvat_codcor: TIntegerField
      FieldName = 'vat_codcor'
      Origin = 'vat_codcor'
    end
    object sqlveiculoatvvat_codcid: TIntegerField
      FieldName = 'vat_codcid'
      Origin = 'vat_codcid'
    end
    object sqlveiculoatvvat_codgrm: TIntegerField
      FieldName = 'vat_codgrm'
      Origin = 'vat_codgrm'
    end
    object sqlveiculoatvvat_cor: TStringField
      FieldName = 'vat_cor'
      Origin = 'vat_cor'
    end
    object sqlveiculoatvvat_status: TStringField
      FieldName = 'vat_status'
      Origin = 'vat_status'
      Size = 15
    end
    object sqlveiculoatvvat_tanque1: TBCDField
      FieldName = 'vat_tanque1'
      Origin = 'vat_tanque1'
      Precision = 7
      Size = 0
    end
    object sqlveiculoatvvat_tanque2: TBCDField
      FieldName = 'vat_tanque2'
      Origin = 'vat_tanque2'
      Precision = 7
      Size = 0
    end
    object sqlveiculoatvvat_tanque3: TBCDField
      FieldName = 'vat_tanque3'
      Origin = 'vat_tanque3'
      Precision = 7
      Size = 0
    end
    object sqlveiculoatvvat_kmini: TBCDField
      FieldName = 'vat_kmini'
      Origin = 'vat_kmini'
      Precision = 7
      Size = 0
    end
    object sqlveiculoatvvat_kmatu: TBCDField
      FieldName = 'vat_kmatu'
      Origin = 'vat_kmatu'
      Precision = 7
      Size = 0
    end
    object sqlveiculoatvvat_anofbmd: TStringField
      FieldName = 'vat_anofbmd'
      Origin = 'vat_anofbmd'
      Size = 8
    end
    object sqlveiculoatvvat_termo: TStringField
      FieldName = 'vat_termo'
      Origin = 'vat_termo'
      Size = 8
    end
    object sqlveiculoatvvat_tombo: TStringField
      FieldName = 'vat_tombo'
      Origin = 'vat_tombo'
      Size = 10
    end
    object sqlveiculoatvvat_estado: TStringField
      FieldName = 'vat_estado'
      Origin = 'vat_estado'
      Size = 15
    end
    object sqlveiculoatvvat_qtdpass: TStringField
      FieldName = 'vat_qtdpass'
      Origin = 'vat_qtdpass'
      Size = 2
    end
    object sqlveiculoatvvat_potenc: TStringField
      FieldName = 'vat_potenc'
      Origin = 'vat_potenc'
      Size = 5
    end
    object sqlveiculoatvvat_kgbruto: TBCDField
      FieldName = 'vat_kgbruto'
      Origin = 'vat_kgbruto'
      Precision = 7
      Size = 0
    end
    object sqlveiculoatvvat_kgcarga: TBCDField
      FieldName = 'vat_kgcarga'
      Origin = 'vat_kgcarga'
      Precision = 7
      Size = 0
    end
    object sqlveiculoatvvat_clindad: TStringField
      FieldName = 'vat_clindad'
      Origin = 'vat_clindad'
      Size = 4
    end
    object sqlveiculoatvvat_nrmotor: TStringField
      FieldName = 'vat_nrmotor'
      Origin = 'vat_nrmotor'
      Size = 15
    end
    object sqlveiculoatvvat_cavalo: TStringField
      FieldName = 'vat_cavalo'
      Origin = 'vat_cavalo'
      Size = 10
    end
    object sqlveiculoatvvat_foto: TBlobField
      FieldName = 'vat_foto'
      Origin = 'vat_foto'
    end
    object sqlveiculoatvvat_obs: TMemoField
      FieldName = 'vat_obs'
      Origin = 'vat_obs'
      BlobType = ftMemo
    end
    object sqlveiculoatvvat_vlrcmp: TBCDField
      FieldName = 'vat_vlrcmp'
      Origin = 'vat_vlrcmp'
      Precision = 15
      Size = 2
    end
    object sqlveiculoatvvat_datcmp: TDateField
      FieldName = 'vat_datcmp'
      Origin = 'vat_datcmp'
    end
    object sqlveiculoatvvat_nfecmp: TStringField
      FieldName = 'vat_nfecmp'
      Origin = 'vat_nfecmp'
      Size = 10
    end
    object sqlveiculoatvvat_usuinc: TStringField
      FieldName = 'vat_usuinc'
      Origin = 'vat_usuinc'
      Size = 15
    end
    object sqlveiculoatvvat_datinc: TDateField
      FieldName = 'vat_datinc'
      Origin = 'vat_datinc'
    end
    object sqlveiculoatvvat_horinc: TStringField
      FieldName = 'vat_horinc'
      Origin = 'vat_horinc'
      Size = 8
    end
    object sqlveiculoatvvat_usualt: TStringField
      FieldName = 'vat_usualt'
      Origin = 'vat_usualt'
      Size = 15
    end
    object sqlveiculoatvvat_datalt: TDateField
      FieldName = 'vat_datalt'
      Origin = 'vat_datalt'
    end
    object sqlveiculoatvvat_horalt: TStringField
      FieldName = 'vat_horalt'
      Origin = 'vat_horalt'
      Size = 8
    end
    object sqlveiculoatvltd_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_codigo'
      Origin = 'ltd_codigo'
    end
    object sqlveiculoatvltd_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_nome'
      Origin = 'ltd_nome'
      Size = 35
    end
    object sqlveiculoatvltd_sigla: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_sigla'
      Origin = 'ltd_sigla'
      Size = 5
    end
    object sqlveiculoatvltd_endereco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_endereco'
      Origin = 'ltd_endereco'
      Size = 35
    end
    object sqlveiculoatvltd_numend: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_numend'
      Origin = 'ltd_numend'
      Size = 5
    end
    object sqlveiculoatvltd_complem: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_complem'
      Origin = 'ltd_complem'
      Size = 25
    end
    object sqlveiculoatvltd_bairro: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_bairro'
      Origin = 'ltd_bairro'
      Size = 50
    end
    object sqlveiculoatvltd_cep: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_cep'
      Origin = 'ltd_cep'
      Size = 8
    end
    object sqlveiculoatvltd_codcid: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_codcid'
      Origin = 'ltd_codcid'
    end
    object sqlveiculoatvltd_telef1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_telef1'
      Origin = 'ltd_telef1'
      Size = 12
    end
    object sqlveiculoatvltd_telef2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_telef2'
      Origin = 'ltd_telef2'
      Size = 12
    end
    object sqlveiculoatvltd_celula: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_celula'
      Origin = 'ltd_celula'
      Size = 12
    end
    object sqlveiculoatvltd_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_usuinc'
      Origin = 'ltd_usuinc'
      Size = 15
    end
    object sqlveiculoatvltd_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_datinc'
      Origin = 'ltd_datinc'
    end
    object sqlveiculoatvltd_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_horinc'
      Origin = 'ltd_horinc'
      Size = 8
    end
    object sqlveiculoatvltd_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_usualt'
      Origin = 'ltd_usualt'
      Size = 15
    end
    object sqlveiculoatvltd_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_datalt'
      Origin = 'ltd_datalt'
    end
    object sqlveiculoatvltd_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_horalt'
      Origin = 'ltd_horalt'
      Size = 8
    end
    object sqlveiculoatvmdl_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_codigo'
      Origin = 'mdl_codigo'
    end
    object sqlveiculoatvmdl_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_nome'
      Origin = 'mdl_nome'
      Size = 25
    end
    object sqlveiculoatvmdl_codfip: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_codfip'
      Origin = 'mdl_codfip'
      Size = 10
    end
    object sqlveiculoatvmdl_codmrc: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_codmrc'
      Origin = 'mdl_codmrc'
    end
    object sqlveiculoatvmdl_codgrm: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_codgrm'
      Origin = 'mdl_codgrm'
    end
    object sqlveiculoatvmdl_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_usuinc'
      Origin = 'mdl_usuinc'
      Size = 15
    end
    object sqlveiculoatvmdl_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_datinc'
      Origin = 'mdl_datinc'
    end
    object sqlveiculoatvmdl_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_horinc'
      Origin = 'mdl_horinc'
      Size = 8
    end
    object sqlveiculoatvmdl_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_usualt'
      Origin = 'mdl_usualt'
      Size = 15
    end
    object sqlveiculoatvmdl_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_datalt'
      Origin = 'mdl_datalt'
    end
    object sqlveiculoatvmdl_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_horalt'
      Origin = 'mdl_horalt'
      Size = 8
    end
    object sqlveiculoatvmrc_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'mrc_codigo'
      Origin = 'mrc_codigo'
    end
    object sqlveiculoatvmrc_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mrc_nome'
      Origin = 'mrc_nome'
      Size = 25
    end
    object sqlveiculoatvmrc_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mrc_usuinc'
      Origin = 'mrc_usuinc'
      Size = 15
    end
    object sqlveiculoatvmrc_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'mrc_datinc'
      Origin = 'mrc_datinc'
    end
    object sqlveiculoatvmrc_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mrc_horinc'
      Origin = 'mrc_horinc'
      Size = 8
    end
    object sqlveiculoatvmrc_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mrc_usualt'
      Origin = 'mrc_usualt'
      Size = 15
    end
    object sqlveiculoatvmrc_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'mrc_datalt'
      Origin = 'mrc_datalt'
    end
    object sqlveiculoatvmrc_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mrc_horalt'
      Origin = 'mrc_horalt'
      Size = 8
    end
    object sqlveiculoatvcid_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cid_codigo'
      Origin = 'cid_codigo'
    end
    object sqlveiculoatvcid_cidnum: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_cidnum'
      Origin = 'cid_cidnum'
      Size = 8
    end
    object sqlveiculoatvcid_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_nome'
      Origin = 'cid_nome'
      Size = 35
    end
    object sqlveiculoatvcid_codest: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cid_codest'
      Origin = 'cid_codest'
    end
    object sqlveiculoatvcid_codpai: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cid_codpai'
      Origin = 'cid_codpai'
    end
    object sqlveiculoatvcid_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_usuinc'
      Origin = 'cid_usuinc'
      Size = 15
    end
    object sqlveiculoatvcid_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cid_datinc'
      Origin = 'cid_datinc'
    end
    object sqlveiculoatvcid_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_horinc'
      Origin = 'cid_horinc'
      Size = 8
    end
    object sqlveiculoatvcid_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_usualt'
      Origin = 'cid_usualt'
      Size = 15
    end
    object sqlveiculoatvcid_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cid_datalt'
      Origin = 'cid_datalt'
    end
    object sqlveiculoatvcid_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_horalt'
      Origin = 'cid_horalt'
      Size = 8
    end
    object sqlveiculoatvtip_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'tip_codigo'
      Origin = 'tip_codigo'
    end
    object sqlveiculoatvtip_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tip_nome'
      Origin = 'tip_nome'
      Size = 25
    end
    object sqlveiculoatvtip_teixo: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tip_teixo'
      Origin = 'tip_teixo'
      Precision = 1
      Size = 0
    end
    object sqlveiculoatvtip_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tip_usuinc'
      Origin = 'tip_usuinc'
      Size = 15
    end
    object sqlveiculoatvtip_step: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tip_step'
      Origin = 'tip_step'
      Precision = 1
      Size = 0
    end
    object sqlveiculoatvtip_tipo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tip_tipo'
      Origin = 'tip_tipo'
      Size = 15
    end
    object sqlveiculoatvtip_trac: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tip_trac'
      Origin = 'tip_trac'
      Size = 15
    end
    object sqlveiculoatvtip_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'tip_datinc'
      Origin = 'tip_datinc'
    end
    object sqlveiculoatvtip_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tip_horinc'
      Origin = 'tip_horinc'
      Size = 8
    end
    object sqlveiculoatvtip_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tip_usualt'
      Origin = 'tip_usualt'
      Size = 15
    end
    object sqlveiculoatvtip_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'tip_datalt'
      Origin = 'tip_datalt'
    end
    object sqlveiculoatvtip_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tip_horalt'
      Origin = 'tip_horalt'
      Size = 8
    end
    object sqlveiculoatvcor_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cor_codigo'
      Origin = 'cor_codigo'
    end
    object sqlveiculoatvcor_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cor_nome'
      Origin = 'cor_nome'
      Size = 35
    end
    object sqlveiculoatvcor_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cor_usuinc'
      Origin = 'cor_usuinc'
      Size = 15
    end
    object sqlveiculoatvcor_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cor_datinc'
      Origin = 'cor_datinc'
    end
    object sqlveiculoatvcor_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cor_horinc'
      Origin = 'cor_horinc'
      Size = 8
    end
    object sqlveiculoatvcor_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cor_usualt'
      Origin = 'cor_usualt'
      Size = 15
    end
    object sqlveiculoatvcor_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cor_datalt'
      Origin = 'cor_datalt'
    end
    object sqlveiculoatvcor_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cor_horalt'
      Origin = 'cor_horalt'
      Size = 8
    end
    object sqlveiculoatvgrm_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'grm_codigo'
      Origin = 'grm_codigo'
    end
    object sqlveiculoatvgrm_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grm_nome'
      Origin = 'grm_nome'
      Size = 40
    end
    object sqlveiculoatvgrm_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grm_usuinc'
      Origin = 'grm_usuinc'
      Size = 15
    end
    object sqlveiculoatvgrm_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'grm_datinc'
      Origin = 'grm_datinc'
    end
    object sqlveiculoatvgrm_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grm_horinc'
      Origin = 'grm_horinc'
      Size = 8
    end
    object sqlveiculoatvgrm_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grm_usualt'
      Origin = 'grm_usualt'
      Size = 15
    end
    object sqlveiculoatvgrm_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'grm_datalt'
      Origin = 'grm_datalt'
    end
    object sqlveiculoatvgrm_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grm_horalt'
      Origin = 'grm_horalt'
      Size = 8
    end
  end
  object sqlacsatv: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      
        'Select aat_codigo, aat_placa, aat_codacs, acs_nome, aat_usuinc, ' +
        'aat_datinc, aat_horinc, aat_usualt, aat_datalt, aat_horalt from ' +
        '"99999999999999_TESTE".acessoratv '
      'left JOIN "dbconfig".acessorio on acs_codigo = aat_codacs')
    Left = 648
    Top = 259
    object sqlacsatvaat_codigo: TIntegerField
      FieldName = 'aat_codigo'
      Origin = 'aat_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlacsatvaat_placa: TStringField
      FieldName = 'aat_placa'
      Origin = 'aat_placa'
      Size = 7
    end
    object sqlacsatvaat_codacs: TIntegerField
      FieldName = 'aat_codacs'
      Origin = 'aat_codacs'
    end
    object sqlacsatvacs_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'acs_nome'
      Origin = 'acs_nome'
      Size = 25
    end
    object sqlacsatvaat_usuinc: TStringField
      FieldName = 'aat_usuinc'
      Origin = 'aat_usuinc'
      Size = 15
    end
    object sqlacsatvaat_datinc: TDateField
      FieldName = 'aat_datinc'
      Origin = 'aat_datinc'
    end
    object sqlacsatvaat_horinc: TStringField
      FieldName = 'aat_horinc'
      Origin = 'aat_horinc'
      Size = 8
    end
    object sqlacsatvaat_usualt: TStringField
      FieldName = 'aat_usualt'
      Origin = 'aat_usualt'
      Size = 15
    end
    object sqlacsatvaat_datalt: TDateField
      FieldName = 'aat_datalt'
      Origin = 'aat_datalt'
    end
    object sqlacsatvaat_horalt: TStringField
      FieldName = 'aat_horalt'
      Origin = 'aat_horalt'
      Size = 8
    end
  end
  object sqlCmbAtv: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      
        'Select cat_codigo, cat_placa, cat_codcmb, cmb_nome, cat_usuinc, ' +
        'cat_datinc, cat_horinc, cat_usualt, cat_datalt, cat_horalt from ' +
        '"99999999999999_TESTE".combustatv'
      'left JOIN "dbconfig".combustivel on cmb_codigo = cat_codcmb')
    Left = 648
    Top = 312
    object sqlCmbAtvcat_codigo: TIntegerField
      FieldName = 'cat_codigo'
      Origin = 'cat_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlCmbAtvcat_placa: TStringField
      FieldName = 'cat_placa'
      Origin = 'cat_placa'
      Size = 7
    end
    object sqlCmbAtvcat_codcmb: TIntegerField
      FieldName = 'cat_codcmb'
      Origin = 'cat_codcmb'
    end
    object sqlCmbAtvcmb_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cmb_nome'
      Origin = 'cmb_nome'
    end
    object sqlCmbAtvcat_usuinc: TStringField
      FieldName = 'cat_usuinc'
      Origin = 'cat_usuinc'
      Size = 15
    end
    object sqlCmbAtvcat_datinc: TDateField
      FieldName = 'cat_datinc'
      Origin = 'cat_datinc'
    end
    object sqlCmbAtvcat_horinc: TStringField
      FieldName = 'cat_horinc'
      Origin = 'cat_horinc'
      Size = 8
    end
    object sqlCmbAtvcat_usualt: TStringField
      FieldName = 'cat_usualt'
      Origin = 'cat_usualt'
      Size = 15
    end
    object sqlCmbAtvcat_datalt: TDateField
      FieldName = 'cat_datalt'
      Origin = 'cat_datalt'
    end
    object sqlCmbAtvcat_horalt: TStringField
      FieldName = 'cat_horalt'
      Origin = 'cat_horalt'
      Size = 8
    end
  end
  object sqlveicitemnt: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * FROM "99999999999999_TESTE".veicitemnt '
      'LEFT JOIN "dbconfig".manutitem on mit_codigo = vim_codmit'
      'LEFT JOIN "dbconfig".subgrpmnt on sgm_codigo = mit_codsgm ')
    Left = 649
    Top = 365
    object sqlveicitemntvim_codigo: TIntegerField
      FieldName = 'vim_codigo'
      Origin = 'vim_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlveicitemntvim_codplc: TStringField
      FieldName = 'vim_codplc'
      Origin = 'vim_codplc'
      Size = 7
    end
    object sqlveicitemntvim_codmit: TIntegerField
      FieldName = 'vim_codmit'
      Origin = 'vim_codmit'
    end
    object sqlveicitemntvim_codsgm: TIntegerField
      FieldName = 'vim_codsgm'
      Origin = 'vim_codsgm'
    end
    object sqlveicitemntvim_kmmanu: TBCDField
      FieldName = 'vim_kmmanu'
      Origin = 'vim_kmmanu'
      Precision = 7
      Size = 0
    end
    object sqlveicitemntvim_datmnt: TDateField
      FieldName = 'vim_datmnt'
      Origin = 'vim_datmnt'
    end
    object sqlveicitemntvim_ativo: TBooleanField
      FieldName = 'vim_ativo'
      Origin = 'vim_ativo'
    end
    object sqlveicitemntvim_usuinc: TStringField
      FieldName = 'vim_usuinc'
      Origin = 'vim_usuinc'
      Size = 15
    end
    object sqlveicitemntvim_datinc: TDateField
      FieldName = 'vim_datinc'
      Origin = 'vim_datinc'
    end
    object sqlveicitemntvim_horinc: TStringField
      FieldName = 'vim_horinc'
      Origin = 'vim_horinc'
      Size = 8
    end
    object sqlveicitemntvim_usualt: TStringField
      FieldName = 'vim_usualt'
      Origin = 'vim_usualt'
      Size = 15
    end
    object sqlveicitemntvim_datalt: TDateField
      FieldName = 'vim_datalt'
      Origin = 'vim_datalt'
    end
    object sqlveicitemntvim_horalt: TStringField
      FieldName = 'vim_horalt'
      Origin = 'vim_horalt'
      Size = 8
    end
    object sqlveicitemntmit_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'mit_codigo'
      Origin = 'mit_codigo'
    end
    object sqlveicitemntmit_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mit_nome'
      Origin = 'mit_nome'
      Size = 25
    end
    object sqlveicitemntmit_kmmanu: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'mit_kmmanu'
      Origin = 'mit_kmmanu'
      Precision = 7
      Size = 0
    end
    object sqlveicitemntmit_period: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mit_period'
      Origin = 'mit_period'
      Size = 4
    end
    object sqlveicitemntmit_codsgm: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'mit_codsgm'
      Origin = 'mit_codsgm'
    end
    object sqlveicitemntmit_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mit_usuinc'
      Origin = 'mit_usuinc'
      Size = 15
    end
    object sqlveicitemntmit_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'mit_datinc'
      Origin = 'mit_datinc'
    end
    object sqlveicitemntmit_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mit_horinc'
      Origin = 'mit_horinc'
      Size = 8
    end
    object sqlveicitemntmit_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mit_usualt'
      Origin = 'mit_usualt'
      Size = 15
    end
    object sqlveicitemntmit_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'mit_datalt'
      Origin = 'mit_datalt'
    end
    object sqlveicitemntmit_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mit_horalt'
      Origin = 'mit_horalt'
      Size = 8
    end
    object sqlveicitemntsgm_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_codigo'
      Origin = 'sgm_codigo'
    end
    object sqlveicitemntsgm_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_nome'
      Origin = 'sgm_nome'
      Size = 25
    end
    object sqlveicitemntsgm_codgrm: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_codgrm'
      Origin = 'sgm_codgrm'
    end
    object sqlveicitemntsgm_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_usuinc'
      Origin = 'sgm_usuinc'
      Size = 15
    end
    object sqlveicitemntsgm_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_datinc'
      Origin = 'sgm_datinc'
    end
    object sqlveicitemntsgm_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_horinc'
      Origin = 'sgm_horinc'
      Size = 8
    end
    object sqlveicitemntsgm_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_usualt'
      Origin = 'sgm_usualt'
      Size = 15
    end
    object sqlveicitemntsgm_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_datalt'
      Origin = 'sgm_datalt'
    end
    object sqlveicitemntsgm_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'sgm_horalt'
      Origin = 'sgm_horalt'
      Size = 8
    end
  end
  object sqlveiculosrv: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * From "99999999999999_TESTE".veiculosrv'
      
        'LEFT Join "99999999999999_TESTE".veiculoatv on vat_placa = vsv_c' +
        'odplc'
      'LEFT Join "dbconfig".tbservico on tsm_codigo = vsv_codtsm'
      'LEFT Join "dbconfig".modelomnt on mdm_codigo = vsv_codmdm'
      '')
    Left = 648
    Top = 418
    object sqlveiculosrvvsv_codigo: TIntegerField
      FieldName = 'vsv_codigo'
      Origin = 'vsv_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlveiculosrvvsv_codplc: TStringField
      FieldName = 'vsv_codplc'
      Origin = 'vsv_codplc'
      Size = 7
    end
    object sqlveiculosrvvsv_codmdm: TIntegerField
      FieldName = 'vsv_codmdm'
      Origin = 'vsv_codmdm'
    end
    object sqlveiculosrvvsv_codtsm: TIntegerField
      FieldName = 'vsv_codtsm'
      Origin = 'vsv_codtsm'
    end
    object sqlveiculosrvvsv_kmmant: TBCDField
      FieldName = 'vsv_kmmant'
      Origin = 'vsv_kmmant'
      Precision = 7
      Size = 0
    end
    object sqlveiculosrvvsv_kmmanu: TBCDField
      FieldName = 'vsv_kmmanu'
      Origin = 'vsv_kmmanu'
      Precision = 7
      Size = 0
    end
    object sqlveiculosrvvsv_datmnt: TDateField
      FieldName = 'vsv_datmnt'
      Origin = 'vsv_datmnt'
    end
    object sqlveiculosrvvsv_ativo: TBooleanField
      FieldName = 'vsv_ativo'
      Origin = 'vsv_ativo'
    end
    object sqlveiculosrvvsv_usuinc: TStringField
      FieldName = 'vsv_usuinc'
      Origin = 'vsv_usuinc'
      Size = 15
    end
    object sqlveiculosrvvsv_datinc: TDateField
      FieldName = 'vsv_datinc'
      Origin = 'vsv_datinc'
    end
    object sqlveiculosrvvsv_horinc: TStringField
      FieldName = 'vsv_horinc'
      Origin = 'vsv_horinc'
      Size = 8
    end
    object sqlveiculosrvvsv_usualt: TStringField
      FieldName = 'vsv_usualt'
      Origin = 'vsv_usualt'
      Size = 15
    end
    object sqlveiculosrvvsv_datalt: TDateField
      FieldName = 'vsv_datalt'
      Origin = 'vsv_datalt'
    end
    object sqlveiculosrvvsv_horalt: TStringField
      FieldName = 'vsv_horalt'
      Origin = 'vsv_horalt'
      Size = 8
    end
    object sqlveiculosrvvat_placa: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_placa'
      Origin = 'vat_placa'
      Size = 7
    end
    object sqlveiculosrvvat_nrfrota: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_nrfrota'
      Origin = 'vat_nrfrota'
      Size = 5
    end
    object sqlveiculosrvvat_paestversa: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_paestversa'
      Origin = 'vat_paestversa'
      Size = 5
    end
    object sqlveiculosrvvat_chip: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_chip'
      Origin = 'vat_chip'
      Size = 10
    end
    object sqlveiculosrvvat_cartao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_cartao'
      Origin = 'vat_cartao'
      Size = 15
    end
    object sqlveiculosrvvat_chassi: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_chassi'
      Origin = 'vat_chassi'
      Size = 17
    end
    object sqlveiculosrvvat_licenc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_licenc'
      Origin = 'vat_licenc'
      Size = 15
    end
    object sqlveiculosrvvat_renavan: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_renavan'
      Origin = 'vat_renavan'
      Size = 15
    end
    object sqlveiculosrvvat_dut: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_dut'
      Origin = 'vat_dut'
      Size = 10
    end
    object sqlveiculosrvvat_codltd: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codltd'
      Origin = 'vat_codltd'
    end
    object sqlveiculosrvvat_codtip: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codtip'
      Origin = 'vat_codtip'
    end
    object sqlveiculosrvvat_codmdl: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codmdl'
      Origin = 'vat_codmdl'
    end
    object sqlveiculosrvvat_codmrc: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codmrc'
      Origin = 'vat_codmrc'
    end
    object sqlveiculosrvvat_codcor: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codcor'
      Origin = 'vat_codcor'
    end
    object sqlveiculosrvvat_codcid: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codcid'
      Origin = 'vat_codcid'
    end
    object sqlveiculosrvvat_codgrm: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codgrm'
      Origin = 'vat_codgrm'
    end
    object sqlveiculosrvvat_cor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_cor'
      Origin = 'vat_cor'
    end
    object sqlveiculosrvvat_status: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_status'
      Origin = 'vat_status'
      Size = 15
    end
    object sqlveiculosrvvat_tanque1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_tanque1'
      Origin = 'vat_tanque1'
      Precision = 7
      Size = 0
    end
    object sqlveiculosrvvat_tanque2: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_tanque2'
      Origin = 'vat_tanque2'
      Precision = 7
      Size = 0
    end
    object sqlveiculosrvvat_tanque3: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_tanque3'
      Origin = 'vat_tanque3'
      Precision = 7
      Size = 0
    end
    object sqlveiculosrvvat_kmini: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_kmini'
      Origin = 'vat_kmini'
      Precision = 7
      Size = 0
    end
    object sqlveiculosrvvat_kmatu: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_kmatu'
      Origin = 'vat_kmatu'
      Precision = 7
      Size = 0
    end
    object sqlveiculosrvvat_anofbmd: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_anofbmd'
      Origin = 'vat_anofbmd'
      Size = 8
    end
    object sqlveiculosrvvat_termo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_termo'
      Origin = 'vat_termo'
      Size = 8
    end
    object sqlveiculosrvvat_tombo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_tombo'
      Origin = 'vat_tombo'
      Size = 10
    end
    object sqlveiculosrvvat_estado: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_estado'
      Origin = 'vat_estado'
      Size = 15
    end
    object sqlveiculosrvvat_qtdpass: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_qtdpass'
      Origin = 'vat_qtdpass'
      Size = 2
    end
    object sqlveiculosrvvat_potenc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_potenc'
      Origin = 'vat_potenc'
      Size = 5
    end
    object sqlveiculosrvvat_kgbruto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_kgbruto'
      Origin = 'vat_kgbruto'
      Precision = 7
      Size = 0
    end
    object sqlveiculosrvvat_kgcarga: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_kgcarga'
      Origin = 'vat_kgcarga'
      Precision = 7
      Size = 0
    end
    object sqlveiculosrvvat_clindad: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_clindad'
      Origin = 'vat_clindad'
      Size = 4
    end
    object sqlveiculosrvvat_nrmotor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_nrmotor'
      Origin = 'vat_nrmotor'
      Size = 15
    end
    object sqlveiculosrvvat_cavalo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_cavalo'
      Origin = 'vat_cavalo'
      Size = 10
    end
    object sqlveiculosrvvat_foto: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'vat_foto'
      Origin = 'vat_foto'
    end
    object sqlveiculosrvvat_obs: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'vat_obs'
      Origin = 'vat_obs'
      BlobType = ftMemo
    end
    object sqlveiculosrvvat_vlrcmp: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_vlrcmp'
      Origin = 'vat_vlrcmp'
      Precision = 15
      Size = 2
    end
    object sqlveiculosrvvat_datcmp: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'vat_datcmp'
      Origin = 'vat_datcmp'
    end
    object sqlveiculosrvvat_nfecmp: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_nfecmp'
      Origin = 'vat_nfecmp'
      Size = 10
    end
    object sqlveiculosrvvat_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_usuinc'
      Origin = 'vat_usuinc'
      Size = 15
    end
    object sqlveiculosrvvat_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'vat_datinc'
      Origin = 'vat_datinc'
    end
    object sqlveiculosrvvat_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_horinc'
      Origin = 'vat_horinc'
      Size = 8
    end
    object sqlveiculosrvvat_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_usualt'
      Origin = 'vat_usualt'
      Size = 15
    end
    object sqlveiculosrvvat_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'vat_datalt'
      Origin = 'vat_datalt'
    end
    object sqlveiculosrvvat_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_horalt'
      Origin = 'vat_horalt'
      Size = 8
    end
    object sqlveiculosrvtsm_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_codigo'
      Origin = 'tsm_codigo'
    end
    object sqlveiculosrvtsm_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_nome'
      Origin = 'tsm_nome'
      Size = 25
    end
    object sqlveiculosrvtsm_vlrhor: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_vlrhor'
      Origin = 'tsm_vlrhor'
      Precision = 12
      Size = 2
    end
    object sqlveiculosrvtsm_codsgm: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_codsgm'
      Origin = 'tsm_codsgm'
    end
    object sqlveiculosrvtsm_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_usuinc'
      Origin = 'tsm_usuinc'
      Size = 15
    end
    object sqlveiculosrvtsm_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_datinc'
      Origin = 'tsm_datinc'
    end
    object sqlveiculosrvtsm_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_horinc'
      Origin = 'tsm_horinc'
      Size = 8
    end
    object sqlveiculosrvtsm_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_usualt'
      Origin = 'tsm_usualt'
      Size = 15
    end
    object sqlveiculosrvtsm_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_datalt'
      Origin = 'tsm_datalt'
    end
    object sqlveiculosrvtsm_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_horalt'
      Origin = 'tsm_horalt'
      Size = 8
    end
    object sqlveiculosrvmdm_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'mdm_codigo'
      Origin = 'mdm_codigo'
    end
    object sqlveiculosrvmdm_codtsm: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'mdm_codtsm'
      Origin = 'mdm_codtsm'
    end
    object sqlveiculosrvmdm_codmdl: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'mdm_codmdl'
      Origin = 'mdm_codmdl'
    end
    object sqlveiculosrvmdm_kmmanu: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'mdm_kmmanu'
      Origin = 'mdm_kmmanu'
      Precision = 7
      Size = 0
    end
    object sqlveiculosrvmdm_datmnt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'mdm_datmnt'
      Origin = 'mdm_datmnt'
    end
    object sqlveiculosrvmdm_ativo: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'mdm_ativo'
      Origin = 'mdm_ativo'
    end
    object sqlveiculosrvmdm_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mdm_usuinc'
      Origin = 'mdm_usuinc'
      Size = 15
    end
    object sqlveiculosrvmdm_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'mdm_datinc'
      Origin = 'mdm_datinc'
    end
    object sqlveiculosrvmdm_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mdm_horinc'
      Origin = 'mdm_horinc'
      Size = 8
    end
    object sqlveiculosrvmdm_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mdm_usualt'
      Origin = 'mdm_usualt'
      Size = 15
    end
    object sqlveiculosrvmdm_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'mdm_datalt'
      Origin = 'mdm_datalt'
    end
    object sqlveiculosrvmdm_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mdm_horalt'
      Origin = 'mdm_horalt'
      Size = 8
    end
  end
  object sqlFornecedor: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * from "99999999999999_TESTE".fornecedor'
      'LEFT JOIN "dbconfig".cidade on cid_codigo= fnd_codcid'
      'LEFT JOIN "dbconfig".pconta on pct_codigo = fnd_codpct ')
    Left = 648
    Top = 474
  end
  object sqlccorrente: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * from "99999999999999_TESTE".ccorrente'
      'LEFT JOIN "dbconfig".banco on bco_codigo = cct_codbco'
      
        'LEFT JOIN "99999999999999_TESTE".caixa on cxa_codcct = cct_codig' +
        'o'
      
        'LEFT JOIN "99999999999999_TESTE".abrcaixa on abc_codcct = cct_co' +
        'digo and abc_databr = ( Select max( abc_databr ) from "999999999' +
        '99999_TESTE".abrcaixa)')
    Left = 648
    Top = 530
    object sqlccorrentecct_codigo: TIntegerField
      FieldName = 'cct_codigo'
      Origin = 'cct_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlccorrentecct_codbco: TStringField
      FieldName = 'cct_codbco'
      Origin = 'cct_codbco'
      Size = 6
    end
    object sqlccorrentecct_agencia: TStringField
      FieldName = 'cct_agencia'
      Origin = 'cct_agencia'
      Size = 9
    end
    object sqlccorrentecct_nrconta: TStringField
      FieldName = 'cct_nrconta'
      Origin = 'cct_nrconta'
      Size = 9
    end
    object sqlccorrentecct_codpcd: TStringField
      FieldName = 'cct_codpcd'
      Origin = 'cct_codpcd'
      Size = 10
    end
    object sqlccorrentecct_codpcc: TStringField
      FieldName = 'cct_codpcc'
      Origin = 'cct_codpcc'
      Size = 10
    end
    object sqlccorrentecct_telef1: TStringField
      FieldName = 'cct_telef1'
      Origin = 'cct_telef1'
      Size = 12
    end
    object sqlccorrentecct_telef2: TStringField
      FieldName = 'cct_telef2'
      Origin = 'cct_telef2'
      Size = 12
    end
    object sqlccorrentecct_celula: TStringField
      FieldName = 'cct_celula'
      Origin = 'cct_celula'
      Size = 12
    end
    object sqlccorrentecct_usuinc: TStringField
      FieldName = 'cct_usuinc'
      Origin = 'cct_usuinc'
      Size = 15
    end
    object sqlccorrentecct_datinc: TDateField
      FieldName = 'cct_datinc'
      Origin = 'cct_datinc'
    end
    object sqlccorrentecct_horinc: TStringField
      FieldName = 'cct_horinc'
      Origin = 'cct_horinc'
      Size = 8
    end
    object sqlccorrentecct_usualt: TStringField
      FieldName = 'cct_usualt'
      Origin = 'cct_usualt'
      Size = 15
    end
    object sqlccorrentecct_datalt: TDateField
      FieldName = 'cct_datalt'
      Origin = 'cct_datalt'
    end
    object sqlccorrentecct_horalt: TStringField
      FieldName = 'cct_horalt'
      Origin = 'cct_horalt'
      Size = 8
    end
    object sqlccorrentebco_codigo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bco_codigo'
      Origin = 'bco_codigo'
      Size = 6
    end
    object sqlccorrentebco_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bco_nome'
      Origin = 'bco_nome'
      Size = 70
    end
    object sqlccorrentebco_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bco_usuinc'
      Origin = 'bco_usuinc'
      Size = 15
    end
    object sqlccorrentebco_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'bco_datinc'
      Origin = 'bco_datinc'
    end
    object sqlccorrentebco_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bco_horinc'
      Origin = 'bco_horinc'
      Size = 8
    end
    object sqlccorrentebco_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bco_usualt'
      Origin = 'bco_usualt'
      Size = 15
    end
    object sqlccorrentebco_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'bco_datalt'
      Origin = 'bco_datalt'
    end
    object sqlccorrentebco_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bco_horalt'
      Origin = 'bco_horalt'
      Size = 8
    end
    object sqlccorrentecxa_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cxa_codigo'
      Origin = 'cxa_codigo'
    end
    object sqlccorrentecxa_codcct: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cxa_codcct'
      Origin = 'cxa_codcct'
    end
    object sqlccorrentecxa_codusu: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cxa_codusu'
      Origin = 'cxa_codusu'
    end
    object sqlccorrentecxa_ativo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cxa_ativo'
      Origin = 'cxa_ativo'
      FixedChar = True
      Size = 1
    end
    object sqlccorrentecxa_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cxa_usuinc'
      Origin = 'cxa_usuinc'
      Size = 15
    end
    object sqlccorrentecxa_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cxa_datinc'
      Origin = 'cxa_datinc'
    end
    object sqlccorrentecxa_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cxa_horinc'
      Origin = 'cxa_horinc'
      Size = 8
    end
    object sqlccorrentecxa_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cxa_usualt'
      Origin = 'cxa_usualt'
      Size = 15
    end
    object sqlccorrentecxa_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cxa_datalt'
      Origin = 'cxa_datalt'
    end
    object sqlccorrentecxa_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cxa_horalt'
      Origin = 'cxa_horalt'
      Size = 8
    end
    object sqlccorrenteabc_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'abc_codigo'
      Origin = 'abc_codigo'
    end
    object sqlccorrenteabc_codcxa: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'abc_codcxa'
      Origin = 'abc_codcxa'
    end
    object sqlccorrenteabc_codcct: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'abc_codcct'
      Origin = 'abc_codcct'
    end
    object sqlccorrenteabc_databr: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'abc_databr'
      Origin = 'abc_databr'
    end
    object sqlccorrenteabc_datfch: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'abc_datfch'
      Origin = 'abc_datfch'
    end
    object sqlccorrenteabc_vlrini: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'abc_vlrini'
      Origin = 'abc_vlrini'
      Precision = 15
      Size = 2
    end
    object sqlccorrenteabc_vlrant: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'abc_vlrant'
      Origin = 'abc_vlrant'
      Precision = 15
      Size = 2
    end
    object sqlccorrenteabc_vlratu: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'abc_vlratu'
      Origin = 'abc_vlratu'
      Precision = 15
      Size = 2
    end
    object sqlccorrenteabc_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'abc_usuinc'
      Origin = 'abc_usuinc'
      Size = 15
    end
    object sqlccorrenteabc_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'abc_datinc'
      Origin = 'abc_datinc'
    end
    object sqlccorrenteabc_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'abc_horinc'
      Origin = 'abc_horinc'
      Size = 8
    end
    object sqlccorrenteabc_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'abc_usualt'
      Origin = 'abc_usualt'
      Size = 15
    end
    object sqlccorrenteabc_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'abc_datalt'
      Origin = 'abc_datalt'
    end
    object sqlccorrenteabc_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'abc_horalt'
      Origin = 'abc_horalt'
      Size = 8
    end
  end
  object sqlCaixa: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * from "99999999999999_TESTE".caixa'
      
        ' LEFT JOIN "99999999999999_TESTE".ccorrente on cct_codigo = cxa_' +
        'codcct'
      ' LEFT JOIN "dbconfig".banco on bco_codigo = cct_codbco')
    Left = 648
    Top = 586
    object sqlCaixacxa_codigo: TIntegerField
      FieldName = 'cxa_codigo'
      Origin = 'cxa_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlCaixacxa_codcct: TIntegerField
      FieldName = 'cxa_codcct'
      Origin = 'cxa_codcct'
    end
    object sqlCaixacxa_codusu: TIntegerField
      FieldName = 'cxa_codusu'
      Origin = 'cxa_codusu'
    end
    object sqlCaixacxa_ativo: TStringField
      FieldName = 'cxa_ativo'
      Origin = 'cxa_ativo'
      FixedChar = True
      Size = 1
    end
    object sqlCaixacxa_usuinc: TStringField
      FieldName = 'cxa_usuinc'
      Origin = 'cxa_usuinc'
      Size = 15
    end
    object sqlCaixacxa_datinc: TDateField
      FieldName = 'cxa_datinc'
      Origin = 'cxa_datinc'
    end
    object sqlCaixacxa_horinc: TStringField
      FieldName = 'cxa_horinc'
      Origin = 'cxa_horinc'
      Size = 8
    end
    object sqlCaixacxa_usualt: TStringField
      FieldName = 'cxa_usualt'
      Origin = 'cxa_usualt'
      Size = 15
    end
    object sqlCaixacxa_datalt: TDateField
      FieldName = 'cxa_datalt'
      Origin = 'cxa_datalt'
    end
    object sqlCaixacxa_horalt: TStringField
      FieldName = 'cxa_horalt'
      Origin = 'cxa_horalt'
      Size = 8
    end
    object sqlCaixacct_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cct_codigo'
      Origin = 'cct_codigo'
    end
    object sqlCaixacct_codbco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_codbco'
      Origin = 'cct_codbco'
      Size = 6
    end
    object sqlCaixacct_agencia: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_agencia'
      Origin = 'cct_agencia'
      Size = 9
    end
    object sqlCaixacct_nrconta: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_nrconta'
      Origin = 'cct_nrconta'
      Size = 9
    end
    object sqlCaixacct_codpcd: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_codpcd'
      Origin = 'cct_codpcd'
      Size = 10
    end
    object sqlCaixacct_codpcc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_codpcc'
      Origin = 'cct_codpcc'
      Size = 10
    end
    object sqlCaixacct_telef1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_telef1'
      Origin = 'cct_telef1'
      Size = 12
    end
    object sqlCaixacct_telef2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_telef2'
      Origin = 'cct_telef2'
      Size = 12
    end
    object sqlCaixacct_celula: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_celula'
      Origin = 'cct_celula'
      Size = 12
    end
    object sqlCaixacct_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_usuinc'
      Origin = 'cct_usuinc'
      Size = 15
    end
    object sqlCaixacct_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cct_datinc'
      Origin = 'cct_datinc'
    end
    object sqlCaixacct_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_horinc'
      Origin = 'cct_horinc'
      Size = 8
    end
    object sqlCaixacct_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_usualt'
      Origin = 'cct_usualt'
      Size = 15
    end
    object sqlCaixacct_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cct_datalt'
      Origin = 'cct_datalt'
    end
    object sqlCaixacct_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_horalt'
      Origin = 'cct_horalt'
      Size = 8
    end
    object sqlCaixabco_codigo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bco_codigo'
      Origin = 'bco_codigo'
      Size = 6
    end
    object sqlCaixabco_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bco_nome'
      Origin = 'bco_nome'
      Size = 70
    end
    object sqlCaixabco_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bco_usuinc'
      Origin = 'bco_usuinc'
      Size = 15
    end
    object sqlCaixabco_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'bco_datinc'
      Origin = 'bco_datinc'
    end
    object sqlCaixabco_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bco_horinc'
      Origin = 'bco_horinc'
      Size = 8
    end
    object sqlCaixabco_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bco_usualt'
      Origin = 'bco_usualt'
      Size = 15
    end
    object sqlCaixabco_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'bco_datalt'
      Origin = 'bco_datalt'
    end
    object sqlCaixabco_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bco_horalt'
      Origin = 'bco_horalt'
      Size = 8
    end
  end
  object dspProduto: TDataSetProvider
    DataSet = sqlProduto
    UpdateMode = upWhereKeyOnly
    Left = 720
    Top = 645
  end
  object cliProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    Left = 800
    Top = 645
    object cliProdutopdt_codigo: TIntegerField
      FieldName = 'pdt_codigo'
    end
    object cliProdutopdt_codbar: TStringField
      FieldName = 'pdt_codbar'
      Size = 24
    end
    object cliProdutopdt_codmpr: TIntegerField
      FieldName = 'pdt_codmpr'
    end
    object cliProdutopdt_codctg: TIntegerField
      FieldName = 'pdt_codctg'
    end
    object cliProdutopdt_codfbt: TIntegerField
      FieldName = 'pdt_codfbt'
    end
    object cliProdutopdt_nome: TStringField
      FieldName = 'pdt_nome'
      Size = 50
    end
    object cliProdutopdt_vlrcst: TBCDField
      FieldName = 'pdt_vlrcst'
      Precision = 15
      Size = 2
    end
    object cliProdutopdt_pctluc: TBCDField
      FieldName = 'pdt_pctluc'
      Precision = 5
      Size = 2
    end
    object cliProdutopdt_vlrvnd: TBCDField
      FieldName = 'pdt_vlrvnd'
      Precision = 15
      Size = 2
    end
    object cliProdutopdt_pcticm: TBCDField
      FieldName = 'pdt_pcticm'
      Precision = 5
      Size = 2
    end
    object cliProdutopdt_ncmnfe: TStringField
      FieldName = 'pdt_ncmnfe'
      Size = 10
    end
    object cliProdutopdt_unimed: TStringField
      FieldName = 'pdt_unimed'
      Size = 3
    end
    object cliProdutopdt_estmin: TBCDField
      FieldName = 'pdt_estmin'
      Precision = 15
      Size = 3
    end
    object cliProdutopdt_estoqu: TBCDField
      FieldName = 'pdt_estoqu'
      Precision = 15
      Size = 3
    end
    object cliProdutopdt_ativo: TBooleanField
      FieldName = 'pdt_ativo'
    end
    object cliProdutopdt_usuinc: TStringField
      FieldName = 'pdt_usuinc'
      Size = 15
    end
    object cliProdutopdt_datinc: TDateField
      FieldName = 'pdt_datinc'
    end
    object cliProdutopdt_horinc: TStringField
      FieldName = 'pdt_horinc'
      Size = 8
    end
    object cliProdutopdt_usualt: TStringField
      FieldName = 'pdt_usualt'
      Size = 15
    end
    object cliProdutopdt_datalt: TDateField
      FieldName = 'pdt_datalt'
    end
    object cliProdutopdt_horalt: TStringField
      FieldName = 'pdt_horalt'
      Size = 8
    end
    object cliProdutompr_codigo: TIntegerField
      FieldName = 'mpr_codigo'
    end
    object cliProdutompr_nome: TStringField
      FieldName = 'mpr_nome'
      Size = 40
    end
    object cliProdutompr_usuinc: TStringField
      FieldName = 'mpr_usuinc'
      Size = 15
    end
    object cliProdutompr_datinc: TDateField
      FieldName = 'mpr_datinc'
    end
    object cliProdutompr_horinc: TStringField
      FieldName = 'mpr_horinc'
      Size = 8
    end
    object cliProdutompr_usualt: TStringField
      FieldName = 'mpr_usualt'
      Size = 15
    end
    object cliProdutompr_datalt: TDateField
      FieldName = 'mpr_datalt'
    end
    object cliProdutompr_horalt: TStringField
      FieldName = 'mpr_horalt'
      Size = 8
    end
    object cliProdutoctg_codigo: TIntegerField
      FieldName = 'ctg_codigo'
    end
    object cliProdutoctg_nome: TStringField
      FieldName = 'ctg_nome'
      Size = 40
    end
    object cliProdutoctg_usuinc: TStringField
      FieldName = 'ctg_usuinc'
      Size = 15
    end
    object cliProdutoctg_datinc: TDateField
      FieldName = 'ctg_datinc'
    end
    object cliProdutoctg_horinc: TStringField
      FieldName = 'ctg_horinc'
      Size = 8
    end
    object cliProdutoctg_usualt: TStringField
      FieldName = 'ctg_usualt'
      Size = 15
    end
    object cliProdutoctg_datalt: TDateField
      FieldName = 'ctg_datalt'
    end
    object cliProdutoctg_horalt: TStringField
      FieldName = 'ctg_horalt'
      Size = 8
    end
    object cliProdutofbt_codigo: TIntegerField
      FieldName = 'fbt_codigo'
    end
    object cliProdutofbt_nome: TStringField
      FieldName = 'fbt_nome'
      Size = 40
    end
    object cliProdutofbt_usuinc: TStringField
      FieldName = 'fbt_usuinc'
      Size = 15
    end
    object cliProdutofbt_datinc: TDateField
      FieldName = 'fbt_datinc'
    end
    object cliProdutofbt_horinc: TStringField
      FieldName = 'fbt_horinc'
      Size = 8
    end
    object cliProdutofbt_usualt: TStringField
      FieldName = 'fbt_usualt'
      Size = 15
    end
    object cliProdutofbt_datalt: TDateField
      FieldName = 'fbt_datalt'
    end
    object cliProdutofbt_horalt: TStringField
      FieldName = 'fbt_horalt'
      Size = 8
    end
  end
  object dsProduto: TDataSource
    DataSet = cliProduto
    Left = 872
    Top = 645
  end
  object dspRoteiro: TDataSetProvider
    DataSet = sqlRoteiro
    UpdateMode = upWhereKeyOnly
    Left = 720
    Top = 697
  end
  object cliRoteiro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRoteiro'
    Left = 800
    Top = 697
    object cliRoteirorto_codigo: TIntegerField
      FieldName = 'rto_codigo'
    end
    object cliRoteirorto_nome: TStringField
      FieldName = 'rto_nome'
      Size = 50
    end
    object cliRoteirorto_vlrrot: TBCDField
      FieldName = 'rto_vlrrot'
      Precision = 15
      Size = 2
    end
    object cliRoteirorto_vlrcre: TBCDField
      FieldName = 'rto_vlrcre'
      Precision = 15
      Size = 2
    end
    object cliRoteirorto_vlrcms: TBCDField
      FieldName = 'rto_vlrcms'
      Precision = 15
      Size = 2
    end
    object cliRoteirorto_codpct: TStringField
      FieldName = 'rto_codpct'
      Size = 10
    end
    object cliRoteirorto_usuinc: TStringField
      FieldName = 'rto_usuinc'
      Size = 15
    end
    object cliRoteirorto_datinc: TDateField
      FieldName = 'rto_datinc'
    end
    object cliRoteirorto_horinc: TStringField
      FieldName = 'rto_horinc'
      Size = 8
    end
    object cliRoteirorto_usualt: TStringField
      FieldName = 'rto_usualt'
      Size = 15
    end
    object cliRoteirorto_datalt: TDateField
      FieldName = 'rto_datalt'
    end
    object cliRoteirorto_horalt: TStringField
      FieldName = 'rto_horalt'
      Size = 8
    end
    object cliRoteiropct_codigo: TStringField
      FieldName = 'pct_codigo'
      Size = 10
    end
    object cliRoteiropct_cntmae: TStringField
      FieldName = 'pct_cntmae'
      Size = 10
    end
    object cliRoteiropct_nome: TStringField
      FieldName = 'pct_nome'
      Size = 50
    end
    object cliRoteiropct_natureza: TStringField
      FieldName = 'pct_natureza'
      Size = 1
    end
    object cliRoteiropct_tipo: TStringField
      FieldName = 'pct_tipo'
      Size = 1
    end
    object cliRoteiropct_limite: TBCDField
      FieldName = 'pct_limite'
      Precision = 15
      Size = 2
    end
    object cliRoteiropct_meta: TBCDField
      FieldName = 'pct_meta'
      Precision = 15
      Size = 2
    end
    object cliRoteiropct_ord: TBCDField
      FieldName = 'pct_ord'
      Precision = 1
      Size = 0
    end
    object cliRoteiropct_usuinc: TStringField
      FieldName = 'pct_usuinc'
      Size = 15
    end
    object cliRoteiropct_datinc: TDateField
      FieldName = 'pct_datinc'
    end
    object cliRoteiropct_horinc: TStringField
      FieldName = 'pct_horinc'
      Size = 8
    end
    object cliRoteiropct_usualt: TStringField
      FieldName = 'pct_usualt'
      Size = 15
    end
    object cliRoteiropct_datalt: TDateField
      FieldName = 'pct_datalt'
    end
    object cliRoteiropct_horalt: TStringField
      FieldName = 'pct_horalt'
      Size = 8
    end
  end
  object dsRoteiro: TDataSource
    DataSet = cliRoteiro
    Left = 872
    Top = 697
  end
  object dspChamado: TDataSetProvider
    DataSet = sqlChamado
    UpdateMode = upWhereKeyOnly
    Left = 720
    Top = 751
  end
  object cliChamado: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspChamado'
    Left = 800
    Top = 751
    object cliChamadochd_codigo: TIntegerField
      FieldName = 'chd_codigo'
    end
    object cliChamadochd_nome: TStringField
      FieldName = 'chd_nome'
      Size = 45
    end
    object cliChamadochd_usuinc: TStringField
      FieldName = 'chd_usuinc'
      Size = 15
    end
    object cliChamadochd_datinc: TDateField
      FieldName = 'chd_datinc'
    end
    object cliChamadochd_horinc: TStringField
      FieldName = 'chd_horinc'
      Size = 8
    end
    object cliChamadochd_usualt: TStringField
      FieldName = 'chd_usualt'
      Size = 15
    end
    object cliChamadochd_datalt: TDateField
      FieldName = 'chd_datalt'
    end
    object cliChamadochd_horalt: TStringField
      FieldName = 'chd_horalt'
      Size = 8
    end
  end
  object dsChamado: TDataSource
    DataSet = cliChamado
    Left = 872
    Top = 751
  end
  object dspOricarga: TDataSetProvider
    DataSet = sqlOricarga
    UpdateMode = upWhereKeyOnly
    Left = 720
    Top = 807
  end
  object cliOricarga: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOricarga'
    Left = 800
    Top = 807
    object cliOricargaocg_codigo: TIntegerField
      FieldName = 'ocg_codigo'
    end
    object cliOricargaocg_nome: TStringField
      FieldName = 'ocg_nome'
      Size = 45
    end
    object cliOricargaocg_usuinc: TStringField
      FieldName = 'ocg_usuinc'
      Size = 15
    end
    object cliOricargaocg_datinc: TDateField
      FieldName = 'ocg_datinc'
    end
    object cliOricargaocg_horinc: TStringField
      FieldName = 'ocg_horinc'
      Size = 8
    end
    object cliOricargaocg_usualt: TStringField
      FieldName = 'ocg_usualt'
      Size = 15
    end
    object cliOricargaocg_datalt: TDateField
      FieldName = 'ocg_datalt'
    end
    object cliOricargaocg_horalt: TStringField
      FieldName = 'ocg_horalt'
      Size = 8
    end
  end
  object dsoricarga: TDataSource
    DataSet = cliOricarga
    Left = 872
    Top = 807
  end
  object dspNavio: TDataSetProvider
    DataSet = sqlNavio
    UpdateMode = upWhereKeyOnly
    Left = 720
    Top = 871
  end
  object cliNavio: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNavio'
    Left = 800
    Top = 871
    object cliNavionav_codigo: TIntegerField
      FieldName = 'nav_codigo'
    end
    object cliNavionav_nome: TStringField
      FieldName = 'nav_nome'
      Size = 45
    end
    object cliNavionav_usuinc: TStringField
      FieldName = 'nav_usuinc'
      Size = 15
    end
    object cliNavionav_datinc: TDateField
      FieldName = 'nav_datinc'
    end
    object cliNavionav_horinc: TStringField
      FieldName = 'nav_horinc'
      Size = 8
    end
    object cliNavionav_usualt: TStringField
      FieldName = 'nav_usualt'
      Size = 15
    end
    object cliNavionav_datalt: TDateField
      FieldName = 'nav_datalt'
    end
    object cliNavionav_horalt: TStringField
      FieldName = 'nav_horalt'
      Size = 8
    end
  end
  object dsNavio: TDataSource
    DataSet = cliNavio
    Left = 872
    Top = 871
  end
  object dsptpcontainer: TDataSetProvider
    DataSet = sqltpcontainer
    UpdateMode = upWhereKeyOnly
    Left = 720
    Top = 924
  end
  object clitpcontainer: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsptpcontainer'
    Left = 800
    Top = 924
    object clitpcontainertcn_codigo: TIntegerField
      FieldName = 'tcn_codigo'
    end
    object clitpcontainertcn_nome: TStringField
      FieldName = 'tcn_nome'
      Size = 45
    end
    object clitpcontainertcn_usuinc: TStringField
      FieldName = 'tcn_usuinc'
      Size = 15
    end
    object clitpcontainertcn_datinc: TDateField
      FieldName = 'tcn_datinc'
    end
    object clitpcontainertcn_horinc: TStringField
      FieldName = 'tcn_horinc'
      Size = 8
    end
    object clitpcontainertcn_usualt: TStringField
      FieldName = 'tcn_usualt'
      Size = 15
    end
    object clitpcontainertcn_datalt: TDateField
      FieldName = 'tcn_datalt'
    end
    object clitpcontainertcn_horalt: TStringField
      FieldName = 'tcn_horalt'
      Size = 8
    end
  end
  object dstpcontainer: TDataSource
    DataSet = clitpcontainer
    Left = 872
    Top = 924
  end
  object dsCtecfg: TDataSource
    DataSet = cliCtecfg
    Left = 864
    Top = 979
  end
  object cliCtecfg: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCtecfg'
    Left = 800
    Top = 979
    object cliCtecfgcte_codigo: TIntegerField
      FieldName = 'cte_codigo'
    end
    object cliCtecfgcte_caminho: TStringField
      FieldName = 'cte_caminho'
      Size = 250
    end
    object cliCtecfgcte_senha: TStringField
      FieldName = 'cte_senha'
      Size = 25
    end
    object cliCtecfgcte_numserie: TStringField
      FieldName = 'cte_numserie'
      Size = 50
    end
    object cliCtecfgcte_dacte: TIntegerField
      FieldName = 'cte_dacte'
    end
    object cliCtecfgcte_formaemiss: TIntegerField
      FieldName = 'cte_formaemiss'
    end
    object cliCtecfgcte_logomarca: TStringField
      FieldName = 'cte_logomarca'
      Size = 250
    end
    object cliCtecfgcte_salvar: TBooleanField
      FieldName = 'cte_salvar'
    end
    object cliCtecfgcte_pathsalvar: TStringField
      FieldName = 'cte_pathsalvar'
      Size = 250
    end
    object cliCtecfgcte_uf: TStringField
      FieldName = 'cte_uf'
      Size = 2
    end
    object cliCtecfgcte_ambiente: TIntegerField
      FieldName = 'cte_ambiente'
    end
    object cliCtecfgcte_visualizar: TBooleanField
      FieldName = 'cte_visualizar'
    end
    object cliCtecfgcte_host: TStringField
      FieldName = 'cte_host'
      Size = 30
    end
    object cliCtecfgcte_porta: TStringField
      FieldName = 'cte_porta'
      Size = 8
    end
    object cliCtecfgcte_user: TStringField
      FieldName = 'cte_user'
      Size = 30
    end
    object cliCtecfgcte_pass: TStringField
      FieldName = 'cte_pass'
      Size = 30
    end
    object cliCtecfgcte_cnpj: TStringField
      FieldName = 'cte_cnpj'
      Size = 25
    end
    object cliCtecfgcte_ie: TStringField
      FieldName = 'cte_ie'
      Size = 30
    end
    object cliCtecfgcte_razaosocial: TStringField
      FieldName = 'cte_razaosocial'
      Size = 60
    end
    object cliCtecfgcte_fantasia: TStringField
      FieldName = 'cte_fantasia'
      Size = 60
    end
    object cliCtecfgcte_fone: TStringField
      FieldName = 'cte_fone'
      Size = 12
    end
    object cliCtecfgcte_cep: TStringField
      FieldName = 'cte_cep'
      Size = 10
    end
    object cliCtecfgcte_logradouro: TStringField
      FieldName = 'cte_logradouro'
      Size = 40
    end
    object cliCtecfgcte_numero: TStringField
      FieldName = 'cte_numero'
      Size = 15
    end
    object cliCtecfgcte_complemento: TStringField
      FieldName = 'cte_complemento'
      Size = 25
    end
    object cliCtecfgcte_bairro: TStringField
      FieldName = 'cte_bairro'
      Size = 25
    end
    object cliCtecfgcte_codcidade: TStringField
      FieldName = 'cte_codcidade'
      Size = 10
    end
    object cliCtecfgcte_cidade: TStringField
      FieldName = 'cte_cidade'
      Size = 25
    end
    object cliCtecfgcte_ufemite: TStringField
      FieldName = 'cte_ufemite'
      Size = 2
    end
    object cliCtecfgcte_emahost: TStringField
      FieldName = 'cte_emahost'
      Size = 250
    end
    object cliCtecfgcte_emaport: TStringField
      FieldName = 'cte_emaport'
      Size = 5
    end
    object cliCtecfgcte_emauser: TStringField
      FieldName = 'cte_emauser'
      Size = 50
    end
    object cliCtecfgcte_emapass: TStringField
      FieldName = 'cte_emapass'
      Size = 250
    end
    object cliCtecfgcte_emaassunto: TStringField
      FieldName = 'cte_emaassunto'
      Size = 30
    end
    object cliCtecfgcte_emaassl: TBooleanField
      FieldName = 'cte_emaassl'
    end
    object cliCtecfgcte_mensagem: TStringField
      FieldName = 'cte_mensagem'
      Size = 100
    end
    object cliCtecfgcte_usuinc: TStringField
      FieldName = 'cte_usuinc'
      Size = 15
    end
    object cliCtecfgcte_datinc: TDateField
      FieldName = 'cte_datinc'
    end
    object cliCtecfgcte_horinc: TStringField
      FieldName = 'cte_horinc'
      Size = 8
    end
    object cliCtecfgcte_usualt: TStringField
      FieldName = 'cte_usualt'
      Size = 15
    end
    object cliCtecfgcte_datalt: TDateField
      FieldName = 'cte_datalt'
    end
    object cliCtecfgcte_horalt: TStringField
      FieldName = 'cte_horalt'
      Size = 8
    end
  end
  object dspCtecfg: TDataSetProvider
    DataSet = sqlCtecfg
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 720
    Top = 979
  end
  object sqlPontoAbt: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * from "99999999999999_TESTE".pontoabt'
      
        'LEFT JOIN "99999999999999_TESTE".fornecedor on fnd_codigo =pab_c' +
        'odfnd'
      '')
    Left = 971
    Top = 153
    object sqlPontoAbtpab_codigo: TIntegerField
      FieldName = 'pab_codigo'
      Origin = 'pab_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlPontoAbtpab_ativo: TStringField
      FieldName = 'pab_ativo'
      Origin = 'pab_ativo'
      Size = 3
    end
    object sqlPontoAbtpab_codfnd: TIntegerField
      FieldName = 'pab_codfnd'
      Origin = 'pab_codfnd'
    end
    object sqlPontoAbtpab_nome: TStringField
      FieldName = 'pab_nome'
      Origin = 'pab_nome'
      Size = 50
    end
    object sqlPontoAbtpab_nrcont: TStringField
      FieldName = 'pab_nrcont'
      Origin = 'pab_nrcont'
      Size = 15
    end
    object sqlPontoAbtpab_usuinc: TStringField
      FieldName = 'pab_usuinc'
      Origin = 'pab_usuinc'
      Size = 15
    end
    object sqlPontoAbtpab_datinc: TDateField
      FieldName = 'pab_datinc'
      Origin = 'pab_datinc'
    end
    object sqlPontoAbtpab_horinc: TStringField
      FieldName = 'pab_horinc'
      Origin = 'pab_horinc'
      Size = 8
    end
    object sqlPontoAbtpab_usualt: TStringField
      FieldName = 'pab_usualt'
      Origin = 'pab_usualt'
      Size = 15
    end
    object sqlPontoAbtpab_datalt: TDateField
      FieldName = 'pab_datalt'
      Origin = 'pab_datalt'
    end
    object sqlPontoAbtpab_horalt: TStringField
      FieldName = 'pab_horalt'
      Origin = 'pab_horalt'
      Size = 8
    end
    object sqlPontoAbtfnd_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_codigo'
      Origin = 'fnd_codigo'
    end
    object sqlPontoAbtfnd_ativo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_ativo'
      Origin = 'fnd_ativo'
      Size = 3
    end
    object sqlPontoAbtfnd_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_nome'
      Origin = 'fnd_nome'
      Size = 50
    end
    object sqlPontoAbtfnd_rsocial: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_rsocial'
      Origin = 'fnd_rsocial'
      Size = 50
    end
    object sqlPontoAbtfnd_tipopes: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_tipopes'
      Origin = 'fnd_tipopes'
      Size = 8
    end
    object sqlPontoAbtfnd_cpfcnpj: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_cpfcnpj'
      Origin = 'fnd_cpfcnpj'
      Size = 14
    end
    object sqlPontoAbtfnd_codpct: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_codpct'
      Origin = 'fnd_codpct'
      Size = 10
    end
    object sqlPontoAbtfnd_endereco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_endereco'
      Origin = 'fnd_endereco'
      Size = 35
    end
    object sqlPontoAbtfnd_numend: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_numend'
      Origin = 'fnd_numend'
      Size = 5
    end
    object sqlPontoAbtfnd_complem: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_complem'
      Origin = 'fnd_complem'
      Size = 25
    end
    object sqlPontoAbtfnd_bairro: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_bairro'
      Origin = 'fnd_bairro'
      Size = 50
    end
    object sqlPontoAbtfnd_cep: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_cep'
      Origin = 'fnd_cep'
      Size = 8
    end
    object sqlPontoAbtfnd_codcid: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_codcid'
      Origin = 'fnd_codcid'
    end
    object sqlPontoAbtfnd_telef1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_telef1'
      Origin = 'fnd_telef1'
      Size = 12
    end
    object sqlPontoAbtfnd_telef2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_telef2'
      Origin = 'fnd_telef2'
      Size = 12
    end
    object sqlPontoAbtfnd_celula: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_celula'
      Origin = 'fnd_celula'
      Size = 12
    end
    object sqlPontoAbtfnd_obs: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_obs'
      Origin = 'fnd_obs'
      BlobType = ftMemo
    end
    object sqlPontoAbtfnd_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_usuinc'
      Origin = 'fnd_usuinc'
      Size = 15
    end
    object sqlPontoAbtfnd_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_datinc'
      Origin = 'fnd_datinc'
    end
    object sqlPontoAbtfnd_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_horinc'
      Origin = 'fnd_horinc'
      Size = 8
    end
    object sqlPontoAbtfnd_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_usualt'
      Origin = 'fnd_usualt'
      Size = 15
    end
    object sqlPontoAbtfnd_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_datalt'
      Origin = 'fnd_datalt'
    end
    object sqlPontoAbtfnd_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_horalt'
      Origin = 'fnd_horalt'
      Size = 8
    end
  end
  object sqlProduto: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * from "99999999999999_TESTE".Produto'
      '  LEFT JOIN "dbconfig".materiapri on mpr_codigo = pdt_codmpr'
      #9'LEFT JOIN "dbconfig".categoria on ctg_codigo = pdt_codctg'
      #9'LEFT JOIN "dbconfig".fabricante on fbt_codigo = pdt_codfbt')
    Left = 648
    Top = 646
    object sqlProdutopdt_codigo: TIntegerField
      FieldName = 'pdt_codigo'
      Origin = 'pdt_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlProdutopdt_codbar: TStringField
      FieldName = 'pdt_codbar'
      Origin = 'pdt_codbar'
      Size = 24
    end
    object sqlProdutopdt_codmpr: TIntegerField
      FieldName = 'pdt_codmpr'
      Origin = 'pdt_codmpr'
    end
    object sqlProdutopdt_codctg: TIntegerField
      FieldName = 'pdt_codctg'
      Origin = 'pdt_codctg'
    end
    object sqlProdutopdt_codfbt: TIntegerField
      FieldName = 'pdt_codfbt'
      Origin = 'pdt_codfbt'
    end
    object sqlProdutopdt_nome: TStringField
      FieldName = 'pdt_nome'
      Origin = 'pdt_nome'
      Size = 50
    end
    object sqlProdutopdt_vlrcst: TBCDField
      FieldName = 'pdt_vlrcst'
      Origin = 'pdt_vlrcst'
      Precision = 15
      Size = 2
    end
    object sqlProdutopdt_pctluc: TBCDField
      FieldName = 'pdt_pctluc'
      Origin = 'pdt_pctluc'
      Precision = 5
      Size = 2
    end
    object sqlProdutopdt_vlrvnd: TBCDField
      FieldName = 'pdt_vlrvnd'
      Origin = 'pdt_vlrvnd'
      Precision = 15
      Size = 2
    end
    object sqlProdutopdt_pcticm: TBCDField
      FieldName = 'pdt_pcticm'
      Origin = 'pdt_pcticm'
      Precision = 5
      Size = 2
    end
    object sqlProdutopdt_ncmnfe: TStringField
      FieldName = 'pdt_ncmnfe'
      Origin = 'pdt_ncmnfe'
      Size = 10
    end
    object sqlProdutopdt_unimed: TStringField
      FieldName = 'pdt_unimed'
      Origin = 'pdt_unimed'
      Size = 3
    end
    object sqlProdutopdt_estmin: TBCDField
      FieldName = 'pdt_estmin'
      Origin = 'pdt_estmin'
      Precision = 15
      Size = 3
    end
    object sqlProdutopdt_estoqu: TBCDField
      FieldName = 'pdt_estoqu'
      Origin = 'pdt_estoqu'
      Precision = 15
      Size = 3
    end
    object sqlProdutopdt_ativo: TBooleanField
      FieldName = 'pdt_ativo'
      Origin = 'pdt_ativo'
    end
    object sqlProdutopdt_usuinc: TStringField
      FieldName = 'pdt_usuinc'
      Origin = 'pdt_usuinc'
      Size = 15
    end
    object sqlProdutopdt_datinc: TDateField
      FieldName = 'pdt_datinc'
      Origin = 'pdt_datinc'
    end
    object sqlProdutopdt_horinc: TStringField
      FieldName = 'pdt_horinc'
      Origin = 'pdt_horinc'
      Size = 8
    end
    object sqlProdutopdt_usualt: TStringField
      FieldName = 'pdt_usualt'
      Origin = 'pdt_usualt'
      Size = 15
    end
    object sqlProdutopdt_datalt: TDateField
      FieldName = 'pdt_datalt'
      Origin = 'pdt_datalt'
    end
    object sqlProdutopdt_horalt: TStringField
      FieldName = 'pdt_horalt'
      Origin = 'pdt_horalt'
      Size = 8
    end
    object sqlProdutompr_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'mpr_codigo'
      Origin = 'mpr_codigo'
    end
    object sqlProdutompr_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mpr_nome'
      Origin = 'mpr_nome'
      Size = 40
    end
    object sqlProdutompr_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mpr_usuinc'
      Origin = 'mpr_usuinc'
      Size = 15
    end
    object sqlProdutompr_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'mpr_datinc'
      Origin = 'mpr_datinc'
    end
    object sqlProdutompr_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mpr_horinc'
      Origin = 'mpr_horinc'
      Size = 8
    end
    object sqlProdutompr_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mpr_usualt'
      Origin = 'mpr_usualt'
      Size = 15
    end
    object sqlProdutompr_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'mpr_datalt'
      Origin = 'mpr_datalt'
    end
    object sqlProdutompr_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mpr_horalt'
      Origin = 'mpr_horalt'
      Size = 8
    end
    object sqlProdutoctg_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ctg_codigo'
      Origin = 'ctg_codigo'
    end
    object sqlProdutoctg_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ctg_nome'
      Origin = 'ctg_nome'
      Size = 40
    end
    object sqlProdutoctg_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ctg_usuinc'
      Origin = 'ctg_usuinc'
      Size = 15
    end
    object sqlProdutoctg_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'ctg_datinc'
      Origin = 'ctg_datinc'
    end
    object sqlProdutoctg_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ctg_horinc'
      Origin = 'ctg_horinc'
      Size = 8
    end
    object sqlProdutoctg_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ctg_usualt'
      Origin = 'ctg_usualt'
      Size = 15
    end
    object sqlProdutoctg_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'ctg_datalt'
      Origin = 'ctg_datalt'
    end
    object sqlProdutoctg_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ctg_horalt'
      Origin = 'ctg_horalt'
      Size = 8
    end
    object sqlProdutofbt_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'fbt_codigo'
      Origin = 'fbt_codigo'
    end
    object sqlProdutofbt_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fbt_nome'
      Origin = 'fbt_nome'
      Size = 40
    end
    object sqlProdutofbt_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fbt_usuinc'
      Origin = 'fbt_usuinc'
      Size = 15
    end
    object sqlProdutofbt_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'fbt_datinc'
      Origin = 'fbt_datinc'
    end
    object sqlProdutofbt_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fbt_horinc'
      Origin = 'fbt_horinc'
      Size = 8
    end
    object sqlProdutofbt_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fbt_usualt'
      Origin = 'fbt_usualt'
      Size = 15
    end
    object sqlProdutofbt_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'fbt_datalt'
      Origin = 'fbt_datalt'
    end
    object sqlProdutofbt_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fbt_horalt'
      Origin = 'fbt_horalt'
      Size = 8
    end
  end
  object sqlRoteiro: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * from "99999999999999_TESTE".roteiro'
      'LEFT JOIN "dbconfig".pconta on pct_codigo = rto_codpct ')
    Left = 648
    Top = 700
    object sqlRoteirorto_codigo: TIntegerField
      FieldName = 'rto_codigo'
      Origin = 'rto_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlRoteirorto_nome: TStringField
      FieldName = 'rto_nome'
      Origin = 'rto_nome'
      Size = 50
    end
    object sqlRoteirorto_vlrrot: TBCDField
      FieldName = 'rto_vlrrot'
      Origin = 'rto_vlrrot'
      Precision = 15
      Size = 2
    end
    object sqlRoteirorto_vlrcre: TBCDField
      FieldName = 'rto_vlrcre'
      Origin = 'rto_vlrcre'
      Precision = 15
      Size = 2
    end
    object sqlRoteirorto_vlrcms: TBCDField
      FieldName = 'rto_vlrcms'
      Origin = 'rto_vlrcms'
      Precision = 15
      Size = 2
    end
    object sqlRoteirorto_codpct: TStringField
      FieldName = 'rto_codpct'
      Origin = 'rto_codpct'
      Size = 10
    end
    object sqlRoteirorto_usuinc: TStringField
      FieldName = 'rto_usuinc'
      Origin = 'rto_usuinc'
      Size = 15
    end
    object sqlRoteirorto_datinc: TDateField
      FieldName = 'rto_datinc'
      Origin = 'rto_datinc'
    end
    object sqlRoteirorto_horinc: TStringField
      FieldName = 'rto_horinc'
      Origin = 'rto_horinc'
      Size = 8
    end
    object sqlRoteirorto_usualt: TStringField
      FieldName = 'rto_usualt'
      Origin = 'rto_usualt'
      Size = 15
    end
    object sqlRoteirorto_datalt: TDateField
      FieldName = 'rto_datalt'
      Origin = 'rto_datalt'
    end
    object sqlRoteirorto_horalt: TStringField
      FieldName = 'rto_horalt'
      Origin = 'rto_horalt'
      Size = 8
    end
    object sqlRoteiropct_codigo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_codigo'
      Origin = 'pct_codigo'
      Size = 10
    end
    object sqlRoteiropct_cntmae: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_cntmae'
      Origin = 'pct_cntmae'
      Size = 10
    end
    object sqlRoteiropct_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_nome'
      Origin = 'pct_nome'
      Size = 50
    end
    object sqlRoteiropct_natureza: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_natureza'
      Origin = 'pct_natureza'
      Size = 1
    end
    object sqlRoteiropct_tipo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_tipo'
      Origin = 'pct_tipo'
      Size = 1
    end
    object sqlRoteiropct_limite: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'pct_limite'
      Origin = 'pct_limite'
      Precision = 15
      Size = 2
    end
    object sqlRoteiropct_meta: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'pct_meta'
      Origin = 'pct_meta'
      Precision = 15
      Size = 2
    end
    object sqlRoteiropct_ord: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'pct_ord'
      Origin = 'pct_ord'
      Precision = 1
      Size = 0
    end
    object sqlRoteiropct_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_usuinc'
      Origin = 'pct_usuinc'
      Size = 15
    end
    object sqlRoteiropct_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pct_datinc'
      Origin = 'pct_datinc'
    end
    object sqlRoteiropct_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_horinc'
      Origin = 'pct_horinc'
      Size = 8
    end
    object sqlRoteiropct_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_usualt'
      Origin = 'pct_usualt'
      Size = 15
    end
    object sqlRoteiropct_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pct_datalt'
      Origin = 'pct_datalt'
    end
    object sqlRoteiropct_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pct_horalt'
      Origin = 'pct_horalt'
      Size = 8
    end
  end
  object sqlChamado: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * from "99999999999999_TESTE".chamado')
    Left = 648
    Top = 754
    object sqlChamadochd_codigo: TIntegerField
      FieldName = 'chd_codigo'
      Origin = 'chd_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlChamadochd_nome: TStringField
      FieldName = 'chd_nome'
      Origin = 'chd_nome'
      Size = 45
    end
    object sqlChamadochd_usuinc: TStringField
      FieldName = 'chd_usuinc'
      Origin = 'chd_usuinc'
      Size = 15
    end
    object sqlChamadochd_datinc: TDateField
      FieldName = 'chd_datinc'
      Origin = 'chd_datinc'
    end
    object sqlChamadochd_horinc: TStringField
      FieldName = 'chd_horinc'
      Origin = 'chd_horinc'
      Size = 8
    end
    object sqlChamadochd_usualt: TStringField
      FieldName = 'chd_usualt'
      Origin = 'chd_usualt'
      Size = 15
    end
    object sqlChamadochd_datalt: TDateField
      FieldName = 'chd_datalt'
      Origin = 'chd_datalt'
    end
    object sqlChamadochd_horalt: TStringField
      FieldName = 'chd_horalt'
      Origin = 'chd_horalt'
      Size = 8
    end
  end
  object sqlOricarga: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * from "99999999999999_TESTE".oricarga')
    Left = 648
    Top = 810
    object sqlOricargaocg_codigo: TIntegerField
      FieldName = 'ocg_codigo'
      Origin = 'ocg_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlOricargaocg_nome: TStringField
      FieldName = 'ocg_nome'
      Origin = 'ocg_nome'
      Size = 45
    end
    object sqlOricargaocg_usuinc: TStringField
      FieldName = 'ocg_usuinc'
      Origin = 'ocg_usuinc'
      Size = 15
    end
    object sqlOricargaocg_datinc: TDateField
      FieldName = 'ocg_datinc'
      Origin = 'ocg_datinc'
    end
    object sqlOricargaocg_horinc: TStringField
      FieldName = 'ocg_horinc'
      Origin = 'ocg_horinc'
      Size = 8
    end
    object sqlOricargaocg_usualt: TStringField
      FieldName = 'ocg_usualt'
      Origin = 'ocg_usualt'
      Size = 15
    end
    object sqlOricargaocg_datalt: TDateField
      FieldName = 'ocg_datalt'
      Origin = 'ocg_datalt'
    end
    object sqlOricargaocg_horalt: TStringField
      FieldName = 'ocg_horalt'
      Origin = 'ocg_horalt'
      Size = 8
    end
  end
  object sqlNavio: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * from "99999999999999_TESTE".Navio')
    Left = 648
    Top = 866
    object sqlNavionav_codigo: TIntegerField
      FieldName = 'nav_codigo'
      Origin = 'nav_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlNavionav_nome: TStringField
      FieldName = 'nav_nome'
      Origin = 'nav_nome'
      Size = 45
    end
    object sqlNavionav_usuinc: TStringField
      FieldName = 'nav_usuinc'
      Origin = 'nav_usuinc'
      Size = 15
    end
    object sqlNavionav_datinc: TDateField
      FieldName = 'nav_datinc'
      Origin = 'nav_datinc'
    end
    object sqlNavionav_horinc: TStringField
      FieldName = 'nav_horinc'
      Origin = 'nav_horinc'
      Size = 8
    end
    object sqlNavionav_usualt: TStringField
      FieldName = 'nav_usualt'
      Origin = 'nav_usualt'
      Size = 15
    end
    object sqlNavionav_datalt: TDateField
      FieldName = 'nav_datalt'
      Origin = 'nav_datalt'
    end
    object sqlNavionav_horalt: TStringField
      FieldName = 'nav_horalt'
      Origin = 'nav_horalt'
      Size = 8
    end
  end
  object sqltpcontainer: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * from "99999999999999_TESTE".tpcontainer')
    Left = 648
    Top = 923
    object sqltpcontainertcn_codigo: TIntegerField
      FieldName = 'tcn_codigo'
      Origin = 'tcn_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqltpcontainertcn_nome: TStringField
      FieldName = 'tcn_nome'
      Origin = 'tcn_nome'
      Size = 45
    end
    object sqltpcontainertcn_usuinc: TStringField
      FieldName = 'tcn_usuinc'
      Origin = 'tcn_usuinc'
      Size = 15
    end
    object sqltpcontainertcn_datinc: TDateField
      FieldName = 'tcn_datinc'
      Origin = 'tcn_datinc'
    end
    object sqltpcontainertcn_horinc: TStringField
      FieldName = 'tcn_horinc'
      Origin = 'tcn_horinc'
      Size = 8
    end
    object sqltpcontainertcn_usualt: TStringField
      FieldName = 'tcn_usualt'
      Origin = 'tcn_usualt'
      Size = 15
    end
    object sqltpcontainertcn_datalt: TDateField
      FieldName = 'tcn_datalt'
      Origin = 'tcn_datalt'
    end
    object sqltpcontainertcn_horalt: TStringField
      FieldName = 'tcn_horalt'
      Origin = 'tcn_horalt'
      Size = 8
    end
  end
  object sqlCtecfg: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * From "99999999999999_TESTE".cfgcte')
    Left = 648
    Top = 979
    object sqlCtecfgcte_codigo: TIntegerField
      FieldName = 'cte_codigo'
      Origin = 'cte_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlCtecfgcte_caminho: TStringField
      FieldName = 'cte_caminho'
      Origin = 'cte_caminho'
      Size = 250
    end
    object sqlCtecfgcte_senha: TStringField
      FieldName = 'cte_senha'
      Origin = 'cte_senha'
      Size = 25
    end
    object sqlCtecfgcte_numserie: TStringField
      FieldName = 'cte_numserie'
      Origin = 'cte_numserie'
      Size = 50
    end
    object sqlCtecfgcte_dacte: TIntegerField
      FieldName = 'cte_dacte'
      Origin = 'cte_dacte'
    end
    object sqlCtecfgcte_formaemiss: TIntegerField
      FieldName = 'cte_formaemiss'
      Origin = 'cte_formaemiss'
    end
    object sqlCtecfgcte_logomarca: TStringField
      FieldName = 'cte_logomarca'
      Origin = 'cte_logomarca'
      Size = 250
    end
    object sqlCtecfgcte_salvar: TBooleanField
      FieldName = 'cte_salvar'
      Origin = 'cte_salvar'
    end
    object sqlCtecfgcte_pathsalvar: TStringField
      FieldName = 'cte_pathsalvar'
      Origin = 'cte_pathsalvar'
      Size = 250
    end
    object sqlCtecfgcte_uf: TStringField
      FieldName = 'cte_uf'
      Origin = 'cte_uf'
      Size = 2
    end
    object sqlCtecfgcte_ambiente: TIntegerField
      FieldName = 'cte_ambiente'
      Origin = 'cte_ambiente'
    end
    object sqlCtecfgcte_visualizar: TBooleanField
      FieldName = 'cte_visualizar'
      Origin = 'cte_visualizar'
    end
    object sqlCtecfgcte_host: TStringField
      FieldName = 'cte_host'
      Origin = 'cte_host'
      Size = 30
    end
    object sqlCtecfgcte_porta: TStringField
      FieldName = 'cte_porta'
      Origin = 'cte_porta'
      Size = 8
    end
    object sqlCtecfgcte_user: TStringField
      FieldName = 'cte_user'
      Origin = 'cte_user'
      Size = 30
    end
    object sqlCtecfgcte_pass: TStringField
      FieldName = 'cte_pass'
      Origin = 'cte_pass'
      Size = 30
    end
    object sqlCtecfgcte_cnpj: TStringField
      FieldName = 'cte_cnpj'
      Origin = 'cte_cnpj'
      Size = 25
    end
    object sqlCtecfgcte_ie: TStringField
      FieldName = 'cte_ie'
      Origin = 'cte_ie'
      Size = 30
    end
    object sqlCtecfgcte_razaosocial: TStringField
      FieldName = 'cte_razaosocial'
      Origin = 'cte_razaosocial'
      Size = 60
    end
    object sqlCtecfgcte_fantasia: TStringField
      FieldName = 'cte_fantasia'
      Origin = 'cte_fantasia'
      Size = 60
    end
    object sqlCtecfgcte_fone: TStringField
      FieldName = 'cte_fone'
      Origin = 'cte_fone'
      Size = 12
    end
    object sqlCtecfgcte_cep: TStringField
      FieldName = 'cte_cep'
      Origin = 'cte_cep'
      Size = 10
    end
    object sqlCtecfgcte_logradouro: TStringField
      FieldName = 'cte_logradouro'
      Origin = 'cte_logradouro'
      Size = 40
    end
    object sqlCtecfgcte_numero: TStringField
      FieldName = 'cte_numero'
      Origin = 'cte_numero'
      Size = 15
    end
    object sqlCtecfgcte_complemento: TStringField
      FieldName = 'cte_complemento'
      Origin = 'cte_complemento'
      Size = 25
    end
    object sqlCtecfgcte_bairro: TStringField
      FieldName = 'cte_bairro'
      Origin = 'cte_bairro'
      Size = 25
    end
    object sqlCtecfgcte_codcidade: TStringField
      FieldName = 'cte_codcidade'
      Origin = 'cte_codcidade'
      Size = 10
    end
    object sqlCtecfgcte_cidade: TStringField
      FieldName = 'cte_cidade'
      Origin = 'cte_cidade'
      Size = 25
    end
    object sqlCtecfgcte_ufemite: TStringField
      FieldName = 'cte_ufemite'
      Origin = 'cte_ufemite'
      Size = 2
    end
    object sqlCtecfgcte_emahost: TStringField
      FieldName = 'cte_emahost'
      Origin = 'cte_emahost'
      Size = 250
    end
    object sqlCtecfgcte_emaport: TStringField
      FieldName = 'cte_emaport'
      Origin = 'cte_emaport'
      Size = 5
    end
    object sqlCtecfgcte_emauser: TStringField
      FieldName = 'cte_emauser'
      Origin = 'cte_emauser'
      Size = 50
    end
    object sqlCtecfgcte_emapass: TStringField
      FieldName = 'cte_emapass'
      Origin = 'cte_emapass'
      Size = 250
    end
    object sqlCtecfgcte_emaassunto: TStringField
      FieldName = 'cte_emaassunto'
      Origin = 'cte_emaassunto'
      Size = 30
    end
    object sqlCtecfgcte_emaassl: TBooleanField
      FieldName = 'cte_emaassl'
      Origin = 'cte_emaassl'
    end
    object sqlCtecfgcte_mensagem: TStringField
      FieldName = 'cte_mensagem'
      Origin = 'cte_mensagem'
      Size = 100
    end
    object sqlCtecfgcte_usuinc: TStringField
      FieldName = 'cte_usuinc'
      Origin = 'cte_usuinc'
      Size = 15
    end
    object sqlCtecfgcte_datinc: TDateField
      FieldName = 'cte_datinc'
      Origin = 'cte_datinc'
    end
    object sqlCtecfgcte_horinc: TStringField
      FieldName = 'cte_horinc'
      Origin = 'cte_horinc'
      Size = 8
    end
    object sqlCtecfgcte_usualt: TStringField
      FieldName = 'cte_usualt'
      Origin = 'cte_usualt'
      Size = 15
    end
    object sqlCtecfgcte_datalt: TDateField
      FieldName = 'cte_datalt'
      Origin = 'cte_datalt'
    end
    object sqlCtecfgcte_horalt: TStringField
      FieldName = 'cte_horalt'
      Origin = 'cte_horalt'
      Size = 8
    end
  end
  object dspPontoAbt: TDataSetProvider
    DataSet = sqlPontoAbt
    UpdateMode = upWhereKeyOnly
    Left = 1048
    Top = 152
  end
  object cliPontoAbt: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPontoAbt'
    Left = 1128
    Top = 152
    object cliPontoAbtpab_codigo: TIntegerField
      FieldName = 'pab_codigo'
    end
    object cliPontoAbtpab_ativo: TStringField
      FieldName = 'pab_ativo'
      Size = 3
    end
    object cliPontoAbtpab_codfnd: TIntegerField
      FieldName = 'pab_codfnd'
    end
    object cliPontoAbtpab_nome: TStringField
      FieldName = 'pab_nome'
      Size = 50
    end
    object cliPontoAbtpab_nrcont: TStringField
      FieldName = 'pab_nrcont'
      Size = 15
    end
    object cliPontoAbtpab_usuinc: TStringField
      FieldName = 'pab_usuinc'
      Size = 15
    end
    object cliPontoAbtpab_datinc: TDateField
      FieldName = 'pab_datinc'
    end
    object cliPontoAbtpab_horinc: TStringField
      FieldName = 'pab_horinc'
      Size = 8
    end
    object cliPontoAbtpab_usualt: TStringField
      FieldName = 'pab_usualt'
      Size = 15
    end
    object cliPontoAbtpab_datalt: TDateField
      FieldName = 'pab_datalt'
    end
    object cliPontoAbtpab_horalt: TStringField
      FieldName = 'pab_horalt'
      Size = 8
    end
    object cliPontoAbtfnd_codigo: TIntegerField
      FieldName = 'fnd_codigo'
    end
    object cliPontoAbtfnd_ativo: TStringField
      FieldName = 'fnd_ativo'
      Size = 3
    end
    object cliPontoAbtfnd_nome: TStringField
      FieldName = 'fnd_nome'
      Size = 50
    end
    object cliPontoAbtfnd_rsocial: TStringField
      FieldName = 'fnd_rsocial'
      Size = 50
    end
    object cliPontoAbtfnd_tipopes: TStringField
      FieldName = 'fnd_tipopes'
      Size = 8
    end
    object cliPontoAbtfnd_cpfcnpj: TStringField
      FieldName = 'fnd_cpfcnpj'
      Size = 14
    end
    object cliPontoAbtfnd_codpct: TStringField
      FieldName = 'fnd_codpct'
      Size = 10
    end
    object cliPontoAbtfnd_endereco: TStringField
      FieldName = 'fnd_endereco'
      Size = 35
    end
    object cliPontoAbtfnd_numend: TStringField
      FieldName = 'fnd_numend'
      Size = 5
    end
    object cliPontoAbtfnd_complem: TStringField
      FieldName = 'fnd_complem'
      Size = 25
    end
    object cliPontoAbtfnd_bairro: TStringField
      FieldName = 'fnd_bairro'
      Size = 50
    end
    object cliPontoAbtfnd_cep: TStringField
      FieldName = 'fnd_cep'
      Size = 8
    end
    object cliPontoAbtfnd_codcid: TIntegerField
      FieldName = 'fnd_codcid'
    end
    object cliPontoAbtfnd_telef1: TStringField
      FieldName = 'fnd_telef1'
      Size = 12
    end
    object cliPontoAbtfnd_telef2: TStringField
      FieldName = 'fnd_telef2'
      Size = 12
    end
    object cliPontoAbtfnd_celula: TStringField
      FieldName = 'fnd_celula'
      Size = 12
    end
    object cliPontoAbtfnd_obs: TMemoField
      FieldName = 'fnd_obs'
      BlobType = ftMemo
    end
    object cliPontoAbtfnd_usuinc: TStringField
      FieldName = 'fnd_usuinc'
      Size = 15
    end
    object cliPontoAbtfnd_datinc: TDateField
      FieldName = 'fnd_datinc'
    end
    object cliPontoAbtfnd_horinc: TStringField
      FieldName = 'fnd_horinc'
      Size = 8
    end
    object cliPontoAbtfnd_usualt: TStringField
      FieldName = 'fnd_usualt'
      Size = 15
    end
    object cliPontoAbtfnd_datalt: TDateField
      FieldName = 'fnd_datalt'
    end
    object cliPontoAbtfnd_horalt: TStringField
      FieldName = 'fnd_horalt'
      Size = 8
    end
  end
  object dsPontoAbt: TDataSource
    DataSet = cliPontoAbt
    Left = 1200
    Top = 152
  end
  object dspPontoAbti: TDataSetProvider
    DataSet = sqlPontoAbti
    UpdateMode = upWhereKeyOnly
    Left = 1044
    Top = 208
  end
  object cliPontoAbti: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPontoAbti'
    Left = 1124
    Top = 208
    object cliPontoAbtiiab_codigo: TIntegerField
      FieldName = 'iab_codigo'
    end
    object cliPontoAbtiiab_codpab: TIntegerField
      FieldName = 'iab_codpab'
    end
    object cliPontoAbtiiab_codcmb: TIntegerField
      FieldName = 'iab_codcmb'
    end
    object cliPontoAbtiiab_ltsvlr: TBCDField
      FieldName = 'iab_ltsvlr'
      Precision = 15
      Size = 3
    end
    object cliPontoAbtiiab_qltmin: TBCDField
      FieldName = 'iab_qltmin'
      Precision = 15
      Size = 3
    end
    object cliPontoAbtiiab_qltest: TBCDField
      FieldName = 'iab_qltest'
      Precision = 15
      Size = 3
    end
    object cliPontoAbtiiab_contrato: TStringField
      FieldName = 'iab_contrato'
      Size = 15
    end
    object cliPontoAbtiiab_usuinc: TStringField
      FieldName = 'iab_usuinc'
      Size = 15
    end
    object cliPontoAbtiiab_datini: TDateField
      FieldName = 'iab_datini'
    end
    object cliPontoAbtiiab_datfin: TDateField
      FieldName = 'iab_datfin'
    end
    object cliPontoAbtiiab_datinc: TDateField
      FieldName = 'iab_datinc'
    end
    object cliPontoAbtiiab_horinc: TStringField
      FieldName = 'iab_horinc'
      Size = 8
    end
    object cliPontoAbtiiab_usualt: TStringField
      FieldName = 'iab_usualt'
      Size = 15
    end
    object cliPontoAbtiiab_datalt: TDateField
      FieldName = 'iab_datalt'
    end
    object cliPontoAbtiiab_horalt: TStringField
      FieldName = 'iab_horalt'
      Size = 8
    end
    object cliPontoAbtipab_codigo: TIntegerField
      FieldName = 'pab_codigo'
    end
    object cliPontoAbtipab_ativo: TStringField
      FieldName = 'pab_ativo'
      Size = 3
    end
    object cliPontoAbtipab_codfnd: TIntegerField
      FieldName = 'pab_codfnd'
    end
    object cliPontoAbtipab_nome: TStringField
      FieldName = 'pab_nome'
      Size = 50
    end
    object cliPontoAbtipab_nrcont: TStringField
      FieldName = 'pab_nrcont'
      Size = 15
    end
    object cliPontoAbtipab_usuinc: TStringField
      FieldName = 'pab_usuinc'
      Size = 15
    end
    object cliPontoAbtipab_datinc: TDateField
      FieldName = 'pab_datinc'
    end
    object cliPontoAbtipab_horinc: TStringField
      FieldName = 'pab_horinc'
      Size = 8
    end
    object cliPontoAbtipab_usualt: TStringField
      FieldName = 'pab_usualt'
      Size = 15
    end
    object cliPontoAbtipab_datalt: TDateField
      FieldName = 'pab_datalt'
    end
    object cliPontoAbtipab_horalt: TStringField
      FieldName = 'pab_horalt'
      Size = 8
    end
    object cliPontoAbticmb_codigo: TIntegerField
      FieldName = 'cmb_codigo'
    end
    object cliPontoAbticmb_nome: TStringField
      FieldName = 'cmb_nome'
    end
    object cliPontoAbticmb_usuinc: TStringField
      FieldName = 'cmb_usuinc'
      Size = 15
    end
    object cliPontoAbticmb_datinc: TDateField
      FieldName = 'cmb_datinc'
    end
    object cliPontoAbticmb_horinc: TStringField
      FieldName = 'cmb_horinc'
      Size = 8
    end
    object cliPontoAbticmb_usualt: TStringField
      FieldName = 'cmb_usualt'
      Size = 15
    end
    object cliPontoAbticmb_datalt: TDateField
      FieldName = 'cmb_datalt'
    end
    object cliPontoAbticmb_horalt: TStringField
      FieldName = 'cmb_horalt'
      Size = 8
    end
  end
  object dsPontoAbti: TDataSource
    DataSet = cliPontoAbt
    Left = 1196
    Top = 208
  end
  object dspAbrCaixa: TDataSetProvider
    DataSet = sqlAbrCaixa
    UpdateMode = upWhereKeyOnly
    Left = 1046
    Top = 264
  end
  object cliAbrCaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAbrCaixa'
    Left = 1126
    Top = 264
    object cliAbrCaixaabc_codigo: TIntegerField
      FieldName = 'abc_codigo'
    end
    object cliAbrCaixaabc_codcxa: TIntegerField
      FieldName = 'abc_codcxa'
    end
    object cliAbrCaixaabc_codcct: TIntegerField
      FieldName = 'abc_codcct'
    end
    object cliAbrCaixaabc_databr: TDateField
      FieldName = 'abc_databr'
    end
    object cliAbrCaixaabc_datfch: TDateField
      FieldName = 'abc_datfch'
    end
    object cliAbrCaixaabc_vlrini: TBCDField
      FieldName = 'abc_vlrini'
      Precision = 15
      Size = 2
    end
    object cliAbrCaixaabc_vlrant: TBCDField
      FieldName = 'abc_vlrant'
      Precision = 15
      Size = 2
    end
    object cliAbrCaixaabc_vlratu: TBCDField
      FieldName = 'abc_vlratu'
      Precision = 15
      Size = 2
    end
    object cliAbrCaixaabc_usuinc: TStringField
      FieldName = 'abc_usuinc'
      Size = 15
    end
    object cliAbrCaixaabc_datinc: TDateField
      FieldName = 'abc_datinc'
    end
    object cliAbrCaixaabc_horinc: TStringField
      FieldName = 'abc_horinc'
      Size = 8
    end
    object cliAbrCaixaabc_usualt: TStringField
      FieldName = 'abc_usualt'
      Size = 15
    end
    object cliAbrCaixaabc_datalt: TDateField
      FieldName = 'abc_datalt'
    end
    object cliAbrCaixaabc_horalt: TStringField
      FieldName = 'abc_horalt'
      Size = 8
    end
    object cliAbrCaixacxa_codigo: TIntegerField
      FieldName = 'cxa_codigo'
    end
    object cliAbrCaixacxa_codcct: TIntegerField
      FieldName = 'cxa_codcct'
    end
    object cliAbrCaixacxa_codusu: TIntegerField
      FieldName = 'cxa_codusu'
    end
    object cliAbrCaixacxa_ativo: TStringField
      FieldName = 'cxa_ativo'
      FixedChar = True
      Size = 1
    end
    object cliAbrCaixacxa_usuinc: TStringField
      FieldName = 'cxa_usuinc'
      Size = 15
    end
    object cliAbrCaixacxa_datinc: TDateField
      FieldName = 'cxa_datinc'
    end
    object cliAbrCaixacxa_horinc: TStringField
      FieldName = 'cxa_horinc'
      Size = 8
    end
    object cliAbrCaixacxa_usualt: TStringField
      FieldName = 'cxa_usualt'
      Size = 15
    end
    object cliAbrCaixacxa_datalt: TDateField
      FieldName = 'cxa_datalt'
    end
    object cliAbrCaixacxa_horalt: TStringField
      FieldName = 'cxa_horalt'
      Size = 8
    end
    object cliAbrCaixacct_codigo: TIntegerField
      FieldName = 'cct_codigo'
    end
    object cliAbrCaixacct_codbco: TStringField
      FieldName = 'cct_codbco'
      Size = 6
    end
    object cliAbrCaixacct_agencia: TStringField
      FieldName = 'cct_agencia'
      Size = 9
    end
    object cliAbrCaixacct_nrconta: TStringField
      FieldName = 'cct_nrconta'
      Size = 9
    end
    object cliAbrCaixacct_codpcd: TStringField
      FieldName = 'cct_codpcd'
      Size = 10
    end
    object cliAbrCaixacct_codpcc: TStringField
      FieldName = 'cct_codpcc'
      Size = 10
    end
    object cliAbrCaixacct_telef1: TStringField
      FieldName = 'cct_telef1'
      Size = 12
    end
    object cliAbrCaixacct_telef2: TStringField
      FieldName = 'cct_telef2'
      Size = 12
    end
    object cliAbrCaixacct_celula: TStringField
      FieldName = 'cct_celula'
      Size = 12
    end
    object cliAbrCaixacct_usuinc: TStringField
      FieldName = 'cct_usuinc'
      Size = 15
    end
    object cliAbrCaixacct_datinc: TDateField
      FieldName = 'cct_datinc'
    end
    object cliAbrCaixacct_horinc: TStringField
      FieldName = 'cct_horinc'
      Size = 8
    end
    object cliAbrCaixacct_usualt: TStringField
      FieldName = 'cct_usualt'
      Size = 15
    end
    object cliAbrCaixacct_datalt: TDateField
      FieldName = 'cct_datalt'
    end
    object cliAbrCaixacct_horalt: TStringField
      FieldName = 'cct_horalt'
      Size = 8
    end
    object cliAbrCaixabco_codigo: TStringField
      FieldName = 'bco_codigo'
      Size = 6
    end
    object cliAbrCaixabco_nome: TStringField
      FieldName = 'bco_nome'
      Size = 70
    end
    object cliAbrCaixabco_usuinc: TStringField
      FieldName = 'bco_usuinc'
      Size = 15
    end
    object cliAbrCaixabco_datinc: TDateField
      FieldName = 'bco_datinc'
    end
    object cliAbrCaixabco_horinc: TStringField
      FieldName = 'bco_horinc'
      Size = 8
    end
    object cliAbrCaixabco_usualt: TStringField
      FieldName = 'bco_usualt'
      Size = 15
    end
    object cliAbrCaixabco_datalt: TDateField
      FieldName = 'bco_datalt'
    end
    object cliAbrCaixabco_horalt: TStringField
      FieldName = 'bco_horalt'
      Size = 8
    end
    object cliAbrCaixausu_codusu: TIntegerField
      FieldName = 'usu_codusu'
    end
    object cliAbrCaixausu_nome: TStringField
      FieldName = 'usu_nome'
      Size = 50
    end
    object cliAbrCaixausu_login: TStringField
      FieldName = 'usu_login'
      Size = 15
    end
    object cliAbrCaixausu_senha: TStringField
      FieldName = 'usu_senha'
      Size = 10
    end
    object cliAbrCaixausu_codgru: TIntegerField
      FieldName = 'usu_codgru'
    end
    object cliAbrCaixausu_codsgr: TIntegerField
      FieldName = 'usu_codsgr'
    end
    object cliAbrCaixausu_codltd: TIntegerField
      FieldName = 'usu_codltd'
    end
    object cliAbrCaixausu_email: TStringField
      FieldName = 'usu_email'
      Size = 100
    end
    object cliAbrCaixausu_usuario: TStringField
      FieldName = 'usu_usuario'
      Size = 100
    end
    object cliAbrCaixausu_senema: TStringField
      FieldName = 'usu_senema'
    end
    object cliAbrCaixausu_smtp: TStringField
      FieldName = 'usu_smtp'
      Size = 100
    end
    object cliAbrCaixausu_porta: TStringField
      FieldName = 'usu_porta'
      Size = 5
    end
    object cliAbrCaixausu_tsl: TStringField
      FieldName = 'usu_tsl'
      Size = 15
    end
    object cliAbrCaixausu_metodo: TStringField
      FieldName = 'usu_metodo'
      Size = 15
    end
    object cliAbrCaixausu_modseg: TStringField
      FieldName = 'usu_modseg'
      FixedChar = True
      Size = 1
    end
    object cliAbrCaixausu_autent: TStringField
      FieldName = 'usu_autent'
      FixedChar = True
      Size = 1
    end
    object cliAbrCaixausu_foto: TBlobField
      FieldName = 'usu_foto'
    end
    object cliAbrCaixausu_database: TStringField
      FieldName = 'usu_database'
      Size = 70
    end
    object cliAbrCaixausu_autoriza: TBooleanField
      FieldName = 'usu_autoriza'
    end
    object cliAbrCaixausu_usuinc: TStringField
      FieldName = 'usu_usuinc'
      Size = 15
    end
    object cliAbrCaixausu_datinc: TDateField
      FieldName = 'usu_datinc'
    end
    object cliAbrCaixausu_horinc: TStringField
      FieldName = 'usu_horinc'
      Size = 8
    end
    object cliAbrCaixausu_usualt: TStringField
      FieldName = 'usu_usualt'
      Size = 15
    end
    object cliAbrCaixausu_datalt: TDateField
      FieldName = 'usu_datalt'
    end
    object cliAbrCaixausu_horalt: TStringField
      FieldName = 'usu_horalt'
      Size = 8
    end
  end
  object dsAbrCaixa: TDataSource
    DataSet = cliAbrCaixa
    Left = 1198
    Top = 264
  end
  object dspCtapg: TDataSetProvider
    DataSet = sqlCtapg
    UpdateMode = upWhereKeyOnly
    Left = 1046
    Top = 320
  end
  object cliCtapg: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCtapg'
    Left = 1126
    Top = 320
    object cliCtapgcfr_codigo: TIntegerField
      FieldName = 'cfr_codigo'
    end
    object cliCtapgcfr_numdoc: TStringField
      FieldName = 'cfr_numdoc'
      Size = 24
    end
    object cliCtapgcfr_codant: TIntegerField
      FieldName = 'cfr_codant'
    end
    object cliCtapgcfr_codfnd: TIntegerField
      FieldName = 'cfr_codfnd'
    end
    object cliCtapgcfr_codpss: TIntegerField
      FieldName = 'cfr_codpss'
    end
    object cliCtapgcfr_codcli: TIntegerField
      FieldName = 'cfr_codcli'
    end
    object cliCtapgcfr_codpct: TStringField
      FieldName = 'cfr_codpct'
      Size = 10
    end
    object cliCtapgcfr_descri: TStringField
      FieldName = 'cfr_descri'
      Size = 100
    end
    object cliCtapgcfr_datems: TDateField
      FieldName = 'cfr_datems'
    end
    object cliCtapgcfr_datven: TDateField
      FieldName = 'cfr_datven'
    end
    object cliCtapgcfr_totpar: TStringField
      FieldName = 'cfr_totpar'
      Size = 3
    end
    object cliCtapgcfr_vlrapg: TBCDField
      FieldName = 'cfr_vlrapg'
      Precision = 15
      Size = 2
    end
    object cliCtapgcfr_vlrdes: TBCDField
      FieldName = 'cfr_vlrdes'
      Precision = 15
      Size = 2
    end
    object cliCtapgcfr_vlracr: TBCDField
      FieldName = 'cfr_vlracr'
      Precision = 15
      Size = 2
    end
    object cliCtapgcfr_vlrtot: TBCDField
      FieldName = 'cfr_vlrtot'
      Precision = 15
      Size = 2
    end
    object cliCtapgcfr_period: TStringField
      FieldName = 'cfr_period'
      FixedChar = True
      Size = 1
    end
    object cliCtapgcfr_tipdoc: TStringField
      FieldName = 'cfr_tipdoc'
      Size = 1
    end
    object cliCtapgcfr_usuinc: TStringField
      FieldName = 'cfr_usuinc'
      Size = 15
    end
    object cliCtapgcfr_datinc: TDateField
      FieldName = 'cfr_datinc'
    end
    object cliCtapgcfr_horinc: TStringField
      FieldName = 'cfr_horinc'
      Size = 8
    end
    object cliCtapgcfr_usualt: TStringField
      FieldName = 'cfr_usualt'
      Size = 15
    end
    object cliCtapgcfr_datalt: TDateField
      FieldName = 'cfr_datalt'
    end
    object cliCtapgcfr_horalt: TStringField
      FieldName = 'cfr_horalt'
      Size = 8
    end
    object cliCtapgfcr_codigo: TIntegerField
      FieldName = 'fcr_codigo'
    end
    object cliCtapgfcr_codcfr: TIntegerField
      FieldName = 'fcr_codcfr'
    end
    object cliCtapgfcr_codcxa: TIntegerField
      FieldName = 'fcr_codcxa'
    end
    object cliCtapgfcr_codabc: TIntegerField
      FieldName = 'fcr_codabc'
    end
    object cliCtapgfcr_codcct: TIntegerField
      FieldName = 'fcr_codcct'
    end
    object cliCtapgfcr_codfpg: TIntegerField
      FieldName = 'fcr_codfpg'
    end
    object cliCtapgfcr_datpag: TDateField
      FieldName = 'fcr_datpag'
    end
    object cliCtapgfcr_datven: TDateField
      FieldName = 'fcr_datven'
    end
    object cliCtapgfcr_numpar: TStringField
      FieldName = 'fcr_numpar'
      Size = 3
    end
    object cliCtapgfcr_descri: TStringField
      FieldName = 'fcr_descri'
      Size = 100
    end
    object cliCtapgfcr_status: TStringField
      FieldName = 'fcr_status'
      Size = 3
    end
    object cliCtapgfcr_tippro: TStringField
      FieldName = 'fcr_tippro'
      Size = 3
    end
    object cliCtapgfcr_vlrapg: TBCDField
      FieldName = 'fcr_vlrapg'
      Precision = 15
      Size = 2
    end
    object cliCtapgfcr_vlrpag: TBCDField
      FieldName = 'fcr_vlrpag'
      Precision = 15
      Size = 2
    end
    object cliCtapgfcr_check: TBooleanField
      FieldName = 'fcr_check'
    end
    object cliCtapgfcr_numbol: TStringField
      FieldName = 'fcr_numbol'
      Size = 45
    end
    object cliCtapgfcr_usuinc: TStringField
      FieldName = 'fcr_usuinc'
      Size = 15
    end
    object cliCtapgfcr_datinc: TDateField
      FieldName = 'fcr_datinc'
    end
    object cliCtapgfcr_horinc: TStringField
      FieldName = 'fcr_horinc'
      Size = 8
    end
    object cliCtapgfcr_usualt: TStringField
      FieldName = 'fcr_usualt'
      Size = 15
    end
    object cliCtapgfcr_datalt: TDateField
      FieldName = 'fcr_datalt'
    end
    object cliCtapgfcr_horalt: TStringField
      FieldName = 'fcr_horalt'
      Size = 8
    end
    object cliCtapgcxa_codigo: TIntegerField
      FieldName = 'cxa_codigo'
    end
    object cliCtapgcxa_codcct: TIntegerField
      FieldName = 'cxa_codcct'
    end
    object cliCtapgcxa_codusu: TIntegerField
      FieldName = 'cxa_codusu'
    end
    object cliCtapgcxa_ativo: TStringField
      FieldName = 'cxa_ativo'
      FixedChar = True
      Size = 1
    end
    object cliCtapgcxa_usuinc: TStringField
      FieldName = 'cxa_usuinc'
      Size = 15
    end
    object cliCtapgcxa_datinc: TDateField
      FieldName = 'cxa_datinc'
    end
    object cliCtapgcxa_horinc: TStringField
      FieldName = 'cxa_horinc'
      Size = 8
    end
    object cliCtapgcxa_usualt: TStringField
      FieldName = 'cxa_usualt'
      Size = 15
    end
    object cliCtapgcxa_datalt: TDateField
      FieldName = 'cxa_datalt'
    end
    object cliCtapgcxa_horalt: TStringField
      FieldName = 'cxa_horalt'
      Size = 8
    end
    object cliCtapgabc_codigo: TIntegerField
      FieldName = 'abc_codigo'
    end
    object cliCtapgabc_codcxa: TIntegerField
      FieldName = 'abc_codcxa'
    end
    object cliCtapgabc_codcct: TIntegerField
      FieldName = 'abc_codcct'
    end
    object cliCtapgabc_databr: TDateField
      FieldName = 'abc_databr'
    end
    object cliCtapgabc_datfch: TDateField
      FieldName = 'abc_datfch'
    end
    object cliCtapgabc_vlrini: TBCDField
      FieldName = 'abc_vlrini'
      Precision = 15
      Size = 2
    end
    object cliCtapgabc_vlrant: TBCDField
      FieldName = 'abc_vlrant'
      Precision = 15
      Size = 2
    end
    object cliCtapgabc_vlratu: TBCDField
      FieldName = 'abc_vlratu'
      Precision = 15
      Size = 2
    end
    object cliCtapgabc_usuinc: TStringField
      FieldName = 'abc_usuinc'
      Size = 15
    end
    object cliCtapgabc_datinc: TDateField
      FieldName = 'abc_datinc'
    end
    object cliCtapgabc_horinc: TStringField
      FieldName = 'abc_horinc'
      Size = 8
    end
    object cliCtapgabc_usualt: TStringField
      FieldName = 'abc_usualt'
      Size = 15
    end
    object cliCtapgabc_datalt: TDateField
      FieldName = 'abc_datalt'
    end
    object cliCtapgabc_horalt: TStringField
      FieldName = 'abc_horalt'
      Size = 8
    end
    object cliCtapgcct_codigo: TIntegerField
      FieldName = 'cct_codigo'
    end
    object cliCtapgcct_codbco: TStringField
      FieldName = 'cct_codbco'
      Size = 6
    end
    object cliCtapgcct_agencia: TStringField
      FieldName = 'cct_agencia'
      Size = 9
    end
    object cliCtapgcct_nrconta: TStringField
      FieldName = 'cct_nrconta'
      Size = 9
    end
    object cliCtapgcct_codpcd: TStringField
      FieldName = 'cct_codpcd'
      Size = 10
    end
    object cliCtapgcct_codpcc: TStringField
      FieldName = 'cct_codpcc'
      Size = 10
    end
    object cliCtapgcct_telef1: TStringField
      FieldName = 'cct_telef1'
      Size = 12
    end
    object cliCtapgcct_telef2: TStringField
      FieldName = 'cct_telef2'
      Size = 12
    end
    object cliCtapgcct_celula: TStringField
      FieldName = 'cct_celula'
      Size = 12
    end
    object cliCtapgcct_usuinc: TStringField
      FieldName = 'cct_usuinc'
      Size = 15
    end
    object cliCtapgcct_datinc: TDateField
      FieldName = 'cct_datinc'
    end
    object cliCtapgcct_horinc: TStringField
      FieldName = 'cct_horinc'
      Size = 8
    end
    object cliCtapgcct_usualt: TStringField
      FieldName = 'cct_usualt'
      Size = 15
    end
    object cliCtapgcct_datalt: TDateField
      FieldName = 'cct_datalt'
    end
    object cliCtapgcct_horalt: TStringField
      FieldName = 'cct_horalt'
      Size = 8
    end
  end
  object dsCtapg: TDataSource
    DataSet = cliCtapg
    Left = 1198
    Top = 320
  end
  object dspTanque: TDataSetProvider
    DataSet = sqlTanque
    UpdateMode = upWhereKeyOnly
    Left = 1046
    Top = 376
  end
  object cliTanque: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTanque'
    Left = 1126
    Top = 376
    object cliTanquetnq_codigo: TIntegerField
      FieldName = 'tnq_codigo'
    end
    object cliTanquetnq_codcmb: TIntegerField
      FieldName = 'tnq_codcmb'
    end
    object cliTanquetnq_nome: TStringField
      FieldName = 'tnq_nome'
      Size = 25
    end
    object cliTanquetnq_nmrinc: TBCDField
      FieldName = 'tnq_nmrinc'
      Precision = 7
      Size = 0
    end
    object cliTanquetnq_vlrcst: TBCDField
      FieldName = 'tnq_vlrcst'
      Precision = 15
      Size = 2
    end
    object cliTanquetnq_ltsmin: TBCDField
      FieldName = 'tnq_ltsmin'
      Precision = 15
      Size = 3
    end
    object cliTanquetnq_ltsetq: TBCDField
      FieldName = 'tnq_ltsetq'
      Precision = 15
      Size = 3
    end
    object cliTanquetnq_ativo: TBooleanField
      FieldName = 'tnq_ativo'
    end
    object cliTanquetnq_usuinc: TStringField
      FieldName = 'tnq_usuinc'
      Size = 15
    end
    object cliTanquetnq_datinc: TDateField
      FieldName = 'tnq_datinc'
    end
    object cliTanquetnq_horinc: TStringField
      FieldName = 'tnq_horinc'
      Size = 8
    end
    object cliTanquetnq_usualt: TStringField
      FieldName = 'tnq_usualt'
      Size = 15
    end
    object cliTanquetnq_datalt: TDateField
      FieldName = 'tnq_datalt'
    end
    object cliTanquetnq_horalt: TStringField
      FieldName = 'tnq_horalt'
      Size = 8
    end
    object cliTanquecmb_codigo: TIntegerField
      FieldName = 'cmb_codigo'
    end
    object cliTanquecmb_nome: TStringField
      FieldName = 'cmb_nome'
    end
    object cliTanquecmb_usuinc: TStringField
      FieldName = 'cmb_usuinc'
      Size = 15
    end
    object cliTanquecmb_datinc: TDateField
      FieldName = 'cmb_datinc'
    end
    object cliTanquecmb_horinc: TStringField
      FieldName = 'cmb_horinc'
      Size = 8
    end
    object cliTanquecmb_usualt: TStringField
      FieldName = 'cmb_usualt'
      Size = 15
    end
    object cliTanquecmb_datalt: TDateField
      FieldName = 'cmb_datalt'
    end
    object cliTanquecmb_horalt: TStringField
      FieldName = 'cmb_horalt'
      Size = 8
    end
  end
  object dsTanque: TDataSource
    DataSet = cliTanque
    Left = 1198
    Top = 376
  end
  object dspBomba: TDataSetProvider
    DataSet = sqlBomba
    UpdateMode = upWhereKeyOnly
    Left = 1046
    Top = 432
  end
  object cliBomba: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBomba'
    Left = 1126
    Top = 432
    object cliBombabmb_codigo: TIntegerField
      FieldName = 'bmb_codigo'
    end
    object cliBombabmb_codtnq: TIntegerField
      FieldName = 'bmb_codtnq'
    end
    object cliBombabmb_codcmb: TIntegerField
      FieldName = 'bmb_codcmb'
    end
    object cliBombabmb_nome: TStringField
      FieldName = 'bmb_nome'
      Size = 25
    end
    object cliBombabmb_nmrinc: TBCDField
      FieldName = 'bmb_nmrinc'
      Precision = 7
      Size = 0
    end
    object cliBombabmb_ativo: TBooleanField
      FieldName = 'bmb_ativo'
    end
    object cliBombabmb_usuinc: TStringField
      FieldName = 'bmb_usuinc'
      Size = 15
    end
    object cliBombabmb_datinc: TDateField
      FieldName = 'bmb_datinc'
    end
    object cliBombabmb_horinc: TStringField
      FieldName = 'bmb_horinc'
      Size = 8
    end
    object cliBombabmb_usualt: TStringField
      FieldName = 'bmb_usualt'
      Size = 15
    end
    object cliBombabmb_datalt: TDateField
      FieldName = 'bmb_datalt'
    end
    object cliBombabmb_horalt: TStringField
      FieldName = 'bmb_horalt'
      Size = 8
    end
    object cliBombatnq_codigo: TIntegerField
      FieldName = 'tnq_codigo'
    end
    object cliBombatnq_codcmb: TIntegerField
      FieldName = 'tnq_codcmb'
    end
    object cliBombatnq_nome: TStringField
      FieldName = 'tnq_nome'
      Size = 25
    end
    object cliBombatnq_nmrinc: TBCDField
      FieldName = 'tnq_nmrinc'
      Precision = 7
      Size = 0
    end
    object cliBombatnq_vlrcst: TBCDField
      FieldName = 'tnq_vlrcst'
      Precision = 15
      Size = 2
    end
    object cliBombatnq_ltsmin: TBCDField
      FieldName = 'tnq_ltsmin'
      Precision = 15
      Size = 3
    end
    object cliBombatnq_ltsetq: TBCDField
      FieldName = 'tnq_ltsetq'
      Precision = 15
      Size = 3
    end
    object cliBombatnq_ativo: TBooleanField
      FieldName = 'tnq_ativo'
    end
    object cliBombatnq_usuinc: TStringField
      FieldName = 'tnq_usuinc'
      Size = 15
    end
    object cliBombatnq_datinc: TDateField
      FieldName = 'tnq_datinc'
    end
    object cliBombatnq_horinc: TStringField
      FieldName = 'tnq_horinc'
      Size = 8
    end
    object cliBombatnq_usualt: TStringField
      FieldName = 'tnq_usualt'
      Size = 15
    end
    object cliBombatnq_datalt: TDateField
      FieldName = 'tnq_datalt'
    end
    object cliBombatnq_horalt: TStringField
      FieldName = 'tnq_horalt'
      Size = 8
    end
    object cliBombacmb_codigo: TIntegerField
      FieldName = 'cmb_codigo'
    end
    object cliBombacmb_nome: TStringField
      FieldName = 'cmb_nome'
    end
    object cliBombacmb_usuinc: TStringField
      FieldName = 'cmb_usuinc'
      Size = 15
    end
    object cliBombacmb_datinc: TDateField
      FieldName = 'cmb_datinc'
    end
    object cliBombacmb_horinc: TStringField
      FieldName = 'cmb_horinc'
      Size = 8
    end
    object cliBombacmb_usualt: TStringField
      FieldName = 'cmb_usualt'
      Size = 15
    end
    object cliBombacmb_datalt: TDateField
      FieldName = 'cmb_datalt'
    end
    object cliBombacmb_horalt: TStringField
      FieldName = 'cmb_horalt'
      Size = 8
    end
  end
  object dsBomba: TDataSource
    DataSet = cliBomba
    Left = 1198
    Top = 432
  end
  object dspIncerrante: TDataSetProvider
    DataSet = sqlIncerrante
    UpdateMode = upWhereKeyOnly
    Left = 1046
    Top = 488
  end
  object cliIncerrante: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspIncerrante'
    Left = 1126
    Top = 488
    object cliIncerranteict_codigo: TIntegerField
      FieldName = 'ict_codigo'
    end
    object cliIncerranteict_codbmb: TIntegerField
      FieldName = 'ict_codbmb'
    end
    object cliIncerranteict_nmrien: TBCDField
      FieldName = 'ict_nmrien'
      Precision = 12
      Size = 0
    end
    object cliIncerranteict_datent: TDateField
      FieldName = 'ict_datent'
    end
    object cliIncerranteict_horent: TStringField
      FieldName = 'ict_horent'
      Size = 8
    end
    object cliIncerranteict_nmrisa: TBCDField
      FieldName = 'ict_nmrisa'
      Precision = 12
      Size = 0
    end
    object cliIncerranteict_datsai: TDateField
      FieldName = 'ict_datsai'
    end
    object cliIncerranteict_horsai: TStringField
      FieldName = 'ict_horsai'
      Size = 8
    end
    object cliIncerranteict_usuinc: TStringField
      FieldName = 'ict_usuinc'
      Size = 15
    end
    object cliIncerranteict_datinc: TDateField
      FieldName = 'ict_datinc'
    end
    object cliIncerranteict_horinc: TStringField
      FieldName = 'ict_horinc'
      Size = 8
    end
    object cliIncerranteict_usualt: TStringField
      FieldName = 'ict_usualt'
      Size = 15
    end
    object cliIncerranteict_datalt: TDateField
      FieldName = 'ict_datalt'
    end
    object cliIncerranteict_horalt: TStringField
      FieldName = 'ict_horalt'
      Size = 8
    end
    object cliIncerrantebmb_codigo: TIntegerField
      FieldName = 'bmb_codigo'
    end
    object cliIncerrantebmb_codtnq: TIntegerField
      FieldName = 'bmb_codtnq'
    end
    object cliIncerrantebmb_codcmb: TIntegerField
      FieldName = 'bmb_codcmb'
    end
    object cliIncerrantebmb_nome: TStringField
      FieldName = 'bmb_nome'
      Size = 25
    end
    object cliIncerrantebmb_nmrinc: TBCDField
      FieldName = 'bmb_nmrinc'
      Precision = 7
      Size = 0
    end
    object cliIncerrantebmb_ativo: TBooleanField
      FieldName = 'bmb_ativo'
    end
    object cliIncerrantebmb_usuinc: TStringField
      FieldName = 'bmb_usuinc'
      Size = 15
    end
    object cliIncerrantebmb_datinc: TDateField
      FieldName = 'bmb_datinc'
    end
    object cliIncerrantebmb_horinc: TStringField
      FieldName = 'bmb_horinc'
      Size = 8
    end
    object cliIncerrantebmb_usualt: TStringField
      FieldName = 'bmb_usualt'
      Size = 15
    end
    object cliIncerrantebmb_datalt: TDateField
      FieldName = 'bmb_datalt'
    end
    object cliIncerrantebmb_horalt: TStringField
      FieldName = 'bmb_horalt'
      Size = 8
    end
  end
  object dsIncerrante: TDataSource
    DataSet = cliIncerrante
    Left = 1198
    Top = 488
  end
  object dspPneuMod: TDataSetProvider
    DataSet = sqlPneuMod
    UpdateMode = upWhereKeyOnly
    Left = 1046
    Top = 536
  end
  object cliPneuMod: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPneuMod'
    Left = 1126
    Top = 536
    object cliPneuModpmd_codigo: TIntegerField
      FieldName = 'pmd_codigo'
    end
    object cliPneuModpmd_nome: TStringField
      FieldName = 'pmd_nome'
      Size = 50
    end
    object cliPneuModpmd_sucref: TStringField
      FieldName = 'pmd_sucref'
      Size = 1
    end
    object cliPneuModpmd_sucnov: TStringField
      FieldName = 'pmd_sucnov'
      Size = 1
    end
    object cliPneuModpmd_codpds: TIntegerField
      FieldName = 'pmd_codpds'
    end
    object cliPneuModpmd_codpdm: TIntegerField
      FieldName = 'pmd_codpdm'
    end
    object cliPneuModpmd_codpfb: TIntegerField
      FieldName = 'pmd_codpfb'
    end
    object cliPneuModpmd_kmvid1: TBCDField
      FieldName = 'pmd_kmvid1'
      Precision = 7
      Size = 0
    end
    object cliPneuModpmd_kmvid2: TBCDField
      FieldName = 'pmd_kmvid2'
      Precision = 7
      Size = 0
    end
    object cliPneuModpmd_kmvid3: TBCDField
      FieldName = 'pmd_kmvid3'
      Precision = 7
      Size = 0
    end
    object cliPneuModpmd_kmvid4: TBCDField
      FieldName = 'pmd_kmvid4'
      Precision = 7
      Size = 0
    end
    object cliPneuModpmd_kmvid5: TBCDField
      FieldName = 'pmd_kmvid5'
      Precision = 7
      Size = 0
    end
    object cliPneuModpmd_kmvid6: TBCDField
      FieldName = 'pmd_kmvid6'
      Precision = 7
      Size = 0
    end
    object cliPneuModpmd_kmvid7: TBCDField
      FieldName = 'pmd_kmvid7'
      Precision = 7
      Size = 0
    end
    object cliPneuModpmd_kmvid8: TBCDField
      FieldName = 'pmd_kmvid8'
      Precision = 7
      Size = 0
    end
    object cliPneuModpmd_kmvid9: TBCDField
      FieldName = 'pmd_kmvid9'
      Precision = 7
      Size = 0
    end
    object cliPneuModpmd_usuinc: TStringField
      FieldName = 'pmd_usuinc'
      Size = 15
    end
    object cliPneuModpmd_datinc: TDateField
      FieldName = 'pmd_datinc'
    end
    object cliPneuModpmd_horinc: TStringField
      FieldName = 'pmd_horinc'
      Size = 8
    end
    object cliPneuModpmd_usualt: TStringField
      FieldName = 'pmd_usualt'
      Size = 15
    end
    object cliPneuModpmd_datalt: TDateField
      FieldName = 'pmd_datalt'
    end
    object cliPneuModpmd_horalt: TStringField
      FieldName = 'pmd_horalt'
      Size = 8
    end
    object cliPneuModpds_codigo: TIntegerField
      FieldName = 'pds_codigo'
    end
    object cliPneuModpds_nome: TStringField
      FieldName = 'pds_nome'
    end
    object cliPneuModpds_sucos: TStringField
      FieldName = 'pds_sucos'
      Size = 1
    end
    object cliPneuModpds_usuinc: TStringField
      FieldName = 'pds_usuinc'
      Size = 15
    end
    object cliPneuModpds_datinc: TDateField
      FieldName = 'pds_datinc'
    end
    object cliPneuModpds_horinc: TStringField
      FieldName = 'pds_horinc'
      Size = 8
    end
    object cliPneuModpds_usualt: TStringField
      FieldName = 'pds_usualt'
      Size = 15
    end
    object cliPneuModpds_datalt: TDateField
      FieldName = 'pds_datalt'
    end
    object cliPneuModpds_horalt: TStringField
      FieldName = 'pds_horalt'
      Size = 8
    end
    object cliPneuModpdm_codigo: TIntegerField
      FieldName = 'pdm_codigo'
    end
    object cliPneuModpdm_nome: TStringField
      FieldName = 'pdm_nome'
    end
    object cliPneuModpdm_usuinc: TStringField
      FieldName = 'pdm_usuinc'
      Size = 15
    end
    object cliPneuModpdm_datinc: TDateField
      FieldName = 'pdm_datinc'
    end
    object cliPneuModpdm_horinc: TStringField
      FieldName = 'pdm_horinc'
      Size = 8
    end
    object cliPneuModpdm_usualt: TStringField
      FieldName = 'pdm_usualt'
      Size = 15
    end
    object cliPneuModpdm_datalt: TDateField
      FieldName = 'pdm_datalt'
    end
    object cliPneuModpdm_horalt: TStringField
      FieldName = 'pdm_horalt'
      Size = 8
    end
    object cliPneuModpfb_codigo: TIntegerField
      FieldName = 'pfb_codigo'
    end
    object cliPneuModpfb_nome: TStringField
      FieldName = 'pfb_nome'
      Size = 40
    end
    object cliPneuModpfb_usuinc: TStringField
      FieldName = 'pfb_usuinc'
      Size = 15
    end
    object cliPneuModpfb_datinc: TDateField
      FieldName = 'pfb_datinc'
    end
    object cliPneuModpfb_horinc: TStringField
      FieldName = 'pfb_horinc'
      Size = 8
    end
    object cliPneuModpfb_usualt: TStringField
      FieldName = 'pfb_usualt'
      Size = 15
    end
    object cliPneuModpfb_datalt: TDateField
      FieldName = 'pfb_datalt'
    end
    object cliPneuModpfb_horalt: TStringField
      FieldName = 'pfb_horalt'
      Size = 8
    end
  end
  object dsPneuMod: TDataSource
    DataSet = cliPneuIve
    Left = 1198
    Top = 536
  end
  object dspPneuIve: TDataSetProvider
    DataSet = sqlPneuIve
    UpdateMode = upWhereKeyOnly
    Left = 1046
    Top = 592
  end
  object cliPneuIve: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPneuIve'
    Left = 1126
    Top = 592
    object cliPneuIvepiv_codigo: TIntegerField
      FieldName = 'piv_codigo'
    end
    object cliPneuIvepiv_numser: TStringField
      FieldName = 'piv_numser'
      Size = 10
    end
    object cliPneuIvepiv_numnfe: TStringField
      FieldName = 'piv_numnfe'
      Size = 10
    end
    object cliPneuIvepiv_vlrcto: TBCDField
      FieldName = 'piv_vlrcto'
      Precision = 15
      Size = 2
    end
    object cliPneuIvepiv_mfogo: TStringField
      FieldName = 'piv_mfogo'
      Size = 6
    end
    object cliPneuIvepiv_numdot: TStringField
      FieldName = 'piv_numdot'
      Size = 10
    end
    object cliPneuIvepiv_codpmd: TIntegerField
      FieldName = 'piv_codpmd'
    end
    object cliPneuIvepiv_codpds: TIntegerField
      FieldName = 'piv_codpds'
    end
    object cliPneuIvepiv_codplc: TStringField
      FieldName = 'piv_codplc'
      Size = 7
    end
    object cliPneuIvepiv_mlmsc1: TStringField
      FieldName = 'piv_mlmsc1'
      Size = 2
    end
    object cliPneuIvepiv_mlmsc2: TStringField
      FieldName = 'piv_mlmsc2'
      Size = 2
    end
    object cliPneuIvepiv_mlmsc3: TStringField
      FieldName = 'piv_mlmsc3'
      Size = 2
    end
    object cliPneuIvepiv_mlmsc4: TStringField
      FieldName = 'piv_mlmsc4'
      Size = 2
    end
    object cliPneuIvepiv_mlmsc5: TStringField
      FieldName = 'piv_mlmsc5'
      Size = 2
    end
    object cliPneuIvepiv_mlmsc6: TStringField
      FieldName = 'piv_mlmsc6'
      Size = 2
    end
    object cliPneuIvepiv_kmvda1: TBCDField
      FieldName = 'piv_kmvda1'
      Precision = 7
      Size = 0
    end
    object cliPneuIvepiv_kmvda2: TBCDField
      FieldName = 'piv_kmvda2'
      Precision = 7
      Size = 0
    end
    object cliPneuIvepiv_kmvda3: TBCDField
      FieldName = 'piv_kmvda3'
      Precision = 7
      Size = 0
    end
    object cliPneuIvepiv_kmvda4: TBCDField
      FieldName = 'piv_kmvda4'
      Precision = 7
      Size = 0
    end
    object cliPneuIvepiv_kmvda5: TBCDField
      FieldName = 'piv_kmvda5'
      Precision = 7
      Size = 0
    end
    object cliPneuIvepiv_kmvda6: TBCDField
      FieldName = 'piv_kmvda6'
      Precision = 7
      Size = 0
    end
    object cliPneuIvepiv_kmvda7: TBCDField
      FieldName = 'piv_kmvda7'
      Precision = 7
      Size = 0
    end
    object cliPneuIvepiv_kmvda8: TBCDField
      FieldName = 'piv_kmvda8'
      Precision = 7
      Size = 0
    end
    object cliPneuIvepiv_kmvda9: TBCDField
      FieldName = 'piv_kmvda9'
      Precision = 7
      Size = 0
    end
    object cliPneuIvepiv_kminst: TBCDField
      FieldName = 'piv_kminst'
      Precision = 7
      Size = 0
    end
    object cliPneuIvepiv_kmmant: TBCDField
      FieldName = 'piv_kmmant'
      Precision = 7
      Size = 0
    end
    object cliPneuIvepiv_kmatua: TBCDField
      FieldName = 'piv_kmatua'
      Precision = 7
      Size = 0
    end
    object cliPneuIvepiv_kmrodi: TBCDField
      FieldName = 'piv_kmrodi'
      Precision = 7
      Size = 0
    end
    object cliPneuIvepiv_nrvida: TStringField
      FieldName = 'piv_nrvida'
      Size = 1
    end
    object cliPneuIvepiv_status: TStringField
      FieldName = 'piv_status'
      Size = 40
    end
    object cliPneuIvepiv_situac: TStringField
      FieldName = 'piv_situac'
      Size = 40
    end
    object cliPneuIvepiv_datcmp: TDateField
      FieldName = 'piv_datcmp'
    end
    object cliPneuIvepiv_locpne: TStringField
      FieldName = 'piv_locpne'
      Size = 5
    end
    object cliPneuIvepiv_usuinc: TStringField
      FieldName = 'piv_usuinc'
      Size = 15
    end
    object cliPneuIvepiv_datinc: TDateField
      FieldName = 'piv_datinc'
    end
    object cliPneuIvepiv_horinc: TStringField
      FieldName = 'piv_horinc'
      Size = 8
    end
    object cliPneuIvepiv_usualt: TStringField
      FieldName = 'piv_usualt'
      Size = 15
    end
    object cliPneuIvepiv_datalt: TDateField
      FieldName = 'piv_datalt'
    end
    object cliPneuIvepiv_horalt: TStringField
      FieldName = 'piv_horalt'
      Size = 8
    end
    object cliPneuIvepmd_codigo: TIntegerField
      FieldName = 'pmd_codigo'
    end
    object cliPneuIvepmd_nome: TStringField
      FieldName = 'pmd_nome'
      Size = 50
    end
    object cliPneuIvepmd_sucref: TStringField
      FieldName = 'pmd_sucref'
      Size = 1
    end
    object cliPneuIvepmd_sucnov: TStringField
      FieldName = 'pmd_sucnov'
      Size = 1
    end
    object cliPneuIvepmd_codpds: TIntegerField
      FieldName = 'pmd_codpds'
    end
    object cliPneuIvepmd_codpdm: TIntegerField
      FieldName = 'pmd_codpdm'
    end
    object cliPneuIvepmd_codpfb: TIntegerField
      FieldName = 'pmd_codpfb'
    end
    object cliPneuIvepmd_kmvid1: TBCDField
      FieldName = 'pmd_kmvid1'
      Precision = 7
      Size = 0
    end
    object cliPneuIvepmd_kmvid2: TBCDField
      FieldName = 'pmd_kmvid2'
      Precision = 7
      Size = 0
    end
    object cliPneuIvepmd_kmvid3: TBCDField
      FieldName = 'pmd_kmvid3'
      Precision = 7
      Size = 0
    end
    object cliPneuIvepmd_kmvid4: TBCDField
      FieldName = 'pmd_kmvid4'
      Precision = 7
      Size = 0
    end
    object cliPneuIvepmd_kmvid5: TBCDField
      FieldName = 'pmd_kmvid5'
      Precision = 7
      Size = 0
    end
    object cliPneuIvepmd_kmvid6: TBCDField
      FieldName = 'pmd_kmvid6'
      Precision = 7
      Size = 0
    end
    object cliPneuIvepmd_kmvid7: TBCDField
      FieldName = 'pmd_kmvid7'
      Precision = 7
      Size = 0
    end
    object cliPneuIvepmd_kmvid8: TBCDField
      FieldName = 'pmd_kmvid8'
      Precision = 7
      Size = 0
    end
    object cliPneuIvepmd_kmvid9: TBCDField
      FieldName = 'pmd_kmvid9'
      Precision = 7
      Size = 0
    end
    object cliPneuIvepmd_usuinc: TStringField
      FieldName = 'pmd_usuinc'
      Size = 15
    end
    object cliPneuIvepmd_datinc: TDateField
      FieldName = 'pmd_datinc'
    end
    object cliPneuIvepmd_horinc: TStringField
      FieldName = 'pmd_horinc'
      Size = 8
    end
    object cliPneuIvepmd_usualt: TStringField
      FieldName = 'pmd_usualt'
      Size = 15
    end
    object cliPneuIvepmd_datalt: TDateField
      FieldName = 'pmd_datalt'
    end
    object cliPneuIvepmd_horalt: TStringField
      FieldName = 'pmd_horalt'
      Size = 8
    end
    object cliPneuIvepds_codigo: TIntegerField
      FieldName = 'pds_codigo'
    end
    object cliPneuIvepds_nome: TStringField
      FieldName = 'pds_nome'
    end
    object cliPneuIvepds_sucos: TStringField
      FieldName = 'pds_sucos'
      Size = 1
    end
    object cliPneuIvepds_usuinc: TStringField
      FieldName = 'pds_usuinc'
      Size = 15
    end
    object cliPneuIvepds_datinc: TDateField
      FieldName = 'pds_datinc'
    end
    object cliPneuIvepds_horinc: TStringField
      FieldName = 'pds_horinc'
      Size = 8
    end
    object cliPneuIvepds_usualt: TStringField
      FieldName = 'pds_usualt'
      Size = 15
    end
    object cliPneuIvepds_datalt: TDateField
      FieldName = 'pds_datalt'
    end
    object cliPneuIvepds_horalt: TStringField
      FieldName = 'pds_horalt'
      Size = 8
    end
    object cliPneuIvepdm_codigo: TIntegerField
      FieldName = 'pdm_codigo'
    end
    object cliPneuIvepdm_nome: TStringField
      FieldName = 'pdm_nome'
    end
    object cliPneuIvepdm_usuinc: TStringField
      FieldName = 'pdm_usuinc'
      Size = 15
    end
    object cliPneuIvepdm_datinc: TDateField
      FieldName = 'pdm_datinc'
    end
    object cliPneuIvepdm_horinc: TStringField
      FieldName = 'pdm_horinc'
      Size = 8
    end
    object cliPneuIvepdm_usualt: TStringField
      FieldName = 'pdm_usualt'
      Size = 15
    end
    object cliPneuIvepdm_datalt: TDateField
      FieldName = 'pdm_datalt'
    end
    object cliPneuIvepdm_horalt: TStringField
      FieldName = 'pdm_horalt'
      Size = 8
    end
    object cliPneuIvepfb_codigo: TIntegerField
      FieldName = 'pfb_codigo'
    end
    object cliPneuIvepfb_nome: TStringField
      FieldName = 'pfb_nome'
      Size = 40
    end
    object cliPneuIvepfb_usuinc: TStringField
      FieldName = 'pfb_usuinc'
      Size = 15
    end
    object cliPneuIvepfb_datinc: TDateField
      FieldName = 'pfb_datinc'
    end
    object cliPneuIvepfb_horinc: TStringField
      FieldName = 'pfb_horinc'
      Size = 8
    end
    object cliPneuIvepfb_usualt: TStringField
      FieldName = 'pfb_usualt'
      Size = 15
    end
    object cliPneuIvepfb_datalt: TDateField
      FieldName = 'pfb_datalt'
    end
    object cliPneuIvepfb_horalt: TStringField
      FieldName = 'pfb_horalt'
      Size = 8
    end
  end
  object dsPneuIve: TDataSource
    DataSet = cliPneuIve
    Left = 1198
    Top = 592
  end
  object dsptrmcoleta: TDataSetProvider
    DataSet = sqltrmcoleta
    UpdateMode = upWhereKeyOnly
    Left = 1046
    Top = 648
  end
  object clitrmcoleta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsptrmcoleta'
    Left = 1126
    Top = 648
    object clitrmcoletatmc_codigo: TIntegerField
      FieldName = 'tmc_codigo'
    end
    object clitrmcoletatmc_ativo: TBooleanField
      FieldName = 'tmc_ativo'
    end
    object clitrmcoletatmc_nome: TStringField
      FieldName = 'tmc_nome'
      Size = 50
    end
    object clitrmcoletatmc_endereco: TStringField
      FieldName = 'tmc_endereco'
      Size = 35
    end
    object clitrmcoletatmc_numend: TStringField
      FieldName = 'tmc_numend'
      Size = 5
    end
    object clitrmcoletatmc_complem: TStringField
      FieldName = 'tmc_complem'
      Size = 25
    end
    object clitrmcoletatmc_bairro: TStringField
      FieldName = 'tmc_bairro'
      Size = 50
    end
    object clitrmcoletatmc_cep: TStringField
      FieldName = 'tmc_cep'
      Size = 8
    end
    object clitrmcoletatmc_codcid: TIntegerField
      FieldName = 'tmc_codcid'
    end
    object clitrmcoletatmc_telef1: TStringField
      FieldName = 'tmc_telef1'
      Size = 12
    end
    object clitrmcoletatmc_telef2: TStringField
      FieldName = 'tmc_telef2'
      Size = 12
    end
    object clitrmcoletatmc_celula: TStringField
      FieldName = 'tmc_celula'
      Size = 12
    end
    object clitrmcoletatmc_contato: TStringField
      FieldName = 'tmc_contato'
    end
    object clitrmcoletatmc_obs: TMemoField
      FieldName = 'tmc_obs'
      BlobType = ftMemo
    end
    object clitrmcoletatmc_usuinc: TStringField
      FieldName = 'tmc_usuinc'
      Size = 15
    end
    object clitrmcoletatmc_datinc: TDateField
      FieldName = 'tmc_datinc'
    end
    object clitrmcoletatmc_horinc: TStringField
      FieldName = 'tmc_horinc'
      Size = 8
    end
    object clitrmcoletatmc_usualt: TStringField
      FieldName = 'tmc_usualt'
      Size = 15
    end
    object clitrmcoletatmc_datalt: TDateField
      FieldName = 'tmc_datalt'
    end
    object clitrmcoletatmc_horalt: TStringField
      FieldName = 'tmc_horalt'
      Size = 8
    end
    object clitrmcoletacid_codigo: TIntegerField
      FieldName = 'cid_codigo'
    end
    object clitrmcoletacid_cidnum: TStringField
      FieldName = 'cid_cidnum'
      Size = 8
    end
    object clitrmcoletacid_nome: TStringField
      FieldName = 'cid_nome'
      Size = 35
    end
    object clitrmcoletacid_codest: TIntegerField
      FieldName = 'cid_codest'
    end
    object clitrmcoletacid_codpai: TIntegerField
      FieldName = 'cid_codpai'
    end
    object clitrmcoletacid_usuinc: TStringField
      FieldName = 'cid_usuinc'
      Size = 15
    end
    object clitrmcoletacid_datinc: TDateField
      FieldName = 'cid_datinc'
    end
    object clitrmcoletacid_horinc: TStringField
      FieldName = 'cid_horinc'
      Size = 8
    end
    object clitrmcoletacid_usualt: TStringField
      FieldName = 'cid_usualt'
      Size = 15
    end
    object clitrmcoletacid_datalt: TDateField
      FieldName = 'cid_datalt'
    end
    object clitrmcoletacid_horalt: TStringField
      FieldName = 'cid_horalt'
      Size = 8
    end
  end
  object dstrmcoleta: TDataSource
    DataSet = clitrmcoleta
    Left = 1198
    Top = 648
  end
  object dspCliente: TDataSetProvider
    DataSet = sqlCliente
    UpdateMode = upWhereKeyOnly
    Left = 1046
    Top = 704
  end
  object cliCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCliente'
    Left = 1126
    Top = 704
    object cliClientecli_codigo: TIntegerField
      FieldName = 'cli_codigo'
    end
    object cliClientecli_tipo: TStringField
      FieldName = 'cli_tipo'
      Size = 10
    end
    object cliClientecli_ativo: TBooleanField
      FieldName = 'cli_ativo'
    end
    object cliClientecli_nome: TStringField
      FieldName = 'cli_nome'
      Size = 50
    end
    object cliClientecli_fantasia: TStringField
      FieldName = 'cli_fantasia'
      Size = 50
    end
    object cliClientecli_codgcl: TIntegerField
      FieldName = 'cli_codgcl'
    end
    object cliClientecli_codcgo: TIntegerField
      FieldName = 'cli_codcgo'
    end
    object cliClientecli_datnas: TDateField
      FieldName = 'cli_datnas'
    end
    object cliClientecli_diapag: TStringField
      FieldName = 'cli_diapag'
      Size = 2
    end
    object cliClientecli_ecivil: TStringField
      FieldName = 'cli_ecivil'
      Size = 15
    end
    object cliClientecli_nompal: TStringField
      FieldName = 'cli_nompal'
      Size = 50
    end
    object cliClientecli_nommae: TStringField
      FieldName = 'cli_nommae'
      Size = 50
    end
    object cliClientecli_cpfcnpj: TStringField
      FieldName = 'cli_cpfcnpj'
      Size = 14
    end
    object cliClientecli_rgiest: TStringField
      FieldName = 'cli_rgiest'
      Size = 15
    end
    object cliClientecli_imunic: TStringField
      FieldName = 'cli_imunic'
      Size = 15
    end
    object cliClientecli_rgexped: TStringField
      FieldName = 'cli_rgexped'
    end
    object cliClientecli_rgdata: TDateField
      FieldName = 'cli_rgdata'
    end
    object cliClientecli_cep: TStringField
      FieldName = 'cli_cep'
      Size = 8
    end
    object cliClientecli_endereco: TStringField
      FieldName = 'cli_endereco'
      Size = 50
    end
    object cliClientecli_complem: TStringField
      FieldName = 'cli_complem'
      Size = 25
    end
    object cliClientecli_numres: TStringField
      FieldName = 'cli_numres'
      Size = 6
    end
    object cliClientecli_bairro: TStringField
      FieldName = 'cli_bairro'
      Size = 50
    end
    object cliClientecli_codcid: TIntegerField
      FieldName = 'cli_codcid'
    end
    object cliClientecli_cepcob: TStringField
      FieldName = 'cli_cepcob'
      Size = 8
    end
    object cliClientecli_endcob: TStringField
      FieldName = 'cli_endcob'
      Size = 50
    end
    object cliClientecli_comcob: TStringField
      FieldName = 'cli_comcob'
      Size = 25
    end
    object cliClientecli_numcob: TStringField
      FieldName = 'cli_numcob'
      Size = 6
    end
    object cliClientecli_baicob: TStringField
      FieldName = 'cli_baicob'
      Size = 50
    end
    object cliClientecli_codcdc: TIntegerField
      FieldName = 'cli_codcdc'
    end
    object cliClientecli_repend: TBooleanField
      FieldName = 'cli_repend'
    end
    object cliClientecli_telef01: TStringField
      FieldName = 'cli_telef01'
      Size = 12
    end
    object cliClientecli_telef02: TStringField
      FieldName = 'cli_telef02'
      Size = 12
    end
    object cliClientecli_celular: TStringField
      FieldName = 'cli_celular'
      Size = 12
    end
    object cliClientecli_email: TStringField
      FieldName = 'cli_email'
      Size = 100
    end
    object cliClientecli_emailsped: TStringField
      FieldName = 'cli_emailsped'
      Size = 100
    end
    object cliClientecli_status: TStringField
      FieldName = 'cli_status'
      Size = 15
    end
    object cliClientecli_foto: TBlobField
      FieldName = 'cli_foto'
    end
    object cliClientecli_obs: TMemoField
      FieldName = 'cli_obs'
      BlobType = ftMemo
    end
    object cliClientecli_vlrlim: TBCDField
      FieldName = 'cli_vlrlim'
      Precision = 15
      Size = 2
    end
    object cliClientecli_vlrcre: TBCDField
      FieldName = 'cli_vlrcre'
      Precision = 15
      Size = 2
    end
    object cliClientecli_datcmp: TDateField
      FieldName = 'cli_datcmp'
    end
    object cliClientecli_usuinc: TStringField
      FieldName = 'cli_usuinc'
      Size = 15
    end
    object cliClientecli_datinc: TDateField
      FieldName = 'cli_datinc'
    end
    object cliClientecli_horinc: TStringField
      FieldName = 'cli_horinc'
      Size = 8
    end
    object cliClientecli_usualt: TStringField
      FieldName = 'cli_usualt'
      Size = 15
    end
    object cliClientecli_datalt: TDateField
      FieldName = 'cli_datalt'
    end
    object cliClientecli_horalt: TStringField
      FieldName = 'cli_horalt'
      Size = 8
    end
    object cliClientecgo_codigo: TIntegerField
      FieldName = 'cgo_codigo'
    end
    object cliClientecgo_nome: TStringField
      FieldName = 'cgo_nome'
      Size = 35
    end
    object cliClientecgo_usuinc: TStringField
      FieldName = 'cgo_usuinc'
      Size = 15
    end
    object cliClientecgo_datinc: TDateField
      FieldName = 'cgo_datinc'
    end
    object cliClientecgo_horinc: TStringField
      FieldName = 'cgo_horinc'
      Size = 8
    end
    object cliClientecgo_usualt: TStringField
      FieldName = 'cgo_usualt'
      Size = 15
    end
    object cliClientecgo_datalt: TDateField
      FieldName = 'cgo_datalt'
    end
    object cliClientecgo_horalt: TStringField
      FieldName = 'cgo_horalt'
      Size = 8
    end
    object cliClientecid_codigo: TIntegerField
      FieldName = 'cid_codigo'
    end
    object cliClientecid_cidnum: TStringField
      FieldName = 'cid_cidnum'
      Size = 8
    end
    object cliClientecid_nome: TStringField
      FieldName = 'cid_nome'
      Size = 35
    end
    object cliClientecid_codest: TIntegerField
      FieldName = 'cid_codest'
    end
    object cliClientecid_codpai: TIntegerField
      FieldName = 'cid_codpai'
    end
    object cliClientecid_usuinc: TStringField
      FieldName = 'cid_usuinc'
      Size = 15
    end
    object cliClientecid_datinc: TDateField
      FieldName = 'cid_datinc'
    end
    object cliClientecid_horinc: TStringField
      FieldName = 'cid_horinc'
      Size = 8
    end
    object cliClientecid_usualt: TStringField
      FieldName = 'cid_usualt'
      Size = 15
    end
    object cliClientecid_datalt: TDateField
      FieldName = 'cid_datalt'
    end
    object cliClientecid_horalt: TStringField
      FieldName = 'cid_horalt'
      Size = 8
    end
    object cliClientegcl_codigo: TIntegerField
      FieldName = 'gcl_codigo'
    end
    object cliClientegcl_nome: TStringField
      FieldName = 'gcl_nome'
    end
    object cliClientegcl_usuinc: TStringField
      FieldName = 'gcl_usuinc'
      Size = 15
    end
    object cliClientegcl_datinc: TDateField
      FieldName = 'gcl_datinc'
    end
    object cliClientegcl_horinc: TStringField
      FieldName = 'gcl_horinc'
      Size = 8
    end
    object cliClientegcl_usualt: TStringField
      FieldName = 'gcl_usualt'
      Size = 15
    end
    object cliClientegcl_datalt: TDateField
      FieldName = 'gcl_datalt'
    end
    object cliClientegcl_horalt: TStringField
      FieldName = 'gcl_horalt'
      Size = 8
    end
  end
  object dsCliente: TDataSource
    DataSet = cliCliente
    Left = 1198
    Top = 704
  end
  object dspTransfin: TDataSetProvider
    DataSet = sqlTransfin
    UpdateMode = upWhereKeyOnly
    Left = 1046
    Top = 760
  end
  object cliTransfin: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTransfin'
    Left = 1126
    Top = 760
    object cliTransfintff_codigo: TIntegerField
      FieldName = 'tff_codigo'
    end
    object cliTransfintff_codctd: TIntegerField
      FieldName = 'tff_codctd'
    end
    object cliTransfintff_codctc: TIntegerField
      FieldName = 'tff_codctc'
    end
    object cliTransfintff_tipdoc: TStringField
      FieldName = 'tff_tipdoc'
      Size = 15
    end
    object cliTransfintff_horent: TStringField
      FieldName = 'tff_horent'
      Size = 8
    end
    object cliTransfintff_vlrtff: TBCDField
      FieldName = 'tff_vlrtff'
      Precision = 15
      Size = 2
    end
    object cliTransfintff_dattff: TDateField
      FieldName = 'tff_dattff'
    end
    object cliTransfintff_numtff: TStringField
      FieldName = 'tff_numtff'
      Size = 45
    end
    object cliTransfintff_obs: TStringField
      FieldName = 'tff_obs'
      Size = 50
    end
    object cliTransfintff_usuinc: TStringField
      FieldName = 'tff_usuinc'
      Size = 15
    end
    object cliTransfintff_datinc: TDateField
      FieldName = 'tff_datinc'
    end
    object cliTransfintff_horinc: TStringField
      FieldName = 'tff_horinc'
      Size = 8
    end
    object cliTransfintff_usualt: TStringField
      FieldName = 'tff_usualt'
      Size = 15
    end
    object cliTransfintff_datalt: TDateField
      FieldName = 'tff_datalt'
    end
    object cliTransfintff_horalt: TStringField
      FieldName = 'tff_horalt'
      Size = 8
    end
    object cliTransfincct_codigo: TIntegerField
      FieldName = 'cct_codigo'
    end
    object cliTransfincct_codbco: TStringField
      FieldName = 'cct_codbco'
      Size = 6
    end
    object cliTransfincct_agencia: TStringField
      FieldName = 'cct_agencia'
      Size = 9
    end
    object cliTransfincct_nrconta: TStringField
      FieldName = 'cct_nrconta'
      Size = 9
    end
    object cliTransfincct_codpcd: TStringField
      FieldName = 'cct_codpcd'
      Size = 10
    end
    object cliTransfincct_codpcc: TStringField
      FieldName = 'cct_codpcc'
      Size = 10
    end
    object cliTransfincct_telef1: TStringField
      FieldName = 'cct_telef1'
      Size = 12
    end
    object cliTransfincct_telef2: TStringField
      FieldName = 'cct_telef2'
      Size = 12
    end
    object cliTransfincct_celula: TStringField
      FieldName = 'cct_celula'
      Size = 12
    end
    object cliTransfincct_usuinc: TStringField
      FieldName = 'cct_usuinc'
      Size = 15
    end
    object cliTransfincct_datinc: TDateField
      FieldName = 'cct_datinc'
    end
    object cliTransfincct_horinc: TStringField
      FieldName = 'cct_horinc'
      Size = 8
    end
    object cliTransfincct_usualt: TStringField
      FieldName = 'cct_usualt'
      Size = 15
    end
    object cliTransfincct_datalt: TDateField
      FieldName = 'cct_datalt'
    end
    object cliTransfincct_horalt: TStringField
      FieldName = 'cct_horalt'
      Size = 8
    end
    object cliTransfinbco_codigo: TStringField
      FieldName = 'bco_codigo'
      Size = 6
    end
    object cliTransfinbco_nome: TStringField
      FieldName = 'bco_nome'
      Size = 70
    end
    object cliTransfinbco_usuinc: TStringField
      FieldName = 'bco_usuinc'
      Size = 15
    end
    object cliTransfinbco_datinc: TDateField
      FieldName = 'bco_datinc'
    end
    object cliTransfinbco_horinc: TStringField
      FieldName = 'bco_horinc'
      Size = 8
    end
    object cliTransfinbco_usualt: TStringField
      FieldName = 'bco_usualt'
      Size = 15
    end
    object cliTransfinbco_datalt: TDateField
      FieldName = 'bco_datalt'
    end
    object cliTransfinbco_horalt: TStringField
      FieldName = 'bco_horalt'
      Size = 8
    end
    object cliTransfincct_codigo_1: TIntegerField
      FieldName = 'cct_codigo_1'
    end
    object cliTransfincct_codbco_1: TStringField
      FieldName = 'cct_codbco_1'
      Size = 6
    end
    object cliTransfincct_agencia_1: TStringField
      FieldName = 'cct_agencia_1'
      Size = 9
    end
    object cliTransfincct_nrconta_1: TStringField
      FieldName = 'cct_nrconta_1'
      Size = 9
    end
    object cliTransfincct_codpcd_1: TStringField
      FieldName = 'cct_codpcd_1'
      Size = 10
    end
    object cliTransfincct_codpcc_1: TStringField
      FieldName = 'cct_codpcc_1'
      Size = 10
    end
    object cliTransfincct_telef1_1: TStringField
      FieldName = 'cct_telef1_1'
      Size = 12
    end
    object cliTransfincct_telef2_1: TStringField
      FieldName = 'cct_telef2_1'
      Size = 12
    end
    object cliTransfincct_celula_1: TStringField
      FieldName = 'cct_celula_1'
      Size = 12
    end
    object cliTransfincct_usuinc_1: TStringField
      FieldName = 'cct_usuinc_1'
      Size = 15
    end
    object cliTransfincct_datinc_1: TDateField
      FieldName = 'cct_datinc_1'
    end
    object cliTransfincct_horinc_1: TStringField
      FieldName = 'cct_horinc_1'
      Size = 8
    end
    object cliTransfincct_usualt_1: TStringField
      FieldName = 'cct_usualt_1'
      Size = 15
    end
    object cliTransfincct_datalt_1: TDateField
      FieldName = 'cct_datalt_1'
    end
    object cliTransfincct_horalt_1: TStringField
      FieldName = 'cct_horalt_1'
      Size = 8
    end
    object cliTransfinbco_codigo_1: TStringField
      FieldName = 'bco_codigo_1'
      Size = 6
    end
    object cliTransfinbco_nome_1: TStringField
      FieldName = 'bco_nome_1'
      Size = 70
    end
    object cliTransfinbco_usuinc_1: TStringField
      FieldName = 'bco_usuinc_1'
      Size = 15
    end
    object cliTransfinbco_datinc_1: TDateField
      FieldName = 'bco_datinc_1'
    end
    object cliTransfinbco_horinc_1: TStringField
      FieldName = 'bco_horinc_1'
      Size = 8
    end
    object cliTransfinbco_usualt_1: TStringField
      FieldName = 'bco_usualt_1'
      Size = 15
    end
    object cliTransfinbco_datalt_1: TDateField
      FieldName = 'bco_datalt_1'
    end
    object cliTransfinbco_horalt_1: TStringField
      FieldName = 'bco_horalt_1'
      Size = 8
    end
  end
  object dsTransfin: TDataSource
    DataSet = cliTransfin
    Left = 1198
    Top = 760
  end
  object sqlPontoAbti: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * from "99999999999999_TESTE".pontoabti'
      
        'LEFT JOIN "99999999999999_TESTE".pontoabt on pab_codigo =iab_cod' +
        'pab'
      'LEFT JOIN "dbconfig".combustivel on cmb_codigo =iab_codcmb')
    Left = 968
    Top = 208
    object sqlPontoAbtiiab_codigo: TIntegerField
      FieldName = 'iab_codigo'
      Origin = 'iab_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlPontoAbtiiab_codpab: TIntegerField
      FieldName = 'iab_codpab'
      Origin = 'iab_codpab'
    end
    object sqlPontoAbtiiab_codcmb: TIntegerField
      FieldName = 'iab_codcmb'
      Origin = 'iab_codcmb'
    end
    object sqlPontoAbtiiab_ltsvlr: TBCDField
      FieldName = 'iab_ltsvlr'
      Origin = 'iab_ltsvlr'
      Precision = 15
      Size = 3
    end
    object sqlPontoAbtiiab_qltmin: TBCDField
      FieldName = 'iab_qltmin'
      Origin = 'iab_qltmin'
      Precision = 15
      Size = 3
    end
    object sqlPontoAbtiiab_qltest: TBCDField
      FieldName = 'iab_qltest'
      Origin = 'iab_qltest'
      Precision = 15
      Size = 3
    end
    object sqlPontoAbtiiab_contrato: TStringField
      FieldName = 'iab_contrato'
      Origin = 'iab_contrato'
      Size = 15
    end
    object sqlPontoAbtiiab_usuinc: TStringField
      FieldName = 'iab_usuinc'
      Origin = 'iab_usuinc'
      Size = 15
    end
    object sqlPontoAbtiiab_datini: TDateField
      FieldName = 'iab_datini'
      Origin = 'iab_datini'
    end
    object sqlPontoAbtiiab_datfin: TDateField
      FieldName = 'iab_datfin'
      Origin = 'iab_datfin'
    end
    object sqlPontoAbtiiab_datinc: TDateField
      FieldName = 'iab_datinc'
      Origin = 'iab_datinc'
    end
    object sqlPontoAbtiiab_horinc: TStringField
      FieldName = 'iab_horinc'
      Origin = 'iab_horinc'
      Size = 8
    end
    object sqlPontoAbtiiab_usualt: TStringField
      FieldName = 'iab_usualt'
      Origin = 'iab_usualt'
      Size = 15
    end
    object sqlPontoAbtiiab_datalt: TDateField
      FieldName = 'iab_datalt'
      Origin = 'iab_datalt'
    end
    object sqlPontoAbtiiab_horalt: TStringField
      FieldName = 'iab_horalt'
      Origin = 'iab_horalt'
      Size = 8
    end
    object sqlPontoAbtipab_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'pab_codigo'
      Origin = 'pab_codigo'
    end
    object sqlPontoAbtipab_ativo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pab_ativo'
      Origin = 'pab_ativo'
      Size = 3
    end
    object sqlPontoAbtipab_codfnd: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'pab_codfnd'
      Origin = 'pab_codfnd'
    end
    object sqlPontoAbtipab_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pab_nome'
      Origin = 'pab_nome'
      Size = 50
    end
    object sqlPontoAbtipab_nrcont: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pab_nrcont'
      Origin = 'pab_nrcont'
      Size = 15
    end
    object sqlPontoAbtipab_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pab_usuinc'
      Origin = 'pab_usuinc'
      Size = 15
    end
    object sqlPontoAbtipab_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pab_datinc'
      Origin = 'pab_datinc'
    end
    object sqlPontoAbtipab_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pab_horinc'
      Origin = 'pab_horinc'
      Size = 8
    end
    object sqlPontoAbtipab_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pab_usualt'
      Origin = 'pab_usualt'
      Size = 15
    end
    object sqlPontoAbtipab_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pab_datalt'
      Origin = 'pab_datalt'
    end
    object sqlPontoAbtipab_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pab_horalt'
      Origin = 'pab_horalt'
      Size = 8
    end
    object sqlPontoAbticmb_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cmb_codigo'
      Origin = 'cmb_codigo'
    end
    object sqlPontoAbticmb_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cmb_nome'
      Origin = 'cmb_nome'
    end
    object sqlPontoAbticmb_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cmb_usuinc'
      Origin = 'cmb_usuinc'
      Size = 15
    end
    object sqlPontoAbticmb_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cmb_datinc'
      Origin = 'cmb_datinc'
    end
    object sqlPontoAbticmb_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cmb_horinc'
      Origin = 'cmb_horinc'
      Size = 8
    end
    object sqlPontoAbticmb_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cmb_usualt'
      Origin = 'cmb_usualt'
      Size = 15
    end
    object sqlPontoAbticmb_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cmb_datalt'
      Origin = 'cmb_datalt'
    end
    object sqlPontoAbticmb_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cmb_horalt'
      Origin = 'cmb_horalt'
      Size = 8
    end
  end
  object sqlAbrCaixa: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * From "99999999999999_TESTE".abrcaixa '
      
        'LEFT Join "99999999999999_TESTE".caixa on cxa_codigo = abc_codcx' +
        'a '
      
        'LEFT Join "99999999999999_TESTE".ccorrente on cct_codigo = cxa_c' +
        'odcct'
      'LEFT Join "dbconfig".banco on bco_codigo = cct_codbco'
      'LEFT Join "dbconfig".usuario on usu_codusu = cxa_codusu ')
    Left = 968
    Top = 264
    object sqlAbrCaixaabc_codigo: TIntegerField
      FieldName = 'abc_codigo'
      Origin = 'abc_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlAbrCaixaabc_codcxa: TIntegerField
      FieldName = 'abc_codcxa'
      Origin = 'abc_codcxa'
    end
    object sqlAbrCaixaabc_codcct: TIntegerField
      FieldName = 'abc_codcct'
      Origin = 'abc_codcct'
    end
    object sqlAbrCaixaabc_databr: TDateField
      FieldName = 'abc_databr'
      Origin = 'abc_databr'
    end
    object sqlAbrCaixaabc_datfch: TDateField
      FieldName = 'abc_datfch'
      Origin = 'abc_datfch'
    end
    object sqlAbrCaixaabc_vlrini: TBCDField
      FieldName = 'abc_vlrini'
      Origin = 'abc_vlrini'
      Precision = 15
      Size = 2
    end
    object sqlAbrCaixaabc_vlrant: TBCDField
      FieldName = 'abc_vlrant'
      Origin = 'abc_vlrant'
      Precision = 15
      Size = 2
    end
    object sqlAbrCaixaabc_vlratu: TBCDField
      FieldName = 'abc_vlratu'
      Origin = 'abc_vlratu'
      Precision = 15
      Size = 2
    end
    object sqlAbrCaixaabc_usuinc: TStringField
      FieldName = 'abc_usuinc'
      Origin = 'abc_usuinc'
      Size = 15
    end
    object sqlAbrCaixaabc_datinc: TDateField
      FieldName = 'abc_datinc'
      Origin = 'abc_datinc'
    end
    object sqlAbrCaixaabc_horinc: TStringField
      FieldName = 'abc_horinc'
      Origin = 'abc_horinc'
      Size = 8
    end
    object sqlAbrCaixaabc_usualt: TStringField
      FieldName = 'abc_usualt'
      Origin = 'abc_usualt'
      Size = 15
    end
    object sqlAbrCaixaabc_datalt: TDateField
      FieldName = 'abc_datalt'
      Origin = 'abc_datalt'
    end
    object sqlAbrCaixaabc_horalt: TStringField
      FieldName = 'abc_horalt'
      Origin = 'abc_horalt'
      Size = 8
    end
    object sqlAbrCaixacxa_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cxa_codigo'
      Origin = 'cxa_codigo'
    end
    object sqlAbrCaixacxa_codcct: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cxa_codcct'
      Origin = 'cxa_codcct'
    end
    object sqlAbrCaixacxa_codusu: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cxa_codusu'
      Origin = 'cxa_codusu'
    end
    object sqlAbrCaixacxa_ativo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cxa_ativo'
      Origin = 'cxa_ativo'
      FixedChar = True
      Size = 1
    end
    object sqlAbrCaixacxa_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cxa_usuinc'
      Origin = 'cxa_usuinc'
      Size = 15
    end
    object sqlAbrCaixacxa_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cxa_datinc'
      Origin = 'cxa_datinc'
    end
    object sqlAbrCaixacxa_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cxa_horinc'
      Origin = 'cxa_horinc'
      Size = 8
    end
    object sqlAbrCaixacxa_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cxa_usualt'
      Origin = 'cxa_usualt'
      Size = 15
    end
    object sqlAbrCaixacxa_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cxa_datalt'
      Origin = 'cxa_datalt'
    end
    object sqlAbrCaixacxa_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cxa_horalt'
      Origin = 'cxa_horalt'
      Size = 8
    end
    object sqlAbrCaixacct_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cct_codigo'
      Origin = 'cct_codigo'
    end
    object sqlAbrCaixacct_codbco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_codbco'
      Origin = 'cct_codbco'
      Size = 6
    end
    object sqlAbrCaixacct_agencia: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_agencia'
      Origin = 'cct_agencia'
      Size = 9
    end
    object sqlAbrCaixacct_nrconta: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_nrconta'
      Origin = 'cct_nrconta'
      Size = 9
    end
    object sqlAbrCaixacct_codpcd: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_codpcd'
      Origin = 'cct_codpcd'
      Size = 10
    end
    object sqlAbrCaixacct_codpcc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_codpcc'
      Origin = 'cct_codpcc'
      Size = 10
    end
    object sqlAbrCaixacct_telef1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_telef1'
      Origin = 'cct_telef1'
      Size = 12
    end
    object sqlAbrCaixacct_telef2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_telef2'
      Origin = 'cct_telef2'
      Size = 12
    end
    object sqlAbrCaixacct_celula: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_celula'
      Origin = 'cct_celula'
      Size = 12
    end
    object sqlAbrCaixacct_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_usuinc'
      Origin = 'cct_usuinc'
      Size = 15
    end
    object sqlAbrCaixacct_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cct_datinc'
      Origin = 'cct_datinc'
    end
    object sqlAbrCaixacct_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_horinc'
      Origin = 'cct_horinc'
      Size = 8
    end
    object sqlAbrCaixacct_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_usualt'
      Origin = 'cct_usualt'
      Size = 15
    end
    object sqlAbrCaixacct_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cct_datalt'
      Origin = 'cct_datalt'
    end
    object sqlAbrCaixacct_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_horalt'
      Origin = 'cct_horalt'
      Size = 8
    end
    object sqlAbrCaixabco_codigo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bco_codigo'
      Origin = 'bco_codigo'
      Size = 6
    end
    object sqlAbrCaixabco_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bco_nome'
      Origin = 'bco_nome'
      Size = 70
    end
    object sqlAbrCaixabco_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bco_usuinc'
      Origin = 'bco_usuinc'
      Size = 15
    end
    object sqlAbrCaixabco_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'bco_datinc'
      Origin = 'bco_datinc'
    end
    object sqlAbrCaixabco_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bco_horinc'
      Origin = 'bco_horinc'
      Size = 8
    end
    object sqlAbrCaixabco_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bco_usualt'
      Origin = 'bco_usualt'
      Size = 15
    end
    object sqlAbrCaixabco_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'bco_datalt'
      Origin = 'bco_datalt'
    end
    object sqlAbrCaixabco_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bco_horalt'
      Origin = 'bco_horalt'
      Size = 8
    end
    object sqlAbrCaixausu_codusu: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'usu_codusu'
      Origin = 'usu_codusu'
    end
    object sqlAbrCaixausu_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'usu_nome'
      Origin = 'usu_nome'
      Size = 50
    end
    object sqlAbrCaixausu_login: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'usu_login'
      Origin = 'usu_login'
      Size = 15
    end
    object sqlAbrCaixausu_senha: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'usu_senha'
      Origin = 'usu_senha'
      Size = 10
    end
    object sqlAbrCaixausu_codgru: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'usu_codgru'
      Origin = 'usu_codgru'
    end
    object sqlAbrCaixausu_codsgr: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'usu_codsgr'
      Origin = 'usu_codsgr'
    end
    object sqlAbrCaixausu_codltd: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'usu_codltd'
      Origin = 'usu_codltd'
    end
    object sqlAbrCaixausu_email: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'usu_email'
      Origin = 'usu_email'
      Size = 100
    end
    object sqlAbrCaixausu_usuario: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'usu_usuario'
      Origin = 'usu_usuario'
      Size = 100
    end
    object sqlAbrCaixausu_senema: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'usu_senema'
      Origin = 'usu_senema'
    end
    object sqlAbrCaixausu_smtp: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'usu_smtp'
      Origin = 'usu_smtp'
      Size = 100
    end
    object sqlAbrCaixausu_porta: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'usu_porta'
      Origin = 'usu_porta'
      Size = 5
    end
    object sqlAbrCaixausu_tsl: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'usu_tsl'
      Origin = 'usu_tsl'
      Size = 15
    end
    object sqlAbrCaixausu_metodo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'usu_metodo'
      Origin = 'usu_metodo'
      Size = 15
    end
    object sqlAbrCaixausu_modseg: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'usu_modseg'
      Origin = 'usu_modseg'
      FixedChar = True
      Size = 1
    end
    object sqlAbrCaixausu_autent: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'usu_autent'
      Origin = 'usu_autent'
      FixedChar = True
      Size = 1
    end
    object sqlAbrCaixausu_foto: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'usu_foto'
      Origin = 'usu_foto'
    end
    object sqlAbrCaixausu_database: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'usu_database'
      Origin = 'usu_database'
      Size = 70
    end
    object sqlAbrCaixausu_autoriza: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'usu_autoriza'
      Origin = 'usu_autoriza'
    end
    object sqlAbrCaixausu_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'usu_usuinc'
      Origin = 'usu_usuinc'
      Size = 15
    end
    object sqlAbrCaixausu_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'usu_datinc'
      Origin = 'usu_datinc'
    end
    object sqlAbrCaixausu_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'usu_horinc'
      Origin = 'usu_horinc'
      Size = 8
    end
    object sqlAbrCaixausu_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'usu_usualt'
      Origin = 'usu_usualt'
      Size = 15
    end
    object sqlAbrCaixausu_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'usu_datalt'
      Origin = 'usu_datalt'
    end
    object sqlAbrCaixausu_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'usu_horalt'
      Origin = 'usu_horalt'
      Size = 8
    end
  end
  object sqlCtapg: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * from "99999999999999_TESTE".financecab'
      
        'LEFT JOIN "99999999999999_TESTE".financeiro on fcr_codcfr = cfr_' +
        'codigo'
      
        'LEFT JOIN "99999999999999_TESTE".caixa on cxa_codigo = fcr_codcx' +
        'a'
      
        'LEFT JOIN "99999999999999_TESTE".abrcaixa on abc_codigo = fcr_co' +
        'dabc'
      
        'LEFT JOIN "99999999999999_TESTE".ccorrente on cct_codigo = fcr_c' +
        'odcct order by cfr_codigo')
    Left = 968
    Top = 320
    object sqlCtapgcfr_codigo: TIntegerField
      FieldName = 'cfr_codigo'
      Origin = 'cfr_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlCtapgcfr_numdoc: TStringField
      FieldName = 'cfr_numdoc'
      Origin = 'cfr_numdoc'
      Size = 24
    end
    object sqlCtapgcfr_codant: TIntegerField
      FieldName = 'cfr_codant'
      Origin = 'cfr_codant'
    end
    object sqlCtapgcfr_codfnd: TIntegerField
      FieldName = 'cfr_codfnd'
      Origin = 'cfr_codfnd'
    end
    object sqlCtapgcfr_codpss: TIntegerField
      FieldName = 'cfr_codpss'
      Origin = 'cfr_codpss'
    end
    object sqlCtapgcfr_codcli: TIntegerField
      FieldName = 'cfr_codcli'
      Origin = 'cfr_codcli'
    end
    object sqlCtapgcfr_codpct: TStringField
      FieldName = 'cfr_codpct'
      Origin = 'cfr_codpct'
      Size = 10
    end
    object sqlCtapgcfr_descri: TStringField
      FieldName = 'cfr_descri'
      Origin = 'cfr_descri'
      Size = 100
    end
    object sqlCtapgcfr_datems: TDateField
      FieldName = 'cfr_datems'
      Origin = 'cfr_datems'
    end
    object sqlCtapgcfr_datven: TDateField
      FieldName = 'cfr_datven'
      Origin = 'cfr_datven'
    end
    object sqlCtapgcfr_totpar: TStringField
      FieldName = 'cfr_totpar'
      Origin = 'cfr_totpar'
      Size = 3
    end
    object sqlCtapgcfr_vlrapg: TBCDField
      FieldName = 'cfr_vlrapg'
      Origin = 'cfr_vlrapg'
      Precision = 15
      Size = 2
    end
    object sqlCtapgcfr_vlrdes: TBCDField
      FieldName = 'cfr_vlrdes'
      Origin = 'cfr_vlrdes'
      Precision = 15
      Size = 2
    end
    object sqlCtapgcfr_vlracr: TBCDField
      FieldName = 'cfr_vlracr'
      Origin = 'cfr_vlracr'
      Precision = 15
      Size = 2
    end
    object sqlCtapgcfr_vlrtot: TBCDField
      FieldName = 'cfr_vlrtot'
      Origin = 'cfr_vlrtot'
      Precision = 15
      Size = 2
    end
    object sqlCtapgcfr_period: TStringField
      FieldName = 'cfr_period'
      Origin = 'cfr_period'
      FixedChar = True
      Size = 1
    end
    object sqlCtapgcfr_tipdoc: TStringField
      FieldName = 'cfr_tipdoc'
      Origin = 'cfr_tipdoc'
      Size = 1
    end
    object sqlCtapgcfr_usuinc: TStringField
      FieldName = 'cfr_usuinc'
      Origin = 'cfr_usuinc'
      Size = 15
    end
    object sqlCtapgcfr_datinc: TDateField
      FieldName = 'cfr_datinc'
      Origin = 'cfr_datinc'
    end
    object sqlCtapgcfr_horinc: TStringField
      FieldName = 'cfr_horinc'
      Origin = 'cfr_horinc'
      Size = 8
    end
    object sqlCtapgcfr_usualt: TStringField
      FieldName = 'cfr_usualt'
      Origin = 'cfr_usualt'
      Size = 15
    end
    object sqlCtapgcfr_datalt: TDateField
      FieldName = 'cfr_datalt'
      Origin = 'cfr_datalt'
    end
    object sqlCtapgcfr_horalt: TStringField
      FieldName = 'cfr_horalt'
      Origin = 'cfr_horalt'
      Size = 8
    end
    object sqlCtapgfcr_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'fcr_codigo'
      Origin = 'fcr_codigo'
    end
    object sqlCtapgfcr_codcfr: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'fcr_codcfr'
      Origin = 'fcr_codcfr'
    end
    object sqlCtapgfcr_codcxa: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'fcr_codcxa'
      Origin = 'fcr_codcxa'
    end
    object sqlCtapgfcr_codabc: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'fcr_codabc'
      Origin = 'fcr_codabc'
    end
    object sqlCtapgfcr_codcct: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'fcr_codcct'
      Origin = 'fcr_codcct'
    end
    object sqlCtapgfcr_codfpg: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'fcr_codfpg'
      Origin = 'fcr_codfpg'
    end
    object sqlCtapgfcr_datpag: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'fcr_datpag'
      Origin = 'fcr_datpag'
    end
    object sqlCtapgfcr_datven: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'fcr_datven'
      Origin = 'fcr_datven'
    end
    object sqlCtapgfcr_numpar: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fcr_numpar'
      Origin = 'fcr_numpar'
      Size = 3
    end
    object sqlCtapgfcr_descri: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fcr_descri'
      Origin = 'fcr_descri'
      Size = 100
    end
    object sqlCtapgfcr_status: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fcr_status'
      Origin = 'fcr_status'
      Size = 3
    end
    object sqlCtapgfcr_tippro: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fcr_tippro'
      Origin = 'fcr_tippro'
      Size = 3
    end
    object sqlCtapgfcr_vlrapg: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'fcr_vlrapg'
      Origin = 'fcr_vlrapg'
      Precision = 15
      Size = 2
    end
    object sqlCtapgfcr_vlrpag: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'fcr_vlrpag'
      Origin = 'fcr_vlrpag'
      Precision = 15
      Size = 2
    end
    object sqlCtapgfcr_check: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'fcr_check'
      Origin = 'fcr_check'
    end
    object sqlCtapgfcr_numbol: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fcr_numbol'
      Origin = 'fcr_numbol'
      Size = 45
    end
    object sqlCtapgfcr_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fcr_usuinc'
      Origin = 'fcr_usuinc'
      Size = 15
    end
    object sqlCtapgfcr_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'fcr_datinc'
      Origin = 'fcr_datinc'
    end
    object sqlCtapgfcr_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fcr_horinc'
      Origin = 'fcr_horinc'
      Size = 8
    end
    object sqlCtapgfcr_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fcr_usualt'
      Origin = 'fcr_usualt'
      Size = 15
    end
    object sqlCtapgfcr_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'fcr_datalt'
      Origin = 'fcr_datalt'
    end
    object sqlCtapgfcr_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fcr_horalt'
      Origin = 'fcr_horalt'
      Size = 8
    end
    object sqlCtapgcxa_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cxa_codigo'
      Origin = 'cxa_codigo'
    end
    object sqlCtapgcxa_codcct: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cxa_codcct'
      Origin = 'cxa_codcct'
    end
    object sqlCtapgcxa_codusu: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cxa_codusu'
      Origin = 'cxa_codusu'
    end
    object sqlCtapgcxa_ativo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cxa_ativo'
      Origin = 'cxa_ativo'
      FixedChar = True
      Size = 1
    end
    object sqlCtapgcxa_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cxa_usuinc'
      Origin = 'cxa_usuinc'
      Size = 15
    end
    object sqlCtapgcxa_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cxa_datinc'
      Origin = 'cxa_datinc'
    end
    object sqlCtapgcxa_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cxa_horinc'
      Origin = 'cxa_horinc'
      Size = 8
    end
    object sqlCtapgcxa_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cxa_usualt'
      Origin = 'cxa_usualt'
      Size = 15
    end
    object sqlCtapgcxa_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cxa_datalt'
      Origin = 'cxa_datalt'
    end
    object sqlCtapgcxa_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cxa_horalt'
      Origin = 'cxa_horalt'
      Size = 8
    end
    object sqlCtapgabc_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'abc_codigo'
      Origin = 'abc_codigo'
    end
    object sqlCtapgabc_codcxa: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'abc_codcxa'
      Origin = 'abc_codcxa'
    end
    object sqlCtapgabc_codcct: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'abc_codcct'
      Origin = 'abc_codcct'
    end
    object sqlCtapgabc_databr: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'abc_databr'
      Origin = 'abc_databr'
    end
    object sqlCtapgabc_datfch: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'abc_datfch'
      Origin = 'abc_datfch'
    end
    object sqlCtapgabc_vlrini: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'abc_vlrini'
      Origin = 'abc_vlrini'
      Precision = 15
      Size = 2
    end
    object sqlCtapgabc_vlrant: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'abc_vlrant'
      Origin = 'abc_vlrant'
      Precision = 15
      Size = 2
    end
    object sqlCtapgabc_vlratu: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'abc_vlratu'
      Origin = 'abc_vlratu'
      Precision = 15
      Size = 2
    end
    object sqlCtapgabc_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'abc_usuinc'
      Origin = 'abc_usuinc'
      Size = 15
    end
    object sqlCtapgabc_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'abc_datinc'
      Origin = 'abc_datinc'
    end
    object sqlCtapgabc_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'abc_horinc'
      Origin = 'abc_horinc'
      Size = 8
    end
    object sqlCtapgabc_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'abc_usualt'
      Origin = 'abc_usualt'
      Size = 15
    end
    object sqlCtapgabc_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'abc_datalt'
      Origin = 'abc_datalt'
    end
    object sqlCtapgabc_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'abc_horalt'
      Origin = 'abc_horalt'
      Size = 8
    end
    object sqlCtapgcct_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cct_codigo'
      Origin = 'cct_codigo'
    end
    object sqlCtapgcct_codbco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_codbco'
      Origin = 'cct_codbco'
      Size = 6
    end
    object sqlCtapgcct_agencia: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_agencia'
      Origin = 'cct_agencia'
      Size = 9
    end
    object sqlCtapgcct_nrconta: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_nrconta'
      Origin = 'cct_nrconta'
      Size = 9
    end
    object sqlCtapgcct_codpcd: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_codpcd'
      Origin = 'cct_codpcd'
      Size = 10
    end
    object sqlCtapgcct_codpcc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_codpcc'
      Origin = 'cct_codpcc'
      Size = 10
    end
    object sqlCtapgcct_telef1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_telef1'
      Origin = 'cct_telef1'
      Size = 12
    end
    object sqlCtapgcct_telef2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_telef2'
      Origin = 'cct_telef2'
      Size = 12
    end
    object sqlCtapgcct_celula: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_celula'
      Origin = 'cct_celula'
      Size = 12
    end
    object sqlCtapgcct_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_usuinc'
      Origin = 'cct_usuinc'
      Size = 15
    end
    object sqlCtapgcct_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cct_datinc'
      Origin = 'cct_datinc'
    end
    object sqlCtapgcct_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_horinc'
      Origin = 'cct_horinc'
      Size = 8
    end
    object sqlCtapgcct_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_usualt'
      Origin = 'cct_usualt'
      Size = 15
    end
    object sqlCtapgcct_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cct_datalt'
      Origin = 'cct_datalt'
    end
    object sqlCtapgcct_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_horalt'
      Origin = 'cct_horalt'
      Size = 8
    end
  end
  object sqlTanque: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * FROM "99999999999999_TESTE".tanque '
      'LEFT JOIN "dbconfig".combustivel on cmb_codigo = tnq_codcmb')
    Left = 968
    Top = 376
    object sqlTanquetnq_codigo: TIntegerField
      FieldName = 'tnq_codigo'
      Origin = 'tnq_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlTanquetnq_codcmb: TIntegerField
      FieldName = 'tnq_codcmb'
      Origin = 'tnq_codcmb'
    end
    object sqlTanquetnq_nome: TStringField
      FieldName = 'tnq_nome'
      Origin = 'tnq_nome'
      Size = 25
    end
    object sqlTanquetnq_nmrinc: TBCDField
      FieldName = 'tnq_nmrinc'
      Origin = 'tnq_nmrinc'
      Precision = 7
      Size = 0
    end
    object sqlTanquetnq_vlrcst: TBCDField
      FieldName = 'tnq_vlrcst'
      Origin = 'tnq_vlrcst'
      Precision = 15
      Size = 2
    end
    object sqlTanquetnq_ltsmin: TBCDField
      FieldName = 'tnq_ltsmin'
      Origin = 'tnq_ltsmin'
      Precision = 15
      Size = 3
    end
    object sqlTanquetnq_ltsetq: TBCDField
      FieldName = 'tnq_ltsetq'
      Origin = 'tnq_ltsetq'
      Precision = 15
      Size = 3
    end
    object sqlTanquetnq_ativo: TBooleanField
      FieldName = 'tnq_ativo'
      Origin = 'tnq_ativo'
    end
    object sqlTanquetnq_usuinc: TStringField
      FieldName = 'tnq_usuinc'
      Origin = 'tnq_usuinc'
      Size = 15
    end
    object sqlTanquetnq_datinc: TDateField
      FieldName = 'tnq_datinc'
      Origin = 'tnq_datinc'
    end
    object sqlTanquetnq_horinc: TStringField
      FieldName = 'tnq_horinc'
      Origin = 'tnq_horinc'
      Size = 8
    end
    object sqlTanquetnq_usualt: TStringField
      FieldName = 'tnq_usualt'
      Origin = 'tnq_usualt'
      Size = 15
    end
    object sqlTanquetnq_datalt: TDateField
      FieldName = 'tnq_datalt'
      Origin = 'tnq_datalt'
    end
    object sqlTanquetnq_horalt: TStringField
      FieldName = 'tnq_horalt'
      Origin = 'tnq_horalt'
      Size = 8
    end
    object sqlTanquecmb_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cmb_codigo'
      Origin = 'cmb_codigo'
    end
    object sqlTanquecmb_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cmb_nome'
      Origin = 'cmb_nome'
    end
    object sqlTanquecmb_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cmb_usuinc'
      Origin = 'cmb_usuinc'
      Size = 15
    end
    object sqlTanquecmb_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cmb_datinc'
      Origin = 'cmb_datinc'
    end
    object sqlTanquecmb_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cmb_horinc'
      Origin = 'cmb_horinc'
      Size = 8
    end
    object sqlTanquecmb_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cmb_usualt'
      Origin = 'cmb_usualt'
      Size = 15
    end
    object sqlTanquecmb_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cmb_datalt'
      Origin = 'cmb_datalt'
    end
    object sqlTanquecmb_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cmb_horalt'
      Origin = 'cmb_horalt'
      Size = 8
    end
  end
  object sqlBomba: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * FROM "99999999999999_TESTE".bomba '
      
        'LEFT JOIN "99999999999999_TESTE".tanque on tnq_codigo = bmb_codt' +
        'nq'
      'LEFT JOIN "dbconfig".combustivel on cmb_codigo = bmb_codcmb')
    Left = 968
    Top = 432
    object sqlBombabmb_codigo: TIntegerField
      FieldName = 'bmb_codigo'
      Origin = 'bmb_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlBombabmb_codtnq: TIntegerField
      FieldName = 'bmb_codtnq'
      Origin = 'bmb_codtnq'
    end
    object sqlBombabmb_codcmb: TIntegerField
      FieldName = 'bmb_codcmb'
      Origin = 'bmb_codcmb'
    end
    object sqlBombabmb_nome: TStringField
      FieldName = 'bmb_nome'
      Origin = 'bmb_nome'
      Size = 25
    end
    object sqlBombabmb_nmrinc: TBCDField
      FieldName = 'bmb_nmrinc'
      Origin = 'bmb_nmrinc'
      Precision = 7
      Size = 0
    end
    object sqlBombabmb_ativo: TBooleanField
      FieldName = 'bmb_ativo'
      Origin = 'bmb_ativo'
    end
    object sqlBombabmb_usuinc: TStringField
      FieldName = 'bmb_usuinc'
      Origin = 'bmb_usuinc'
      Size = 15
    end
    object sqlBombabmb_datinc: TDateField
      FieldName = 'bmb_datinc'
      Origin = 'bmb_datinc'
    end
    object sqlBombabmb_horinc: TStringField
      FieldName = 'bmb_horinc'
      Origin = 'bmb_horinc'
      Size = 8
    end
    object sqlBombabmb_usualt: TStringField
      FieldName = 'bmb_usualt'
      Origin = 'bmb_usualt'
      Size = 15
    end
    object sqlBombabmb_datalt: TDateField
      FieldName = 'bmb_datalt'
      Origin = 'bmb_datalt'
    end
    object sqlBombabmb_horalt: TStringField
      FieldName = 'bmb_horalt'
      Origin = 'bmb_horalt'
      Size = 8
    end
    object sqlBombatnq_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'tnq_codigo'
      Origin = 'tnq_codigo'
    end
    object sqlBombatnq_codcmb: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'tnq_codcmb'
      Origin = 'tnq_codcmb'
    end
    object sqlBombatnq_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tnq_nome'
      Origin = 'tnq_nome'
      Size = 25
    end
    object sqlBombatnq_nmrinc: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tnq_nmrinc'
      Origin = 'tnq_nmrinc'
      Precision = 7
      Size = 0
    end
    object sqlBombatnq_vlrcst: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tnq_vlrcst'
      Origin = 'tnq_vlrcst'
      Precision = 15
      Size = 2
    end
    object sqlBombatnq_ltsmin: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tnq_ltsmin'
      Origin = 'tnq_ltsmin'
      Precision = 15
      Size = 3
    end
    object sqlBombatnq_ltsetq: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tnq_ltsetq'
      Origin = 'tnq_ltsetq'
      Precision = 15
      Size = 3
    end
    object sqlBombatnq_ativo: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'tnq_ativo'
      Origin = 'tnq_ativo'
    end
    object sqlBombatnq_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tnq_usuinc'
      Origin = 'tnq_usuinc'
      Size = 15
    end
    object sqlBombatnq_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'tnq_datinc'
      Origin = 'tnq_datinc'
    end
    object sqlBombatnq_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tnq_horinc'
      Origin = 'tnq_horinc'
      Size = 8
    end
    object sqlBombatnq_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tnq_usualt'
      Origin = 'tnq_usualt'
      Size = 15
    end
    object sqlBombatnq_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'tnq_datalt'
      Origin = 'tnq_datalt'
    end
    object sqlBombatnq_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tnq_horalt'
      Origin = 'tnq_horalt'
      Size = 8
    end
    object sqlBombacmb_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cmb_codigo'
      Origin = 'cmb_codigo'
    end
    object sqlBombacmb_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cmb_nome'
      Origin = 'cmb_nome'
    end
    object sqlBombacmb_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cmb_usuinc'
      Origin = 'cmb_usuinc'
      Size = 15
    end
    object sqlBombacmb_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cmb_datinc'
      Origin = 'cmb_datinc'
    end
    object sqlBombacmb_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cmb_horinc'
      Origin = 'cmb_horinc'
      Size = 8
    end
    object sqlBombacmb_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cmb_usualt'
      Origin = 'cmb_usualt'
      Size = 15
    end
    object sqlBombacmb_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cmb_datalt'
      Origin = 'cmb_datalt'
    end
    object sqlBombacmb_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cmb_horalt'
      Origin = 'cmb_horalt'
      Size = 8
    end
  end
  object sqlIncerrante: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * FROM "99999999999999_TESTE".incerrante '
      
        'LEFT JOIN "99999999999999_TESTE".bomba on bmb_codigo = ict_codbm' +
        'b')
    Left = 969
    Top = 488
    object sqlIncerranteict_codigo: TIntegerField
      FieldName = 'ict_codigo'
      Origin = 'ict_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlIncerranteict_codbmb: TIntegerField
      FieldName = 'ict_codbmb'
      Origin = 'ict_codbmb'
    end
    object sqlIncerranteict_nmrien: TBCDField
      FieldName = 'ict_nmrien'
      Origin = 'ict_nmrien'
      Precision = 12
      Size = 0
    end
    object sqlIncerranteict_datent: TDateField
      FieldName = 'ict_datent'
      Origin = 'ict_datent'
    end
    object sqlIncerranteict_horent: TStringField
      FieldName = 'ict_horent'
      Origin = 'ict_horent'
      Size = 8
    end
    object sqlIncerranteict_nmrisa: TBCDField
      FieldName = 'ict_nmrisa'
      Origin = 'ict_nmrisa'
      Precision = 12
      Size = 0
    end
    object sqlIncerranteict_datsai: TDateField
      FieldName = 'ict_datsai'
      Origin = 'ict_datsai'
    end
    object sqlIncerranteict_horsai: TStringField
      FieldName = 'ict_horsai'
      Origin = 'ict_horsai'
      Size = 8
    end
    object sqlIncerranteict_usuinc: TStringField
      FieldName = 'ict_usuinc'
      Origin = 'ict_usuinc'
      Size = 15
    end
    object sqlIncerranteict_datinc: TDateField
      FieldName = 'ict_datinc'
      Origin = 'ict_datinc'
    end
    object sqlIncerranteict_horinc: TStringField
      FieldName = 'ict_horinc'
      Origin = 'ict_horinc'
      Size = 8
    end
    object sqlIncerranteict_usualt: TStringField
      FieldName = 'ict_usualt'
      Origin = 'ict_usualt'
      Size = 15
    end
    object sqlIncerranteict_datalt: TDateField
      FieldName = 'ict_datalt'
      Origin = 'ict_datalt'
    end
    object sqlIncerranteict_horalt: TStringField
      FieldName = 'ict_horalt'
      Origin = 'ict_horalt'
      Size = 8
    end
    object sqlIncerrantebmb_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'bmb_codigo'
      Origin = 'bmb_codigo'
    end
    object sqlIncerrantebmb_codtnq: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'bmb_codtnq'
      Origin = 'bmb_codtnq'
    end
    object sqlIncerrantebmb_codcmb: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'bmb_codcmb'
      Origin = 'bmb_codcmb'
    end
    object sqlIncerrantebmb_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bmb_nome'
      Origin = 'bmb_nome'
      Size = 25
    end
    object sqlIncerrantebmb_nmrinc: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'bmb_nmrinc'
      Origin = 'bmb_nmrinc'
      Precision = 7
      Size = 0
    end
    object sqlIncerrantebmb_ativo: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'bmb_ativo'
      Origin = 'bmb_ativo'
    end
    object sqlIncerrantebmb_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bmb_usuinc'
      Origin = 'bmb_usuinc'
      Size = 15
    end
    object sqlIncerrantebmb_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'bmb_datinc'
      Origin = 'bmb_datinc'
    end
    object sqlIncerrantebmb_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bmb_horinc'
      Origin = 'bmb_horinc'
      Size = 8
    end
    object sqlIncerrantebmb_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bmb_usualt'
      Origin = 'bmb_usualt'
      Size = 15
    end
    object sqlIncerrantebmb_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'bmb_datalt'
      Origin = 'bmb_datalt'
    end
    object sqlIncerrantebmb_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bmb_horalt'
      Origin = 'bmb_horalt'
      Size = 8
    end
  end
  object sqlPneuMod: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * FROM "99999999999999_TESTE".pneumod '
      'LEFT JOIN "dbconfig".pneudes on pds_codigo = pmd_codpds'
      'LEFT JOIN "dbconfig".pneudim on pdm_codigo = pmd_codpdm'
      'LEFT JOIN "dbconfig".pneufab on pfb_codigo = pmd_codpfb')
    Left = 968
    Top = 536
    object sqlPneuModpmd_codigo: TIntegerField
      FieldName = 'pmd_codigo'
      Origin = 'pmd_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlPneuModpmd_nome: TStringField
      FieldName = 'pmd_nome'
      Origin = 'pmd_nome'
      Size = 50
    end
    object sqlPneuModpmd_sucref: TStringField
      FieldName = 'pmd_sucref'
      Origin = 'pmd_sucref'
      Size = 1
    end
    object sqlPneuModpmd_sucnov: TStringField
      FieldName = 'pmd_sucnov'
      Origin = 'pmd_sucnov'
      Size = 1
    end
    object sqlPneuModpmd_codpds: TIntegerField
      FieldName = 'pmd_codpds'
      Origin = 'pmd_codpds'
    end
    object sqlPneuModpmd_codpdm: TIntegerField
      FieldName = 'pmd_codpdm'
      Origin = 'pmd_codpdm'
    end
    object sqlPneuModpmd_codpfb: TIntegerField
      FieldName = 'pmd_codpfb'
      Origin = 'pmd_codpfb'
    end
    object sqlPneuModpmd_kmvid1: TBCDField
      FieldName = 'pmd_kmvid1'
      Origin = 'pmd_kmvid1'
      Precision = 7
      Size = 0
    end
    object sqlPneuModpmd_kmvid2: TBCDField
      FieldName = 'pmd_kmvid2'
      Origin = 'pmd_kmvid2'
      Precision = 7
      Size = 0
    end
    object sqlPneuModpmd_kmvid3: TBCDField
      FieldName = 'pmd_kmvid3'
      Origin = 'pmd_kmvid3'
      Precision = 7
      Size = 0
    end
    object sqlPneuModpmd_kmvid4: TBCDField
      FieldName = 'pmd_kmvid4'
      Origin = 'pmd_kmvid4'
      Precision = 7
      Size = 0
    end
    object sqlPneuModpmd_kmvid5: TBCDField
      FieldName = 'pmd_kmvid5'
      Origin = 'pmd_kmvid5'
      Precision = 7
      Size = 0
    end
    object sqlPneuModpmd_kmvid6: TBCDField
      FieldName = 'pmd_kmvid6'
      Origin = 'pmd_kmvid6'
      Precision = 7
      Size = 0
    end
    object sqlPneuModpmd_kmvid7: TBCDField
      FieldName = 'pmd_kmvid7'
      Origin = 'pmd_kmvid7'
      Precision = 7
      Size = 0
    end
    object sqlPneuModpmd_kmvid8: TBCDField
      FieldName = 'pmd_kmvid8'
      Origin = 'pmd_kmvid8'
      Precision = 7
      Size = 0
    end
    object sqlPneuModpmd_kmvid9: TBCDField
      FieldName = 'pmd_kmvid9'
      Origin = 'pmd_kmvid9'
      Precision = 7
      Size = 0
    end
    object sqlPneuModpmd_usuinc: TStringField
      FieldName = 'pmd_usuinc'
      Origin = 'pmd_usuinc'
      Size = 15
    end
    object sqlPneuModpmd_datinc: TDateField
      FieldName = 'pmd_datinc'
      Origin = 'pmd_datinc'
    end
    object sqlPneuModpmd_horinc: TStringField
      FieldName = 'pmd_horinc'
      Origin = 'pmd_horinc'
      Size = 8
    end
    object sqlPneuModpmd_usualt: TStringField
      FieldName = 'pmd_usualt'
      Origin = 'pmd_usualt'
      Size = 15
    end
    object sqlPneuModpmd_datalt: TDateField
      FieldName = 'pmd_datalt'
      Origin = 'pmd_datalt'
    end
    object sqlPneuModpmd_horalt: TStringField
      FieldName = 'pmd_horalt'
      Origin = 'pmd_horalt'
      Size = 8
    end
    object sqlPneuModpds_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'pds_codigo'
      Origin = 'pds_codigo'
    end
    object sqlPneuModpds_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pds_nome'
      Origin = 'pds_nome'
    end
    object sqlPneuModpds_sucos: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pds_sucos'
      Origin = 'pds_sucos'
      Size = 1
    end
    object sqlPneuModpds_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pds_usuinc'
      Origin = 'pds_usuinc'
      Size = 15
    end
    object sqlPneuModpds_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pds_datinc'
      Origin = 'pds_datinc'
    end
    object sqlPneuModpds_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pds_horinc'
      Origin = 'pds_horinc'
      Size = 8
    end
    object sqlPneuModpds_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pds_usualt'
      Origin = 'pds_usualt'
      Size = 15
    end
    object sqlPneuModpds_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pds_datalt'
      Origin = 'pds_datalt'
    end
    object sqlPneuModpds_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pds_horalt'
      Origin = 'pds_horalt'
      Size = 8
    end
    object sqlPneuModpdm_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'pdm_codigo'
      Origin = 'pdm_codigo'
    end
    object sqlPneuModpdm_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pdm_nome'
      Origin = 'pdm_nome'
    end
    object sqlPneuModpdm_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pdm_usuinc'
      Origin = 'pdm_usuinc'
      Size = 15
    end
    object sqlPneuModpdm_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pdm_datinc'
      Origin = 'pdm_datinc'
    end
    object sqlPneuModpdm_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pdm_horinc'
      Origin = 'pdm_horinc'
      Size = 8
    end
    object sqlPneuModpdm_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pdm_usualt'
      Origin = 'pdm_usualt'
      Size = 15
    end
    object sqlPneuModpdm_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pdm_datalt'
      Origin = 'pdm_datalt'
    end
    object sqlPneuModpdm_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pdm_horalt'
      Origin = 'pdm_horalt'
      Size = 8
    end
    object sqlPneuModpfb_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'pfb_codigo'
      Origin = 'pfb_codigo'
    end
    object sqlPneuModpfb_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pfb_nome'
      Origin = 'pfb_nome'
      Size = 40
    end
    object sqlPneuModpfb_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pfb_usuinc'
      Origin = 'pfb_usuinc'
      Size = 15
    end
    object sqlPneuModpfb_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pfb_datinc'
      Origin = 'pfb_datinc'
    end
    object sqlPneuModpfb_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pfb_horinc'
      Origin = 'pfb_horinc'
      Size = 8
    end
    object sqlPneuModpfb_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pfb_usualt'
      Origin = 'pfb_usualt'
      Size = 15
    end
    object sqlPneuModpfb_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pfb_datalt'
      Origin = 'pfb_datalt'
    end
    object sqlPneuModpfb_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pfb_horalt'
      Origin = 'pfb_horalt'
      Size = 8
    end
  end
  object sqlPneuIve: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * FROM "99999999999999_TESTE".pneuive '
      
        'LEFT JOIN "99999999999999_TESTE".pneumod on pmd_codigo = piv_cod' +
        'pmd'
      'LEFT JOIN "dbconfig".pneudes on pds_codigo = pmd_codpds'
      'LEFT JOIN "dbconfig".pneudim on pdm_codigo = pmd_codpdm'
      'LEFT JOIN "dbconfig".pneufab on pfb_codigo = pmd_codpfb')
    Left = 968
    Top = 592
    object sqlPneuIvepiv_codigo: TIntegerField
      FieldName = 'piv_codigo'
      Origin = 'piv_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlPneuIvepiv_numser: TStringField
      FieldName = 'piv_numser'
      Origin = 'piv_numser'
      Size = 10
    end
    object sqlPneuIvepiv_numnfe: TStringField
      FieldName = 'piv_numnfe'
      Origin = 'piv_numnfe'
      Size = 10
    end
    object sqlPneuIvepiv_vlrcto: TBCDField
      FieldName = 'piv_vlrcto'
      Origin = 'piv_vlrcto'
      Precision = 15
      Size = 2
    end
    object sqlPneuIvepiv_mfogo: TStringField
      FieldName = 'piv_mfogo'
      Origin = 'piv_mfogo'
      Size = 6
    end
    object sqlPneuIvepiv_numdot: TStringField
      FieldName = 'piv_numdot'
      Origin = 'piv_numdot'
      Size = 10
    end
    object sqlPneuIvepiv_codpmd: TIntegerField
      FieldName = 'piv_codpmd'
      Origin = 'piv_codpmd'
    end
    object sqlPneuIvepiv_codpds: TIntegerField
      FieldName = 'piv_codpds'
      Origin = 'piv_codpds'
    end
    object sqlPneuIvepiv_codplc: TStringField
      FieldName = 'piv_codplc'
      Origin = 'piv_codplc'
      Size = 7
    end
    object sqlPneuIvepiv_mlmsc1: TStringField
      FieldName = 'piv_mlmsc1'
      Origin = 'piv_mlmsc1'
      Size = 2
    end
    object sqlPneuIvepiv_mlmsc2: TStringField
      FieldName = 'piv_mlmsc2'
      Origin = 'piv_mlmsc2'
      Size = 2
    end
    object sqlPneuIvepiv_mlmsc3: TStringField
      FieldName = 'piv_mlmsc3'
      Origin = 'piv_mlmsc3'
      Size = 2
    end
    object sqlPneuIvepiv_mlmsc4: TStringField
      FieldName = 'piv_mlmsc4'
      Origin = 'piv_mlmsc4'
      Size = 2
    end
    object sqlPneuIvepiv_mlmsc5: TStringField
      FieldName = 'piv_mlmsc5'
      Origin = 'piv_mlmsc5'
      Size = 2
    end
    object sqlPneuIvepiv_mlmsc6: TStringField
      FieldName = 'piv_mlmsc6'
      Origin = 'piv_mlmsc6'
      Size = 2
    end
    object sqlPneuIvepiv_kmvda1: TBCDField
      FieldName = 'piv_kmvda1'
      Origin = 'piv_kmvda1'
      Precision = 7
      Size = 0
    end
    object sqlPneuIvepiv_kmvda2: TBCDField
      FieldName = 'piv_kmvda2'
      Origin = 'piv_kmvda2'
      Precision = 7
      Size = 0
    end
    object sqlPneuIvepiv_kmvda3: TBCDField
      FieldName = 'piv_kmvda3'
      Origin = 'piv_kmvda3'
      Precision = 7
      Size = 0
    end
    object sqlPneuIvepiv_kmvda4: TBCDField
      FieldName = 'piv_kmvda4'
      Origin = 'piv_kmvda4'
      Precision = 7
      Size = 0
    end
    object sqlPneuIvepiv_kmvda5: TBCDField
      FieldName = 'piv_kmvda5'
      Origin = 'piv_kmvda5'
      Precision = 7
      Size = 0
    end
    object sqlPneuIvepiv_kmvda6: TBCDField
      FieldName = 'piv_kmvda6'
      Origin = 'piv_kmvda6'
      Precision = 7
      Size = 0
    end
    object sqlPneuIvepiv_kmvda7: TBCDField
      FieldName = 'piv_kmvda7'
      Origin = 'piv_kmvda7'
      Precision = 7
      Size = 0
    end
    object sqlPneuIvepiv_kmvda8: TBCDField
      FieldName = 'piv_kmvda8'
      Origin = 'piv_kmvda8'
      Precision = 7
      Size = 0
    end
    object sqlPneuIvepiv_kmvda9: TBCDField
      FieldName = 'piv_kmvda9'
      Origin = 'piv_kmvda9'
      Precision = 7
      Size = 0
    end
    object sqlPneuIvepiv_kminst: TBCDField
      FieldName = 'piv_kminst'
      Origin = 'piv_kminst'
      Precision = 7
      Size = 0
    end
    object sqlPneuIvepiv_kmmant: TBCDField
      FieldName = 'piv_kmmant'
      Origin = 'piv_kmmant'
      Precision = 7
      Size = 0
    end
    object sqlPneuIvepiv_kmatua: TBCDField
      FieldName = 'piv_kmatua'
      Origin = 'piv_kmatua'
      Precision = 7
      Size = 0
    end
    object sqlPneuIvepiv_kmrodi: TBCDField
      FieldName = 'piv_kmrodi'
      Origin = 'piv_kmrodi'
      Precision = 7
      Size = 0
    end
    object sqlPneuIvepiv_nrvida: TStringField
      FieldName = 'piv_nrvida'
      Origin = 'piv_nrvida'
      Size = 1
    end
    object sqlPneuIvepiv_status: TStringField
      FieldName = 'piv_status'
      Origin = 'piv_status'
      Size = 40
    end
    object sqlPneuIvepiv_situac: TStringField
      FieldName = 'piv_situac'
      Origin = 'piv_situac'
      Size = 40
    end
    object sqlPneuIvepiv_datcmp: TDateField
      FieldName = 'piv_datcmp'
      Origin = 'piv_datcmp'
    end
    object sqlPneuIvepiv_locpne: TStringField
      FieldName = 'piv_locpne'
      Origin = 'piv_locpne'
      Size = 5
    end
    object sqlPneuIvepiv_usuinc: TStringField
      FieldName = 'piv_usuinc'
      Origin = 'piv_usuinc'
      Size = 15
    end
    object sqlPneuIvepiv_datinc: TDateField
      FieldName = 'piv_datinc'
      Origin = 'piv_datinc'
    end
    object sqlPneuIvepiv_horinc: TStringField
      FieldName = 'piv_horinc'
      Origin = 'piv_horinc'
      Size = 8
    end
    object sqlPneuIvepiv_usualt: TStringField
      FieldName = 'piv_usualt'
      Origin = 'piv_usualt'
      Size = 15
    end
    object sqlPneuIvepiv_datalt: TDateField
      FieldName = 'piv_datalt'
      Origin = 'piv_datalt'
    end
    object sqlPneuIvepiv_horalt: TStringField
      FieldName = 'piv_horalt'
      Origin = 'piv_horalt'
      Size = 8
    end
    object sqlPneuIvepmd_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'pmd_codigo'
      Origin = 'pmd_codigo'
    end
    object sqlPneuIvepmd_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pmd_nome'
      Origin = 'pmd_nome'
      Size = 50
    end
    object sqlPneuIvepmd_sucref: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pmd_sucref'
      Origin = 'pmd_sucref'
      Size = 1
    end
    object sqlPneuIvepmd_sucnov: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pmd_sucnov'
      Origin = 'pmd_sucnov'
      Size = 1
    end
    object sqlPneuIvepmd_codpds: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'pmd_codpds'
      Origin = 'pmd_codpds'
    end
    object sqlPneuIvepmd_codpdm: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'pmd_codpdm'
      Origin = 'pmd_codpdm'
    end
    object sqlPneuIvepmd_codpfb: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'pmd_codpfb'
      Origin = 'pmd_codpfb'
    end
    object sqlPneuIvepmd_kmvid1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'pmd_kmvid1'
      Origin = 'pmd_kmvid1'
      Precision = 7
      Size = 0
    end
    object sqlPneuIvepmd_kmvid2: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'pmd_kmvid2'
      Origin = 'pmd_kmvid2'
      Precision = 7
      Size = 0
    end
    object sqlPneuIvepmd_kmvid3: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'pmd_kmvid3'
      Origin = 'pmd_kmvid3'
      Precision = 7
      Size = 0
    end
    object sqlPneuIvepmd_kmvid4: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'pmd_kmvid4'
      Origin = 'pmd_kmvid4'
      Precision = 7
      Size = 0
    end
    object sqlPneuIvepmd_kmvid5: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'pmd_kmvid5'
      Origin = 'pmd_kmvid5'
      Precision = 7
      Size = 0
    end
    object sqlPneuIvepmd_kmvid6: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'pmd_kmvid6'
      Origin = 'pmd_kmvid6'
      Precision = 7
      Size = 0
    end
    object sqlPneuIvepmd_kmvid7: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'pmd_kmvid7'
      Origin = 'pmd_kmvid7'
      Precision = 7
      Size = 0
    end
    object sqlPneuIvepmd_kmvid8: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'pmd_kmvid8'
      Origin = 'pmd_kmvid8'
      Precision = 7
      Size = 0
    end
    object sqlPneuIvepmd_kmvid9: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'pmd_kmvid9'
      Origin = 'pmd_kmvid9'
      Precision = 7
      Size = 0
    end
    object sqlPneuIvepmd_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pmd_usuinc'
      Origin = 'pmd_usuinc'
      Size = 15
    end
    object sqlPneuIvepmd_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pmd_datinc'
      Origin = 'pmd_datinc'
    end
    object sqlPneuIvepmd_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pmd_horinc'
      Origin = 'pmd_horinc'
      Size = 8
    end
    object sqlPneuIvepmd_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pmd_usualt'
      Origin = 'pmd_usualt'
      Size = 15
    end
    object sqlPneuIvepmd_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pmd_datalt'
      Origin = 'pmd_datalt'
    end
    object sqlPneuIvepmd_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pmd_horalt'
      Origin = 'pmd_horalt'
      Size = 8
    end
    object sqlPneuIvepds_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'pds_codigo'
      Origin = 'pds_codigo'
    end
    object sqlPneuIvepds_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pds_nome'
      Origin = 'pds_nome'
    end
    object sqlPneuIvepds_sucos: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pds_sucos'
      Origin = 'pds_sucos'
      Size = 1
    end
    object sqlPneuIvepds_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pds_usuinc'
      Origin = 'pds_usuinc'
      Size = 15
    end
    object sqlPneuIvepds_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pds_datinc'
      Origin = 'pds_datinc'
    end
    object sqlPneuIvepds_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pds_horinc'
      Origin = 'pds_horinc'
      Size = 8
    end
    object sqlPneuIvepds_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pds_usualt'
      Origin = 'pds_usualt'
      Size = 15
    end
    object sqlPneuIvepds_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pds_datalt'
      Origin = 'pds_datalt'
    end
    object sqlPneuIvepds_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pds_horalt'
      Origin = 'pds_horalt'
      Size = 8
    end
    object sqlPneuIvepdm_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'pdm_codigo'
      Origin = 'pdm_codigo'
    end
    object sqlPneuIvepdm_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pdm_nome'
      Origin = 'pdm_nome'
    end
    object sqlPneuIvepdm_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pdm_usuinc'
      Origin = 'pdm_usuinc'
      Size = 15
    end
    object sqlPneuIvepdm_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pdm_datinc'
      Origin = 'pdm_datinc'
    end
    object sqlPneuIvepdm_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pdm_horinc'
      Origin = 'pdm_horinc'
      Size = 8
    end
    object sqlPneuIvepdm_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pdm_usualt'
      Origin = 'pdm_usualt'
      Size = 15
    end
    object sqlPneuIvepdm_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pdm_datalt'
      Origin = 'pdm_datalt'
    end
    object sqlPneuIvepdm_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pdm_horalt'
      Origin = 'pdm_horalt'
      Size = 8
    end
    object sqlPneuIvepfb_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'pfb_codigo'
      Origin = 'pfb_codigo'
    end
    object sqlPneuIvepfb_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pfb_nome'
      Origin = 'pfb_nome'
      Size = 40
    end
    object sqlPneuIvepfb_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pfb_usuinc'
      Origin = 'pfb_usuinc'
      Size = 15
    end
    object sqlPneuIvepfb_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pfb_datinc'
      Origin = 'pfb_datinc'
    end
    object sqlPneuIvepfb_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pfb_horinc'
      Origin = 'pfb_horinc'
      Size = 8
    end
    object sqlPneuIvepfb_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pfb_usualt'
      Origin = 'pfb_usualt'
      Size = 15
    end
    object sqlPneuIvepfb_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pfb_datalt'
      Origin = 'pfb_datalt'
    end
    object sqlPneuIvepfb_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pfb_horalt'
      Origin = 'pfb_horalt'
      Size = 8
    end
  end
  object sqltrmcoleta: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * from "99999999999999_TESTE".trmcoleta'
      'LEFT JOIN "dbconfig".cidade on cid_codigo= tmc_codcid')
    Left = 968
    Top = 648
    object sqltrmcoletatmc_codigo: TIntegerField
      FieldName = 'tmc_codigo'
      Origin = 'tmc_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqltrmcoletatmc_ativo: TBooleanField
      FieldName = 'tmc_ativo'
      Origin = 'tmc_ativo'
    end
    object sqltrmcoletatmc_nome: TStringField
      FieldName = 'tmc_nome'
      Origin = 'tmc_nome'
      Size = 50
    end
    object sqltrmcoletatmc_endereco: TStringField
      FieldName = 'tmc_endereco'
      Origin = 'tmc_endereco'
      Size = 35
    end
    object sqltrmcoletatmc_numend: TStringField
      FieldName = 'tmc_numend'
      Origin = 'tmc_numend'
      Size = 5
    end
    object sqltrmcoletatmc_complem: TStringField
      FieldName = 'tmc_complem'
      Origin = 'tmc_complem'
      Size = 25
    end
    object sqltrmcoletatmc_bairro: TStringField
      FieldName = 'tmc_bairro'
      Origin = 'tmc_bairro'
      Size = 50
    end
    object sqltrmcoletatmc_cep: TStringField
      FieldName = 'tmc_cep'
      Origin = 'tmc_cep'
      Size = 8
    end
    object sqltrmcoletatmc_codcid: TIntegerField
      FieldName = 'tmc_codcid'
      Origin = 'tmc_codcid'
    end
    object sqltrmcoletatmc_telef1: TStringField
      FieldName = 'tmc_telef1'
      Origin = 'tmc_telef1'
      Size = 12
    end
    object sqltrmcoletatmc_telef2: TStringField
      FieldName = 'tmc_telef2'
      Origin = 'tmc_telef2'
      Size = 12
    end
    object sqltrmcoletatmc_celula: TStringField
      FieldName = 'tmc_celula'
      Origin = 'tmc_celula'
      Size = 12
    end
    object sqltrmcoletatmc_contato: TStringField
      FieldName = 'tmc_contato'
      Origin = 'tmc_contato'
    end
    object sqltrmcoletatmc_obs: TMemoField
      FieldName = 'tmc_obs'
      Origin = 'tmc_obs'
      BlobType = ftMemo
    end
    object sqltrmcoletatmc_usuinc: TStringField
      FieldName = 'tmc_usuinc'
      Origin = 'tmc_usuinc'
      Size = 15
    end
    object sqltrmcoletatmc_datinc: TDateField
      FieldName = 'tmc_datinc'
      Origin = 'tmc_datinc'
    end
    object sqltrmcoletatmc_horinc: TStringField
      FieldName = 'tmc_horinc'
      Origin = 'tmc_horinc'
      Size = 8
    end
    object sqltrmcoletatmc_usualt: TStringField
      FieldName = 'tmc_usualt'
      Origin = 'tmc_usualt'
      Size = 15
    end
    object sqltrmcoletatmc_datalt: TDateField
      FieldName = 'tmc_datalt'
      Origin = 'tmc_datalt'
    end
    object sqltrmcoletatmc_horalt: TStringField
      FieldName = 'tmc_horalt'
      Origin = 'tmc_horalt'
      Size = 8
    end
    object sqltrmcoletacid_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cid_codigo'
      Origin = 'cid_codigo'
    end
    object sqltrmcoletacid_cidnum: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_cidnum'
      Origin = 'cid_cidnum'
      Size = 8
    end
    object sqltrmcoletacid_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_nome'
      Origin = 'cid_nome'
      Size = 35
    end
    object sqltrmcoletacid_codest: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cid_codest'
      Origin = 'cid_codest'
    end
    object sqltrmcoletacid_codpai: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cid_codpai'
      Origin = 'cid_codpai'
    end
    object sqltrmcoletacid_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_usuinc'
      Origin = 'cid_usuinc'
      Size = 15
    end
    object sqltrmcoletacid_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cid_datinc'
      Origin = 'cid_datinc'
    end
    object sqltrmcoletacid_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_horinc'
      Origin = 'cid_horinc'
      Size = 8
    end
    object sqltrmcoletacid_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_usualt'
      Origin = 'cid_usualt'
      Size = 15
    end
    object sqltrmcoletacid_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cid_datalt'
      Origin = 'cid_datalt'
    end
    object sqltrmcoletacid_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_horalt'
      Origin = 'cid_horalt'
      Size = 8
    end
  end
  object sqlCliente: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'select * from "99999999999999_TESTE".cliente'
      'LEFT JOIN "dbconfig".cargo  on cgo_codigo = cli_codcgo'
      'LEFT JOIN "dbconfig".cidade on cid_codigo = cli_codcid'
      'LEFT JOIN "dbconfig".grupocli on gcl_codigo = cli_codgcl')
    Left = 968
    Top = 704
    object sqlClientecli_codigo: TIntegerField
      FieldName = 'cli_codigo'
      Origin = 'cli_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlClientecli_tipo: TStringField
      FieldName = 'cli_tipo'
      Origin = 'cli_tipo'
      Size = 10
    end
    object sqlClientecli_ativo: TBooleanField
      FieldName = 'cli_ativo'
      Origin = 'cli_ativo'
    end
    object sqlClientecli_nome: TStringField
      FieldName = 'cli_nome'
      Origin = 'cli_nome'
      Size = 50
    end
    object sqlClientecli_fantasia: TStringField
      FieldName = 'cli_fantasia'
      Origin = 'cli_fantasia'
      Size = 50
    end
    object sqlClientecli_codgcl: TIntegerField
      FieldName = 'cli_codgcl'
      Origin = 'cli_codgcl'
    end
    object sqlClientecli_codcgo: TIntegerField
      FieldName = 'cli_codcgo'
      Origin = 'cli_codcgo'
    end
    object sqlClientecli_datnas: TDateField
      FieldName = 'cli_datnas'
      Origin = 'cli_datnas'
    end
    object sqlClientecli_diapag: TStringField
      FieldName = 'cli_diapag'
      Origin = 'cli_diapag'
      Size = 2
    end
    object sqlClientecli_ecivil: TStringField
      FieldName = 'cli_ecivil'
      Origin = 'cli_ecivil'
      Size = 15
    end
    object sqlClientecli_nompal: TStringField
      FieldName = 'cli_nompal'
      Origin = 'cli_nompal'
      Size = 50
    end
    object sqlClientecli_nommae: TStringField
      FieldName = 'cli_nommae'
      Origin = 'cli_nommae'
      Size = 50
    end
    object sqlClientecli_cpfcnpj: TStringField
      FieldName = 'cli_cpfcnpj'
      Origin = 'cli_cpfcnpj'
      Size = 14
    end
    object sqlClientecli_rgiest: TStringField
      FieldName = 'cli_rgiest'
      Origin = 'cli_rgiest'
      Size = 15
    end
    object sqlClientecli_imunic: TStringField
      FieldName = 'cli_imunic'
      Origin = 'cli_imunic'
      Size = 15
    end
    object sqlClientecli_rgexped: TStringField
      FieldName = 'cli_rgexped'
      Origin = 'cli_rgexped'
    end
    object sqlClientecli_rgdata: TDateField
      FieldName = 'cli_rgdata'
      Origin = 'cli_rgdata'
    end
    object sqlClientecli_cep: TStringField
      FieldName = 'cli_cep'
      Origin = 'cli_cep'
      Size = 8
    end
    object sqlClientecli_endereco: TStringField
      FieldName = 'cli_endereco'
      Origin = 'cli_endereco'
      Size = 50
    end
    object sqlClientecli_complem: TStringField
      FieldName = 'cli_complem'
      Origin = 'cli_complem'
      Size = 25
    end
    object sqlClientecli_numres: TStringField
      FieldName = 'cli_numres'
      Origin = 'cli_numres'
      Size = 6
    end
    object sqlClientecli_bairro: TStringField
      FieldName = 'cli_bairro'
      Origin = 'cli_bairro'
      Size = 50
    end
    object sqlClientecli_codcid: TIntegerField
      FieldName = 'cli_codcid'
      Origin = 'cli_codcid'
    end
    object sqlClientecli_cepcob: TStringField
      FieldName = 'cli_cepcob'
      Origin = 'cli_cepcob'
      Size = 8
    end
    object sqlClientecli_endcob: TStringField
      FieldName = 'cli_endcob'
      Origin = 'cli_endcob'
      Size = 50
    end
    object sqlClientecli_comcob: TStringField
      FieldName = 'cli_comcob'
      Origin = 'cli_comcob'
      Size = 25
    end
    object sqlClientecli_numcob: TStringField
      FieldName = 'cli_numcob'
      Origin = 'cli_numcob'
      Size = 6
    end
    object sqlClientecli_baicob: TStringField
      FieldName = 'cli_baicob'
      Origin = 'cli_baicob'
      Size = 50
    end
    object sqlClientecli_codcdc: TIntegerField
      FieldName = 'cli_codcdc'
      Origin = 'cli_codcdc'
    end
    object sqlClientecli_repend: TBooleanField
      FieldName = 'cli_repend'
      Origin = 'cli_repend'
    end
    object sqlClientecli_telef01: TStringField
      FieldName = 'cli_telef01'
      Origin = 'cli_telef01'
      Size = 12
    end
    object sqlClientecli_telef02: TStringField
      FieldName = 'cli_telef02'
      Origin = 'cli_telef02'
      Size = 12
    end
    object sqlClientecli_celular: TStringField
      FieldName = 'cli_celular'
      Origin = 'cli_celular'
      Size = 12
    end
    object sqlClientecli_email: TStringField
      FieldName = 'cli_email'
      Origin = 'cli_email'
      Size = 100
    end
    object sqlClientecli_emailsped: TStringField
      FieldName = 'cli_emailsped'
      Origin = 'cli_emailsped'
      Size = 100
    end
    object sqlClientecli_status: TStringField
      FieldName = 'cli_status'
      Origin = 'cli_status'
      Size = 15
    end
    object sqlClientecli_foto: TBlobField
      FieldName = 'cli_foto'
      Origin = 'cli_foto'
    end
    object sqlClientecli_obs: TMemoField
      FieldName = 'cli_obs'
      Origin = 'cli_obs'
      BlobType = ftMemo
    end
    object sqlClientecli_vlrlim: TBCDField
      FieldName = 'cli_vlrlim'
      Origin = 'cli_vlrlim'
      Precision = 15
      Size = 2
    end
    object sqlClientecli_vlrcre: TBCDField
      FieldName = 'cli_vlrcre'
      Origin = 'cli_vlrcre'
      Precision = 15
      Size = 2
    end
    object sqlClientecli_datcmp: TDateField
      FieldName = 'cli_datcmp'
      Origin = 'cli_datcmp'
    end
    object sqlClientecli_usuinc: TStringField
      FieldName = 'cli_usuinc'
      Origin = 'cli_usuinc'
      Size = 15
    end
    object sqlClientecli_datinc: TDateField
      FieldName = 'cli_datinc'
      Origin = 'cli_datinc'
    end
    object sqlClientecli_horinc: TStringField
      FieldName = 'cli_horinc'
      Origin = 'cli_horinc'
      Size = 8
    end
    object sqlClientecli_usualt: TStringField
      FieldName = 'cli_usualt'
      Origin = 'cli_usualt'
      Size = 15
    end
    object sqlClientecli_datalt: TDateField
      FieldName = 'cli_datalt'
      Origin = 'cli_datalt'
    end
    object sqlClientecli_horalt: TStringField
      FieldName = 'cli_horalt'
      Origin = 'cli_horalt'
      Size = 8
    end
    object sqlClientecgo_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cgo_codigo'
      Origin = 'cgo_codigo'
    end
    object sqlClientecgo_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cgo_nome'
      Origin = 'cgo_nome'
      Size = 35
    end
    object sqlClientecgo_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cgo_usuinc'
      Origin = 'cgo_usuinc'
      Size = 15
    end
    object sqlClientecgo_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cgo_datinc'
      Origin = 'cgo_datinc'
    end
    object sqlClientecgo_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cgo_horinc'
      Origin = 'cgo_horinc'
      Size = 8
    end
    object sqlClientecgo_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cgo_usualt'
      Origin = 'cgo_usualt'
      Size = 15
    end
    object sqlClientecgo_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cgo_datalt'
      Origin = 'cgo_datalt'
    end
    object sqlClientecgo_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cgo_horalt'
      Origin = 'cgo_horalt'
      Size = 8
    end
    object sqlClientecid_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cid_codigo'
      Origin = 'cid_codigo'
    end
    object sqlClientecid_cidnum: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_cidnum'
      Origin = 'cid_cidnum'
      Size = 8
    end
    object sqlClientecid_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_nome'
      Origin = 'cid_nome'
      Size = 35
    end
    object sqlClientecid_codest: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cid_codest'
      Origin = 'cid_codest'
    end
    object sqlClientecid_codpai: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cid_codpai'
      Origin = 'cid_codpai'
    end
    object sqlClientecid_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_usuinc'
      Origin = 'cid_usuinc'
      Size = 15
    end
    object sqlClientecid_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cid_datinc'
      Origin = 'cid_datinc'
    end
    object sqlClientecid_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_horinc'
      Origin = 'cid_horinc'
      Size = 8
    end
    object sqlClientecid_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_usualt'
      Origin = 'cid_usualt'
      Size = 15
    end
    object sqlClientecid_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cid_datalt'
      Origin = 'cid_datalt'
    end
    object sqlClientecid_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_horalt'
      Origin = 'cid_horalt'
      Size = 8
    end
    object sqlClientegcl_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'gcl_codigo'
      Origin = 'gcl_codigo'
    end
    object sqlClientegcl_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'gcl_nome'
      Origin = 'gcl_nome'
    end
    object sqlClientegcl_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'gcl_usuinc'
      Origin = 'gcl_usuinc'
      Size = 15
    end
    object sqlClientegcl_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'gcl_datinc'
      Origin = 'gcl_datinc'
    end
    object sqlClientegcl_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'gcl_horinc'
      Origin = 'gcl_horinc'
      Size = 8
    end
    object sqlClientegcl_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'gcl_usualt'
      Origin = 'gcl_usualt'
      Size = 15
    end
    object sqlClientegcl_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'gcl_datalt'
      Origin = 'gcl_datalt'
    end
    object sqlClientegcl_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'gcl_horalt'
      Origin = 'gcl_horalt'
      Size = 8
    end
  end
  object sqlTransfin: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * from "99999999999999_TESTE".transfin'
      
        'LEFT JOIN "99999999999999_TESTE".ccorrente as d on d.cct_codigo ' +
        '= tff_codctd'
      'LEFT JOIN "dbconfig".banco as db on db.bco_codigo = d.cct_codbco'
      
        'LEFT JOIN "99999999999999_TESTE".ccorrente as c on c.cct_codigo ' +
        '= tff_codctc'
      
        'LEFT JOIN "dbconfig".banco as cb on cb.bco_codigo = c.cct_codbco' +
        ' ')
    Left = 968
    Top = 760
    object sqlTransfintff_codigo: TIntegerField
      FieldName = 'tff_codigo'
      Origin = 'tff_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlTransfintff_codctd: TIntegerField
      FieldName = 'tff_codctd'
      Origin = 'tff_codctd'
    end
    object sqlTransfintff_codctc: TIntegerField
      FieldName = 'tff_codctc'
      Origin = 'tff_codctc'
    end
    object sqlTransfintff_tipdoc: TStringField
      FieldName = 'tff_tipdoc'
      Origin = 'tff_tipdoc'
      Size = 15
    end
    object sqlTransfintff_horent: TStringField
      FieldName = 'tff_horent'
      Origin = 'tff_horent'
      Size = 8
    end
    object sqlTransfintff_vlrtff: TBCDField
      FieldName = 'tff_vlrtff'
      Origin = 'tff_vlrtff'
      Precision = 15
      Size = 2
    end
    object sqlTransfintff_dattff: TDateField
      FieldName = 'tff_dattff'
      Origin = 'tff_dattff'
    end
    object sqlTransfintff_numtff: TStringField
      FieldName = 'tff_numtff'
      Origin = 'tff_numtff'
      Size = 45
    end
    object sqlTransfintff_obs: TStringField
      FieldName = 'tff_obs'
      Origin = 'tff_obs'
      Size = 50
    end
    object sqlTransfintff_usuinc: TStringField
      FieldName = 'tff_usuinc'
      Origin = 'tff_usuinc'
      Size = 15
    end
    object sqlTransfintff_datinc: TDateField
      FieldName = 'tff_datinc'
      Origin = 'tff_datinc'
    end
    object sqlTransfintff_horinc: TStringField
      FieldName = 'tff_horinc'
      Origin = 'tff_horinc'
      Size = 8
    end
    object sqlTransfintff_usualt: TStringField
      FieldName = 'tff_usualt'
      Origin = 'tff_usualt'
      Size = 15
    end
    object sqlTransfintff_datalt: TDateField
      FieldName = 'tff_datalt'
      Origin = 'tff_datalt'
    end
    object sqlTransfintff_horalt: TStringField
      FieldName = 'tff_horalt'
      Origin = 'tff_horalt'
      Size = 8
    end
    object sqlTransfincct_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cct_codigo'
      Origin = 'cct_codigo'
    end
    object sqlTransfincct_codbco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_codbco'
      Origin = 'cct_codbco'
      Size = 6
    end
    object sqlTransfincct_agencia: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_agencia'
      Origin = 'cct_agencia'
      Size = 9
    end
    object sqlTransfincct_nrconta: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_nrconta'
      Origin = 'cct_nrconta'
      Size = 9
    end
    object sqlTransfincct_codpcd: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_codpcd'
      Origin = 'cct_codpcd'
      Size = 10
    end
    object sqlTransfincct_codpcc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_codpcc'
      Origin = 'cct_codpcc'
      Size = 10
    end
    object sqlTransfincct_telef1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_telef1'
      Origin = 'cct_telef1'
      Size = 12
    end
    object sqlTransfincct_telef2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_telef2'
      Origin = 'cct_telef2'
      Size = 12
    end
    object sqlTransfincct_celula: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_celula'
      Origin = 'cct_celula'
      Size = 12
    end
    object sqlTransfincct_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_usuinc'
      Origin = 'cct_usuinc'
      Size = 15
    end
    object sqlTransfincct_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cct_datinc'
      Origin = 'cct_datinc'
    end
    object sqlTransfincct_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_horinc'
      Origin = 'cct_horinc'
      Size = 8
    end
    object sqlTransfincct_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_usualt'
      Origin = 'cct_usualt'
      Size = 15
    end
    object sqlTransfincct_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cct_datalt'
      Origin = 'cct_datalt'
    end
    object sqlTransfincct_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_horalt'
      Origin = 'cct_horalt'
      Size = 8
    end
    object sqlTransfinbco_codigo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bco_codigo'
      Origin = 'bco_codigo'
      Size = 6
    end
    object sqlTransfinbco_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bco_nome'
      Origin = 'bco_nome'
      Size = 70
    end
    object sqlTransfinbco_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bco_usuinc'
      Origin = 'bco_usuinc'
      Size = 15
    end
    object sqlTransfinbco_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'bco_datinc'
      Origin = 'bco_datinc'
    end
    object sqlTransfinbco_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bco_horinc'
      Origin = 'bco_horinc'
      Size = 8
    end
    object sqlTransfinbco_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bco_usualt'
      Origin = 'bco_usualt'
      Size = 15
    end
    object sqlTransfinbco_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'bco_datalt'
      Origin = 'bco_datalt'
    end
    object sqlTransfinbco_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bco_horalt'
      Origin = 'bco_horalt'
      Size = 8
    end
    object sqlTransfincct_codigo_1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cct_codigo_1'
      Origin = 'cct_codigo'
    end
    object sqlTransfincct_codbco_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_codbco_1'
      Origin = 'cct_codbco'
      Size = 6
    end
    object sqlTransfincct_agencia_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_agencia_1'
      Origin = 'cct_agencia'
      Size = 9
    end
    object sqlTransfincct_nrconta_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_nrconta_1'
      Origin = 'cct_nrconta'
      Size = 9
    end
    object sqlTransfincct_codpcd_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_codpcd_1'
      Origin = 'cct_codpcd'
      Size = 10
    end
    object sqlTransfincct_codpcc_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_codpcc_1'
      Origin = 'cct_codpcc'
      Size = 10
    end
    object sqlTransfincct_telef1_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_telef1_1'
      Origin = 'cct_telef1'
      Size = 12
    end
    object sqlTransfincct_telef2_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_telef2_1'
      Origin = 'cct_telef2'
      Size = 12
    end
    object sqlTransfincct_celula_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_celula_1'
      Origin = 'cct_celula'
      Size = 12
    end
    object sqlTransfincct_usuinc_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_usuinc_1'
      Origin = 'cct_usuinc'
      Size = 15
    end
    object sqlTransfincct_datinc_1: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cct_datinc_1'
      Origin = 'cct_datinc'
    end
    object sqlTransfincct_horinc_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_horinc_1'
      Origin = 'cct_horinc'
      Size = 8
    end
    object sqlTransfincct_usualt_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_usualt_1'
      Origin = 'cct_usualt'
      Size = 15
    end
    object sqlTransfincct_datalt_1: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cct_datalt_1'
      Origin = 'cct_datalt'
    end
    object sqlTransfincct_horalt_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cct_horalt_1'
      Origin = 'cct_horalt'
      Size = 8
    end
    object sqlTransfinbco_codigo_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bco_codigo_1'
      Origin = 'bco_codigo'
      Size = 6
    end
    object sqlTransfinbco_nome_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bco_nome_1'
      Origin = 'bco_nome'
      Size = 70
    end
    object sqlTransfinbco_usuinc_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bco_usuinc_1'
      Origin = 'bco_usuinc'
      Size = 15
    end
    object sqlTransfinbco_datinc_1: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'bco_datinc_1'
      Origin = 'bco_datinc'
    end
    object sqlTransfinbco_horinc_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bco_horinc_1'
      Origin = 'bco_horinc'
      Size = 8
    end
    object sqlTransfinbco_usualt_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bco_usualt_1'
      Origin = 'bco_usualt'
      Size = 15
    end
    object sqlTransfinbco_datalt_1: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'bco_datalt_1'
      Origin = 'bco_datalt'
    end
    object sqlTransfinbco_horalt_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bco_horalt_1'
      Origin = 'bco_horalt'
      Size = 8
    end
  end
  object dspcompracmb: TDataSetProvider
    DataSet = sqlcompracmb
    UpdateMode = upWhereKeyOnly
    Left = 1398
    Top = 160
  end
  object clicompracmb: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspcompracmb'
    Left = 1478
    Top = 160
    object clicompracmbcpc_codigo: TIntegerField
      FieldName = 'cpc_codigo'
    end
    object clicompracmbcpc_numnfe: TStringField
      FieldName = 'cpc_numnfe'
      Size = 10
    end
    object clicompracmbcpc_sernfe: TStringField
      FieldName = 'cpc_sernfe'
      Size = 5
    end
    object clicompracmbcpc_chelet: TStringField
      FieldName = 'cpc_chelet'
      Size = 44
    end
    object clicompracmbcpc_datems: TDateField
      FieldName = 'cpc_datems'
    end
    object clicompracmbcpc_datent: TDateField
      FieldName = 'cpc_datent'
    end
    object clicompracmbcpc_codfnd: TIntegerField
      FieldName = 'cpc_codfnd'
    end
    object clicompracmbcpc_codpab: TIntegerField
      FieldName = 'cpc_codpab'
    end
    object clicompracmbcpc_codfpg: TIntegerField
      FieldName = 'cpc_codfpg'
    end
    object clicompracmbcpc_fatura: TBooleanField
      FieldName = 'cpc_fatura'
    end
    object clicompracmbcpc_vlrfrt: TBCDField
      FieldName = 'cpc_vlrfrt'
      Precision = 15
      Size = 2
    end
    object clicompracmbcpc_vlrfac: TBCDField
      FieldName = 'cpc_vlrfac'
      Precision = 15
      Size = 2
    end
    object clicompracmbcpc_vlrseg: TBCDField
      FieldName = 'cpc_vlrseg'
      Precision = 15
      Size = 2
    end
    object clicompracmbcpc_qtdpct: TIntegerField
      FieldName = 'cpc_qtdpct'
    end
    object clicompracmbcpc_parcel: TStringField
      FieldName = 'cpc_parcel'
      Size = 4
    end
    object clicompracmbcpc_usuinc: TStringField
      FieldName = 'cpc_usuinc'
      Size = 15
    end
    object clicompracmbcpc_datinc: TDateField
      FieldName = 'cpc_datinc'
    end
    object clicompracmbcpc_horinc: TStringField
      FieldName = 'cpc_horinc'
      Size = 8
    end
    object clicompracmbcpc_usualt: TStringField
      FieldName = 'cpc_usualt'
      Size = 15
    end
    object clicompracmbcpc_datalt: TDateField
      FieldName = 'cpc_datalt'
    end
    object clicompracmbcpc_horalt: TStringField
      FieldName = 'cpc_horalt'
      Size = 8
    end
    object clicompracmbfnd_codigo: TIntegerField
      FieldName = 'fnd_codigo'
    end
    object clicompracmbfnd_ativo: TStringField
      FieldName = 'fnd_ativo'
      Size = 3
    end
    object clicompracmbfnd_nome: TStringField
      FieldName = 'fnd_nome'
      Size = 50
    end
    object clicompracmbfnd_rsocial: TStringField
      FieldName = 'fnd_rsocial'
      Size = 50
    end
    object clicompracmbfnd_tipopes: TStringField
      FieldName = 'fnd_tipopes'
      Size = 8
    end
    object clicompracmbfnd_cpfcnpj: TStringField
      FieldName = 'fnd_cpfcnpj'
      Size = 14
    end
    object clicompracmbfnd_codpct: TStringField
      FieldName = 'fnd_codpct'
      Size = 10
    end
    object clicompracmbfnd_endereco: TStringField
      FieldName = 'fnd_endereco'
      Size = 35
    end
    object clicompracmbfnd_numend: TStringField
      FieldName = 'fnd_numend'
      Size = 5
    end
    object clicompracmbfnd_complem: TStringField
      FieldName = 'fnd_complem'
      Size = 25
    end
    object clicompracmbfnd_bairro: TStringField
      FieldName = 'fnd_bairro'
      Size = 50
    end
    object clicompracmbfnd_cep: TStringField
      FieldName = 'fnd_cep'
      Size = 8
    end
    object clicompracmbfnd_codcid: TIntegerField
      FieldName = 'fnd_codcid'
    end
    object clicompracmbfnd_telef1: TStringField
      FieldName = 'fnd_telef1'
      Size = 12
    end
    object clicompracmbfnd_telef2: TStringField
      FieldName = 'fnd_telef2'
      Size = 12
    end
    object clicompracmbfnd_celula: TStringField
      FieldName = 'fnd_celula'
      Size = 12
    end
    object clicompracmbfnd_obs: TMemoField
      FieldName = 'fnd_obs'
      BlobType = ftMemo
    end
    object clicompracmbfnd_usuinc: TStringField
      FieldName = 'fnd_usuinc'
      Size = 15
    end
    object clicompracmbfnd_datinc: TDateField
      FieldName = 'fnd_datinc'
    end
    object clicompracmbfnd_horinc: TStringField
      FieldName = 'fnd_horinc'
      Size = 8
    end
    object clicompracmbfnd_usualt: TStringField
      FieldName = 'fnd_usualt'
      Size = 15
    end
    object clicompracmbfnd_datalt: TDateField
      FieldName = 'fnd_datalt'
    end
    object clicompracmbfnd_horalt: TStringField
      FieldName = 'fnd_horalt'
      Size = 8
    end
  end
  object dscompracmb: TDataSource
    DataSet = clicompracmb
    Left = 1550
    Top = 160
  end
  object dspAbastece: TDataSetProvider
    DataSet = sqlAbastece
    UpdateMode = upWhereKeyOnly
    Left = 1398
    Top = 208
  end
  object cliAbastece: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAbastece'
    Left = 1478
    Top = 208
    object cliAbasteceabt_codigo: TIntegerField
      FieldName = 'abt_codigo'
    end
    object cliAbasteceabt_codplc: TStringField
      FieldName = 'abt_codplc'
      Size = 7
    end
    object cliAbasteceabt_codcmb: TIntegerField
      FieldName = 'abt_codcmb'
    end
    object cliAbasteceabt_codbmb: TIntegerField
      FieldName = 'abt_codbmb'
    end
    object cliAbasteceabt_codpss: TIntegerField
      FieldName = 'abt_codpss'
    end
    object cliAbasteceabt_codict: TIntegerField
      FieldName = 'abt_codict'
    end
    object cliAbasteceabt_codpab: TIntegerField
      FieldName = 'abt_codpab'
    end
    object cliAbasteceabt_requis: TStringField
      FieldName = 'abt_requis'
      Size = 7
    end
    object cliAbasteceabt_local: TStringField
      FieldName = 'abt_local'
      Size = 5
    end
    object cliAbasteceabt_ltsaut: TBCDField
      FieldName = 'abt_ltsaut'
      Precision = 15
      Size = 3
    end
    object cliAbasteceabt_ltsabt: TBCDField
      FieldName = 'abt_ltsabt'
      Precision = 15
      Size = 3
    end
    object cliAbasteceabt_vlrlts: TBCDField
      FieldName = 'abt_vlrlts'
      Precision = 15
    end
    object cliAbasteceabt_dataut: TDateField
      FieldName = 'abt_dataut'
    end
    object cliAbasteceabt_horaut: TStringField
      FieldName = 'abt_horaut'
      Size = 4
    end
    object cliAbasteceabt_datrea: TDateField
      FieldName = 'abt_datrea'
    end
    object cliAbasteceabt_horrea: TStringField
      FieldName = 'abt_horrea'
      Size = 4
    end
    object cliAbasteceabt_kmaba: TBCDField
      FieldName = 'abt_kmaba'
      Precision = 7
      Size = 0
    end
    object cliAbasteceabt_usuinc: TStringField
      FieldName = 'abt_usuinc'
      Size = 15
    end
    object cliAbasteceabt_datinc: TDateField
      FieldName = 'abt_datinc'
    end
    object cliAbasteceabt_horinc: TStringField
      FieldName = 'abt_horinc'
      Size = 8
    end
    object cliAbasteceabt_usualt: TStringField
      FieldName = 'abt_usualt'
      Size = 15
    end
    object cliAbasteceabt_datalt: TDateField
      FieldName = 'abt_datalt'
    end
    object cliAbasteceabt_horalt: TStringField
      FieldName = 'abt_horalt'
      Size = 8
    end
    object cliAbastececmb_codigo: TIntegerField
      FieldName = 'cmb_codigo'
    end
    object cliAbastececmb_nome: TStringField
      FieldName = 'cmb_nome'
    end
    object cliAbastececmb_usuinc: TStringField
      FieldName = 'cmb_usuinc'
      Size = 15
    end
    object cliAbastececmb_datinc: TDateField
      FieldName = 'cmb_datinc'
    end
    object cliAbastececmb_horinc: TStringField
      FieldName = 'cmb_horinc'
      Size = 8
    end
    object cliAbastececmb_usualt: TStringField
      FieldName = 'cmb_usualt'
      Size = 15
    end
    object cliAbastececmb_datalt: TDateField
      FieldName = 'cmb_datalt'
    end
    object cliAbastececmb_horalt: TStringField
      FieldName = 'cmb_horalt'
      Size = 8
    end
    object cliAbastecevat_placa: TStringField
      FieldName = 'vat_placa'
      Size = 7
    end
    object cliAbastecevat_nrfrota: TStringField
      FieldName = 'vat_nrfrota'
      Size = 5
    end
    object cliAbastecevat_paestversa: TStringField
      FieldName = 'vat_paestversa'
      Size = 5
    end
    object cliAbastecevat_chip: TStringField
      FieldName = 'vat_chip'
      Size = 10
    end
    object cliAbastecevat_cartao: TStringField
      FieldName = 'vat_cartao'
      Size = 15
    end
    object cliAbastecevat_chassi: TStringField
      FieldName = 'vat_chassi'
      Size = 17
    end
    object cliAbastecevat_licenc: TStringField
      FieldName = 'vat_licenc'
      Size = 15
    end
    object cliAbastecevat_renavan: TStringField
      FieldName = 'vat_renavan'
      Size = 15
    end
    object cliAbastecevat_dut: TStringField
      FieldName = 'vat_dut'
      Size = 10
    end
    object cliAbastecevat_codltd: TIntegerField
      FieldName = 'vat_codltd'
    end
    object cliAbastecevat_codtip: TIntegerField
      FieldName = 'vat_codtip'
    end
    object cliAbastecevat_codmdl: TIntegerField
      FieldName = 'vat_codmdl'
    end
    object cliAbastecevat_codmrc: TIntegerField
      FieldName = 'vat_codmrc'
    end
    object cliAbastecevat_codcor: TIntegerField
      FieldName = 'vat_codcor'
    end
    object cliAbastecevat_codcid: TIntegerField
      FieldName = 'vat_codcid'
    end
    object cliAbastecevat_codgrm: TIntegerField
      FieldName = 'vat_codgrm'
    end
    object cliAbastecevat_cor: TStringField
      FieldName = 'vat_cor'
    end
    object cliAbastecevat_status: TStringField
      FieldName = 'vat_status'
      Size = 15
    end
    object cliAbastecevat_tanque1: TBCDField
      FieldName = 'vat_tanque1'
      Precision = 7
      Size = 0
    end
    object cliAbastecevat_tanque2: TBCDField
      FieldName = 'vat_tanque2'
      Precision = 7
      Size = 0
    end
    object cliAbastecevat_tanque3: TBCDField
      FieldName = 'vat_tanque3'
      Precision = 7
      Size = 0
    end
    object cliAbastecevat_kmini: TBCDField
      FieldName = 'vat_kmini'
      Precision = 7
      Size = 0
    end
    object cliAbastecevat_kmatu: TBCDField
      FieldName = 'vat_kmatu'
      Precision = 7
      Size = 0
    end
    object cliAbastecevat_anofbmd: TStringField
      FieldName = 'vat_anofbmd'
      Size = 8
    end
    object cliAbastecevat_termo: TStringField
      FieldName = 'vat_termo'
      Size = 8
    end
    object cliAbastecevat_tombo: TStringField
      FieldName = 'vat_tombo'
      Size = 10
    end
    object cliAbastecevat_estado: TStringField
      FieldName = 'vat_estado'
      Size = 15
    end
    object cliAbastecevat_qtdpass: TStringField
      FieldName = 'vat_qtdpass'
      Size = 2
    end
    object cliAbastecevat_potenc: TStringField
      FieldName = 'vat_potenc'
      Size = 5
    end
    object cliAbastecevat_kgbruto: TBCDField
      FieldName = 'vat_kgbruto'
      Precision = 7
      Size = 0
    end
    object cliAbastecevat_kgcarga: TBCDField
      FieldName = 'vat_kgcarga'
      Precision = 7
      Size = 0
    end
    object cliAbastecevat_clindad: TStringField
      FieldName = 'vat_clindad'
      Size = 4
    end
    object cliAbastecevat_nrmotor: TStringField
      FieldName = 'vat_nrmotor'
      Size = 15
    end
    object cliAbastecevat_cavalo: TStringField
      FieldName = 'vat_cavalo'
      Size = 10
    end
    object cliAbastecevat_foto: TBlobField
      FieldName = 'vat_foto'
    end
    object cliAbastecevat_obs: TMemoField
      FieldName = 'vat_obs'
      BlobType = ftMemo
    end
    object cliAbastecevat_vlrcmp: TBCDField
      FieldName = 'vat_vlrcmp'
      Precision = 15
      Size = 2
    end
    object cliAbastecevat_datcmp: TDateField
      FieldName = 'vat_datcmp'
    end
    object cliAbastecevat_nfecmp: TStringField
      FieldName = 'vat_nfecmp'
      Size = 10
    end
    object cliAbastecevat_usuinc: TStringField
      FieldName = 'vat_usuinc'
      Size = 15
    end
    object cliAbastecevat_datinc: TDateField
      FieldName = 'vat_datinc'
    end
    object cliAbastecevat_horinc: TStringField
      FieldName = 'vat_horinc'
      Size = 8
    end
    object cliAbastecevat_usualt: TStringField
      FieldName = 'vat_usualt'
      Size = 15
    end
    object cliAbastecevat_datalt: TDateField
      FieldName = 'vat_datalt'
    end
    object cliAbastecevat_horalt: TStringField
      FieldName = 'vat_horalt'
      Size = 8
    end
    object cliAbastecemdl_codigo: TIntegerField
      FieldName = 'mdl_codigo'
    end
    object cliAbastecemdl_nome: TStringField
      FieldName = 'mdl_nome'
      Size = 25
    end
    object cliAbastecemdl_codfip: TStringField
      FieldName = 'mdl_codfip'
      Size = 10
    end
    object cliAbastecemdl_codmrc: TIntegerField
      FieldName = 'mdl_codmrc'
    end
    object cliAbastecemdl_codgrm: TIntegerField
      FieldName = 'mdl_codgrm'
    end
    object cliAbastecemdl_usuinc: TStringField
      FieldName = 'mdl_usuinc'
      Size = 15
    end
    object cliAbastecemdl_datinc: TDateField
      FieldName = 'mdl_datinc'
    end
    object cliAbastecemdl_horinc: TStringField
      FieldName = 'mdl_horinc'
      Size = 8
    end
    object cliAbastecemdl_usualt: TStringField
      FieldName = 'mdl_usualt'
      Size = 15
    end
    object cliAbastecemdl_datalt: TDateField
      FieldName = 'mdl_datalt'
    end
    object cliAbastecemdl_horalt: TStringField
      FieldName = 'mdl_horalt'
      Size = 8
    end
    object cliAbastecepss_codigo: TIntegerField
      FieldName = 'pss_codigo'
    end
    object cliAbastecepss_nome: TStringField
      FieldName = 'pss_nome'
      Size = 50
    end
    object cliAbastecepss_apelido: TStringField
      FieldName = 'pss_apelido'
    end
    object cliAbastecepss_codcgo: TIntegerField
      FieldName = 'pss_codcgo'
    end
    object cliAbastecepss_codltd: TIntegerField
      FieldName = 'pss_codltd'
    end
    object cliAbastecepss_datnas: TDateField
      FieldName = 'pss_datnas'
    end
    object cliAbastecepss_sexo: TStringField
      FieldName = 'pss_sexo'
      Size = 1
    end
    object cliAbastecepss_ecivil: TStringField
      FieldName = 'pss_ecivil'
      Size = 15
    end
    object cliAbastecepss_tpsangue: TStringField
      FieldName = 'pss_tpsangue'
      Size = 3
    end
    object cliAbastecepss_nompal: TStringField
      FieldName = 'pss_nompal'
      Size = 50
    end
    object cliAbastecepss_nommae: TStringField
      FieldName = 'pss_nommae'
      Size = 50
    end
    object cliAbastecepss_cpf: TStringField
      FieldName = 'pss_cpf'
      Size = 11
    end
    object cliAbastecepss_rg: TStringField
      FieldName = 'pss_rg'
      Size = 15
    end
    object cliAbastecepss_rgexped: TStringField
      FieldName = 'pss_rgexped'
    end
    object cliAbastecepss_rgdata: TDateField
      FieldName = 'pss_rgdata'
    end
    object cliAbastecepss_pispasep: TStringField
      FieldName = 'pss_pispasep'
      Size = 14
    end
    object cliAbastecepss_numctps: TStringField
      FieldName = 'pss_numctps'
      Size = 14
    end
    object cliAbastecepss_habilitac: TStringField
      FieldName = 'pss_habilitac'
      Size = 11
    end
    object cliAbastecepss_hbemite: TDateField
      FieldName = 'pss_hbemite'
    end
    object cliAbastecepss_hbvalid: TDateField
      FieldName = 'pss_hbvalid'
    end
    object cliAbastecepss_hbcateg: TStringField
      FieldName = 'pss_hbcateg'
      Size = 4
    end
    object cliAbastecepss_nrtitulo: TStringField
      FieldName = 'pss_nrtitulo'
      Size = 14
    end
    object cliAbastecepss_nrreserv: TStringField
      FieldName = 'pss_nrreserv'
      Size = 14
    end
    object cliAbastecepss_cep: TStringField
      FieldName = 'pss_cep'
      Size = 8
    end
    object cliAbastecepss_endereco: TStringField
      FieldName = 'pss_endereco'
      Size = 50
    end
    object cliAbastecepss_complem: TStringField
      FieldName = 'pss_complem'
      Size = 25
    end
    object cliAbastecepss_numres: TStringField
      FieldName = 'pss_numres'
      Size = 6
    end
    object cliAbastecepss_bairro: TStringField
      FieldName = 'pss_bairro'
      Size = 50
    end
    object cliAbastecepss_codcid: TIntegerField
      FieldName = 'pss_codcid'
    end
    object cliAbastecepss_tpimove: TStringField
      FieldName = 'pss_tpimove'
      Size = 15
    end
    object cliAbastecepss_tpresid: TStringField
      FieldName = 'pss_tpresid'
      Size = 15
    end
    object cliAbastecepss_telef01: TStringField
      FieldName = 'pss_telef01'
      Size = 12
    end
    object cliAbastecepss_telef02: TStringField
      FieldName = 'pss_telef02'
      Size = 12
    end
    object cliAbastecepss_celular: TStringField
      FieldName = 'pss_celular'
      Size = 12
    end
    object cliAbastecepss_email: TStringField
      FieldName = 'pss_email'
      Size = 100
    end
    object cliAbastecepss_status: TStringField
      FieldName = 'pss_status'
      Size = 15
    end
    object cliAbastecepss_foto: TBlobField
      FieldName = 'pss_foto'
    end
    object cliAbastecepss_obs: TMemoField
      FieldName = 'pss_obs'
      BlobType = ftMemo
    end
    object cliAbastecepss_vlrrenda: TBCDField
      FieldName = 'pss_vlrrenda'
      Precision = 15
      Size = 2
    end
    object cliAbastecepss_vlrvale: TBCDField
      FieldName = 'pss_vlrvale'
      Precision = 15
      Size = 2
    end
    object cliAbastecepss_datcmp: TDateField
      FieldName = 'pss_datcmp'
    end
    object cliAbastecepss_nfecmp: TStringField
      FieldName = 'pss_nfecmp'
      Size = 10
    end
    object cliAbastecepss_codpcv: TStringField
      FieldName = 'pss_codpcv'
      Size = 10
    end
    object cliAbastecepss_codpcr: TStringField
      FieldName = 'pss_codpcr'
      Size = 10
    end
    object cliAbastecepss_usuinc: TStringField
      FieldName = 'pss_usuinc'
      Size = 15
    end
    object cliAbastecepss_datinc: TDateField
      FieldName = 'pss_datinc'
    end
    object cliAbastecepss_horinc: TStringField
      FieldName = 'pss_horinc'
      Size = 8
    end
    object cliAbastecepss_usualt: TStringField
      FieldName = 'pss_usualt'
      Size = 15
    end
    object cliAbastecepss_datalt: TDateField
      FieldName = 'pss_datalt'
    end
    object cliAbastecepss_horalt: TStringField
      FieldName = 'pss_horalt'
      Size = 8
    end
    object cliAbastecebmb_codigo: TIntegerField
      FieldName = 'bmb_codigo'
    end
    object cliAbastecebmb_codtnq: TIntegerField
      FieldName = 'bmb_codtnq'
    end
    object cliAbastecebmb_codcmb: TIntegerField
      FieldName = 'bmb_codcmb'
    end
    object cliAbastecebmb_nome: TStringField
      FieldName = 'bmb_nome'
      Size = 25
    end
    object cliAbastecebmb_nmrinc: TBCDField
      FieldName = 'bmb_nmrinc'
      Precision = 7
      Size = 0
    end
    object cliAbastecebmb_ativo: TBooleanField
      FieldName = 'bmb_ativo'
    end
    object cliAbastecebmb_usuinc: TStringField
      FieldName = 'bmb_usuinc'
      Size = 15
    end
    object cliAbastecebmb_datinc: TDateField
      FieldName = 'bmb_datinc'
    end
    object cliAbastecebmb_horinc: TStringField
      FieldName = 'bmb_horinc'
      Size = 8
    end
    object cliAbastecebmb_usualt: TStringField
      FieldName = 'bmb_usualt'
      Size = 15
    end
    object cliAbastecebmb_datalt: TDateField
      FieldName = 'bmb_datalt'
    end
    object cliAbastecebmb_horalt: TStringField
      FieldName = 'bmb_horalt'
      Size = 8
    end
    object cliAbastecetotal: TFMTBCDField
      FieldName = 'total'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
  end
  object dsAbastece: TDataSource
    DataSet = cliAbastece
    Left = 1550
    Top = 208
  end
  object dspMulta: TDataSetProvider
    DataSet = sqlMulta
    UpdateMode = upWhereKeyOnly
    Left = 1398
    Top = 264
  end
  object cliMulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMulta'
    Left = 1478
    Top = 264
    object cliMultamlt_codigo: TIntegerField
      FieldName = 'mlt_codigo'
    end
    object cliMultamlt_datems: TDateField
      FieldName = 'mlt_datems'
    end
    object cliMultamlt_boleto: TStringField
      FieldName = 'mlt_boleto'
      Size = 45
    end
    object cliMultamlt_codplc: TStringField
      FieldName = 'mlt_codplc'
      Size = 7
    end
    object cliMultamlt_codpss: TIntegerField
      FieldName = 'mlt_codpss'
    end
    object cliMultamlt_codfcc: TIntegerField
      FieldName = 'mlt_codfcc'
    end
    object cliMultamlt_codfcd: TIntegerField
      FieldName = 'mlt_codfcd'
    end
    object cliMultamlt_codtmt: TStringField
      FieldName = 'mlt_codtmt'
      Size = 7
    end
    object cliMultamlt_codogt: TIntegerField
      FieldName = 'mlt_codogt'
    end
    object cliMultamlt_codcid: TIntegerField
      FieldName = 'mlt_codcid'
    end
    object cliMultamlt_autinf: TStringField
      FieldName = 'mlt_autinf'
      Size = 15
    end
    object cliMultamlt_local: TStringField
      FieldName = 'mlt_local'
      Size = 25
    end
    object cliMultamlt_datinf: TDateField
      FieldName = 'mlt_datinf'
    end
    object cliMultamlt_horinf: TStringField
      FieldName = 'mlt_horinf'
      Size = 4
    end
    object cliMultamlt_datvnc: TDateField
      FieldName = 'mlt_datvnc'
    end
    object cliMultamlt_vlrinf: TBCDField
      FieldName = 'mlt_vlrinf'
      Precision = 15
      Size = 2
    end
    object cliMultamlt_datpdf: TDateField
      FieldName = 'mlt_datpdf'
    end
    object cliMultamlt_usuinc: TStringField
      FieldName = 'mlt_usuinc'
      Size = 15
    end
    object cliMultamlt_datinc: TDateField
      FieldName = 'mlt_datinc'
    end
    object cliMultamlt_horinc: TStringField
      FieldName = 'mlt_horinc'
      Size = 8
    end
    object cliMultamlt_usualt: TStringField
      FieldName = 'mlt_usualt'
      Size = 15
    end
    object cliMultamlt_datalt: TDateField
      FieldName = 'mlt_datalt'
    end
    object cliMultamlt_horalt: TStringField
      FieldName = 'mlt_horalt'
      Size = 8
    end
    object cliMultacid_codigo: TIntegerField
      FieldName = 'cid_codigo'
    end
    object cliMultacid_cidnum: TStringField
      FieldName = 'cid_cidnum'
      Size = 8
    end
    object cliMultacid_nome: TStringField
      FieldName = 'cid_nome'
      Size = 35
    end
    object cliMultacid_codest: TIntegerField
      FieldName = 'cid_codest'
    end
    object cliMultacid_codpai: TIntegerField
      FieldName = 'cid_codpai'
    end
    object cliMultacid_usuinc: TStringField
      FieldName = 'cid_usuinc'
      Size = 15
    end
    object cliMultacid_datinc: TDateField
      FieldName = 'cid_datinc'
    end
    object cliMultacid_horinc: TStringField
      FieldName = 'cid_horinc'
      Size = 8
    end
    object cliMultacid_usualt: TStringField
      FieldName = 'cid_usualt'
      Size = 15
    end
    object cliMultacid_datalt: TDateField
      FieldName = 'cid_datalt'
    end
    object cliMultacid_horalt: TStringField
      FieldName = 'cid_horalt'
      Size = 8
    end
    object cliMultavat_placa: TStringField
      FieldName = 'vat_placa'
      Size = 7
    end
    object cliMultavat_nrfrota: TStringField
      FieldName = 'vat_nrfrota'
      Size = 5
    end
    object cliMultavat_paestversa: TStringField
      FieldName = 'vat_paestversa'
      Size = 5
    end
    object cliMultavat_chip: TStringField
      FieldName = 'vat_chip'
      Size = 10
    end
    object cliMultavat_cartao: TStringField
      FieldName = 'vat_cartao'
      Size = 15
    end
    object cliMultavat_chassi: TStringField
      FieldName = 'vat_chassi'
      Size = 17
    end
    object cliMultavat_licenc: TStringField
      FieldName = 'vat_licenc'
      Size = 15
    end
    object cliMultavat_renavan: TStringField
      FieldName = 'vat_renavan'
      Size = 15
    end
    object cliMultavat_dut: TStringField
      FieldName = 'vat_dut'
      Size = 10
    end
    object cliMultavat_codltd: TIntegerField
      FieldName = 'vat_codltd'
    end
    object cliMultavat_codtip: TIntegerField
      FieldName = 'vat_codtip'
    end
    object cliMultavat_codmdl: TIntegerField
      FieldName = 'vat_codmdl'
    end
    object cliMultavat_codmrc: TIntegerField
      FieldName = 'vat_codmrc'
    end
    object cliMultavat_codcor: TIntegerField
      FieldName = 'vat_codcor'
    end
    object cliMultavat_codcid: TIntegerField
      FieldName = 'vat_codcid'
    end
    object cliMultavat_codgrm: TIntegerField
      FieldName = 'vat_codgrm'
    end
    object cliMultavat_cor: TStringField
      FieldName = 'vat_cor'
    end
    object cliMultavat_status: TStringField
      FieldName = 'vat_status'
      Size = 15
    end
    object cliMultavat_tanque1: TBCDField
      FieldName = 'vat_tanque1'
      Precision = 7
      Size = 0
    end
    object cliMultavat_tanque2: TBCDField
      FieldName = 'vat_tanque2'
      Precision = 7
      Size = 0
    end
    object cliMultavat_tanque3: TBCDField
      FieldName = 'vat_tanque3'
      Precision = 7
      Size = 0
    end
    object cliMultavat_kmini: TBCDField
      FieldName = 'vat_kmini'
      Precision = 7
      Size = 0
    end
    object cliMultavat_kmatu: TBCDField
      FieldName = 'vat_kmatu'
      Precision = 7
      Size = 0
    end
    object cliMultavat_anofbmd: TStringField
      FieldName = 'vat_anofbmd'
      Size = 8
    end
    object cliMultavat_termo: TStringField
      FieldName = 'vat_termo'
      Size = 8
    end
    object cliMultavat_tombo: TStringField
      FieldName = 'vat_tombo'
      Size = 10
    end
    object cliMultavat_estado: TStringField
      FieldName = 'vat_estado'
      Size = 15
    end
    object cliMultavat_qtdpass: TStringField
      FieldName = 'vat_qtdpass'
      Size = 2
    end
    object cliMultavat_potenc: TStringField
      FieldName = 'vat_potenc'
      Size = 5
    end
    object cliMultavat_kgbruto: TBCDField
      FieldName = 'vat_kgbruto'
      Precision = 7
      Size = 0
    end
    object cliMultavat_kgcarga: TBCDField
      FieldName = 'vat_kgcarga'
      Precision = 7
      Size = 0
    end
    object cliMultavat_clindad: TStringField
      FieldName = 'vat_clindad'
      Size = 4
    end
    object cliMultavat_nrmotor: TStringField
      FieldName = 'vat_nrmotor'
      Size = 15
    end
    object cliMultavat_cavalo: TStringField
      FieldName = 'vat_cavalo'
      Size = 10
    end
    object cliMultavat_foto: TBlobField
      FieldName = 'vat_foto'
    end
    object cliMultavat_obs: TMemoField
      FieldName = 'vat_obs'
      BlobType = ftMemo
    end
    object cliMultavat_vlrcmp: TBCDField
      FieldName = 'vat_vlrcmp'
      Precision = 15
      Size = 2
    end
    object cliMultavat_datcmp: TDateField
      FieldName = 'vat_datcmp'
    end
    object cliMultavat_nfecmp: TStringField
      FieldName = 'vat_nfecmp'
      Size = 10
    end
    object cliMultavat_usuinc: TStringField
      FieldName = 'vat_usuinc'
      Size = 15
    end
    object cliMultavat_datinc: TDateField
      FieldName = 'vat_datinc'
    end
    object cliMultavat_horinc: TStringField
      FieldName = 'vat_horinc'
      Size = 8
    end
    object cliMultavat_usualt: TStringField
      FieldName = 'vat_usualt'
      Size = 15
    end
    object cliMultavat_datalt: TDateField
      FieldName = 'vat_datalt'
    end
    object cliMultavat_horalt: TStringField
      FieldName = 'vat_horalt'
      Size = 8
    end
    object cliMultatmt_codigo: TStringField
      FieldName = 'tmt_codigo'
      Size = 7
    end
    object cliMultatmt_nome: TStringField
      FieldName = 'tmt_nome'
      Size = 200
    end
    object cliMultatmt_ampleg: TStringField
      FieldName = 'tmt_ampleg'
    end
    object cliMultatmt_gravid: TStringField
      FieldName = 'tmt_gravid'
    end
    object cliMultatmt_infrat: TStringField
      FieldName = 'tmt_infrat'
    end
    object cliMultatmt_local: TStringField
      FieldName = 'tmt_local'
    end
    object cliMultatmt_nmrpts: TIntegerField
      FieldName = 'tmt_nmrpts'
    end
    object cliMultatmt_vlrmul: TBCDField
      FieldName = 'tmt_vlrmul'
      Precision = 12
      Size = 2
    end
    object cliMultatmt_usuinc: TStringField
      FieldName = 'tmt_usuinc'
      Size = 15
    end
    object cliMultatmt_datinc: TDateField
      FieldName = 'tmt_datinc'
    end
    object cliMultatmt_horinc: TStringField
      FieldName = 'tmt_horinc'
      Size = 8
    end
    object cliMultatmt_usualt: TStringField
      FieldName = 'tmt_usualt'
      Size = 15
    end
    object cliMultatmt_datalt: TDateField
      FieldName = 'tmt_datalt'
    end
    object cliMultatmt_horalt: TStringField
      FieldName = 'tmt_horalt'
      Size = 8
    end
    object cliMultaogt_codigo: TIntegerField
      FieldName = 'ogt_codigo'
    end
    object cliMultaogt_nome: TStringField
      FieldName = 'ogt_nome'
      Size = 60
    end
    object cliMultaogt_sigla: TStringField
      FieldName = 'ogt_sigla'
      Size = 10
    end
    object cliMultaogt_telef01: TStringField
      FieldName = 'ogt_telef01'
      Size = 11
    end
    object cliMultaogt_telef02: TStringField
      FieldName = 'ogt_telef02'
      Size = 11
    end
    object cliMultaogt_codpct: TStringField
      FieldName = 'ogt_codpct'
      Size = 10
    end
    object cliMultaogt_usuinc: TStringField
      FieldName = 'ogt_usuinc'
      Size = 15
    end
    object cliMultaogt_datinc: TDateField
      FieldName = 'ogt_datinc'
    end
    object cliMultaogt_horinc: TStringField
      FieldName = 'ogt_horinc'
      Size = 8
    end
    object cliMultaogt_usualt: TStringField
      FieldName = 'ogt_usualt'
      Size = 15
    end
    object cliMultaogt_datalt: TDateField
      FieldName = 'ogt_datalt'
    end
    object cliMultaogt_horalt: TStringField
      FieldName = 'ogt_horalt'
      Size = 8
    end
    object cliMultapss_codigo: TIntegerField
      FieldName = 'pss_codigo'
    end
    object cliMultapss_nome: TStringField
      FieldName = 'pss_nome'
      Size = 50
    end
    object cliMultapss_apelido: TStringField
      FieldName = 'pss_apelido'
    end
    object cliMultapss_codcgo: TIntegerField
      FieldName = 'pss_codcgo'
    end
    object cliMultapss_codltd: TIntegerField
      FieldName = 'pss_codltd'
    end
    object cliMultapss_datnas: TDateField
      FieldName = 'pss_datnas'
    end
    object cliMultapss_sexo: TStringField
      FieldName = 'pss_sexo'
      Size = 1
    end
    object cliMultapss_ecivil: TStringField
      FieldName = 'pss_ecivil'
      Size = 15
    end
    object cliMultapss_tpsangue: TStringField
      FieldName = 'pss_tpsangue'
      Size = 3
    end
    object cliMultapss_nompal: TStringField
      FieldName = 'pss_nompal'
      Size = 50
    end
    object cliMultapss_nommae: TStringField
      FieldName = 'pss_nommae'
      Size = 50
    end
    object cliMultapss_cpf: TStringField
      FieldName = 'pss_cpf'
      Size = 11
    end
    object cliMultapss_rg: TStringField
      FieldName = 'pss_rg'
      Size = 15
    end
    object cliMultapss_rgexped: TStringField
      FieldName = 'pss_rgexped'
    end
    object cliMultapss_rgdata: TDateField
      FieldName = 'pss_rgdata'
    end
    object cliMultapss_pispasep: TStringField
      FieldName = 'pss_pispasep'
      Size = 14
    end
    object cliMultapss_numctps: TStringField
      FieldName = 'pss_numctps'
      Size = 14
    end
    object cliMultapss_habilitac: TStringField
      FieldName = 'pss_habilitac'
      Size = 11
    end
    object cliMultapss_hbemite: TDateField
      FieldName = 'pss_hbemite'
    end
    object cliMultapss_hbvalid: TDateField
      FieldName = 'pss_hbvalid'
    end
    object cliMultapss_hbcateg: TStringField
      FieldName = 'pss_hbcateg'
      Size = 4
    end
    object cliMultapss_nrtitulo: TStringField
      FieldName = 'pss_nrtitulo'
      Size = 14
    end
    object cliMultapss_nrreserv: TStringField
      FieldName = 'pss_nrreserv'
      Size = 14
    end
    object cliMultapss_cep: TStringField
      FieldName = 'pss_cep'
      Size = 8
    end
    object cliMultapss_endereco: TStringField
      FieldName = 'pss_endereco'
      Size = 50
    end
    object cliMultapss_complem: TStringField
      FieldName = 'pss_complem'
      Size = 25
    end
    object cliMultapss_numres: TStringField
      FieldName = 'pss_numres'
      Size = 6
    end
    object cliMultapss_bairro: TStringField
      FieldName = 'pss_bairro'
      Size = 50
    end
    object cliMultapss_codcid: TIntegerField
      FieldName = 'pss_codcid'
    end
    object cliMultapss_tpimove: TStringField
      FieldName = 'pss_tpimove'
      Size = 15
    end
    object cliMultapss_tpresid: TStringField
      FieldName = 'pss_tpresid'
      Size = 15
    end
    object cliMultapss_telef01: TStringField
      FieldName = 'pss_telef01'
      Size = 12
    end
    object cliMultapss_telef02: TStringField
      FieldName = 'pss_telef02'
      Size = 12
    end
    object cliMultapss_celular: TStringField
      FieldName = 'pss_celular'
      Size = 12
    end
    object cliMultapss_email: TStringField
      FieldName = 'pss_email'
      Size = 100
    end
    object cliMultapss_status: TStringField
      FieldName = 'pss_status'
      Size = 15
    end
    object cliMultapss_foto: TBlobField
      FieldName = 'pss_foto'
    end
    object cliMultapss_obs: TMemoField
      FieldName = 'pss_obs'
      BlobType = ftMemo
    end
    object cliMultapss_vlrrenda: TBCDField
      FieldName = 'pss_vlrrenda'
      Precision = 15
      Size = 2
    end
    object cliMultapss_vlrvale: TBCDField
      FieldName = 'pss_vlrvale'
      Precision = 15
      Size = 2
    end
    object cliMultapss_datcmp: TDateField
      FieldName = 'pss_datcmp'
    end
    object cliMultapss_nfecmp: TStringField
      FieldName = 'pss_nfecmp'
      Size = 10
    end
    object cliMultapss_codpcv: TStringField
      FieldName = 'pss_codpcv'
      Size = 10
    end
    object cliMultapss_codpcr: TStringField
      FieldName = 'pss_codpcr'
      Size = 10
    end
    object cliMultapss_usuinc: TStringField
      FieldName = 'pss_usuinc'
      Size = 15
    end
    object cliMultapss_datinc: TDateField
      FieldName = 'pss_datinc'
    end
    object cliMultapss_horinc: TStringField
      FieldName = 'pss_horinc'
      Size = 8
    end
    object cliMultapss_usualt: TStringField
      FieldName = 'pss_usualt'
      Size = 15
    end
    object cliMultapss_datalt: TDateField
      FieldName = 'pss_datalt'
    end
    object cliMultapss_horalt: TStringField
      FieldName = 'pss_horalt'
      Size = 8
    end
  end
  object dsMulta: TDataSource
    DataSet = cliMulta
    Left = 1550
    Top = 264
  end
  object dspPneuCmp: TDataSetProvider
    DataSet = sqlPneuCmp
    UpdateMode = upWhereKeyOnly
    Left = 1398
    Top = 320
  end
  object cliPneuCmp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPneuCmp'
    Left = 1478
    Top = 320
    object cliPneuCmppcp_codigo: TIntegerField
      FieldName = 'pcp_codigo'
    end
    object cliPneuCmppcp_numnfe: TStringField
      FieldName = 'pcp_numnfe'
      Size = 10
    end
    object cliPneuCmppcp_sernfe: TStringField
      FieldName = 'pcp_sernfe'
      Size = 5
    end
    object cliPneuCmppcp_chelet: TStringField
      FieldName = 'pcp_chelet'
      Size = 44
    end
    object cliPneuCmppcp_datems: TDateField
      FieldName = 'pcp_datems'
    end
    object cliPneuCmppcp_datent: TDateField
      FieldName = 'pcp_datent'
    end
    object cliPneuCmppcp_codfnd: TIntegerField
      FieldName = 'pcp_codfnd'
    end
    object cliPneuCmppcp_codfpg: TIntegerField
      FieldName = 'pcp_codfpg'
    end
    object cliPneuCmppcp_fatura: TBooleanField
      FieldName = 'pcp_fatura'
    end
    object cliPneuCmppcp_vlrfrt: TBCDField
      FieldName = 'pcp_vlrfrt'
      Precision = 15
      Size = 2
    end
    object cliPneuCmppcp_vlrfac: TBCDField
      FieldName = 'pcp_vlrfac'
      Precision = 15
      Size = 2
    end
    object cliPneuCmppcp_vlrseg: TBCDField
      FieldName = 'pcp_vlrseg'
      Precision = 15
      Size = 2
    end
    object cliPneuCmppcp_qtdpct: TIntegerField
      FieldName = 'pcp_qtdpct'
    end
    object cliPneuCmppcp_parcel: TStringField
      FieldName = 'pcp_parcel'
      Size = 4
    end
    object cliPneuCmppcp_usuinc: TStringField
      FieldName = 'pcp_usuinc'
      Size = 15
    end
    object cliPneuCmppcp_datinc: TDateField
      FieldName = 'pcp_datinc'
    end
    object cliPneuCmppcp_horinc: TStringField
      FieldName = 'pcp_horinc'
      Size = 8
    end
    object cliPneuCmppcp_usualt: TStringField
      FieldName = 'pcp_usualt'
      Size = 15
    end
    object cliPneuCmppcp_datalt: TDateField
      FieldName = 'pcp_datalt'
    end
    object cliPneuCmppcp_horalt: TStringField
      FieldName = 'pcp_horalt'
      Size = 8
    end
    object cliPneuCmpfnd_codigo: TIntegerField
      FieldName = 'fnd_codigo'
    end
    object cliPneuCmpfnd_ativo: TStringField
      FieldName = 'fnd_ativo'
      Size = 3
    end
    object cliPneuCmpfnd_nome: TStringField
      FieldName = 'fnd_nome'
      Size = 50
    end
    object cliPneuCmpfnd_rsocial: TStringField
      FieldName = 'fnd_rsocial'
      Size = 50
    end
    object cliPneuCmpfnd_tipopes: TStringField
      FieldName = 'fnd_tipopes'
      Size = 8
    end
    object cliPneuCmpfnd_cpfcnpj: TStringField
      FieldName = 'fnd_cpfcnpj'
      Size = 14
    end
    object cliPneuCmpfnd_codpct: TStringField
      FieldName = 'fnd_codpct'
      Size = 10
    end
    object cliPneuCmpfnd_endereco: TStringField
      FieldName = 'fnd_endereco'
      Size = 35
    end
    object cliPneuCmpfnd_numend: TStringField
      FieldName = 'fnd_numend'
      Size = 5
    end
    object cliPneuCmpfnd_complem: TStringField
      FieldName = 'fnd_complem'
      Size = 25
    end
    object cliPneuCmpfnd_bairro: TStringField
      FieldName = 'fnd_bairro'
      Size = 50
    end
    object cliPneuCmpfnd_cep: TStringField
      FieldName = 'fnd_cep'
      Size = 8
    end
    object cliPneuCmpfnd_codcid: TIntegerField
      FieldName = 'fnd_codcid'
    end
    object cliPneuCmpfnd_telef1: TStringField
      FieldName = 'fnd_telef1'
      Size = 12
    end
    object cliPneuCmpfnd_telef2: TStringField
      FieldName = 'fnd_telef2'
      Size = 12
    end
    object cliPneuCmpfnd_celula: TStringField
      FieldName = 'fnd_celula'
      Size = 12
    end
    object cliPneuCmpfnd_obs: TMemoField
      FieldName = 'fnd_obs'
      BlobType = ftMemo
    end
    object cliPneuCmpfnd_usuinc: TStringField
      FieldName = 'fnd_usuinc'
      Size = 15
    end
    object cliPneuCmpfnd_datinc: TDateField
      FieldName = 'fnd_datinc'
    end
    object cliPneuCmpfnd_horinc: TStringField
      FieldName = 'fnd_horinc'
      Size = 8
    end
    object cliPneuCmpfnd_usualt: TStringField
      FieldName = 'fnd_usualt'
      Size = 15
    end
    object cliPneuCmpfnd_datalt: TDateField
      FieldName = 'fnd_datalt'
    end
    object cliPneuCmpfnd_horalt: TStringField
      FieldName = 'fnd_horalt'
      Size = 8
    end
  end
  object dsPneuCmp: TDataSource
    DataSet = cliPneuCmp
    Left = 1550
    Top = 320
  end
  object dspprocveic: TDataSetProvider
    DataSet = sqlprocveic
    UpdateMode = upWhereKeyOnly
    Left = 1398
    Top = 368
  end
  object cliprocveic: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspprocveic'
    Left = 1478
    Top = 368
    object cliprocveicprv_codigo: TIntegerField
      FieldName = 'prv_codigo'
    end
    object cliprocveicprv_numpro: TStringField
      FieldName = 'prv_numpro'
      Size = 9
    end
    object cliprocveicprv_datpro: TDateField
      FieldName = 'prv_datpro'
    end
    object cliprocveicprv_datems: TDateField
      FieldName = 'prv_datems'
    end
    object cliprocveicprv_origem: TStringField
      FieldName = 'prv_origem'
      Size = 10
    end
    object cliprocveicprv_destin: TStringField
      FieldName = 'prv_destin'
      Size = 10
    end
    object cliprocveicprv_codplc: TStringField
      FieldName = 'prv_codplc'
      Size = 7
    end
    object cliprocveicprv_usuinc: TStringField
      FieldName = 'prv_usuinc'
      Size = 15
    end
    object cliprocveicprv_datinc: TDateField
      FieldName = 'prv_datinc'
    end
    object cliprocveicprv_horinc: TStringField
      FieldName = 'prv_horinc'
      Size = 8
    end
    object cliprocveicprv_usualt: TStringField
      FieldName = 'prv_usualt'
      Size = 15
    end
    object cliprocveicprv_datalt: TDateField
      FieldName = 'prv_datalt'
    end
    object cliprocveicprv_horalt: TStringField
      FieldName = 'prv_horalt'
      Size = 8
    end
    object cliprocveicvat_placa: TStringField
      FieldName = 'vat_placa'
      Size = 7
    end
    object cliprocveicvat_nrfrota: TStringField
      FieldName = 'vat_nrfrota'
      Size = 5
    end
    object cliprocveicvat_paestversa: TStringField
      FieldName = 'vat_paestversa'
      Size = 5
    end
    object cliprocveicvat_chip: TStringField
      FieldName = 'vat_chip'
      Size = 10
    end
    object cliprocveicvat_cartao: TStringField
      FieldName = 'vat_cartao'
      Size = 15
    end
    object cliprocveicvat_chassi: TStringField
      FieldName = 'vat_chassi'
      Size = 17
    end
    object cliprocveicvat_licenc: TStringField
      FieldName = 'vat_licenc'
      Size = 15
    end
    object cliprocveicvat_renavan: TStringField
      FieldName = 'vat_renavan'
      Size = 15
    end
    object cliprocveicvat_dut: TStringField
      FieldName = 'vat_dut'
      Size = 10
    end
    object cliprocveicvat_codltd: TIntegerField
      FieldName = 'vat_codltd'
    end
    object cliprocveicvat_codtip: TIntegerField
      FieldName = 'vat_codtip'
    end
    object cliprocveicvat_codmdl: TIntegerField
      FieldName = 'vat_codmdl'
    end
    object cliprocveicvat_codmrc: TIntegerField
      FieldName = 'vat_codmrc'
    end
    object cliprocveicvat_codcor: TIntegerField
      FieldName = 'vat_codcor'
    end
    object cliprocveicvat_codcid: TIntegerField
      FieldName = 'vat_codcid'
    end
    object cliprocveicvat_codgrm: TIntegerField
      FieldName = 'vat_codgrm'
    end
    object cliprocveicvat_cor: TStringField
      FieldName = 'vat_cor'
    end
    object cliprocveicvat_status: TStringField
      FieldName = 'vat_status'
      Size = 15
    end
    object cliprocveicvat_tanque1: TBCDField
      FieldName = 'vat_tanque1'
      Precision = 7
      Size = 0
    end
    object cliprocveicvat_tanque2: TBCDField
      FieldName = 'vat_tanque2'
      Precision = 7
      Size = 0
    end
    object cliprocveicvat_tanque3: TBCDField
      FieldName = 'vat_tanque3'
      Precision = 7
      Size = 0
    end
    object cliprocveicvat_kmini: TBCDField
      FieldName = 'vat_kmini'
      Precision = 7
      Size = 0
    end
    object cliprocveicvat_kmatu: TBCDField
      FieldName = 'vat_kmatu'
      Precision = 7
      Size = 0
    end
    object cliprocveicvat_anofbmd: TStringField
      FieldName = 'vat_anofbmd'
      Size = 8
    end
    object cliprocveicvat_termo: TStringField
      FieldName = 'vat_termo'
      Size = 8
    end
    object cliprocveicvat_tombo: TStringField
      FieldName = 'vat_tombo'
      Size = 10
    end
    object cliprocveicvat_estado: TStringField
      FieldName = 'vat_estado'
      Size = 15
    end
    object cliprocveicvat_qtdpass: TStringField
      FieldName = 'vat_qtdpass'
      Size = 2
    end
    object cliprocveicvat_potenc: TStringField
      FieldName = 'vat_potenc'
      Size = 5
    end
    object cliprocveicvat_kgbruto: TBCDField
      FieldName = 'vat_kgbruto'
      Precision = 7
      Size = 0
    end
    object cliprocveicvat_kgcarga: TBCDField
      FieldName = 'vat_kgcarga'
      Precision = 7
      Size = 0
    end
    object cliprocveicvat_clindad: TStringField
      FieldName = 'vat_clindad'
      Size = 4
    end
    object cliprocveicvat_nrmotor: TStringField
      FieldName = 'vat_nrmotor'
      Size = 15
    end
    object cliprocveicvat_cavalo: TStringField
      FieldName = 'vat_cavalo'
      Size = 10
    end
    object cliprocveicvat_foto: TBlobField
      FieldName = 'vat_foto'
    end
    object cliprocveicvat_obs: TMemoField
      FieldName = 'vat_obs'
      BlobType = ftMemo
    end
    object cliprocveicvat_vlrcmp: TBCDField
      FieldName = 'vat_vlrcmp'
      Precision = 15
      Size = 2
    end
    object cliprocveicvat_datcmp: TDateField
      FieldName = 'vat_datcmp'
    end
    object cliprocveicvat_nfecmp: TStringField
      FieldName = 'vat_nfecmp'
      Size = 10
    end
    object cliprocveicvat_usuinc: TStringField
      FieldName = 'vat_usuinc'
      Size = 15
    end
    object cliprocveicvat_datinc: TDateField
      FieldName = 'vat_datinc'
    end
    object cliprocveicvat_horinc: TStringField
      FieldName = 'vat_horinc'
      Size = 8
    end
    object cliprocveicvat_usualt: TStringField
      FieldName = 'vat_usualt'
      Size = 15
    end
    object cliprocveicvat_datalt: TDateField
      FieldName = 'vat_datalt'
    end
    object cliprocveicvat_horalt: TStringField
      FieldName = 'vat_horalt'
      Size = 8
    end
    object cliprocveicltd_codigo: TIntegerField
      FieldName = 'ltd_codigo'
    end
    object cliprocveicltd_nome: TStringField
      FieldName = 'ltd_nome'
      Size = 35
    end
    object cliprocveicltd_sigla: TStringField
      FieldName = 'ltd_sigla'
      Size = 5
    end
    object cliprocveicltd_endereco: TStringField
      FieldName = 'ltd_endereco'
      Size = 35
    end
    object cliprocveicltd_numend: TStringField
      FieldName = 'ltd_numend'
      Size = 5
    end
    object cliprocveicltd_complem: TStringField
      FieldName = 'ltd_complem'
      Size = 25
    end
    object cliprocveicltd_bairro: TStringField
      FieldName = 'ltd_bairro'
      Size = 50
    end
    object cliprocveicltd_cep: TStringField
      FieldName = 'ltd_cep'
      Size = 8
    end
    object cliprocveicltd_codcid: TIntegerField
      FieldName = 'ltd_codcid'
    end
    object cliprocveicltd_telef1: TStringField
      FieldName = 'ltd_telef1'
      Size = 12
    end
    object cliprocveicltd_telef2: TStringField
      FieldName = 'ltd_telef2'
      Size = 12
    end
    object cliprocveicltd_celula: TStringField
      FieldName = 'ltd_celula'
      Size = 12
    end
    object cliprocveicltd_usuinc: TStringField
      FieldName = 'ltd_usuinc'
      Size = 15
    end
    object cliprocveicltd_datinc: TDateField
      FieldName = 'ltd_datinc'
    end
    object cliprocveicltd_horinc: TStringField
      FieldName = 'ltd_horinc'
      Size = 8
    end
    object cliprocveicltd_usualt: TStringField
      FieldName = 'ltd_usualt'
      Size = 15
    end
    object cliprocveicltd_datalt: TDateField
      FieldName = 'ltd_datalt'
    end
    object cliprocveicltd_horalt: TStringField
      FieldName = 'ltd_horalt'
      Size = 8
    end
    object cliprocveictip_codigo: TIntegerField
      FieldName = 'tip_codigo'
    end
    object cliprocveictip_nome: TStringField
      FieldName = 'tip_nome'
      Size = 25
    end
    object cliprocveictip_teixo: TBCDField
      FieldName = 'tip_teixo'
      Precision = 1
      Size = 0
    end
    object cliprocveictip_usuinc: TStringField
      FieldName = 'tip_usuinc'
      Size = 15
    end
    object cliprocveictip_step: TBCDField
      FieldName = 'tip_step'
      Precision = 1
      Size = 0
    end
    object cliprocveictip_tipo: TStringField
      FieldName = 'tip_tipo'
      Size = 15
    end
    object cliprocveictip_trac: TStringField
      FieldName = 'tip_trac'
      Size = 15
    end
    object cliprocveictip_datinc: TDateField
      FieldName = 'tip_datinc'
    end
    object cliprocveictip_horinc: TStringField
      FieldName = 'tip_horinc'
      Size = 8
    end
    object cliprocveictip_usualt: TStringField
      FieldName = 'tip_usualt'
      Size = 15
    end
    object cliprocveictip_datalt: TDateField
      FieldName = 'tip_datalt'
    end
    object cliprocveictip_horalt: TStringField
      FieldName = 'tip_horalt'
      Size = 8
    end
    object cliprocveicmdl_codigo: TIntegerField
      FieldName = 'mdl_codigo'
    end
    object cliprocveicmdl_nome: TStringField
      FieldName = 'mdl_nome'
      Size = 25
    end
    object cliprocveicmdl_codfip: TStringField
      FieldName = 'mdl_codfip'
      Size = 10
    end
    object cliprocveicmdl_codmrc: TIntegerField
      FieldName = 'mdl_codmrc'
    end
    object cliprocveicmdl_codgrm: TIntegerField
      FieldName = 'mdl_codgrm'
    end
    object cliprocveicmdl_usuinc: TStringField
      FieldName = 'mdl_usuinc'
      Size = 15
    end
    object cliprocveicmdl_datinc: TDateField
      FieldName = 'mdl_datinc'
    end
    object cliprocveicmdl_horinc: TStringField
      FieldName = 'mdl_horinc'
      Size = 8
    end
    object cliprocveicmdl_usualt: TStringField
      FieldName = 'mdl_usualt'
      Size = 15
    end
    object cliprocveicmdl_datalt: TDateField
      FieldName = 'mdl_datalt'
    end
    object cliprocveicmdl_horalt: TStringField
      FieldName = 'mdl_horalt'
      Size = 8
    end
    object cliprocveiccor_codigo: TIntegerField
      FieldName = 'cor_codigo'
    end
    object cliprocveiccor_nome: TStringField
      FieldName = 'cor_nome'
      Size = 35
    end
    object cliprocveiccor_usuinc: TStringField
      FieldName = 'cor_usuinc'
      Size = 15
    end
    object cliprocveiccor_datinc: TDateField
      FieldName = 'cor_datinc'
    end
    object cliprocveiccor_horinc: TStringField
      FieldName = 'cor_horinc'
      Size = 8
    end
    object cliprocveiccor_usualt: TStringField
      FieldName = 'cor_usualt'
      Size = 15
    end
    object cliprocveiccor_datalt: TDateField
      FieldName = 'cor_datalt'
    end
    object cliprocveiccor_horalt: TStringField
      FieldName = 'cor_horalt'
      Size = 8
    end
    object cliprocveiccid_codigo: TIntegerField
      FieldName = 'cid_codigo'
    end
    object cliprocveiccid_cidnum: TStringField
      FieldName = 'cid_cidnum'
      Size = 8
    end
    object cliprocveiccid_nome: TStringField
      FieldName = 'cid_nome'
      Size = 35
    end
    object cliprocveiccid_codest: TIntegerField
      FieldName = 'cid_codest'
    end
    object cliprocveiccid_codpai: TIntegerField
      FieldName = 'cid_codpai'
    end
    object cliprocveiccid_usuinc: TStringField
      FieldName = 'cid_usuinc'
      Size = 15
    end
    object cliprocveiccid_datinc: TDateField
      FieldName = 'cid_datinc'
    end
    object cliprocveiccid_horinc: TStringField
      FieldName = 'cid_horinc'
      Size = 8
    end
    object cliprocveiccid_usualt: TStringField
      FieldName = 'cid_usualt'
      Size = 15
    end
    object cliprocveiccid_datalt: TDateField
      FieldName = 'cid_datalt'
    end
    object cliprocveiccid_horalt: TStringField
      FieldName = 'cid_horalt'
      Size = 8
    end
    object cliprocveicmrc_codigo: TIntegerField
      FieldName = 'mrc_codigo'
    end
    object cliprocveicmrc_nome: TStringField
      FieldName = 'mrc_nome'
      Size = 25
    end
    object cliprocveicmrc_usuinc: TStringField
      FieldName = 'mrc_usuinc'
      Size = 15
    end
    object cliprocveicmrc_datinc: TDateField
      FieldName = 'mrc_datinc'
    end
    object cliprocveicmrc_horinc: TStringField
      FieldName = 'mrc_horinc'
      Size = 8
    end
    object cliprocveicmrc_usualt: TStringField
      FieldName = 'mrc_usualt'
      Size = 15
    end
    object cliprocveicmrc_datalt: TDateField
      FieldName = 'mrc_datalt'
    end
    object cliprocveicmrc_horalt: TStringField
      FieldName = 'mrc_horalt'
      Size = 8
    end
    object cliprocveicgrm_codigo: TIntegerField
      FieldName = 'grm_codigo'
    end
    object cliprocveicgrm_nome: TStringField
      FieldName = 'grm_nome'
      Size = 40
    end
    object cliprocveicgrm_usuinc: TStringField
      FieldName = 'grm_usuinc'
      Size = 15
    end
    object cliprocveicgrm_datinc: TDateField
      FieldName = 'grm_datinc'
    end
    object cliprocveicgrm_horinc: TStringField
      FieldName = 'grm_horinc'
      Size = 8
    end
    object cliprocveicgrm_usualt: TStringField
      FieldName = 'grm_usualt'
      Size = 15
    end
    object cliprocveicgrm_datalt: TDateField
      FieldName = 'grm_datalt'
    end
    object cliprocveicgrm_horalt: TStringField
      FieldName = 'grm_horalt'
      Size = 8
    end
  end
  object dsprocveic: TDataSource
    DataSet = cliprocveic
    Left = 1550
    Top = 368
  end
  object dspmanutcab: TDataSetProvider
    DataSet = sqlmanutcab
    UpdateMode = upWhereKeyOnly
    Left = 1398
    Top = 432
  end
  object climanutcab: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspmanutcab'
    Left = 1478
    Top = 432
    object climanutcabosc_codigo: TIntegerField
      FieldName = 'osc_codigo'
    end
    object climanutcabosc_codplc: TStringField
      FieldName = 'osc_codplc'
      Size = 7
    end
    object climanutcabosc_numord: TStringField
      FieldName = 'osc_numord'
      Size = 8
    end
    object climanutcabosc_datems: TDateField
      FieldName = 'osc_datems'
    end
    object climanutcabosc_horems: TStringField
      FieldName = 'osc_horems'
      Size = 4
    end
    object climanutcabosc_datrea: TDateField
      FieldName = 'osc_datrea'
    end
    object climanutcabosc_horrea: TStringField
      FieldName = 'osc_horrea'
      Size = 4
    end
    object climanutcabosc_kmmnt: TBCDField
      FieldName = 'osc_kmmnt'
      Precision = 7
      Size = 0
    end
    object climanutcabosc_obs: TMemoField
      FieldName = 'osc_obs'
      BlobType = ftMemo
    end
    object climanutcabosc_tipoos: TStringField
      FieldName = 'osc_tipoos'
      Size = 10
    end
    object climanutcabosc_codfnd: TIntegerField
      FieldName = 'osc_codfnd'
    end
    object climanutcabosc_codpss: TIntegerField
      FieldName = 'osc_codpss'
    end
    object climanutcabosc_codfpg: TIntegerField
      FieldName = 'osc_codfpg'
    end
    object climanutcabosc_totpar: TBCDField
      FieldName = 'osc_totpar'
      Precision = 4
      Size = 0
    end
    object climanutcabosc_numnfe: TStringField
      FieldName = 'osc_numnfe'
      Size = 10
    end
    object climanutcabosc_dtnemi: TDateField
      FieldName = 'osc_dtnemi'
    end
    object climanutcabosc_chvnfe: TStringField
      FieldName = 'osc_chvnfe'
      Size = 24
    end
    object climanutcabosc_fatura: TBooleanField
      FieldName = 'osc_fatura'
    end
    object climanutcabosc_usuinc: TStringField
      FieldName = 'osc_usuinc'
      Size = 15
    end
    object climanutcabosc_datinc: TDateField
      FieldName = 'osc_datinc'
    end
    object climanutcabosc_horinc: TStringField
      FieldName = 'osc_horinc'
      Size = 8
    end
    object climanutcabosc_usualt: TStringField
      FieldName = 'osc_usualt'
      Size = 15
    end
    object climanutcabosc_datalt: TDateField
      FieldName = 'osc_datalt'
    end
    object climanutcabosc_horalt: TStringField
      FieldName = 'osc_horalt'
      Size = 8
    end
    object climanutcabvat_placa: TStringField
      FieldName = 'vat_placa'
      Size = 7
    end
    object climanutcabvat_nrfrota: TStringField
      FieldName = 'vat_nrfrota'
      Size = 5
    end
    object climanutcabvat_paestversa: TStringField
      FieldName = 'vat_paestversa'
      Size = 5
    end
    object climanutcabvat_chip: TStringField
      FieldName = 'vat_chip'
      Size = 10
    end
    object climanutcabvat_cartao: TStringField
      FieldName = 'vat_cartao'
      Size = 15
    end
    object climanutcabvat_chassi: TStringField
      FieldName = 'vat_chassi'
      Size = 17
    end
    object climanutcabvat_licenc: TStringField
      FieldName = 'vat_licenc'
      Size = 15
    end
    object climanutcabvat_renavan: TStringField
      FieldName = 'vat_renavan'
      Size = 15
    end
    object climanutcabvat_dut: TStringField
      FieldName = 'vat_dut'
      Size = 10
    end
    object climanutcabvat_codltd: TIntegerField
      FieldName = 'vat_codltd'
    end
    object climanutcabvat_codtip: TIntegerField
      FieldName = 'vat_codtip'
    end
    object climanutcabvat_codmdl: TIntegerField
      FieldName = 'vat_codmdl'
    end
    object climanutcabvat_codmrc: TIntegerField
      FieldName = 'vat_codmrc'
    end
    object climanutcabvat_codcor: TIntegerField
      FieldName = 'vat_codcor'
    end
    object climanutcabvat_codcid: TIntegerField
      FieldName = 'vat_codcid'
    end
    object climanutcabvat_codgrm: TIntegerField
      FieldName = 'vat_codgrm'
    end
    object climanutcabvat_cor: TStringField
      FieldName = 'vat_cor'
    end
    object climanutcabvat_status: TStringField
      FieldName = 'vat_status'
      Size = 15
    end
    object climanutcabvat_tanque1: TBCDField
      FieldName = 'vat_tanque1'
      Precision = 7
      Size = 0
    end
    object climanutcabvat_tanque2: TBCDField
      FieldName = 'vat_tanque2'
      Precision = 7
      Size = 0
    end
    object climanutcabvat_tanque3: TBCDField
      FieldName = 'vat_tanque3'
      Precision = 7
      Size = 0
    end
    object climanutcabvat_kmini: TBCDField
      FieldName = 'vat_kmini'
      Precision = 7
      Size = 0
    end
    object climanutcabvat_kmatu: TBCDField
      FieldName = 'vat_kmatu'
      Precision = 7
      Size = 0
    end
    object climanutcabvat_anofbmd: TStringField
      FieldName = 'vat_anofbmd'
      Size = 8
    end
    object climanutcabvat_termo: TStringField
      FieldName = 'vat_termo'
      Size = 8
    end
    object climanutcabvat_tombo: TStringField
      FieldName = 'vat_tombo'
      Size = 10
    end
    object climanutcabvat_estado: TStringField
      FieldName = 'vat_estado'
      Size = 15
    end
    object climanutcabvat_qtdpass: TStringField
      FieldName = 'vat_qtdpass'
      Size = 2
    end
    object climanutcabvat_potenc: TStringField
      FieldName = 'vat_potenc'
      Size = 5
    end
    object climanutcabvat_kgbruto: TBCDField
      FieldName = 'vat_kgbruto'
      Precision = 7
      Size = 0
    end
    object climanutcabvat_kgcarga: TBCDField
      FieldName = 'vat_kgcarga'
      Precision = 7
      Size = 0
    end
    object climanutcabvat_clindad: TStringField
      FieldName = 'vat_clindad'
      Size = 4
    end
    object climanutcabvat_nrmotor: TStringField
      FieldName = 'vat_nrmotor'
      Size = 15
    end
    object climanutcabvat_cavalo: TStringField
      FieldName = 'vat_cavalo'
      Size = 10
    end
    object climanutcabvat_foto: TBlobField
      FieldName = 'vat_foto'
    end
    object climanutcabvat_obs: TMemoField
      FieldName = 'vat_obs'
      BlobType = ftMemo
    end
    object climanutcabvat_vlrcmp: TBCDField
      FieldName = 'vat_vlrcmp'
      Precision = 15
      Size = 2
    end
    object climanutcabvat_datcmp: TDateField
      FieldName = 'vat_datcmp'
    end
    object climanutcabvat_nfecmp: TStringField
      FieldName = 'vat_nfecmp'
      Size = 10
    end
    object climanutcabvat_usuinc: TStringField
      FieldName = 'vat_usuinc'
      Size = 15
    end
    object climanutcabvat_datinc: TDateField
      FieldName = 'vat_datinc'
    end
    object climanutcabvat_horinc: TStringField
      FieldName = 'vat_horinc'
      Size = 8
    end
    object climanutcabvat_usualt: TStringField
      FieldName = 'vat_usualt'
      Size = 15
    end
    object climanutcabvat_datalt: TDateField
      FieldName = 'vat_datalt'
    end
    object climanutcabvat_horalt: TStringField
      FieldName = 'vat_horalt'
      Size = 8
    end
    object climanutcabfnd_codigo: TIntegerField
      FieldName = 'fnd_codigo'
    end
    object climanutcabfnd_ativo: TStringField
      FieldName = 'fnd_ativo'
      Size = 3
    end
    object climanutcabfnd_nome: TStringField
      FieldName = 'fnd_nome'
      Size = 50
    end
    object climanutcabfnd_rsocial: TStringField
      FieldName = 'fnd_rsocial'
      Size = 50
    end
    object climanutcabfnd_tipopes: TStringField
      FieldName = 'fnd_tipopes'
      Size = 8
    end
    object climanutcabfnd_cpfcnpj: TStringField
      FieldName = 'fnd_cpfcnpj'
      Size = 14
    end
    object climanutcabfnd_codpct: TStringField
      FieldName = 'fnd_codpct'
      Size = 10
    end
    object climanutcabfnd_endereco: TStringField
      FieldName = 'fnd_endereco'
      Size = 35
    end
    object climanutcabfnd_numend: TStringField
      FieldName = 'fnd_numend'
      Size = 5
    end
    object climanutcabfnd_complem: TStringField
      FieldName = 'fnd_complem'
      Size = 25
    end
    object climanutcabfnd_bairro: TStringField
      FieldName = 'fnd_bairro'
      Size = 50
    end
    object climanutcabfnd_cep: TStringField
      FieldName = 'fnd_cep'
      Size = 8
    end
    object climanutcabfnd_codcid: TIntegerField
      FieldName = 'fnd_codcid'
    end
    object climanutcabfnd_telef1: TStringField
      FieldName = 'fnd_telef1'
      Size = 12
    end
    object climanutcabfnd_telef2: TStringField
      FieldName = 'fnd_telef2'
      Size = 12
    end
    object climanutcabfnd_celula: TStringField
      FieldName = 'fnd_celula'
      Size = 12
    end
    object climanutcabfnd_obs: TMemoField
      FieldName = 'fnd_obs'
      BlobType = ftMemo
    end
    object climanutcabfnd_usuinc: TStringField
      FieldName = 'fnd_usuinc'
      Size = 15
    end
    object climanutcabfnd_datinc: TDateField
      FieldName = 'fnd_datinc'
    end
    object climanutcabfnd_horinc: TStringField
      FieldName = 'fnd_horinc'
      Size = 8
    end
    object climanutcabfnd_usualt: TStringField
      FieldName = 'fnd_usualt'
      Size = 15
    end
    object climanutcabfnd_datalt: TDateField
      FieldName = 'fnd_datalt'
    end
    object climanutcabfnd_horalt: TStringField
      FieldName = 'fnd_horalt'
      Size = 8
    end
    object climanutcabmdl_codigo: TIntegerField
      FieldName = 'mdl_codigo'
    end
    object climanutcabmdl_nome: TStringField
      FieldName = 'mdl_nome'
      Size = 25
    end
    object climanutcabmdl_codfip: TStringField
      FieldName = 'mdl_codfip'
      Size = 10
    end
    object climanutcabmdl_codmrc: TIntegerField
      FieldName = 'mdl_codmrc'
    end
    object climanutcabmdl_codgrm: TIntegerField
      FieldName = 'mdl_codgrm'
    end
    object climanutcabmdl_usuinc: TStringField
      FieldName = 'mdl_usuinc'
      Size = 15
    end
    object climanutcabmdl_datinc: TDateField
      FieldName = 'mdl_datinc'
    end
    object climanutcabmdl_horinc: TStringField
      FieldName = 'mdl_horinc'
      Size = 8
    end
    object climanutcabmdl_usualt: TStringField
      FieldName = 'mdl_usualt'
      Size = 15
    end
    object climanutcabmdl_datalt: TDateField
      FieldName = 'mdl_datalt'
    end
    object climanutcabmdl_horalt: TStringField
      FieldName = 'mdl_horalt'
      Size = 8
    end
    object climanutcabfpg_codigo: TIntegerField
      FieldName = 'fpg_codigo'
    end
    object climanutcabfpg_nome: TStringField
      FieldName = 'fpg_nome'
    end
    object climanutcabfpg_codpct: TStringField
      FieldName = 'fpg_codpct'
      Size = 10
    end
    object climanutcabfpg_acao: TStringField
      FieldName = 'fpg_acao'
      Size = 3
    end
    object climanutcabfpg_parcela: TStringField
      FieldName = 'fpg_parcela'
      Size = 3
    end
    object climanutcabfpg_pctdesc: TBCDField
      FieldName = 'fpg_pctdesc'
      Precision = 5
      Size = 2
    end
    object climanutcabfpg_pctacre: TBCDField
      FieldName = 'fpg_pctacre'
      Precision = 5
      Size = 2
    end
    object climanutcabfpg_usuinc: TStringField
      FieldName = 'fpg_usuinc'
      Size = 15
    end
    object climanutcabfpg_datinc: TDateField
      FieldName = 'fpg_datinc'
    end
    object climanutcabfpg_horinc: TStringField
      FieldName = 'fpg_horinc'
      Size = 8
    end
    object climanutcabfpg_usualt: TStringField
      FieldName = 'fpg_usualt'
      Size = 15
    end
    object climanutcabfpg_datalt: TDateField
      FieldName = 'fpg_datalt'
    end
    object climanutcabfpg_horalt: TStringField
      FieldName = 'fpg_horalt'
      Size = 8
    end
  end
  object dsmanutcab: TDataSource
    DataSet = climanutcab
    Left = 1550
    Top = 432
  end
  object dspmanutpcs: TDataSetProvider
    DataSet = sqlmanutpcs
    UpdateMode = upWhereKeyOnly
    Left = 1398
    Top = 480
  end
  object climanutpcs: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspmanutpcs'
    Left = 1478
    Top = 480
    object climanutpcsosp_codigo: TIntegerField
      FieldName = 'osp_codigo'
    end
    object climanutpcsosp_codosc: TIntegerField
      FieldName = 'osp_codosc'
    end
    object climanutpcsosp_codtpc: TIntegerField
      FieldName = 'osp_codtpc'
    end
    object climanutpcsosp_codcst: TStringField
      FieldName = 'osp_codcst'
      Size = 2
    end
    object climanutpcsosp_codcfo: TStringField
      FieldName = 'osp_codcfo'
      Size = 4
    end
    object climanutpcsosp_vlrpec: TBCDField
      FieldName = 'osp_vlrpec'
      Precision = 15
      Size = 2
    end
    object climanutpcsosp_qtdpec: TBCDField
      FieldName = 'osp_qtdpec'
      Precision = 10
      Size = 3
    end
    object climanutpcsosp_vlrdsc: TBCDField
      FieldName = 'osp_vlrdsc'
      Precision = 15
      Size = 2
    end
    object climanutpcsosp_pctdsc: TBCDField
      FieldName = 'osp_pctdsc'
      Precision = 5
      Size = 2
    end
    object climanutpcsosp_kmgtia: TBCDField
      FieldName = 'osp_kmgtia'
      Precision = 7
      Size = 0
    end
    object climanutpcsosp_kmatua: TBCDField
      FieldName = 'osp_kmatua'
      Precision = 7
      Size = 0
    end
    object climanutpcsosp_diagar: TBCDField
      FieldName = 'osp_diagar'
      Precision = 3
      Size = 0
    end
    object climanutpcsosp_pcticm: TBCDField
      FieldName = 'osp_pcticm'
      Precision = 5
      Size = 2
    end
    object climanutpcsosp_vlricm: TBCDField
      FieldName = 'osp_vlricm'
      Precision = 15
      Size = 2
    end
    object climanutpcsosp_pctipi: TBCDField
      FieldName = 'osp_pctipi'
      Precision = 5
      Size = 2
    end
    object climanutpcsosp_vlripi: TBCDField
      FieldName = 'osp_vlripi'
      Precision = 15
      Size = 2
    end
    object climanutpcsosp_pcticmst: TBCDField
      FieldName = 'osp_pcticmst'
      Precision = 5
      Size = 2
    end
    object climanutpcsosp_vlricmst: TBCDField
      FieldName = 'osp_vlricmst'
      Precision = 15
      Size = 2
    end
    object climanutpcsosp_usuinc: TStringField
      FieldName = 'osp_usuinc'
      Size = 15
    end
    object climanutpcsosp_datinc: TDateField
      FieldName = 'osp_datinc'
    end
    object climanutpcsosp_horinc: TStringField
      FieldName = 'osp_horinc'
      Size = 8
    end
    object climanutpcsosp_usualt: TStringField
      FieldName = 'osp_usualt'
      Size = 15
    end
    object climanutpcsosp_datalt: TDateField
      FieldName = 'osp_datalt'
    end
    object climanutpcsosp_horalt: TStringField
      FieldName = 'osp_horalt'
      Size = 8
    end
    object climanutpcstpc_codigo: TIntegerField
      FieldName = 'tpc_codigo'
    end
    object climanutpcstpc_codfbp: TIntegerField
      FieldName = 'tpc_codfbp'
    end
    object climanutpcstpc_codsgm: TIntegerField
      FieldName = 'tpc_codsgm'
    end
    object climanutpcstpc_codncm: TStringField
      FieldName = 'tpc_codncm'
      Size = 10
    end
    object climanutpcstpc_codcfo: TStringField
      FieldName = 'tpc_codcfo'
      Size = 4
    end
    object climanutpcstpc_codcst: TStringField
      FieldName = 'tpc_codcst'
      Size = 2
    end
    object climanutpcstpc_cdbarra: TStringField
      FieldName = 'tpc_cdbarra'
      Size = 15
    end
    object climanutpcstpc_referen: TStringField
      FieldName = 'tpc_referen'
    end
    object climanutpcstpc_nome: TStringField
      FieldName = 'tpc_nome'
      Size = 40
    end
    object climanutpcstpc_medida: TStringField
      FieldName = 'tpc_medida'
      Size = 3
    end
    object climanutpcstpc_kgpeso: TBCDField
      FieldName = 'tpc_kgpeso'
      Precision = 15
      Size = 3
    end
    object climanutpcstpc_kgcubag: TBCDField
      FieldName = 'tpc_kgcubag'
      Precision = 15
      Size = 3
    end
    object climanutpcstpc_ativo: TBooleanField
      FieldName = 'tpc_ativo'
    end
    object climanutpcstpc_datpro: TDateField
      FieldName = 'tpc_datpro'
    end
    object climanutpcstpc_datems: TDateField
      FieldName = 'tpc_datems'
    end
    object climanutpcstpc_usuinc: TStringField
      FieldName = 'tpc_usuinc'
      Size = 15
    end
    object climanutpcstpc_datinc: TDateField
      FieldName = 'tpc_datinc'
    end
    object climanutpcstpc_horinc: TStringField
      FieldName = 'tpc_horinc'
      Size = 8
    end
    object climanutpcstpc_usualt: TStringField
      FieldName = 'tpc_usualt'
      Size = 15
    end
    object climanutpcstpc_datalt: TDateField
      FieldName = 'tpc_datalt'
    end
    object climanutpcstpc_horalt: TStringField
      FieldName = 'tpc_horalt'
      Size = 8
    end
    object climanutpcscst_codigo: TStringField
      FieldName = 'cst_codigo'
      Size = 2
    end
    object climanutpcscst_descri: TStringField
      FieldName = 'cst_descri'
      Size = 100
    end
    object climanutpcscst_clcicm: TBooleanField
      FieldName = 'cst_clcicm'
    end
    object climanutpcscst_cf: TStringField
      FieldName = 'cst_cf'
      Size = 5
    end
    object climanutpcscst_usuinc: TStringField
      FieldName = 'cst_usuinc'
      Size = 15
    end
    object climanutpcscst_datinc: TDateField
      FieldName = 'cst_datinc'
    end
    object climanutpcscst_horinc: TStringField
      FieldName = 'cst_horinc'
      Size = 8
    end
    object climanutpcscst_usualt: TStringField
      FieldName = 'cst_usualt'
      Size = 15
    end
    object climanutpcscst_datalt: TDateField
      FieldName = 'cst_datalt'
    end
    object climanutpcscst_horalt: TStringField
      FieldName = 'cst_horalt'
      Size = 8
    end
    object climanutpcscfo_codigo: TStringField
      FieldName = 'cfo_codigo'
      Size = 4
    end
    object climanutpcscfo_nome: TStringField
      FieldName = 'cfo_nome'
      Size = 350
    end
    object climanutpcscfo_usuinc: TStringField
      FieldName = 'cfo_usuinc'
      Size = 15
    end
    object climanutpcscfo_datinc: TDateField
      FieldName = 'cfo_datinc'
    end
    object climanutpcscfo_horinc: TStringField
      FieldName = 'cfo_horinc'
      Size = 8
    end
    object climanutpcscfo_usualt: TStringField
      FieldName = 'cfo_usualt'
      Size = 15
    end
    object climanutpcscfo_datalt: TDateField
      FieldName = 'cfo_datalt'
    end
    object climanutpcscfo_horalt: TStringField
      FieldName = 'cfo_horalt'
      Size = 8
    end
    object climanutpcstotal: TFMTBCDField
      FieldName = 'total'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
  end
  object dsmanutpcs: TDataSource
    DataSet = climanutpcs
    Left = 1550
    Top = 480
  end
  object dspmanutsrv: TDataSetProvider
    DataSet = sqlmanutsrv
    UpdateMode = upWhereKeyOnly
    Left = 1398
    Top = 536
  end
  object climanutsrv: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspmanutsrv'
    Left = 1478
    Top = 536
    object climanutsrvoss_codigo: TIntegerField
      FieldName = 'oss_codigo'
    end
    object climanutsrvoss_codosc: TIntegerField
      FieldName = 'oss_codosc'
    end
    object climanutsrvoss_codtsm: TIntegerField
      FieldName = 'oss_codtsm'
    end
    object climanutsrvoss_codcst: TStringField
      FieldName = 'oss_codcst'
      Size = 2
    end
    object climanutsrvoss_codcfo: TStringField
      FieldName = 'oss_codcfo'
      Size = 4
    end
    object climanutsrvoss_vlrsrv: TBCDField
      FieldName = 'oss_vlrsrv'
      Precision = 15
      Size = 2
    end
    object climanutsrvoss_qtdsrv: TBCDField
      FieldName = 'oss_qtdsrv'
      Precision = 10
      Size = 3
    end
    object climanutsrvoss_vlrdsc: TBCDField
      FieldName = 'oss_vlrdsc'
      Precision = 15
      Size = 2
    end
    object climanutsrvoss_pctdsc: TBCDField
      FieldName = 'oss_pctdsc'
      Precision = 5
      Size = 2
    end
    object climanutsrvoss_kmgtia: TBCDField
      FieldName = 'oss_kmgtia'
      Precision = 7
      Size = 0
    end
    object climanutsrvoss_kmatua: TBCDField
      FieldName = 'oss_kmatua'
      Precision = 7
      Size = 0
    end
    object climanutsrvoss_diagar: TBCDField
      FieldName = 'oss_diagar'
      Precision = 3
      Size = 0
    end
    object climanutsrvoss_pcticm: TBCDField
      FieldName = 'oss_pcticm'
      Precision = 5
      Size = 2
    end
    object climanutsrvoss_vlricm: TBCDField
      FieldName = 'oss_vlricm'
      Precision = 15
      Size = 2
    end
    object climanutsrvoss_pctipi: TBCDField
      FieldName = 'oss_pctipi'
      Precision = 5
      Size = 2
    end
    object climanutsrvoss_vlripi: TBCDField
      FieldName = 'oss_vlripi'
      Precision = 15
      Size = 2
    end
    object climanutsrvoss_pcticmst: TBCDField
      FieldName = 'oss_pcticmst'
      Precision = 5
      Size = 2
    end
    object climanutsrvoss_vlricmst: TBCDField
      FieldName = 'oss_vlricmst'
      Precision = 15
      Size = 2
    end
    object climanutsrvoss_usuinc: TStringField
      FieldName = 'oss_usuinc'
      Size = 15
    end
    object climanutsrvoss_datinc: TDateField
      FieldName = 'oss_datinc'
    end
    object climanutsrvoss_horinc: TStringField
      FieldName = 'oss_horinc'
      Size = 8
    end
    object climanutsrvoss_usualt: TStringField
      FieldName = 'oss_usualt'
      Size = 15
    end
    object climanutsrvoss_datalt: TDateField
      FieldName = 'oss_datalt'
    end
    object climanutsrvoss_horalt: TStringField
      FieldName = 'oss_horalt'
      Size = 8
    end
    object climanutsrvtsm_codigo: TIntegerField
      FieldName = 'tsm_codigo'
    end
    object climanutsrvtsm_nome: TStringField
      FieldName = 'tsm_nome'
      Size = 25
    end
    object climanutsrvtsm_vlrhor: TBCDField
      FieldName = 'tsm_vlrhor'
      Precision = 12
      Size = 2
    end
    object climanutsrvtsm_codsgm: TIntegerField
      FieldName = 'tsm_codsgm'
    end
    object climanutsrvtsm_usuinc: TStringField
      FieldName = 'tsm_usuinc'
      Size = 15
    end
    object climanutsrvtsm_datinc: TDateField
      FieldName = 'tsm_datinc'
    end
    object climanutsrvtsm_horinc: TStringField
      FieldName = 'tsm_horinc'
      Size = 8
    end
    object climanutsrvtsm_usualt: TStringField
      FieldName = 'tsm_usualt'
      Size = 15
    end
    object climanutsrvtsm_datalt: TDateField
      FieldName = 'tsm_datalt'
    end
    object climanutsrvtsm_horalt: TStringField
      FieldName = 'tsm_horalt'
      Size = 8
    end
    object climanutsrvcst_codigo: TStringField
      FieldName = 'cst_codigo'
      Size = 2
    end
    object climanutsrvcst_descri: TStringField
      FieldName = 'cst_descri'
      Size = 100
    end
    object climanutsrvcst_clcicm: TBooleanField
      FieldName = 'cst_clcicm'
    end
    object climanutsrvcst_cf: TStringField
      FieldName = 'cst_cf'
      Size = 5
    end
    object climanutsrvcst_usuinc: TStringField
      FieldName = 'cst_usuinc'
      Size = 15
    end
    object climanutsrvcst_datinc: TDateField
      FieldName = 'cst_datinc'
    end
    object climanutsrvcst_horinc: TStringField
      FieldName = 'cst_horinc'
      Size = 8
    end
    object climanutsrvcst_usualt: TStringField
      FieldName = 'cst_usualt'
      Size = 15
    end
    object climanutsrvcst_datalt: TDateField
      FieldName = 'cst_datalt'
    end
    object climanutsrvcst_horalt: TStringField
      FieldName = 'cst_horalt'
      Size = 8
    end
    object climanutsrvcfo_codigo: TStringField
      FieldName = 'cfo_codigo'
      Size = 4
    end
    object climanutsrvcfo_nome: TStringField
      FieldName = 'cfo_nome'
      Size = 350
    end
    object climanutsrvcfo_usuinc: TStringField
      FieldName = 'cfo_usuinc'
      Size = 15
    end
    object climanutsrvcfo_datinc: TDateField
      FieldName = 'cfo_datinc'
    end
    object climanutsrvcfo_horinc: TStringField
      FieldName = 'cfo_horinc'
      Size = 8
    end
    object climanutsrvcfo_usualt: TStringField
      FieldName = 'cfo_usualt'
      Size = 15
    end
    object climanutsrvcfo_datalt: TDateField
      FieldName = 'cfo_datalt'
    end
    object climanutsrvcfo_horalt: TStringField
      FieldName = 'cfo_horalt'
      Size = 8
    end
    object climanutsrvtotal: TFMTBCDField
      FieldName = 'total'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
  end
  object dsmanutsrv: TDataSource
    DataSet = climanutsrv
    Left = 1550
    Top = 536
  end
  object dspmanutfpg: TDataSetProvider
    DataSet = sqlmanutfpg
    UpdateMode = upWhereKeyOnly
    Left = 1398
    Top = 592
  end
  object climanutfpg: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspmanutfpg'
    Left = 1478
    Top = 592
    object climanutfpgosf_codigo: TIntegerField
      FieldName = 'osf_codigo'
    end
    object climanutfpgosf_codosc: TIntegerField
      FieldName = 'osf_codosc'
    end
    object climanutfpgosf_codcfr: TIntegerField
      FieldName = 'osf_codcfr'
    end
    object climanutfpgosf_numbol: TStringField
      FieldName = 'osf_numbol'
      Size = 45
    end
    object climanutfpgosf_datvnc: TDateField
      FieldName = 'osf_datvnc'
    end
    object climanutfpgosf_vlrpar: TBCDField
      FieldName = 'osf_vlrpar'
      Precision = 15
      Size = 2
    end
    object climanutfpgosf_usuinc: TStringField
      FieldName = 'osf_usuinc'
      Size = 15
    end
    object climanutfpgosf_datinc: TDateField
      FieldName = 'osf_datinc'
    end
    object climanutfpgosf_horinc: TStringField
      FieldName = 'osf_horinc'
      Size = 8
    end
    object climanutfpgosf_usualt: TStringField
      FieldName = 'osf_usualt'
      Size = 15
    end
    object climanutfpgosf_datalt: TDateField
      FieldName = 'osf_datalt'
    end
    object climanutfpgosf_horalt: TStringField
      FieldName = 'osf_horalt'
      Size = 8
    end
    object climanutfpgosc_codigo: TIntegerField
      FieldName = 'osc_codigo'
    end
    object climanutfpgosc_codplc: TStringField
      FieldName = 'osc_codplc'
      Size = 7
    end
    object climanutfpgosc_numord: TStringField
      FieldName = 'osc_numord'
      Size = 8
    end
    object climanutfpgosc_datems: TDateField
      FieldName = 'osc_datems'
    end
    object climanutfpgosc_horems: TStringField
      FieldName = 'osc_horems'
      Size = 4
    end
    object climanutfpgosc_datrea: TDateField
      FieldName = 'osc_datrea'
    end
    object climanutfpgosc_horrea: TStringField
      FieldName = 'osc_horrea'
      Size = 4
    end
    object climanutfpgosc_kmmnt: TBCDField
      FieldName = 'osc_kmmnt'
      Precision = 7
      Size = 0
    end
    object climanutfpgosc_obs: TMemoField
      FieldName = 'osc_obs'
      BlobType = ftMemo
    end
    object climanutfpgosc_tipoos: TStringField
      FieldName = 'osc_tipoos'
      Size = 10
    end
    object climanutfpgosc_codfnd: TIntegerField
      FieldName = 'osc_codfnd'
    end
    object climanutfpgosc_codpss: TIntegerField
      FieldName = 'osc_codpss'
    end
    object climanutfpgosc_codfpg: TIntegerField
      FieldName = 'osc_codfpg'
    end
    object climanutfpgosc_totpar: TBCDField
      FieldName = 'osc_totpar'
      Precision = 4
      Size = 0
    end
    object climanutfpgosc_numnfe: TStringField
      FieldName = 'osc_numnfe'
      Size = 10
    end
    object climanutfpgosc_dtnemi: TDateField
      FieldName = 'osc_dtnemi'
    end
    object climanutfpgosc_chvnfe: TStringField
      FieldName = 'osc_chvnfe'
      Size = 24
    end
    object climanutfpgosc_fatura: TBooleanField
      FieldName = 'osc_fatura'
    end
    object climanutfpgosc_usuinc: TStringField
      FieldName = 'osc_usuinc'
      Size = 15
    end
    object climanutfpgosc_datinc: TDateField
      FieldName = 'osc_datinc'
    end
    object climanutfpgosc_horinc: TStringField
      FieldName = 'osc_horinc'
      Size = 8
    end
    object climanutfpgosc_usualt: TStringField
      FieldName = 'osc_usualt'
      Size = 15
    end
    object climanutfpgosc_datalt: TDateField
      FieldName = 'osc_datalt'
    end
    object climanutfpgosc_horalt: TStringField
      FieldName = 'osc_horalt'
      Size = 8
    end
    object climanutfpgtotal: TFMTBCDField
      FieldName = 'total'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
  end
  object dsmanutfpg: TDataSource
    DataSet = climanutfpg
    Left = 1550
    Top = 592
  end
  object dspOrdcoleta: TDataSetProvider
    DataSet = SqlOrdcoleta
    UpdateMode = upWhereKeyOnly
    Left = 1398
    Top = 648
  end
  object cliOrdcoleta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOrdcoleta'
    Left = 1478
    Top = 648
    object cliOrdcoletaodc_codigo: TIntegerField
      FieldName = 'odc_codigo'
    end
    object cliOrdcoletaodc_datems: TDateField
      FieldName = 'odc_datems'
    end
    object cliOrdcoletaodc_horems: TStringField
      FieldName = 'odc_horems'
      Size = 4
    end
    object cliOrdcoletaodc_codcli: TIntegerField
      FieldName = 'odc_codcli'
    end
    object cliOrdcoletaodc_codtmc: TIntegerField
      FieldName = 'odc_codtmc'
    end
    object cliOrdcoletaodc_codtme: TIntegerField
      FieldName = 'odc_codtme'
    end
    object cliOrdcoletaodc_codocg: TIntegerField
      FieldName = 'odc_codocg'
    end
    object cliOrdcoletaodc_codtcn: TIntegerField
      FieldName = 'odc_codtcn'
    end
    object cliOrdcoletaodc_codnav: TIntegerField
      FieldName = 'odc_codnav'
    end
    object cliOrdcoletaodc_codpss: TIntegerField
      FieldName = 'odc_codpss'
    end
    object cliOrdcoletaodc_codpl1: TStringField
      FieldName = 'odc_codpl1'
      Size = 7
    end
    object cliOrdcoletaodc_codpl2: TStringField
      FieldName = 'odc_codpl2'
      Size = 7
    end
    object cliOrdcoletaodc_sgcarga: TBooleanField
      FieldName = 'odc_sgcarga'
    end
    object cliOrdcoletaodc_vlrscg: TBCDField
      FieldName = 'odc_vlrscg'
      Precision = 15
      Size = 2
    end
    object cliOrdcoletaodc_sgequip: TBooleanField
      FieldName = 'odc_sgequip'
    end
    object cliOrdcoletaodc_vlreqp: TBCDField
      FieldName = 'odc_vlreqp'
      Precision = 15
      Size = 2
    end
    object cliOrdcoletaodc_nmrctn: TStringField
      FieldName = 'odc_nmrctn'
      Size = 15
    end
    object cliOrdcoletaodc_lctrl01: TStringField
      FieldName = 'odc_lctrl01'
      Size = 15
    end
    object cliOrdcoletaodc_genset01: TStringField
      FieldName = 'odc_genset01'
      Size = 15
    end
    object cliOrdcoletaodc_booking: TStringField
      FieldName = 'odc_booking'
      Size = 15
    end
    object cliOrdcoletaodc_obs: TMemoField
      FieldName = 'odc_obs'
      BlobType = ftMemo
    end
    object cliOrdcoletaodc_usuinc: TStringField
      FieldName = 'odc_usuinc'
      Size = 15
    end
    object cliOrdcoletaodc_datinc: TDateField
      FieldName = 'odc_datinc'
    end
    object cliOrdcoletaodc_horinc: TStringField
      FieldName = 'odc_horinc'
      Size = 8
    end
    object cliOrdcoletaodc_usualt: TStringField
      FieldName = 'odc_usualt'
      Size = 15
    end
    object cliOrdcoletaodc_datalt: TDateField
      FieldName = 'odc_datalt'
    end
    object cliOrdcoletaodc_horalt: TStringField
      FieldName = 'odc_horalt'
      Size = 8
    end
    object cliOrdcoletavat_placa: TStringField
      FieldName = 'vat_placa'
      Size = 7
    end
    object cliOrdcoletavat_nrfrota: TStringField
      FieldName = 'vat_nrfrota'
      Size = 5
    end
    object cliOrdcoletavat_paestversa: TStringField
      FieldName = 'vat_paestversa'
      Size = 5
    end
    object cliOrdcoletavat_chip: TStringField
      FieldName = 'vat_chip'
      Size = 10
    end
    object cliOrdcoletavat_cartao: TStringField
      FieldName = 'vat_cartao'
      Size = 15
    end
    object cliOrdcoletavat_chassi: TStringField
      FieldName = 'vat_chassi'
      Size = 17
    end
    object cliOrdcoletavat_licenc: TStringField
      FieldName = 'vat_licenc'
      Size = 15
    end
    object cliOrdcoletavat_renavan: TStringField
      FieldName = 'vat_renavan'
      Size = 15
    end
    object cliOrdcoletavat_dut: TStringField
      FieldName = 'vat_dut'
      Size = 10
    end
    object cliOrdcoletavat_codltd: TIntegerField
      FieldName = 'vat_codltd'
    end
    object cliOrdcoletavat_codtip: TIntegerField
      FieldName = 'vat_codtip'
    end
    object cliOrdcoletavat_codmdl: TIntegerField
      FieldName = 'vat_codmdl'
    end
    object cliOrdcoletavat_codmrc: TIntegerField
      FieldName = 'vat_codmrc'
    end
    object cliOrdcoletavat_codcor: TIntegerField
      FieldName = 'vat_codcor'
    end
    object cliOrdcoletavat_codcid: TIntegerField
      FieldName = 'vat_codcid'
    end
    object cliOrdcoletavat_codgrm: TIntegerField
      FieldName = 'vat_codgrm'
    end
    object cliOrdcoletavat_cor: TStringField
      FieldName = 'vat_cor'
    end
    object cliOrdcoletavat_status: TStringField
      FieldName = 'vat_status'
      Size = 15
    end
    object cliOrdcoletavat_tanque1: TBCDField
      FieldName = 'vat_tanque1'
      Precision = 7
      Size = 0
    end
    object cliOrdcoletavat_tanque2: TBCDField
      FieldName = 'vat_tanque2'
      Precision = 7
      Size = 0
    end
    object cliOrdcoletavat_tanque3: TBCDField
      FieldName = 'vat_tanque3'
      Precision = 7
      Size = 0
    end
    object cliOrdcoletavat_kmini: TBCDField
      FieldName = 'vat_kmini'
      Precision = 7
      Size = 0
    end
    object cliOrdcoletavat_kmatu: TBCDField
      FieldName = 'vat_kmatu'
      Precision = 7
      Size = 0
    end
    object cliOrdcoletavat_anofbmd: TStringField
      FieldName = 'vat_anofbmd'
      Size = 8
    end
    object cliOrdcoletavat_termo: TStringField
      FieldName = 'vat_termo'
      Size = 8
    end
    object cliOrdcoletavat_tombo: TStringField
      FieldName = 'vat_tombo'
      Size = 10
    end
    object cliOrdcoletavat_estado: TStringField
      FieldName = 'vat_estado'
      Size = 15
    end
    object cliOrdcoletavat_qtdpass: TStringField
      FieldName = 'vat_qtdpass'
      Size = 2
    end
    object cliOrdcoletavat_potenc: TStringField
      FieldName = 'vat_potenc'
      Size = 5
    end
    object cliOrdcoletavat_kgbruto: TBCDField
      FieldName = 'vat_kgbruto'
      Precision = 7
      Size = 0
    end
    object cliOrdcoletavat_kgcarga: TBCDField
      FieldName = 'vat_kgcarga'
      Precision = 7
      Size = 0
    end
    object cliOrdcoletavat_clindad: TStringField
      FieldName = 'vat_clindad'
      Size = 4
    end
    object cliOrdcoletavat_nrmotor: TStringField
      FieldName = 'vat_nrmotor'
      Size = 15
    end
    object cliOrdcoletavat_cavalo: TStringField
      FieldName = 'vat_cavalo'
      Size = 10
    end
    object cliOrdcoletavat_foto: TBlobField
      FieldName = 'vat_foto'
    end
    object cliOrdcoletavat_obs: TMemoField
      FieldName = 'vat_obs'
      BlobType = ftMemo
    end
    object cliOrdcoletavat_vlrcmp: TBCDField
      FieldName = 'vat_vlrcmp'
      Precision = 15
      Size = 2
    end
    object cliOrdcoletavat_datcmp: TDateField
      FieldName = 'vat_datcmp'
    end
    object cliOrdcoletavat_nfecmp: TStringField
      FieldName = 'vat_nfecmp'
      Size = 10
    end
    object cliOrdcoletavat_usuinc: TStringField
      FieldName = 'vat_usuinc'
      Size = 15
    end
    object cliOrdcoletavat_datinc: TDateField
      FieldName = 'vat_datinc'
    end
    object cliOrdcoletavat_horinc: TStringField
      FieldName = 'vat_horinc'
      Size = 8
    end
    object cliOrdcoletavat_usualt: TStringField
      FieldName = 'vat_usualt'
      Size = 15
    end
    object cliOrdcoletavat_datalt: TDateField
      FieldName = 'vat_datalt'
    end
    object cliOrdcoletavat_horalt: TStringField
      FieldName = 'vat_horalt'
      Size = 8
    end
    object cliOrdcoletacli_codigo: TIntegerField
      FieldName = 'cli_codigo'
    end
    object cliOrdcoletacli_tipo: TStringField
      FieldName = 'cli_tipo'
      Size = 10
    end
    object cliOrdcoletacli_ativo: TBooleanField
      FieldName = 'cli_ativo'
    end
    object cliOrdcoletacli_nome: TStringField
      FieldName = 'cli_nome'
      Size = 50
    end
    object cliOrdcoletacli_fantasia: TStringField
      FieldName = 'cli_fantasia'
      Size = 50
    end
    object cliOrdcoletacli_codgcl: TIntegerField
      FieldName = 'cli_codgcl'
    end
    object cliOrdcoletacli_codcgo: TIntegerField
      FieldName = 'cli_codcgo'
    end
    object cliOrdcoletacli_datnas: TDateField
      FieldName = 'cli_datnas'
    end
    object cliOrdcoletacli_diapag: TStringField
      FieldName = 'cli_diapag'
      Size = 2
    end
    object cliOrdcoletacli_ecivil: TStringField
      FieldName = 'cli_ecivil'
      Size = 15
    end
    object cliOrdcoletacli_nompal: TStringField
      FieldName = 'cli_nompal'
      Size = 50
    end
    object cliOrdcoletacli_nommae: TStringField
      FieldName = 'cli_nommae'
      Size = 50
    end
    object cliOrdcoletacli_cpfcnpj: TStringField
      FieldName = 'cli_cpfcnpj'
      Size = 14
    end
    object cliOrdcoletacli_rgiest: TStringField
      FieldName = 'cli_rgiest'
      Size = 15
    end
    object cliOrdcoletacli_imunic: TStringField
      FieldName = 'cli_imunic'
      Size = 15
    end
    object cliOrdcoletacli_rgexped: TStringField
      FieldName = 'cli_rgexped'
    end
    object cliOrdcoletacli_rgdata: TDateField
      FieldName = 'cli_rgdata'
    end
    object cliOrdcoletacli_cep: TStringField
      FieldName = 'cli_cep'
      Size = 8
    end
    object cliOrdcoletacli_endereco: TStringField
      FieldName = 'cli_endereco'
      Size = 50
    end
    object cliOrdcoletacli_complem: TStringField
      FieldName = 'cli_complem'
      Size = 25
    end
    object cliOrdcoletacli_numres: TStringField
      FieldName = 'cli_numres'
      Size = 6
    end
    object cliOrdcoletacli_bairro: TStringField
      FieldName = 'cli_bairro'
      Size = 50
    end
    object cliOrdcoletacli_codcid: TIntegerField
      FieldName = 'cli_codcid'
    end
    object cliOrdcoletacli_cepcob: TStringField
      FieldName = 'cli_cepcob'
      Size = 8
    end
    object cliOrdcoletacli_endcob: TStringField
      FieldName = 'cli_endcob'
      Size = 50
    end
    object cliOrdcoletacli_comcob: TStringField
      FieldName = 'cli_comcob'
      Size = 25
    end
    object cliOrdcoletacli_numcob: TStringField
      FieldName = 'cli_numcob'
      Size = 6
    end
    object cliOrdcoletacli_baicob: TStringField
      FieldName = 'cli_baicob'
      Size = 50
    end
    object cliOrdcoletacli_codcdc: TIntegerField
      FieldName = 'cli_codcdc'
    end
    object cliOrdcoletacli_repend: TBooleanField
      FieldName = 'cli_repend'
    end
    object cliOrdcoletacli_telef01: TStringField
      FieldName = 'cli_telef01'
      Size = 12
    end
    object cliOrdcoletacli_telef02: TStringField
      FieldName = 'cli_telef02'
      Size = 12
    end
    object cliOrdcoletacli_celular: TStringField
      FieldName = 'cli_celular'
      Size = 12
    end
    object cliOrdcoletacli_email: TStringField
      FieldName = 'cli_email'
      Size = 100
    end
    object cliOrdcoletacli_emailsped: TStringField
      FieldName = 'cli_emailsped'
      Size = 100
    end
    object cliOrdcoletacli_status: TStringField
      FieldName = 'cli_status'
      Size = 15
    end
    object cliOrdcoletacli_foto: TBlobField
      FieldName = 'cli_foto'
    end
    object cliOrdcoletacli_obs: TMemoField
      FieldName = 'cli_obs'
      BlobType = ftMemo
    end
    object cliOrdcoletacli_vlrlim: TBCDField
      FieldName = 'cli_vlrlim'
      Precision = 15
      Size = 2
    end
    object cliOrdcoletacli_vlrcre: TBCDField
      FieldName = 'cli_vlrcre'
      Precision = 15
      Size = 2
    end
    object cliOrdcoletacli_datcmp: TDateField
      FieldName = 'cli_datcmp'
    end
    object cliOrdcoletacli_usuinc: TStringField
      FieldName = 'cli_usuinc'
      Size = 15
    end
    object cliOrdcoletacli_datinc: TDateField
      FieldName = 'cli_datinc'
    end
    object cliOrdcoletacli_horinc: TStringField
      FieldName = 'cli_horinc'
      Size = 8
    end
    object cliOrdcoletacli_usualt: TStringField
      FieldName = 'cli_usualt'
      Size = 15
    end
    object cliOrdcoletacli_datalt: TDateField
      FieldName = 'cli_datalt'
    end
    object cliOrdcoletacli_horalt: TStringField
      FieldName = 'cli_horalt'
      Size = 8
    end
    object cliOrdcoletatmc_codigo: TIntegerField
      FieldName = 'tmc_codigo'
    end
    object cliOrdcoletatmc_ativo: TBooleanField
      FieldName = 'tmc_ativo'
    end
    object cliOrdcoletatmc_nome: TStringField
      FieldName = 'tmc_nome'
      Size = 50
    end
    object cliOrdcoletatmc_endereco: TStringField
      FieldName = 'tmc_endereco'
      Size = 35
    end
    object cliOrdcoletatmc_numend: TStringField
      FieldName = 'tmc_numend'
      Size = 5
    end
    object cliOrdcoletatmc_complem: TStringField
      FieldName = 'tmc_complem'
      Size = 25
    end
    object cliOrdcoletatmc_bairro: TStringField
      FieldName = 'tmc_bairro'
      Size = 50
    end
    object cliOrdcoletatmc_cep: TStringField
      FieldName = 'tmc_cep'
      Size = 8
    end
    object cliOrdcoletatmc_codcid: TIntegerField
      FieldName = 'tmc_codcid'
    end
    object cliOrdcoletatmc_telef1: TStringField
      FieldName = 'tmc_telef1'
      Size = 12
    end
    object cliOrdcoletatmc_telef2: TStringField
      FieldName = 'tmc_telef2'
      Size = 12
    end
    object cliOrdcoletatmc_celula: TStringField
      FieldName = 'tmc_celula'
      Size = 12
    end
    object cliOrdcoletatmc_contato: TStringField
      FieldName = 'tmc_contato'
    end
    object cliOrdcoletatmc_obs: TMemoField
      FieldName = 'tmc_obs'
      BlobType = ftMemo
    end
    object cliOrdcoletatmc_usuinc: TStringField
      FieldName = 'tmc_usuinc'
      Size = 15
    end
    object cliOrdcoletatmc_datinc: TDateField
      FieldName = 'tmc_datinc'
    end
    object cliOrdcoletatmc_horinc: TStringField
      FieldName = 'tmc_horinc'
      Size = 8
    end
    object cliOrdcoletatmc_usualt: TStringField
      FieldName = 'tmc_usualt'
      Size = 15
    end
    object cliOrdcoletatmc_datalt: TDateField
      FieldName = 'tmc_datalt'
    end
    object cliOrdcoletatmc_horalt: TStringField
      FieldName = 'tmc_horalt'
      Size = 8
    end
    object cliOrdcoletatmc_codigo_1: TIntegerField
      FieldName = 'tmc_codigo_1'
    end
    object cliOrdcoletatmc_ativo_1: TBooleanField
      FieldName = 'tmc_ativo_1'
    end
    object cliOrdcoletatmc_nome_1: TStringField
      FieldName = 'tmc_nome_1'
      Size = 50
    end
    object cliOrdcoletatmc_endereco_1: TStringField
      FieldName = 'tmc_endereco_1'
      Size = 35
    end
    object cliOrdcoletatmc_numend_1: TStringField
      FieldName = 'tmc_numend_1'
      Size = 5
    end
    object cliOrdcoletatmc_complem_1: TStringField
      FieldName = 'tmc_complem_1'
      Size = 25
    end
    object cliOrdcoletatmc_bairro_1: TStringField
      FieldName = 'tmc_bairro_1'
      Size = 50
    end
    object cliOrdcoletatmc_cep_1: TStringField
      FieldName = 'tmc_cep_1'
      Size = 8
    end
    object cliOrdcoletatmc_codcid_1: TIntegerField
      FieldName = 'tmc_codcid_1'
    end
    object cliOrdcoletatmc_telef1_1: TStringField
      FieldName = 'tmc_telef1_1'
      Size = 12
    end
    object cliOrdcoletatmc_telef2_1: TStringField
      FieldName = 'tmc_telef2_1'
      Size = 12
    end
    object cliOrdcoletatmc_celula_1: TStringField
      FieldName = 'tmc_celula_1'
      Size = 12
    end
    object cliOrdcoletatmc_contato_1: TStringField
      FieldName = 'tmc_contato_1'
    end
    object cliOrdcoletatmc_obs_1: TMemoField
      FieldName = 'tmc_obs_1'
      BlobType = ftMemo
    end
    object cliOrdcoletatmc_usuinc_1: TStringField
      FieldName = 'tmc_usuinc_1'
      Size = 15
    end
    object cliOrdcoletatmc_datinc_1: TDateField
      FieldName = 'tmc_datinc_1'
    end
    object cliOrdcoletatmc_horinc_1: TStringField
      FieldName = 'tmc_horinc_1'
      Size = 8
    end
    object cliOrdcoletatmc_usualt_1: TStringField
      FieldName = 'tmc_usualt_1'
      Size = 15
    end
    object cliOrdcoletatmc_datalt_1: TDateField
      FieldName = 'tmc_datalt_1'
    end
    object cliOrdcoletatmc_horalt_1: TStringField
      FieldName = 'tmc_horalt_1'
      Size = 8
    end
    object cliOrdcoletaocg_codigo: TIntegerField
      FieldName = 'ocg_codigo'
    end
    object cliOrdcoletaocg_nome: TStringField
      FieldName = 'ocg_nome'
      Size = 45
    end
    object cliOrdcoletaocg_usuinc: TStringField
      FieldName = 'ocg_usuinc'
      Size = 15
    end
    object cliOrdcoletaocg_datinc: TDateField
      FieldName = 'ocg_datinc'
    end
    object cliOrdcoletaocg_horinc: TStringField
      FieldName = 'ocg_horinc'
      Size = 8
    end
    object cliOrdcoletaocg_usualt: TStringField
      FieldName = 'ocg_usualt'
      Size = 15
    end
    object cliOrdcoletaocg_datalt: TDateField
      FieldName = 'ocg_datalt'
    end
    object cliOrdcoletaocg_horalt: TStringField
      FieldName = 'ocg_horalt'
      Size = 8
    end
    object cliOrdcoletanav_codigo: TIntegerField
      FieldName = 'nav_codigo'
    end
    object cliOrdcoletanav_nome: TStringField
      FieldName = 'nav_nome'
      Size = 45
    end
    object cliOrdcoletanav_usuinc: TStringField
      FieldName = 'nav_usuinc'
      Size = 15
    end
    object cliOrdcoletanav_datinc: TDateField
      FieldName = 'nav_datinc'
    end
    object cliOrdcoletanav_horinc: TStringField
      FieldName = 'nav_horinc'
      Size = 8
    end
    object cliOrdcoletanav_usualt: TStringField
      FieldName = 'nav_usualt'
      Size = 15
    end
    object cliOrdcoletanav_datalt: TDateField
      FieldName = 'nav_datalt'
    end
    object cliOrdcoletanav_horalt: TStringField
      FieldName = 'nav_horalt'
      Size = 8
    end
    object cliOrdcoletatcn_codigo: TIntegerField
      FieldName = 'tcn_codigo'
    end
    object cliOrdcoletatcn_nome: TStringField
      FieldName = 'tcn_nome'
      Size = 45
    end
    object cliOrdcoletatcn_usuinc: TStringField
      FieldName = 'tcn_usuinc'
      Size = 15
    end
    object cliOrdcoletatcn_datinc: TDateField
      FieldName = 'tcn_datinc'
    end
    object cliOrdcoletatcn_horinc: TStringField
      FieldName = 'tcn_horinc'
      Size = 8
    end
    object cliOrdcoletatcn_usualt: TStringField
      FieldName = 'tcn_usualt'
      Size = 15
    end
    object cliOrdcoletatcn_datalt: TDateField
      FieldName = 'tcn_datalt'
    end
    object cliOrdcoletatcn_horalt: TStringField
      FieldName = 'tcn_horalt'
      Size = 8
    end
    object cliOrdcoletapss_codigo: TIntegerField
      FieldName = 'pss_codigo'
    end
    object cliOrdcoletapss_nome: TStringField
      FieldName = 'pss_nome'
      Size = 50
    end
    object cliOrdcoletapss_apelido: TStringField
      FieldName = 'pss_apelido'
    end
    object cliOrdcoletapss_codcgo: TIntegerField
      FieldName = 'pss_codcgo'
    end
    object cliOrdcoletapss_codltd: TIntegerField
      FieldName = 'pss_codltd'
    end
    object cliOrdcoletapss_datnas: TDateField
      FieldName = 'pss_datnas'
    end
    object cliOrdcoletapss_sexo: TStringField
      FieldName = 'pss_sexo'
      Size = 1
    end
    object cliOrdcoletapss_ecivil: TStringField
      FieldName = 'pss_ecivil'
      Size = 15
    end
    object cliOrdcoletapss_tpsangue: TStringField
      FieldName = 'pss_tpsangue'
      Size = 3
    end
    object cliOrdcoletapss_nompal: TStringField
      FieldName = 'pss_nompal'
      Size = 50
    end
    object cliOrdcoletapss_nommae: TStringField
      FieldName = 'pss_nommae'
      Size = 50
    end
    object cliOrdcoletapss_cpf: TStringField
      FieldName = 'pss_cpf'
      Size = 11
    end
    object cliOrdcoletapss_rg: TStringField
      FieldName = 'pss_rg'
      Size = 15
    end
    object cliOrdcoletapss_rgexped: TStringField
      FieldName = 'pss_rgexped'
    end
    object cliOrdcoletapss_rgdata: TDateField
      FieldName = 'pss_rgdata'
    end
    object cliOrdcoletapss_pispasep: TStringField
      FieldName = 'pss_pispasep'
      Size = 14
    end
    object cliOrdcoletapss_numctps: TStringField
      FieldName = 'pss_numctps'
      Size = 14
    end
    object cliOrdcoletapss_habilitac: TStringField
      FieldName = 'pss_habilitac'
      Size = 11
    end
    object cliOrdcoletapss_hbemite: TDateField
      FieldName = 'pss_hbemite'
    end
    object cliOrdcoletapss_hbvalid: TDateField
      FieldName = 'pss_hbvalid'
    end
    object cliOrdcoletapss_hbcateg: TStringField
      FieldName = 'pss_hbcateg'
      Size = 4
    end
    object cliOrdcoletapss_nrtitulo: TStringField
      FieldName = 'pss_nrtitulo'
      Size = 14
    end
    object cliOrdcoletapss_nrreserv: TStringField
      FieldName = 'pss_nrreserv'
      Size = 14
    end
    object cliOrdcoletapss_cep: TStringField
      FieldName = 'pss_cep'
      Size = 8
    end
    object cliOrdcoletapss_endereco: TStringField
      FieldName = 'pss_endereco'
      Size = 50
    end
    object cliOrdcoletapss_complem: TStringField
      FieldName = 'pss_complem'
      Size = 25
    end
    object cliOrdcoletapss_numres: TStringField
      FieldName = 'pss_numres'
      Size = 6
    end
    object cliOrdcoletapss_bairro: TStringField
      FieldName = 'pss_bairro'
      Size = 50
    end
    object cliOrdcoletapss_codcid: TIntegerField
      FieldName = 'pss_codcid'
    end
    object cliOrdcoletapss_tpimove: TStringField
      FieldName = 'pss_tpimove'
      Size = 15
    end
    object cliOrdcoletapss_tpresid: TStringField
      FieldName = 'pss_tpresid'
      Size = 15
    end
    object cliOrdcoletapss_telef01: TStringField
      FieldName = 'pss_telef01'
      Size = 12
    end
    object cliOrdcoletapss_telef02: TStringField
      FieldName = 'pss_telef02'
      Size = 12
    end
    object cliOrdcoletapss_celular: TStringField
      FieldName = 'pss_celular'
      Size = 12
    end
    object cliOrdcoletapss_email: TStringField
      FieldName = 'pss_email'
      Size = 100
    end
    object cliOrdcoletapss_status: TStringField
      FieldName = 'pss_status'
      Size = 15
    end
    object cliOrdcoletapss_foto: TBlobField
      FieldName = 'pss_foto'
    end
    object cliOrdcoletapss_obs: TMemoField
      FieldName = 'pss_obs'
      BlobType = ftMemo
    end
    object cliOrdcoletapss_vlrrenda: TBCDField
      FieldName = 'pss_vlrrenda'
      Precision = 15
      Size = 2
    end
    object cliOrdcoletapss_vlrvale: TBCDField
      FieldName = 'pss_vlrvale'
      Precision = 15
      Size = 2
    end
    object cliOrdcoletapss_datcmp: TDateField
      FieldName = 'pss_datcmp'
    end
    object cliOrdcoletapss_nfecmp: TStringField
      FieldName = 'pss_nfecmp'
      Size = 10
    end
    object cliOrdcoletapss_codpcv: TStringField
      FieldName = 'pss_codpcv'
      Size = 10
    end
    object cliOrdcoletapss_codpcr: TStringField
      FieldName = 'pss_codpcr'
      Size = 10
    end
    object cliOrdcoletapss_usuinc: TStringField
      FieldName = 'pss_usuinc'
      Size = 15
    end
    object cliOrdcoletapss_datinc: TDateField
      FieldName = 'pss_datinc'
    end
    object cliOrdcoletapss_horinc: TStringField
      FieldName = 'pss_horinc'
      Size = 8
    end
    object cliOrdcoletapss_usualt: TStringField
      FieldName = 'pss_usualt'
      Size = 15
    end
    object cliOrdcoletapss_datalt: TDateField
      FieldName = 'pss_datalt'
    end
    object cliOrdcoletapss_horalt: TStringField
      FieldName = 'pss_horalt'
      Size = 8
    end
  end
  object dsOrdcoleta: TDataSource
    DataSet = cliOrdcoleta
    Left = 1550
    Top = 648
  end
  object dspordcoletatbr: TDataSetProvider
    DataSet = sqlordcoletatbr
    UpdateMode = upWhereKeyOnly
    Left = 1398
    Top = 698
  end
  object cliordcoletatbr: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspordcoletatbr'
    Left = 1478
    Top = 698
    object cliordcoletatbrorc_codigo: TIntegerField
      FieldName = 'orc_codigo'
    end
    object cliordcoletatbrorc_cododc: TIntegerField
      FieldName = 'orc_cododc'
    end
    object cliordcoletatbrorc_codtbr: TIntegerField
      FieldName = 'orc_codtbr'
    end
    object cliordcoletatbrorc_vlrrec: TBCDField
      FieldName = 'orc_vlrrec'
      Precision = 15
      Size = 2
    end
    object cliordcoletatbrorc_usuinc: TStringField
      FieldName = 'orc_usuinc'
      Size = 15
    end
    object cliordcoletatbrorc_datinc: TDateField
      FieldName = 'orc_datinc'
    end
    object cliordcoletatbrorc_horinc: TStringField
      FieldName = 'orc_horinc'
      Size = 8
    end
    object cliordcoletatbrorc_usualt: TStringField
      FieldName = 'orc_usualt'
      Size = 15
    end
    object cliordcoletatbrorc_datalt: TDateField
      FieldName = 'orc_datalt'
    end
    object cliordcoletatbrorc_horalt: TStringField
      FieldName = 'orc_horalt'
      Size = 8
    end
    object cliordcoletatbrtbr_codigo: TIntegerField
      FieldName = 'tbr_codigo'
    end
    object cliordcoletatbrtbr_nome: TStringField
      FieldName = 'tbr_nome'
      Size = 25
    end
    object cliordcoletatbrtbr_codpct: TStringField
      FieldName = 'tbr_codpct'
      Size = 10
    end
    object cliordcoletatbrtbr_vlrrec: TBCDField
      FieldName = 'tbr_vlrrec'
      Precision = 15
      Size = 2
    end
    object cliordcoletatbrtbr_usuinc: TStringField
      FieldName = 'tbr_usuinc'
      Size = 15
    end
    object cliordcoletatbrtbr_datinc: TDateField
      FieldName = 'tbr_datinc'
    end
    object cliordcoletatbrtbr_horinc: TStringField
      FieldName = 'tbr_horinc'
      Size = 8
    end
    object cliordcoletatbrtbr_usualt: TStringField
      FieldName = 'tbr_usualt'
      Size = 15
    end
    object cliordcoletatbrtbr_datalt: TDateField
      FieldName = 'tbr_datalt'
    end
    object cliordcoletatbrtbr_horalt: TStringField
      FieldName = 'tbr_horalt'
      Size = 8
    end
  end
  object dsordcoletatbr: TDataSource
    DataSet = cliordcoletatbr
    Left = 1550
    Top = 698
  end
  object dspordcoletatrt: TDataSetProvider
    DataSet = sqlordcoletatrt
    UpdateMode = upWhereKeyOnly
    Left = 1398
    Top = 754
  end
  object cliordcoletatrt: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspordcoletatrt'
    Left = 1478
    Top = 754
    object cliordcoletatrtotr_codigo: TIntegerField
      FieldName = 'otr_codigo'
    end
    object cliordcoletatrtotr_cododc: TIntegerField
      FieldName = 'otr_cododc'
    end
    object cliordcoletatrtotr_codrto: TIntegerField
      FieldName = 'otr_codrto'
    end
    object cliordcoletatrtotr_vlrrot: TBCDField
      FieldName = 'otr_vlrrot'
      Precision = 15
      Size = 2
    end
    object cliordcoletatrtotr_qtdrot: TBCDField
      FieldName = 'otr_qtdrot'
      Precision = 15
      Size = 0
    end
    object cliordcoletatrtotr_usuinc: TStringField
      FieldName = 'otr_usuinc'
      Size = 15
    end
    object cliordcoletatrtotr_datinc: TDateField
      FieldName = 'otr_datinc'
    end
    object cliordcoletatrtotr_horinc: TStringField
      FieldName = 'otr_horinc'
      Size = 8
    end
    object cliordcoletatrtotr_usualt: TStringField
      FieldName = 'otr_usualt'
      Size = 15
    end
    object cliordcoletatrtotr_datalt: TDateField
      FieldName = 'otr_datalt'
    end
    object cliordcoletatrtotr_horalt: TStringField
      FieldName = 'otr_horalt'
      Size = 8
    end
    object cliordcoletatrtrto_codigo: TIntegerField
      FieldName = 'rto_codigo'
    end
    object cliordcoletatrtrto_nome: TStringField
      FieldName = 'rto_nome'
      Size = 50
    end
    object cliordcoletatrtrto_vlrrot: TBCDField
      FieldName = 'rto_vlrrot'
      Precision = 15
      Size = 2
    end
    object cliordcoletatrtrto_vlrcre: TBCDField
      FieldName = 'rto_vlrcre'
      Precision = 15
      Size = 2
    end
    object cliordcoletatrtrto_vlrcms: TBCDField
      FieldName = 'rto_vlrcms'
      Precision = 15
      Size = 2
    end
    object cliordcoletatrtrto_codpct: TStringField
      FieldName = 'rto_codpct'
      Size = 10
    end
    object cliordcoletatrtrto_usuinc: TStringField
      FieldName = 'rto_usuinc'
      Size = 15
    end
    object cliordcoletatrtrto_datinc: TDateField
      FieldName = 'rto_datinc'
    end
    object cliordcoletatrtrto_horinc: TStringField
      FieldName = 'rto_horinc'
      Size = 8
    end
    object cliordcoletatrtrto_usualt: TStringField
      FieldName = 'rto_usualt'
      Size = 15
    end
    object cliordcoletatrtrto_datalt: TDateField
      FieldName = 'rto_datalt'
    end
    object cliordcoletatrtrto_horalt: TStringField
      FieldName = 'rto_horalt'
      Size = 8
    end
    object cliordcoletatrttotal: TFMTBCDField
      FieldName = 'total'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
  end
  object dsordcoletatrt: TDataSource
    DataSet = cliordcoletatrt
    Left = 1550
    Top = 754
  end
  object sqlcompracmb: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * From "99999999999999_TESTE".compracmb'
      
        'LEFT Join "99999999999999_TESTE".fornecedor on fnd_codigo = cpc_' +
        'codfnd ')
    Left = 1320
    Top = 160
    object sqlcompracmbcpc_codigo: TIntegerField
      FieldName = 'cpc_codigo'
      Origin = 'cpc_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlcompracmbcpc_numnfe: TStringField
      FieldName = 'cpc_numnfe'
      Origin = 'cpc_numnfe'
      Size = 10
    end
    object sqlcompracmbcpc_sernfe: TStringField
      FieldName = 'cpc_sernfe'
      Origin = 'cpc_sernfe'
      Size = 5
    end
    object sqlcompracmbcpc_chelet: TStringField
      FieldName = 'cpc_chelet'
      Origin = 'cpc_chelet'
      Size = 44
    end
    object sqlcompracmbcpc_datems: TDateField
      FieldName = 'cpc_datems'
      Origin = 'cpc_datems'
    end
    object sqlcompracmbcpc_datent: TDateField
      FieldName = 'cpc_datent'
      Origin = 'cpc_datent'
    end
    object sqlcompracmbcpc_codfnd: TIntegerField
      FieldName = 'cpc_codfnd'
      Origin = 'cpc_codfnd'
    end
    object sqlcompracmbcpc_codpab: TIntegerField
      FieldName = 'cpc_codpab'
      Origin = 'cpc_codpab'
    end
    object sqlcompracmbcpc_codfpg: TIntegerField
      FieldName = 'cpc_codfpg'
      Origin = 'cpc_codfpg'
    end
    object sqlcompracmbcpc_fatura: TBooleanField
      FieldName = 'cpc_fatura'
      Origin = 'cpc_fatura'
    end
    object sqlcompracmbcpc_vlrfrt: TBCDField
      FieldName = 'cpc_vlrfrt'
      Origin = 'cpc_vlrfrt'
      Precision = 15
      Size = 2
    end
    object sqlcompracmbcpc_vlrfac: TBCDField
      FieldName = 'cpc_vlrfac'
      Origin = 'cpc_vlrfac'
      Precision = 15
      Size = 2
    end
    object sqlcompracmbcpc_vlrseg: TBCDField
      FieldName = 'cpc_vlrseg'
      Origin = 'cpc_vlrseg'
      Precision = 15
      Size = 2
    end
    object sqlcompracmbcpc_qtdpct: TIntegerField
      FieldName = 'cpc_qtdpct'
      Origin = 'cpc_qtdpct'
    end
    object sqlcompracmbcpc_parcel: TStringField
      FieldName = 'cpc_parcel'
      Origin = 'cpc_parcel'
      Size = 4
    end
    object sqlcompracmbcpc_usuinc: TStringField
      FieldName = 'cpc_usuinc'
      Origin = 'cpc_usuinc'
      Size = 15
    end
    object sqlcompracmbcpc_datinc: TDateField
      FieldName = 'cpc_datinc'
      Origin = 'cpc_datinc'
    end
    object sqlcompracmbcpc_horinc: TStringField
      FieldName = 'cpc_horinc'
      Origin = 'cpc_horinc'
      Size = 8
    end
    object sqlcompracmbcpc_usualt: TStringField
      FieldName = 'cpc_usualt'
      Origin = 'cpc_usualt'
      Size = 15
    end
    object sqlcompracmbcpc_datalt: TDateField
      FieldName = 'cpc_datalt'
      Origin = 'cpc_datalt'
    end
    object sqlcompracmbcpc_horalt: TStringField
      FieldName = 'cpc_horalt'
      Origin = 'cpc_horalt'
      Size = 8
    end
    object sqlcompracmbfnd_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_codigo'
      Origin = 'fnd_codigo'
    end
    object sqlcompracmbfnd_ativo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_ativo'
      Origin = 'fnd_ativo'
      Size = 3
    end
    object sqlcompracmbfnd_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_nome'
      Origin = 'fnd_nome'
      Size = 50
    end
    object sqlcompracmbfnd_rsocial: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_rsocial'
      Origin = 'fnd_rsocial'
      Size = 50
    end
    object sqlcompracmbfnd_tipopes: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_tipopes'
      Origin = 'fnd_tipopes'
      Size = 8
    end
    object sqlcompracmbfnd_cpfcnpj: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_cpfcnpj'
      Origin = 'fnd_cpfcnpj'
      Size = 14
    end
    object sqlcompracmbfnd_codpct: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_codpct'
      Origin = 'fnd_codpct'
      Size = 10
    end
    object sqlcompracmbfnd_endereco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_endereco'
      Origin = 'fnd_endereco'
      Size = 35
    end
    object sqlcompracmbfnd_numend: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_numend'
      Origin = 'fnd_numend'
      Size = 5
    end
    object sqlcompracmbfnd_complem: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_complem'
      Origin = 'fnd_complem'
      Size = 25
    end
    object sqlcompracmbfnd_bairro: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_bairro'
      Origin = 'fnd_bairro'
      Size = 50
    end
    object sqlcompracmbfnd_cep: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_cep'
      Origin = 'fnd_cep'
      Size = 8
    end
    object sqlcompracmbfnd_codcid: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_codcid'
      Origin = 'fnd_codcid'
    end
    object sqlcompracmbfnd_telef1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_telef1'
      Origin = 'fnd_telef1'
      Size = 12
    end
    object sqlcompracmbfnd_telef2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_telef2'
      Origin = 'fnd_telef2'
      Size = 12
    end
    object sqlcompracmbfnd_celula: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_celula'
      Origin = 'fnd_celula'
      Size = 12
    end
    object sqlcompracmbfnd_obs: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_obs'
      Origin = 'fnd_obs'
      BlobType = ftMemo
    end
    object sqlcompracmbfnd_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_usuinc'
      Origin = 'fnd_usuinc'
      Size = 15
    end
    object sqlcompracmbfnd_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_datinc'
      Origin = 'fnd_datinc'
    end
    object sqlcompracmbfnd_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_horinc'
      Origin = 'fnd_horinc'
      Size = 8
    end
    object sqlcompracmbfnd_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_usualt'
      Origin = 'fnd_usualt'
      Size = 15
    end
    object sqlcompracmbfnd_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_datalt'
      Origin = 'fnd_datalt'
    end
    object sqlcompracmbfnd_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_horalt'
      Origin = 'fnd_horalt'
      Size = 8
    end
  end
  object sqlAbastece: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      
        'Select *, ( abt_vlrlts * abt_ltsabt  ) as Total From "9999999999' +
        '9999_TESTE".abastece'
      'LEFT Join "dbconfig".combustivel on cmb_codigo = abt_codcmb'
      
        'LEFT Join "99999999999999_TESTE".veiculoatv on vat_placa = abt_c' +
        'odplc'
      'LEFT Join "dbconfig".modelo on mdl_codigo = vat_codmdl'
      
        'LEFT Join "99999999999999_TESTE".pessoal on pss_codigo = abt_cod' +
        'pss'
      
        'LEFT Join "99999999999999_TESTE".bomba on bmb_codigo = abt_codbm' +
        'b')
    Left = 1320
    Top = 208
    object sqlAbasteceabt_codigo: TIntegerField
      FieldName = 'abt_codigo'
      Origin = 'abt_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlAbasteceabt_codplc: TStringField
      FieldName = 'abt_codplc'
      Origin = 'abt_codplc'
      Size = 7
    end
    object sqlAbasteceabt_codcmb: TIntegerField
      FieldName = 'abt_codcmb'
      Origin = 'abt_codcmb'
    end
    object sqlAbasteceabt_codbmb: TIntegerField
      FieldName = 'abt_codbmb'
      Origin = 'abt_codbmb'
    end
    object sqlAbasteceabt_codpss: TIntegerField
      FieldName = 'abt_codpss'
      Origin = 'abt_codpss'
    end
    object sqlAbasteceabt_codict: TIntegerField
      FieldName = 'abt_codict'
      Origin = 'abt_codict'
    end
    object sqlAbasteceabt_codpab: TIntegerField
      FieldName = 'abt_codpab'
      Origin = 'abt_codpab'
    end
    object sqlAbasteceabt_requis: TStringField
      FieldName = 'abt_requis'
      Origin = 'abt_requis'
      Size = 7
    end
    object sqlAbasteceabt_local: TStringField
      FieldName = 'abt_local'
      Origin = 'abt_local'
      Size = 5
    end
    object sqlAbasteceabt_ltsaut: TBCDField
      FieldName = 'abt_ltsaut'
      Origin = 'abt_ltsaut'
      Precision = 15
      Size = 3
    end
    object sqlAbasteceabt_ltsabt: TBCDField
      FieldName = 'abt_ltsabt'
      Origin = 'abt_ltsabt'
      Precision = 15
      Size = 3
    end
    object sqlAbasteceabt_vlrlts: TBCDField
      FieldName = 'abt_vlrlts'
      Origin = 'abt_vlrlts'
      Precision = 15
    end
    object sqlAbasteceabt_dataut: TDateField
      FieldName = 'abt_dataut'
      Origin = 'abt_dataut'
    end
    object sqlAbasteceabt_horaut: TStringField
      FieldName = 'abt_horaut'
      Origin = 'abt_horaut'
      Size = 4
    end
    object sqlAbasteceabt_datrea: TDateField
      FieldName = 'abt_datrea'
      Origin = 'abt_datrea'
    end
    object sqlAbasteceabt_horrea: TStringField
      FieldName = 'abt_horrea'
      Origin = 'abt_horrea'
      Size = 4
    end
    object sqlAbasteceabt_kmaba: TBCDField
      FieldName = 'abt_kmaba'
      Origin = 'abt_kmaba'
      Precision = 7
      Size = 0
    end
    object sqlAbasteceabt_usuinc: TStringField
      FieldName = 'abt_usuinc'
      Origin = 'abt_usuinc'
      Size = 15
    end
    object sqlAbasteceabt_datinc: TDateField
      FieldName = 'abt_datinc'
      Origin = 'abt_datinc'
    end
    object sqlAbasteceabt_horinc: TStringField
      FieldName = 'abt_horinc'
      Origin = 'abt_horinc'
      Size = 8
    end
    object sqlAbasteceabt_usualt: TStringField
      FieldName = 'abt_usualt'
      Origin = 'abt_usualt'
      Size = 15
    end
    object sqlAbasteceabt_datalt: TDateField
      FieldName = 'abt_datalt'
      Origin = 'abt_datalt'
    end
    object sqlAbasteceabt_horalt: TStringField
      FieldName = 'abt_horalt'
      Origin = 'abt_horalt'
      Size = 8
    end
    object sqlAbastececmb_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cmb_codigo'
      Origin = 'cmb_codigo'
    end
    object sqlAbastececmb_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cmb_nome'
      Origin = 'cmb_nome'
    end
    object sqlAbastececmb_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cmb_usuinc'
      Origin = 'cmb_usuinc'
      Size = 15
    end
    object sqlAbastececmb_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cmb_datinc'
      Origin = 'cmb_datinc'
    end
    object sqlAbastececmb_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cmb_horinc'
      Origin = 'cmb_horinc'
      Size = 8
    end
    object sqlAbastececmb_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cmb_usualt'
      Origin = 'cmb_usualt'
      Size = 15
    end
    object sqlAbastececmb_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cmb_datalt'
      Origin = 'cmb_datalt'
    end
    object sqlAbastececmb_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cmb_horalt'
      Origin = 'cmb_horalt'
      Size = 8
    end
    object sqlAbastecevat_placa: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_placa'
      Origin = 'vat_placa'
      Size = 7
    end
    object sqlAbastecevat_nrfrota: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_nrfrota'
      Origin = 'vat_nrfrota'
      Size = 5
    end
    object sqlAbastecevat_paestversa: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_paestversa'
      Origin = 'vat_paestversa'
      Size = 5
    end
    object sqlAbastecevat_chip: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_chip'
      Origin = 'vat_chip'
      Size = 10
    end
    object sqlAbastecevat_cartao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_cartao'
      Origin = 'vat_cartao'
      Size = 15
    end
    object sqlAbastecevat_chassi: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_chassi'
      Origin = 'vat_chassi'
      Size = 17
    end
    object sqlAbastecevat_licenc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_licenc'
      Origin = 'vat_licenc'
      Size = 15
    end
    object sqlAbastecevat_renavan: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_renavan'
      Origin = 'vat_renavan'
      Size = 15
    end
    object sqlAbastecevat_dut: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_dut'
      Origin = 'vat_dut'
      Size = 10
    end
    object sqlAbastecevat_codltd: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codltd'
      Origin = 'vat_codltd'
    end
    object sqlAbastecevat_codtip: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codtip'
      Origin = 'vat_codtip'
    end
    object sqlAbastecevat_codmdl: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codmdl'
      Origin = 'vat_codmdl'
    end
    object sqlAbastecevat_codmrc: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codmrc'
      Origin = 'vat_codmrc'
    end
    object sqlAbastecevat_codcor: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codcor'
      Origin = 'vat_codcor'
    end
    object sqlAbastecevat_codcid: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codcid'
      Origin = 'vat_codcid'
    end
    object sqlAbastecevat_codgrm: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codgrm'
      Origin = 'vat_codgrm'
    end
    object sqlAbastecevat_cor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_cor'
      Origin = 'vat_cor'
    end
    object sqlAbastecevat_status: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_status'
      Origin = 'vat_status'
      Size = 15
    end
    object sqlAbastecevat_tanque1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_tanque1'
      Origin = 'vat_tanque1'
      Precision = 7
      Size = 0
    end
    object sqlAbastecevat_tanque2: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_tanque2'
      Origin = 'vat_tanque2'
      Precision = 7
      Size = 0
    end
    object sqlAbastecevat_tanque3: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_tanque3'
      Origin = 'vat_tanque3'
      Precision = 7
      Size = 0
    end
    object sqlAbastecevat_kmini: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_kmini'
      Origin = 'vat_kmini'
      Precision = 7
      Size = 0
    end
    object sqlAbastecevat_kmatu: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_kmatu'
      Origin = 'vat_kmatu'
      Precision = 7
      Size = 0
    end
    object sqlAbastecevat_anofbmd: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_anofbmd'
      Origin = 'vat_anofbmd'
      Size = 8
    end
    object sqlAbastecevat_termo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_termo'
      Origin = 'vat_termo'
      Size = 8
    end
    object sqlAbastecevat_tombo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_tombo'
      Origin = 'vat_tombo'
      Size = 10
    end
    object sqlAbastecevat_estado: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_estado'
      Origin = 'vat_estado'
      Size = 15
    end
    object sqlAbastecevat_qtdpass: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_qtdpass'
      Origin = 'vat_qtdpass'
      Size = 2
    end
    object sqlAbastecevat_potenc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_potenc'
      Origin = 'vat_potenc'
      Size = 5
    end
    object sqlAbastecevat_kgbruto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_kgbruto'
      Origin = 'vat_kgbruto'
      Precision = 7
      Size = 0
    end
    object sqlAbastecevat_kgcarga: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_kgcarga'
      Origin = 'vat_kgcarga'
      Precision = 7
      Size = 0
    end
    object sqlAbastecevat_clindad: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_clindad'
      Origin = 'vat_clindad'
      Size = 4
    end
    object sqlAbastecevat_nrmotor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_nrmotor'
      Origin = 'vat_nrmotor'
      Size = 15
    end
    object sqlAbastecevat_cavalo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_cavalo'
      Origin = 'vat_cavalo'
      Size = 10
    end
    object sqlAbastecevat_foto: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'vat_foto'
      Origin = 'vat_foto'
    end
    object sqlAbastecevat_obs: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'vat_obs'
      Origin = 'vat_obs'
      BlobType = ftMemo
    end
    object sqlAbastecevat_vlrcmp: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_vlrcmp'
      Origin = 'vat_vlrcmp'
      Precision = 15
      Size = 2
    end
    object sqlAbastecevat_datcmp: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'vat_datcmp'
      Origin = 'vat_datcmp'
    end
    object sqlAbastecevat_nfecmp: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_nfecmp'
      Origin = 'vat_nfecmp'
      Size = 10
    end
    object sqlAbastecevat_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_usuinc'
      Origin = 'vat_usuinc'
      Size = 15
    end
    object sqlAbastecevat_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'vat_datinc'
      Origin = 'vat_datinc'
    end
    object sqlAbastecevat_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_horinc'
      Origin = 'vat_horinc'
      Size = 8
    end
    object sqlAbastecevat_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_usualt'
      Origin = 'vat_usualt'
      Size = 15
    end
    object sqlAbastecevat_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'vat_datalt'
      Origin = 'vat_datalt'
    end
    object sqlAbastecevat_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_horalt'
      Origin = 'vat_horalt'
      Size = 8
    end
    object sqlAbastecemdl_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_codigo'
      Origin = 'mdl_codigo'
    end
    object sqlAbastecemdl_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_nome'
      Origin = 'mdl_nome'
      Size = 25
    end
    object sqlAbastecemdl_codfip: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_codfip'
      Origin = 'mdl_codfip'
      Size = 10
    end
    object sqlAbastecemdl_codmrc: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_codmrc'
      Origin = 'mdl_codmrc'
    end
    object sqlAbastecemdl_codgrm: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_codgrm'
      Origin = 'mdl_codgrm'
    end
    object sqlAbastecemdl_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_usuinc'
      Origin = 'mdl_usuinc'
      Size = 15
    end
    object sqlAbastecemdl_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_datinc'
      Origin = 'mdl_datinc'
    end
    object sqlAbastecemdl_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_horinc'
      Origin = 'mdl_horinc'
      Size = 8
    end
    object sqlAbastecemdl_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_usualt'
      Origin = 'mdl_usualt'
      Size = 15
    end
    object sqlAbastecemdl_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_datalt'
      Origin = 'mdl_datalt'
    end
    object sqlAbastecemdl_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_horalt'
      Origin = 'mdl_horalt'
      Size = 8
    end
    object sqlAbastecepss_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'pss_codigo'
      Origin = 'pss_codigo'
    end
    object sqlAbastecepss_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_nome'
      Origin = 'pss_nome'
      Size = 50
    end
    object sqlAbastecepss_apelido: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_apelido'
      Origin = 'pss_apelido'
    end
    object sqlAbastecepss_codcgo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'pss_codcgo'
      Origin = 'pss_codcgo'
    end
    object sqlAbastecepss_codltd: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'pss_codltd'
      Origin = 'pss_codltd'
    end
    object sqlAbastecepss_datnas: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pss_datnas'
      Origin = 'pss_datnas'
    end
    object sqlAbastecepss_sexo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_sexo'
      Origin = 'pss_sexo'
      Size = 1
    end
    object sqlAbastecepss_ecivil: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_ecivil'
      Origin = 'pss_ecivil'
      Size = 15
    end
    object sqlAbastecepss_tpsangue: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_tpsangue'
      Origin = 'pss_tpsangue'
      Size = 3
    end
    object sqlAbastecepss_nompal: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_nompal'
      Origin = 'pss_nompal'
      Size = 50
    end
    object sqlAbastecepss_nommae: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_nommae'
      Origin = 'pss_nommae'
      Size = 50
    end
    object sqlAbastecepss_cpf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_cpf'
      Origin = 'pss_cpf'
      Size = 11
    end
    object sqlAbastecepss_rg: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_rg'
      Origin = 'pss_rg'
      Size = 15
    end
    object sqlAbastecepss_rgexped: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_rgexped'
      Origin = 'pss_rgexped'
    end
    object sqlAbastecepss_rgdata: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pss_rgdata'
      Origin = 'pss_rgdata'
    end
    object sqlAbastecepss_pispasep: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_pispasep'
      Origin = 'pss_pispasep'
      Size = 14
    end
    object sqlAbastecepss_numctps: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_numctps'
      Origin = 'pss_numctps'
      Size = 14
    end
    object sqlAbastecepss_habilitac: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_habilitac'
      Origin = 'pss_habilitac'
      Size = 11
    end
    object sqlAbastecepss_hbemite: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pss_hbemite'
      Origin = 'pss_hbemite'
    end
    object sqlAbastecepss_hbvalid: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pss_hbvalid'
      Origin = 'pss_hbvalid'
    end
    object sqlAbastecepss_hbcateg: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_hbcateg'
      Origin = 'pss_hbcateg'
      Size = 4
    end
    object sqlAbastecepss_nrtitulo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_nrtitulo'
      Origin = 'pss_nrtitulo'
      Size = 14
    end
    object sqlAbastecepss_nrreserv: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_nrreserv'
      Origin = 'pss_nrreserv'
      Size = 14
    end
    object sqlAbastecepss_cep: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_cep'
      Origin = 'pss_cep'
      Size = 8
    end
    object sqlAbastecepss_endereco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_endereco'
      Origin = 'pss_endereco'
      Size = 50
    end
    object sqlAbastecepss_complem: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_complem'
      Origin = 'pss_complem'
      Size = 25
    end
    object sqlAbastecepss_numres: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_numres'
      Origin = 'pss_numres'
      Size = 6
    end
    object sqlAbastecepss_bairro: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_bairro'
      Origin = 'pss_bairro'
      Size = 50
    end
    object sqlAbastecepss_codcid: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'pss_codcid'
      Origin = 'pss_codcid'
    end
    object sqlAbastecepss_tpimove: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_tpimove'
      Origin = 'pss_tpimove'
      Size = 15
    end
    object sqlAbastecepss_tpresid: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_tpresid'
      Origin = 'pss_tpresid'
      Size = 15
    end
    object sqlAbastecepss_telef01: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_telef01'
      Origin = 'pss_telef01'
      Size = 12
    end
    object sqlAbastecepss_telef02: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_telef02'
      Origin = 'pss_telef02'
      Size = 12
    end
    object sqlAbastecepss_celular: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_celular'
      Origin = 'pss_celular'
      Size = 12
    end
    object sqlAbastecepss_email: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_email'
      Origin = 'pss_email'
      Size = 100
    end
    object sqlAbastecepss_status: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_status'
      Origin = 'pss_status'
      Size = 15
    end
    object sqlAbastecepss_foto: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'pss_foto'
      Origin = 'pss_foto'
    end
    object sqlAbastecepss_obs: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'pss_obs'
      Origin = 'pss_obs'
      BlobType = ftMemo
    end
    object sqlAbastecepss_vlrrenda: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'pss_vlrrenda'
      Origin = 'pss_vlrrenda'
      Precision = 15
      Size = 2
    end
    object sqlAbastecepss_vlrvale: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'pss_vlrvale'
      Origin = 'pss_vlrvale'
      Precision = 15
      Size = 2
    end
    object sqlAbastecepss_datcmp: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pss_datcmp'
      Origin = 'pss_datcmp'
    end
    object sqlAbastecepss_nfecmp: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_nfecmp'
      Origin = 'pss_nfecmp'
      Size = 10
    end
    object sqlAbastecepss_codpcv: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_codpcv'
      Origin = 'pss_codpcv'
      Size = 10
    end
    object sqlAbastecepss_codpcr: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_codpcr'
      Origin = 'pss_codpcr'
      Size = 10
    end
    object sqlAbastecepss_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_usuinc'
      Origin = 'pss_usuinc'
      Size = 15
    end
    object sqlAbastecepss_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pss_datinc'
      Origin = 'pss_datinc'
    end
    object sqlAbastecepss_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_horinc'
      Origin = 'pss_horinc'
      Size = 8
    end
    object sqlAbastecepss_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_usualt'
      Origin = 'pss_usualt'
      Size = 15
    end
    object sqlAbastecepss_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pss_datalt'
      Origin = 'pss_datalt'
    end
    object sqlAbastecepss_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_horalt'
      Origin = 'pss_horalt'
      Size = 8
    end
    object sqlAbastecebmb_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'bmb_codigo'
      Origin = 'bmb_codigo'
    end
    object sqlAbastecebmb_codtnq: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'bmb_codtnq'
      Origin = 'bmb_codtnq'
    end
    object sqlAbastecebmb_codcmb: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'bmb_codcmb'
      Origin = 'bmb_codcmb'
    end
    object sqlAbastecebmb_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bmb_nome'
      Origin = 'bmb_nome'
      Size = 25
    end
    object sqlAbastecebmb_nmrinc: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'bmb_nmrinc'
      Origin = 'bmb_nmrinc'
      Precision = 7
      Size = 0
    end
    object sqlAbastecebmb_ativo: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'bmb_ativo'
      Origin = 'bmb_ativo'
    end
    object sqlAbastecebmb_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bmb_usuinc'
      Origin = 'bmb_usuinc'
      Size = 15
    end
    object sqlAbastecebmb_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'bmb_datinc'
      Origin = 'bmb_datinc'
    end
    object sqlAbastecebmb_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bmb_horinc'
      Origin = 'bmb_horinc'
      Size = 8
    end
    object sqlAbastecebmb_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bmb_usualt'
      Origin = 'bmb_usualt'
      Size = 15
    end
    object sqlAbastecebmb_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'bmb_datalt'
      Origin = 'bmb_datalt'
    end
    object sqlAbastecebmb_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bmb_horalt'
      Origin = 'bmb_horalt'
      Size = 8
    end
    object sqlAbastecetotal: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'total'
      Origin = 'total'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
  end
  object sqlMulta: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * From "99999999999999_TESTE".multa'
      'LEFT Join "dbconfig".cidade on cid_codigo = mlt_codcid'
      
        'LEFT Join "99999999999999_TESTE".veiculoatv on vat_placa = mlt_c' +
        'odplc'
      'LEFT Join "dbconfig".tabmulta on tmt_codigo = mlt_codtmt'
      'LEFT Join "dbconfig".orgtrans on ogt_codigo = mlt_codogt'
      
        'LEFT Join "99999999999999_TESTE".pessoal on pss_codigo = mlt_cod' +
        'pss')
    Left = 1320
    Top = 264
    object sqlMultamlt_codigo: TIntegerField
      FieldName = 'mlt_codigo'
      Origin = 'mlt_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlMultamlt_datems: TDateField
      FieldName = 'mlt_datems'
      Origin = 'mlt_datems'
    end
    object sqlMultamlt_boleto: TStringField
      FieldName = 'mlt_boleto'
      Origin = 'mlt_boleto'
      Size = 45
    end
    object sqlMultamlt_codplc: TStringField
      FieldName = 'mlt_codplc'
      Origin = 'mlt_codplc'
      Size = 7
    end
    object sqlMultamlt_codpss: TIntegerField
      FieldName = 'mlt_codpss'
      Origin = 'mlt_codpss'
    end
    object sqlMultamlt_codfcc: TIntegerField
      FieldName = 'mlt_codfcc'
      Origin = 'mlt_codfcc'
    end
    object sqlMultamlt_codfcd: TIntegerField
      FieldName = 'mlt_codfcd'
      Origin = 'mlt_codfcd'
    end
    object sqlMultamlt_codtmt: TStringField
      FieldName = 'mlt_codtmt'
      Origin = 'mlt_codtmt'
      Size = 7
    end
    object sqlMultamlt_codogt: TIntegerField
      FieldName = 'mlt_codogt'
      Origin = 'mlt_codogt'
    end
    object sqlMultamlt_codcid: TIntegerField
      FieldName = 'mlt_codcid'
      Origin = 'mlt_codcid'
    end
    object sqlMultamlt_autinf: TStringField
      FieldName = 'mlt_autinf'
      Origin = 'mlt_autinf'
      Size = 15
    end
    object sqlMultamlt_local: TStringField
      FieldName = 'mlt_local'
      Origin = 'mlt_local'
      Size = 25
    end
    object sqlMultamlt_datinf: TDateField
      FieldName = 'mlt_datinf'
      Origin = 'mlt_datinf'
    end
    object sqlMultamlt_horinf: TStringField
      FieldName = 'mlt_horinf'
      Origin = 'mlt_horinf'
      Size = 4
    end
    object sqlMultamlt_datvnc: TDateField
      FieldName = 'mlt_datvnc'
      Origin = 'mlt_datvnc'
    end
    object sqlMultamlt_vlrinf: TBCDField
      FieldName = 'mlt_vlrinf'
      Origin = 'mlt_vlrinf'
      Precision = 15
      Size = 2
    end
    object sqlMultamlt_datpdf: TDateField
      FieldName = 'mlt_datpdf'
      Origin = 'mlt_datpdf'
    end
    object sqlMultamlt_usuinc: TStringField
      FieldName = 'mlt_usuinc'
      Origin = 'mlt_usuinc'
      Size = 15
    end
    object sqlMultamlt_datinc: TDateField
      FieldName = 'mlt_datinc'
      Origin = 'mlt_datinc'
    end
    object sqlMultamlt_horinc: TStringField
      FieldName = 'mlt_horinc'
      Origin = 'mlt_horinc'
      Size = 8
    end
    object sqlMultamlt_usualt: TStringField
      FieldName = 'mlt_usualt'
      Origin = 'mlt_usualt'
      Size = 15
    end
    object sqlMultamlt_datalt: TDateField
      FieldName = 'mlt_datalt'
      Origin = 'mlt_datalt'
    end
    object sqlMultamlt_horalt: TStringField
      FieldName = 'mlt_horalt'
      Origin = 'mlt_horalt'
      Size = 8
    end
    object sqlMultacid_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cid_codigo'
      Origin = 'cid_codigo'
    end
    object sqlMultacid_cidnum: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_cidnum'
      Origin = 'cid_cidnum'
      Size = 8
    end
    object sqlMultacid_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_nome'
      Origin = 'cid_nome'
      Size = 35
    end
    object sqlMultacid_codest: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cid_codest'
      Origin = 'cid_codest'
    end
    object sqlMultacid_codpai: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cid_codpai'
      Origin = 'cid_codpai'
    end
    object sqlMultacid_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_usuinc'
      Origin = 'cid_usuinc'
      Size = 15
    end
    object sqlMultacid_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cid_datinc'
      Origin = 'cid_datinc'
    end
    object sqlMultacid_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_horinc'
      Origin = 'cid_horinc'
      Size = 8
    end
    object sqlMultacid_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_usualt'
      Origin = 'cid_usualt'
      Size = 15
    end
    object sqlMultacid_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cid_datalt'
      Origin = 'cid_datalt'
    end
    object sqlMultacid_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_horalt'
      Origin = 'cid_horalt'
      Size = 8
    end
    object sqlMultavat_placa: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_placa'
      Origin = 'vat_placa'
      Size = 7
    end
    object sqlMultavat_nrfrota: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_nrfrota'
      Origin = 'vat_nrfrota'
      Size = 5
    end
    object sqlMultavat_paestversa: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_paestversa'
      Origin = 'vat_paestversa'
      Size = 5
    end
    object sqlMultavat_chip: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_chip'
      Origin = 'vat_chip'
      Size = 10
    end
    object sqlMultavat_cartao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_cartao'
      Origin = 'vat_cartao'
      Size = 15
    end
    object sqlMultavat_chassi: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_chassi'
      Origin = 'vat_chassi'
      Size = 17
    end
    object sqlMultavat_licenc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_licenc'
      Origin = 'vat_licenc'
      Size = 15
    end
    object sqlMultavat_renavan: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_renavan'
      Origin = 'vat_renavan'
      Size = 15
    end
    object sqlMultavat_dut: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_dut'
      Origin = 'vat_dut'
      Size = 10
    end
    object sqlMultavat_codltd: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codltd'
      Origin = 'vat_codltd'
    end
    object sqlMultavat_codtip: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codtip'
      Origin = 'vat_codtip'
    end
    object sqlMultavat_codmdl: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codmdl'
      Origin = 'vat_codmdl'
    end
    object sqlMultavat_codmrc: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codmrc'
      Origin = 'vat_codmrc'
    end
    object sqlMultavat_codcor: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codcor'
      Origin = 'vat_codcor'
    end
    object sqlMultavat_codcid: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codcid'
      Origin = 'vat_codcid'
    end
    object sqlMultavat_codgrm: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codgrm'
      Origin = 'vat_codgrm'
    end
    object sqlMultavat_cor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_cor'
      Origin = 'vat_cor'
    end
    object sqlMultavat_status: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_status'
      Origin = 'vat_status'
      Size = 15
    end
    object sqlMultavat_tanque1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_tanque1'
      Origin = 'vat_tanque1'
      Precision = 7
      Size = 0
    end
    object sqlMultavat_tanque2: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_tanque2'
      Origin = 'vat_tanque2'
      Precision = 7
      Size = 0
    end
    object sqlMultavat_tanque3: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_tanque3'
      Origin = 'vat_tanque3'
      Precision = 7
      Size = 0
    end
    object sqlMultavat_kmini: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_kmini'
      Origin = 'vat_kmini'
      Precision = 7
      Size = 0
    end
    object sqlMultavat_kmatu: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_kmatu'
      Origin = 'vat_kmatu'
      Precision = 7
      Size = 0
    end
    object sqlMultavat_anofbmd: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_anofbmd'
      Origin = 'vat_anofbmd'
      Size = 8
    end
    object sqlMultavat_termo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_termo'
      Origin = 'vat_termo'
      Size = 8
    end
    object sqlMultavat_tombo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_tombo'
      Origin = 'vat_tombo'
      Size = 10
    end
    object sqlMultavat_estado: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_estado'
      Origin = 'vat_estado'
      Size = 15
    end
    object sqlMultavat_qtdpass: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_qtdpass'
      Origin = 'vat_qtdpass'
      Size = 2
    end
    object sqlMultavat_potenc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_potenc'
      Origin = 'vat_potenc'
      Size = 5
    end
    object sqlMultavat_kgbruto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_kgbruto'
      Origin = 'vat_kgbruto'
      Precision = 7
      Size = 0
    end
    object sqlMultavat_kgcarga: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_kgcarga'
      Origin = 'vat_kgcarga'
      Precision = 7
      Size = 0
    end
    object sqlMultavat_clindad: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_clindad'
      Origin = 'vat_clindad'
      Size = 4
    end
    object sqlMultavat_nrmotor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_nrmotor'
      Origin = 'vat_nrmotor'
      Size = 15
    end
    object sqlMultavat_cavalo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_cavalo'
      Origin = 'vat_cavalo'
      Size = 10
    end
    object sqlMultavat_foto: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'vat_foto'
      Origin = 'vat_foto'
    end
    object sqlMultavat_obs: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'vat_obs'
      Origin = 'vat_obs'
      BlobType = ftMemo
    end
    object sqlMultavat_vlrcmp: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_vlrcmp'
      Origin = 'vat_vlrcmp'
      Precision = 15
      Size = 2
    end
    object sqlMultavat_datcmp: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'vat_datcmp'
      Origin = 'vat_datcmp'
    end
    object sqlMultavat_nfecmp: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_nfecmp'
      Origin = 'vat_nfecmp'
      Size = 10
    end
    object sqlMultavat_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_usuinc'
      Origin = 'vat_usuinc'
      Size = 15
    end
    object sqlMultavat_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'vat_datinc'
      Origin = 'vat_datinc'
    end
    object sqlMultavat_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_horinc'
      Origin = 'vat_horinc'
      Size = 8
    end
    object sqlMultavat_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_usualt'
      Origin = 'vat_usualt'
      Size = 15
    end
    object sqlMultavat_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'vat_datalt'
      Origin = 'vat_datalt'
    end
    object sqlMultavat_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_horalt'
      Origin = 'vat_horalt'
      Size = 8
    end
    object sqlMultatmt_codigo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmt_codigo'
      Origin = 'tmt_codigo'
      Size = 7
    end
    object sqlMultatmt_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmt_nome'
      Origin = 'tmt_nome'
      Size = 200
    end
    object sqlMultatmt_ampleg: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmt_ampleg'
      Origin = 'tmt_ampleg'
    end
    object sqlMultatmt_gravid: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmt_gravid'
      Origin = 'tmt_gravid'
    end
    object sqlMultatmt_infrat: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmt_infrat'
      Origin = 'tmt_infrat'
    end
    object sqlMultatmt_local: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmt_local'
      Origin = 'tmt_local'
    end
    object sqlMultatmt_nmrpts: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'tmt_nmrpts'
      Origin = 'tmt_nmrpts'
    end
    object sqlMultatmt_vlrmul: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tmt_vlrmul'
      Origin = 'tmt_vlrmul'
      Precision = 12
      Size = 2
    end
    object sqlMultatmt_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmt_usuinc'
      Origin = 'tmt_usuinc'
      Size = 15
    end
    object sqlMultatmt_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'tmt_datinc'
      Origin = 'tmt_datinc'
    end
    object sqlMultatmt_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmt_horinc'
      Origin = 'tmt_horinc'
      Size = 8
    end
    object sqlMultatmt_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmt_usualt'
      Origin = 'tmt_usualt'
      Size = 15
    end
    object sqlMultatmt_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'tmt_datalt'
      Origin = 'tmt_datalt'
    end
    object sqlMultatmt_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmt_horalt'
      Origin = 'tmt_horalt'
      Size = 8
    end
    object sqlMultaogt_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ogt_codigo'
      Origin = 'ogt_codigo'
    end
    object sqlMultaogt_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ogt_nome'
      Origin = 'ogt_nome'
      Size = 60
    end
    object sqlMultaogt_sigla: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ogt_sigla'
      Origin = 'ogt_sigla'
      Size = 10
    end
    object sqlMultaogt_telef01: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ogt_telef01'
      Origin = 'ogt_telef01'
      Size = 11
    end
    object sqlMultaogt_telef02: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ogt_telef02'
      Origin = 'ogt_telef02'
      Size = 11
    end
    object sqlMultaogt_codpct: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ogt_codpct'
      Origin = 'ogt_codpct'
      Size = 10
    end
    object sqlMultaogt_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ogt_usuinc'
      Origin = 'ogt_usuinc'
      Size = 15
    end
    object sqlMultaogt_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'ogt_datinc'
      Origin = 'ogt_datinc'
    end
    object sqlMultaogt_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ogt_horinc'
      Origin = 'ogt_horinc'
      Size = 8
    end
    object sqlMultaogt_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ogt_usualt'
      Origin = 'ogt_usualt'
      Size = 15
    end
    object sqlMultaogt_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'ogt_datalt'
      Origin = 'ogt_datalt'
    end
    object sqlMultaogt_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ogt_horalt'
      Origin = 'ogt_horalt'
      Size = 8
    end
    object sqlMultapss_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'pss_codigo'
      Origin = 'pss_codigo'
    end
    object sqlMultapss_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_nome'
      Origin = 'pss_nome'
      Size = 50
    end
    object sqlMultapss_apelido: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_apelido'
      Origin = 'pss_apelido'
    end
    object sqlMultapss_codcgo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'pss_codcgo'
      Origin = 'pss_codcgo'
    end
    object sqlMultapss_codltd: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'pss_codltd'
      Origin = 'pss_codltd'
    end
    object sqlMultapss_datnas: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pss_datnas'
      Origin = 'pss_datnas'
    end
    object sqlMultapss_sexo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_sexo'
      Origin = 'pss_sexo'
      Size = 1
    end
    object sqlMultapss_ecivil: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_ecivil'
      Origin = 'pss_ecivil'
      Size = 15
    end
    object sqlMultapss_tpsangue: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_tpsangue'
      Origin = 'pss_tpsangue'
      Size = 3
    end
    object sqlMultapss_nompal: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_nompal'
      Origin = 'pss_nompal'
      Size = 50
    end
    object sqlMultapss_nommae: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_nommae'
      Origin = 'pss_nommae'
      Size = 50
    end
    object sqlMultapss_cpf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_cpf'
      Origin = 'pss_cpf'
      Size = 11
    end
    object sqlMultapss_rg: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_rg'
      Origin = 'pss_rg'
      Size = 15
    end
    object sqlMultapss_rgexped: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_rgexped'
      Origin = 'pss_rgexped'
    end
    object sqlMultapss_rgdata: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pss_rgdata'
      Origin = 'pss_rgdata'
    end
    object sqlMultapss_pispasep: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_pispasep'
      Origin = 'pss_pispasep'
      Size = 14
    end
    object sqlMultapss_numctps: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_numctps'
      Origin = 'pss_numctps'
      Size = 14
    end
    object sqlMultapss_habilitac: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_habilitac'
      Origin = 'pss_habilitac'
      Size = 11
    end
    object sqlMultapss_hbemite: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pss_hbemite'
      Origin = 'pss_hbemite'
    end
    object sqlMultapss_hbvalid: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pss_hbvalid'
      Origin = 'pss_hbvalid'
    end
    object sqlMultapss_hbcateg: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_hbcateg'
      Origin = 'pss_hbcateg'
      Size = 4
    end
    object sqlMultapss_nrtitulo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_nrtitulo'
      Origin = 'pss_nrtitulo'
      Size = 14
    end
    object sqlMultapss_nrreserv: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_nrreserv'
      Origin = 'pss_nrreserv'
      Size = 14
    end
    object sqlMultapss_cep: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_cep'
      Origin = 'pss_cep'
      Size = 8
    end
    object sqlMultapss_endereco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_endereco'
      Origin = 'pss_endereco'
      Size = 50
    end
    object sqlMultapss_complem: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_complem'
      Origin = 'pss_complem'
      Size = 25
    end
    object sqlMultapss_numres: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_numres'
      Origin = 'pss_numres'
      Size = 6
    end
    object sqlMultapss_bairro: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_bairro'
      Origin = 'pss_bairro'
      Size = 50
    end
    object sqlMultapss_codcid: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'pss_codcid'
      Origin = 'pss_codcid'
    end
    object sqlMultapss_tpimove: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_tpimove'
      Origin = 'pss_tpimove'
      Size = 15
    end
    object sqlMultapss_tpresid: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_tpresid'
      Origin = 'pss_tpresid'
      Size = 15
    end
    object sqlMultapss_telef01: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_telef01'
      Origin = 'pss_telef01'
      Size = 12
    end
    object sqlMultapss_telef02: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_telef02'
      Origin = 'pss_telef02'
      Size = 12
    end
    object sqlMultapss_celular: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_celular'
      Origin = 'pss_celular'
      Size = 12
    end
    object sqlMultapss_email: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_email'
      Origin = 'pss_email'
      Size = 100
    end
    object sqlMultapss_status: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_status'
      Origin = 'pss_status'
      Size = 15
    end
    object sqlMultapss_foto: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'pss_foto'
      Origin = 'pss_foto'
    end
    object sqlMultapss_obs: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'pss_obs'
      Origin = 'pss_obs'
      BlobType = ftMemo
    end
    object sqlMultapss_vlrrenda: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'pss_vlrrenda'
      Origin = 'pss_vlrrenda'
      Precision = 15
      Size = 2
    end
    object sqlMultapss_vlrvale: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'pss_vlrvale'
      Origin = 'pss_vlrvale'
      Precision = 15
      Size = 2
    end
    object sqlMultapss_datcmp: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pss_datcmp'
      Origin = 'pss_datcmp'
    end
    object sqlMultapss_nfecmp: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_nfecmp'
      Origin = 'pss_nfecmp'
      Size = 10
    end
    object sqlMultapss_codpcv: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_codpcv'
      Origin = 'pss_codpcv'
      Size = 10
    end
    object sqlMultapss_codpcr: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_codpcr'
      Origin = 'pss_codpcr'
      Size = 10
    end
    object sqlMultapss_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_usuinc'
      Origin = 'pss_usuinc'
      Size = 15
    end
    object sqlMultapss_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pss_datinc'
      Origin = 'pss_datinc'
    end
    object sqlMultapss_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_horinc'
      Origin = 'pss_horinc'
      Size = 8
    end
    object sqlMultapss_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_usualt'
      Origin = 'pss_usualt'
      Size = 15
    end
    object sqlMultapss_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pss_datalt'
      Origin = 'pss_datalt'
    end
    object sqlMultapss_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_horalt'
      Origin = 'pss_horalt'
      Size = 8
    end
  end
  object sqlPneuCmp: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * From "99999999999999_TESTE".pneucmp'
      
        'LEFT Join "99999999999999_TESTE".fornecedor on fnd_codigo = pcp_' +
        'codfnd ')
    Left = 1320
    Top = 320
    object sqlPneuCmppcp_codigo: TIntegerField
      FieldName = 'pcp_codigo'
      Origin = 'pcp_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlPneuCmppcp_numnfe: TStringField
      FieldName = 'pcp_numnfe'
      Origin = 'pcp_numnfe'
      Size = 10
    end
    object sqlPneuCmppcp_sernfe: TStringField
      FieldName = 'pcp_sernfe'
      Origin = 'pcp_sernfe'
      Size = 5
    end
    object sqlPneuCmppcp_chelet: TStringField
      FieldName = 'pcp_chelet'
      Origin = 'pcp_chelet'
      Size = 44
    end
    object sqlPneuCmppcp_datems: TDateField
      FieldName = 'pcp_datems'
      Origin = 'pcp_datems'
    end
    object sqlPneuCmppcp_datent: TDateField
      FieldName = 'pcp_datent'
      Origin = 'pcp_datent'
    end
    object sqlPneuCmppcp_codfnd: TIntegerField
      FieldName = 'pcp_codfnd'
      Origin = 'pcp_codfnd'
    end
    object sqlPneuCmppcp_codfpg: TIntegerField
      FieldName = 'pcp_codfpg'
      Origin = 'pcp_codfpg'
    end
    object sqlPneuCmppcp_fatura: TBooleanField
      FieldName = 'pcp_fatura'
      Origin = 'pcp_fatura'
    end
    object sqlPneuCmppcp_vlrfrt: TBCDField
      FieldName = 'pcp_vlrfrt'
      Origin = 'pcp_vlrfrt'
      Precision = 15
      Size = 2
    end
    object sqlPneuCmppcp_vlrfac: TBCDField
      FieldName = 'pcp_vlrfac'
      Origin = 'pcp_vlrfac'
      Precision = 15
      Size = 2
    end
    object sqlPneuCmppcp_vlrseg: TBCDField
      FieldName = 'pcp_vlrseg'
      Origin = 'pcp_vlrseg'
      Precision = 15
      Size = 2
    end
    object sqlPneuCmppcp_qtdpct: TIntegerField
      FieldName = 'pcp_qtdpct'
      Origin = 'pcp_qtdpct'
    end
    object sqlPneuCmppcp_parcel: TStringField
      FieldName = 'pcp_parcel'
      Origin = 'pcp_parcel'
      Size = 4
    end
    object sqlPneuCmppcp_usuinc: TStringField
      FieldName = 'pcp_usuinc'
      Origin = 'pcp_usuinc'
      Size = 15
    end
    object sqlPneuCmppcp_datinc: TDateField
      FieldName = 'pcp_datinc'
      Origin = 'pcp_datinc'
    end
    object sqlPneuCmppcp_horinc: TStringField
      FieldName = 'pcp_horinc'
      Origin = 'pcp_horinc'
      Size = 8
    end
    object sqlPneuCmppcp_usualt: TStringField
      FieldName = 'pcp_usualt'
      Origin = 'pcp_usualt'
      Size = 15
    end
    object sqlPneuCmppcp_datalt: TDateField
      FieldName = 'pcp_datalt'
      Origin = 'pcp_datalt'
    end
    object sqlPneuCmppcp_horalt: TStringField
      FieldName = 'pcp_horalt'
      Origin = 'pcp_horalt'
      Size = 8
    end
    object sqlPneuCmpfnd_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_codigo'
      Origin = 'fnd_codigo'
    end
    object sqlPneuCmpfnd_ativo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_ativo'
      Origin = 'fnd_ativo'
      Size = 3
    end
    object sqlPneuCmpfnd_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_nome'
      Origin = 'fnd_nome'
      Size = 50
    end
    object sqlPneuCmpfnd_rsocial: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_rsocial'
      Origin = 'fnd_rsocial'
      Size = 50
    end
    object sqlPneuCmpfnd_tipopes: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_tipopes'
      Origin = 'fnd_tipopes'
      Size = 8
    end
    object sqlPneuCmpfnd_cpfcnpj: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_cpfcnpj'
      Origin = 'fnd_cpfcnpj'
      Size = 14
    end
    object sqlPneuCmpfnd_codpct: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_codpct'
      Origin = 'fnd_codpct'
      Size = 10
    end
    object sqlPneuCmpfnd_endereco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_endereco'
      Origin = 'fnd_endereco'
      Size = 35
    end
    object sqlPneuCmpfnd_numend: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_numend'
      Origin = 'fnd_numend'
      Size = 5
    end
    object sqlPneuCmpfnd_complem: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_complem'
      Origin = 'fnd_complem'
      Size = 25
    end
    object sqlPneuCmpfnd_bairro: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_bairro'
      Origin = 'fnd_bairro'
      Size = 50
    end
    object sqlPneuCmpfnd_cep: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_cep'
      Origin = 'fnd_cep'
      Size = 8
    end
    object sqlPneuCmpfnd_codcid: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_codcid'
      Origin = 'fnd_codcid'
    end
    object sqlPneuCmpfnd_telef1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_telef1'
      Origin = 'fnd_telef1'
      Size = 12
    end
    object sqlPneuCmpfnd_telef2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_telef2'
      Origin = 'fnd_telef2'
      Size = 12
    end
    object sqlPneuCmpfnd_celula: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_celula'
      Origin = 'fnd_celula'
      Size = 12
    end
    object sqlPneuCmpfnd_obs: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_obs'
      Origin = 'fnd_obs'
      BlobType = ftMemo
    end
    object sqlPneuCmpfnd_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_usuinc'
      Origin = 'fnd_usuinc'
      Size = 15
    end
    object sqlPneuCmpfnd_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_datinc'
      Origin = 'fnd_datinc'
    end
    object sqlPneuCmpfnd_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_horinc'
      Origin = 'fnd_horinc'
      Size = 8
    end
    object sqlPneuCmpfnd_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_usualt'
      Origin = 'fnd_usualt'
      Size = 15
    end
    object sqlPneuCmpfnd_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_datalt'
      Origin = 'fnd_datalt'
    end
    object sqlPneuCmpfnd_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_horalt'
      Origin = 'fnd_horalt'
      Size = 8
    end
  end
  object sqlprocveic: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * From "99999999999999_TESTE".procveic'
      
        'LEFT Join "99999999999999_TESTE".veiculoatv on vat_placa = prv_c' +
        'odplc'
      'LEFT Join "dbconfig".lotado on ltd_codigo = vat_codltd'
      'LEFT Join "dbconfig".tipo on tip_codigo = vat_codtip'
      'LEFT Join "dbconfig".modelo on mdl_codigo = vat_codmdl'
      'LEFT Join "dbconfig".cor on cor_codigo = vat_codcor'
      'LEFT Join "dbconfig".cidade on cid_codigo = vat_codcid'
      'LEFT Join "dbconfig".marca on mrc_codigo = vat_codmrc'
      'LEFT Join "dbconfig".grupomnt on grm_codigo = vat_codgrm')
    Left = 1319
    Top = 370
    object sqlprocveicprv_codigo: TIntegerField
      FieldName = 'prv_codigo'
      Origin = 'prv_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlprocveicprv_numpro: TStringField
      FieldName = 'prv_numpro'
      Origin = 'prv_numpro'
      Size = 9
    end
    object sqlprocveicprv_datpro: TDateField
      FieldName = 'prv_datpro'
      Origin = 'prv_datpro'
    end
    object sqlprocveicprv_datems: TDateField
      FieldName = 'prv_datems'
      Origin = 'prv_datems'
    end
    object sqlprocveicprv_origem: TStringField
      FieldName = 'prv_origem'
      Origin = 'prv_origem'
      Size = 10
    end
    object sqlprocveicprv_destin: TStringField
      FieldName = 'prv_destin'
      Origin = 'prv_destin'
      Size = 10
    end
    object sqlprocveicprv_codplc: TStringField
      FieldName = 'prv_codplc'
      Origin = 'prv_codplc'
      Size = 7
    end
    object sqlprocveicprv_usuinc: TStringField
      FieldName = 'prv_usuinc'
      Origin = 'prv_usuinc'
      Size = 15
    end
    object sqlprocveicprv_datinc: TDateField
      FieldName = 'prv_datinc'
      Origin = 'prv_datinc'
    end
    object sqlprocveicprv_horinc: TStringField
      FieldName = 'prv_horinc'
      Origin = 'prv_horinc'
      Size = 8
    end
    object sqlprocveicprv_usualt: TStringField
      FieldName = 'prv_usualt'
      Origin = 'prv_usualt'
      Size = 15
    end
    object sqlprocveicprv_datalt: TDateField
      FieldName = 'prv_datalt'
      Origin = 'prv_datalt'
    end
    object sqlprocveicprv_horalt: TStringField
      FieldName = 'prv_horalt'
      Origin = 'prv_horalt'
      Size = 8
    end
    object sqlprocveicvat_placa: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_placa'
      Origin = 'vat_placa'
      Size = 7
    end
    object sqlprocveicvat_nrfrota: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_nrfrota'
      Origin = 'vat_nrfrota'
      Size = 5
    end
    object sqlprocveicvat_paestversa: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_paestversa'
      Origin = 'vat_paestversa'
      Size = 5
    end
    object sqlprocveicvat_chip: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_chip'
      Origin = 'vat_chip'
      Size = 10
    end
    object sqlprocveicvat_cartao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_cartao'
      Origin = 'vat_cartao'
      Size = 15
    end
    object sqlprocveicvat_chassi: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_chassi'
      Origin = 'vat_chassi'
      Size = 17
    end
    object sqlprocveicvat_licenc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_licenc'
      Origin = 'vat_licenc'
      Size = 15
    end
    object sqlprocveicvat_renavan: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_renavan'
      Origin = 'vat_renavan'
      Size = 15
    end
    object sqlprocveicvat_dut: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_dut'
      Origin = 'vat_dut'
      Size = 10
    end
    object sqlprocveicvat_codltd: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codltd'
      Origin = 'vat_codltd'
    end
    object sqlprocveicvat_codtip: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codtip'
      Origin = 'vat_codtip'
    end
    object sqlprocveicvat_codmdl: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codmdl'
      Origin = 'vat_codmdl'
    end
    object sqlprocveicvat_codmrc: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codmrc'
      Origin = 'vat_codmrc'
    end
    object sqlprocveicvat_codcor: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codcor'
      Origin = 'vat_codcor'
    end
    object sqlprocveicvat_codcid: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codcid'
      Origin = 'vat_codcid'
    end
    object sqlprocveicvat_codgrm: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codgrm'
      Origin = 'vat_codgrm'
    end
    object sqlprocveicvat_cor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_cor'
      Origin = 'vat_cor'
    end
    object sqlprocveicvat_status: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_status'
      Origin = 'vat_status'
      Size = 15
    end
    object sqlprocveicvat_tanque1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_tanque1'
      Origin = 'vat_tanque1'
      Precision = 7
      Size = 0
    end
    object sqlprocveicvat_tanque2: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_tanque2'
      Origin = 'vat_tanque2'
      Precision = 7
      Size = 0
    end
    object sqlprocveicvat_tanque3: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_tanque3'
      Origin = 'vat_tanque3'
      Precision = 7
      Size = 0
    end
    object sqlprocveicvat_kmini: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_kmini'
      Origin = 'vat_kmini'
      Precision = 7
      Size = 0
    end
    object sqlprocveicvat_kmatu: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_kmatu'
      Origin = 'vat_kmatu'
      Precision = 7
      Size = 0
    end
    object sqlprocveicvat_anofbmd: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_anofbmd'
      Origin = 'vat_anofbmd'
      Size = 8
    end
    object sqlprocveicvat_termo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_termo'
      Origin = 'vat_termo'
      Size = 8
    end
    object sqlprocveicvat_tombo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_tombo'
      Origin = 'vat_tombo'
      Size = 10
    end
    object sqlprocveicvat_estado: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_estado'
      Origin = 'vat_estado'
      Size = 15
    end
    object sqlprocveicvat_qtdpass: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_qtdpass'
      Origin = 'vat_qtdpass'
      Size = 2
    end
    object sqlprocveicvat_potenc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_potenc'
      Origin = 'vat_potenc'
      Size = 5
    end
    object sqlprocveicvat_kgbruto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_kgbruto'
      Origin = 'vat_kgbruto'
      Precision = 7
      Size = 0
    end
    object sqlprocveicvat_kgcarga: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_kgcarga'
      Origin = 'vat_kgcarga'
      Precision = 7
      Size = 0
    end
    object sqlprocveicvat_clindad: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_clindad'
      Origin = 'vat_clindad'
      Size = 4
    end
    object sqlprocveicvat_nrmotor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_nrmotor'
      Origin = 'vat_nrmotor'
      Size = 15
    end
    object sqlprocveicvat_cavalo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_cavalo'
      Origin = 'vat_cavalo'
      Size = 10
    end
    object sqlprocveicvat_foto: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'vat_foto'
      Origin = 'vat_foto'
    end
    object sqlprocveicvat_obs: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'vat_obs'
      Origin = 'vat_obs'
      BlobType = ftMemo
    end
    object sqlprocveicvat_vlrcmp: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_vlrcmp'
      Origin = 'vat_vlrcmp'
      Precision = 15
      Size = 2
    end
    object sqlprocveicvat_datcmp: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'vat_datcmp'
      Origin = 'vat_datcmp'
    end
    object sqlprocveicvat_nfecmp: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_nfecmp'
      Origin = 'vat_nfecmp'
      Size = 10
    end
    object sqlprocveicvat_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_usuinc'
      Origin = 'vat_usuinc'
      Size = 15
    end
    object sqlprocveicvat_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'vat_datinc'
      Origin = 'vat_datinc'
    end
    object sqlprocveicvat_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_horinc'
      Origin = 'vat_horinc'
      Size = 8
    end
    object sqlprocveicvat_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_usualt'
      Origin = 'vat_usualt'
      Size = 15
    end
    object sqlprocveicvat_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'vat_datalt'
      Origin = 'vat_datalt'
    end
    object sqlprocveicvat_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_horalt'
      Origin = 'vat_horalt'
      Size = 8
    end
    object sqlprocveicltd_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_codigo'
      Origin = 'ltd_codigo'
    end
    object sqlprocveicltd_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_nome'
      Origin = 'ltd_nome'
      Size = 35
    end
    object sqlprocveicltd_sigla: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_sigla'
      Origin = 'ltd_sigla'
      Size = 5
    end
    object sqlprocveicltd_endereco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_endereco'
      Origin = 'ltd_endereco'
      Size = 35
    end
    object sqlprocveicltd_numend: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_numend'
      Origin = 'ltd_numend'
      Size = 5
    end
    object sqlprocveicltd_complem: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_complem'
      Origin = 'ltd_complem'
      Size = 25
    end
    object sqlprocveicltd_bairro: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_bairro'
      Origin = 'ltd_bairro'
      Size = 50
    end
    object sqlprocveicltd_cep: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_cep'
      Origin = 'ltd_cep'
      Size = 8
    end
    object sqlprocveicltd_codcid: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_codcid'
      Origin = 'ltd_codcid'
    end
    object sqlprocveicltd_telef1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_telef1'
      Origin = 'ltd_telef1'
      Size = 12
    end
    object sqlprocveicltd_telef2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_telef2'
      Origin = 'ltd_telef2'
      Size = 12
    end
    object sqlprocveicltd_celula: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_celula'
      Origin = 'ltd_celula'
      Size = 12
    end
    object sqlprocveicltd_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_usuinc'
      Origin = 'ltd_usuinc'
      Size = 15
    end
    object sqlprocveicltd_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_datinc'
      Origin = 'ltd_datinc'
    end
    object sqlprocveicltd_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_horinc'
      Origin = 'ltd_horinc'
      Size = 8
    end
    object sqlprocveicltd_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_usualt'
      Origin = 'ltd_usualt'
      Size = 15
    end
    object sqlprocveicltd_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_datalt'
      Origin = 'ltd_datalt'
    end
    object sqlprocveicltd_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ltd_horalt'
      Origin = 'ltd_horalt'
      Size = 8
    end
    object sqlprocveictip_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'tip_codigo'
      Origin = 'tip_codigo'
    end
    object sqlprocveictip_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tip_nome'
      Origin = 'tip_nome'
      Size = 25
    end
    object sqlprocveictip_teixo: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tip_teixo'
      Origin = 'tip_teixo'
      Precision = 1
      Size = 0
    end
    object sqlprocveictip_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tip_usuinc'
      Origin = 'tip_usuinc'
      Size = 15
    end
    object sqlprocveictip_step: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tip_step'
      Origin = 'tip_step'
      Precision = 1
      Size = 0
    end
    object sqlprocveictip_tipo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tip_tipo'
      Origin = 'tip_tipo'
      Size = 15
    end
    object sqlprocveictip_trac: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tip_trac'
      Origin = 'tip_trac'
      Size = 15
    end
    object sqlprocveictip_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'tip_datinc'
      Origin = 'tip_datinc'
    end
    object sqlprocveictip_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tip_horinc'
      Origin = 'tip_horinc'
      Size = 8
    end
    object sqlprocveictip_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tip_usualt'
      Origin = 'tip_usualt'
      Size = 15
    end
    object sqlprocveictip_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'tip_datalt'
      Origin = 'tip_datalt'
    end
    object sqlprocveictip_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tip_horalt'
      Origin = 'tip_horalt'
      Size = 8
    end
    object sqlprocveicmdl_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_codigo'
      Origin = 'mdl_codigo'
    end
    object sqlprocveicmdl_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_nome'
      Origin = 'mdl_nome'
      Size = 25
    end
    object sqlprocveicmdl_codfip: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_codfip'
      Origin = 'mdl_codfip'
      Size = 10
    end
    object sqlprocveicmdl_codmrc: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_codmrc'
      Origin = 'mdl_codmrc'
    end
    object sqlprocveicmdl_codgrm: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_codgrm'
      Origin = 'mdl_codgrm'
    end
    object sqlprocveicmdl_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_usuinc'
      Origin = 'mdl_usuinc'
      Size = 15
    end
    object sqlprocveicmdl_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_datinc'
      Origin = 'mdl_datinc'
    end
    object sqlprocveicmdl_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_horinc'
      Origin = 'mdl_horinc'
      Size = 8
    end
    object sqlprocveicmdl_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_usualt'
      Origin = 'mdl_usualt'
      Size = 15
    end
    object sqlprocveicmdl_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_datalt'
      Origin = 'mdl_datalt'
    end
    object sqlprocveicmdl_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_horalt'
      Origin = 'mdl_horalt'
      Size = 8
    end
    object sqlprocveiccor_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cor_codigo'
      Origin = 'cor_codigo'
    end
    object sqlprocveiccor_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cor_nome'
      Origin = 'cor_nome'
      Size = 35
    end
    object sqlprocveiccor_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cor_usuinc'
      Origin = 'cor_usuinc'
      Size = 15
    end
    object sqlprocveiccor_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cor_datinc'
      Origin = 'cor_datinc'
    end
    object sqlprocveiccor_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cor_horinc'
      Origin = 'cor_horinc'
      Size = 8
    end
    object sqlprocveiccor_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cor_usualt'
      Origin = 'cor_usualt'
      Size = 15
    end
    object sqlprocveiccor_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cor_datalt'
      Origin = 'cor_datalt'
    end
    object sqlprocveiccor_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cor_horalt'
      Origin = 'cor_horalt'
      Size = 8
    end
    object sqlprocveiccid_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cid_codigo'
      Origin = 'cid_codigo'
    end
    object sqlprocveiccid_cidnum: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_cidnum'
      Origin = 'cid_cidnum'
      Size = 8
    end
    object sqlprocveiccid_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_nome'
      Origin = 'cid_nome'
      Size = 35
    end
    object sqlprocveiccid_codest: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cid_codest'
      Origin = 'cid_codest'
    end
    object sqlprocveiccid_codpai: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cid_codpai'
      Origin = 'cid_codpai'
    end
    object sqlprocveiccid_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_usuinc'
      Origin = 'cid_usuinc'
      Size = 15
    end
    object sqlprocveiccid_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cid_datinc'
      Origin = 'cid_datinc'
    end
    object sqlprocveiccid_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_horinc'
      Origin = 'cid_horinc'
      Size = 8
    end
    object sqlprocveiccid_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_usualt'
      Origin = 'cid_usualt'
      Size = 15
    end
    object sqlprocveiccid_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cid_datalt'
      Origin = 'cid_datalt'
    end
    object sqlprocveiccid_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cid_horalt'
      Origin = 'cid_horalt'
      Size = 8
    end
    object sqlprocveicmrc_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'mrc_codigo'
      Origin = 'mrc_codigo'
    end
    object sqlprocveicmrc_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mrc_nome'
      Origin = 'mrc_nome'
      Size = 25
    end
    object sqlprocveicmrc_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mrc_usuinc'
      Origin = 'mrc_usuinc'
      Size = 15
    end
    object sqlprocveicmrc_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'mrc_datinc'
      Origin = 'mrc_datinc'
    end
    object sqlprocveicmrc_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mrc_horinc'
      Origin = 'mrc_horinc'
      Size = 8
    end
    object sqlprocveicmrc_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mrc_usualt'
      Origin = 'mrc_usualt'
      Size = 15
    end
    object sqlprocveicmrc_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'mrc_datalt'
      Origin = 'mrc_datalt'
    end
    object sqlprocveicmrc_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mrc_horalt'
      Origin = 'mrc_horalt'
      Size = 8
    end
    object sqlprocveicgrm_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'grm_codigo'
      Origin = 'grm_codigo'
    end
    object sqlprocveicgrm_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grm_nome'
      Origin = 'grm_nome'
      Size = 40
    end
    object sqlprocveicgrm_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grm_usuinc'
      Origin = 'grm_usuinc'
      Size = 15
    end
    object sqlprocveicgrm_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'grm_datinc'
      Origin = 'grm_datinc'
    end
    object sqlprocveicgrm_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grm_horinc'
      Origin = 'grm_horinc'
      Size = 8
    end
    object sqlprocveicgrm_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grm_usualt'
      Origin = 'grm_usualt'
      Size = 15
    end
    object sqlprocveicgrm_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'grm_datalt'
      Origin = 'grm_datalt'
    end
    object sqlprocveicgrm_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grm_horalt'
      Origin = 'grm_horalt'
      Size = 8
    end
  end
  object sqlmanutcab: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'Select * From "99999999999999_TESTE".manutcab'
      
        'LEFT Join "99999999999999_TESTE".veiculoatv on vat_placa = osc_c' +
        'odplc'
      
        'LEFT Join "99999999999999_TESTE".fornecedor on fnd_codigo = osc_' +
        'codfnd'
      'LEFT Join "dbconfig".modelo on mdl_codigo = vat_codmdl'
      'LEFT Join "dbconfig".formapgm on fpg_codigo = osc_codfpg')
    Left = 1320
    Top = 424
    object sqlmanutcabosc_codigo: TIntegerField
      FieldName = 'osc_codigo'
      Origin = 'osc_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlmanutcabosc_codplc: TStringField
      FieldName = 'osc_codplc'
      Origin = 'osc_codplc'
      Size = 7
    end
    object sqlmanutcabosc_numord: TStringField
      FieldName = 'osc_numord'
      Origin = 'osc_numord'
      Size = 8
    end
    object sqlmanutcabosc_datems: TDateField
      FieldName = 'osc_datems'
      Origin = 'osc_datems'
    end
    object sqlmanutcabosc_horems: TStringField
      FieldName = 'osc_horems'
      Origin = 'osc_horems'
      Size = 4
    end
    object sqlmanutcabosc_datrea: TDateField
      FieldName = 'osc_datrea'
      Origin = 'osc_datrea'
    end
    object sqlmanutcabosc_horrea: TStringField
      FieldName = 'osc_horrea'
      Origin = 'osc_horrea'
      Size = 4
    end
    object sqlmanutcabosc_kmmnt: TBCDField
      FieldName = 'osc_kmmnt'
      Origin = 'osc_kmmnt'
      Precision = 7
      Size = 0
    end
    object sqlmanutcabosc_obs: TMemoField
      FieldName = 'osc_obs'
      Origin = 'osc_obs'
      BlobType = ftMemo
    end
    object sqlmanutcabosc_tipoos: TStringField
      FieldName = 'osc_tipoos'
      Origin = 'osc_tipoos'
      Size = 10
    end
    object sqlmanutcabosc_codfnd: TIntegerField
      FieldName = 'osc_codfnd'
      Origin = 'osc_codfnd'
    end
    object sqlmanutcabosc_codpss: TIntegerField
      FieldName = 'osc_codpss'
      Origin = 'osc_codpss'
    end
    object sqlmanutcabosc_codfpg: TIntegerField
      FieldName = 'osc_codfpg'
      Origin = 'osc_codfpg'
    end
    object sqlmanutcabosc_totpar: TBCDField
      FieldName = 'osc_totpar'
      Origin = 'osc_totpar'
      Precision = 4
      Size = 0
    end
    object sqlmanutcabosc_numnfe: TStringField
      FieldName = 'osc_numnfe'
      Origin = 'osc_numnfe'
      Size = 10
    end
    object sqlmanutcabosc_dtnemi: TDateField
      FieldName = 'osc_dtnemi'
      Origin = 'osc_dtnemi'
    end
    object sqlmanutcabosc_chvnfe: TStringField
      FieldName = 'osc_chvnfe'
      Origin = 'osc_chvnfe'
      Size = 24
    end
    object sqlmanutcabosc_fatura: TBooleanField
      FieldName = 'osc_fatura'
      Origin = 'osc_fatura'
    end
    object sqlmanutcabosc_usuinc: TStringField
      FieldName = 'osc_usuinc'
      Origin = 'osc_usuinc'
      Size = 15
    end
    object sqlmanutcabosc_datinc: TDateField
      FieldName = 'osc_datinc'
      Origin = 'osc_datinc'
    end
    object sqlmanutcabosc_horinc: TStringField
      FieldName = 'osc_horinc'
      Origin = 'osc_horinc'
      Size = 8
    end
    object sqlmanutcabosc_usualt: TStringField
      FieldName = 'osc_usualt'
      Origin = 'osc_usualt'
      Size = 15
    end
    object sqlmanutcabosc_datalt: TDateField
      FieldName = 'osc_datalt'
      Origin = 'osc_datalt'
    end
    object sqlmanutcabosc_horalt: TStringField
      FieldName = 'osc_horalt'
      Origin = 'osc_horalt'
      Size = 8
    end
    object sqlmanutcabvat_placa: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_placa'
      Origin = 'vat_placa'
      Size = 7
    end
    object sqlmanutcabvat_nrfrota: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_nrfrota'
      Origin = 'vat_nrfrota'
      Size = 5
    end
    object sqlmanutcabvat_paestversa: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_paestversa'
      Origin = 'vat_paestversa'
      Size = 5
    end
    object sqlmanutcabvat_chip: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_chip'
      Origin = 'vat_chip'
      Size = 10
    end
    object sqlmanutcabvat_cartao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_cartao'
      Origin = 'vat_cartao'
      Size = 15
    end
    object sqlmanutcabvat_chassi: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_chassi'
      Origin = 'vat_chassi'
      Size = 17
    end
    object sqlmanutcabvat_licenc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_licenc'
      Origin = 'vat_licenc'
      Size = 15
    end
    object sqlmanutcabvat_renavan: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_renavan'
      Origin = 'vat_renavan'
      Size = 15
    end
    object sqlmanutcabvat_dut: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_dut'
      Origin = 'vat_dut'
      Size = 10
    end
    object sqlmanutcabvat_codltd: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codltd'
      Origin = 'vat_codltd'
    end
    object sqlmanutcabvat_codtip: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codtip'
      Origin = 'vat_codtip'
    end
    object sqlmanutcabvat_codmdl: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codmdl'
      Origin = 'vat_codmdl'
    end
    object sqlmanutcabvat_codmrc: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codmrc'
      Origin = 'vat_codmrc'
    end
    object sqlmanutcabvat_codcor: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codcor'
      Origin = 'vat_codcor'
    end
    object sqlmanutcabvat_codcid: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codcid'
      Origin = 'vat_codcid'
    end
    object sqlmanutcabvat_codgrm: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codgrm'
      Origin = 'vat_codgrm'
    end
    object sqlmanutcabvat_cor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_cor'
      Origin = 'vat_cor'
    end
    object sqlmanutcabvat_status: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_status'
      Origin = 'vat_status'
      Size = 15
    end
    object sqlmanutcabvat_tanque1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_tanque1'
      Origin = 'vat_tanque1'
      Precision = 7
      Size = 0
    end
    object sqlmanutcabvat_tanque2: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_tanque2'
      Origin = 'vat_tanque2'
      Precision = 7
      Size = 0
    end
    object sqlmanutcabvat_tanque3: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_tanque3'
      Origin = 'vat_tanque3'
      Precision = 7
      Size = 0
    end
    object sqlmanutcabvat_kmini: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_kmini'
      Origin = 'vat_kmini'
      Precision = 7
      Size = 0
    end
    object sqlmanutcabvat_kmatu: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_kmatu'
      Origin = 'vat_kmatu'
      Precision = 7
      Size = 0
    end
    object sqlmanutcabvat_anofbmd: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_anofbmd'
      Origin = 'vat_anofbmd'
      Size = 8
    end
    object sqlmanutcabvat_termo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_termo'
      Origin = 'vat_termo'
      Size = 8
    end
    object sqlmanutcabvat_tombo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_tombo'
      Origin = 'vat_tombo'
      Size = 10
    end
    object sqlmanutcabvat_estado: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_estado'
      Origin = 'vat_estado'
      Size = 15
    end
    object sqlmanutcabvat_qtdpass: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_qtdpass'
      Origin = 'vat_qtdpass'
      Size = 2
    end
    object sqlmanutcabvat_potenc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_potenc'
      Origin = 'vat_potenc'
      Size = 5
    end
    object sqlmanutcabvat_kgbruto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_kgbruto'
      Origin = 'vat_kgbruto'
      Precision = 7
      Size = 0
    end
    object sqlmanutcabvat_kgcarga: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_kgcarga'
      Origin = 'vat_kgcarga'
      Precision = 7
      Size = 0
    end
    object sqlmanutcabvat_clindad: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_clindad'
      Origin = 'vat_clindad'
      Size = 4
    end
    object sqlmanutcabvat_nrmotor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_nrmotor'
      Origin = 'vat_nrmotor'
      Size = 15
    end
    object sqlmanutcabvat_cavalo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_cavalo'
      Origin = 'vat_cavalo'
      Size = 10
    end
    object sqlmanutcabvat_foto: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'vat_foto'
      Origin = 'vat_foto'
    end
    object sqlmanutcabvat_obs: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'vat_obs'
      Origin = 'vat_obs'
      BlobType = ftMemo
    end
    object sqlmanutcabvat_vlrcmp: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_vlrcmp'
      Origin = 'vat_vlrcmp'
      Precision = 15
      Size = 2
    end
    object sqlmanutcabvat_datcmp: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'vat_datcmp'
      Origin = 'vat_datcmp'
    end
    object sqlmanutcabvat_nfecmp: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_nfecmp'
      Origin = 'vat_nfecmp'
      Size = 10
    end
    object sqlmanutcabvat_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_usuinc'
      Origin = 'vat_usuinc'
      Size = 15
    end
    object sqlmanutcabvat_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'vat_datinc'
      Origin = 'vat_datinc'
    end
    object sqlmanutcabvat_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_horinc'
      Origin = 'vat_horinc'
      Size = 8
    end
    object sqlmanutcabvat_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_usualt'
      Origin = 'vat_usualt'
      Size = 15
    end
    object sqlmanutcabvat_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'vat_datalt'
      Origin = 'vat_datalt'
    end
    object sqlmanutcabvat_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_horalt'
      Origin = 'vat_horalt'
      Size = 8
    end
    object sqlmanutcabfnd_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_codigo'
      Origin = 'fnd_codigo'
    end
    object sqlmanutcabfnd_ativo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_ativo'
      Origin = 'fnd_ativo'
      Size = 3
    end
    object sqlmanutcabfnd_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_nome'
      Origin = 'fnd_nome'
      Size = 50
    end
    object sqlmanutcabfnd_rsocial: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_rsocial'
      Origin = 'fnd_rsocial'
      Size = 50
    end
    object sqlmanutcabfnd_tipopes: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_tipopes'
      Origin = 'fnd_tipopes'
      Size = 8
    end
    object sqlmanutcabfnd_cpfcnpj: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_cpfcnpj'
      Origin = 'fnd_cpfcnpj'
      Size = 14
    end
    object sqlmanutcabfnd_codpct: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_codpct'
      Origin = 'fnd_codpct'
      Size = 10
    end
    object sqlmanutcabfnd_endereco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_endereco'
      Origin = 'fnd_endereco'
      Size = 35
    end
    object sqlmanutcabfnd_numend: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_numend'
      Origin = 'fnd_numend'
      Size = 5
    end
    object sqlmanutcabfnd_complem: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_complem'
      Origin = 'fnd_complem'
      Size = 25
    end
    object sqlmanutcabfnd_bairro: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_bairro'
      Origin = 'fnd_bairro'
      Size = 50
    end
    object sqlmanutcabfnd_cep: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_cep'
      Origin = 'fnd_cep'
      Size = 8
    end
    object sqlmanutcabfnd_codcid: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_codcid'
      Origin = 'fnd_codcid'
    end
    object sqlmanutcabfnd_telef1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_telef1'
      Origin = 'fnd_telef1'
      Size = 12
    end
    object sqlmanutcabfnd_telef2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_telef2'
      Origin = 'fnd_telef2'
      Size = 12
    end
    object sqlmanutcabfnd_celula: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_celula'
      Origin = 'fnd_celula'
      Size = 12
    end
    object sqlmanutcabfnd_obs: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_obs'
      Origin = 'fnd_obs'
      BlobType = ftMemo
    end
    object sqlmanutcabfnd_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_usuinc'
      Origin = 'fnd_usuinc'
      Size = 15
    end
    object sqlmanutcabfnd_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_datinc'
      Origin = 'fnd_datinc'
    end
    object sqlmanutcabfnd_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_horinc'
      Origin = 'fnd_horinc'
      Size = 8
    end
    object sqlmanutcabfnd_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_usualt'
      Origin = 'fnd_usualt'
      Size = 15
    end
    object sqlmanutcabfnd_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_datalt'
      Origin = 'fnd_datalt'
    end
    object sqlmanutcabfnd_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fnd_horalt'
      Origin = 'fnd_horalt'
      Size = 8
    end
    object sqlmanutcabmdl_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_codigo'
      Origin = 'mdl_codigo'
    end
    object sqlmanutcabmdl_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_nome'
      Origin = 'mdl_nome'
      Size = 25
    end
    object sqlmanutcabmdl_codfip: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_codfip'
      Origin = 'mdl_codfip'
      Size = 10
    end
    object sqlmanutcabmdl_codmrc: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_codmrc'
      Origin = 'mdl_codmrc'
    end
    object sqlmanutcabmdl_codgrm: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_codgrm'
      Origin = 'mdl_codgrm'
    end
    object sqlmanutcabmdl_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_usuinc'
      Origin = 'mdl_usuinc'
      Size = 15
    end
    object sqlmanutcabmdl_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_datinc'
      Origin = 'mdl_datinc'
    end
    object sqlmanutcabmdl_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_horinc'
      Origin = 'mdl_horinc'
      Size = 8
    end
    object sqlmanutcabmdl_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_usualt'
      Origin = 'mdl_usualt'
      Size = 15
    end
    object sqlmanutcabmdl_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_datalt'
      Origin = 'mdl_datalt'
    end
    object sqlmanutcabmdl_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mdl_horalt'
      Origin = 'mdl_horalt'
      Size = 8
    end
    object sqlmanutcabfpg_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'fpg_codigo'
      Origin = 'fpg_codigo'
    end
    object sqlmanutcabfpg_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fpg_nome'
      Origin = 'fpg_nome'
    end
    object sqlmanutcabfpg_codpct: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fpg_codpct'
      Origin = 'fpg_codpct'
      Size = 10
    end
    object sqlmanutcabfpg_acao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fpg_acao'
      Origin = 'fpg_acao'
      Size = 3
    end
    object sqlmanutcabfpg_parcela: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fpg_parcela'
      Origin = 'fpg_parcela'
      Size = 3
    end
    object sqlmanutcabfpg_pctdesc: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'fpg_pctdesc'
      Origin = 'fpg_pctdesc'
      Precision = 5
      Size = 2
    end
    object sqlmanutcabfpg_pctacre: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'fpg_pctacre'
      Origin = 'fpg_pctacre'
      Precision = 5
      Size = 2
    end
    object sqlmanutcabfpg_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fpg_usuinc'
      Origin = 'fpg_usuinc'
      Size = 15
    end
    object sqlmanutcabfpg_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'fpg_datinc'
      Origin = 'fpg_datinc'
    end
    object sqlmanutcabfpg_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fpg_horinc'
      Origin = 'fpg_horinc'
      Size = 8
    end
    object sqlmanutcabfpg_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fpg_usualt'
      Origin = 'fpg_usualt'
      Size = 15
    end
    object sqlmanutcabfpg_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'fpg_datalt'
      Origin = 'fpg_datalt'
    end
    object sqlmanutcabfpg_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fpg_horalt'
      Origin = 'fpg_horalt'
      Size = 8
    end
  end
  object sqlmanutpcs: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      
        'Select *, ((osp_vlrpec - osp_vlrdsc ) * osp_qtdpec ) as Total  F' +
        'rom "99999999999999_TESTE".manutpcs'
      'LEFT Join "dbconfig".tbpecas on tpc_codigo = osp_codtpc'
      'LEFT Join "dbconfig".cst on cst_codigo = osp_codcst'
      'LEFT Join "dbconfig".cfop on cfo_codigo = osp_codcfo')
    Left = 1320
    Top = 480
    object sqlmanutpcsosp_codigo: TIntegerField
      FieldName = 'osp_codigo'
      Origin = 'osp_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlmanutpcsosp_codosc: TIntegerField
      FieldName = 'osp_codosc'
      Origin = 'osp_codosc'
    end
    object sqlmanutpcsosp_codtpc: TIntegerField
      FieldName = 'osp_codtpc'
      Origin = 'osp_codtpc'
    end
    object sqlmanutpcsosp_codcst: TStringField
      FieldName = 'osp_codcst'
      Origin = 'osp_codcst'
      Size = 2
    end
    object sqlmanutpcsosp_codcfo: TStringField
      FieldName = 'osp_codcfo'
      Origin = 'osp_codcfo'
      Size = 4
    end
    object sqlmanutpcsosp_vlrpec: TBCDField
      FieldName = 'osp_vlrpec'
      Origin = 'osp_vlrpec'
      Precision = 15
      Size = 2
    end
    object sqlmanutpcsosp_qtdpec: TBCDField
      FieldName = 'osp_qtdpec'
      Origin = 'osp_qtdpec'
      Precision = 10
      Size = 3
    end
    object sqlmanutpcsosp_vlrdsc: TBCDField
      FieldName = 'osp_vlrdsc'
      Origin = 'osp_vlrdsc'
      Precision = 15
      Size = 2
    end
    object sqlmanutpcsosp_pctdsc: TBCDField
      FieldName = 'osp_pctdsc'
      Origin = 'osp_pctdsc'
      Precision = 5
      Size = 2
    end
    object sqlmanutpcsosp_kmgtia: TBCDField
      FieldName = 'osp_kmgtia'
      Origin = 'osp_kmgtia'
      Precision = 7
      Size = 0
    end
    object sqlmanutpcsosp_kmatua: TBCDField
      FieldName = 'osp_kmatua'
      Origin = 'osp_kmatua'
      Precision = 7
      Size = 0
    end
    object sqlmanutpcsosp_diagar: TBCDField
      FieldName = 'osp_diagar'
      Origin = 'osp_diagar'
      Precision = 3
      Size = 0
    end
    object sqlmanutpcsosp_pcticm: TBCDField
      FieldName = 'osp_pcticm'
      Origin = 'osp_pcticm'
      Precision = 5
      Size = 2
    end
    object sqlmanutpcsosp_vlricm: TBCDField
      FieldName = 'osp_vlricm'
      Origin = 'osp_vlricm'
      Precision = 15
      Size = 2
    end
    object sqlmanutpcsosp_pctipi: TBCDField
      FieldName = 'osp_pctipi'
      Origin = 'osp_pctipi'
      Precision = 5
      Size = 2
    end
    object sqlmanutpcsosp_vlripi: TBCDField
      FieldName = 'osp_vlripi'
      Origin = 'osp_vlripi'
      Precision = 15
      Size = 2
    end
    object sqlmanutpcsosp_pcticmst: TBCDField
      FieldName = 'osp_pcticmst'
      Origin = 'osp_pcticmst'
      Precision = 5
      Size = 2
    end
    object sqlmanutpcsosp_vlricmst: TBCDField
      FieldName = 'osp_vlricmst'
      Origin = 'osp_vlricmst'
      Precision = 15
      Size = 2
    end
    object sqlmanutpcsosp_usuinc: TStringField
      FieldName = 'osp_usuinc'
      Origin = 'osp_usuinc'
      Size = 15
    end
    object sqlmanutpcsosp_datinc: TDateField
      FieldName = 'osp_datinc'
      Origin = 'osp_datinc'
    end
    object sqlmanutpcsosp_horinc: TStringField
      FieldName = 'osp_horinc'
      Origin = 'osp_horinc'
      Size = 8
    end
    object sqlmanutpcsosp_usualt: TStringField
      FieldName = 'osp_usualt'
      Origin = 'osp_usualt'
      Size = 15
    end
    object sqlmanutpcsosp_datalt: TDateField
      FieldName = 'osp_datalt'
      Origin = 'osp_datalt'
    end
    object sqlmanutpcsosp_horalt: TStringField
      FieldName = 'osp_horalt'
      Origin = 'osp_horalt'
      Size = 8
    end
    object sqlmanutpcstpc_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'tpc_codigo'
      Origin = 'tpc_codigo'
    end
    object sqlmanutpcstpc_codfbp: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'tpc_codfbp'
      Origin = 'tpc_codfbp'
    end
    object sqlmanutpcstpc_codsgm: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'tpc_codsgm'
      Origin = 'tpc_codsgm'
    end
    object sqlmanutpcstpc_codncm: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tpc_codncm'
      Origin = 'tpc_codncm'
      Size = 10
    end
    object sqlmanutpcstpc_codcfo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tpc_codcfo'
      Origin = 'tpc_codcfo'
      Size = 4
    end
    object sqlmanutpcstpc_codcst: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tpc_codcst'
      Origin = 'tpc_codcst'
      Size = 2
    end
    object sqlmanutpcstpc_cdbarra: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tpc_cdbarra'
      Origin = 'tpc_cdbarra'
      Size = 15
    end
    object sqlmanutpcstpc_referen: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tpc_referen'
      Origin = 'tpc_referen'
    end
    object sqlmanutpcstpc_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tpc_nome'
      Origin = 'tpc_nome'
      Size = 40
    end
    object sqlmanutpcstpc_medida: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tpc_medida'
      Origin = 'tpc_medida'
      Size = 3
    end
    object sqlmanutpcstpc_kgpeso: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tpc_kgpeso'
      Origin = 'tpc_kgpeso'
      Precision = 15
      Size = 3
    end
    object sqlmanutpcstpc_kgcubag: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tpc_kgcubag'
      Origin = 'tpc_kgcubag'
      Precision = 15
      Size = 3
    end
    object sqlmanutpcstpc_ativo: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'tpc_ativo'
      Origin = 'tpc_ativo'
    end
    object sqlmanutpcstpc_datpro: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'tpc_datpro'
      Origin = 'tpc_datpro'
    end
    object sqlmanutpcstpc_datems: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'tpc_datems'
      Origin = 'tpc_datems'
    end
    object sqlmanutpcstpc_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tpc_usuinc'
      Origin = 'tpc_usuinc'
      Size = 15
    end
    object sqlmanutpcstpc_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'tpc_datinc'
      Origin = 'tpc_datinc'
    end
    object sqlmanutpcstpc_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tpc_horinc'
      Origin = 'tpc_horinc'
      Size = 8
    end
    object sqlmanutpcstpc_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tpc_usualt'
      Origin = 'tpc_usualt'
      Size = 15
    end
    object sqlmanutpcstpc_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'tpc_datalt'
      Origin = 'tpc_datalt'
    end
    object sqlmanutpcstpc_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tpc_horalt'
      Origin = 'tpc_horalt'
      Size = 8
    end
    object sqlmanutpcscst_codigo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cst_codigo'
      Origin = 'cst_codigo'
      Size = 2
    end
    object sqlmanutpcscst_descri: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cst_descri'
      Origin = 'cst_descri'
      Size = 100
    end
    object sqlmanutpcscst_clcicm: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'cst_clcicm'
      Origin = 'cst_clcicm'
    end
    object sqlmanutpcscst_cf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cst_cf'
      Origin = 'cst_cf'
      Size = 5
    end
    object sqlmanutpcscst_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cst_usuinc'
      Origin = 'cst_usuinc'
      Size = 15
    end
    object sqlmanutpcscst_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cst_datinc'
      Origin = 'cst_datinc'
    end
    object sqlmanutpcscst_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cst_horinc'
      Origin = 'cst_horinc'
      Size = 8
    end
    object sqlmanutpcscst_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cst_usualt'
      Origin = 'cst_usualt'
      Size = 15
    end
    object sqlmanutpcscst_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cst_datalt'
      Origin = 'cst_datalt'
    end
    object sqlmanutpcscst_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cst_horalt'
      Origin = 'cst_horalt'
      Size = 8
    end
    object sqlmanutpcscfo_codigo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cfo_codigo'
      Origin = 'cfo_codigo'
      Size = 4
    end
    object sqlmanutpcscfo_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cfo_nome'
      Origin = 'cfo_nome'
      Size = 350
    end
    object sqlmanutpcscfo_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cfo_usuinc'
      Origin = 'cfo_usuinc'
      Size = 15
    end
    object sqlmanutpcscfo_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cfo_datinc'
      Origin = 'cfo_datinc'
    end
    object sqlmanutpcscfo_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cfo_horinc'
      Origin = 'cfo_horinc'
      Size = 8
    end
    object sqlmanutpcscfo_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cfo_usualt'
      Origin = 'cfo_usualt'
      Size = 15
    end
    object sqlmanutpcscfo_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cfo_datalt'
      Origin = 'cfo_datalt'
    end
    object sqlmanutpcscfo_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cfo_horalt'
      Origin = 'cfo_horalt'
      Size = 8
    end
    object sqlmanutpcstotal: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'total'
      Origin = 'total'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
  end
  object sqlmanutsrv: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      
        'Select *, ((oss_vlrsrv - oss_vlrdsc ) * oss_qtdsrv ) as Total  F' +
        'rom "99999999999999_TESTE".manutsrv'
      'LEFT Join "dbconfig".tbservico on tsm_codigo = oss_codtsm'
      'LEFT Join "dbconfig".cst on cst_codigo = oss_codcst'
      'LEFT Join "dbconfig".cfop on cfo_codigo = oss_codcfo')
    Left = 1320
    Top = 536
    object sqlmanutsrvoss_codigo: TIntegerField
      FieldName = 'oss_codigo'
      Origin = 'oss_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlmanutsrvoss_codosc: TIntegerField
      FieldName = 'oss_codosc'
      Origin = 'oss_codosc'
    end
    object sqlmanutsrvoss_codtsm: TIntegerField
      FieldName = 'oss_codtsm'
      Origin = 'oss_codtsm'
    end
    object sqlmanutsrvoss_codcst: TStringField
      FieldName = 'oss_codcst'
      Origin = 'oss_codcst'
      Size = 2
    end
    object sqlmanutsrvoss_codcfo: TStringField
      FieldName = 'oss_codcfo'
      Origin = 'oss_codcfo'
      Size = 4
    end
    object sqlmanutsrvoss_vlrsrv: TBCDField
      FieldName = 'oss_vlrsrv'
      Origin = 'oss_vlrsrv'
      Precision = 15
      Size = 2
    end
    object sqlmanutsrvoss_qtdsrv: TBCDField
      FieldName = 'oss_qtdsrv'
      Origin = 'oss_qtdsrv'
      Precision = 10
      Size = 3
    end
    object sqlmanutsrvoss_vlrdsc: TBCDField
      FieldName = 'oss_vlrdsc'
      Origin = 'oss_vlrdsc'
      Precision = 15
      Size = 2
    end
    object sqlmanutsrvoss_pctdsc: TBCDField
      FieldName = 'oss_pctdsc'
      Origin = 'oss_pctdsc'
      Precision = 5
      Size = 2
    end
    object sqlmanutsrvoss_kmgtia: TBCDField
      FieldName = 'oss_kmgtia'
      Origin = 'oss_kmgtia'
      Precision = 7
      Size = 0
    end
    object sqlmanutsrvoss_kmatua: TBCDField
      FieldName = 'oss_kmatua'
      Origin = 'oss_kmatua'
      Precision = 7
      Size = 0
    end
    object sqlmanutsrvoss_diagar: TBCDField
      FieldName = 'oss_diagar'
      Origin = 'oss_diagar'
      Precision = 3
      Size = 0
    end
    object sqlmanutsrvoss_pcticm: TBCDField
      FieldName = 'oss_pcticm'
      Origin = 'oss_pcticm'
      Precision = 5
      Size = 2
    end
    object sqlmanutsrvoss_vlricm: TBCDField
      FieldName = 'oss_vlricm'
      Origin = 'oss_vlricm'
      Precision = 15
      Size = 2
    end
    object sqlmanutsrvoss_pctipi: TBCDField
      FieldName = 'oss_pctipi'
      Origin = 'oss_pctipi'
      Precision = 5
      Size = 2
    end
    object sqlmanutsrvoss_vlripi: TBCDField
      FieldName = 'oss_vlripi'
      Origin = 'oss_vlripi'
      Precision = 15
      Size = 2
    end
    object sqlmanutsrvoss_pcticmst: TBCDField
      FieldName = 'oss_pcticmst'
      Origin = 'oss_pcticmst'
      Precision = 5
      Size = 2
    end
    object sqlmanutsrvoss_vlricmst: TBCDField
      FieldName = 'oss_vlricmst'
      Origin = 'oss_vlricmst'
      Precision = 15
      Size = 2
    end
    object sqlmanutsrvoss_usuinc: TStringField
      FieldName = 'oss_usuinc'
      Origin = 'oss_usuinc'
      Size = 15
    end
    object sqlmanutsrvoss_datinc: TDateField
      FieldName = 'oss_datinc'
      Origin = 'oss_datinc'
    end
    object sqlmanutsrvoss_horinc: TStringField
      FieldName = 'oss_horinc'
      Origin = 'oss_horinc'
      Size = 8
    end
    object sqlmanutsrvoss_usualt: TStringField
      FieldName = 'oss_usualt'
      Origin = 'oss_usualt'
      Size = 15
    end
    object sqlmanutsrvoss_datalt: TDateField
      FieldName = 'oss_datalt'
      Origin = 'oss_datalt'
    end
    object sqlmanutsrvoss_horalt: TStringField
      FieldName = 'oss_horalt'
      Origin = 'oss_horalt'
      Size = 8
    end
    object sqlmanutsrvtsm_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_codigo'
      Origin = 'tsm_codigo'
    end
    object sqlmanutsrvtsm_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_nome'
      Origin = 'tsm_nome'
      Size = 25
    end
    object sqlmanutsrvtsm_vlrhor: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_vlrhor'
      Origin = 'tsm_vlrhor'
      Precision = 12
      Size = 2
    end
    object sqlmanutsrvtsm_codsgm: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_codsgm'
      Origin = 'tsm_codsgm'
    end
    object sqlmanutsrvtsm_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_usuinc'
      Origin = 'tsm_usuinc'
      Size = 15
    end
    object sqlmanutsrvtsm_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_datinc'
      Origin = 'tsm_datinc'
    end
    object sqlmanutsrvtsm_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_horinc'
      Origin = 'tsm_horinc'
      Size = 8
    end
    object sqlmanutsrvtsm_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_usualt'
      Origin = 'tsm_usualt'
      Size = 15
    end
    object sqlmanutsrvtsm_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_datalt'
      Origin = 'tsm_datalt'
    end
    object sqlmanutsrvtsm_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tsm_horalt'
      Origin = 'tsm_horalt'
      Size = 8
    end
    object sqlmanutsrvcst_codigo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cst_codigo'
      Origin = 'cst_codigo'
      Size = 2
    end
    object sqlmanutsrvcst_descri: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cst_descri'
      Origin = 'cst_descri'
      Size = 100
    end
    object sqlmanutsrvcst_clcicm: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'cst_clcicm'
      Origin = 'cst_clcicm'
    end
    object sqlmanutsrvcst_cf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cst_cf'
      Origin = 'cst_cf'
      Size = 5
    end
    object sqlmanutsrvcst_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cst_usuinc'
      Origin = 'cst_usuinc'
      Size = 15
    end
    object sqlmanutsrvcst_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cst_datinc'
      Origin = 'cst_datinc'
    end
    object sqlmanutsrvcst_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cst_horinc'
      Origin = 'cst_horinc'
      Size = 8
    end
    object sqlmanutsrvcst_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cst_usualt'
      Origin = 'cst_usualt'
      Size = 15
    end
    object sqlmanutsrvcst_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cst_datalt'
      Origin = 'cst_datalt'
    end
    object sqlmanutsrvcst_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cst_horalt'
      Origin = 'cst_horalt'
      Size = 8
    end
    object sqlmanutsrvcfo_codigo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cfo_codigo'
      Origin = 'cfo_codigo'
      Size = 4
    end
    object sqlmanutsrvcfo_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cfo_nome'
      Origin = 'cfo_nome'
      Size = 350
    end
    object sqlmanutsrvcfo_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cfo_usuinc'
      Origin = 'cfo_usuinc'
      Size = 15
    end
    object sqlmanutsrvcfo_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cfo_datinc'
      Origin = 'cfo_datinc'
    end
    object sqlmanutsrvcfo_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cfo_horinc'
      Origin = 'cfo_horinc'
      Size = 8
    end
    object sqlmanutsrvcfo_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cfo_usualt'
      Origin = 'cfo_usualt'
      Size = 15
    end
    object sqlmanutsrvcfo_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cfo_datalt'
      Origin = 'cfo_datalt'
    end
    object sqlmanutsrvcfo_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cfo_horalt'
      Origin = 'cfo_horalt'
      Size = 8
    end
    object sqlmanutsrvtotal: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'total'
      Origin = 'total'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
  end
  object sqlmanutfpg: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      
        'Select *, ( osf_vlrpar * osc_totpar ) as Total  From "9999999999' +
        '9999_TESTE".manutfpg'
      
        'LEFT Join "99999999999999_TESTE".manutcab on osc_codigo = osf_co' +
        'dosc')
    Left = 1320
    Top = 592
    object sqlmanutfpgosf_codigo: TIntegerField
      FieldName = 'osf_codigo'
      Origin = 'osf_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlmanutfpgosf_codosc: TIntegerField
      FieldName = 'osf_codosc'
      Origin = 'osf_codosc'
    end
    object sqlmanutfpgosf_codcfr: TIntegerField
      FieldName = 'osf_codcfr'
      Origin = 'osf_codcfr'
    end
    object sqlmanutfpgosf_numbol: TStringField
      FieldName = 'osf_numbol'
      Origin = 'osf_numbol'
      Size = 45
    end
    object sqlmanutfpgosf_datvnc: TDateField
      FieldName = 'osf_datvnc'
      Origin = 'osf_datvnc'
    end
    object sqlmanutfpgosf_vlrpar: TBCDField
      FieldName = 'osf_vlrpar'
      Origin = 'osf_vlrpar'
      Precision = 15
      Size = 2
    end
    object sqlmanutfpgosf_usuinc: TStringField
      FieldName = 'osf_usuinc'
      Origin = 'osf_usuinc'
      Size = 15
    end
    object sqlmanutfpgosf_datinc: TDateField
      FieldName = 'osf_datinc'
      Origin = 'osf_datinc'
    end
    object sqlmanutfpgosf_horinc: TStringField
      FieldName = 'osf_horinc'
      Origin = 'osf_horinc'
      Size = 8
    end
    object sqlmanutfpgosf_usualt: TStringField
      FieldName = 'osf_usualt'
      Origin = 'osf_usualt'
      Size = 15
    end
    object sqlmanutfpgosf_datalt: TDateField
      FieldName = 'osf_datalt'
      Origin = 'osf_datalt'
    end
    object sqlmanutfpgosf_horalt: TStringField
      FieldName = 'osf_horalt'
      Origin = 'osf_horalt'
      Size = 8
    end
    object sqlmanutfpgosc_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'osc_codigo'
      Origin = 'osc_codigo'
    end
    object sqlmanutfpgosc_codplc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'osc_codplc'
      Origin = 'osc_codplc'
      Size = 7
    end
    object sqlmanutfpgosc_numord: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'osc_numord'
      Origin = 'osc_numord'
      Size = 8
    end
    object sqlmanutfpgosc_datems: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'osc_datems'
      Origin = 'osc_datems'
    end
    object sqlmanutfpgosc_horems: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'osc_horems'
      Origin = 'osc_horems'
      Size = 4
    end
    object sqlmanutfpgosc_datrea: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'osc_datrea'
      Origin = 'osc_datrea'
    end
    object sqlmanutfpgosc_horrea: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'osc_horrea'
      Origin = 'osc_horrea'
      Size = 4
    end
    object sqlmanutfpgosc_kmmnt: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'osc_kmmnt'
      Origin = 'osc_kmmnt'
      Precision = 7
      Size = 0
    end
    object sqlmanutfpgosc_obs: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'osc_obs'
      Origin = 'osc_obs'
      BlobType = ftMemo
    end
    object sqlmanutfpgosc_tipoos: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'osc_tipoos'
      Origin = 'osc_tipoos'
      Size = 10
    end
    object sqlmanutfpgosc_codfnd: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'osc_codfnd'
      Origin = 'osc_codfnd'
    end
    object sqlmanutfpgosc_codpss: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'osc_codpss'
      Origin = 'osc_codpss'
    end
    object sqlmanutfpgosc_codfpg: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'osc_codfpg'
      Origin = 'osc_codfpg'
    end
    object sqlmanutfpgosc_totpar: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'osc_totpar'
      Origin = 'osc_totpar'
      Precision = 4
      Size = 0
    end
    object sqlmanutfpgosc_numnfe: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'osc_numnfe'
      Origin = 'osc_numnfe'
      Size = 10
    end
    object sqlmanutfpgosc_dtnemi: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'osc_dtnemi'
      Origin = 'osc_dtnemi'
    end
    object sqlmanutfpgosc_chvnfe: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'osc_chvnfe'
      Origin = 'osc_chvnfe'
      Size = 24
    end
    object sqlmanutfpgosc_fatura: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'osc_fatura'
      Origin = 'osc_fatura'
    end
    object sqlmanutfpgosc_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'osc_usuinc'
      Origin = 'osc_usuinc'
      Size = 15
    end
    object sqlmanutfpgosc_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'osc_datinc'
      Origin = 'osc_datinc'
    end
    object sqlmanutfpgosc_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'osc_horinc'
      Origin = 'osc_horinc'
      Size = 8
    end
    object sqlmanutfpgosc_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'osc_usualt'
      Origin = 'osc_usualt'
      Size = 15
    end
    object sqlmanutfpgosc_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'osc_datalt'
      Origin = 'osc_datalt'
    end
    object sqlmanutfpgosc_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'osc_horalt'
      Origin = 'osc_horalt'
      Size = 8
    end
    object sqlmanutfpgtotal: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'total'
      Origin = 'total'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
  end
  object SqlOrdcoleta: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'SELECT * From "99999999999999_TESTE".ordcoleta'
      
        'LEFT JOIN "99999999999999_TESTE".veiculoatv on vat_placa = odc_c' +
        'odpl1'
      
        'LEFT JOIN "99999999999999_TESTE".cliente on cli_codigo = odc_cod' +
        'cli'
      
        'LEFT JOIN "99999999999999_TESTE".trmcoleta on tmc_codigo = odc_c' +
        'odtmc'
      
        'LEFT JOIN "99999999999999_TESTE".trmcoleta as tme on tme.tmc_cod' +
        'igo = odc_codtme'
      
        'LEFT JOIN "99999999999999_TESTE".oricarga on ocg_codigo = odc_co' +
        'docg'
      
        'LEFT JOIN "99999999999999_TESTE".navio on nav_codigo = odc_codna' +
        'v'
      
        'LEFT JOIN "99999999999999_TESTE".tpcontainer on tcn_codigo = odc' +
        '_codtcn'
      
        'LEFT JOIN "99999999999999_TESTE".pessoal on pss_codigo = odc_cod' +
        'pss')
    Left = 1320
    Top = 648
    object SqlOrdcoletaodc_codigo: TIntegerField
      FieldName = 'odc_codigo'
      Origin = 'odc_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object SqlOrdcoletaodc_datems: TDateField
      FieldName = 'odc_datems'
      Origin = 'odc_datems'
    end
    object SqlOrdcoletaodc_horems: TStringField
      FieldName = 'odc_horems'
      Origin = 'odc_horems'
      Size = 4
    end
    object SqlOrdcoletaodc_codcli: TIntegerField
      FieldName = 'odc_codcli'
      Origin = 'odc_codcli'
    end
    object SqlOrdcoletaodc_codtmc: TIntegerField
      FieldName = 'odc_codtmc'
      Origin = 'odc_codtmc'
    end
    object SqlOrdcoletaodc_codtme: TIntegerField
      FieldName = 'odc_codtme'
      Origin = 'odc_codtme'
    end
    object SqlOrdcoletaodc_codocg: TIntegerField
      FieldName = 'odc_codocg'
      Origin = 'odc_codocg'
    end
    object SqlOrdcoletaodc_codtcn: TIntegerField
      FieldName = 'odc_codtcn'
      Origin = 'odc_codtcn'
    end
    object SqlOrdcoletaodc_codnav: TIntegerField
      FieldName = 'odc_codnav'
      Origin = 'odc_codnav'
    end
    object SqlOrdcoletaodc_codpss: TIntegerField
      FieldName = 'odc_codpss'
      Origin = 'odc_codpss'
    end
    object SqlOrdcoletaodc_codpl1: TStringField
      FieldName = 'odc_codpl1'
      Origin = 'odc_codpl1'
      Size = 7
    end
    object SqlOrdcoletaodc_codpl2: TStringField
      FieldName = 'odc_codpl2'
      Origin = 'odc_codpl2'
      Size = 7
    end
    object SqlOrdcoletaodc_sgcarga: TBooleanField
      FieldName = 'odc_sgcarga'
      Origin = 'odc_sgcarga'
    end
    object SqlOrdcoletaodc_vlrscg: TBCDField
      FieldName = 'odc_vlrscg'
      Origin = 'odc_vlrscg'
      Precision = 15
      Size = 2
    end
    object SqlOrdcoletaodc_sgequip: TBooleanField
      FieldName = 'odc_sgequip'
      Origin = 'odc_sgequip'
    end
    object SqlOrdcoletaodc_vlreqp: TBCDField
      FieldName = 'odc_vlreqp'
      Origin = 'odc_vlreqp'
      Precision = 15
      Size = 2
    end
    object SqlOrdcoletaodc_nmrctn: TStringField
      FieldName = 'odc_nmrctn'
      Origin = 'odc_nmrctn'
      Size = 15
    end
    object SqlOrdcoletaodc_lctrl01: TStringField
      FieldName = 'odc_lctrl01'
      Origin = 'odc_lctrl01'
      Size = 15
    end
    object SqlOrdcoletaodc_genset01: TStringField
      FieldName = 'odc_genset01'
      Origin = 'odc_genset01'
      Size = 15
    end
    object SqlOrdcoletaodc_booking: TStringField
      FieldName = 'odc_booking'
      Origin = 'odc_booking'
      Size = 15
    end
    object SqlOrdcoletaodc_obs: TMemoField
      FieldName = 'odc_obs'
      Origin = 'odc_obs'
      BlobType = ftMemo
    end
    object SqlOrdcoletaodc_usuinc: TStringField
      FieldName = 'odc_usuinc'
      Origin = 'odc_usuinc'
      Size = 15
    end
    object SqlOrdcoletaodc_datinc: TDateField
      FieldName = 'odc_datinc'
      Origin = 'odc_datinc'
    end
    object SqlOrdcoletaodc_horinc: TStringField
      FieldName = 'odc_horinc'
      Origin = 'odc_horinc'
      Size = 8
    end
    object SqlOrdcoletaodc_usualt: TStringField
      FieldName = 'odc_usualt'
      Origin = 'odc_usualt'
      Size = 15
    end
    object SqlOrdcoletaodc_datalt: TDateField
      FieldName = 'odc_datalt'
      Origin = 'odc_datalt'
    end
    object SqlOrdcoletaodc_horalt: TStringField
      FieldName = 'odc_horalt'
      Origin = 'odc_horalt'
      Size = 8
    end
    object SqlOrdcoletavat_placa: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_placa'
      Origin = 'vat_placa'
      Size = 7
    end
    object SqlOrdcoletavat_nrfrota: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_nrfrota'
      Origin = 'vat_nrfrota'
      Size = 5
    end
    object SqlOrdcoletavat_paestversa: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_paestversa'
      Origin = 'vat_paestversa'
      Size = 5
    end
    object SqlOrdcoletavat_chip: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_chip'
      Origin = 'vat_chip'
      Size = 10
    end
    object SqlOrdcoletavat_cartao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_cartao'
      Origin = 'vat_cartao'
      Size = 15
    end
    object SqlOrdcoletavat_chassi: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_chassi'
      Origin = 'vat_chassi'
      Size = 17
    end
    object SqlOrdcoletavat_licenc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_licenc'
      Origin = 'vat_licenc'
      Size = 15
    end
    object SqlOrdcoletavat_renavan: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_renavan'
      Origin = 'vat_renavan'
      Size = 15
    end
    object SqlOrdcoletavat_dut: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_dut'
      Origin = 'vat_dut'
      Size = 10
    end
    object SqlOrdcoletavat_codltd: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codltd'
      Origin = 'vat_codltd'
    end
    object SqlOrdcoletavat_codtip: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codtip'
      Origin = 'vat_codtip'
    end
    object SqlOrdcoletavat_codmdl: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codmdl'
      Origin = 'vat_codmdl'
    end
    object SqlOrdcoletavat_codmrc: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codmrc'
      Origin = 'vat_codmrc'
    end
    object SqlOrdcoletavat_codcor: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codcor'
      Origin = 'vat_codcor'
    end
    object SqlOrdcoletavat_codcid: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codcid'
      Origin = 'vat_codcid'
    end
    object SqlOrdcoletavat_codgrm: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vat_codgrm'
      Origin = 'vat_codgrm'
    end
    object SqlOrdcoletavat_cor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_cor'
      Origin = 'vat_cor'
    end
    object SqlOrdcoletavat_status: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_status'
      Origin = 'vat_status'
      Size = 15
    end
    object SqlOrdcoletavat_tanque1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_tanque1'
      Origin = 'vat_tanque1'
      Precision = 7
      Size = 0
    end
    object SqlOrdcoletavat_tanque2: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_tanque2'
      Origin = 'vat_tanque2'
      Precision = 7
      Size = 0
    end
    object SqlOrdcoletavat_tanque3: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_tanque3'
      Origin = 'vat_tanque3'
      Precision = 7
      Size = 0
    end
    object SqlOrdcoletavat_kmini: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_kmini'
      Origin = 'vat_kmini'
      Precision = 7
      Size = 0
    end
    object SqlOrdcoletavat_kmatu: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_kmatu'
      Origin = 'vat_kmatu'
      Precision = 7
      Size = 0
    end
    object SqlOrdcoletavat_anofbmd: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_anofbmd'
      Origin = 'vat_anofbmd'
      Size = 8
    end
    object SqlOrdcoletavat_termo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_termo'
      Origin = 'vat_termo'
      Size = 8
    end
    object SqlOrdcoletavat_tombo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_tombo'
      Origin = 'vat_tombo'
      Size = 10
    end
    object SqlOrdcoletavat_estado: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_estado'
      Origin = 'vat_estado'
      Size = 15
    end
    object SqlOrdcoletavat_qtdpass: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_qtdpass'
      Origin = 'vat_qtdpass'
      Size = 2
    end
    object SqlOrdcoletavat_potenc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_potenc'
      Origin = 'vat_potenc'
      Size = 5
    end
    object SqlOrdcoletavat_kgbruto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_kgbruto'
      Origin = 'vat_kgbruto'
      Precision = 7
      Size = 0
    end
    object SqlOrdcoletavat_kgcarga: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_kgcarga'
      Origin = 'vat_kgcarga'
      Precision = 7
      Size = 0
    end
    object SqlOrdcoletavat_clindad: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_clindad'
      Origin = 'vat_clindad'
      Size = 4
    end
    object SqlOrdcoletavat_nrmotor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_nrmotor'
      Origin = 'vat_nrmotor'
      Size = 15
    end
    object SqlOrdcoletavat_cavalo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_cavalo'
      Origin = 'vat_cavalo'
      Size = 10
    end
    object SqlOrdcoletavat_foto: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'vat_foto'
      Origin = 'vat_foto'
    end
    object SqlOrdcoletavat_obs: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'vat_obs'
      Origin = 'vat_obs'
      BlobType = ftMemo
    end
    object SqlOrdcoletavat_vlrcmp: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vat_vlrcmp'
      Origin = 'vat_vlrcmp'
      Precision = 15
      Size = 2
    end
    object SqlOrdcoletavat_datcmp: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'vat_datcmp'
      Origin = 'vat_datcmp'
    end
    object SqlOrdcoletavat_nfecmp: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_nfecmp'
      Origin = 'vat_nfecmp'
      Size = 10
    end
    object SqlOrdcoletavat_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_usuinc'
      Origin = 'vat_usuinc'
      Size = 15
    end
    object SqlOrdcoletavat_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'vat_datinc'
      Origin = 'vat_datinc'
    end
    object SqlOrdcoletavat_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_horinc'
      Origin = 'vat_horinc'
      Size = 8
    end
    object SqlOrdcoletavat_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_usualt'
      Origin = 'vat_usualt'
      Size = 15
    end
    object SqlOrdcoletavat_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'vat_datalt'
      Origin = 'vat_datalt'
    end
    object SqlOrdcoletavat_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vat_horalt'
      Origin = 'vat_horalt'
      Size = 8
    end
    object SqlOrdcoletacli_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cli_codigo'
      Origin = 'cli_codigo'
    end
    object SqlOrdcoletacli_tipo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cli_tipo'
      Origin = 'cli_tipo'
      Size = 10
    end
    object SqlOrdcoletacli_ativo: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'cli_ativo'
      Origin = 'cli_ativo'
    end
    object SqlOrdcoletacli_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cli_nome'
      Origin = 'cli_nome'
      Size = 50
    end
    object SqlOrdcoletacli_fantasia: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cli_fantasia'
      Origin = 'cli_fantasia'
      Size = 50
    end
    object SqlOrdcoletacli_codgcl: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cli_codgcl'
      Origin = 'cli_codgcl'
    end
    object SqlOrdcoletacli_codcgo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cli_codcgo'
      Origin = 'cli_codcgo'
    end
    object SqlOrdcoletacli_datnas: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cli_datnas'
      Origin = 'cli_datnas'
    end
    object SqlOrdcoletacli_diapag: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cli_diapag'
      Origin = 'cli_diapag'
      Size = 2
    end
    object SqlOrdcoletacli_ecivil: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cli_ecivil'
      Origin = 'cli_ecivil'
      Size = 15
    end
    object SqlOrdcoletacli_nompal: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cli_nompal'
      Origin = 'cli_nompal'
      Size = 50
    end
    object SqlOrdcoletacli_nommae: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cli_nommae'
      Origin = 'cli_nommae'
      Size = 50
    end
    object SqlOrdcoletacli_cpfcnpj: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cli_cpfcnpj'
      Origin = 'cli_cpfcnpj'
      Size = 14
    end
    object SqlOrdcoletacli_rgiest: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cli_rgiest'
      Origin = 'cli_rgiest'
      Size = 15
    end
    object SqlOrdcoletacli_imunic: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cli_imunic'
      Origin = 'cli_imunic'
      Size = 15
    end
    object SqlOrdcoletacli_rgexped: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cli_rgexped'
      Origin = 'cli_rgexped'
    end
    object SqlOrdcoletacli_rgdata: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cli_rgdata'
      Origin = 'cli_rgdata'
    end
    object SqlOrdcoletacli_cep: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cli_cep'
      Origin = 'cli_cep'
      Size = 8
    end
    object SqlOrdcoletacli_endereco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cli_endereco'
      Origin = 'cli_endereco'
      Size = 50
    end
    object SqlOrdcoletacli_complem: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cli_complem'
      Origin = 'cli_complem'
      Size = 25
    end
    object SqlOrdcoletacli_numres: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cli_numres'
      Origin = 'cli_numres'
      Size = 6
    end
    object SqlOrdcoletacli_bairro: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cli_bairro'
      Origin = 'cli_bairro'
      Size = 50
    end
    object SqlOrdcoletacli_codcid: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cli_codcid'
      Origin = 'cli_codcid'
    end
    object SqlOrdcoletacli_cepcob: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cli_cepcob'
      Origin = 'cli_cepcob'
      Size = 8
    end
    object SqlOrdcoletacli_endcob: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cli_endcob'
      Origin = 'cli_endcob'
      Size = 50
    end
    object SqlOrdcoletacli_comcob: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cli_comcob'
      Origin = 'cli_comcob'
      Size = 25
    end
    object SqlOrdcoletacli_numcob: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cli_numcob'
      Origin = 'cli_numcob'
      Size = 6
    end
    object SqlOrdcoletacli_baicob: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cli_baicob'
      Origin = 'cli_baicob'
      Size = 50
    end
    object SqlOrdcoletacli_codcdc: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cli_codcdc'
      Origin = 'cli_codcdc'
    end
    object SqlOrdcoletacli_repend: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'cli_repend'
      Origin = 'cli_repend'
    end
    object SqlOrdcoletacli_telef01: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cli_telef01'
      Origin = 'cli_telef01'
      Size = 12
    end
    object SqlOrdcoletacli_telef02: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cli_telef02'
      Origin = 'cli_telef02'
      Size = 12
    end
    object SqlOrdcoletacli_celular: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cli_celular'
      Origin = 'cli_celular'
      Size = 12
    end
    object SqlOrdcoletacli_email: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cli_email'
      Origin = 'cli_email'
      Size = 100
    end
    object SqlOrdcoletacli_emailsped: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cli_emailsped'
      Origin = 'cli_emailsped'
      Size = 100
    end
    object SqlOrdcoletacli_status: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cli_status'
      Origin = 'cli_status'
      Size = 15
    end
    object SqlOrdcoletacli_foto: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'cli_foto'
      Origin = 'cli_foto'
    end
    object SqlOrdcoletacli_obs: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'cli_obs'
      Origin = 'cli_obs'
      BlobType = ftMemo
    end
    object SqlOrdcoletacli_vlrlim: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'cli_vlrlim'
      Origin = 'cli_vlrlim'
      Precision = 15
      Size = 2
    end
    object SqlOrdcoletacli_vlrcre: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'cli_vlrcre'
      Origin = 'cli_vlrcre'
      Precision = 15
      Size = 2
    end
    object SqlOrdcoletacli_datcmp: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cli_datcmp'
      Origin = 'cli_datcmp'
    end
    object SqlOrdcoletacli_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cli_usuinc'
      Origin = 'cli_usuinc'
      Size = 15
    end
    object SqlOrdcoletacli_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cli_datinc'
      Origin = 'cli_datinc'
    end
    object SqlOrdcoletacli_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cli_horinc'
      Origin = 'cli_horinc'
      Size = 8
    end
    object SqlOrdcoletacli_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cli_usualt'
      Origin = 'cli_usualt'
      Size = 15
    end
    object SqlOrdcoletacli_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'cli_datalt'
      Origin = 'cli_datalt'
    end
    object SqlOrdcoletacli_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cli_horalt'
      Origin = 'cli_horalt'
      Size = 8
    end
    object SqlOrdcoletatmc_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_codigo'
      Origin = 'tmc_codigo'
    end
    object SqlOrdcoletatmc_ativo: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_ativo'
      Origin = 'tmc_ativo'
    end
    object SqlOrdcoletatmc_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_nome'
      Origin = 'tmc_nome'
      Size = 50
    end
    object SqlOrdcoletatmc_endereco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_endereco'
      Origin = 'tmc_endereco'
      Size = 35
    end
    object SqlOrdcoletatmc_numend: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_numend'
      Origin = 'tmc_numend'
      Size = 5
    end
    object SqlOrdcoletatmc_complem: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_complem'
      Origin = 'tmc_complem'
      Size = 25
    end
    object SqlOrdcoletatmc_bairro: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_bairro'
      Origin = 'tmc_bairro'
      Size = 50
    end
    object SqlOrdcoletatmc_cep: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_cep'
      Origin = 'tmc_cep'
      Size = 8
    end
    object SqlOrdcoletatmc_codcid: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_codcid'
      Origin = 'tmc_codcid'
    end
    object SqlOrdcoletatmc_telef1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_telef1'
      Origin = 'tmc_telef1'
      Size = 12
    end
    object SqlOrdcoletatmc_telef2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_telef2'
      Origin = 'tmc_telef2'
      Size = 12
    end
    object SqlOrdcoletatmc_celula: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_celula'
      Origin = 'tmc_celula'
      Size = 12
    end
    object SqlOrdcoletatmc_contato: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_contato'
      Origin = 'tmc_contato'
    end
    object SqlOrdcoletatmc_obs: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_obs'
      Origin = 'tmc_obs'
      BlobType = ftMemo
    end
    object SqlOrdcoletatmc_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_usuinc'
      Origin = 'tmc_usuinc'
      Size = 15
    end
    object SqlOrdcoletatmc_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_datinc'
      Origin = 'tmc_datinc'
    end
    object SqlOrdcoletatmc_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_horinc'
      Origin = 'tmc_horinc'
      Size = 8
    end
    object SqlOrdcoletatmc_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_usualt'
      Origin = 'tmc_usualt'
      Size = 15
    end
    object SqlOrdcoletatmc_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_datalt'
      Origin = 'tmc_datalt'
    end
    object SqlOrdcoletatmc_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_horalt'
      Origin = 'tmc_horalt'
      Size = 8
    end
    object SqlOrdcoletatmc_codigo_1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_codigo_1'
      Origin = 'tmc_codigo'
    end
    object SqlOrdcoletatmc_ativo_1: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_ativo_1'
      Origin = 'tmc_ativo'
    end
    object SqlOrdcoletatmc_nome_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_nome_1'
      Origin = 'tmc_nome'
      Size = 50
    end
    object SqlOrdcoletatmc_endereco_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_endereco_1'
      Origin = 'tmc_endereco'
      Size = 35
    end
    object SqlOrdcoletatmc_numend_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_numend_1'
      Origin = 'tmc_numend'
      Size = 5
    end
    object SqlOrdcoletatmc_complem_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_complem_1'
      Origin = 'tmc_complem'
      Size = 25
    end
    object SqlOrdcoletatmc_bairro_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_bairro_1'
      Origin = 'tmc_bairro'
      Size = 50
    end
    object SqlOrdcoletatmc_cep_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_cep_1'
      Origin = 'tmc_cep'
      Size = 8
    end
    object SqlOrdcoletatmc_codcid_1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_codcid_1'
      Origin = 'tmc_codcid'
    end
    object SqlOrdcoletatmc_telef1_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_telef1_1'
      Origin = 'tmc_telef1'
      Size = 12
    end
    object SqlOrdcoletatmc_telef2_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_telef2_1'
      Origin = 'tmc_telef2'
      Size = 12
    end
    object SqlOrdcoletatmc_celula_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_celula_1'
      Origin = 'tmc_celula'
      Size = 12
    end
    object SqlOrdcoletatmc_contato_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_contato_1'
      Origin = 'tmc_contato'
    end
    object SqlOrdcoletatmc_obs_1: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_obs_1'
      Origin = 'tmc_obs'
      BlobType = ftMemo
    end
    object SqlOrdcoletatmc_usuinc_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_usuinc_1'
      Origin = 'tmc_usuinc'
      Size = 15
    end
    object SqlOrdcoletatmc_datinc_1: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_datinc_1'
      Origin = 'tmc_datinc'
    end
    object SqlOrdcoletatmc_horinc_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_horinc_1'
      Origin = 'tmc_horinc'
      Size = 8
    end
    object SqlOrdcoletatmc_usualt_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_usualt_1'
      Origin = 'tmc_usualt'
      Size = 15
    end
    object SqlOrdcoletatmc_datalt_1: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_datalt_1'
      Origin = 'tmc_datalt'
    end
    object SqlOrdcoletatmc_horalt_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tmc_horalt_1'
      Origin = 'tmc_horalt'
      Size = 8
    end
    object SqlOrdcoletaocg_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ocg_codigo'
      Origin = 'ocg_codigo'
    end
    object SqlOrdcoletaocg_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ocg_nome'
      Origin = 'ocg_nome'
      Size = 45
    end
    object SqlOrdcoletaocg_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ocg_usuinc'
      Origin = 'ocg_usuinc'
      Size = 15
    end
    object SqlOrdcoletaocg_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'ocg_datinc'
      Origin = 'ocg_datinc'
    end
    object SqlOrdcoletaocg_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ocg_horinc'
      Origin = 'ocg_horinc'
      Size = 8
    end
    object SqlOrdcoletaocg_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ocg_usualt'
      Origin = 'ocg_usualt'
      Size = 15
    end
    object SqlOrdcoletaocg_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'ocg_datalt'
      Origin = 'ocg_datalt'
    end
    object SqlOrdcoletaocg_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ocg_horalt'
      Origin = 'ocg_horalt'
      Size = 8
    end
    object SqlOrdcoletanav_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'nav_codigo'
      Origin = 'nav_codigo'
    end
    object SqlOrdcoletanav_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nav_nome'
      Origin = 'nav_nome'
      Size = 45
    end
    object SqlOrdcoletanav_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nav_usuinc'
      Origin = 'nav_usuinc'
      Size = 15
    end
    object SqlOrdcoletanav_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'nav_datinc'
      Origin = 'nav_datinc'
    end
    object SqlOrdcoletanav_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nav_horinc'
      Origin = 'nav_horinc'
      Size = 8
    end
    object SqlOrdcoletanav_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nav_usualt'
      Origin = 'nav_usualt'
      Size = 15
    end
    object SqlOrdcoletanav_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'nav_datalt'
      Origin = 'nav_datalt'
    end
    object SqlOrdcoletanav_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nav_horalt'
      Origin = 'nav_horalt'
      Size = 8
    end
    object SqlOrdcoletatcn_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'tcn_codigo'
      Origin = 'tcn_codigo'
    end
    object SqlOrdcoletatcn_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tcn_nome'
      Origin = 'tcn_nome'
      Size = 45
    end
    object SqlOrdcoletatcn_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tcn_usuinc'
      Origin = 'tcn_usuinc'
      Size = 15
    end
    object SqlOrdcoletatcn_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'tcn_datinc'
      Origin = 'tcn_datinc'
    end
    object SqlOrdcoletatcn_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tcn_horinc'
      Origin = 'tcn_horinc'
      Size = 8
    end
    object SqlOrdcoletatcn_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tcn_usualt'
      Origin = 'tcn_usualt'
      Size = 15
    end
    object SqlOrdcoletatcn_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'tcn_datalt'
      Origin = 'tcn_datalt'
    end
    object SqlOrdcoletatcn_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tcn_horalt'
      Origin = 'tcn_horalt'
      Size = 8
    end
    object SqlOrdcoletapss_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'pss_codigo'
      Origin = 'pss_codigo'
    end
    object SqlOrdcoletapss_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_nome'
      Origin = 'pss_nome'
      Size = 50
    end
    object SqlOrdcoletapss_apelido: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_apelido'
      Origin = 'pss_apelido'
    end
    object SqlOrdcoletapss_codcgo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'pss_codcgo'
      Origin = 'pss_codcgo'
    end
    object SqlOrdcoletapss_codltd: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'pss_codltd'
      Origin = 'pss_codltd'
    end
    object SqlOrdcoletapss_datnas: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pss_datnas'
      Origin = 'pss_datnas'
    end
    object SqlOrdcoletapss_sexo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_sexo'
      Origin = 'pss_sexo'
      Size = 1
    end
    object SqlOrdcoletapss_ecivil: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_ecivil'
      Origin = 'pss_ecivil'
      Size = 15
    end
    object SqlOrdcoletapss_tpsangue: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_tpsangue'
      Origin = 'pss_tpsangue'
      Size = 3
    end
    object SqlOrdcoletapss_nompal: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_nompal'
      Origin = 'pss_nompal'
      Size = 50
    end
    object SqlOrdcoletapss_nommae: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_nommae'
      Origin = 'pss_nommae'
      Size = 50
    end
    object SqlOrdcoletapss_cpf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_cpf'
      Origin = 'pss_cpf'
      Size = 11
    end
    object SqlOrdcoletapss_rg: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_rg'
      Origin = 'pss_rg'
      Size = 15
    end
    object SqlOrdcoletapss_rgexped: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_rgexped'
      Origin = 'pss_rgexped'
    end
    object SqlOrdcoletapss_rgdata: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pss_rgdata'
      Origin = 'pss_rgdata'
    end
    object SqlOrdcoletapss_pispasep: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_pispasep'
      Origin = 'pss_pispasep'
      Size = 14
    end
    object SqlOrdcoletapss_numctps: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_numctps'
      Origin = 'pss_numctps'
      Size = 14
    end
    object SqlOrdcoletapss_habilitac: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_habilitac'
      Origin = 'pss_habilitac'
      Size = 11
    end
    object SqlOrdcoletapss_hbemite: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pss_hbemite'
      Origin = 'pss_hbemite'
    end
    object SqlOrdcoletapss_hbvalid: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pss_hbvalid'
      Origin = 'pss_hbvalid'
    end
    object SqlOrdcoletapss_hbcateg: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_hbcateg'
      Origin = 'pss_hbcateg'
      Size = 4
    end
    object SqlOrdcoletapss_nrtitulo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_nrtitulo'
      Origin = 'pss_nrtitulo'
      Size = 14
    end
    object SqlOrdcoletapss_nrreserv: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_nrreserv'
      Origin = 'pss_nrreserv'
      Size = 14
    end
    object SqlOrdcoletapss_cep: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_cep'
      Origin = 'pss_cep'
      Size = 8
    end
    object SqlOrdcoletapss_endereco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_endereco'
      Origin = 'pss_endereco'
      Size = 50
    end
    object SqlOrdcoletapss_complem: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_complem'
      Origin = 'pss_complem'
      Size = 25
    end
    object SqlOrdcoletapss_numres: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_numres'
      Origin = 'pss_numres'
      Size = 6
    end
    object SqlOrdcoletapss_bairro: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_bairro'
      Origin = 'pss_bairro'
      Size = 50
    end
    object SqlOrdcoletapss_codcid: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'pss_codcid'
      Origin = 'pss_codcid'
    end
    object SqlOrdcoletapss_tpimove: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_tpimove'
      Origin = 'pss_tpimove'
      Size = 15
    end
    object SqlOrdcoletapss_tpresid: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_tpresid'
      Origin = 'pss_tpresid'
      Size = 15
    end
    object SqlOrdcoletapss_telef01: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_telef01'
      Origin = 'pss_telef01'
      Size = 12
    end
    object SqlOrdcoletapss_telef02: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_telef02'
      Origin = 'pss_telef02'
      Size = 12
    end
    object SqlOrdcoletapss_celular: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_celular'
      Origin = 'pss_celular'
      Size = 12
    end
    object SqlOrdcoletapss_email: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_email'
      Origin = 'pss_email'
      Size = 100
    end
    object SqlOrdcoletapss_status: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_status'
      Origin = 'pss_status'
      Size = 15
    end
    object SqlOrdcoletapss_foto: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'pss_foto'
      Origin = 'pss_foto'
    end
    object SqlOrdcoletapss_obs: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'pss_obs'
      Origin = 'pss_obs'
      BlobType = ftMemo
    end
    object SqlOrdcoletapss_vlrrenda: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'pss_vlrrenda'
      Origin = 'pss_vlrrenda'
      Precision = 15
      Size = 2
    end
    object SqlOrdcoletapss_vlrvale: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'pss_vlrvale'
      Origin = 'pss_vlrvale'
      Precision = 15
      Size = 2
    end
    object SqlOrdcoletapss_datcmp: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pss_datcmp'
      Origin = 'pss_datcmp'
    end
    object SqlOrdcoletapss_nfecmp: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_nfecmp'
      Origin = 'pss_nfecmp'
      Size = 10
    end
    object SqlOrdcoletapss_codpcv: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_codpcv'
      Origin = 'pss_codpcv'
      Size = 10
    end
    object SqlOrdcoletapss_codpcr: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_codpcr'
      Origin = 'pss_codpcr'
      Size = 10
    end
    object SqlOrdcoletapss_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_usuinc'
      Origin = 'pss_usuinc'
      Size = 15
    end
    object SqlOrdcoletapss_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pss_datinc'
      Origin = 'pss_datinc'
    end
    object SqlOrdcoletapss_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_horinc'
      Origin = 'pss_horinc'
      Size = 8
    end
    object SqlOrdcoletapss_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_usualt'
      Origin = 'pss_usualt'
      Size = 15
    end
    object SqlOrdcoletapss_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pss_datalt'
      Origin = 'pss_datalt'
    end
    object SqlOrdcoletapss_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pss_horalt'
      Origin = 'pss_horalt'
      Size = 8
    end
  end
  object sqlordcoletatbr: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      'SELECT * from "99999999999999_TESTE".ordcoletatbr'
      'LEFT JOIN "dbconfig".tbrecurso on tbr_codigo = orc_codtbr')
    Left = 1320
    Top = 698
    object sqlordcoletatbrorc_codigo: TIntegerField
      FieldName = 'orc_codigo'
      Origin = 'orc_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlordcoletatbrorc_cododc: TIntegerField
      FieldName = 'orc_cododc'
      Origin = 'orc_cododc'
    end
    object sqlordcoletatbrorc_codtbr: TIntegerField
      FieldName = 'orc_codtbr'
      Origin = 'orc_codtbr'
    end
    object sqlordcoletatbrorc_vlrrec: TBCDField
      FieldName = 'orc_vlrrec'
      Origin = 'orc_vlrrec'
      Precision = 15
      Size = 2
    end
    object sqlordcoletatbrorc_usuinc: TStringField
      FieldName = 'orc_usuinc'
      Origin = 'orc_usuinc'
      Size = 15
    end
    object sqlordcoletatbrorc_datinc: TDateField
      FieldName = 'orc_datinc'
      Origin = 'orc_datinc'
    end
    object sqlordcoletatbrorc_horinc: TStringField
      FieldName = 'orc_horinc'
      Origin = 'orc_horinc'
      Size = 8
    end
    object sqlordcoletatbrorc_usualt: TStringField
      FieldName = 'orc_usualt'
      Origin = 'orc_usualt'
      Size = 15
    end
    object sqlordcoletatbrorc_datalt: TDateField
      FieldName = 'orc_datalt'
      Origin = 'orc_datalt'
    end
    object sqlordcoletatbrorc_horalt: TStringField
      FieldName = 'orc_horalt'
      Origin = 'orc_horalt'
      Size = 8
    end
    object sqlordcoletatbrtbr_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'tbr_codigo'
      Origin = 'tbr_codigo'
    end
    object sqlordcoletatbrtbr_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tbr_nome'
      Origin = 'tbr_nome'
      Size = 25
    end
    object sqlordcoletatbrtbr_codpct: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tbr_codpct'
      Origin = 'tbr_codpct'
      Size = 10
    end
    object sqlordcoletatbrtbr_vlrrec: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tbr_vlrrec'
      Origin = 'tbr_vlrrec'
      Precision = 15
      Size = 2
    end
    object sqlordcoletatbrtbr_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tbr_usuinc'
      Origin = 'tbr_usuinc'
      Size = 15
    end
    object sqlordcoletatbrtbr_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'tbr_datinc'
      Origin = 'tbr_datinc'
    end
    object sqlordcoletatbrtbr_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tbr_horinc'
      Origin = 'tbr_horinc'
      Size = 8
    end
    object sqlordcoletatbrtbr_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tbr_usualt'
      Origin = 'tbr_usualt'
      Size = 15
    end
    object sqlordcoletatbrtbr_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'tbr_datalt'
      Origin = 'tbr_datalt'
    end
    object sqlordcoletatbrtbr_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tbr_horalt'
      Origin = 'tbr_horalt'
      Size = 8
    end
  end
  object sqlordcoletatrt: TFDQuery
    Connection = SqlConSis
    SQL.Strings = (
      
        'SELECT *, (otr_vlrrot * otr_qtdrot  ) as total from "99999999999' +
        '999_TESTE".ordcoletatrt'
      
        'LEFT JOIN "99999999999999_TESTE".roteiro on rto_codigo = otr_cod' +
        'rto')
    Left = 1320
    Top = 753
    object sqlordcoletatrtotr_codigo: TIntegerField
      FieldName = 'otr_codigo'
      Origin = 'otr_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlordcoletatrtotr_cododc: TIntegerField
      FieldName = 'otr_cododc'
      Origin = 'otr_cododc'
    end
    object sqlordcoletatrtotr_codrto: TIntegerField
      FieldName = 'otr_codrto'
      Origin = 'otr_codrto'
    end
    object sqlordcoletatrtotr_vlrrot: TBCDField
      FieldName = 'otr_vlrrot'
      Origin = 'otr_vlrrot'
      Precision = 15
      Size = 2
    end
    object sqlordcoletatrtotr_qtdrot: TBCDField
      FieldName = 'otr_qtdrot'
      Origin = 'otr_qtdrot'
      Precision = 15
      Size = 0
    end
    object sqlordcoletatrtotr_usuinc: TStringField
      FieldName = 'otr_usuinc'
      Origin = 'otr_usuinc'
      Size = 15
    end
    object sqlordcoletatrtotr_datinc: TDateField
      FieldName = 'otr_datinc'
      Origin = 'otr_datinc'
    end
    object sqlordcoletatrtotr_horinc: TStringField
      FieldName = 'otr_horinc'
      Origin = 'otr_horinc'
      Size = 8
    end
    object sqlordcoletatrtotr_usualt: TStringField
      FieldName = 'otr_usualt'
      Origin = 'otr_usualt'
      Size = 15
    end
    object sqlordcoletatrtotr_datalt: TDateField
      FieldName = 'otr_datalt'
      Origin = 'otr_datalt'
    end
    object sqlordcoletatrtotr_horalt: TStringField
      FieldName = 'otr_horalt'
      Origin = 'otr_horalt'
      Size = 8
    end
    object sqlordcoletatrtrto_codigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'rto_codigo'
      Origin = 'rto_codigo'
    end
    object sqlordcoletatrtrto_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'rto_nome'
      Origin = 'rto_nome'
      Size = 50
    end
    object sqlordcoletatrtrto_vlrrot: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'rto_vlrrot'
      Origin = 'rto_vlrrot'
      Precision = 15
      Size = 2
    end
    object sqlordcoletatrtrto_vlrcre: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'rto_vlrcre'
      Origin = 'rto_vlrcre'
      Precision = 15
      Size = 2
    end
    object sqlordcoletatrtrto_vlrcms: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'rto_vlrcms'
      Origin = 'rto_vlrcms'
      Precision = 15
      Size = 2
    end
    object sqlordcoletatrtrto_codpct: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'rto_codpct'
      Origin = 'rto_codpct'
      Size = 10
    end
    object sqlordcoletatrtrto_usuinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'rto_usuinc'
      Origin = 'rto_usuinc'
      Size = 15
    end
    object sqlordcoletatrtrto_datinc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'rto_datinc'
      Origin = 'rto_datinc'
    end
    object sqlordcoletatrtrto_horinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'rto_horinc'
      Origin = 'rto_horinc'
      Size = 8
    end
    object sqlordcoletatrtrto_usualt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'rto_usualt'
      Origin = 'rto_usualt'
      Size = 15
    end
    object sqlordcoletatrtrto_datalt: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'rto_datalt'
      Origin = 'rto_datalt'
    end
    object sqlordcoletatrtrto_horalt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'rto_horalt'
      Origin = 'rto_horalt'
      Size = 8
    end
    object sqlordcoletatrttotal: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'total'
      Origin = 'total'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
  end
end
