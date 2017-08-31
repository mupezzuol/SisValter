unit u_cadfornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  Tfrm_cadfornecedor = class(TForm)
    btn_novo: TBitBtn;
    btn_salvar: TBitBtn;
    btn_alterar: TBitBtn;
    btn_limpar: TBitBtn;
    btn_cancelar: TBitBtn;
    btn_excluir: TBitBtn;
    btn_imprimir: TBitBtn;
    btn_sair: TBitBtn;
    btn_consultar: TBitBtn;
    Label1: TLabel;
    edt_nome: TEdit;
    edt_email: TEdit;
    lbl_nome: TLabel;
    lbl_email: TLabel;
    lbl_telefone: TLabel;
    lbl_celular: TLabel;
    lbl_produto: TLabel;
    produtos: TMemo;
    edt_id: TEdit;
    edt_telefone: TMaskEdit;
    edt_celular: TMaskEdit;
    lbl_asterisco1: TLabel;
    lbl_asterisco2: TLabel;
    procedure btn_imprimirClick(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_limparClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_consultarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_celularExit(Sender: TObject);
    procedure edt_telefoneExit(Sender: TObject);
    procedure edt_telefoneKeyPress(Sender: TObject; var Key: Char);
    procedure edt_celularKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cadfornecedor: Tfrm_cadfornecedor;
  cel, tel: string;
  idd:Integer;

implementation

uses u_relafornecedor, u_datamodule, u_cadfornconsulta;

{$R *.dfm}

procedure Tfrm_cadfornecedor.btn_imprimirClick(Sender: TObject);
begin
  DataModule1.SQLQfornecedor.Active :=False;
  DataModule1.SQLQfornecedor.SQL.Clear;            // ESTE ; FECHA O COMANDO E DPS FECHA A STRING
  DataModule1.SQLQfornecedor.SQL.Add('select * from tblfornecedor where id = "'+edt_id.Text+'";' );
  datamodule1.SQLQfornecedor.Open;
  datamodule1.CDSfornecedor.Refresh;

  //abrir impressao corretamente
  frm_relafornecedor.QuickRep1.Preview;
end;

procedure Tfrm_cadfornecedor.btn_novoClick(Sender: TObject);
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

  edt_id.Enabled:=False;
  edt_nome.Enabled:=True;
  edt_email.Enabled:=True;
  edt_telefone.Enabled:=True;
  edt_celular.Enabled:=True;
  produtos.Enabled:=True;
    
  edt_id.Text:='';
  edt_nome.Text:='';
  edt_email.Text:='';
  edt_telefone.Text:='';
  edt_celular.Text:='';
  produtos.Text:='';
  
  edt_nome.SetFocus;
end;

procedure Tfrm_cadfornecedor.btn_salvarClick(Sender: TObject);
begin
  if (edt_nome.Text = '') or (produtos.Text = '') then
    begin
      MessageDlg('Preencha todos os campos obrigatóoios', mtInformation,[mbOK],0);

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
      edt_email.Enabled:=True;
      edt_telefone.Enabled:=True;
      edt_celular.Enabled:=True;
      produtos.Enabled:=True;

      lbl_asterisco1.Visible:=True;
      lbl_asterisco2.Visible:=True;

      edt_nome.SetFocus;
    end
  else
    begin
      Datamodule1.SQLQfornecedor.Active:=False;
      DataModule1.SQLQfornecedor.SQL.Clear;
      DataModule1.SQLQfornecedor.SQL.Add('select * from tblfornecedor where id="'+ edt_id.Text +'";');
      DataModule1.SQLQfornecedor.Open;
      DataModule1.CDSfornecedor.Refresh;

      if not DataModule1.SQLQfornecedor.Eof then
        begin
          MessageDlg('Cadastro do fornecedor alterado com sucesso', mtInformation,[mbOK],0);

          Datamodule1.SQLQfornecedor.Active:=False;
          DataModule1.SQLQfornecedor.SQL.Clear;
          DataModule1.SQLQfornecedor.SQL.Add('update tblfornecedor set nome="'+ edt_nome.Text +'", telefone="'+ edt_telefone.Text +'", celular="'+ edt_celular.Text +'", email="'+ edt_email.Text +'", produtos="'+ produtos.Text +'" where id="'+ edt_id.Text +'";');
          DataModule1.SQLQfornecedor.ExecSQL();
        end
      else
        begin
          MessageDlg('Fornecedor cadastrado com sucesso', mtInformation,[mbOK],0);

          Datamodule1.SQLQfornecedor.Active:=False;
          DataModule1.SQLQfornecedor.SQL.Clear;
          DataModule1.SQLQfornecedor.SQL.Add(' insert into tblfornecedor (nome, telefone, celular, email, produtos) values ("'+ edt_nome.Text +'", "'+ edt_telefone.Text +'","'+ edt_celular.Text +'","'+ edt_email.Text +'", "'+ produtos.Text +'");');
          DataModule1.SQLQfornecedor.ExecSQL();
        end;

      edt_id.Enabled:=False;
      edt_nome.Enabled:=False;
      edt_email.Enabled:=False;
      edt_telefone.Enabled:=False;
      edt_celular.Enabled:=False;
      produtos.Enabled:=False;

      btn_novo.Enabled:=True;
      btn_salvar.Enabled:=False;
      btn_alterar.Enabled:=True;
      btn_limpar.Enabled:=False;
      btn_cancelar.Enabled:=False;
      btn_excluir.Enabled:=True;
      btn_consultar.Enabled:=True;
      btn_imprimir.Enabled:=True;
      btn_sair.Enabled:=True;

      with DataModule1.SQLQfornecedor do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from tblfornecedor where nome="'+ edt_nome.Text +'";');
          Open;
          idd:= DataModule1.SQLQfornecedorid.Value;
          edt_id.Text:=IntToStr (idd);
          DataModule1.SQLQfornecedor.Close;
        end;

      lbl_asterisco1.Visible:=False;
      lbl_asterisco2.Visible:=False;
    end;
end;

procedure Tfrm_cadfornecedor.btn_alterarClick(Sender: TObject);
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

  produtos.Enabled:=True;
  edt_id.Enabled:=False;
  edt_nome.Enabled:=True;
  edt_email.Enabled:=True;
  edt_telefone.Enabled:=True;
  edt_celular.Enabled:=True;

  edt_nome.SetFocus;
end;

procedure Tfrm_cadfornecedor.btn_limparClick(Sender: TObject);
begin
  produtos.Text:='';
  edt_nome.Text:='';
  edt_email.Text:='';
  edt_telefone.Text:='';
  edt_celular.Text:='';

  edt_nome.SetFocus;
end;

procedure Tfrm_cadfornecedor.btn_cancelarClick(Sender: TObject);
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

  produtos.Enabled:=False;
  edt_id.Enabled:=False;
  edt_nome.Enabled:=False;
  edt_email.Enabled:=False;
  edt_telefone.Enabled:=False;
  edt_celular.Enabled:=False;

  produtos.Text:='';
  edt_id.Text:='';
  edt_nome.Text:='';
  edt_email.Text:='';
  edt_telefone.Text:='';
  edt_celular.Text:='';

  lbl_asterisco1.Visible:=False;
  lbl_asterisco2.Visible:=False;
end;

procedure Tfrm_cadfornecedor.btn_excluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir esse registro?', mtWarning, [mbYes, mbNo], 0)=mrYes then
    begin
      MessageDlg('Seu registro foi excluido com sucesso', mtInformation,[mbOK],0);

      Datamodule1.SQLQfornecedor.Active:=False;
      DataModule1.SQLQfornecedor.SQL.Clear;
      DataModule1.SQLQfornecedor.SQL.Add('delete from tblfornecedor where id = "'+edt_id.Text+'";');
      DataModule1.SQLQfornecedor.ExecSQL();

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
      produtos.Text:='';
      edt_nome.Text:='';
      edt_email.Text:='';
      edt_telefone.Text:='';
      edt_celular.Text:='';
    end;
end;

procedure Tfrm_cadfornecedor.btn_consultarClick(Sender: TObject);
begin
  Datamodule1.SQLQfornecedor.Active:=False;
  DataModule1.SQLQfornecedor.SQL.Clear;
  DataModule1.SQLQfornecedor.SQL.Add('select * from tblfornecedor order by id;');
  DataModule1.SQLQfornecedor.Open;
  DataModule1.CDSfornecedor.Refresh;

  frm_cadfornconsulta.Show;
end;

procedure Tfrm_cadfornecedor.btn_sairClick(Sender: TObject);
begin
  btn_novo.Enabled:=True;
  btn_salvar.Enabled:=False;
  btn_alterar.Enabled:=False;
  btn_limpar.Enabled:=False;
  btn_cancelar.Enabled:=False;
  btn_excluir.Enabled:=False;
  btn_consultar.Enabled:=True;
  btn_imprimir.Enabled:=False;
  btn_sair.Enabled:=True;;

  produtos.Enabled:=False;
  edt_id.Enabled:=False;
  edt_nome.Enabled:=False;
  edt_email.Enabled:=False;
  edt_telefone.Enabled:=False;
  edt_celular.Enabled:=False;

  frm_cadfornecedor.Close;

  produtos.Text:='';
  edt_id.Text:='';
  edt_nome.Text:='';
  edt_email.Text:='';
  edt_telefone.Text:='';
  edt_celular.Text:='';
end;

procedure Tfrm_cadfornecedor.edt_celularExit(Sender: TObject);
begin
  if edt_celular.Text='() -' then edt_celular.Text:='';
end;

procedure Tfrm_cadfornecedor.edt_telefoneExit(Sender: TObject);
begin
  if edt_telefone.Text='() -' then edt_telefone.Text:='';
end;

procedure Tfrm_cadfornecedor.edt_telefoneKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', #8]) then
    begin
      key:=#0;
      Beep;
    end;
end;

procedure Tfrm_cadfornecedor.edt_celularKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', #8]) then
    begin
      key:=#0;
      Beep;
    end;
end;

procedure Tfrm_cadfornecedor.FormCreate(Sender: TObject);
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

  produtos.Enabled:=False;
  edt_id.Enabled:=False;
  edt_nome.Enabled:=False;
  edt_email.Enabled:=False;
  edt_telefone.Enabled:=False;
  edt_celular.Enabled:=False;

  produtos.Text:='';
end;

end.
