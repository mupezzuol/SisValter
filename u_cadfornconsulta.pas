unit u_cadfornconsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, Grids, DBGrids, StdCtrls, Buttons, DB;

type
  Tfrm_cadfornconsulta = class(TForm)
    lbl_busca: TLabel;
    btn_confirmar: TBitBtn;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    btn_cancelar: TBitBtn;
    XPManifest1: TXPManifest;
    lbl_selecione: TLabel;
    procedure btn_confirmarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cadfornconsulta: Tfrm_cadfornconsulta;

implementation

uses u_datamodule, u_cadfornecedor, u_cadcliconsulta, u_cadcolaborador;

{$R *.dfm}

procedure Tfrm_cadfornconsulta.btn_confirmarClick(Sender: TObject);
begin
  frm_cadfornecedor.produtos.Text := DBGrid1.DataSource.DataSet.fieldbyname('produtos').AsString;
  frm_cadfornecedor.edt_id.Text := DBGrid1.DataSource.DataSet.fieldbyname('id').AsString;
  frm_cadfornecedor.edt_nome.Text := DBGrid1.DataSource.DataSet.fieldbyname('nome').AsString;
  frm_cadfornecedor.edt_telefone.Text := dbgrid1.DataSource.DataSet.fieldbyname('telefone').AsString;
  frm_cadfornecedor.edt_celular.Text := dbgrid1.DataSource.Dataset.fieldbyname('celular').AsString;
  frm_cadfornecedor.edt_email.Text := dbgrid1.DataSource.DataSet.fieldbyname('email').AsString;

  frm_cadfornconsulta.Close;

  frm_cadfornecedor.btn_novo.Enabled:=True;
  frm_cadfornecedor.btn_salvar.Enabled:=False;
  frm_cadfornecedor.btn_alterar.Enabled:=True;
  frm_cadfornecedor.btn_limpar.Enabled:=False;
  frm_cadfornecedor.btn_cancelar.Enabled:=False;
  frm_cadfornecedor.btn_excluir.Enabled:=True;
  frm_cadfornecedor.btn_consultar.Enabled:=True;
  frm_cadfornecedor.btn_imprimir.Enabled:=True;
  frm_cadfornecedor.btn_sair.Enabled:=True;
end;

procedure Tfrm_cadfornconsulta.btn_cancelarClick(Sender: TObject);
begin
  if frm_cadfornecedor.edt_nome.Text='' then
    begin
      frm_cadfornconsulta.Close;
      frm_cadfornecedor.btn_novo.Enabled:=True;
      frm_cadfornecedor.btn_salvar.Enabled:=False;
      frm_cadfornecedor.btn_alterar.Enabled:=False;
      frm_cadfornecedor.btn_limpar.Enabled:=False;
      frm_cadfornecedor.btn_cancelar.Enabled:=False;
      frm_cadfornecedor.btn_excluir.Enabled:=False;
      frm_cadfornecedor.btn_consultar.Enabled:=True;
      frm_cadfornecedor.btn_imprimir.Enabled:=False;
      frm_cadfornecedor.btn_sair.Enabled:=True
    end
  else
    begin
      frm_cadfornconsulta.Close;
      frm_cadfornecedor.btn_novo.Enabled:=True;
      frm_cadfornecedor.btn_salvar.Enabled:=False;
      frm_cadfornecedor.btn_alterar.Enabled:=True;
      frm_cadfornecedor.btn_limpar.Enabled:=False;
      frm_cadfornecedor.btn_cancelar.Enabled:=False;
      frm_cadfornecedor.btn_excluir.Enabled:=True;
      frm_cadfornecedor.btn_consultar.Enabled:=True;
      frm_cadfornecedor.btn_imprimir.Enabled:=True;
      frm_cadfornecedor.btn_sair.Enabled:=True;
    end;
end;

procedure Tfrm_cadfornconsulta.Edit1Change(Sender: TObject);
begin
  dbgrid1.DataSource.DataSet.Locate('nome', edit1.Text,[ locaseinsensitive, lopartialkey ] ) ;
end;

procedure Tfrm_cadfornconsulta.FormActivate(Sender: TObject);
begin
  Edit1.SetFocus;
  Edit1.Text:='';
end;

end.
