object frmEnviaEmail: TfrmEnviaEmail
  Left = 0
  Top = 0
  BorderIcons = [biMaximize, biHelp]
  Caption = 'Envio Autom'#225'tico de Email'
  ClientHeight = 199
  ClientWidth = 381
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 0
    Width = 369
    Height = 57
    Caption = 'Status de Informa'#231#245'es de Enviio'
    TabOrder = 0
    object LbStatus: TLabel
      Left = 2
      Top = 15
      Width = 50
      Height = 13
      Align = alClient
      Alignment = taCenter
      Caption = 'LbStatus'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 180
    Width = 381
    Height = 19
    Panels = <>
  end
  object OpenDialog1: TOpenDialog
    Left = 328
    Top = 64
  end
end
