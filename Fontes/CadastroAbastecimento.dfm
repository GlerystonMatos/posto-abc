object FormCadastroAbastecimento: TFormCadastroAbastecimento
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Abastecimento'
  ClientHeight = 342
  ClientWidth = 424
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
  object LabelBomba: TLabel
    Left = 8
    Top = 8
    Width = 41
    Height = 16
    Caption = 'Bomba'
  end
  object LabelTipo: TLabel
    Left = 25
    Top = 35
    Width = 24
    Height = 16
    Caption = 'Tipo'
  end
  object Bevel01: TBevel
    Left = 6
    Top = 90
    Width = 412
    Height = 2
  end
  object LabelMoeda01: TLabel
    Left = 68
    Top = 104
    Width = 20
    Height = 18
    Caption = 'R$'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object LabelTotalPagar: TLabel
    Left = 94
    Top = 133
    Width = 234
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = 'Total a Pagar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object LabelLitros: TLabel
    Left = 94
    Top = 195
    Width = 234
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = 'Litros'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object LabelMoeda02: TLabel
    Left = 68
    Top = 226
    Width = 20
    Height = 18
    Caption = 'R$'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object LabelPrecoLitro: TLabel
    Left = 94
    Top = 255
    Width = 234
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = 'Pre'#231'o por Litro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 6
    Top = 285
    Width = 412
    Height = 2
  end
  object EditBomba: TEdit
    Left = 55
    Top = 5
    Width = 360
    Height = 24
    Color = clBtnFace
    Enabled = False
    TabOrder = 0
  end
  object EditTipo: TEdit
    Left = 55
    Top = 32
    Width = 360
    Height = 24
    Color = clBtnFace
    Enabled = False
    TabOrder = 1
  end
  object EditTotalPagar: TEdit
    Left = 94
    Top = 101
    Width = 234
    Height = 26
    Alignment = taRightJustify
    Color = clBtnFace
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = '0,00'
    OnChange = EditTotalPagarChange
    OnKeyPress = EditTotalPagarKeyPress
  end
  object EditLitros: TEdit
    Left = 94
    Top = 163
    Width = 234
    Height = 26
    Alignment = taRightJustify
    Color = clBtnFace
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Text = '0,00'
    OnChange = EditLitrosChange
    OnKeyPress = EditLitrosKeyPress
  end
  object EditlPrecoLitro: TEdit
    Left = 94
    Top = 223
    Width = 234
    Height = 26
    Alignment = taRightJustify
    Color = clBtnFace
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Text = '0,00'
  end
  object ComboBoxForma: TComboBox
    Left = 55
    Top = 59
    Width = 360
    Height = 24
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 5
    Text = '[ Selecione a forma do abastecimento ]'
    OnChange = ComboBoxFormaChange
    Items.Strings = (
      '[ Selecione a forma do abastecimento ]'
      'Por litros'
      'Por valor')
  end
  object BitBtnNovoAbastecimento: TBitBtn
    Left = 8
    Top = 293
    Width = 175
    Height = 25
    Caption = '&Novo Abastecimento'
    TabOrder = 6
    OnClick = BitBtnNovoAbastecimentoClick
  end
  object BitBtnIniciarAbastecimento: TBitBtn
    Left = 243
    Top = 293
    Width = 175
    Height = 25
    Caption = '&Iniciar Abastecimento'
    TabOrder = 7
    OnClick = BitBtnIniciarAbastecimentoClick
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 323
    Width = 424
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    ExplicitLeft = -112
    ExplicitTop = 278
    ExplicitWidth = 536
  end
end
