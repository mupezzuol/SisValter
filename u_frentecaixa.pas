unit u_frentecaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, Buttons;

type
  Tfrm_frentecaixa = class(TForm)
    medt_data: TMaskEdit;
    btn_novo: TBitBtn;
    btn_salvar: TBitBtn;
    btn_cancelar: TBitBtn;
    btn_sair: TBitBtn;
    Label1: TLabel;
    edt_preco1: TEdit;
    edt_preco2: TEdit;
    edt_preco3: TEdit;
    edt_preco4: TEdit;
    edt_total: TEdit;
    lbl_total: TLabel;
    cb_servico2: TComboBox;
    cb_servico3: TComboBox;
    cb_servico4: TComboBox;
    cb_colaborador1: TComboBox;
    cb_colaborador2: TComboBox;
    cb_colaborador3: TComboBox;
    cb_colaborador4: TComboBox;
    cb_servico1: TComboBox;
    cb_nome: TComboBox;
    procedure btn_novoClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure cb_servico1Change(Sender: TObject);
    procedure cb_servico2Change(Sender: TObject);
    procedure cb_servico3Change(Sender: TObject);
    procedure cb_servico4Change(Sender: TObject);
    procedure medt_dataKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure edt_preco1Change(Sender: TObject);
    procedure edt_preco2Change(Sender: TObject);
    procedure edt_preco3Change(Sender: TObject);
    procedure edt_preco4Change(Sender: TObject);
    procedure edt_totalChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_frentecaixa: Tfrm_frentecaixa;
  idd, id_produto, ctg_est:Integer;
   n1, n2, n3, n4, ttl, vlr: Real;

implementation

uses u_datamodule;

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

procedure Tfrm_frentecaixa.btn_novoClick(Sender: TObject);
begin
  medt_data.Text:=DateToStr(Date);
  cb_servico1.Clear;
  cb_servico1.Items.Add('<Selecione o Serviço>');

  with DataModule1.SQLQservico do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from tblservico;');
      Open;

      while Not DataModule1.SQLQservico.Eof do
        begin
          cb_servico1.Items.Add(DataModule1.SQLQserviconome.Value);
          DataModule1.SQLQservico.Next;
        end;

      with DataModule1.SQLQservico do
        begin
          Close;
        end;
          
      cb_servico1.ItemIndex:=0;
    end;

  cb_servico2.Clear;
  cb_servico2.Items.Add('<Selecione o Serviço>');

  with DataModule1.SQLQservico do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from tblservico;');
      Open;

      while Not DataModule1.SQLQservico.Eof do
        begin
          cb_servico2.Items.Add(DataModule1.SQLQserviconome.Value);
          DataModule1.SQLQservico.Next;
        end;

      with DataModule1.SQLQservico do
        begin
          Close;
        end;

      cb_servico2.ItemIndex:=0;
    end;

  cb_servico3.Clear;
  cb_servico3.Items.Add('<Selecione o Serviço>');

  with DataModule1.SQLQservico do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from tblservico;');
      Open;

      while Not DataModule1.SQLQservico.Eof do
        begin
          cb_servico3.Items.Add(DataModule1.SQLQserviconome.Value);
          DataModule1.SQLQservico.Next;
        end;

      with DataModule1.SQLQservico do
        begin
          Close;
        end;

      cb_servico3.ItemIndex:=0;
    end;

  cb_servico4.Clear;
  cb_servico4.Items.Add('<Selecione o Serviço>');

  with DataModule1.SQLQservico do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from tblservico;');
      Open;

      while Not DataModule1.SQLQservico.Eof do
        begin
          cb_servico4.Items.Add(DataModule1.SQLQserviconome.Value);
          DataModule1.SQLQservico.Next;
        end;

      with DataModule1.SQLQservico do
        begin
          Close;
        end;

      cb_servico4.ItemIndex:=0;
    end;

  cb_colaborador1.Clear;
  cb_colaborador1.Items.Add('<Selecione o Colaborador>');

  with DataModule1.SQLQcolaborador do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from tblcolaborador;');
      Open;

      while Not DataModule1.SQLQcolaborador.Eof do
        begin
          cb_colaborador1.Items.Add(DataModule1.SQLQcolaboradornome.Value);
          DataModule1.SQLQcolaborador.Next;
        end;

      with DataModule1.SQLQcolaborador do
        begin
          Close;
        end;
          
      cb_colaborador1.ItemIndex:=0;
    end;

  cb_colaborador2.Clear;
  cb_colaborador2.Items.Add('<Selecione o Colaborador>');

  with DataModule1.SQLQcolaborador do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from tblcolaborador;');
      Open;

      while Not DataModule1.SQLQcolaborador.Eof do
        begin
          cb_colaborador2.Items.Add(DataModule1.SQLQcolaboradornome.Value);
          DataModule1.SQLQcolaborador.Next;
        end;

      with DataModule1.SQLQcolaborador do
        begin
          Close;
        end;
          
      cb_colaborador2.ItemIndex:=0;
    end;

  cb_colaborador3.Clear;
  cb_colaborador3.Items.Add('<Selecione o Colaborador>');

  with DataModule1.SQLQcolaborador do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from tblcolaborador;');
      Open;

      while Not DataModule1.SQLQcolaborador.Eof do
        begin
          cb_colaborador3.Items.Add(DataModule1.SQLQcolaboradornome.Value);
          DataModule1.SQLQcolaborador.Next;
        end;

      with DataModule1.SQLQcolaborador do
        begin
          Close;
        end;
          
      cb_colaborador3.ItemIndex:=0;
    end;

  cb_colaborador4.Clear;
  cb_colaborador4.Items.Add('<Selecione o Colaborador>');

  with DataModule1.SQLQcolaborador do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from tblcolaborador;');
      Open;

      while Not DataModule1.SQLQcolaborador.Eof do
        begin
          cb_colaborador4.Items.Add(DataModule1.SQLQcolaboradornome.Value);
          DataModule1.SQLQcolaborador.Next;
        end;

      with DataModule1.SQLQcolaborador do
        begin
          Close;
        end;
          
      cb_colaborador4.ItemIndex:=0;
    end;

  cb_nome.Clear;
  cb_nome.Items.Add('<Selecione o Cliente>');

  with DataModule1.SQLQcliente do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from tblcliente;');
      Open;

      while Not DataModule1.SQLQcliente.Eof do
        begin
          cb_nome.Items.Add(DataModule1.SQLQclientenome.Value);
          DataModule1.SQLQcliente.Next;
        end;

      with DataModule1.SQLQcliente do
        begin
          Close;
        end;

      cb_nome.ItemIndex:=0;
    end;

  btn_novo.Enabled:=False;
  btn_salvar.Enabled:=True;
  btn_cancelar.Enabled:=True;
  btn_sair.Enabled:=False;

  edt_total.Enabled:=False;
  edt_preco1.Enabled:=False;
  edt_preco2.Enabled:=False;
  edt_preco3.Enabled:=False;
  edt_preco4.Enabled:=False;
  medt_data.Enabled:=True;
  cb_nome.Enabled:=True;
  cb_servico1.Enabled:=True;
  cb_servico2.Enabled:=True;
  cb_servico3.Enabled:=True;
  cb_servico4.Enabled:=True;
  cb_colaborador1.Enabled:=True;
  cb_colaborador2.Enabled:=True;
  cb_colaborador3.Enabled:=True;
  cb_colaborador4.Enabled:=True;

  edt_total.Text:='0';
  edt_preco1.Text:='0';
  edt_preco2.Text:='0';
  edt_preco3.Text:='0';
  edt_preco4.Text:='0';
  cb_nome.ItemIndex:=0;
  cb_servico1.ItemIndex:=0;
  cb_servico2.ItemIndex:=0;
  cb_servico3.ItemIndex:=0;
  cb_servico3.ItemIndex:=0;
  cb_colaborador1.ItemIndex:=0;
  cb_colaborador2.ItemIndex:=0;
  cb_colaborador3.ItemIndex:=0;
  cb_colaborador4.ItemIndex:=0;

  cb_nome.SetFocus;
end;

procedure Tfrm_frentecaixa.btn_cancelarClick(Sender: TObject);
begin
  btn_novo.Enabled:=True;
  btn_salvar.Enabled:=False;
  btn_cancelar.Enabled:=False;
  btn_sair.Enabled:=True;

  edt_total.Enabled:=False;
  edt_preco1.Enabled:=False;
  edt_preco2.Enabled:=False;
  edt_preco3.Enabled:=False;
  edt_preco4.Enabled:=False;
  medt_data.Enabled:=False;
  cb_nome.Enabled:=False;
  cb_servico1.Enabled:=False;
  cb_servico2.Enabled:=False;
  cb_servico3.Enabled:=False;
  cb_servico4.Enabled:=False;
  cb_colaborador1.Enabled:=False;
  cb_colaborador2.Enabled:=False;
  cb_colaborador3.Enabled:=False;
  cb_colaborador4.Enabled:=False;

  edt_total.Text:='0';
  edt_preco1.Text:='0';
  edt_preco2.Text:='0';
  edt_preco3.Text:='0';
  edt_preco4.Text:='0';
  medt_data.Text:='';
  cb_nome.ItemIndex:=0;
  cb_servico1.ItemIndex:=0;
  cb_servico2.ItemIndex:=0;
  cb_servico3.ItemIndex:=0;
  cb_servico3.ItemIndex:=0;
  cb_colaborador1.ItemIndex:=0;
  cb_colaborador2.ItemIndex:=0;
  cb_colaborador3.ItemIndex:=0;
  cb_colaborador4.ItemIndex:=0;
end;

procedure Tfrm_frentecaixa.btn_sairClick(Sender: TObject);
begin
  frm_frentecaixa.Close;
end;

procedure Tfrm_frentecaixa.btn_salvarClick(Sender: TObject);
begin
  if (cb_nome.ItemIndex=0) or (medt_data.Text='  /  /    ') then
    begin
      MessageDlg('Preencha os campos nome e data', mtInformation,[mbOK],0);

      btn_novo.Enabled:=False;
      btn_salvar.Enabled:=True;
      btn_cancelar.Enabled:=True;
      btn_sair.Enabled:=False;

      edt_total.Enabled:=False;
      edt_preco1.Enabled:=False;
      edt_preco2.Enabled:=False;
      edt_preco3.Enabled:=False;
      edt_preco4.Enabled:=False;
      medt_data.Enabled:=True;
      cb_nome.Enabled:=True;
      cb_servico1.Enabled:=True;
      cb_servico2.Enabled:=True;
      cb_servico3.Enabled:=True;
      cb_servico4.Enabled:=True;
      cb_colaborador1.Enabled:=True;
      cb_colaborador2.Enabled:=True;
      cb_colaborador3.Enabled:=True;
      cb_colaborador4.Enabled:=True;

      cb_nome.SetFocus;
    end
  else
    begin
      if (cb_servico1.ItemIndex=0) and (cb_servico2.ItemIndex=0) and (cb_servico3.ItemIndex=0) and (cb_servico4.ItemIndex=0) or (cb_colaborador1.ItemIndex=0) and (cb_colaborador2.ItemIndex=0) and (cb_colaborador3.ItemIndex=0) and (cb_colaborador4.ItemIndex=0) then
        begin
          MessageDlg('Preencha ao menos um serviço e um colaborador', mtInformation,[mbOK],0);

          btn_novo.Enabled:=False;
          btn_salvar.Enabled:=True;
          btn_cancelar.Enabled:=True;
          btn_sair.Enabled:=False;

          edt_total.Enabled:=False;
          edt_preco1.Enabled:=False;
          edt_preco2.Enabled:=False;
          edt_preco3.Enabled:=False;
          edt_preco4.Enabled:=False;
          medt_data.Enabled:=True;
          cb_nome.Enabled:=True;
          cb_servico1.Enabled:=True;
          cb_servico2.Enabled:=True;
          cb_servico3.Enabled:=True;
          cb_servico4.Enabled:=True;
          cb_colaborador1.Enabled:=True;
          cb_colaborador2.Enabled:=True;
          cb_colaborador3.Enabled:=True;
          cb_colaborador4.Enabled:=True;

          cb_nome.SetFocus;
        end
      else
        begin
          if (cb_servico1.ItemIndex<>0) and (cb_colaborador1.ItemIndex=0) or (cb_servico2.ItemIndex<>0) and (cb_colaborador2.ItemIndex=0) or (cb_servico3.ItemIndex<>0) and (cb_colaborador3.ItemIndex=0) or (cb_servico4.ItemIndex<>0) and (cb_colaborador4.ItemIndex=0) then
            begin
              MessageDlg('Preencha um colaborador para a execução do serviço', mtInformation,[mbOK],0);
            end
          else
            begin
              if (cb_servico1.ItemIndex=0) and (cb_colaborador1.ItemIndex<>0) or (cb_servico2.ItemIndex=0) and (cb_colaborador2.ItemIndex<>0) or (cb_servico3.ItemIndex=0) and (cb_colaborador3.ItemIndex<>0) or (cb_servico4.ItemIndex=0) and (cb_colaborador4.ItemIndex<>0) then
                begin
                  MessageDlg('Preencha um serviço para o colaborador', mtInformation,[mbOK],0);
                end
              else
                begin
                  n1:=strtofloat(edt_preco1.Text);
                  n2:=strtofloat(edt_preco2.Text);
                  n3:=strtofloat(edt_preco3.Text);
                  n4:=strtofloat(edt_preco4.Text);
                  ttl:=n1+n2+n3+n4;
                  edt_total.Text:=floattostr(ttl);

                  MessageDlg('Frente de caixa realizada com sucesso', mtInformation,[mbOK],0);

                  Datamodule1.SQLQfaturamento.Active:=false;
                  DataModule1.SQLQfaturamento.SQL.Clear;
                  DataModule1.SQLQfaturamento.SQL.Add(' insert into tblfaturamento (nome, servico1, servico2, servico3, servico4, colaborador1, colaborador2, colaborador3, colaborador4, preco1, preco2, preco3, preco4, vencimento, total) values ("'+ cb_nome.Text+'", "'+ cb_servico1.Text+'", "'+ cb_servico2.Text+'", "'+ cb_servico3.Text+'", "'+ cb_servico4.Text+'", "'+ cb_colaborador1.Text +'", "'+ cb_colaborador2.Text +'", "'+ cb_colaborador3.Text +'", "'+ cb_colaborador4.Text +'", "'+valortomysql(edt_preco1.Text)+'", "'+valortomysql(edt_preco2.Text)+'", "'+valortomysql(edt_preco3.Text)+'", "'+valortomysql(edt_preco4.Text)+'", "'+ datatomysql(medt_data.Text)+'", "'+ valortomysql(edt_total.Text) +'") ;');
                  DataModule1.SQLQfaturamento.ExecSQL();

                  Datamodule1.SQLQcaixa.Active:=False;
                    DataModule1.SQLQcaixa.SQL.Clear;
                  DataModule1.SQLQcaixa.SQL.Add(' insert into tblcaixa (nome, valor, vencimento, tipo) values ("'+ 'SERVIÇO - '+(cb_nome.Text) +'", "'+ valortomysql(edt_total.Text) +'", "'+ datatomysql(medt_data.Text) +'", "'+ 'ENTRADA' +'");');
                  DataModule1.SQLQcaixa.ExecSQL();

                  edt_total.Enabled:=False;
                  edt_preco1.Enabled:=False;
                  edt_preco2.Enabled:=False;
                  edt_preco3.Enabled:=False;
                  edt_preco4.Enabled:=False;
                  medt_data.Enabled:=False;
                  cb_nome.Enabled:=False;
                  cb_servico1.Enabled:=False;
                  cb_servico2.Enabled:=False;
                  cb_servico3.Enabled:=False;
                  cb_servico4.Enabled:=False;
                  cb_colaborador1.Enabled:=False;
                  cb_colaborador2.Enabled:=False;
                  cb_colaborador3.Enabled:=False;
                  cb_colaborador4.Enabled:=False;

                  btn_novo.Enabled:=True;
                  btn_salvar.Enabled:=False;
                  btn_cancelar.Enabled:=False;
                  btn_sair.Enabled:=True;
                end;
            end;
        end;
    end;
end;

procedure Tfrm_frentecaixa.cb_servico1Change(Sender: TObject);
begin
  with DataModule1.SQLQservico do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from tblservico where nome="'+ cb_servico1.Text +'";');
      Open;
    end;

  with DataModule1.SQLQfaturamento do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from tblservico inner join tblfaturamento where tblservico.nome = servico1="'+ cb_servico1.Text +'";');
      Open;

      vlr:=DataModule1.SQLQservicopreco.Value;

      edt_preco1.Text := FloatToStr(vlr);

      DataModule1.SQLQfaturamento.Close;
    end;
end;

procedure Tfrm_frentecaixa.cb_servico2Change(Sender: TObject);
begin
  with DataModule1.SQLQservico do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from tblservico where nome="'+ cb_servico2.Text +'";');
      Open;
    end;

  with DataModule1.SQLQfaturamento do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from tblservico inner join tblfaturamento where tblservico.nome = servico2="'+ cb_servico2.Text +'";');
      Open;

      vlr:=DataModule1.SQLQservicopreco.Value;

      edt_preco2.Text := FloatToStr(vlr);

      DataModule1.SQLQfaturamento.Close;
    end;
end;

procedure Tfrm_frentecaixa.cb_servico3Change(Sender: TObject);
begin
  with DataModule1.SQLQservico do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from tblservico where nome="'+ cb_servico3.Text +'";');
      Open;
    end;

  with DataModule1.SQLQfaturamento do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from tblservico inner join tblfaturamento where tblservico.nome = servico3="'+ cb_servico3.Text +'";');
      Open;

      vlr:=DataModule1.SQLQservicopreco.Value;

      edt_preco3.Text := FloatToStr(vlr);

      DataModule1.SQLQfaturamento.Close;
    end;
end;

procedure Tfrm_frentecaixa.cb_servico4Change(Sender: TObject);
begin
   with DataModule1.SQLQservico do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from tblservico where nome="'+ cb_servico4.Text +'";');
      Open;
    end;

  with DataModule1.SQLQfaturamento do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from tblservico inner join tblfaturamento where tblservico.nome = servico4="'+ cb_servico4.Text +'";');
      Open;

      vlr:=DataModule1.SQLQservicopreco.Value;

      edt_preco4.Text := FloatToStr(vlr);

      DataModule1.SQLQfaturamento.Close;
    end;
end;

procedure Tfrm_frentecaixa.medt_dataKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', #8]) then
    begin
      key:=#0;
      Beep;
    end;
end;

procedure Tfrm_frentecaixa.FormActivate(Sender: TObject);
begin
  btn_novo.Enabled:=True;
  btn_salvar.Enabled:=False;
  btn_cancelar.Enabled:=False;
  btn_sair.Enabled:=True;

  edt_total.Enabled:=False;
  edt_preco1.Enabled:=False;
  edt_preco2.Enabled:=False;
  edt_preco3.Enabled:=False;
  edt_preco4.Enabled:=False;
  medt_data.Enabled:=False;
  cb_nome.Enabled:=False;
  cb_servico1.Enabled:=False;
  cb_servico2.Enabled:=False;
  cb_servico3.Enabled:=False;
  cb_servico4.Enabled:=False;
  cb_colaborador1.Enabled:=False;
  cb_colaborador2.Enabled:=False;
  cb_colaborador3.Enabled:=False;
  cb_colaborador4.Enabled:=False;

  edt_total.Text:='0';
  edt_preco1.Text:='0';
  edt_preco2.Text:='0';
  edt_preco3.Text:='0';
  edt_preco4.Text:='0';
  medt_data.Text:='';
  cb_nome.ItemIndex:=0;
  cb_servico1.ItemIndex:=0;
  cb_servico2.ItemIndex:=0;
  cb_servico3.ItemIndex:=0;
  cb_servico3.ItemIndex:=0;
  cb_servico4.ItemIndex:=0;
  cb_colaborador1.ItemIndex:=0;
  cb_colaborador2.ItemIndex:=0;
  cb_colaborador3.ItemIndex:=0;
  cb_colaborador4.ItemIndex:=0;
end;

procedure Tfrm_frentecaixa.edt_preco1Change(Sender: TObject);
begin
  edt_preco1.Text:=FormatFloat('###,###,##0.00,', StrToFloat(edt_preco1.Text)) ;
end;

procedure Tfrm_frentecaixa.edt_preco2Change(Sender: TObject);
begin
  edt_preco2.Text:=FormatFloat('###,###,##0.00,', StrToFloat(edt_preco2.Text)) ;
end;

procedure Tfrm_frentecaixa.edt_preco3Change(Sender: TObject);
begin
  edt_preco3.Text:=FormatFloat('###,###,##0.00,', StrToFloat(edt_preco3.Text)) ;
end;

procedure Tfrm_frentecaixa.edt_preco4Change(Sender: TObject);
begin
  edt_preco4.Text:=FormatFloat('###,###,##0.00,', StrToFloat(edt_preco4.Text)) ;
end;

procedure Tfrm_frentecaixa.edt_totalChange(Sender: TObject);
begin
  edt_total.Text:=FormatFloat('###,###,##0.00,', StrToFloat(edt_total.Text)) ;
end;

end.
