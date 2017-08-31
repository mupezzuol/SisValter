unit u_listcolaborador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg;

type
  Tfrm_listcolaborador = class(TForm)
    QuickRep1: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
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
  frm_listcolaborador: Tfrm_listcolaborador;

implementation

uses u_datamodule;

{$R *.dfm}

end.
