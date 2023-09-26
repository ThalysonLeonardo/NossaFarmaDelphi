program Project1;

uses
  Vcl.Forms,
  uLogin in 'uLogin.pas' {fLogin},
  uHome in 'uHome.pas' {fHome},
  uDM in 'uDM.pas' {DM: TDataModule},
  uConexaoDB in 'uConexaoDB.pas' {fConexaoDB},
  uCadastroOperador in 'uCadastroOperador.pas' {fCadastroOperador},
  uListarOperadores in 'uListarOperadores.pas' {fListarOperadores},
  uEditarOperador in 'uEditarOperador.pas' {fEditarOperador},
  uCadastroProdutos in 'uCadastroProdutos.pas' {fCadastroProdutos},
  uListarProdutos in 'uListarProdutos.pas' {fListarProdutos},
  uEditarProduto in 'uEditarProduto.pas' {fEditarProduto},
  uListarLocais in 'uListarLocais.pas' {fLocaisEstoque},
  uCadastrarLocal in 'uCadastrarLocal.pas' {fCadastrarLocal},
  uEditarLocal in 'uEditarLocal.pas' {fEditarLocal},
  uEntradaMercadorias in 'uEntradaMercadorias.pas' {fEntradaMercadorias},
  uSaidaMercadorias in 'uSaidaMercadorias.pas' {fSaidaMercadorias};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfLogin, fLogin);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfCadastroOperador, fCadastroOperador);
  Application.CreateForm(TfListarOperadores, fListarOperadores);
  Application.CreateForm(TfEditarOperador, fEditarOperador);
  Application.CreateForm(TfCadastroProdutos, fCadastroProdutos);
  Application.CreateForm(TfListarProdutos, fListarProdutos);
  Application.CreateForm(TfEditarProduto, fEditarProduto);
  Application.CreateForm(TfLocaisEstoque, fLocaisEstoque);
  Application.CreateForm(TfCadastrarLocal, fCadastrarLocal);
  Application.CreateForm(TfEditarLocal, fEditarLocal);
  Application.CreateForm(TfEntradaMercadorias, fEntradaMercadorias);
  Application.CreateForm(TfSaidaMercadorias, fSaidaMercadorias);
  Application.Run;
end.
