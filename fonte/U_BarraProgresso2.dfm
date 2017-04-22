object frmProgd: TfrmProgd
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmProgD'
  ClientHeight = 91
  ClientWidth = 474
  Color = cl3DLight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lTabela: TLabel
    Left = 8
    Top = 1
    Width = 109
    Height = 14
    Caption = 'Povoando Tabela:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object lcontador: TLabel
    Left = 442
    Top = 1
    Width = 23
    Height = 14
    Alignment = taRightJustify
    Caption = '1/1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object subtabela: TLabel
    Left = 9
    Top = 45
    Width = 109
    Height = 14
    Caption = 'Povoando Tabela:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object lsubcontador: TLabel
    Left = 443
    Top = 45
    Width = 23
    Height = 14
    Alignment = taRightJustify
    Caption = '1/1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 22
    Width = 457
    Height = 17
    BarColor = clRed
    BackgroundColor = clYellow
    TabOrder = 0
  end
  object ProgressBar2: TProgressBar
    Left = 9
    Top = 66
    Width = 457
    Height = 17
    BarColor = clRed
    BackgroundColor = clYellow
    TabOrder = 1
  end
end
