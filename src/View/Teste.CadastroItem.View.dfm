inherited CadastroItemForm: TCadastroItemForm
  Caption = 'Cadastro Item'
  ClientHeight = 98
  OnDestroy = FormDestroy
  ExplicitHeight = 137
  PixelsPerInch = 96
  TextHeight = 13
  object lblDescricao: TLabel [1]
    Left = 135
    Top = 16
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object lblPrecoVenda: TLabel [2]
    Left = 447
    Top = 16
    Width = 75
    Height = 13
    Caption = 'Pre'#231'o de venda'
  end
  inherited pnBtn: TPanel
    Top = 67
    TabOrder = 3
    ExplicitTop = 67
  end
  object EdDescricao: TEdit
    Left = 135
    Top = 32
    Width = 306
    Height = 21
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 1
  end
  object edPrecoVenda: TEdit
    Left = 447
    Top = 32
    Width = 110
    Height = 21
    Enabled = False
    TabOrder = 2
  end
end
