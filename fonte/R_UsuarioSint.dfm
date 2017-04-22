object frmRUsuarioSint: TfrmRUsuarioSint
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rios de Vendas por Usu'#225'rios '
  ClientHeight = 230
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 3
    Top = 2
    Width = 436
    Height = 192
    Caption = 'Dados de Pesquisa'
    TabOrder = 0
    object Button1: TButton
      Left = 11
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object frxVendas: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42132.455295231500000000
    ReportOptions.LastChange = 42132.458951157400000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 32
    Top = 104
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 290.000000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 60.472480000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 3.559060000000000000
          Width = 253.228510000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial Black'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'GrafCarlos ')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 3.000000000000000000
          Top = 34.677180000000000000
          Width = 253.228510000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Relat'#243'rio de Vendas por Usu'#225'rios')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 3.779530000000000000
          Top = 56.692950000000000000
          Width = 714.331170000000000000
          Color = clBlack
          Diagonal = True
        end
      end
    end
  end
  object sqlMovIngre: TZQuery
    Connection = dmEmp.SqlConEmp
    Active = True
    SQL.Strings = (
      'select * from "99999999999999_FARMA".movingresso')
    Params = <>
    Left = 96
    Top = 110
    object sqlMovIngremvi_codigo: TWideStringField
      FieldName = 'mvi_codigo'
      Required = True
      Size = 8
    end
    object sqlMovIngremvi_nmevent: TWideStringField
      FieldName = 'mvi_nmevent'
      Size = 60
    end
    object sqlMovIngremvi_cdbarra: TWideStringField
      FieldName = 'mvi_cdbarra'
      Size = 32
    end
    object sqlMovIngremvi_nrcard: TWideStringField
      FieldName = 'mvi_nrcard'
      Size = 8
    end
    object sqlMovIngremvi_imgtop: TWideStringField
      FieldName = 'mvi_imgtop'
      Size = 500
    end
    object sqlMovIngremvi_imgbot: TWideStringField
      FieldName = 'mvi_imgbot'
      Size = 500
    end
    object sqlMovIngremvi_locevnt: TWideStringField
      FieldName = 'mvi_locevnt'
      Size = 60
    end
    object sqlMovIngremvi_horevnt: TWideStringField
      FieldName = 'mvi_horevnt'
      Size = 16
    end
    object sqlMovIngremvi_datevnt: TDateField
      FieldName = 'mvi_datevnt'
    end
    object sqlMovIngremvi_taxevnt: TFloatField
      FieldName = 'mvi_taxevnt'
    end
    object sqlMovIngremvi_vlrevnt: TFloatField
      FieldName = 'mvi_vlrevnt'
    end
    object sqlMovIngremvi_strevnt: TWideStringField
      FieldName = 'mvi_strevnt'
      Size = 40
    end
    object sqlMovIngremvi_lotevnt: TWideStringField
      FieldName = 'mvi_lotevnt'
      Size = 8
    end
    object sqlMovIngremvi_usuinc: TWideStringField
      FieldName = 'mvi_usuinc'
      Size = 30
    end
    object sqlMovIngremvi_datinc: TDateField
      FieldName = 'mvi_datinc'
    end
    object sqlMovIngremvi_horinc: TWideStringField
      FieldName = 'mvi_horinc'
      Size = 16
    end
    object sqlMovIngremvi_usualt: TWideStringField
      FieldName = 'mvi_usualt'
      Size = 30
    end
    object sqlMovIngremvi_datalt: TDateField
      FieldName = 'mvi_datalt'
    end
    object sqlMovIngremvi_horalt: TWideStringField
      FieldName = 'mvi_horalt'
      Size = 16
    end
  end
end
