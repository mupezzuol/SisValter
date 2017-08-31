unit u_cadservico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, XPMan;

type
  Tfrm_cadservico = class(TForm)
    btn_novo: TBitBtn;
    btn_salvar: TBitBtn;
    btn_alterar: TBitBtn;
    btn_limpar: TBitBtn;
    btn_cancelar: TBitBtn;
    btn_excluir: TBitBtn;
    btn_imprimir: TBitBtn;
    btn_consultar: TBitBtn;
    XPManifest1: TXPManifest;
    edt_nome: TEdit;
    edt_preco: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    Label1: TLabel;
    edt_id: TEdit;
    btn_sair: TBitBtn;
    cb_tempo: TComboBox;
    procedure btn_novoClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_consultarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure btn_limparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edt_precoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_precoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cadservico: Tfrm_cadservico;
  idd: Integer;

implementation

uses u_datamodule, u_cadserconsulta, u_relaservico;

function valortomysql (valor:string):string;
begin
  valortomysql:=stringreplace(valor, ',', '.',[rfReplaceAll, rfIgnoreCase]);
end;

{$R *.dfm}

procedure Tfrm_cadservico.btn_novoClick(Sender: TObject);
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
  edt_preco.Enabled:=True;
  cb_tempo.Enabled:=True;

  edt_nome.Text:='';
  edt_preco.Text:='0,00';
  edt_id.Text:='';
  cb_tempo.ItemIndex:=0;

  edt_nome.SetFocus;
end;

procedure Tfrm_cadservico.btn_salvarClick(Sender: TObject);
begin
  if (edt_nome.Text = '') or (edt_preco.Text = '0,00') or (cb_tempo.ItemIndex = 0) then
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
      cb_tempo.Enabled:=True;

      edt_nome.SetFocus;
    end
  else
    begin
      Datamodule1.SQLQservico.Active:=False;
      DataModule1.SQLQservico.SQL.Clear;
      DataModule1.SQLQservico.SQL.Add('select * from tblservico where id="'+edt_id.Text+'" ;');
      DataModule1.SQLQservico.Open;
      DataModule1.CDSservico.Refresh;

      if not DataModule1.SQLQservico.Eof then
        begin
          MessageDlg('Serviço alterado com sucesso', mtInformation,[mbOK],0);

          Datamodule1.SQLQservico.Active:=False;
          DataModule1.SQLQservico.SQL.Clear;
          DataModule1.SQLQservico.SQL.Add('update tblservico set nome="'+edt_nome.Text+'", preco="'+valortomysql(edt_preco.Text)+'", tempo="'+cb_tempo.Text+'" where id="'+edt_id.Text+'" ;');
          DataModule1.SQLQservico.ExecSQL();

        end
      else
        begin
          Datamodule1.SQLQservico.Active:=False;
          DataModule1.SQLQservico.SQL.Clear;
          DataModule1.SQLQservico.SQL.Add(' insert into tblservico (nome, preco, tempo) values ("'+edt_nome.Text+'", "'+valortomysql(edt_preco.Text)+'","'+cb_tempo.Text+'") ;');
          DataModule1.SQLQservico.ExecSQL();

          MessageDlg('Serviço Cadastrado com Sucesso', mtInformation,[mbOK],0);
        end;

      btn_novo.Enabled:=True;
      btn_salvar.Enabled:=False;
      btn_alterar.Enabled:=True;
      btn_limpar.Enabled:=False;
      btn_cancelar.Enabled:=False;
      btn_excluir.Enabled:=True;
      btn_consultar.Enabled:=True;
      btn_imprimir.Enabled:=True;
      btn_sair.Enabled:=True;

      edt_nome.Enabled:=False;
      edt_preco.Enabled:=False;
      cb_tempo.Enabled:=False;
      edt_id.Enabled:=False;

      with DataModule1.SQLQservico do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from tblservico where nome="'+ edt_nome.Text +'";');
          Open;
          idd:= DataModule1.SQLQservicoid.Value;
          edt_id.Text:=IntToStr (idd);
          DataModule1.SQLQservico.Close;
        end;
    end;
end;

procedure Tfrm_cadservico.btn_cancelarClick(Sender: TObject);
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

  edt_nome.Enabled:=False;
  edt_preco.Enabled:=False;
  cb_tempo.Enabled:=False;
  edt_id.Enabled:=False;

  edt_nome.Text:='';
  edt_preco.Text:='0,00';
  cb_tempo.ItemIndex:=0;
  edt_id.Text:='';
end;

procedure Tfrm_cadservico.btn_alterarClick(Sender: TObject);
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

  edt_nome.Enabled:=True;
  edt_preco.Enabled:=True;
  cb_tempo.Enabled:=True;
  edt_id.Enabled:=False;

  edt_nome.SetFocus;
end;

procedure Tfrm_cadservico.btn_excluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja Realmente Excluir o Registro?', mtWarning, [mbYes, mbNo], 0)=mrYes then
    begin
      MessageDlg('Seu registro foi excluido com sucesso', mtInformation,[mbOK],0);

      Datamodule1.SQLQservico.Active:=False;
      DataModule1.SQLQservico.SQL.Clear;
      DataModule1.SQLQservico.SQL.Add('delete from tblservico where id = "'+edt_id.Text+'";');
      DataModule1.SQLQservico.ExecSQL();

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
      edt_nome.text:='';
      edt_preco.text:='0,00';
      cb_tempo.ItemIndex:=0;
    end;
end;

procedure Tfrm_cadservico.btn_consultarClick(Sender: TObject);
begin
  Datamodule1.SQLQservico.Active:=False;
  DataModule1.SQLQservico.SQL.Clear;
  DataModule1.SQLQservico.SQL.Add('select * from tblservico order by id;');
  DataModule1.SQLQservico.Open;
  DataModule1.CDSservico.Refresh;

  frm_cadserconsulta.Show;
end;

procedure Tfrm_cadservico.btn_sairClick(Sender: TObject);
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

  edt_nome.Enabled:=False;
  edt_preco.Enabled:=False;
  cb_tempo.Enabled:=False;
  edt_id.Enabled:=False;

  frm_cadservico.Close;

  edt_id.Text:='';
  edt_nome.text:='';
  edt_preco.text:='0,00';
  cb_tempo.ItemIndex:=0;
end;

procedure Tfrm_cadservico.btn_imprimirClick(Sender: TObject);
begin
  DataModule1.SQLQservico.Active :=False;
  DataModule1.SQLQservico.SQL.Clear;            // ESTE ; FECHA O COMANDO E DPS FECHA A STRING
  DataModule1.SQLQservico.SQL.Add('select * from tblservico where id = "'+ edt_id.Text +'";' );
  datamodule1.SQLQservico.Open;
  datamodule1.CDSservico.Refresh;

  frm_relaservico.QuickRep1.Preview;
end;

procedure Tfrm_cadservico.btn_limparClick(Sender: TObject);
begin
  edt_nome.text:='';
  edt_preco.text:='0,00';
  cb_tempo.ItemIndex:=0;

  edt_nome.SetFocus;
end;

procedure Tfrm_cadservico.FormCreate(Sender: TObject);
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

  edt_nome.Enabled:=False;
  edt_preco.Enabled:=False;
  cb_tempo.Enabled:=False;
  edt_id.Enabled:=False;

  edt_nome.Text:='';
  edt_preco.Text:='0,00';
  edt_id.Text:='';
  cb_tempo.ItemIndex:=0;
end;

procedure Tfrm_cadservico.edt_precoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', ',', #8]) then
    begin
      key:=#0;
      Beep;
    end;
end;

procedure Tfrm_cadservico.edt_precoExit(Sender: TObject);
begin
  edt_preco.Text:=FormatFloat('###,###,##0.00,', StrToFloat(edt_preco.Text)) ;
end;

end.
