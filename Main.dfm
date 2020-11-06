object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 231
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 31
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object ItemButton: TButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 75
      Height = 25
      Align = alLeft
      Caption = 'Item'
      TabOrder = 0
      OnClick = Item1Click
    end
    object PedidoButton: TButton
      AlignWithMargins = True
      Left = 84
      Top = 3
      Width = 75
      Height = 25
      Align = alLeft
      Caption = 'Pedido'
      TabOrder = 1
      OnClick = PedidoClick
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=0067'
      'User_Name=root'
      'Password=803tp2014tb'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 64
    Top = 80
  end
  object MainMenu1: TMainMenu
    Left = 248
    Top = 120
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object Item1: TMenuItem
        Caption = 'Item'
        OnClick = Item1Click
      end
    end
    object Movimento1: TMenuItem
      Caption = 'Movimento'
      object Pedido: TMenuItem
        Caption = 'Pedido'
        OnClick = PedidoClick
      end
    end
  end
end
