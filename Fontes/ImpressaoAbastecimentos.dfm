object FormImpressaoAbastecimentos: TFormImpressaoAbastecimentos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Impress'#227'o de Abastecimentos'
  ClientHeight = 128
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object LabelDataInicial: TLabel
    Left = 14
    Top = 49
    Width = 64
    Height = 16
    Caption = 'Data Inicial'
  end
  object LabelDataFinal: TLabel
    Left = 206
    Top = 49
    Width = 59
    Height = 16
    Caption = 'Data Final'
  end
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 405
    Height = 35
    ButtonHeight = 35
    ButtonWidth = 35
    Caption = 'ToolBar'
    EdgeBorders = [ebBottom]
    Images = FormPrincipal.ImageList
    TabOrder = 0
    object ToolButtonLimpar: TToolButton
      Left = 0
      Top = 0
      Hint = 'Limpar (F2)'
      Caption = 'ToolButtonLimpar'
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButtonLimparClick
    end
    object ToolButtonSeparator01: TToolButton
      Left = 35
      Top = 0
      Width = 8
      Caption = 'ToolButtonSeparator01'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object ToolButtonImprimir: TToolButton
      Left = 43
      Top = 0
      Hint = 'Imprimir (F7)'
      Caption = 'ToolButtonImprimir'
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButtonImprimirClick
    end
  end
  object DateTimePickerDataInicial: TDateTimePicker
    Left = 14
    Top = 71
    Width = 186
    Height = 24
    Date = 42812.517110393520000000
    Time = 42812.517110393520000000
    TabOrder = 1
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 109
    Width = 405
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object DateTimePickerDataFinal: TDateTimePicker
    Left = 206
    Top = 71
    Width = 186
    Height = 24
    Date = 42812.517110393520000000
    Time = 42812.517110393520000000
    TabOrder = 3
  end
end
