unit u_datamodule;

interface

uses
  SysUtils, Classes, DBXpress, FMTBcd, Provider, DBClient, DB, SqlExpr;

type
  TDataModule1 = class(TDataModule)
    SQLConnection1: TSQLConnection;
    SQLQcolaborador: TSQLQuery;
    DScolaborador: TDataSource;
    CDScolaborador: TClientDataSet;
    DSPcolaborador: TDataSetProvider;
    SQLQcliente: TSQLQuery;
    DScliente: TDataSource;
    CDScliente: TClientDataSet;
    DSPcliente: TDataSetProvider;
    SQLQservico: TSQLQuery;
    DSservico: TDataSource;
    CDSservico: TClientDataSet;
    DSPservico: TDataSetProvider;
    SQLQproduto: TSQLQuery;
    DSPproduto: TDataSetProvider;
    CDSproduto: TClientDataSet;
    DSproduto: TDataSource;
    SQLQfornecedor: TSQLQuery;
    DSPfornecedor: TDataSetProvider;
    CDSfornecedor: TClientDataSet;
    DSfornecedor: TDataSource;
    SQLQestoque: TSQLQuery;
    DSPestoque: TDataSetProvider;
    CDSestoque: TClientDataSet;
    DSestoque: TDataSource;
    SQLQagenda: TSQLQuery;
    DSPagenda: TDataSetProvider;
    CDSagenda: TClientDataSet;
    DSagenda: TDataSource;
    SQLQcaixa: TSQLQuery;
    DSPcaixa: TDataSetProvider;
    CDScaixa: TClientDataSet;
    DScaixa: TDataSource;
    SQLQfaturamento: TSQLQuery;
    DSPfaturamento: TDataSetProvider;
    CDSfaturamento: TClientDataSet;
    DSfaturamento: TDataSource;
    SQLQcolaboradorid: TIntegerField;
    SQLQcolaboradornome: TStringField;
    SQLQcolaboradornascimento: TDateField;
    SQLQcolaboradortelefone: TStringField;
    SQLQcolaboradorcelular: TStringField;
    SQLQcolaboradoremail: TStringField;
    SQLQcolaboradorusuario: TStringField;
    SQLQcolaboradorsenha: TStringField;
    CDScolaboradorid: TIntegerField;
    CDScolaboradornome: TStringField;
    CDScolaboradornascimento: TDateField;
    CDScolaboradortelefone: TStringField;
    CDScolaboradorcelular: TStringField;
    CDScolaboradoremail: TStringField;
    CDScolaboradorusuario: TStringField;
    CDScolaboradorsenha: TStringField;
    SQLQclienteid: TIntegerField;
    SQLQclientenome: TStringField;
    SQLQclientetelefone: TStringField;
    SQLQclientecelular: TStringField;
    SQLQclientenascimento: TDateField;
    SQLQclienteemail: TStringField;
    SQLQclienteOBS: TStringField;
    CDSclienteid: TIntegerField;
    CDSclientenome: TStringField;
    CDSclientetelefone: TStringField;
    CDSclientecelular: TStringField;
    CDSclientenascimento: TDateField;
    CDSclienteemail: TStringField;
    CDSclienteOBS: TStringField;
    SQLQagendaid: TIntegerField;
    SQLQagendaprofissional: TStringField;
    SQLQagendahorario: TStringField;
    SQLQagendacliente: TStringField;
    SQLQagendaagenda: TDateField;
    CDSagendaid: TIntegerField;
    CDSagendaprofissional: TStringField;
    CDSagendahorario: TStringField;
    CDSagendacliente: TStringField;
    CDSagendaagenda: TDateField;
    SQLQfaturamentoid: TIntegerField;
    SQLQfaturamentonome: TStringField;
    SQLQfaturamentoservico1: TStringField;
    SQLQfaturamentoservico2: TStringField;
    SQLQfaturamentoservico3: TStringField;
    SQLQfaturamentoservico4: TStringField;
    SQLQfaturamentocolaborador1: TStringField;
    SQLQfaturamentocolaborador2: TStringField;
    SQLQfaturamentocolaborador3: TStringField;
    SQLQfaturamentocolaborador4: TStringField;
    SQLQfaturamentopreco1: TBCDField;
    SQLQfaturamentopreco2: TBCDField;
    SQLQfaturamentopreco3: TBCDField;
    SQLQfaturamentopreco4: TBCDField;
    SQLQfaturamentototal: TBCDField;
    SQLQfaturamentovencimento: TDateField;
    CDSfaturamentoid: TIntegerField;
    CDSfaturamentonome: TStringField;
    CDSfaturamentoservico1: TStringField;
    CDSfaturamentoservico2: TStringField;
    CDSfaturamentoservico3: TStringField;
    CDSfaturamentoservico4: TStringField;
    CDSfaturamentocolaborador1: TStringField;
    CDSfaturamentocolaborador2: TStringField;
    CDSfaturamentocolaborador3: TStringField;
    CDSfaturamentocolaborador4: TStringField;
    CDSfaturamentopreco1: TBCDField;
    CDSfaturamentopreco2: TBCDField;
    CDSfaturamentopreco3: TBCDField;
    CDSfaturamentopreco4: TBCDField;
    CDSfaturamentototal: TBCDField;
    CDSfaturamentovencimento: TDateField;
    SQLQservicoid: TIntegerField;
    SQLQserviconome: TStringField;
    SQLQservicopreco: TBCDField;
    SQLQservicotempo: TStringField;
    CDSservicoid: TIntegerField;
    CDSserviconome: TStringField;
    CDSservicopreco: TBCDField;
    CDSservicotempo: TStringField;
    SQLQprodutoid: TIntegerField;
    SQLQprodutonome: TStringField;
    SQLQprodutopreco: TBCDField;
    SQLQprodutocategoria: TStringField;
    SQLQprodutonomefornecedor: TStringField;
    CDSprodutoid: TIntegerField;
    CDSprodutonome: TStringField;
    CDSprodutopreco: TBCDField;
    CDSprodutocategoria: TStringField;
    CDSprodutonomefornecedor: TStringField;
    SQLQfornecedorid: TIntegerField;
    SQLQfornecedornome: TStringField;
    SQLQfornecedoremail: TStringField;
    SQLQfornecedortelefone: TStringField;
    SQLQfornecedorcelular: TStringField;
    SQLQfornecedorprodutos: TStringField;
    CDSfornecedorid: TIntegerField;
    CDSfornecedornome: TStringField;
    CDSfornecedoremail: TStringField;
    CDSfornecedortelefone: TStringField;
    CDSfornecedorcelular: TStringField;
    CDSfornecedorprodutos: TStringField;
    SQLQcaixaid: TIntegerField;
    SQLQcaixanome: TStringField;
    SQLQcaixavalor: TBCDField;
    SQLQcaixavencimento: TDateField;
    SQLQcaixatipo: TStringField;
    CDScaixaid: TIntegerField;
    CDScaixanome: TStringField;
    CDScaixavalor: TBCDField;
    CDScaixavencimento: TDateField;
    CDScaixatipo: TStringField;
    SQLQestoqueid: TIntegerField;
    SQLQestoqueidproduto: TIntegerField;
    SQLQestoqueqntestoque: TIntegerField;
    SQLQestoqueultimadata: TDateField;
    CDSestoqueid: TIntegerField;
    CDSestoqueidproduto: TIntegerField;
    CDSestoqueqntestoque: TIntegerField;
    CDSestoqueultimadata: TDateField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

end.
