object FormCadastroConfiguracoes: TFormCadastroConfiguracoes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Configura'#231#245'es do Sistema'
  ClientHeight = 164
  ClientWidth = 269
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object LabelValorLitroGasolina: TLabel
    Left = 8
    Top = 40
    Width = 106
    Height = 16
    Caption = 'Valor litro gasolina'
  end
  object LabelMoeda01: TLabel
    Left = 93
    Top = 63
    Width = 16
    Height = 16
    Caption = 'R$'
  end
  object LabelMoeda02: TLabel
    Left = 221
    Top = 63
    Width = 16
    Height = 16
    Caption = 'R$'
  end
  object LabelValorLitroOleoDiesel: TLabel
    Left = 136
    Top = 40
    Width = 120
    Height = 16
    Caption = 'Valor litro '#243'leo diesel'
  end
  object LabelPercentual: TLabel
    Left = 93
    Top = 115
    Width = 12
    Height = 16
    Caption = '%'
  end
  object LabelValorImpostoAbastecimento: TLabel
    Left = 8
    Top = 92
    Width = 168
    Height = 16
    Caption = 'Valor imposto abastecimento'
  end
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 269
    Height = 35
    ButtonHeight = 35
    ButtonWidth = 35
    Caption = 'ToolBar'
    EdgeBorders = [ebBottom]
    Images = FormPrincipal.ImageList
    TabOrder = 0
    object ToolButtonSalvar: TToolButton
      Left = 0
      Top = 0
      Hint = 'Salvar (F3)'
      Caption = 'ToolButtonSalvar'
      ImageIndex = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButtonSalvarClick
    end
    object ToolButton01: TToolButton
      Left = 35
      Top = 0
      Width = 8
      Caption = 'ToolButton01'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButtonCancelar: TToolButton
      Left = 43
      Top = 0
      Hint = 'Cancelar (F4)'
      Caption = 'ToolButtonCancelar'
      ImageIndex = 3
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButtonCancelarClick
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 145
    Width = 269
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object EditValorLitroGasolina: TEdit
    Left = 8
    Top = 60
    Width = 81
    Height = 24
    TabOrder = 2
    Text = '0,00'
    OnChange = EditValorLitroGasolinaChange
    OnKeyPress = EditValorLitroGasolinaKeyPress
  end
  object EditValorLitroOleoDiesel: TEdit
    Left = 136
    Top = 60
    Width = 81
    Height = 24
    TabOrder = 3
    Text = '0,00'
    OnChange = EditValorLitroOleoDieselChange
    OnKeyPress = EditValorLitroOleoDieselKeyPress
  end
  object EditValorIimpostoAbastecimento: TEdit
    Left = 8
    Top = 112
    Width = 81
    Height = 24
    TabOrder = 4
    Text = '0,00'
    OnChange = EditValorIimpostoAbastecimentoChange
    OnKeyPress = EditValorIimpostoAbastecimentoKeyPress
  end
end
