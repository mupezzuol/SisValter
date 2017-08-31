object frm_cadfornconsulta: Tfrm_cadfornconsulta
  Left = 201
  Top = 157
  Width = 873
  Height = 496
  BorderIcons = []
  Caption = 'Consulta de fornecedor'
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
    Left = 176
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
    Left = 704
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
    Width = 137
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
    Width = 841
    Height = 329
    DataSource = DataModule1.DSfornecedor
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
        Title.Alignment = taCenter
        Title.Caption = 'Registro'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Arial Narrow'
        Title.Font.Style = [fsBold]
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'Nome'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Arial Narrow'
        Title.Font.Style = [fsBold]
        Width = 169
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'email'
        Title.Alignment = taCenter
        Title.Caption = 'E-mail'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Arial Narrow'
        Title.Font.Style = [fsBold]
        Width = 213
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'telefone'
        Title.Alignment = taCenter
        Title.Caption = 'Telefone'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Arial Narrow'
        Title.Font.Style = [fsBold]
        Width = 87
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'celular'
        Title.Alignment = taCenter
        Title.Caption = 'Celular'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Arial Narrow'
        Title.Font.Style = [fsBold]
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'produtos'
        Title.Alignment = taCenter
        Title.Caption = 'Produtos Vendidos'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Arial Narrow'
        Title.Font.Style = [fsBold]
        Width = 423
        Visible = True
      end>
  end
  object btn_cancelar: TBitBtn
    Left = 704
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
    Left = 408
    Top = 56
  end
end
