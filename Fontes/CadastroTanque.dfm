object FormCadastroTanque: TFormCadastroTanque
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Tanques'
  ClientHeight = 215
  ClientWidth = 377
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
  object LabelCodigo: TLabel
    Left = 8
    Top = 40
    Width = 40
    Height = 16
    Caption = 'C'#243'digo'
  end
  object LabelDescricao: TLabel
    Left = 8
    Top = 90
    Width = 58
    Height = 16
    Caption = 'Descri'#231#227'o'
  end
  object LabelTipoConbustivel: TLabel
    Left = 8
    Top = 141
    Width = 116
    Height = 16
    Caption = 'Tipo de Combust'#237'vel'
  end
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 377
    Height = 35
    ButtonHeight = 35
    ButtonWidth = 35
    Caption = 'ToolBar'
    EdgeBorders = [ebBottom]
    Images = FormPrincipal.ImageList
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object ToolButtonNovo: TToolButton
      Left = 0
      Top = 0
      Hint = 'Novo (F2)'
      Caption = 'ToolButtonNovo'
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButtonNovoClick
    end
    object ToolButton01: TToolButton
      Left = 35
      Top = 0
      Width = 8
      Caption = 'ToolButton01'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButtonSalvar: TToolButton
      Left = 43
      Top = 0
      Hint = 'Salvar (F3)'
      Caption = 'ToolButtonSalvar'
      ImageIndex = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButtonSalvarClick
    end
    object ToolButtonCancelar: TToolButton
      Left = 78
      Top = 0
      Hint = 'Cancelar (F4)'
      Caption = 'ToolButtonCancelar'
      ImageIndex = 3
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButtonCancelarClick
    end
    object ToolButton02: TToolButton
      Left = 113
      Top = 0
      Width = 8
      Caption = 'ToolButton02'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButtonPesquisar: TToolButton
      Left = 121
      Top = 0
      Hint = 'Pesquisar (F5)'
      Caption = 'ToolButtonPesquisar'
      ImageIndex = 4
      OnClick = ToolButtonPesquisarClick
    end
    object ToolButton03: TToolButton
      Left = 156
      Top = 0
      Width = 8
      Caption = 'ToolButton03'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object ToolButtonExcluir: TToolButton
      Left = 164
      Top = 0
      Hint = 'Excluir (F6)'
      Caption = 'ToolButtonExcluir'
      ImageIndex = 5
      OnClick = ToolButtonExcluirClick
    end
  end
  object EditCodigo: TEdit
    Left = 8
    Top = 60
    Width = 81
    Height = 24
    Color = clBtnFace
    Enabled = False
    TabOrder = 1
  end
  object EditDescricao: TEdit
    Left = 8
    Top = 110
    Width = 361
    Height = 24
    MaxLength = 50
    TabOrder = 2
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 196
    Width = 377
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object ComboBoxTipo: TComboBox
    Left = 8
    Top = 161
    Width = 145
    Height = 24
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 4
    Text = '[ Selecione ]'
    Items.Strings = (
      '[ Selecione ]'
      'Gasolina'
      #211'leo Diesel')
  end
end
