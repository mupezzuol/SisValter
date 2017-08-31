unit u_menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, XPMan, Buttons, Grids, DBGrids, jpeg, ExtCtrls,
  Mask, QuickRpt, QRCtrls, ComCtrls;

type
  Tfrm_menu = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edt_cli: TEdit;
    Label7: TLabel;
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    CadastrodeCLientes1: TMenuItem;
    CadastrodeProdutos1: TMenuItem;
    CadastrodeColaboradores1: TMenuItem;
    CadastrodeServios1: TMenuItem;
    CadastrodeFornecedores1: TMenuItem;
    RelatriosGerais1: TMenuItem;
    Clientes1: TMenuItem;
    Produtos1: TMenuItem;
    Colaboradores1: TMenuItem;
    Servios1: TMenuItem;
    Fornecedores1: TMenuItem;
    ControledeEstoque1: TMenuItem;
    Entrada1: TMenuItem;
    Sada1: TMenuItem;
    Sair1: TMenuItem;
    AbandonarSistema1: TMenuItem;
    btn_agendar: TBitBtn;
    btn_limpar: TBitBtn;
    btn_excluir: TBitBtn;
    btn_consultar: TBitBtn;
    DBGrid1: TDBGrid;
    Image1: TImage;
    QRShape1: TQRShape;
    Image2: TImage;
    ControledeCaixa1: TMenuItem;
    Entrada2: TMenuItem;
    Saida1: TMenuItem;
    rocarUsurio1: TMenuItem;
    btn_novo: TBitBtn;
    ConslutadoEstoque1: TMenuItem;
    ConsultadoCaixa1: TMenuItem;
    dtp_data: TDateTimePicker;
    FrentedeCaixa1: TMenuItem;
    btn_cancelar: TBitBtn;
    cb_profissional: TComboBox;
    cb_horario: TComboBox;
    lb_login: TLabel;
    procedure CadastrodeCLientes1Click(Sender: TObject);
    procedure CadastrodeProdutos1Click(Sender: TObject);
    procedure CadastrodeColaboradores1Click(Sender: TObject);
    procedure CadastrodeServios1Click(Sender: TObject);
    procedure AbandonarSistema1Click(Sender: TObject);
    procedure CadastrodeFornecedores1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Colaboradores1Click(Sender: TObject);
    procedure Servios1Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure Entrada1Click(Sender: TObject);
    procedure Sada1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btn_consultarClick(Sender: TObject);
    procedure btn_agendarClick(Sender: TObject);
    procedure btn_limparClick(Sender: TObject);
    procedure Entrada2Click(Sender: TObject);
    procedure Saida1Click(Sender: TObject);
    procedure rocarUsurio1Click(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ConslutadoEstoque1Click(Sender: TObject);
    procedure ConsultadoCaixa1Click(Sender: TObject);
    procedure cb_profissionalChange(Sender: TObject);
    procedure dtp_dataChange(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure FrentedeCaixa1Click(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_menu: Tfrm_menu;
  a, b, c, data, dtmysql: string;
  d: Integer;

implementation

uses u_login, u_cadcliente, u_cadproduto, u_cadcolaborador, u_cadservico,
  u_cadfornecedor, u_listcliente, u_listproduto, u_listcolaborador,
  u_listservico, u_listfornecedor, u_entradaestoque, u_saidadaestoque,
  untConfEmail, u_datamodule, u_menucli, u_caixaentrada, u_caixasaida,
  u_estoqueconsulta, u_caixaconsulta, u_frentecaixa;

  function datatomysql (data:string):string;
var dd,mm,aaaa:string;

begin
  dd:=Copy(data, 1, 2);
  mm:=Copy(data, 4, 2);
  aaaa:=Copy(data, 7, 4);
  datatomysql:=aaaa+ '-'  +mm+ '-' +dd;
end;


{$R *.dfm}

procedure Tfrm_menu.CadastrodeCLientes1Click(Sender: TObject);
begin
  frm_cadcliente.Show;
end;
procedure Tfrm_menu.CadastrodeProdutos1Click(Sender: TObject);
begin
  frm_cadproduto.Show;
end;

procedure Tfrm_menu.CadastrodeColaboradores1Click(Sender: TObject);
begin
  frm_cadcolaborador.Show;
end;

procedure Tfrm_menu.CadastrodeServios1Click(Sender: TObject);
begin
  frm_cadservico.Show;
end;

procedure Tfrm_menu.AbandonarSistema1Click(Sender: TObject);
begin
  frm_login.edt_usuario.Text:='';
  frm_login.edt_senha.Text:='';
  frm_login.Show;

  Application.Terminate;
end;

procedure Tfrm_menu.CadastrodeFornecedores1Click(Sender: TObject);
begin
  frm_cadfornecedor.Show;
end;

procedure Tfrm_menu.Produtos1Click(Sender: TObject);
begin
  with  DataModule1.SQLQproduto   do
    begin
      Active :=False;
      SQL.Clear;
      SQL.Add('select * from tblproduto;' );
      Open;
      Refresh;

      frm_listproduto.QuickRep1.Preview;
    end;
end;

procedure Tfrm_menu.Colaboradores1Click(Sender: TObject);
begin
  with  DataModule1.SQLQcolaborador   do
    begin
      Active :=False;
      SQL.Clear;
      SQL.Add('select * from tblcolaborador;' );
      Open;
      Refresh;

      frm_listcolaborador.QuickRep1.Preview;
    end;
end;

procedure Tfrm_menu.Servios1Click(Sender: TObject);
begin
  with  DataModule1.SQLQservico   do
    begin
      Active :=False;
      SQL.Clear;
      SQL.Add('select * from tblservico;' );
      Open;
      Refresh;

      frm_listservico.QuickRep1.Preview;
    end;
end;

procedure Tfrm_menu.Fornecedores1Click(Sender: TObject);
begin
  with  DataModule1.SQLQfornecedor   do
    begin
      Active :=False;
      SQL.Clear;
      SQL.Add('select * from tblfornecedor;' );
      Open;
      Refresh;

      frm_listfornecedor.QuickRep1.Preview;
    end;
end;

procedure Tfrm_menu.Entrada1Click(Sender: TObject);
begin
  frm_entradaestoque.ShowModal;
end;

procedure Tfrm_menu.Sada1Click(Sender: TObject);
begin
  frm_saidaestoque.ShowModal;
end;

procedure Tfrm_menu.Clientes1Click(Sender: TObject);
begin
  with  DataModule1.SQLQcliente   do
    begin
      Active :=False;
      SQL.Clear;
      SQL.Add('select * from tblcliente;' );
      Open;
      Refresh;

      frm_listcliente.QuickRep1.Preview;
    end;
end;


procedure Tfrm_menu.Button1Click(Sender: TObject);
begin
  frm_menucli.ShowModal;
end;

procedure Tfrm_menu.btn_consultarClick(Sender: TObject);

begin
  Datamodule1.SQLQcliente.Active:=False;
  DataModule1.SQLQcliente.SQL.Clear;
  DataModule1.SQLQcliente.SQL.Add('select * from tblcliente order by id;');
  DataModule1.SQLQcliente.Open;
  DataModule1.CDScliente.Refresh;
  
  frm_menucli.Show;
end;

procedure Tfrm_menu.btn_agendarClick(Sender: TObject);
begin
  if (edt_cli.Text='') or (cb_profissional.ItemIndex=0) or (cb_horario.ItemIndex=0) then
    begin
      MessageDlg('Preencha todos so campos', mtInformation,[mbOK],0);

      dtp_data.Enabled:=True;
      cb_horario.Enabled:=True;
      cb_profissional.Enabled:=True;

      btn_novo.Enabled:=False;
      btn_agendar.Enabled:= True;
      btn_limpar.Enabled:=True;
      btn_excluir.Enabled:=False;
      btn_consultar.Enabled:=True;
      btn_cancelar.Enabled:=True;
    end
  else
    begin
      data:=DateToStr(dtp_data.Date);

      with DataModule1.SQLQagenda do
        begin
          Active:=False;
          SQL.Clear;
          SQL.Add(' insert into tblagenda (profissional, horario, cliente, agenda) values ("'+ cb_profissional.Text +'", "'+ cb_horario.Text +'","'+ edt_cli.Text +'", "'+ datatomysql(data) +'");');
          DataModule1.SQLQagenda.ExecSQL();

          MessageDlg('Horário marcado com Sucesso', mtInformation,[mbOK],0);
        end;

        with DataModule1.SQLQagenda do
          begin
            Active:=False;
            SQL.Clear;
            SQL.Add('select * from tblagenda order by agenda;');
            Open;

            DataModule1.CDSagenda.Refresh;
          end;

      dtp_data.Enabled:=False;
      cb_horario.Enabled:=False;
      cb_profissional.Enabled:=False;

      btn_novo.Enabled:=True;
      btn_agendar.Enabled:= False;
      btn_limpar.Enabled:=False;
      btn_excluir.Enabled:=True;
      btn_consultar.Enabled:=False;
      btn_cancelar.Enabled:=False;

      cb_profissional.ItemIndex :=0;
      cb_horario.ItemIndex :=0;
      dtp_data.Date:=Now;
      edt_cli.Clear;
    end;
end;

procedure Tfrm_menu.btn_limparClick(Sender: TObject);
begin
  cb_profissional.ItemIndex :=0;
  cb_horario.ItemIndex :=0;
  dtp_data.Date:=Now;
  edt_cli.Text:='';

  Datamodule1.SQLQagenda.Active:=False;
  DataModule1.SQLQagenda.SQL.Clear;
  DataModule1.SQLQagenda.SQL.Add('select * from tblagenda order by agenda;');

  DataModule1.SQLQagenda.Open;
  DataModule1.CDSagenda.Refresh;
end;

procedure Tfrm_menu.Entrada2Click(Sender: TObject);
begin
  frm_entradacaixa.ShowModal;
end;

procedure Tfrm_menu.Saida1Click(Sender: TObject);
begin
  frm_saidacaixa.ShowModal;
end;

procedure Tfrm_menu.rocarUsurio1Click(Sender: TObject);
begin
  frm_login.Visible:=True;
  frm_menu.Close;
end;

procedure Tfrm_menu.btn_novoClick(Sender: TObject);
begin
  dtp_data.Enabled:=True;
  cb_horario.Enabled:=True;
  cb_profissional.Enabled:=True;

  btn_novo.Enabled:=False;
  btn_agendar.Enabled:= True;
  btn_limpar.Enabled:=True;
  btn_excluir.Enabled:=False;
  btn_consultar.Enabled:=True;
  btn_cancelar.Enabled:=True;
end;

procedure Tfrm_menu.FormActivate(Sender: TObject);
begin
  lb_login.Caption:= frm_login.edt_usuario.Text;

  if edt_cli.Text='' then
    begin
      btn_novo.Enabled:=True;
      btn_agendar.Enabled:= False;
      btn_limpar.Enabled:=False;
      btn_excluir.Enabled:=True;
      btn_consultar.Enabled:=False;
      btn_cancelar.Enabled:=False;

      dtp_data.Date:=Now;

      cb_profissional.Clear;
      cb_profissional.Items.Add('<Selecione o Profissional>');

      with DataModule1.SQLQcolaborador do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from tblcolaborador;');
          Open;

          while Not DataModule1.SQLQcolaborador.Eof do
            begin
              cb_profissional.Items.Add(DataModule1.SQLQcolaboradornome.Value);
              DataModule1.SQLQcolaborador.Next;
            end;

          with DataModule1.SQLQcolaborador do
            begin
              Close;
              cb_profissional.ItemIndex:=0;
              cb_horario.ItemIndex:=0;
            end;

          with DataModule1.SQLQagenda do
            begin
              Active:=False;
              SQL.Clear;
              SQL.Add('select * from tblagenda order by agenda;');
              Open;

              DataModule1.CDSagenda.Refresh;
            end;
        end;
    end
  else
    begin
      btn_novo.Enabled:=False;
      btn_agendar.Enabled:= True;
      btn_limpar.Enabled:=True;
      btn_excluir.Enabled:=False;
      btn_consultar.Enabled:=True;
      btn_cancelar.Enabled:=True;

    end;

  edt_cli.Enabled:=False;
  dtp_data.Enabled:=False;
  cb_horario.Enabled:=False;
  cb_profissional.Enabled:=False;
end;

procedure Tfrm_menu.ConslutadoEstoque1Click(Sender: TObject);
begin
  frm_estoqueconsulta.ShowModal;
end;

procedure Tfrm_menu.ConsultadoCaixa1Click(Sender: TObject);
begin
  frm_caixaconsulta.ShowModal;
end;

procedure Tfrm_menu.cb_profissionalChange(Sender: TObject);
begin
  dtmysql:= datatomysql (DateToStr(dtp_data.Date));
  Datamodule1.SQLQagenda.Active:=False;
  DataModule1.SQLQagenda.SQL.Clear;
  DataModule1.SQLQagenda.SQL.Add('select * from tblagenda where agenda="'+dtmysql+'" and profissional="'+cb_profissional.Text+'" order by horario;');
  DataModule1.SQLQagenda.Open;
  DataModule1.CDSagenda.Refresh;
end;

procedure Tfrm_menu.dtp_dataChange(Sender: TObject);
begin
  dtmysql:= datatomysql (DateToStr(dtp_data.Date));

  Datamodule1.SQLQagenda.Active:=False;
  DataModule1.SQLQagenda.SQL.Clear;
  DataModule1.SQLQagenda.SQL.Add('select * from tblagenda where agenda="'+dtmysql+'";');
  DataModule1.SQLQagenda.Open;
  DataModule1.CDSagenda.Refresh;
end;

procedure Tfrm_menu.btn_excluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir esse registro?', mtWarning, [mbYes, mbNo], 0)=mrYes then
    begin
      MessageDlg('Seu registro foi excluido com sucesso', mtInformation,[mbOK],0);

      Datamodule1.SQLQagenda.Active:=False;
      DataModule1.SQLQagenda.SQL.Clear;
      DataModule1.SQLQagenda.SQL.Add('delete from tblagenda where id = "'+DBGrid1.DataSource.DataSet.fieldbyname('id').AsString +'";');
      DataModule1.SQLQagenda.ExecSQL();
    end;

  Datamodule1.SQLQagenda.Active:=False;
  DataModule1.SQLQagenda.SQL.Clear;
  DataModule1.SQLQagenda.SQL.Add('select * from tblagenda;');
  DataModule1.SQLQagenda.Open;
  DataModule1.CDSagenda.Refresh;
end;

procedure Tfrm_menu.btn_cancelarClick(Sender: TObject);
begin
  cb_profissional.ItemIndex :=0;
  cb_horario.ItemIndex :=0;
  dtp_data.Date:=Now;
  edt_cli.Clear;

  dtp_data.Enabled:=False;
  cb_horario.Enabled:=False;
  cb_profissional.Enabled:=False;

  btn_novo.Enabled:=True;
  btn_agendar.Enabled:= False;
  btn_limpar.Enabled:=False;
  btn_excluir.Enabled:=True;
  btn_consultar.Enabled:=False;
  btn_cancelar.Enabled:=False;

  Datamodule1.SQLQagenda.Active:=False;
  DataModule1.SQLQagenda.SQL.Clear;
  DataModule1.SQLQagenda.SQL.Add('select * from tblagenda order by agenda;');

  DataModule1.SQLQagenda.Open;
  DataModule1.CDSagenda.Refresh;
end;

procedure Tfrm_menu.FrentedeCaixa1Click(Sender: TObject);
begin
  frm_frentecaixa.ShowModal;
end;

end.
