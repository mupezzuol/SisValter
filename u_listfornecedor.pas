unit u_listfornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls;

type
  Tfrm_listfornecedor = class(TForm)
    QuickRep1: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    DetailBand1: TQRBand;
    QRShape4: TQRShape;
    QRDBText1: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRShape5: TQRShape;
    QRImage1: TQRImage;
    QRLabel6: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_listfornecedor: Tfrm_listfornecedor;

implementation

uses u_datamodule;

{$R *.dfm}

end.
