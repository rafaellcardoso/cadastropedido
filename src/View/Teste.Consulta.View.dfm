object PesquisaForm: TPesquisaForm
  Left = 0
  Top = 0
  Caption = 'Pesquisa'
  ClientHeight = 371
  ClientWidth = 629
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object grid: TDBGrid
    Left = 0
    Top = 121
    Width = 629
    Height = 219
    Align = alClient
    DataSource = ds
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = gridDrawColumnCell
    OnDblClick = gridDblClick
    Columns = <
      item
        Expanded = False
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Descri'#231#227'o'
        Width = 522
        Visible = True
      end>
  end
  object pnDesc: TPanel
    Left = 0
    Top = 35
    Width = 629
    Height = 45
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    object lblPesquisar: TLabel
      Left = 8
      Top = 4
      Width = 56
      Height = 13
      Caption = 'lblPesquisar'
    end
    object edNome: TEdit
      Left = 8
      Top = 18
      Width = 495
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = edNomeChange
    end
    object btnConsultar: TButton
      Left = 503
      Top = 16
      Width = 117
      Height = 23
      Caption = 'Consultar'
      Enabled = False
      TabOrder = 1
      OnClick = btnConsultarClick
    end
  end
  object pnPeriodo: TPanel
    Left = 0
    Top = 80
    Width = 629
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    Visible = False
    object Label2: TLabel
      Left = 8
      Top = -2
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object Label3: TLabel
      Left = 119
      Top = -2
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    object DateIni: TDateTimePicker
      Left = 8
      Top = 14
      Width = 105
      Height = 21
      Date = 42442.000000000000000000
      Time = 0.663787245372077400
      TabOrder = 0
    end
    object DateFim: TDateTimePicker
      Left = 119
      Top = 14
      Width = 105
      Height = 21
      Date = 42442.000000000000000000
      Time = 0.663914270829991400
      TabOrder = 1
    end
    object btnConsDate: TButton
      Left = 224
      Top = 13
      Width = 117
      Height = 23
      Caption = 'Consultar'
      TabOrder = 2
      OnClick = btnConsDateClick
    end
  end
  object pnPesquisar: TPanel
    Left = 0
    Top = 0
    Width = 629
    Height = 35
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object CBoxPesquisar: TComboBox
      Left = 8
      Top = 8
      Width = 145
      Height = 21
      ItemIndex = 0
      TabOrder = 0
      Text = 'C'#243'digo'
      OnChange = CBoxPesquisarChange
      Items.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o')
    end
  end
  object ButtonPanel: TPanel
    Left = 0
    Top = 340
    Width = 629
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    object btnUltimo: TSpeedButton
      AlignWithMargins = True
      Left = 551
      Top = 3
      Width = 75
      Height = 25
      Align = alRight
      Caption = '>>'
      OnClick = btnUltimoClick
      ExplicitTop = 6
    end
    object btnProximo: TSpeedButton
      AlignWithMargins = True
      Left = 470
      Top = 3
      Width = 75
      Height = 25
      Align = alRight
      Caption = '>'
      OnClick = btnProximoClick
      ExplicitTop = 6
    end
    object btnAnterior: TSpeedButton
      AlignWithMargins = True
      Left = 389
      Top = 3
      Width = 75
      Height = 25
      Align = alRight
      Caption = '<'
      OnClick = btnAnteriorClick
      ExplicitTop = 6
    end
    object btnInicio: TSpeedButton
      AlignWithMargins = True
      Left = 308
      Top = 3
      Width = 75
      Height = 25
      Align = alRight
      Caption = '<<'
      OnClick = btnInicioClick
      ExplicitTop = 6
    end
  end
  object ds: TDataSource
    DataSet = cds
    Left = 192
    Top = 168
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 104
    Top = 192
  end
end
