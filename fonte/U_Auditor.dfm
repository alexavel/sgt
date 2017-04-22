object frmAuditor: TfrmAuditor
  Left = 0
  Top = 0
  Caption = 'M'#243'dulo Auditor'
  ClientHeight = 504
  ClientWidth = 1078
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefaultSizeOnly
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1078
    Height = 81
    Align = alTop
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 1065
      Height = 73
      Caption = 'Painel de Controle:'
      TabOrder = 0
      object Label1: TLabel
        Left = 24
        Top = 18
        Width = 36
        Height = 13
        Caption = 'Usu'#225'rio'
      end
      object Label2: TLabel
        Left = 317
        Top = 20
        Width = 55
        Height = 13
        Caption = 'Data inicial:'
      end
      object Label3: TLabel
        Left = 442
        Top = 20
        Width = 52
        Height = 13
        Caption = 'Data Final:'
      end
      object cbxUsuario: TComboBox
        Left = 24
        Top = 39
        Width = 273
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        OnChange = cbxUsuarioChange
      end
      object datini: TDateTimePicker
        Left = 317
        Top = 39
        Width = 100
        Height = 21
        Date = 41484.595135914350000000
        Time = 41484.595135914350000000
        TabOrder = 1
        OnExit = datiniExit
      end
      object datfin: TDateTimePicker
        Left = 442
        Top = 39
        Width = 100
        Height = 21
        Date = 41484.595135914350000000
        Time = 41484.595135914350000000
        TabOrder = 2
        OnExit = datfinExit
      end
      object Button2: TButton
        Left = 947
        Top = 13
        Width = 115
        Height = 57
        Caption = '&Sair'
        ImageIndex = 203
        Images = fPrincipal.imgList_Btn_Sistemas
        TabOrder = 3
        OnClick = Button2Click
      end
    end
  end
  object dbgAuditor: TDBGrid
    Left = 0
    Top = 81
    Width = 1078
    Height = 423
    Align = alClient
    DataSource = dmEmp.dsAuditor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = dbgAuditorDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'adt_usuario'
        Title.Caption = 'Nome do Usu'#225'rio:'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 148
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'adt_dtacao'
        Title.Caption = 'Data:'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'adt_hracao'
        Title.Caption = 'Hora:'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'adt_modulo'
        Title.Caption = 'M'#243'dulo Acessado:'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 158
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'adt_acao'
        Title.Caption = 'A'#231#227'o cometida:'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'adt_dtbase'
        Title.Caption = 'Descri'#231#227'o da A'#231#227'o:'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
end
