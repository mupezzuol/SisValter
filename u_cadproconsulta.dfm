object frm_cadproconsulta: Tfrm_cadproconsulta
  Left = 202
  Top = 155
  Width = 777
  Height = 495
  BorderIcons = []
  Caption = 'Consulta de Produto'
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_selecione: TLabel
    Left = 128
    Top = 8
    Width = 456
    Height = 37
    Caption = 'Selecione ou pesquise um cadastro '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_busca: TLabel
    Left = 8
    Top = 80
    Width = 127
    Height = 23
    Caption = 'Buscar Cadastro'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn_confirmar: TBitBtn
    Left = 608
    Top = 32
    Width = 145
    Height = 33
    Caption = 'Confirmar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btn_confirmarClick
    Kind = bkOK
  end
  object Edit1: TEdit
    Left = 152
    Top = 80
    Width = 153
    Height = 28
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnChange = Edit1Change
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 120
    Width = 745
    Height = 329
    DataSource = DataModule1.DSproduto
    FixedColor = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'id'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'Registro'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Arial Narrow'
        Title.Font.Style = [fsBold]
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Alignment = taCenter
        Title.Caption = 'Descri'#231#227'o do Produto'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Arial Narrow'
        Title.Font.Style = [fsBold]
        Width = 218
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'preco'
        Title.Alignment = taCenter
        Title.Caption = 'Pre'#231'o'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Arial Narrow'
        Title.Font.Style = [fsBold]
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'categoria'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'Categoria'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Arial Narrow'
        Title.Font.Style = [fsBold]
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nomefornecedor'
        Title.Alignment = taCenter
        Title.Caption = 'Fornecedor'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Arial Narrow'
        Title.Font.Style = [fsBold]
        Width = 177
        Visible = True
      end>
  end
  object btn_cancelar: TBitBtn
    Left = 608
    Top = 72
    Width = 145
    Height = 33
    Caption = 'Cancelar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btn_cancelarClick
    Kind = bkCancel
  end
  object XPManifest1: TXPManifest
    Left = 8
    Top = 16
  end
end
