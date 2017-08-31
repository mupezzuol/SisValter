unit u_relaservico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, ExtCtrls, QRCtrls;

type
  Tfrm_relaservico = class(TForm)
    QuickRep1: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRShape2: TQRShape;
    QRDBText3: TQRDBText;
    QRSysData1: TQRSysData;
    QRLabel6: TQRLabel;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel3: TQRLabel;
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
  frm_relaservico: Tfrm_relaservico;

implementation

uses u_datamodule;

{$R *.dfm}

end.
