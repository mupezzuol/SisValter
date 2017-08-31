unit u_saidadaestoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, jpeg, ExtCtrls, Mask;

type
  Tfrm_saidaestoque = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    lbl_nome: TLabel;
    lbl_preco: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    edt_qntestoque: TEdit;
    edt_id: TEdit;
    cb_nomeproduto: TComboBox;
    Image1: TImage;
    Label4: TLabel;
    medt_data: TMaskEdit;
    btn_novo: TBitBtn;
    btn_salvar: TBitBtn;
    btn_cancelar: TBitBtn;
    btn_sair: TBitBtn;
    procedure btn_salvarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cb_nomeprodutoChange(Sender: TObject);
    procedure edt_qntestoqueKeyPress(Sender: TObject; var Key: Char);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure medt_dataKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_saidaestoque: Tfrm_saidaestoque;
  id_produto, ctg_est:Integer;
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

function valortomysql (valor:string):string;
begin
  valortomysql:=stringreplace(valor, ',', '.',[rfReplaceAll, rfIgnoreCase]);
end;

{$R *.dfm}

procedure Tfrm_saidaestoque.btn_salvarClick(Sender: TObject);
begin
  ctg_est:=0;

  if (medt_data.Text='  /  /    ') or (cb_nomeproduto.ItemIndex=0) or (edt_qntestoque.Text = '') then
    begin
      MessageDlg('Preencha todos so campos', mtInformation,[mbOK],0);

      btn_novo.Enabled:=False;
      btn_salvar.Enabled:=True;
      btn_cancelar.Enabled:=True;
      btn_sair.Enabled:=False;

      cb_nomeproduto.Enabled:=True;
      edt_qntestoque.Enabled:=True;
      medt_data.Enabled:=True;

      cb_nomeproduto.SetFocus;
    end
  else
    begin
      Datamodule1.SQLQestoque.Active:=False;
      DataModule1.SQLQestoque.SQL.Clear;
      DataModule1.SQLQestoque.SQL.Add('select * from tblestoque where idproduto="'+edt_id.Text+'";');
      DataModule1.SQLQestoque.Open;
      DataModule1.CDSestoque.Refresh;

      if (Label2.Caption<='0') or ( StrToInt(Label2.Caption) < StrToInt(edt_qntestoque.Text))  then
        begin
          MessageDlg('Não existe estoque diponivel para essa ação', mtInformation,[mbOK],0);

          btn_novo.Enabled:=False;
          btn_salvar.Enabled:=True;
          btn_cancelar.Enabled:=True;
          btn_sair.Enabled:=False;

          cb_nomeproduto.Enabled:=True;
          edt_qntestoque.Enabled:=True;
          medt_data.Enabled:=True;

          edt_qntestoque.SetFocus;
        end
      else
        if not DataModule1.SQLQestoque.Eof then
          begin
            MessageDlg('Saida de produto aefetuada com sucesso', mtInformation,[mbOK],0);

            Datamodule1.SQLQestoque.Active:=False;
            DataModule1.SQLQestoque.SQL.Clear;
            DataModule1.SQLQestoque.SQL.Add('update tblestoque set qntestoque='+ IntToStr( StrToInt(Label2.Caption) - StrToInt(edt_qntestoque.Text) ) +', ultimadata="'+ datatomysql(medt_data.Text) +'" where idproduto="'+edt_id.Text+'";');
            DataModule1.SQLQestoque.ExecSQL();

             with DataModule1.SQLQestoque do
              begin
                Close;
                SQL.Clear;
                SQL.Add('select * from tblproduto inner join tblestoque where tblproduto.id = tblestoque.idproduto and nome="'+cb_nomeproduto.Text+'";');
                Open;

                while Not DataModule1.SQLQestoque.Eof do
                  begin
                    ctg_est:=ctg_est + DataModule1.SQLQestoqueqntestoque.Value;
                    DataModule1.SQLQestoque.Next;
                  end;

                Label2.Caption := IntToStr(ctg_est);

                DataModule1.SQLQestoque.Close;
                DataModule1.SQLQproduto.Close;
              end;

            btn_novo.Enabled:=True;
            btn_salvar.Enabled:=False;
            btn_cancelar.Enabled:=False;
            btn_sair.Enabled:=True;

            edt_id.Enabled:=False;
            cb_nomeproduto.Enabled:=False;
            edt_qntestoque.Enabled:=False;
            medt_data.Enabled:=False;
          end

        else
          begin
            MessageDlg('Saida de produto efetuada com sucesso', mtInformation,[mbOK],0);

            Datamodule1.SQLQestoque.Active:=False;
            DataModule1.SQLQestoque.SQL.Clear;
            DataModule1.SQLQestoque.SQL.Add(' insert into tblestoque (qntestoque, idproduto, ultimadata) values ("'+IntToStr( StrToInt(Label2.Caption) - StrToInt(edt_qntestoque.Text))+'","'+edt_id.Text+'", "'+ datatomysql(medt_data.Text) +'");');
            DataModule1.SQLQestoque.ExecSQL();

            with DataModule1.SQLQestoque do
              begin
                Close;
                SQL.Clear;
                SQL.Add('select * from tblproduto inner join tblestoque where tblproduto.id = tblestoque.idproduto and nome="'+cb_nomeproduto.Text+'";');
                Open;

                while Not DataModule1.SQLQestoque.Eof do
                  begin
                    ctg_est:=ctg_est + DataModule1.SQLQestoqueqntestoque.Value;
                    DataModule1.SQLQestoque.Next;
                  end;

                Label2.Caption := IntToStr(ctg_est);

                DataModule1.SQLQestoque.Close;
                DataModule1.SQLQproduto.Close;

                btn_novo.Enabled:=True;
                btn_salvar.Enabled:=False;
                btn_cancelar.Enabled:=False;
                btn_sair.Enabled:=True;

                edt_id.Enabled:=False;
                cb_nomeproduto.Enabled:=False;
                edt_qntestoque.Enabled:=False;
                medt_data.Enabled:=False;
              end;
          end;
    end;
end;


procedure Tfrm_saidaestoque.FormActivate(Sender: TObject);
begin
  medt_data.Text:= DateToStr(Date);
  cb_nomeproduto.Clear;
  cb_nomeproduto.Items.Add('<Selecione o Produto>');

  with DataModule1.SQLQproduto do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from tblproduto');
      Open;

      while Not DataModule1.SQLQproduto.Eof do
        begin
          cb_nomeproduto.Items.Add(DataModule1.SQLQprodutonome.Value);
          DataModule1.SQLQproduto.Next;
        end;

      with DataModule1.SQLQproduto do
        begin
          Close;
        end;
        
      cb_nomeproduto.ItemIndex:=0;
    end;

  btn_novo.Enabled:=True;
  btn_salvar.Enabled:=False;
  btn_cancelar.Enabled:=False;
  btn_sair.Enabled:=True;

  cb_nomeproduto.Enabled:=False;
  edt_qntestoque.Enabled:=False;
  medt_data.Enabled:=False;
end;

procedure Tfrm_saidaestoque.cb_nomeprodutoChange(Sender: TObject);
begin
  //contagem de estoque
  ctg_est:=0;

  with DataModule1.SQLQproduto do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from tblproduto where nome="'+cb_nomeproduto.Text+'";');
      Open;
    end;

  with DataModule1.SQLQestoque do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from tblproduto inner join tblestoque where tblproduto.id = tblestoque.idproduto and nome="'+cb_nomeproduto.Text+'";');
      Open;

      id_produto:=DataModule1.SQLQprodutoid.Value;

      while Not DataModule1.SQLQestoque.Eof do
        begin
          ctg_est:=ctg_est + DataModule1.SQLQestoqueqntestoque.Value;
          DataModule1.SQLQestoque.Next;
        end;

      Label2.Caption := IntToStr(ctg_est);
      edt_id.Text:= IntToStr(id_produto);
      DataModule1.SQLQestoque.Close;
      DataModule1.SQLQproduto.Close;
    end;
end;

procedure Tfrm_saidaestoque.edt_qntestoqueKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', #8]) then
    begin
      key:=#0;
      Beep;
    end;
end;

procedure Tfrm_saidaestoque.btn_sairClick(Sender: TObject);
begin
  edt_id.Text:='';
  cb_nomeproduto.ItemIndex:=0;
  edt_qntestoque.Text:='';
  medt_data.Text:='';
  Label2.Caption:='';
  
  frm_saidaestoque.Close;
end;

procedure Tfrm_saidaestoque.btn_novoClick(Sender: TObject);
begin
  btn_novo.Enabled:=False;
  btn_salvar.Enabled:=True;
  btn_cancelar.Enabled:=True;
  btn_sair.Enabled:=False;

  cb_nomeproduto.Enabled:=True;
  edt_qntestoque.Enabled:=True;
  medt_data.Enabled:=True;

  edt_id.Text:='';
  cb_nomeproduto.ItemIndex:=0;
  edt_qntestoque.Text:='';
  Label2.Caption:='';

  cb_nomeproduto.SetFocus;
end;

procedure Tfrm_saidaestoque.btn_cancelarClick(Sender: TObject);
begin
  edt_id.Text:='';
  cb_nomeproduto.ItemIndex:=0;
  edt_qntestoque.Text:='';
  medt_data.Text:='';
  Label2.Caption:='';

  btn_novo.Enabled:=True;
  btn_salvar.Enabled:=False;
  btn_cancelar.Enabled:=False;
  btn_sair.Enabled:=True;

  edt_id.Enabled:=False;
  cb_nomeproduto.Enabled:=False;
  edt_qntestoque.Enabled:=False;
  medt_data.Enabled:=False;
end;

procedure Tfrm_saidaestoque.medt_dataKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', #8]) then
    begin
      key:=#0;
      Beep;
    end;
end;

end.
