unit u_caixasaida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, ComCtrls, Buttons;

type
  Tfrm_saidacaixa = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    lbl_nome: TLabel;
    lbl_preco: TLabel;
    Label3: TLabel;
    edt_valor: TEdit;
    edt_nome: TEdit;
    medt_data: TMaskEdit;
    btn_novo: TBitBtn;
    btn_salvar: TBitBtn;
    btn_cancelar: TBitBtn;
    btn_sair: TBitBtn;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure edt_valorKeyPress(Sender: TObject; var Key: Char);
    procedure btn_novoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure medt_dataKeyPress(Sender: TObject; var Key: Char);
    procedure edt_valorExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_saidacaixa: Tfrm_saidacaixa;
  idd: Integer;

implementation

uses u_datamodule, u_caixaentrada;

function valortomysql (valor:string):string;
begin
  valortomysql:=stringreplace(valor, ',', '.',[rfReplaceAll, rfIgnoreCase]);
end;

function datatomysql (data:string):string;
var dd,mm,aaaa:string;

begin
  dd:=Copy(data, 1, 2);
  mm:=Copy(data, 4, 2);
  aaaa:=Copy(data, 7, 4);
  datatomysql:=aaaa+ '-'  +mm+ '-' +dd;
end;


{$R *.dfm}

procedure Tfrm_saidacaixa.btn_sairClick(Sender: TObject);
begin
  edt_nome.Text:='';
  edt_valor.Text:='0,00';
  medt_data.Text:='';
  
  frm_saidacaixa.Close;
end;

procedure Tfrm_saidacaixa.btn_salvarClick(Sender: TObject);
begin
  if (medt_data.Text = '  /  /    ') or (edt_nome.Text = '') or (edt_valor.Text = '0,00') then
    begin
      MessageDlg('Preencha todos os campos', mtInformation,[mbOK],0);

      edt_nome.SetFocus;
    end
  else
    begin
      if (edt_valor.Text = '0,00') then
        begin
          MessageDlg('Insira um valor para o produto', mtInformation,[mbOK],0);

          edt_valor.SetFocus;
        end
      else
        begin
          Datamodule1.SQLQcaixa.Active:=False;
          DataModule1.SQLQcaixa.SQL.Clear;
          DataModule1.SQLQcaixa.SQL.Add('select * from tblcaixa;');
          DataModule1.SQLQcaixa.Open;
          DataModule1.CDScaixa.Refresh;

          Datamodule1.SQLQcaixa.Active:=False;
          DataModule1.SQLQcaixa.SQL.Clear;
          DataModule1.SQLQcaixa.SQL.Add(' insert into tblcaixa (nome, valor, vencimento, tipo) values ("'+ edt_nome.Text +'","'+ valortomysql(edt_valor.Text) +'","'+ datatomysql(medt_data.Text) +'","'+ 'SAIDA' +'");');
          DataModule1.SQLQcaixa.ExecSQL();

          MessageDlg('Saida de caixa efetuada com sucesso', mtInformation,[mbOK],0);

          edt_nome.Enabled:=False;
          edt_valor.Enabled:=False;
          medt_data.Enabled:=False;

          btn_novo.Enabled:=True;
          btn_salvar.Enabled:=False;
          btn_cancelar.Enabled:=False;
          btn_sair.Enabled:=True;
        end;
    end;
end;

procedure Tfrm_saidacaixa.edt_valorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', ',', #8]) then
    begin
      key:=#0;
      Beep;
    end;
end;

procedure Tfrm_saidacaixa.btn_novoClick(Sender: TObject);
begin
  btn_novo.Enabled:=False;
  btn_salvar.Enabled:=True;
  btn_cancelar.Enabled:=True;
  btn_sair.Enabled:=False;

  edt_nome.Text:='';
  edt_valor.Text:='0,00';
  medt_data.Text:='';

  edt_nome.Enabled:=True;
  edt_valor.Enabled:=True;
  medt_data.Enabled:=True;

  medt_data.Text:= DateToStr(Date);

  edt_nome.SetFocus
end;

procedure Tfrm_saidacaixa.FormCreate(Sender: TObject);
begin
  btn_novo.Enabled:=True;
  btn_salvar.Enabled:=False;
  btn_cancelar.Enabled:=False;
  btn_sair.Enabled:=True;

  edt_nome.Enabled:=False;
  edt_valor.Enabled:=False;
  medt_data.Enabled:=False;
end;

procedure Tfrm_saidacaixa.btn_cancelarClick(Sender: TObject);
begin
  edt_nome.Text:='';
  edt_valor.Text:='0,00';
  medt_data.Text:='';

  edt_nome.Enabled:=False;
  edt_valor.Enabled:=False;
  medt_data.Enabled:=False;

  btn_novo.Enabled:=True;
  btn_salvar.Enabled:=False;
  btn_cancelar.Enabled:=False;
  btn_sair.Enabled:=True;
end;

procedure Tfrm_saidacaixa.medt_dataKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', #8]) then
    begin
      key:=#0;
      Beep;
    end;
end;

procedure Tfrm_saidacaixa.edt_valorExit(Sender: TObject);
begin
  edt_valor.Text:=FormatFloat('##.##,', StrToFloat(edt_valor.Text)) ;
end;

end.
