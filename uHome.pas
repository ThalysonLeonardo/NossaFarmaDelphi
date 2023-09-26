unit uHome;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TfHome = class(TForm)
    pnlFundo: TPanel;
    pnlMenuLateral: TPanel;
    btnSair: TSpeedButton;
    btnHome: TSpeedButton;
    btnOperadores: TSpeedButton;
    btnEstoque: TSpeedButton;
    Image1: TImage;
    Label3: TLabel;
    Label4: TLabel;
    pnlSubMenuEstoque: TPanel;
    btnEntradaMercadorias: TSpeedButton;
    btnSaidaMercadorias: TSpeedButton;
    btnConsultaEstoque: TSpeedButton;
    pnlSubMenuOperadores: TPanel;
    btnListaOperadores: TSpeedButton;
    btnCadastrarOperadores: TSpeedButton;
    btnProdutos: TSpeedButton;
    btnListarLocais: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
    procedure btnEstoqueClick(Sender: TObject);
    procedure pnlFundoMouseEnter(Sender: TObject);
    procedure btnOperadoresClick(Sender: TObject);
    procedure btnCadastrarOperadoresClick(Sender: TObject);
    procedure btnListaOperadoresClick(Sender: TObject);
    procedure btnProdutosClick(Sender: TObject);
    procedure btnListarLocaisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fHome: TfHome;

implementation

{$R *.dfm}

uses uLogin, uCadastroOperador, uListarOperadores, uCadastroProdutos,
  uListarProdutos, uListarLocais;

procedure TfHome.btnCadastrarOperadoresClick(Sender: TObject);
begin
  if not Assigned(fCadastroOperador) then
    Application.CreateForm(TfCadastroOperador, fCadastroOperador);

  fCadastroOperador.ShowModal;

end;

procedure TfHome.btnEstoqueClick(Sender: TObject);
begin
  pnlSubMenuEstoque.Visible := not pnlSubMenuEstoque.Visible;
  pnlSubMenuOperadores.Visible := False;
end;

procedure TfHome.btnListaOperadoresClick(Sender: TObject);
begin
  if not Assigned(fListarOperadores) then
    Application.CreateForm(TfListarOperadores, fListarOperadores);

  fListarOperadores.ShowModal;
end;

procedure TfHome.btnListarLocaisClick(Sender: TObject);
begin
  if not Assigned(fLocaisEstoque) then
    Application.CreateForm(TfLocaisEstoque, fLocaisEstoque);

  fLocaisEstoque.ShowModal;
end;

procedure TfHome.btnOperadoresClick(Sender: TObject);
begin
  pnlSubMenuOperadores.Visible := not pnlSubMenuOperadores.Visible;
  pnlSubMenuEstoque.Visible := False;
end;

procedure TfHome.btnProdutosClick(Sender: TObject);
begin
  if not Assigned(fListarProdutos) then
    Application.CreateForm(TfListarProdutos, fListarProdutos);

  fListarProdutos.ShowModal;
end;

procedure TfHome.btnSairClick(Sender: TObject);
begin
  if Assigned(fLogin) then
    fLogin.Show
  else
    Application.CreateForm(TfLogin, fLogin);

  Close;
end;

procedure TfHome.pnlFundoMouseEnter(Sender: TObject);
begin
    pnlSubMenuEstoque.Visible := False;
    pnlSubMenuOperadores.Visible := False;
end;

end.
