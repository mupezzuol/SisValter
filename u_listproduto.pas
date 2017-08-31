unit u_listproduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls;

type
  Tfrm_listproduto = class(TForm)
    QuickRep1: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRShape5: TQRShape;
    QRImage1: TQRImage;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    qrl_total: TQRLabel;
    DetailBand1: TQRBand;
    QRShape4: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText3Print(sender: TObject; var Value: String);
   
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_listproduto: Tfrm_listproduto;
     valor, soma: Real;
implementation

uses u_datamodule;

{$R *.dfm}


procedure Tfrm_listproduto.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
soma:=0;
valor:=0;
end;

procedure Tfrm_listproduto.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  valor := DataModule1.SQLQprodutopreco.AsFloat;
  soma := soma + valor ;
  qrl_total.Caption := FormatFloat('R$ #,###.00',soma);
end;

end.
