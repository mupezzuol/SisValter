unit u_cadproconsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, XPMan, DB;

type
  Tfrm_cadproconsulta = class(TForm)
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
  frm_cadproconsulta: Tfrm_cadproconsulta;

implementation

uses u_cadproduto, u_datamodule, u_cadcliente;

{$R *.dfm}

procedure Tfrm_cadproconsulta.btn_confirmarClick(Sender: TObject);
var posicao, posicao2:Integer;
begin
  //BUSCA INFORMACORS  DE UM DBGRID

  frm_cadproduto.edt_id.Text := DBGrid1.DataSource.DataSet.fieldbyname('id').AsString;
  frm_cadproduto.edt_nome.Text := DBGrid1.DataSource.DataSet.fieldbyname('nome').AsString;
  frm_cadproduto.edt_preco.Text := dbgrid1.DataSource.DataSet.fieldbyname('preco').AsString;

  posicao:= frm_cadproduto.cb_categoria.Items.IndexOf(dbgrid1.DataSource.DataSet.fieldbyname('categoria').Value);
  frm_cadproduto.cb_categoria.ItemIndex:=posicao;

  posicao2:= frm_cadproduto.cb_fornecedor.Items.IndexOf(dbgrid1.DataSource.DataSet.fieldbyname('nomefornecedor').Value);
  frm_cadproduto.cb_fornecedor.ItemIndex:=posicao2;

  frm_cadproconsulta.Close;

  frm_cadproduto.btn_novo.Enabled:=True;
  frm_cadproduto.btn_salvar.Enabled:=False;
  frm_cadproduto.btn_alterar.Enabled:=True;
  frm_cadproduto.btn_limpar.Enabled:=False;
  frm_cadproduto.btn_cancelar.Enabled:=False;
  frm_cadproduto.btn_excluir.Enabled:=True;
  frm_cadproduto.btn_consultar.Enabled:=True;
  frm_cadproduto.btn_imprimir.Enabled:=True;
  frm_cadproduto.btn_sair.Enabled:=True;
end;

procedure Tfrm_cadproconsulta.Edit1Change(Sender: TObject);
begin
  dbgrid1.DataSource.DataSet.Locate('nome', edit1.Text,[ locaseinsensitive, lopartialkey ] ) ;
end;

procedure Tfrm_cadproconsulta.FormActivate(Sender: TObject);
begin
  Edit1.SetFocus;
  Edit1.Text:='';
end;

procedure Tfrm_cadproconsulta.btn_cancelarClick(Sender: TObject);
begin
  if frm_cadproduto.edt_nome.Text='' then
    begin
      frm_cadproconsulta.Close;
      frm_cadproduto.btn_novo.Enabled:=True;
      frm_cadproduto.btn_salvar.Enabled:=False;
      frm_cadproduto.btn_alterar.Enabled:=False;
      frm_cadproduto.btn_limpar.Enabled:=False;
      frm_cadproduto.btn_cancelar.Enabled:=False;
      frm_cadproduto.btn_excluir.Enabled:=False;
      frm_cadproduto.btn_consultar.Enabled:=True;
      frm_cadproduto.btn_imprimir.Enabled:=False;
      frm_cadproduto.btn_sair.Enabled:=True
    end
  else
    begin
      frm_cadproconsulta.Close;
      frm_cadproduto.btn_novo.Enabled:=True;
      frm_cadproduto.btn_salvar.Enabled:=False;
      frm_cadproduto.btn_alterar.Enabled:=True;
      frm_cadproduto.btn_limpar.Enabled:=False;
      frm_cadproduto.btn_cancelar.Enabled:=False;
      frm_cadproduto.btn_excluir.Enabled:=True;
      frm_cadproduto.btn_consultar.Enabled:=True;
      frm_cadproduto.btn_imprimir.Enabled:=True;
      frm_cadproduto.btn_sair.Enabled:=True;
    end;
end;

end.
