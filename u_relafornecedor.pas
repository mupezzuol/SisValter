unit u_relafornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls;

type
  Tfrm_relafornecedor = class(TForm)
    QuickRep1: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRShape2: TQRShape;
    QRDBText3: TQRDBText;
    QRShape4: TQRShape;
    QRSysData1: TQRSysData;
    QRLabel6: TQRLabel;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRImage1: TQRImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_relafornecedor: Tfrm_relafornecedor;

implementation

uses u_datamodule;

{$R *.dfm}

end.
