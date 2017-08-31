unit u_cadserconsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, XPMan, DB;

type
  Tfrm_cadserconsulta = class(TForm)
    lbl_selecione: TLabel;
    lbl_busca: TLabel;
    btn_confirmar: TBitBtn;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    XPManifest1: TXPManifest;
    btn_cancelar: TBitBtn;
    procedure btn_confirmarClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cadserconsulta: Tfrm_cadserconsulta;

implementation

uses u_cadservico, u_cadcliente, u_cadcliconsulta, u_datamodule;

{$R *.dfm}

procedure Tfrm_cadserconsulta.btn_confirmarClick(Sender: TObject);
var posicao:Integer;
begin
  frm_cadservico.edt_id.Text := DBGrid1.DataSource.DataSet.fieldbyname('id').AsString;
  frm_cadservico.edt_nome.Text := DBGrid1.DataSource.DataSet.fieldbyname('nome').AsString;
  frm_cadservico.edt_preco.Text := dbgrid1.DataSource.DataSet.fieldbyname('preco').AsString;

  posicao:= frm_cadservico.cb_tempo.Items.IndexOf(dbgrid1.DataSource.DataSet.fieldbyname('tempo').Value);
  frm_cadservico.cb_tempo.ItemIndex:=posicao;

  frm_cadserconsulta.Close;

  frm_cadservico.btn_novo.Enabled:=True;
  frm_cadservico.btn_salvar.Enabled:=False;
  frm_cadservico.btn_alterar.Enabled:=True;
  frm_cadservico.btn_limpar.Enabled:=False;
  frm_cadservico.btn_cancelar.Enabled:=False;
  frm_cadservico.btn_excluir.Enabled:=True;
  frm_cadservico.btn_consultar.Enabled:=True;
  frm_cadservico.btn_imprimir.Enabled:=True;
  frm_cadservico.btn_sair.Enabled:=True;
end;

procedure Tfrm_cadserconsulta.Edit1Change(Sender: TObject);
begin
  dbgrid1.DataSource.DataSet.Locate('nome', edit1.Text,[ locaseinsensitive, lopartialkey ] ) ;
end;

procedure Tfrm_cadserconsulta.btn_cancelarClick(Sender: TObject);
begin
  if frm_cadservico.edt_nome.Text='' then
    begin
      frm_cadserconsulta.Close;
      frm_cadservico.btn_novo.Enabled:=True;
      frm_cadservico.btn_salvar.Enabled:=False;
      frm_cadservico.btn_alterar.Enabled:=False;
      frm_cadservico.btn_limpar.Enabled:=False;
      frm_cadservico.btn_cancelar.Enabled:=False;
      frm_cadservico.btn_excluir.Enabled:=False;
      frm_cadservico.btn_consultar.Enabled:=True;
      frm_cadservico.btn_imprimir.Enabled:=False;
      frm_cadservico.btn_sair.Enabled:=True
    end
  else
    begin
      frm_cadserconsulta.Close;
      frm_cadservico.btn_novo.Enabled:=True;
      frm_cadservico.btn_salvar.Enabled:=False;
      frm_cadservico.btn_alterar.Enabled:=True;
      frm_cadservico.btn_limpar.Enabled:=False;
      frm_cadservico.btn_cancelar.Enabled:=False;
      frm_cadservico.btn_excluir.Enabled:=True;
      frm_cadservico.btn_consultar.Enabled:=True;
      frm_cadservico.btn_imprimir.Enabled:=True;
      frm_cadservico.btn_sair.Enabled:=True;
    end;
end;

end.
