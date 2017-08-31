unit u_login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls,
  ComCtrls, XPMan;

type
  Tfrm_login = class(TForm)
    Image1: TImage;
    StaticText1: TStaticText;
    lbl_usuario: TLabel;
    lbl_senha: TLabel;
    edt_usuario: TEdit;
    edt_senha: TEdit;
    btn_acessar: TBitBtn;
    btn_sair: TBitBtn;
    Panel1: TPanel;
    Timer1: TTimer;
    XPManifest1: TXPManifest;
    GroupBox1: TGroupBox;
    StatusBar1: TStatusBar;
    procedure btn_acessarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_login: Tfrm_login;
  tentativas: Integer;

implementation

uses u_menu, u_datamodule, DB;

{$R *.dfm}

procedure Tfrm_login.btn_acessarClick(Sender: TObject);
var a,b:string;
begin
  DataModule1.SQLQcolaborador.Active :=False;
  DataModule1.SQLQcolaborador.SQL.Clear;
  DataModule1.SQLQcolaborador.SQL.Add('select * from tblcolaborador where usuario = "'+edt_usuario.Text+'";');
  DataModule1.SQLQcolaborador.Open;
  DataModule1.CDScolaborador.Refresh;

  if not DataModule1.SQLQcolaborador.Eof then
    begin
      a:= DataModule1.DScolaborador.DataSet.FieldbyName('usuario').value ;
      b:= DataModule1.DScolaborador.DataSet.FieldbyName('senha').value;

      if (edt_usuario.Text = a) and (edt_senha.Text = b) then
        begin
          frm_menu.lb_login.Caption:= edt_usuario.Text;
          frm_login.Visible:=False;
          frm_menu.ShowModal;
        end
      else
        begin
          tentativas:=tentativas+1;

          if tentativas=5 then
            begin
              btn_acessar.Enabled:=False;

              MessageDlg('Número de tentativas excedidas', mtInformation,[mbOK],0);
            end
          else
            if edt_senha.Text='' then
              begin
                MessageDlg('Peencha todos os campos', mtInformation,[mbOK],0);

                edt_usuario.SetFocus;
              end
            else
              begin
                MessageDlg('Senha ou usuario invalido', mtInformation,[mbOK],0);

                edt_usuario.SetFocus;
                edt_senha.Text:='';
              end;
        end;
    end
  else
    if tentativas=4 then
      begin
        btn_acessar.Enabled:=False;

        MessageDlg('Número de tentativas excedidas', mtInformation,[mbOK],0);

        btn_sair.SetFocus;
      end
    else
      begin
        tentativas:=tentativas+1;

          if (edt_usuario.Text='') or (edt_senha.Text='') then
            begin
              MessageDlg('Preencha todos os campos', mtInformation,[mbOK],0);
              edt_usuario.SetFocus;
              edt_senha.Text:='';
            end
          else
            begin
              MessageDlg('Senha ou usuario invalido', mtInformation,[mbOK],0);

              edt_usuario.SetFocus;
              edt_senha.Text:='';

              tentativas:=tentativas+1;
            end;
      end;
end;

procedure Tfrm_login.btn_sairClick(Sender: TObject);
begin
  application.Terminate;
end;

procedure Tfrm_login.Timer1Timer(Sender: TObject);
begin
  statusbar1.Panels[1].Text:='Hora: ' + TimeToStr(Time);
  statusbar1.Panels[2].Text:='Data: ' + DateToStr(Date);
end;

procedure Tfrm_login.FormActivate(Sender: TObject);
begin
  tentativas:=0;
  edt_usuario.SetFocus;
  edt_usuario.Text:='';
  edt_senha.Text:='';
end;

end.
