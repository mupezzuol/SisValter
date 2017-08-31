object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 440
  Top = 135
  Height = 593
  Width = 621
  object SQLConnection1: TSQLConnection
    ConnectionName = 'MySQL50'
    DriverName = 'MySQL50'
    GetDriverFunc = 'getSQLDriverMYSQL50'
    LibraryName = 'dbxopenmysql50.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=MySQL50'
      'HostName=localhost'
      'Database=cabelereirovalter'
      'User_Name=root'
      'Password=root'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000')
    VendorLib = 'libmysql.dll'
    Connected = True
    Left = 24
  end
  object SQLQcolaborador: TSQLQuery
    DataSource = DScolaborador
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from tblcolaborador;')
    SQLConnection = SQLConnection1
    Left = 160
    object SQLQcolaboradorid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object SQLQcolaboradornome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object SQLQcolaboradornascimento: TDateField
      FieldName = 'nascimento'
      Required = True
    end
    object SQLQcolaboradortelefone: TStringField
      FieldName = 'telefone'
      Size = 14
    end
    object SQLQcolaboradorcelular: TStringField
      FieldName = 'celular'
      Size = 17
    end
    object SQLQcolaboradoremail: TStringField
      FieldName = 'email'
      Size = 30
    end
    object SQLQcolaboradorusuario: TStringField
      FieldName = 'usuario'
      Size = 10
    end
    object SQLQcolaboradorsenha: TStringField
      FieldName = 'senha'
      Size = 10
    end
  end
  object DScolaborador: TDataSource
    DataSet = CDScolaborador
    Left = 424
  end
  object CDScolaborador: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPcolaborador'
    Left = 336
    object CDScolaboradorid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object CDScolaboradornome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object CDScolaboradornascimento: TDateField
      FieldName = 'nascimento'
      Required = True
    end
    object CDScolaboradortelefone: TStringField
      FieldName = 'telefone'
      Size = 14
    end
    object CDScolaboradorcelular: TStringField
      FieldName = 'celular'
      Size = 17
    end
    object CDScolaboradoremail: TStringField
      FieldName = 'email'
      Size = 30
    end
    object CDScolaboradorusuario: TStringField
      FieldName = 'usuario'
      Size = 10
    end
    object CDScolaboradorsenha: TStringField
      FieldName = 'senha'
      Size = 10
    end
  end
  object DSPcolaborador: TDataSetProvider
    DataSet = SQLQcolaborador
    Left = 248
  end
  object SQLQcliente: TSQLQuery
    DataSource = DScliente
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from tblcliente;')
    SQLConnection = SQLConnection1
    Left = 160
    Top = 56
    object SQLQclienteid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object SQLQclientenome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object SQLQclientetelefone: TStringField
      FieldName = 'telefone'
      Size = 14
    end
    object SQLQclientecelular: TStringField
      FieldName = 'celular'
      Size = 17
    end
    object SQLQclientenascimento: TDateField
      FieldName = 'nascimento'
      Required = True
    end
    object SQLQclienteemail: TStringField
      FieldName = 'email'
      Size = 30
    end
    object SQLQclienteOBS: TStringField
      FieldName = 'OBS'
      Size = 150
    end
  end
  object DScliente: TDataSource
    DataSet = CDScliente
    Left = 424
    Top = 56
  end
  object CDScliente: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPcliente'
    Left = 336
    Top = 56
    object CDSclienteid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object CDSclientenome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object CDSclientetelefone: TStringField
      FieldName = 'telefone'
      Size = 14
    end
    object CDSclientecelular: TStringField
      FieldName = 'celular'
      Size = 17
    end
    object CDSclientenascimento: TDateField
      FieldName = 'nascimento'
      Required = True
    end
    object CDSclienteemail: TStringField
      FieldName = 'email'
      Size = 30
    end
    object CDSclienteOBS: TStringField
      FieldName = 'OBS'
      Size = 150
    end
  end
  object DSPcliente: TDataSetProvider
    DataSet = SQLQcliente
    Left = 248
    Top = 56
  end
  object SQLQservico: TSQLQuery
    DataSource = DSservico
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from tblservico;')
    SQLConnection = SQLConnection1
    Left = 160
    Top = 112
    object SQLQservicoid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object SQLQserviconome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object SQLQservicopreco: TBCDField
      FieldName = 'preco'
      Required = True
      Precision = 12
      Size = 2
    end
    object SQLQservicotempo: TStringField
      FieldName = 'tempo'
      Size = 5
    end
  end
  object DSservico: TDataSource
    DataSet = CDSservico
    Left = 424
    Top = 112
  end
  object CDSservico: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPservico'
    Left = 336
    Top = 112
    object CDSservicoid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object CDSserviconome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object CDSservicopreco: TBCDField
      FieldName = 'preco'
      Required = True
      Precision = 12
      Size = 2
    end
    object CDSservicotempo: TStringField
      FieldName = 'tempo'
      Size = 5
    end
  end
  object DSPservico: TDataSetProvider
    DataSet = SQLQservico
    Left = 248
    Top = 112
  end
  object SQLQproduto: TSQLQuery
    DataSource = DSproduto
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select * from tblproduto;')
    SQLConnection = SQLConnection1
    Left = 160
    Top = 168
    object SQLQprodutoid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object SQLQprodutonome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object SQLQprodutopreco: TBCDField
      FieldName = 'preco'
      Required = True
      Precision = 12
      Size = 2
    end
    object SQLQprodutocategoria: TStringField
      FieldName = 'categoria'
      Required = True
      Size = 30
    end
    object SQLQprodutonomefornecedor: TStringField
      FieldName = 'nomefornecedor'
      Size = 50
    end
  end
  object DSPproduto: TDataSetProvider
    DataSet = SQLQproduto
    Left = 248
    Top = 168
  end
  object CDSproduto: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPproduto'
    Left = 336
    Top = 168
    object CDSprodutoid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object CDSprodutonome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object CDSprodutopreco: TBCDField
      FieldName = 'preco'
      Required = True
      Precision = 12
      Size = 2
    end
    object CDSprodutocategoria: TStringField
      FieldName = 'categoria'
      Required = True
      Size = 30
    end
    object CDSprodutonomefornecedor: TStringField
      FieldName = 'nomefornecedor'
      Size = 50
    end
  end
  object DSproduto: TDataSource
    DataSet = CDSproduto
    Left = 424
    Top = 168
  end
  object SQLQfornecedor: TSQLQuery
    DataSource = DSfornecedor
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from tblfornecedor;')
    SQLConnection = SQLConnection1
    Left = 160
    Top = 224
    object SQLQfornecedorid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object SQLQfornecedornome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object SQLQfornecedoremail: TStringField
      FieldName = 'email'
      Size = 30
    end
    object SQLQfornecedortelefone: TStringField
      FieldName = 'telefone'
      Size = 14
    end
    object SQLQfornecedorcelular: TStringField
      FieldName = 'celular'
      Size = 17
    end
    object SQLQfornecedorprodutos: TStringField
      FieldName = 'produtos'
      Required = True
      Size = 150
    end
  end
  object DSPfornecedor: TDataSetProvider
    DataSet = SQLQfornecedor
    Left = 248
    Top = 224
  end
  object CDSfornecedor: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPfornecedor'
    Left = 336
    Top = 224
    object CDSfornecedorid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object CDSfornecedornome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object CDSfornecedoremail: TStringField
      FieldName = 'email'
      Size = 30
    end
    object CDSfornecedortelefone: TStringField
      FieldName = 'telefone'
      Size = 14
    end
    object CDSfornecedorcelular: TStringField
      FieldName = 'celular'
      Size = 17
    end
    object CDSfornecedorprodutos: TStringField
      FieldName = 'produtos'
      Required = True
      Size = 150
    end
  end
  object DSfornecedor: TDataSource
    DataSet = CDSfornecedor
    Left = 424
    Top = 224
  end
  object SQLQestoque: TSQLQuery
    DataSource = DSestoque
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from tblestoque;')
    SQLConnection = SQLConnection1
    Left = 160
    Top = 280
    object SQLQestoqueid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object SQLQestoqueidproduto: TIntegerField
      FieldName = 'idproduto'
    end
    object SQLQestoqueqntestoque: TIntegerField
      FieldName = 'qntestoque'
      Required = True
    end
    object SQLQestoqueultimadata: TDateField
      FieldName = 'ultimadata'
      Required = True
    end
  end
  object DSPestoque: TDataSetProvider
    DataSet = SQLQestoque
    Left = 248
    Top = 280
  end
  object CDSestoque: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPestoque'
    Left = 336
    Top = 280
    object CDSestoqueid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object CDSestoqueidproduto: TIntegerField
      FieldName = 'idproduto'
    end
    object CDSestoqueqntestoque: TIntegerField
      FieldName = 'qntestoque'
      Required = True
    end
    object CDSestoqueultimadata: TDateField
      FieldName = 'ultimadata'
      Required = True
    end
  end
  object DSestoque: TDataSource
    DataSet = CDSestoque
    Left = 424
    Top = 280
  end
  object SQLQagenda: TSQLQuery
    DataSource = DSagenda
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from tblagenda;')
    SQLConnection = SQLConnection1
    Left = 160
    Top = 336
    object SQLQagendaid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object SQLQagendaprofissional: TStringField
      FieldName = 'profissional'
      Required = True
      Size = 30
    end
    object SQLQagendahorario: TStringField
      FieldName = 'horario'
      Required = True
      Size = 5
    end
    object SQLQagendacliente: TStringField
      FieldName = 'cliente'
      Required = True
      Size = 50
    end
    object SQLQagendaagenda: TDateField
      FieldName = 'agenda'
      Required = True
    end
  end
  object DSPagenda: TDataSetProvider
    DataSet = SQLQagenda
    Left = 248
    Top = 336
  end
  object CDSagenda: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPagenda'
    Left = 336
    Top = 336
    object CDSagendaid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object CDSagendaprofissional: TStringField
      FieldName = 'profissional'
      Required = True
      Size = 30
    end
    object CDSagendahorario: TStringField
      FieldName = 'horario'
      Required = True
      Size = 5
    end
    object CDSagendacliente: TStringField
      FieldName = 'cliente'
      Required = True
      Size = 50
    end
    object CDSagendaagenda: TDateField
      FieldName = 'agenda'
      Required = True
    end
  end
  object DSagenda: TDataSource
    DataSet = CDSagenda
    Left = 424
    Top = 336
  end
  object SQLQcaixa: TSQLQuery
    DataSource = DScaixa
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from tblcaixa;')
    SQLConnection = SQLConnection1
    Left = 160
    Top = 392
    object SQLQcaixaid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object SQLQcaixanome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object SQLQcaixavalor: TBCDField
      FieldName = 'valor'
      Required = True
      Precision = 12
      Size = 2
    end
    object SQLQcaixavencimento: TDateField
      FieldName = 'vencimento'
      Required = True
    end
    object SQLQcaixatipo: TStringField
      FieldName = 'tipo'
      Required = True
      Size = 7
    end
  end
  object DSPcaixa: TDataSetProvider
    DataSet = SQLQcaixa
    Left = 248
    Top = 392
  end
  object CDScaixa: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPcaixa'
    Left = 336
    Top = 392
    object CDScaixaid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object CDScaixanome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object CDScaixavalor: TBCDField
      FieldName = 'valor'
      Required = True
      Precision = 12
      Size = 2
    end
    object CDScaixavencimento: TDateField
      FieldName = 'vencimento'
      Required = True
    end
    object CDScaixatipo: TStringField
      FieldName = 'tipo'
      Required = True
      Size = 7
    end
  end
  object DScaixa: TDataSource
    DataSet = CDScaixa
    Left = 424
    Top = 392
  end
  object SQLQfaturamento: TSQLQuery
    DataSource = DSfaturamento
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from tblfaturamento;')
    SQLConnection = SQLConnection1
    Left = 160
    Top = 448
    object SQLQfaturamentoid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object SQLQfaturamentonome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object SQLQfaturamentoservico1: TStringField
      FieldName = 'servico1'
      Size = 50
    end
    object SQLQfaturamentoservico2: TStringField
      FieldName = 'servico2'
      Size = 50
    end
    object SQLQfaturamentoservico3: TStringField
      FieldName = 'servico3'
      Size = 50
    end
    object SQLQfaturamentoservico4: TStringField
      FieldName = 'servico4'
      Size = 50
    end
    object SQLQfaturamentocolaborador1: TStringField
      FieldName = 'colaborador1'
      Size = 50
    end
    object SQLQfaturamentocolaborador2: TStringField
      FieldName = 'colaborador2'
      Size = 50
    end
    object SQLQfaturamentocolaborador3: TStringField
      FieldName = 'colaborador3'
      Size = 50
    end
    object SQLQfaturamentocolaborador4: TStringField
      FieldName = 'colaborador4'
      Size = 50
    end
    object SQLQfaturamentopreco1: TBCDField
      FieldName = 'preco1'
      Precision = 12
      Size = 2
    end
    object SQLQfaturamentopreco2: TBCDField
      FieldName = 'preco2'
      Precision = 12
      Size = 2
    end
    object SQLQfaturamentopreco3: TBCDField
      FieldName = 'preco3'
      Precision = 12
      Size = 2
    end
    object SQLQfaturamentopreco4: TBCDField
      FieldName = 'preco4'
      Precision = 12
      Size = 2
    end
    object SQLQfaturamentototal: TBCDField
      FieldName = 'total'
      Precision = 12
      Size = 2
    end
    object SQLQfaturamentovencimento: TDateField
      FieldName = 'vencimento'
      Required = True
    end
  end
  object DSPfaturamento: TDataSetProvider
    DataSet = SQLQfaturamento
    Left = 248
    Top = 448
  end
  object CDSfaturamento: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPfaturamento'
    Left = 336
    Top = 448
    object CDSfaturamentoid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object CDSfaturamentonome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object CDSfaturamentoservico1: TStringField
      FieldName = 'servico1'
      Size = 50
    end
    object CDSfaturamentoservico2: TStringField
      FieldName = 'servico2'
      Size = 50
    end
    object CDSfaturamentoservico3: TStringField
      FieldName = 'servico3'
      Size = 50
    end
    object CDSfaturamentoservico4: TStringField
      FieldName = 'servico4'
      Size = 50
    end
    object CDSfaturamentocolaborador1: TStringField
      FieldName = 'colaborador1'
      Size = 50
    end
    object CDSfaturamentocolaborador2: TStringField
      FieldName = 'colaborador2'
      Size = 50
    end
    object CDSfaturamentocolaborador3: TStringField
      FieldName = 'colaborador3'
      Size = 50
    end
    object CDSfaturamentocolaborador4: TStringField
      FieldName = 'colaborador4'
      Size = 50
    end
    object CDSfaturamentopreco1: TBCDField
      FieldName = 'preco1'
      Precision = 12
      Size = 2
    end
    object CDSfaturamentopreco2: TBCDField
      FieldName = 'preco2'
      Precision = 12
      Size = 2
    end
    object CDSfaturamentopreco3: TBCDField
      FieldName = 'preco3'
      Precision = 12
      Size = 2
    end
    object CDSfaturamentopreco4: TBCDField
      FieldName = 'preco4'
      Precision = 12
      Size = 2
    end
    object CDSfaturamentototal: TBCDField
      FieldName = 'total'
      Precision = 12
      Size = 2
    end
    object CDSfaturamentovencimento: TDateField
      FieldName = 'vencimento'
      Required = True
    end
  end
  object DSfaturamento: TDataSource
    DataSet = CDSfaturamento
    Left = 424
    Top = 448
  end
end
