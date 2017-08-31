unit u_cadcolaborador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, XPMan, Mask;

type
  Tfrm_cadcolaborador = class(TForm)
    btn_novo: TBitBtn;
    btn_salvar: TBitBtn;
    btn_alterar: TBitBtn;
    btn_limpar: TBitBtn;
    btn_cancelar: TBitBtn;
    btn_excluir: TBitBtn;
    btn_imprimir: TBitBtn;
    btn_sair: TBitBtn;
    btn_consultar: TBitBtn;
    XPManifest1: TXPManifest;
    edt_nome: TEdit;
    lbl_nome: TLabel;
    edt_email: TEdit;
    lbl_email: TLabel;
    lbl_telefone: TLabel;
    lbl_celular: TLabel;
    lbl_nascimento: TLabel;
    lbl_usuario: TLabel;
    lbl_senha: TLabel;
    medt_nascimento: TMaskEdit;
    edt_usuario: TEdit;
    edt_senha: TEdit;
    edt_id: TEdit;
    lbl_id: TLabel;
    edt_telefone: TMaskEdit;
    edt_celular: TMaskEdit;
    lbl_asterisco3: TLabel;
    lbl_asterisco2: TLabel;
    lbl_asterisco1: TLabel;
    lbl_asterisco4: TLabel;
    procedure btn_novoClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_consultarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_limparClick(Sender: TObject);
    procedure edt_telefoneExit(Sender: TObject);
    procedure edt_telefoneKeyPress(Sender: TObject; var Key: Char);
    procedure edt_celularKeyPress(Sender: TObject; var Key: Char);
    procedure edt_celularExit(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure medt_nascimentoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_usuarioKeyPress(Sender: TObject; var Key: Char);
    procedure edt_senhaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cadcolaborador: Tfrm_cadcolaborador;
  tel, cel, a, result: string;
  idd: Integer;

implementation

uses u_codcolaconsulta, u_datamodule, u_relacolaborador;

function datatomysql (data:string):string;
var dd,mm,aaaa:string;

begin
  dd:=Copy(data, 1, 2);
  mm:=Copy(data, 4, 2);
  aaaa:=Copy(data, 7, 4);
  datatomysql:=aaaa+ '-'  +mm+ '-' +dd;
end;

{$R *.dfm}

procedure Tfrm_cadcolaborador.btn_novoClick(Sender: TObject);
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
  edt_celular.Enabled:=True;
  edt_email.Enabled:=True;
  edt_telefone.Enabled:=True;
  edt_nome.Enabled:=True;
  medt_nascimento.Enabled:=True;
  edt_usuario.Enabled:=True;
  edt_senha.Enabled:=True;

  edt_nome.Text:='';
  medt_nascimento.Text:='';
  edt_email.Text:='';
  edt_telefone.Text:='';
  edt_celular.Text:='';
  edt_usuario.Text:='';
  edt_senha.Text:='';
  edt_id.Text:='';
  
  edt_nome.SetFocus;
end;

procedure Tfrm_cadcolaborador.btn_salvarClick(Sender: TObject);
begin
  if (medt_nascimento.Text='  /  /    ') or (edt_nome.Text='') or (edt_usuario.Text='') or (edt_senha.Text='') then
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
      edt_celular.Enabled:=True;
      edt_email.Enabled:=True;
      edt_telefone.Enabled:=True;
      edt_nome.Enabled:=True;
      medt_nascimento.Enabled:=True;
      edt_usuario.Enabled:=True;
      edt_senha.Enabled:=True;

      lbl_asterisco1.Visible:=True;
      lbl_asterisco2.Visible:=True;
      lbl_asterisco3.Visible:=True;
      lbl_asterisco4.Visible:=True;

      edt_nome.SetFocus;
    end
  else
    begin
      Datamodule1.SQLQcolaborador.Active:=False;
      DataModule1.SQLQcolaborador.SQL.Clear;
      DataModule1.SQLQcolaborador.SQL.Add('select * from tblcolaborador where id="'+ edt_id.Text +'";');
      DataModule1.SQLQcolaborador.Open;
      DataModule1.CDScolaborador.Refresh;

      if not DataModule1.SQLQcolaborador.Eof then
        begin
          MessageDlg('Cadastro do colaborador alterado com sucesso', mtInformation,[mbOK],0);

          Datamodule1.SQLQcolaborador.Active:=False;
          DataModule1.SQLQcolaborador.SQL.Clear;
          DataModule1.SQLQcolaborador.SQL.Add('update tblcolaborador set nome="'+ edt_nome.Text +'", telefone="'+ edt_telefone.Text +'", celular="'+ edt_celular.Text +'", nascimento="'+ datatomysql(medt_nascimento.Text) +'", email="'+ edt_email.Text +'", usuario="'+ edt_usuario.Text +'", senha="'+ edt_senha.Text +'" where id="'+ edt_id.Text +'";');
          DataModule1.SQLQcolaborador.ExecSQL();

          edt_id.Enabled:=False;
          edt_nome.Enabled:=False;
          medt_nascimento.Enabled:=False;
          edt_email.Enabled:=False;
          edt_telefone.Enabled:=False;
          edt_celular.Enabled:=False;
          edt_usuario.Enabled:=False;
          edt_senha.Enabled:=False;

          btn_novo.Enabled:=True;
          btn_salvar.Enabled:=False;
          btn_alterar.Enabled:=True;
          btn_limpar.Enabled:=False;
          btn_cancelar.Enabled:=False;
          btn_excluir.Enabled:=True;
          btn_consultar.Enabled:=True;
          btn_imprimir.Enabled:=True;
          btn_sair.Enabled:=True;
        end
      else
        begin
          DataModule1.SQLQcolaborador.Active :=False;
          DataModule1.SQLQcolaborador.SQL.Clear;
          DataModule1.SQLQcolaborador.SQL.Add('select * from tblcolaborador where usuario = "'+edt_usuario.Text+'";');
          DataModule1.SQLQcolaborador.Open;
          DataModule1.CDScolaborador.Refresh;

          if not DataModule1.SQLQcolaborador.Eof then
            a:= DataModule1.DScolaborador.DataSet.FieldbyName('usuario').value ;

            if edt_usuario.Text = a then
              begin
                MessageDlg('Nome de usuario ja existe', mtInformation,[mbOK],0);

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
                edt_celular.Enabled:=True;
                edt_email.Enabled:=True;
                edt_telefone.Enabled:=True;
                edt_nome.Enabled:=True;
                medt_nascimento.Enabled:=True;
                edt_usuario.Enabled:=True;
                edt_senha.Enabled:=True;

                edt_usuario.SetFocus;
              end
            else
              begin
                MessageDlg('Colaborador cadastrado com sucesso', mtInformation,[mbOK],0);

                Datamodule1.SQLQcolaborador.Active:=False;
                DataModule1.SQLQcolaborador.SQL.Clear;
                DataModule1.SQLQcolaborador.SQL.Add(' insert into tblcolaborador (nome, telefone, celular, nascimento, email, usuario, senha) values ("'+ edt_nome.Text +'", "'+ edt_telefone.Text +'","'+ edt_celular.Text +'", "'+ datatomysql(medt_nascimento.Text) +'","'+ edt_email.Text +'","'+ edt_usuario.Text +'","'+ edt_senha.Text +'");');

                DataModule1.SQLQcolaborador.ExecSQL();

                edt_id.Enabled:=False;
                edt_nome.Enabled:=False;
                medt_nascimento.Enabled:=False;
                edt_email.Enabled:=False;
                edt_telefone.Enabled:=False;
                edt_celular.Enabled:=False;
                edt_usuario.Enabled:=False;
                edt_senha.Enabled:=False;

                btn_novo.Enabled:=True;
                btn_salvar.Enabled:=False;
                btn_alterar.Enabled:=True;
                btn_limpar.Enabled:=False;
                btn_cancelar.Enabled:=False;
                btn_excluir.Enabled:=True;
                btn_consultar.Enabled:=True;
                btn_imprimir.Enabled:=True;
                btn_sair.Enabled:=True;
              end;
        end;
          
        with DataModule1.SQLQcolaborador do
          begin
            Close;
            SQL.Clear;
            SQL.Add('select * from tblcolaborador where nome="'+ edt_nome.Text +'";');
            Open;
            idd:= DataModule1.SQLQcolaboradorid.Value;
            edt_id.Text:=IntToStr (idd);
            DataModule1.SQLQcolaborador.Close;
          end;

      lbl_asterisco1.Visible:=False;
      lbl_asterisco2.Visible:=False;
      lbl_asterisco3.Visible:=False;
      lbl_asterisco4.Visible:=False;
    end;
end;

procedure Tfrm_cadcolaborador.btn_alterarClick(Sender: TObject);
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
  edt_celular.Enabled:=True;
  edt_email.Enabled:=True;
  edt_telefone.Enabled:=True;
  edt_nome.Enabled:=True;
  medt_nascimento.Enabled:=True;
  edt_usuario.Enabled:=True;
  edt_senha.Enabled:=True;

  edt_nome.SetFocus;
end;

procedure Tfrm_cadcolaborador.btn_cancelarClick(Sender: TObject);
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
  medt_nascimento.Enabled:=False;
  edt_email.Enabled:=False;
  edt_telefone.Enabled:=False;
  edt_celular.Enabled:=False;
  edt_usuario.Enabled:=False;
  edt_senha.Enabled:=False;

  edt_id.Text:='';
  edt_nome.Text:='';
  medt_nascimento.Text:='';
  edt_email.Text:='';
  edt_telefone.Text:='';
  edt_celular.Text:='';
  edt_usuario.Text:='';
  edt_senha.Text:='';

  lbl_asterisco1.Visible:=False;
  lbl_asterisco2.Visible:=False;
  lbl_asterisco3.Visible:=False;
  lbl_asterisco4.Visible:=False;
end;

procedure Tfrm_cadcolaborador.btn_excluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir esse registro?', mtWarning, [mbYes, mbNo], 0)=mrYes then
    begin
      MessageDlg('Seu registro foi excluido com sucesso', mtInformation,[mbOK],0);

      Datamodule1.SQLQcolaborador.Active:=False;
      DataModule1.SQLQcolaborador.SQL.Clear;
      DataModule1.SQLQcolaborador.SQL.Add('delete from tblcolaborador where id = "'+ edt_id.Text +'";');
      DataModule1.SQLQcolaborador.ExecSQL();

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
      medt_nascimento.Text:='';
      edt_email.Text:='';
      edt_telefone.Text:='';
      edt_celular.Text:='';
      edt_usuario.Text:='';
    end;
end;

procedure Tfrm_cadcolaborador.btn_consultarClick(Sender: TObject);
begin
  Datamodule1.SQLQcolaborador.Active:=False;
  DataModule1.SQLQcolaborador.SQL.Clear;
  DataModule1.SQLQcolaborador.SQL.Add('select * from tblcolaborador order by id;');
  DataModule1.SQLQcolaborador.Open;
  DataModule1.CDScolaborador.Refresh;

  frm_cadcolaconsulta.Show;
end;

procedure Tfrm_cadcolaborador.btn_sairClick(Sender: TObject);
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
  medt_nascimento.Enabled:=False;
  edt_email.Enabled:=False;
  edt_telefone.Enabled:=False;
  edt_celular.Enabled:=False;
  edt_usuario.Enabled:=False;
  edt_senha.Enabled:=False;

  frm_cadcolaborador.Close;

  edt_id.Text:='';
  edt_nome.Text:='';
  medt_nascimento.Text:='';
  edt_email.Text:='';
  edt_telefone.Text:='';
  edt_celular.Text:='';
  edt_usuario.Text:='';
  edt_senha.Text:='';
end;

procedure Tfrm_cadcolaborador.btn_limparClick(Sender: TObject);
begin
  edt_nome.Text:='';
  medt_nascimento.Text:='';
  edt_email.Text:='';
  edt_telefone.Text:='';
  edt_celular.Text:='';
  edt_usuario.Text:='';
  edt_senha.Text:='';

  edt_nome.SetFocus;
end;

procedure Tfrm_cadcolaborador.edt_telefoneExit(Sender: TObject);
begin
  if edt_telefone.Text='() -' then edt_telefone.Text:='';
end;

procedure Tfrm_cadcolaborador.edt_telefoneKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', #8]) then
    begin
      key:=#0;
      Beep;
    end;
end;

procedure Tfrm_cadcolaborador.edt_celularKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', #8]) then
    begin
      key:=#0;
      Beep;
    end;
end;

procedure Tfrm_cadcolaborador.edt_celularExit(Sender: TObject);
begin
  if edt_celular.Text='() -' then edt_celular.Text:='';
end;

procedure Tfrm_cadcolaborador.btn_imprimirClick(Sender: TObject);
begin
  DataModule1.SQLQcolaborador.Active :=False;
  DataModule1.SQLQcolaborador.SQL.Clear;            // ESTE ; FECHA O COMANDO E DPS FECHA A STRING
  DataModule1.SQLQcolaborador.SQL.Add('select * from tblcolaborador where id = "'+ edt_id.Text +'";' );
  datamodule1.SQLQcolaborador.Open;
  datamodule1.CDScolaborador.Refresh;

  frm_relacolaborador.QuickRep1.Preview;
end;

procedure Tfrm_cadcolaborador.FormCreate(Sender: TObject);
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
  medt_nascimento.Enabled:=False;
  edt_email.Enabled:=False;
  edt_telefone.Enabled:=False;
  edt_celular.Enabled:=False;
  edt_usuario.Enabled:=False;
  edt_senha.Enabled:=False;
end;

procedure Tfrm_cadcolaborador.medt_nascimentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', #8]) then
    begin
      key:=#0;
      Beep;
    end;
end;

procedure Tfrm_cadcolaborador.edt_usuarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['a'..'z', 'A'..'Z', '0'..'9', #8]) then
    begin
      key:=#0;
      Beep;
    end;
end;

procedure Tfrm_cadcolaborador.edt_senhaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['a'..'z', 'A'..'Z', '0'..'9', #8]) then
    begin
      key:=#0;
      Beep;
    end;
end;

end.
