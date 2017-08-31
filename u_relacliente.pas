unit u_relacliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, ExtCtrls, QRCtrls;

type
  Tfrm_relacliente = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape4: TQRShape;
    QRSysData1: TQRSysData;
    QRLabel6: TQRLabel;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRImage1: TQRImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_relacliente: Tfrm_relacliente;

implementation

uses u_datamodule;

{$R *.dfm}

end.
