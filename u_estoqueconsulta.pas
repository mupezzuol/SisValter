unit u_estoqueconsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB;

type
  Tfrm_estoqueconsulta = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    btn_sair: TBitBtn;
    procedure Edit1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_estoqueconsulta: Tfrm_estoqueconsulta;

implementation

uses u_datamodule;



{$R *.dfm}

procedure Tfrm_estoqueconsulta.Edit1Change(Sender: TObject);
begin
  if Edit1.Text<>'' then
    dbgrid1.DataSource.DataSet.Locate('idproduto', edit1.Text,[ locaseinsensitive, lopartialkey ] ) ;
end;

procedure Tfrm_estoqueconsulta.FormActivate(Sender: TObject);
begin
  Datamodule1.SQLQestoque.Active:=False;
  DataModule1.SQLQestoque.SQL.Clear;
  DataModule1.SQLQestoque.SQL.Add('select * from tblestoque;');
  DataModule1.SQLQestoque.Open;
  DataModule1.CDSestoque.Refresh;

  Edit1.SetFocus;
end;

procedure Tfrm_estoqueconsulta.btn_sairClick(Sender: TObject);
begin
  frm_estoqueconsulta.Close;
end;

end.
