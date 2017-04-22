object frmCpfPesquisa: TfrmCpfPesquisa
  Left = 428
  Top = 226
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Consulta CPF (Receita Fazenda)'
  ClientHeight = 281
  ClientWidth = 310
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 310
    Height = 281
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label14: TLabel
      Left = 16
      Top = 212
      Width = 96
      Height = 16
      Caption = 'Digite o Captcha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 143
      Width = 170
      Height = 16
      Caption = 'Digite a Data de Nascimento:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object EditCaptcha: TEdit
      Left = 9
      Top = 231
      Width = 144
      Height = 41
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object Panel3: TPanel
      Left = 9
      Top = 11
      Width = 288
      Height = 127
      BevelOuter = bvLowered
      Color = clWhite
      ParentBackground = False
      TabOrder = 3
      object Image1: TImage
        Left = 1
        Top = 1
        Width = 286
        Height = 106
        Align = alClient
        Center = True
        Proportional = True
        Stretch = True
      end
      object LabAtualizarCaptcha: TLabel
        Left = 1
        Top = 107
        Width = 286
        Height = 19
        Cursor = crHandPoint
        Align = alBottom
        Alignment = taCenter
        AutoSize = False
        Caption = 'Atualizar Captcha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        OnClick = LabAtualizarCaptchaClick
        ExplicitWidth = 344
      end
    end
    object btnConsultar: TButton
      Left = 161
      Top = 233
      Width = 135
      Height = 40
      Caption = 'Consultar'
      TabOrder = 2
      OnClick = btnConsultarClick
    end
    object EditDtNasc: TEdit
      Left = 10
      Top = 160
      Width = 286
      Height = 41
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 192
    Top = 32
  end
  object ConsultaCpf: TACBrConsultaCPF
    ProxyPort = '8080'
    Left = 57
    Top = 43
  end
end
