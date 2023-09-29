unit uSaidaMercadorias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfSaidaMercadorias = class(TForm)
    pnlFundo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btnRetirada: TSpeedButton;
    btnVoltar: TSpeedButton;
    cbProduto: TComboBox;
    cbLocalEstoque: TComboBox;
    Panel2: TPanel;
    gridLotes: TDBGrid;
    btnConsultar: TSpeedButton;
    procedure btnVoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnRetiradaClick(Sender: TObject);
  private
    { Private declarations }
    IDProduto, IDLocalEstoque, NumLote: Integer;
    function PermiteSaidaProduto(const ProdutoNome: string): Boolean;
    function LocalEstoqueAtivo(const LocalEstoqueNome: string): Boolean;
    procedure PreencherGrid(IDProduto, IDLocalEstoque: Integer);
  public
    { Public declarations }
  end;

var
  fSaidaMercadorias: TfSaidaMercadorias;

implementation

{$R *.dfm}

uses uConexaoDB, uDM, uRetirada;

function TfSaidaMercadorias.PermiteSaidaProduto(const ProdutoNome: string): Boolean;
begin
  try
    dm.UniQuery1.Close;
    dm.UniQuery1.SQL.Clear;
    dm.UniQuery1.SQL.Add('SELECT status_saida FROM produtos WHERE nome = :nome');
    dm.UniQuery1.ParamByName('nome').AsString := ProdutoNome;
    dm.UniQuery1.Open;

    if not dm.UniQuery1.IsEmpty then
    begin
      Result := dm.UniQuery1.FieldByName('status_saida').AsBoolean;
    end
    else
    begin
      Result := False;
    end;
  except
    Result := False;
  end;
end;

function TfSaidaMercadorias.LocalEstoqueAtivo(const LocalEstoqueNome: string): Boolean;
begin
  try
    dm.UniQuery1.Close;
    dm.UniQuery1.SQL.Clear;
    dm.UniQuery1.SQL.Add('SELECT status FROM locais_estoque WHERE nome = :nome');
    dm.UniQuery1.ParamByName('nome').AsString := LocalEstoqueNome;
    dm.UniQuery1.Open;

    if not dm.UniQuery1.IsEmpty then
    begin
      Result := dm.UniQuery1.FieldByName('status').AsBoolean;
    end
    else
    begin
      Result := False;
    end;
  except
    Result := False;
  end;
end;

procedure TfSaidaMercadorias.PreencherGrid(IDProduto, IDLocalEstoque: Integer);
begin
  dm.UniQuery1.Close;
  dm.UniQuery1.SQL.Clear;
  dm.UniQuery1.SQL.Add('SELECT numero_lote, data_fabricacao, data_vencimento, quantidade FROM movimentacoes_estoque WHERE id_produto = :id_produto AND id_local_estoque = :id_local_estoque ORDER BY data_vencimento');
  dm.UniQuery1.ParamByName('id_produto').AsInteger := IDProduto;
  dm.UniQuery1.ParamByName('id_local_estoque').AsInteger := IDLocalEstoque;
  dm.UniQuery1.Open;
end;

procedure TfSaidaMercadorias.btnConsultarClick(Sender: TObject);
begin
  try
    dm.UniQuery1.Close;
    dm.UniQuery1.SQL.Clear;
    dm.UniQuery1.SQL.Add('SELECT id FROM produtos WHERE nome = :nome');
    dm.UniQuery1.ParamByName('nome').AsString := cbProduto.Text;
    dm.UniQuery1.Open;

    if not dm.UniQuery1.IsEmpty then
      IDProduto := dm.UniQuery1.FieldByName('id').AsInteger
    else
    begin
      ShowMessage('Produto não encontrado.');
      Exit;
    end;

    dm.UniQuery1.Close;
    dm.UniQuery1.SQL.Clear;
    dm.UniQuery1.SQL.Add('SELECT id FROM locais_estoque WHERE nome = :nome');
    dm.UniQuery1.ParamByName('nome').AsString := cbLocalEstoque.Text;
    dm.UniQuery1.Open;

    if not dm.UniQuery1.IsEmpty then
      IDLocalEstoque := dm.UniQuery1.FieldByName('id').AsInteger
    else
    begin
      ShowMessage('Local de estoque não encontrado.');
      Exit;
    end;

    PreencherGrid(IDProduto, IDLocalEstoque);
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao carregar dados: ' + E.Message);
    end;
  end;
end;

procedure TfSaidaMercadorias.FormShow(Sender: TObject);
begin
  cbProduto.Items.Clear;
  try
    dm.UniQuery1.Close;
    dm.UniQuery1.SQL.Clear;
    dm.UniQuery1.SQL.Add('SELECT nome FROM produtos');
    dm.UniQuery1.Open;

    while not dm.UniQuery1.Eof do
    begin
      cbProduto.Items.Add(dm.UniQuery1.FieldByName('nome').AsString);
      dm.UniQuery1.Next;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao carregar produtos: ' + E.Message);
    end;
  end;

  cbLocalEstoque.Items.Clear;
  try
    dm.UniQuery1.Close;
    dm.UniQuery1.SQL.Clear;
    dm.UniQuery1.SQL.Add('SELECT nome FROM locais_estoque');
    dm.UniQuery1.Open;

    while not dm.UniQuery1.Eof do
    begin
      cbLocalEstoque.Items.Add(dm.UniQuery1.FieldByName('nome').AsString);
      dm.UniQuery1.Next;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao carregar locais de estoque: ' + E.Message);
    end;
  end;
end;

procedure TfSaidaMercadorias.btnRetiradaClick(Sender: TObject);
var
  ProdutoNome, LocalEstoqueNome: String;
begin
  ProdutoNome:= cbProduto.Text;
  LocalEstoqueNome := cbLocalEstoque.Text;

  if not PermiteSaidaProduto(ProdutoNome) then
  begin
    ShowMessage('Este produto ' + ProdutoNome + ' não permite saida');
    Exit;
  end;

  if not LocalEstoqueAtivo(LocalEstoqueNome) then
  begin
      ShowMessage('Este local ' + LocalEstoqueNome + ' está inativo');
      Exit;
  end;

  if not dm.UniQuery1.IsEmpty then
  begin
    NumLote := dm.UniQuery1.FieldByName('numero_lote').AsInteger;

    if not Assigned(fRetirada) then
      Application.CreateForm(TfRetirada, fRetirada);

    fRetirada.RetiradaCalculo(NumLote);

    fRetirada.ShowModal;
  end
end;

procedure TfSaidaMercadorias.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

end.
