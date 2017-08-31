object frm_menucli: Tfrm_menucli
  Left = 284
  Top = 134
  Width = 561
  Height = 551
  BorderIcons = []
  Caption = 'Consulte o Cliente'
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
  object Label1: TLabel
    Left = 56
    Top = 8
    Width = 408
    Height = 37
    Caption = 'Selecione ou busque um cliente '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 144
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
    Left = 392
    Top = 72
    Width = 145
    Height = 41
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
  object edt_consulta: TEdit
    Left = 152
    Top = 144
    Width = 121
    Height = 28
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnChange = edt_consultaChange
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 184
    Width = 529
    Height = 321
    DataSource = DataModule1.DScliente
    FixedColor = clSkyBlue
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'nome'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Completo'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Arial Narrow'
        Title.Font.Style = [fsBold]
        Width = 310
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
        Width = 96
        Visible = True
      end>
  end
  object btn_cancelar: TBitBtn
    Left = 208
    Top = 72
    Width = 145
    Height = 41
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
  object BitBtn1: TBitBtn
    Left = 16
    Top = 72
    Width = 145
    Height = 41
    Caption = 'Cadastrar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = BitBtn1Click
    Glyph.Data = {
      361B0000424D361B000000000000360000002800000030000000300000000100
      180000000000001B0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FFFFFFFEFEFEFEFEFEFFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFE
      FEFEFDFDFDFDFDFDFDFDFDFCFCFCFCFCFCFEFEFEFDFDFDFEFEFEFEFEFEFDFDFD
      FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
      FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFBFBFBFBFBFBFCFCFCFEFEFEFE
      FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFBFBFBF9F9F9F7F7F7F6F6F6F5F5F5F3F3
      F3E5E5E5E0E0E0E1E1E1DEDEDEDEDEDEDEDEDEDDDDDDDEDEDEDEDEDEDFDFDFDF
      DFDFE0E0E0E0E0E0E1E1E1E1E1E1E2E2E2E2E2E2E3E3E3E4E4E4E4E4E4E5E5E5
      E5E5E5E6E6E6E7E7E7EAEAEAEDEDEDF3F3F3F3F3F3F3F3F3FCFCFCFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFAFAFAF6
      F6F6F4F4F4F0F0F0EEEEEEF1F1F1E2E2E2B0B0B0C2C2C29C9C9CBFBFBFBBBBBB
      BDBDBDBEBEBEC0C0C0C1C1C1C3C3C3C4C4C4C6C6C6C7C7C7CACACACBCBCBCDCD
      CDCFCFCFD2D2D2D3D3D3D5D5D5D7D7D7D9D9D9DBDBDBDEDEDEDFDFDFE0E0E0DF
      DFDFD5D5D5DCDCDCE1E1E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFEFEFEFCFCFCF6F6F6F1F1F1EEEEEEE9E9E9E9E9E9CDCDCD9898
      98C5C5C5E1E1E1A6A6A6CECECEE6E6E6D3D3D3D6D6D6D7D7D7D8D8D8DADADADB
      DBDBDCDCDCDDDDDDDFDFDFE0E0E0E2E2E2E4E4E4E4E4E4E6E6E6E8E8E8EAEAEA
      EBEBEBECECECEDEDEDF1F1F1FBFBFBDBDBDBE6E6E6F5F5F5D8D8D8FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFBFBFBF3F3F3ED
      EDEDE9E9E9E4E4E4E8E8E89C9C9CDEDEDEC1C1C1D7D7D7D0D0D0A9A9A9C9C9C9
      E1E1E1D0D0D0D1D1D1D2D2D2D4D4D4D6D6D6D7D7D7D9D9D9DADADADCDCDCDFDF
      DFE0E0E0E1E1E1E3E3E3E6E6E6E7E7E7E9E9E9EAEAEAEEEEEEF4F4F4D9D9D9E5
      E5E5ECECECF3F3F3DBDBDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFDFDFDF9F9F9F0F0F0EAEAEAE7E7E7E5E5E5E8E8E89F9F9FDADA
      DAC2C2C2D7D7D7D2D2D2D0D0D0ACACACCFCFCFE2E2E2D3D3D3D5D5D5D7D7D7D8
      D8D8D9D9D9DCDCDCDDDDDDDEDEDEE1E1E1E2E2E2E3E3E3E5E5E5E8E8E8E9E9E9
      EBEBEBEEEEEEF3F3F3DFDFDFE2E2E2ECECECEBEBEBF4F4F4DDDDDDFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFBFBFBF5F5F5EDEDEDE7
      E7E7D7D7D7BDBDBDC1C1C1919191DDDDDDC3C3C3D8D8D8D1D1D1D5D5D5D3D3D3
      AEAEAED2D2D2E5E5E5D4D4D4D8D8D8DADADADBDBDBDDDDDDDFDFDFE0E0E0E2E2
      E2E4E4E4E6E6E6E8E8E8E9E9E9EBEBEBEFEFEFF9F9F9DBDBDBE3E3E3ECECECEC
      ECECEDEDEDF4F4F4DDDDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFEFEFEFBFBFBF3F3F3E9E9E9E7E7E7BEBEBEE8E8E8E8E8E8A0A0A0DBDB
      DBC4C4C4D9D9D9D2D2D2D4D4D4D6D6D6D7D7D7B5B5B5D2D2D2E7E7E7DADADADC
      DCDCDEDEDEE0E0E0E2E2E2E6E6E6E7E7E7E7E7E7E8E8E8EAEAEAEBEBEBEFEFEF
      F5F5F5DBDBDBE5E5E5EDEDEDEDEDEDEEEEEEEEEEEEF5F5F5E0E0E0FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFAFAFAF3F3F3EAEAEAEA
      EAEAC2C2C2E1E1E1D1D1D1989898DDDDDDC4C4C4D9D9D9D4D4D4D5D5D5D6D6D6
      D8D8D8D6D6D6B8B8B8D8D8D8E9E9E9DEDEDEDFDFDFE4E4E4DBDBDBC7C7C7D2D2
      D2E9E9E9EAEAEAECECECEFEFEFF5F5F5DFDFDFE3E3E3ECECECEDEDEDEEEEEEEE
      EEEEF0F0F0F6F6F6E1E1E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFEFEFEFBFBFBF5F5F5F2F2F2F2F2F2C9C9C9E1E1E1D4D4D49A9A9ADEDE
      DEC6C6C6DBDBDBD4D4D4D6D6D6D7D7D7D7D7D7DADADADADADABCBCBCDBDBDBEB
      EBEBE3E3E3DCDCDCB3B3B3E2E2E2C9C9C9CCCCCCF2F2F2F0F0F0FAFAFADCDCDC
      E3E3E3ECECECECECECEEEEEEEFEFEFEFEFEFF1F1F1F6F6F6E2E2E2FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFDFDFDFBFBFBFAFAFAFE
      FEFED1D1D1E1E1E1D5D5D59A9A9ADFDFDFC7C7C7DCDCDCD5D5D5D8D8D8D9D9D9
      D9D9D9DBDBDBDDDDDDDDDDDDC3C3C3DFDFDFE0E0E0B8B8B8E5E5E5E2E2E2EDED
      EDCDCDCDD2D2D2F6F6F6DDDDDDE6E6E6EDEDEDEDEDEDEEEEEEF0F0F0F0F0F0F1
      F1F1F3F3F3F6F6F6E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFFFFFFD5D5D5E1E1E1D6D6D69A9A9AE0E0
      E0C8C8C8DCDCDCD6D6D6D9D9D9D9D9D9DADADADCDCDCDDDDDDDFDFDFE0E0E0C5
      C5C5BDBDBDDFDFDFE4E4E4DBDBDBE0E0E0EFEFEFD3D3D3CECECEE5E5E5ECECEC
      EDEDEDEEEEEEEFEFEFF1F1F1F1F1F1F2F2F2F4F4F4F8F8F8E5E5E5FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFF
      FFFFD6D6D6E2E2E2D7D7D7999999E0E0E0C9C9C9DDDDDDD8D8D8D9D9D9DADADA
      DBDBDBDDDDDDDEDEDEE2E2E2DADADAB2B2B2E5E5E5E4E4E4DCDCDCDFDFDFE1E1
      E1E2E2E2EFEFEFD5D5D5D6D6D6F0F0F0EFEFEFEFEFEFF2F1F1F5F3F4F8F4F6F9
      F5F7F8F6F7FBFAFAE6E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D5D5E3E3E3D9D9D99A9A9AE2E2
      E2CACACADFDFDFD9D9D9DBDBDBDCDCDCDDDDDDDFDFDFE3E3E3D5D5D5B9B9B9E5
      E5E5E2E2E2DDDDDDE0E0E0E1E1E1E3E3E3E5E5E5E7E7E7F4F4F4DBDBDBDBDBDB
      F1F1F1F7F4F5F2F2F2DDEAE5D0E5DDD0E6DDDFECE7F9F9FAEEEAECFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFD5D5D5E3E3E3D9D9D99B9B9BE3E3E3CCCCCCE0E0E0DBDBDBDCDCDCDDDDDD
      DEDEDEE3E3E3DADADAB9B9B9E0E0E0E4E4E4DDDDDDE0E0E0E1E1E1E4E4E4E6E6
      E6E7E7E7E8E8E8EBEBEBF6F6F6E1E0E0EAE3E6D6E7E07EC6A768BF9456B98857
      BB8A6AC19982C9ABD1E1DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D5D5E4E4E4DBDBDB9B9B9BE3E3
      E3CDCDCDE0E0E0DCDCDCDDDDDDDEDEDEE2E2E2DBDBDBB2B2B2E6E6E6E5E5E5DD
      DDDDE0E0E0E2E2E2E3E3E3E5E5E5E7E7E7E9E9E9EAEAEAECECECEFEFEFF9F7F8
      A9D1C262BA9267C38C45B87238B56A3DB87250C08471CD9E67BD98B7DFCEFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFD5D5D5E4E4E4DDDDDD9B9B9BE5E5E5CFCFCFE2E2E2DCDCDCDFDFDFE2E2E2
      D6D6D6B9B9B9E6E6E6E3E3E3DEDEDEE1E1E1E2E2E2E4E4E4E6E6E6E8E8E8EAEA
      EAEBEBEBEDEDEDEFEFEFFBF4F7A3D2BF43B27A4FBB761EA95320AC5A1CAD5B21
      B2652CB87032BC7A68D1A14AB889ACDBC7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D5D5E5E5E5DEDEDE9B9B9BE6E6
      E6D0D0D0E3E3E3DDDDDDE3E3E3DBDBDBB9B9B9E0E0E0E5E5E5DEDEDEE1E1E1E2
      E2E2E5E5E5E7E7E7E8E8E8E9E9E9ECECECEDEDEDEEEEEEF2F1F2FAF5F75AB98E
      57BE7E1FAB5524AE5E20B06085D4A888D7AF2DBB7738C0843EC68C72D6AE5FBD
      96FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFD5D5D5E7E7E7DFDFDF9D9D9DE7E7E7D1D1D1E4E4E4E1E1E1DBDBDBB3B3B3
      E6E6E6E6E6E6DEDEDEE1E1E1E3E3E3E5E5E5E6E6E6E8E8E8EAEAEAEBEBEBEDED
      EDEFEFEFF0F0F0FAF5F7B8DCCE4FB87F3AB56922AD5C23B06415AE5EE7F7EEE8
      F8F222BB7638C48A40CA945ED5AA60C69FBEE2D2FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D5D5E8E8E8E1E1E19C9C9CE8E8
      E8D3D3D3E5E5E5D6D6D6BABABAE7E7E7E3E3E3DEDEDEE1E1E1E2E2E2E4E4E4E7
      E7E7E8E8E8EBEBEBECECECEEEEEEF0F0F0F1F1F1F3F3F3FFFBFF6DBD9D67C78D
      25B06023B1645DC8904BC489E4F6EDE5F7EF56CD9C6DD5AD43CE9D4CD3A886E2
      C670BE9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFD5D5D5E9E9E9E2E2E29C9C9CE9E9E9D5D5D5F3F3F3BCBCBCE6E6E6EFEFEF
      E9E9E9ECECECECECECEEEEEEF0F0F0F0F0F0F1F1F1F3F3F3F4F4F4F5F5F5F7F7
      F7F8F8F8F8F8F8FFFFFF60BA966FCC9524B26516B061FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF38CE9D4ED7AF8EE9D363B992FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4D4D4EAEAEAE2E2E29B9B9BF1F1
      F1C7C7C7CDCDCDBABABAC5C5C5C6C6C6C9C9C9CBCBCBCDCDCDD0D0D0D2D2D2D5
      D5D5D8D8D8DADADADCDCDCDFDFDFE2E2E2E3E3E3E6E6E6F6EDF16ABB9A6ECC9A
      2DB7712EBA7665CFA055CC99E5F7EFE7F8F260D6AC74DDBC4ED7AD56DCB98BE8
      D170BE9BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFD4D4D4EBEBEBE4E4E4A2A2A2DFDFDFDDDDDDDEDEDEE0E0E0E1E1E1E0E0E0
      E1E1E1E1E1E1E1E1E1E2E2E2E3E3E3E2E2E2E2E2E2E4E4E4E3E3E3E4E4E4E4E4
      E4E4E4E4E5E5E5ECE8EAA8CBBC57C0904EC88D36C0833AC5892CC488E8F8F2EA
      F9F43AD0A14ED7B056DDBB73E8CE66CDADBFE1D2FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4D4D4EBEBEBE1E1E1D3D3D3B4B4
      B4B7B7B7B8B8B8B9B9B9B9B9B9B9B9B9BABABABBBBBBBCBCBCBCBCBCBDBDBDBE
      BEBEBEBEBEBEBEBEBFBFBFBFBFBFC1C1C1C1C1C1C1C1C1C3C2C2CCC8CA63C098
      6CD1A43DC78D43CA9540CC9A97E5CC9BE8D14CD8B156DCBA5DE2C587E9D561BF
      9BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFD4D4D4EDEDEDE0E0E0E4E4E4E7E7E7EAEAEAEBEBEBECECECEDEDEDEEEEEE
      EFEFEFF2F2F2F3F3F3F3F3F3F5F5F5F6F6F6F7F7F7F8F8F8F9F9F9FAFAFAFCFC
      FCFDFDFDFEFEFEFFFFFFFFFFFFABD8C54EBB8C71D9B147CF9F4AD2A545D3A74B
      D8B156DEBC5CE3C688EFDC55C29DACDBC6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D7D7E6E6E6E6E6E6E7E7E7E7E7
      E7E9E9E9E8E8E8E9E9E9E9E9E9EAEAEAEBEBEBECECECEBEBEBEBEBEBEDEDEDED
      EDEDEEEEEEEDEDEDEEEEEEEFEFEFEFEFEFF0F0F0F0F0F0F1F1F1F2F1F1F4F2F4
      AAD1BF63BB9782DCBC6EDDBC69E0C26EE5CA78E6CE8DE5D06DC3A1B4DDCAFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFF6F6F6E2E2E2E4E4E4E4E4E4E4E4E4E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3
      E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E2E2E2E2E2
      E2E2E2E2E2E2E2E2E2E2E2E2E2E4E3E3EDE7EAD0E0D986CDAF72C8A764C6A266
      C8A475CAAB85CCAEE0F0E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFEFEFEE6F3EDD7ECE2D7ECE2E5F3ECFEFEFEFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
  end
end
