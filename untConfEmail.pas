unit untConfEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, ComCtrls, IdTCPConnection,
  IdTCPClient, IdMessageClient, IdSMTP, IdBaseComponent, IdComponent,
  IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL, DB, IdMessage, jpeg;

type
  TFrmConfEmail = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    lblSMTP: TLabel;
    lblUsuarioEmail: TLabel;
    lblSenhaEmail: TLabel;
    lblPorta: TLabel;
    edtServidorSMTP: TEdit;
    edtUsuarioServ: TEdit;
    edtSenhaServ: TEdit;
    chkServerRequerAut: TCheckBox;
    edtPortaServ: TEdit;
    chkSSL: TCheckBox;
    Panel1: TPanel;
    btn_sair: TBitBtn;
    IdSMTP1: TIdSMTP;
    IdSSLIOHandlerSocket1: TIdSSLIOHandlerSocket;
    IdMessage1: TIdMessage;
    Btn_enviar: TBitBtn;
    OpenDialog1: TOpenDialog;
    pb1: TProgressBar;
    tmr1: TTimer;
    Enviar_email: TTabSheet;
    edtContaEmail: TEdit;
    Label2: TLabel;
    edtAssunto: TEdit;
    Memo1: TMemo;
    btn_anexar: TBitBtn;
    btn_excluir_anexo: TBitBtn;
    Label3: TLabel;
    MemoMsg: TMemo;
    Label1: TLabel;
    De: TLabel;
    edt_de: TEdit;
    Para: TLabel;
    edt_para: TEdit;
    btn_selecao_membros: TBitBtn;
    edtCodigo: TEdit;
    Label4: TLabel;
    img_arroba: TImage;
    procedure btn_sairClick(Sender: TObject);
    procedure Btn_enviarClick(Sender: TObject);
    procedure btn_anexarClick(Sender: TObject);
    procedure btn_excluir_anexoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure Enviar_emailShow(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
  private
    { Private declarations }
    newReg : Boolean;
   cancelar:Boolean;
   function Validar: Boolean;
    
  public
    { Public declarations }
  end;

var
  FrmConfEmail: TFrmConfEmail;
    progresso:Integer;
implementation



{$R *.dfm}

procedure TFrmConfEmail.btn_sairClick(Sender: TObject);
begin
  edt_de.Clear;
  edt_para.Clear;
  edtAssunto.Clear;

  edtContaEmail.Clear;
  Memo1.Lines.Clear;
  MemoMsg.Lines.Clear;
  Close;
end;


function TFrmConfEmail.Validar(): Boolean;
begin
  result := true;

  if edtServidorSMTP.Text = '' then begin
    ShowMessage('ATENÇÃO: Campo Servidor SMTP em Branco!');
    edtServidorSMTP.SetFocus;
    result := false;
  end
  else if edtUsuarioServ.Text = '' then begin
    Showmessage('ATENÇÃO: Campo Usuário em Branco!');
    edtUsuarioServ.SetFocus;
    result := false;
  end
  else if edtSenhaServ.Text = '' then begin
    Showmessage('ATENÇÃO: Campo Senha em Branco!');
    edtSenhaServ.SetFocus;
    result := false;
  end
  else if edtContaEmail.Text = '' then begin
    Showmessage('ATENÇÃO: Campo Conta de E-mail Padrão em Branco!');
    edtContaEmail.SetFocus;
    result := false;
  end;
end;

procedure TFrmConfEmail.Btn_enviarClick(Sender: TObject);
var
 i:integer;
begin
  progresso:=1;
  if edt_de.text='' then
  begin
    ShowMessage('nome do remetende precisa ser preencido');
    edt_de.SetFocus;
  end
  else
  if edt_para.Text = '' then
  begin
    ShowMessage('nome do destinatário precisa ser preencido');
  end
  else
  if edtContaEmail.Text = '' then
  begin
    ShowMessage('E-mail do destinatário precisa ser preencido');
  end
  else
   if edtAssunto.Text = '' then
  begin
    ShowMessage('Por favor informe o assunto');
  end
  else
  if MemoMsg.Text = '' then
  begin
    ShowMessage('Mensagem para o destinatário precisa ser preencido');
  end
  else
  begin
  Btn_enviar.Enabled:=True;
try
  tmr1.Enabled:=True;
    cancelar            := false;
    Screen.Cursor       := crHourGlass;
    Screen.Cursor    := crHourGlass;
    IdSMTP1.Host     := edtServidorSMTP.Text;
    IdSMTP1.Username := edtUsuarioServ.Text;
    IdSMTP1.Password := edtSenhaServ.Text;
    IdSMTP1.Port     := StrToInt(edtPortaServ.Text);

    // servidor requer autenticacao
    if chkServerRequerAut.Checked  then
      IdSMTP1.AuthenticationType:= atLogin
    else
     IdSMTP1.AuthenticationType:= atNone;

    // utilizar conexao segura SSL
    if chkSSL.Checked then
      IdSMTP1.IOHandler := IdSSLIOHandlerSocket1
    else
      IdSMTP1.IOHandler := nil;

    IdMessage1.MessageParts.Clear;

    // adicionando anexos do email a ser enviado
   if Memo1.Lines.Count > 0 then begin
      for i:= 0 to Memo1.Lines.Count - 1 do
          TIdAttachment.Create(IdMessage1.MessageParts, Memo1.Lines[i]);
    end; 

    // dados da origem do email
    IdMessage1.From.Address := edtUsuarioServ.Text;
    IdMessage1.Subject      := edtAssunto.Text;


    // dados do destino do email
    IdMessage1.Body.Add('Razão social :Igreja do Evangelho Pleno');
    
    IdMessage1.Body.Add('Enviado por '+edt_de.text);

    IdMessage1.Body.Add('Referente:'+edtAssunto.Text);

    IdMessage1.Body.Add('Para:'+edt_para.text);

    IdMessage1.Recipients.EMailAddresses  := edtContaEmail.Text;
    IdMessage1.Body.Text    := MemoMsg.text;
    IdMessage1.BccList.EMailAddresses     := '';
    IdMessage1.CCList.EMailAddresses      := '';

    if NOT IdSMTP1.Connected then
      IdSMTP1.Connect(2000);

    if IdSMTP1.Connected then begin


        //IdSMTP1.Authenticate;
        IdSMTP1.Send(IdMessage1);
        //Application.ProcessMessages;
        
        if cancelar AND (Application.MessageBox('Deseja cancelar o processo?','Confirmação',mb_iconQuestion + mb_YesNo + mb_DefButton2) = mrYes) then


        cancelar := false;

        Application.ProcessMessages;
      end;


    IdSMTP1.Disconnect;
    Screen.Cursor:= crDefault;

    ShowMessage('E-mail Enviado com Sucesso!');
    //Close;
  Except
    on E:Exception do begin
      Screen.Cursor:= crDefault;

      ShowMessage(E.Message);
    end;

  end;
  end;
end;   
procedure TFrmConfEmail.btn_anexarClick(Sender: TObject);
var
i:integer;
begin
if OpenDialog1.Execute then
	begin
		for i:= 0 to OpenDialog1.Files.Count -1 do
		if (Memo1.Lines.IndexOf(OpenDialog1.Files[i]) = -1) then
			Memo1.lines.Add(OpenDialog1.Files[i])
	end;
end;

procedure TFrmConfEmail.btn_excluir_anexoClick(Sender: TObject);
begin
Memo1.Lines.Clear;
end;

procedure TFrmConfEmail.FormActivate(Sender: TObject);
begin
     tmr1.Enabled:=False;

end;

procedure TFrmConfEmail.tmr1Timer(Sender: TObject);
begin
if progresso =1  then
begin
  pb1.Position:=pb1.Position+200;
end;


end;

procedure TFrmConfEmail.Enviar_emailShow(Sender: TObject);
begin
Btn_enviar.Enabled:=True;

end;

procedure TFrmConfEmail.TabSheet1Show(Sender: TObject);
begin
Btn_enviar.Enabled:=False;
end;

end.
