object FormConsultaPadrao: TFormConsultaPadrao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FormConsultaPadrao'
  ClientHeight = 363
  ClientWidth = 390
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
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 390
    Height = 35
    ButtonHeight = 35
    ButtonWidth = 35
    Caption = 'ToolBar'
    EdgeBorders = [ebBottom]
    Images = FormPrincipal.ImageList
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    ExplicitWidth = 269
    object ToolButtonPesquisar: TToolButton
      Left = 0
      Top = 0
      Hint = 'Pesquisar (F5)'
      Caption = 'ToolButtonPesquisar'
      ImageIndex = 4
      OnClick = ToolButtonPesquisarClick
    end
  end
  object EditDescricao: TEdit
    Left = 4
    Top = 40
    Width = 382
    Height = 24
    MaxLength = 50
    TabOrder = 1
    OnKeyPress = EditDescricaoKeyPress
  end
  object ListViewDados: TListView
    Left = 4
    Top = 70
    Width = 382
    Height = 285
    Columns = <
      item
        Caption = 'Id'
        Width = 0
      end
      item
        Caption = 'Descri'#231#227'o'
        MaxWidth = 355
        MinWidth = 355
        Width = 355
      end>
    ColumnClick = False
    GridLines = True
    ReadOnly = True
    RowSelect = True
    ShowColumnHeaders = False
    TabOrder = 2
    ViewStyle = vsReport
    OnDblClick = ListViewDadosDblClick
  end
end
