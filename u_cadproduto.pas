unit u_cadproduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, XPMan, Mask, ComCtrls;

type
  Tfrm_cadproduto = class(TForm)
    btn_novo: TBitBtn;
    btn_alterar: TBitBtn;
    btn_limpar: TBitBtn;
    btn_cancelar: TBitBtn;
    btn_excluir: TBitBtn;
    btn_consultar: TBitBtn;
    btn_imprimir: TBitBtn;
    btn_sair: TBitBtn;
    XPManifest1: TXPManifest;
    btn_salvar: TBitBtn;
    lbl_id: TLabel;
    edt_nome: TEdit;
    lbl_preco: TLabel;
    lbl_nome: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    edt_id: TEdit;
    edt_preco: TEdit;
    cb_categoria: TComboBox;
    cb_fornecedor: TComboBox;
    procedure btn_novoClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_consultarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_limparClick(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure edt_precoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_precoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cadproduto: Tfrm_cadproduto;
  idd, qnt: Integer;

implementation

uses u_cadproconsulta, u_datamodule, u_relaproduto, u_cadcliente;

function datatomysql (data:string):string;
var dd,mm,aaaa:string;

begin
  dd:=Copy(data, 1, 2);
  mm:=Copy(data, 4, 2);
  aaaa:=Copy(data, 7, 4);
  datatomysql:=aaaa+ '-'  +mm+ '-' +dd;
end;

function valortomysql (valor:string):string;
begin
  valortomysql:=stringreplace(valor, ',', '.',[rfReplaceAll, rfIgnoreCase]);
end;

{$R *.dfm}

procedure Tfrm_cadproduto.btn_novoClick(Sender: TObject);
begin
  cb_fornecedor.Clear;
  cb_fornecedor.Items.Add('<Selecione o Fornecedor>');

  with DataModule1.SQLQfornecedor do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from tblfornecedor;');
      Open;

      while Not DataModule1.SQLQfornecedor.Eof do
        begin
          cb_fornecedor.Items.Add(DataModule1.SQLQfornecedornome.Value);
          DataModule1.SQLQfornecedor.Next;
        end;

      with DataModule1.SQLQfornecedor do
        begin
          Close;
        end;
          
      cb_fornecedor.ItemIndex:=0;
    end;

  btn_novo.Enabled:=False;
  btn_salvar.Enabled:=True;
  btn_alterar.Enabled:=False;
  btn_limpar.Enabled:=True;
  btn_cancelar.Enabled:=True;
  btn_excluir.Enabled:=False;
  btn_consultar.Enabled:=False;
  btn_imprimir.Enabled:=False;
  btn_sair.Enabled:=False;

  cb_categoria.Enabled:=True;
  edt_id.Enabled:=False;
  edt_nome.Enabled:=True;
  edt_preco.Enabled:=True;
  cb_fornecedor.Enabled:=True;

  edt_id.Text:='';
  edt_nome.Text:='';
  cb_categoria.ItemIndex:=0;
  edt_preco.Text:='0,00';
  cb_fornecedor.ItemIndex:=0;

  edt_nome.SetFocus;
end;

procedure Tfrm_cadproduto.btn_salvarClick(Sender: TObject);
begin
  if (edt_preco.Text = '0,00') or (edt_nome.Text = '') or (cb_categoria.ItemIndex = 0) or (cb_fornecedor.ItemIndex = 0) then
    begin
      MessageDlg('Preencha todos os campos', mtInformation,[mbOK],0);

      btn_novo.Enabled:=False;
      btn_salvar.Enabled:=True;
      btn_alterar.Enabled:=False;
      btn_limpar.Enabled:=True;
      btn_cancelar.Enabled:=True;
      btn_excluir.Enabled:=False;
      btn_consultar.Enabled:=False;
      btn_imprimir.Enabled:=False;
      btn_sair.Enabled:=False;

      edt_id.Enabled:=False;
      edt_nome.Enabled:=True;
      edt_preco.Enabled:=True;
      cb_categoria.Enabled:=True;
      cb_fornecedor.Enabled:=True;

      edt_nome.SetFocus;
    end
  else
    begin
      Datamodule1.SQLQproduto.Active:=False;
      DataModule1.SQLQproduto.SQL.Clear;
      DataModule1.SQLQproduto.SQL.Add('select * from tblproduto where id= "'+edt_id.Text+'" ;');
      DataModule1.SQLQproduto.Open;
      DataModule1.CDSproduto.Refresh;

      if not DataModule1.SQLQproduto.Eof then
        begin
          MessageDlg('Cadastro de Produto alterado com sucesso', mtInformation,[mbOK],0);

          Datamodule1.SQLQproduto.Active:=False;
          DataModule1.SQLQproduto.SQL.Clear;
          DataModule1.SQLQproduto.SQL.Add('update tblproduto set nome="'+edt_nome.Text+'", preco="'+valortomysql(edt_preco.Text)+'", categoria="'+cb_categoria.Text+'", nomefornecedor="'+cb_fornecedor.Text+'" where id="'+edt_id.Text+'";');
          DataModule1.SQLQproduto.ExecSQL();
        end
      else
        begin
          if cb_categoria.ItemIndex = 0 then
            begin
              MessageDlg('Selecione uma categoria', mtInformation,[mbOK],0);

              cb_categoria.SetFocus;

              cb_categoria.Enabled:=True;

              btn_novo.Enabled:=False;
              btn_salvar.Enabled:=True;
              btn_alterar.Enabled:=False;
              btn_limpar.Enabled:=True;
              btn_cancelar.Enabled:=True;
              btn_excluir.Enabled:=False;
              btn_consultar.Enabled:=False;
              btn_imprimir.Enabled:=False;
              btn_sair.Enabled:=False;
            end
          else
            begin
              MessageDlg('Produto cadastrado com sucesso', mtInformation,[mbOK],0);

              Datamodule1.SQLQproduto.Active:=false;
              DataModule1.SQLQproduto.SQL.Clear;
              DataModule1.SQLQproduto.SQL.Add(' insert into tblproduto (nome, preco, categoria, nomefornecedor) values ("'+edt_nome.Text+'","'+ valortomysql(edt_preco.Text)+'", "'+cb_categoria.Text+'", "'+cb_fornecedor.Text+'" ) ;');
              DataModule1.SQLQproduto.ExecSQL();

              cb_fornecedor.Enabled:=False;
              edt_id.Enabled:=False;
              cb_categoria.Enabled:=False;
              edt_nome.Enabled:=False;
              edt_preco.Enabled:=False;
            end;
        end;

      edt_id.Enabled:=False;
      edt_nome.Enabled:=False;
      edt_preco.Enabled:=False;
      cb_categoria.Enabled:=False;
      cb_fornecedor.Enabled:=False;

      btn_novo.Enabled:=True;
      btn_salvar.Enabled:=False;
      btn_alterar.Enabled:=True;
      btn_limpar.Enabled:=False;
      btn_cancelar.Enabled:=False;
      btn_excluir.Enabled:=True;
      btn_consultar.Enabled:=True;
      btn_imprimir.Enabled:=True;
      btn_sair.Enabled:=True;

      with DataModule1.SQLQproduto do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from tblProduto where nome="'+ edt_nome.Text +'";');
          Open;
          idd:= DataModule1.SQLQprodutoid.Value;
          edt_id.Text:=IntToStr (idd);
          DataModule1.SQLQproduto.Close;
        end;
    end;
end;

procedure Tfrm_cadproduto.btn_alterarClick(Sender: TObject);
begin
  btn_novo.Enabled:=False;
  btn_salvar.Enabled:=True;
  btn_alterar.Enabled:=False;
  btn_limpar.Enabled:=True;
  btn_cancelar.Enabled:=True;
  btn_excluir.Enabled:=False;
  btn_consultar.Enabled:=False;
  btn_imprimir.Enabled:=False;
  btn_sair.Enabled:=False;

  cb_categoria.Enabled:=True;
  edt_id.Enabled:=False;
  edt_nome.Enabled:=True;
  edt_preco.Enabled:=True;
  cb_fornecedor.Enabled:=True;

  edt_nome.SetFocus;
end;

procedure Tfrm_cadproduto.btn_cancelarClick(Sender: TObject);
begin
  btn_novo.Enabled:=True;
  btn_salvar.Enabled:=False;
  btn_alterar.Enabled:=False;
  btn_limpar.Enabled:=False;
  btn_cancelar.Enabled:=False;
  btn_excluir.Enabled:=False;
  btn_consultar.Enabled:=True;
  btn_imprimir.Enabled:=False;
  btn_sair.Enabled:=True;

  edt_id.Enabled:=False;
  edt_nome.Enabled:=False;
  cb_categoria.Enabled:=False;
  edt_preco.Enabled:=False;
  cb_fornecedor.Enabled:=False;

  edt_id.Text:='';
  edt_nome.Text:='';
  cb_categoria.ItemIndex:=0;
  edt_preco.Text:='0,00';
  cb_fornecedor.ItemIndex:=0;
end;

procedure Tfrm_cadproduto.btn_excluirClick(Sender: TObject);
begin
  Datamodule1.SQLQproduto.Active:=False;
  DataModule1.SQLQproduto.SQL.Clear;
  DataModule1.SQLQproduto.SQL.Add('select * from tblproduto where id= "'+edt_id.Text+'" ;');
  DataModule1.SQLQproduto.Open;
  DataModule1.CDSproduto.Refresh;

  Datamodule1.SQLQestoque.Active:=False;
  DataModule1.SQLQestoque.SQL.Clear;
  DataModule1.SQLQestoque.SQL.Add('select * from tblestoque where idproduto= "'+edt_id.Text+'" ;');
  DataModule1.SQLQestoque.Open;
  DataModule1.CDSestoque.Refresh;

  qnt:= DataModule1.SQLQestoqueqntestoque.Value;

  if (Not DataModule1.SQLQproduto.Eof) and (qnt>0) then
    MessageDlg('Ainda existe estoque para este item', mtInformation,[mbOK],0);

  if (Not DataModule1.SQLQproduto.Eof) and (qnt=0) and (not DataModule1.SQLQestoque.Eof) then

    if MessageDlg('Ja houve movimentação de estoque para esse item, deseja excluir mesmo assim?', mtWarning, [mbYes, mbNo], 0)=mrYes then
      begin
        MessageDlg('Seu registro foi excluido com sucesso', mtInformation,[mbOK],0);

        Datamodule1.SQLQestoque.Active:=False;
        DataModule1.SQLQestoque.SQL.Clear;
        DataModule1.SQLQestoque.SQL.Add('delete from tblestoque where idproduto = "'+edt_id.Text+'";');
        DataModule1.SQLQestoque.ExecSQL();

        Datamodule1.SQLQproduto.Active:=False;
        DataModule1.SQLQproduto.SQL.Clear;
        DataModule1.SQLQproduto.SQL.Add('delete from tblproduto where id = "'+edt_id.Text+'";');
        DataModule1.SQLQproduto.ExecSQL();

        btn_novo.Enabled:=True;
        btn_salvar.Enabled:=False;
        btn_alterar.Enabled:=False;
        btn_limpar.Enabled:=False;
        btn_cancelar.Enabled:=False;
        btn_excluir.Enabled:=False;
        btn_consultar.Enabled:=True;
        btn_imprimir.Enabled:=False;
        btn_sair.Enabled:=True;

        edt_id.Text:='';
        edt_nome.Text:='';
        cb_categoria.ItemIndex:=0;
        edt_preco.Text:='0,00';
      end;

  if (not DataModule1.SQLQproduto.Eof) and (DataModule1.SQLQestoque.Eof) then
    if MessageDlg('Deseja Realmente Excluir o Registro?', mtWarning, [mbYes, mbNo], 0)=mrYes then
      begin
        MessageDlg('Seu registro foi excluido com sucesso', mtInformation,[mbOK],0);

        Datamodule1.SQLQproduto.Active:=False;
        DataModule1.SQLQproduto.SQL.Clear;
        DataModule1.SQLQproduto.SQL.Add('delete from tblproduto where id = "'+edt_id.Text+'";');
        DataModule1.SQLQproduto.ExecSQL();

        btn_novo.Enabled:=True;
        btn_salvar.Enabled:=False;
        btn_alterar.Enabled:=False;
        btn_limpar.Enabled:=False;
        btn_cancelar.Enabled:=False;
        btn_excluir.Enabled:=False;
        btn_consultar.Enabled:=True;
        btn_imprimir.Enabled:=False;
        btn_sair.Enabled:=True;

        edt_id.Text:='';
        edt_nome.Text:='';
        cb_categoria.ItemIndex:=0;
        edt_preco.Text:='0,00';
      end;
end;

procedure Tfrm_cadproduto.btn_consultarClick(Sender: TObject);
begin
  cb_fornecedor.Clear;
  cb_fornecedor.Items.Add('<Selecione o Fornecedor>');

  with DataModule1.SQLQfornecedor do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from tblfornecedor;');
      Open;

      while Not DataModule1.SQLQfornecedor.Eof do
        begin
          cb_fornecedor.Items.Add(DataModule1.SQLQfornecedornome.Value);
          DataModule1.SQLQfornecedor.Next;
        end;

      with DataModule1.SQLQfornecedor do
        begin
          Close;
        end;

      cb_fornecedor.ItemIndex:=0;
    end;

  Datamodule1.SQLQproduto.Active:=False;
  DataModule1.SQLQproduto.SQL.Clear;
  DataModule1.SQLQproduto.SQL.Add('select * from tblproduto order by id;');
  DataModule1.SQLQproduto.Open;
  DataModule1.CDSproduto.Refresh;

  frm_cadproconsulta.Show;
end;

procedure Tfrm_cadproduto.btn_sairClick(Sender: TObject);
begin
  btn_novo.Enabled:=True;
  btn_salvar.Enabled:=False;
  btn_alterar.Enabled:=False;
  btn_limpar.Enabled:=False;
  btn_cancelar.Enabled:=False;
  btn_excluir.Enabled:=False;
  btn_consultar.Enabled:=True;
  btn_imprimir.Enabled:=False;
  btn_sair.Enabled:=True;

  edt_id.Enabled:=False;
  edt_nome.Enabled:=False;
  cb_categoria.Enabled:=False;
  edt_preco.Enabled:=False;
  edt_id.Enabled:=False;
  cb_fornecedor.Enabled:=False;

  frm_cadproduto.Close;
  
  edt_id.Text:='';
  edt_nome.text:='';
  cb_categoria.ItemIndex:=0;
  edt_preco.text:='0,00';
  cb_fornecedor.ItemIndex:=0;
end;

procedure Tfrm_cadproduto.FormCreate(Sender: TObject);
begin
  btn_novo.Enabled:=True;
  btn_novo.Enabled:=True;
  btn_salvar.Enabled:=False;
  btn_alterar.Enabled:=False;
  btn_limpar.Enabled:=False;
  btn_cancelar.Enabled:=False;
  btn_excluir.Enabled:=False;
  btn_consultar.Enabled:=True;
  btn_imprimir.Enabled:=False;
  btn_sair.Enabled:=True;

  edt_id.Enabled:=False;
  edt_nome.Enabled:=False;
  cb_categoria.Enabled:=False;
  edt_preco.Enabled:=False;
  cb_fornecedor.Enabled:=False;

  edt_id.Text:='';
  edt_nome.Text:='';
  cb_categoria.ItemIndex:=0;
  edt_preco.Text:='0,00';
  cb_fornecedor.ItemIndex:=0;
end;

procedure Tfrm_cadproduto.btn_limparClick(Sender: TObject);
begin
  edt_nome.Text:='';
  cb_categoria.ItemIndex:=0;
  edt_preco.Text:='0,00';
  cb_fornecedor.ItemIndex:=0;

  edt_nome.SetFocus;
end;

procedure Tfrm_cadproduto.btn_imprimirClick(Sender: TObject);
begin
  DataModule1.SQLQproduto.Active :=False;
  DataModule1.SQLQproduto.SQL.Clear;            // ESTE ; FECHA O COMANDO E DPS FECHA A STRING
  DataModule1.SQLQproduto.SQL.Add('select * from tblproduto where id = "'+ edt_id.Text +'";' );
  datamodule1.SQLQproduto.Open;
  datamodule1.CDSproduto.Refresh;

  frm_relaproduto.QuickRep1.Preview;
end;

procedure Tfrm_cadproduto.edt_precoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', ',', #8]) then
    begin
      key:=#0;
      Beep;
    end;
end;

procedure Tfrm_cadproduto.edt_precoExit(Sender: TObject);
begin
  edt_preco.Text:=FormatFloat('##.00 ,', StrToFloat(edt_preco.Text)) ;
end;

end.
