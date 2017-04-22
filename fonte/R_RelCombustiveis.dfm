object frmRelComb: TfrmRelComb
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Relat'#243'rio'
  ClientHeight = 155
  ClientWidth = 349
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  DesignSize = (
    349
    155)
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 225
    Height = 136
    ExplicitHeight = 87
  end
  object StbRelat: TStatusBar
    Left = 0
    Top = 136
    Width = 349
    Height = 19
    Panels = <>
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 209
    Height = 73
    Caption = 'M'#243'dulo de Listagtem'
    TabOrder = 1
    object RCod: TRadioButton
      Left = 16
      Top = 20
      Width = 113
      Height = 17
      Caption = ' Ordem de &C'#243'digo'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RCodClick
    end
    object RDes: TRadioButton
      Left = 16
      Top = 43
      Width = 113
      Height = 17
      Caption = ' Ordem de &Alfab'#233'tica'
      TabOrder = 1
      OnClick = RDesClick
    end
  end
  object Button1: TButton
    Left = 248
    Top = 3
    Width = 95
    Height = 25
    Anchors = [akTop, akRight]
    Caption = '&Vizualizar'
    TabOrder = 2
    OnClick = Button1Click
  end
  object btnDesign: TButton
    Left = 249
    Top = 76
    Width = 95
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Design'
    TabOrder = 3
    OnClick = btnDesignClick
  end
  object Button3: TButton
    Left = 248
    Top = 29
    Width = 95
    Height = 25
    Anchors = [akTop, akRight]
    Caption = '&Imprimir'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 249
    Top = 103
    Width = 95
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Fechar'
    TabOrder = 5
    OnClick = Button4Click
  end
  object frxReportTab: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42222.668276481500000000
    ReportOptions.LastChange = 42223.649789583300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 16
    Top = 80
    Datasets = <
      item
        DataSet = frxDBDatasetCfg
        DataSetName = 'Configuracao'
      end
      item
        DataSet = frxDBDatSetPrin
        DataSetName = 'Principal'
      end>
    Variables = <
      item
        Name = ' Cabecalho'
        Value = Null
      end
      item
        Name = 'CAB01'
        Value = #39'SGT - SISTEMA DE GERENCIAMENTO DE TRANSPORTES 1.0'#39
      end
      item
        Name = 'CAB02'
        Value = #39'EMPRESA DE CALCADOS   -  CPNJ: 99.999.999/999999'#39
      end
      item
        Name = 'CAB03'
        Value = #39'LISTAGEM DE COMBUST'#205'VEIS: ORDENADO POR C'#211'DIGO'#39
      end
      item
        Name = 'CAB04'
        Value = Null
      end
      item
        Name = 'CAB05'
        Value = #39'administrador'#39
      end
      item
        Name = ' Rodape'
        Value = Null
      end
      item
        Name = 'RODA01'
        Value = Null
      end
      item
        Name = 'RODA02'
        Value = Null
      end
      item
        Name = 'RODA03'
        Value = Null
      end
      item
        Name = 'RODA04'
        Value = Null
      end
      item
        Name = 'RODA05'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 68.370130000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object CAB01: TfrxMemoView
          Left = 100.047310000000000000
          Width = 468.661720000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[CAB01]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 100.047310000000000000
          Top = 22.677180000000000000
          Width = 427.086890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[Uppercase(<Configuracao."fantasia">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 100.047310000000000000
          Top = 45.354360000000000000
          Width = 427.086890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            
              'CPNJ: [FormatMaskText('#39'999.999.999/9999-99;0;_'#39',<Configuracao."c' +
              'npj">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 534.252320000000000000
          Top = 23.897650000000000000
          Width = 185.196970000000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = 'dd mmm yyyy '#39'-'#39' hh:mm am/pm '
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          HAlign = haRight
          Memo.UTF8W = (
            '[Date] ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Date: TfrxMemoView
          Left = 572.047620000000000000
          Top = 1.220469999999999000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina(s): [Page#] de [TotalPages#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 534.590910000000000000
          Top = 45.133889999999990000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Usu'#225'rio:[Uppercase(<CAB05>)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 245.669450000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDatSetPrin
        DataSetName = 'Principal'
        RowCount = 0
        object Principalcmb_codigo: TfrxMemoView
          Left = 3.779530000000000000
          Top = 1.779529999999994000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataField = 'cmb_codigo'
          DataSet = frxDBDatSetPrin
          DataSetName = 'Principal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Principal."cmb_codigo"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 94.488250000000000000
          Top = 1.779529999999994000
          Width = 396.850650000000000000
          Height = 18.897650000000000000
          DataField = 'cmb_nome'
          DataSet = frxDBDatSetPrin
          DataSetName = 'Principal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Principal."cmb_nome"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 52.913420000000000000
        Top = 385.512060000000000000
        Width = 718.110700000000000000
        object Line2: TfrxLineView
          Left = -1.559060000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Diagonal = True
        end
        object RODA01: TfrxMemoView
          Left = 2.299320000000000000
          Top = 3.000000000000000000
          Width = 714.331170000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[Configuracao."endemp"], N'#186' [Configuracao."numemp"] [IIF(<Config' +
              'uracao."comemp"> <>'#39#39','#39', '#39'+<Configuracao."comemp">,'#39#39')]')
          ParentFont = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end
            item
            end>
        end
        object Memo1: TfrxMemoView
          Left = 2.299320000000000000
          Top = 18.897650000000000000
          Width = 714.331170000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Configuracao."nome_1"], [Uppercase(<Configuracao."uf">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 2.299320000000000000
          Top = 34.795300000000000000
          Width = 714.331170000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Email: [Configuracao."email"] / Site: [Configuracao."site"]')
          ParentFont = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end>
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 109.606370000000000000
        Width = 718.110700000000000000
        object Line3: TfrxLineView
          Top = 22.677179999999990000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Color = clGray
          Diagonal = True
        end
        object Memo6: TfrxMemoView
          Top = 0.779529999999994100
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[CAB03]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 200.315090000000000000
        Width = 718.110700000000000000
        object Memo7: TfrxMemoView
          Left = 3.779530000000000000
          Top = 2.779529999999994000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clGray
          Frame.Typ = [ftBottom]
          Fill.BackColor = clSilver
          Memo.UTF8W = (
            'C'#211'DIGO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 94.488250000000000000
          Top = 2.779529999999994000
          Width = 623.622450000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clGray
          Frame.Typ = [ftBottom]
          Fill.BackColor = clSilver
          Memo.UTF8W = (
            'DESCRI'#199#195'O')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 34.015770000000000000
        Top = 328.819110000000000000
        Width = 718.110700000000000000
        object Memo10: TfrxMemoView
          Left = 1.378170000000000000
          Top = 9.779530000000023000
          Width = 714.331170000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Color = clGray
          Frame.Typ = [ftTop]
          Memo.UTF8W = (
            'Total de Registro(s)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 131.063080000000000000
          Top = 10.559059999999990000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Color = clGray
          HAlign = haRight
          Memo.UTF8W = (
            '[COUNT(MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Picture1: TfrxPictureView
        Left = 4.000000000000000000
        Top = 16.118120000000000000
        Width = 91.259740000000000000
        Height = 67.921150000000000000
        Center = True
        DataField = 'logo'
        DataSet = frxDBDatasetCfg
        DataSetName = 'Configuracao'
        HightQuality = False
        Transparent = False
        TransparentColor = clWhite
      end
    end
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ExportEMF = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 16
    Top = 168
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    RowsCount = 0
    Split = ssNotSplit
    Left = 96
    Top = 168
  end
  object frxMailExport1: TfrxMailExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ShowExportDialog = True
    SmtpPort = 25
    UseIniFile = True
    TimeOut = 60
    ConfurmReading = False
    UseMAPI = SMTP
    Left = 176
    Top = 168
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    Left = 16
    Top = 216
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PictureType = gpPNG
    Wysiwyg = True
    Creator = 'FastReport'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    AutoSize = False
    Left = 96
    Top = 216
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    Left = 176
    Top = 216
  end
  object frxDBDatSetPrin: TfrxDBDataset
    UserName = 'Principal'
    CloseDataSource = False
    BCDToCurrency = False
    Left = 88
    Top = 80
  end
  object frxDBDatasetCfg: TfrxDBDataset
    UserName = 'Configuracao'
    CloseDataSource = False
    FieldAliases.Strings = (
      'codemp=codemp'
      'nome=nome'
      'fantasia=fantasia'
      'cnpj=cnpj'
      'dtbase=dtbase'
      'tipo=tipo'
      'situacao=situacao'
      'dtabertura=dtabertura'
      'endemp=endemp'
      'numemp=numemp'
      'comemp=comemp'
      'baiemp=baiemp'
      'codcid=codcid'
      'cepemp=cepemp'
      'telemp=telemp'
      'tl1emp=tl1emp'
      'tl2emp=tl2emp'
      'faxemp=faxemp'
      'insces=insces'
      'inscmu=inscmu'
      'sufram=sufram'
      'codcna=codcna'
      'codcrt=codcrt'
      'irpj=irpj'
      'pispasep=pispasep'
      'csll=csll'
      'cofins=cofins'
      'inss=inss'
      'iss=iss'
      'csticms=csticms'
      'cstpis=cstpis'
      'cstcofins=cstcofins'
      'cstipi=cstipi'
      'natcnpj=natcnpj'
      'atvprep=atvprep'
      'datexe=datexe'
      'horexe=horexe'
      'usuinc=usuinc'
      'datinc=datinc'
      'horinc=horinc'
      'usualt=usualt'
      'datalt=datalt'
      'horalt=horalt'
      'nome_1=nome_1'
      'uf=uf'
      'logo=logo'
      'site=site'
      'email=email')
    BCDToCurrency = False
    Left = 200
    Top = 80
  end
  object ZQPrim: TFDQuery
    Left = 192
    Top = 24
  end
end
