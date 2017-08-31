unit u_codcolaconsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, XPMan, DB;

type
  Tfrm_cadcolaconsulta = class(TForm)
    lbl_selecione: TLabel;
    lbl_busca: TLabel;
    btn_confirmar: TBitBtn;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    XPManifest1: TXPManifest;
    btn_cancelar: TBitBtn;
    procedure btn_confirmarClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cadcolaconsulta: Tfrm_cadcolaconsulta;

implementation

uses u_cadcliente, u_datamodule, u_cadcolaborador;

{$R *.dfm}

procedure Tfrm_cadcolaconsulta.btn_confirmarClick(Sender: TObject);
begin
  frm_cadcolaborador.edt_id.Text := DBGrid1.DataSource.DataSet.fieldbyname('id').AsString;
  frm_cadcolaborador.edt_nome.Text := DBGrid1.DataSource.DataSet.fieldbyname('nome').AsString;
  frm_cadcolaborador.edt_telefone.Text := dbgrid1.DataSource.DataSet.fieldbyname('telefone').AsString;
  frm_cadcolaborador.edt_celular.Text := dbgrid1.DataSource.Dataset.fieldbyname('celular').AsString;
  frm_cadcolaborador.medt_nascimento.Text := dbgrid1.DataSource.DataSet.fieldbyname('nascimento').AsString;
  frm_cadcolaborador.edt_email.Text := dbgrid1.DataSource.DataSet.fieldbyname('email').AsString;
  frm_cadcolaborador.edt_usuario.Text := dbgrid1.DataSource.DataSet.fieldbyname('usuario').AsString;
  frm_cadcolaborador.edt_senha.Text := dbgrid1.DataSource.DataSet.fieldbyname('senha').AsString;

  frm_cadcolaconsulta.Close;

  frm_cadcolaborador.btn_novo.Enabled:=True;
  frm_cadcolaborador.btn_salvar.Enabled:=False;
  frm_cadcolaborador.btn_alterar.Enabled:=True;
  frm_cadcolaborador.btn_limpar.Enabled:=False;
  frm_cadcolaborador.btn_cancelar.Enabled:=False;
  frm_cadcolaborador.btn_excluir.Enabled:=True;
  frm_cadcolaborador.btn_consultar.Enabled:=True;
  frm_cadcolaborador.btn_imprimir.Enabled:=True;
  frm_cadcolaborador.btn_sair.Enabled:=True;
end;

procedure Tfrm_cadcolaconsulta.Edit1Change(Sender: TObject);
begin
  dbgrid1.DataSource.DataSet.Locate('nome', edit1.Text,[ locaseinsensitive, lopartialkey ] ) ;
end;

procedure Tfrm_cadcolaconsulta.FormActivate(Sender: TObject);
begin
  Edit1.SetFocus;
  Edit1.Text:='';
end;

procedure Tfrm_cadcolaconsulta.btn_cancelarClick(Sender: TObject);
begin
  if frm_cadcolaborador.edt_nome.Text='' then
    begin
      frm_cadcolaconsulta.Close;
      frm_cadcolaborador.btn_novo.Enabled:=True;
      frm_cadcolaborador.btn_salvar.Enabled:=False;
      frm_cadcolaborador.btn_alterar.Enabled:=False;
      frm_cadcolaborador.btn_limpar.Enabled:=False;
      frm_cadcolaborador.btn_cancelar.Enabled:=False;
      frm_cadcolaborador.btn_excluir.Enabled:=False;
      frm_cadcolaborador.btn_consultar.Enabled:=True;
      frm_cadcolaborador.btn_imprimir.Enabled:=False;
      frm_cadcolaborador.btn_sair.Enabled:=True
    end
  else
    begin
      frm_cadcolaconsulta.Close;
      frm_cadcolaborador.btn_novo.Enabled:=True;
      frm_cadcolaborador.btn_salvar.Enabled:=False;
      frm_cadcolaborador.btn_alterar.Enabled:=True;
      frm_cadcolaborador.btn_limpar.Enabled:=False;
      frm_cadcolaborador.btn_cancelar.Enabled:=False;
      frm_cadcolaborador.btn_excluir.Enabled:=True;
      frm_cadcolaborador.btn_consultar.Enabled:=True;
      frm_cadcolaborador.btn_imprimir.Enabled:=True;
      frm_cadcolaborador.btn_sair.Enabled:=True;
    end;
end;

end.
