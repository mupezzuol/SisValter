unit u_menucli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, Grids, DBGrids, StdCtrls, Buttons, DB, ExtCtrls;

type
  Tfrm_menucli = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    btn_confirmar: TBitBtn;
    edt_consulta: TEdit;
    DBGrid1: TDBGrid;
    btn_cancelar: TBitBtn;
    BitBtn1: TBitBtn;
    procedure edt_consultaChange(Sender: TObject);
    procedure btn_confirmarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_menucli: Tfrm_menucli;

implementation

uses u_cadcliente, u_datamodule, u_menu;

{$R *.dfm}

procedure Tfrm_menucli.edt_consultaChange(Sender: TObject);
begin
  dbgrid1.DataSource.DataSet.Locate('nome', edt_consulta.Text,[ locaseinsensitive, lopartialkey ] ) ;
end;

procedure Tfrm_menucli.btn_confirmarClick(Sender: TObject);
begin
  frm_menu.edt_cli.Text  := DBGrid1.DataSource.DataSet.fieldbyname('nome').AsString;
  frm_menucli.Close;

  frm_menu.edt_cli.Enabled:=true;
  frm_menu.dtp_data.Enabled:=true;
  frm_menu.cb_horario.Enabled:=true;
  frm_menu.cb_profissional.Enabled:=true;
end;

procedure Tfrm_menucli.btn_cancelarClick(Sender: TObject);
begin
  frm_menu.edt_cli.Text:='';
  frm_menucli.Close;
end;

procedure Tfrm_menucli.FormActivate(Sender: TObject);
begin
  Datamodule1.SQLQcliente.Active:=False;
  DataModule1.SQLQcliente.SQL.Clear;
  DataModule1.SQLQcliente.SQL.Add('select * from tblcliente order by id;');
  DataModule1.SQLQcliente.Open;
  DataModule1.CDScliente.Refresh;
end;

procedure Tfrm_menucli.BitBtn1Click(Sender: TObject);
begin
  frm_cadcliente.ShowModal;
end;

end.
