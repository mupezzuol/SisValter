
unit u_cadcliconsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, XPMan, DB;

type
  Tfrm_cadcliconsulta = class(TForm)
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
  frm_cadcliconsulta: Tfrm_cadcliconsulta;

implementation

uses u_datamodule, u_cadcliente;

{$R *.dfm}

procedure Tfrm_cadcliconsulta.btn_confirmarClick(Sender: TObject);
begin
  //BUSCA INFORMACORS  DE UM DBGRID

  frm_cadcliente.obs.Text := DBGrid1.DataSource.DataSet.fieldbyname('obs').AsString;
  frm_cadcliente.edt_id.Text := DBGrid1.DataSource.DataSet.fieldbyname('id').AsString;
  frm_cadcliente.edt_nome.Text := DBGrid1.DataSource.DataSet.fieldbyname('nome').AsString;
  frm_cadcliente.edt_telefone.Text := dbgrid1.DataSource.DataSet.fieldbyname('telefone').AsString;
  frm_cadcliente.edt_celular.Text := dbgrid1.DataSource.Dataset.fieldbyname('celular').AsString;
  frm_cadcliente.medt_nascimento.Text := dbgrid1.DataSource.DataSet.fieldbyname('nascimento').AsString;
  frm_cadcliente.edt_email.Text := dbgrid1.DataSource.DataSet.fieldbyname('email').AsString;

  frm_cadcliconsulta.Close;

  frm_cadcliente.btn_novo.Enabled:=True;
  frm_cadcliente.btn_salvar.Enabled:=False;
  frm_cadcliente.btn_alterar.Enabled:=True;
  frm_cadcliente.btn_limpar.Enabled:=False;
  frm_cadcliente.btn_cancelar.Enabled:=False;
  frm_cadcliente.btn_excluir.Enabled:=True;
  frm_cadcliente.btn_consultar.Enabled:=True;
  frm_cadcliente.btn_imprimir.Enabled:=True;
  frm_cadcliente.btn_sair.Enabled:=True;
end;

procedure Tfrm_cadcliconsulta.Edit1Change(Sender: TObject);
begin
  dbgrid1.DataSource.DataSet.Locate('nome', edit1.Text,[ locaseinsensitive, lopartialkey ] ) ;
end;

procedure Tfrm_cadcliconsulta.FormActivate(Sender: TObject);
begin
  Edit1.SetFocus;
  Edit1.Text:='';
end;

procedure Tfrm_cadcliconsulta.btn_cancelarClick(Sender: TObject);
begin
  if frm_cadcliente.edt_nome.Text='' then
    begin
      frm_cadcliconsulta.Close;
      frm_cadcliente.btn_novo.Enabled:=True;
      frm_cadcliente.btn_salvar.Enabled:=False;
      frm_cadcliente.btn_alterar.Enabled:=False;
      frm_cadcliente.btn_limpar.Enabled:=False;
      frm_cadcliente.btn_cancelar.Enabled:=False;
      frm_cadcliente.btn_excluir.Enabled:=False;
      frm_cadcliente.btn_consultar.Enabled:=True;
      frm_cadcliente.btn_imprimir.Enabled:=False;
      frm_cadcliente.btn_sair.Enabled:=True
    end
  else
    begin
      frm_cadcliconsulta.Close;
      frm_cadcliente.btn_novo.Enabled:=True;
      frm_cadcliente.btn_salvar.Enabled:=False;
      frm_cadcliente.btn_alterar.Enabled:=True;
      frm_cadcliente.btn_limpar.Enabled:=False;
      frm_cadcliente.btn_cancelar.Enabled:=False;
      frm_cadcliente.btn_excluir.Enabled:=True;
      frm_cadcliente.btn_consultar.Enabled:=True;
      frm_cadcliente.btn_imprimir.Enabled:=True;
      frm_cadcliente.btn_sair.Enabled:=True;
    end;
end;

end.
