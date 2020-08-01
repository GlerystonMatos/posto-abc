object FormImpressaoAbastecimentosa: TFormImpressaoAbastecimentosa
  Left = 0
  Top = 0
  Caption = 'FormImpressaoAbastecimentosa'
  ClientHeight = 690
  ClientWidth = 1038
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object RLReportAbastecimentoBombas: TRLReport
    Left = 8
    Top = 8
    Width = 794
    Height = 1123
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBandTitle: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 67
      BandType = btTitle
      object RLDrawTitle: TRLDraw
        Left = 0
        Top = 0
        Width = 718
        Height = 67
      end
      object RLLabelPostoABC: TRLLabel
        Left = 6
        Top = 15
        Width = 70
        Height = 16
        Caption = 'Posto ABC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfoData: TRLSystemInfo
        Left = 606
        Top = 15
        Width = 39
        Height = 16
      end
      object RLLabelData: TRLLabel
        Left = 567
        Top = 15
        Width = 37
        Height = 16
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfoPagina: TRLSystemInfo
        Left = 606
        Top = 36
        Width = 87
        Height = 16
        Info = itPageNumber
      end
      object RLLabelPagina: TRLLabel
        Left = 554
        Top = 36
        Width = 53
        Height = 16
        Caption = 'Pagina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabelImpressaoAbastecimentos: TRLLabel
        Left = 6
        Top = 36
        Width = 193
        Height = 16
        Caption = 'Impress'#227'o de Abastecimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLGroup: TRLGroup
      Left = 38
      Top = 105
      Width = 718
      Height = 88
      DataFields = 'Tanque'
      object RLBandDetail: TRLBand
        Left = 0
        Top = 48
        Width = 718
        Height = 20
        BeforePrint = RLBandDetailBeforePrint
        object RLDrawBomba: TRLDraw
          Left = 0
          Top = -1
          Width = 543
          Height = 21
        end
        object RLLabelBomba: TRLLabel
          Left = 6
          Top = 2
          Width = 529
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDrawDataAbastecimento: TRLDraw
          Left = 540
          Top = -1
          Width = 80
          Height = 21
        end
        object RLLabelDataAbastecimento: TRLLabel
          Left = 546
          Top = 2
          Width = 70
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDrawValor: TRLDraw
          Left = 619
          Top = -1
          Width = 99
          Height = 21
        end
        object RLLabelValor: TRLLabel
          Left = 625
          Top = 2
          Width = 90
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
      object RLBandHeader: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 48
        BandType = btHeader
        BeforePrint = RLBandHeaderBeforePrint
        object RLDrawColunaBomba: TRLDraw
          Left = 0
          Top = 27
          Width = 543
          Height = 21
        end
        object RLDrawGrupo: TRLDraw
          Left = 0
          Top = 7
          Width = 718
          Height = 21
        end
        object RLLabelTanqueGrupo: TRLLabel
          Left = 6
          Top = 9
          Width = 56
          Height = 16
          Caption = 'Tanque:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabelGrupo: TRLLabel
          Left = 61
          Top = 9
          Width = 86
          Height = 16
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDrawColunaData: TRLDraw
          Left = 540
          Top = 27
          Width = 80
          Height = 21
        end
        object RLLabelColunaData: TRLLabel
          Left = 546
          Top = 30
          Width = 69
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabelColunaBomba: TRLLabel
          Left = 6
          Top = 30
          Width = 49
          Height = 16
          Alignment = taJustify
          Caption = 'Bomba'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDrawColunaValor: TRLDraw
          Left = 619
          Top = 27
          Width = 99
          Height = 21
        end
        object RLLabelColunaValor: TRLLabel
          Left = 625
          Top = 30
          Width = 90
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBandSummary01: TRLBand
        Left = 0
        Top = 68
        Width = 718
        Height = 20
        BandType = btSummary
        BeforePrint = RLBandSummary01BeforePrint
        object RLDrawValorTotalTanqueCaption: TRLDraw
          Left = 0
          Top = -1
          Width = 620
          Height = 21
        end
        object RLDrawValorTotalTanque: TRLDraw
          Left = 619
          Top = -1
          Width = 99
          Height = 21
        end
        object RLLabelValorTotalTanqueCaption: TRLLabel
          Left = 486
          Top = 2
          Width = 130
          Height = 16
          Alignment = taCenter
          Caption = 'Valor Total Tanque:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabelValorTotalTanque: TRLLabel
          Left = 625
          Top = 2
          Width = 90
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
    end
    object RLBandSummary02: TRLBand
      Left = 38
      Top = 193
      Width = 718
      Height = 26
      BandType = btSummary
      BeforePrint = RLBandSummary02BeforePrint
      object RLDrawValorTotalCaption: TRLDraw
        Left = 0
        Top = 5
        Width = 620
        Height = 21
      end
      object RLDrawValorTotal: TRLDraw
        Left = 619
        Top = 5
        Width = 99
        Height = 21
      end
      object RLLabelValorTotalCaption: TRLLabel
        Left = 538
        Top = 8
        Width = 78
        Height = 16
        Alignment = taCenter
        Caption = 'Valor Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabelValorTotal: TRLLabel
        Left = 625
        Top = 8
        Width = 90
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
  end
end
