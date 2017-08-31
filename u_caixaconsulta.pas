unit u_caixaconsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, StdCtrls, Buttons, ComCtrls;

type
  Tfrm_caixaconsulta = class(TForm)
    DBGrid1: TDBGrid;
    lbl_consulta: TLabel;
    lbl_busca: TLabel;
    btn_consultar: TBitBtn;
    lbl_entrada: TLabel;
    lbl_valor1: TLabel;
    lbl_saida: TLabel;
    lbl_valor2: TLabel;
    lbl_valor3: TLabel;
    lbl_total: TLabel;
    btn_limpar: TBitBtn;
    dtp_data: TDateTimePicker;
    lbl_rs1: TLabel;
    lbl_rs2: TLabel;
    lbl_rs3: TLabel;
    btn_sair: TBitBtn;
    dtp_data2: TDateTimePicker;
    lbl_data1: TLabel;
    lbl_data2: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btn_consultarClick(Sender: TObject);
    procedure btn_limparClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_caixaconsulta: Tfrm_caixaconsulta;
  dtmysql:string;
  vlr_entrada, vlr_saida:Real;
  dtini,dtfin: TDateTime;
  data_convertida:TDate;
  data_covertida1,data_covertida2,date1,date2:string;

implementation

uses u_datamodule;

function datatomysql (data:string):string;
var dd,mm,aaaa:string;

begin
  dd:=Copy(data, 1, 2);
  mm:=Copy(data, 4, 2);
  aaaa:=Copy(data, 7, 4);
  datatomysql:=aaaa+ '-'  +mm+ '-' +dd;
end;

{$R *.dfm}

procedure Tfrm_caixaconsulta.FormActivate(Sender: TObject);
begin
  vlr_entrada:=0;
  vlr_saida:=0;

  Datamodule1.SQLQcaixa.Active:=False;
  DataModule1.SQLQcaixa.SQL.Clear;
  DataModule1.SQLQcaixa.SQL.Add('select * from tblcaixa;');
  DataModule1.SQLQcaixa.Open;
  DataModule1.CDScaixa.Refresh;

  dtp_data.Date:=Now;
  dtp_data2.Date:=Now;
end;

procedure Tfrm_caixaconsulta.btn_consultarClick(Sender: TObject);
begin
  vlr_entrada:=0;
  vlr_saida:=0;

  dtini:=dtp_data.date;
  dtfin:=dtp_data2.date;
  data_covertida1:=DateToStr(dtini) ;
  data_covertida2:=DateToStr(dtfin) ;
  date1:=datatomysql(data_covertida1);
  date2:=datatomysql(data_covertida2);

  Datamodule1.SQLQcaixa.Active:=False;
  DataModule1.SQLQcaixa.SQL.Clear;
  DataModule1.SQLQcaixa.SQL.Add('select * from tblcaixa where vencimento >= "'+date1+'" and vencimento <= "'+date2+'" and tipo="entrada";');
  DataModule1.SQLQcaixa.Open;

  while Not DataModule1.SQLQcaixa.Eof do
    begin
      vlr_entrada:= vlr_entrada + DataModule1.SQLQcaixavalor.AsFloat;
      DataModule1.SQLQcaixa.Next;
    end;

  lbl_valor1.Caption:=FloatToStr(vlr_entrada);



  Datamodule1.SQLQcaixa.Active:=False;
  DataModule1.SQLQcaixa.SQL.Clear;
  DataModule1.SQLQcaixa.SQL.Add('select * from tblcaixa where vencimento >= "'+date1+'" and vencimento <= "'+date2+'" and tipo="saida";');
  DataModule1.SQLQcaixa.Open;

  while Not DataModule1.SQLQcaixa.Eof do
    begin
      vlr_saida:= vlr_saida + DataModule1.SQLQcaixavalor.AsFloat;
      DataModule1.SQLQcaixa.Next;
    end;

  lbl_valor2.Caption:=FloatToStr(vlr_saida);

  lbl_valor3.Caption:=FloatToStr(vlr_entrada-vlr_saida);

  Datamodule1.SQLQcaixa.Active:=False;
  DataModule1.SQLQcaixa.SQL.Clear;
  DataModule1.SQLQcaixa.SQL.Add('select * from tblcaixa where vencimento >= "'+date1+'" and vencimento <= "'+date2+'";');
  DataModule1.SQLQcaixa.Open;
  DataModule1.CDScaixa.Refresh;

  
  lbl_valor1.Caption:=FormatFloat('###,###,##0.00,', StrToFloat(lbl_valor1.Caption)) ;
  lbl_valor2.Caption:=FormatFloat('###,###,##0.00,', StrToFloat(lbl_valor2.Caption)) ;
  lbl_valor3.Caption:=FormatFloat('###,###,##0.00,', StrToFloat(lbl_valor3.Caption)) ;

end;

procedure Tfrm_caixaconsulta.btn_limparClick(Sender: TObject);
begin
  Datamodule1.SQLQcaixa.Active:=False;
  DataModule1.SQLQcaixa.SQL.Clear;
  DataModule1.SQLQcaixa.SQL.Add('select * from tblcaixa;');
  DataModule1.SQLQcaixa.Open;
  DataModule1.CDScaixa.Refresh;

  dtp_data.Date:=Now;
  dtp_data2.Date:=Now;

  lbl_valor1.Caption:='0,00';
  lbl_valor2.Caption:='0,00';
  lbl_valor3.Caption:='0,00';
end;

procedure Tfrm_caixaconsulta.btn_sairClick(Sender: TObject);
begin
  Datamodule1.SQLQcaixa.Active:=False;
  DataModule1.SQLQcaixa.SQL.Clear;
  DataModule1.SQLQcaixa.SQL.Add('select * from tblcaixa;');
  DataModule1.SQLQcaixa.Open;
  DataModule1.CDScaixa.Refresh;

  dtp_data.Date:=Now;
  dtp_data2.Date:=Now;

  lbl_valor1.Caption:='0,00';
  lbl_valor2.Caption:='0,00';
  lbl_valor3.Caption:='0,00';

  frm_caixaconsulta.Close;
end;

end.
