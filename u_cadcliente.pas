unit u_cadcliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, XPMan, Mask;

type
  Tfrm_cadcliente = class(TForm)
    btn_novo: TBitBtn;
    btn_salvar: TBitBtn;
    btn_alterar: TBitBtn;
    btn_limpar: TBitBtn;
    btn_cancelar: TBitBtn;
    btn_excluir: TBitBtn;
    btn_imprimir: TBitBtn;
    btn_sair: TBitBtn;
    btn_consultar: TBitBtn;
    edt_nome: TEdit;
    XPManifest1: TXPManifest;
    lbl_nome: TLabel;
    lbl_nascimento: TLabel;
    edt_email: TEdit;
    lbl_email: TLabel;
    lbl_telefone: TLabel;
    lbl_celular: TLabel;
    medt_nascimento: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    obs: TMemo;
    edt_id: TEdit;
    edt_telefone: TMaskEdit;
    edt_celular: TMaskEdit;
    lbl_asterisco1: TLabel;
    lbl_asterisco2: TLabel;
    procedure btn_novoClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_consultarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_telefoneExit(Sender: TObject);
    procedure edt_celularExit(Sender: TObject);
    procedure edt_telefoneKeyPress(Sender: TObject; var Key: Char);
    procedure edt_celularKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btn_limparClick(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure medt_nascimentoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cadcliente: Tfrm_cadcliente;
  tel, cel: string;
  idd: Integer;
implementation

uses u_cadcliconsulta, u_datamodule, u_relacliente, u_menucli;

function datatomysql (data:string):string;
var dd,mm,aaaa:string;

begin
  dd:=Copy(data, 1, 2);
  mm:=Copy(data, 4, 2);
  aaaa:=Copy(data, 7, 4);
  datatomysql:=aaaa+ '-'  +mm+ '-' +dd;
end;

{$R *.dfm}

procedure Tfrm_cadcliente.btn_novoClick(Sender: TObject);
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
  medt_nascimento.Enabled:=True;
  edt_email.Enabled:=True;
  edt_telefone.Enabled:=True;
  edt_celular.Enabled:=True;
  obs.Enabled:=True;

  edt_id.Text:='';
  edt_nome.Text:='';
  medt_nascimento.Text:='';
  edt_email.Text:='';
  edt_telefone.Text:='';
  edt_celular.Text:='';
  obs.Text:='';
  
  edt_nome.SetFocus;
end;

procedure Tfrm_cadcliente.btn_salvarClick(Sender: TObject);
begin
  if (medt_nascimento.Text = '  /  /    ') or (edt_nome.Text = '') or (edt_email.Text = '') then
    begin
      MessageDlg('Preencha todos so campos obrigatórios', mtInformation,[mbOK],0);

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
      medt_nascimento.Enabled:=True;
      edt_email.Enabled:=True;
      edt_telefone.Enabled:=True;
      edt_celular.Enabled:=True;

      lbl_asterisco1.Visible:=True;
      lbl_asterisco2.Visible:=True;

      edt_nome.SetFocus;
    end
  else
    begin
      Datamodule1.SQLQcliente.Active:=False;
      DataModule1.SQLQcliente.SQL.Clear;
      DataModule1.SQLQcliente.SQL.Add('select * from tblcliente where id="'+ edt_id.Text +'";');
      DataModule1.SQLQcliente.Open;
      DataModule1.CDScliente.Refresh;

      if not DataModule1.SQLQcliente.Eof then
        begin
          MessageDlg('Cadastro do cliente alterado com sucesso', mtInformation,[mbOK],0);

          Datamodule1.SQLQcliente.Active:=False;
          DataModule1.SQLQcliente.SQL.Clear;
          DataModule1.SQLQcliente.SQL.Add('update tblcliente set nome="'+ edt_nome.Text +'", telefone="'+ edt_telefone.Text +'", celular="'+ edt_celular.Text +'", nascimento="'+ datatomysql(medt_nascimento.Text) +'", email="'+ edt_email.Text +'", obs="'+ obs.Text +'" where id="'+ edt_id.Text +'";');
          DataModule1.SQLQcliente.ExecSQL();
        end
      else
        begin
          MessageDlg('Cliente cadastrado com sucesso', mtInformation,[mbOK],0);

          Datamodule1.SQLQcliente.Active:=False;
          DataModule1.SQLQcliente.SQL.Clear;
          DataModule1.SQLQcliente.SQL.Add(' insert into tblcliente (nome, telefone, celular, nascimento, email, obs) values ("'+ edt_nome.Text +'", "'+ edt_telefone.Text +'","'+ edt_celular.Text +'", "'+ datatomysql(medt_nascimento.Text) +'","'+ edt_email.Text +'", "'+ obs.Text +'");');
          DataModule1.SQLQcliente.ExecSQL();
        end;

      obs.Enabled:=False;
      edt_id.Enabled:=False;
      edt_celular.Enabled:=False;
      edt_email.Enabled:=False;
      edt_telefone.Enabled:=False;
      edt_nome.Enabled:=False;
      medt_nascimento.Enabled:=False;

      btn_novo.Enabled:=True;
      btn_salvar.Enabled:=False;
      btn_alterar.Enabled:=True;
      btn_limpar.Enabled:=False;
      btn_cancelar.Enabled:=False;
      btn_excluir.Enabled:=True;
      btn_consultar.Enabled:=True;
      btn_imprimir.Enabled:=True;
      btn_sair.Enabled:=True;

      with DataModule1.SQLQcliente do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from tblcliente where nome="'+ edt_nome.Text +'";');
          Open;
          idd:= DataModule1.SQLQclienteid.Value;
          edt_id.Text:=IntToStr (idd);
          DataModule1.SQLQcliente.Close;
        end;

      lbl_asterisco1.Visible:=False;
      lbl_asterisco2.Visible:=False;    
    end;
end;

procedure Tfrm_cadcliente.btn_alterarClick(Sender: TObject);
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

  obs.Enabled:=True;
  edt_id.Enabled:=False;
  edt_nome.Enabled:=True;
  medt_nascimento.Enabled:=True;
  edt_email.Enabled:=True;
  edt_telefone.Enabled:=True;
  edt_celular.Enabled:=True;

  edt_nome.SetFocus;
end;

procedure Tfrm_cadcliente.btn_cancelarClick(Sender: TObject);
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

  obs.Enabled:=False;
  edt_id.Enabled:=False;
  edt_nome.Enabled:=False;
  medt_nascimento.Enabled:=False;
  edt_email.Enabled:=False;
  edt_telefone.Enabled:=False;
  edt_celular.Enabled:=False;

  obs.Text:='';
  edt_id.Text:='';
  edt_nome.Text:='';
  medt_nascimento.Text:='';
  edt_email.Text:='';
  edt_telefone.Text:='';
  edt_celular.Text:='';

  lbl_asterisco1.Visible:=False;
  lbl_asterisco2.Visible:=False;
end;

procedure Tfrm_cadcliente.btn_excluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir esse registro?', mtWarning, [mbYes, mbNo], 0)=mrYes then
    begin
      MessageDlg('Seu registro foi excluido com sucesso', mtInformation,[mbOK],0);
      
      Datamodule1.SQLQcliente.Active:=False;
      DataModule1.SQLQcliente.SQL.Clear;
      DataModule1.SQLQcliente.SQL.Add('delete from tblcliente where id = "'+ edt_id.Text +'";');
      DataModule1.SQLQcliente.ExecSQL();

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
      obs.Text:='';
      edt_nome.Text:='';
      medt_nascimento.Text:='';
      edt_email.Text:='';
      edt_telefone.Text:='';
      edt_celular.Text:='';
    end;
end;

procedure Tfrm_cadcliente.btn_consultarClick(Sender: TObject);
begin
  Datamodule1.SQLQcliente.Active:=False;
  DataModule1.SQLQcliente.SQL.Clear;
  DataModule1.SQLQcliente.SQL.Add('select * from tblcliente order by id;');
  DataModule1.SQLQcliente.Open;
  DataModule1.CDScliente.Refresh;

  frm_cadcliconsulta.Show;
end;

procedure Tfrm_cadcliente.btn_sairClick(Sender: TObject);
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

  obs.Enabled:=False;
  edt_id.Enabled:=False;
  edt_nome.Enabled:=False;
  medt_nascimento.Enabled:=False;
  edt_email.Enabled:=False;
  edt_telefone.Enabled:=False;
  edt_celular.Enabled:=False;

  frm_cadcliente.Close;

  obs.Text:='';
  edt_id.Text:='';
  edt_nome.Text:='';
  medt_nascimento.Text:='';
  edt_email.Text:='';
  edt_telefone.Text:='';
  edt_celular.Text:='';

  if frm_menucli.Enabled=True then
  begin
    Datamodule1.SQLQcliente.Active:=False;
    DataModule1.SQLQcliente.SQL.Clear;
    DataModule1.SQLQcliente.SQL.Add('select * from tblcliente order by id;');
    DataModule1.SQLQcliente.Open;
    DataModule1.CDScliente.Refresh;
  end;
end;

procedure Tfrm_cadcliente.edt_telefoneExit(Sender: TObject);
begin
  if edt_telefone.Text='() -' then edt_telefone.Text:='';
end;

procedure Tfrm_cadcliente.edt_celularExit(Sender: TObject);
begin
  if edt_celular.Text='() -' then edt_celular.Text:='';
end;

procedure Tfrm_cadcliente.edt_telefoneKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', #8]) then
    begin
      key:=#0;
      Beep;
    end;
end;

procedure Tfrm_cadcliente.edt_celularKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', #8]) then
    begin
      key:=#0;
      Beep;
    end;
end;

procedure Tfrm_cadcliente.FormCreate(Sender: TObject);
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

  obs.Enabled:=False;
  edt_id.Enabled:=False;
  edt_nome.Enabled:=False;
  medt_nascimento.Enabled:=False;
  edt_email.Enabled:=False;
  edt_telefone.Enabled:=False;
  edt_celular.Enabled:=False;

  obs.Text:='';
end;

procedure Tfrm_cadcliente.btn_limparClick(Sender: TObject);
begin
  obs.Text:='';
  edt_nome.Text:='';
  medt_nascimento.Text:='';
  edt_email.Text:='';
  edt_telefone.Text:='';
  edt_celular.Text:='';

  edt_nome.SetFocus;
end;

procedure Tfrm_cadcliente.btn_imprimirClick(Sender: TObject);
begin
  DataModule1.SQLQcliente.Active :=False;
  DataModule1.SQLQcliente.SQL.Clear;            // ESTE ; FECHA O COMANDO E DPS FECHA A STRING
  DataModule1.SQLQcliente.SQL.Add('select * from tblcliente where id = "'+ edt_id.Text +'";' );
  datamodule1.SQLQcliente.Open;
  datamodule1.CDScliente.Refresh;

  //abrir impressao corretamente
  frm_relacliente.QuickRep1.Preview;
end;

procedure Tfrm_cadcliente.medt_nascimentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', #8]) then
    begin
      key:=#0;
      Beep;
    end;
end;

end.
