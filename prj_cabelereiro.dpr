program prj_cabelereiro;

uses
  Forms,
  u_login in 'u_login.pas' {frm_login},
  u_menu in 'u_menu.pas' {frm_menu},
  u_cadcliente in 'u_cadcliente.pas' {frm_cadcliente},
  u_cadproduto in 'u_cadproduto.pas' {frm_cadproduto},
  u_cadcolaborador in 'u_cadcolaborador.pas' {frm_cadcolaborador},
  u_cadcliconsulta in 'u_cadcliconsulta.pas' {frm_cadcliconsulta},
  u_cadproconsulta in 'u_cadproconsulta.pas' {frm_cadproconsulta},
  u_codcolaconsulta in 'u_codcolaconsulta.pas' {frm_cadcolaconsulta},
  u_cadservico in 'u_cadservico.pas' {frm_cadservico},
  u_cadserconsulta in 'u_cadserconsulta.pas' {frm_cadserconsulta},
  u_datamodule in 'u_datamodule.pas' {DataModule1: TDataModule},
  u_cadfornecedor in 'u_cadfornecedor.pas' {frm_cadfornecedor},
  u_relacliente in 'u_relacliente.pas' {frm_relacliente},
  u_relacolaborador in 'u_relacolaborador.pas' {frm_relacolaborador},
  u_relaproduto in 'u_relaproduto.pas' {frm_relaproduto},
  u_relaservico in 'u_relaservico.pas' {frm_relaservico},
  u_cadfornconsulta in 'u_cadfornconsulta.pas' {frm_cadfornconsulta},
  u_relafornecedor in 'u_relafornecedor.pas' {frm_relafornecedor},
  u_listcliente in 'u_listcliente.pas' {frm_listcliente},
  u_listproduto in 'u_listproduto.pas' {frm_listproduto},
  u_listcolaborador in 'u_listcolaborador.pas' {frm_listcolaborador},
  u_listservico in 'u_listservico.pas' {frm_listservico},
  u_listfornecedor in 'u_listfornecedor.pas' {frm_listfornecedor},
  u_entradaestoque in 'u_entradaestoque.pas' {frm_entradaestoque},
  u_saidadaestoque in 'u_saidadaestoque.pas' {frm_saidaestoque},
  u_menucli in 'u_menucli.pas' {frm_menucli},
  u_caixaentrada in 'u_caixaentrada.pas' {frm_entradacaixa},
  u_caixasaida in 'u_caixasaida.pas' {frm_saidacaixa},
  u_estoqueconsulta in 'u_estoqueconsulta.pas' {frm_estoqueconsulta},
  u_caixaconsulta in 'u_caixaconsulta.pas' {frm_caixaconsulta},
  u_frentecaixa in 'u_frentecaixa.pas' {frm_frentecaixa};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'SISCAB';
  Application.CreateForm(Tfrm_login, frm_login);
  Application.CreateForm(Tfrm_menu, frm_menu);
  Application.CreateForm(Tfrm_cadcliente, frm_cadcliente);
  Application.CreateForm(Tfrm_cadproduto, frm_cadproduto);
  Application.CreateForm(Tfrm_cadcolaborador, frm_cadcolaborador);
  Application.CreateForm(Tfrm_cadcliconsulta, frm_cadcliconsulta);
  Application.CreateForm(Tfrm_cadproconsulta, frm_cadproconsulta);
  Application.CreateForm(Tfrm_cadcolaconsulta, frm_cadcolaconsulta);
  Application.CreateForm(Tfrm_cadservico, frm_cadservico);
  Application.CreateForm(Tfrm_cadserconsulta, frm_cadserconsulta);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(Tfrm_cadfornecedor, frm_cadfornecedor);
  Application.CreateForm(Tfrm_relacliente, frm_relacliente);
  Application.CreateForm(Tfrm_relacolaborador, frm_relacolaborador);
  Application.CreateForm(Tfrm_relaproduto, frm_relaproduto);
  Application.CreateForm(Tfrm_relaservico, frm_relaservico);
  Application.CreateForm(Tfrm_cadfornconsulta, frm_cadfornconsulta);
  Application.CreateForm(Tfrm_relafornecedor, frm_relafornecedor);
  Application.CreateForm(Tfrm_listcliente, frm_listcliente);
  Application.CreateForm(Tfrm_listproduto, frm_listproduto);
  Application.CreateForm(Tfrm_listcolaborador, frm_listcolaborador);
  Application.CreateForm(Tfrm_listservico, frm_listservico);
  Application.CreateForm(Tfrm_listfornecedor, frm_listfornecedor);
  Application.CreateForm(Tfrm_entradaestoque, frm_entradaestoque);
  Application.CreateForm(Tfrm_saidaestoque, frm_saidaestoque);
  Application.CreateForm(Tfrm_menucli, frm_menucli);
  Application.CreateForm(Tfrm_entradacaixa, frm_entradacaixa);
  Application.CreateForm(Tfrm_saidacaixa, frm_saidacaixa);
  Application.CreateForm(Tfrm_estoqueconsulta, frm_estoqueconsulta);
  Application.CreateForm(Tfrm_caixaconsulta, frm_caixaconsulta);
  Application.CreateForm(Tfrm_frentecaixa, frm_frentecaixa);
  Application.Run;
end.
