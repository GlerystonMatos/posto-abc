object FormConsultaBomba: TFormConsultaBomba
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Bombas'
  ClientHeight = 297
  ClientWidth = 536
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
  object LabelBombasCombustivel: TLabel
    Left = 8
    Top = 8
    Width = 282
    Height = 16
    Caption = 'Selecione a bomba para iniciar o abastecimento.'
  end
  object ListViewBombas: TListView
    Left = 8
    Top = 30
    Width = 519
    Height = 211
    Columns = <
      item
        Caption = 'Id'
        Width = 0
      end
      item
        Caption = 'Bomba'
        MaxWidth = 362
        MinWidth = 362
        Width = 362
      end
      item
        Caption = 'Tipo de Combust'#237'vel'
        MaxWidth = 130
        MinWidth = 130
        Width = 130
      end>
    ColumnClick = False
    GridLines = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnDblClick = ListViewBombasDblClick
  end
  object BitBtnIniciarAbastecimento: TBitBtn
    Left = 352
    Top = 247
    Width = 175
    Height = 25
    Caption = '&Iniciar Abastecimento'
    TabOrder = 1
    OnClick = BitBtnIniciarAbastecimentoClick
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 278
    Width = 536
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    ExplicitLeft = -237
    ExplicitTop = 258
    ExplicitWidth = 773
  end
end
