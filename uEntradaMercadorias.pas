unit uEntradaMercadorias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TfEntradaMercadorias = class(TForm)
    pnlFundo: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    cbProduto: TComboBox;
    Label2: TLabel;
    cbLocalEstoque: TComboBox;
    Label3: TLabel;
    eQuantidade: TEdit;
    pnlLote: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    eLote: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    dtFabricacao: TDateTimePicker;
    dtVencimento: TDateTimePicker;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    function PermiteEntradaProduto(const ProdutoNome: string): Boolean;
    function LocalEstoqueAtivo(const LocalEstoqueNome: string): Boolean;
    function VerificarLote(const LoteNum: string): Boolean;
  public
    { Public declarations }
  end;

var
  fEntradaMercadorias: TfEntradaMercadorias;

implementation

{$R *.dfm}

uses uConexaoDB, uDM;

function TfEntradaMercadorias.PermiteEntradaProduto(const ProdutoNome: string): Boolean;
begin
  try
    dm.UniQuery1.Close;
    dm.UniQuery1.SQL.Clear;
    dm.UniQuery1.SQL.Add('SELECT status_entrada FROM produtos WHERE nome = :nome');
    dm.UniQuery1.ParamByName('nome').AsString := ProdutoNome;
    dm.UniQuery1.Open;

    if not dm.UniQuery1.IsEmpty then
    begin
      Result := dm.UniQuery1.FieldByName('status_entrada').AsBoolean;
    end
    else
    begin
      Result := False;
    end;
  except
    Result := False;
  end;
end;

function TfEntradaMercadorias.LocalEstoqueAtivo(const LocalEstoqueNome: string): Boolean;
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

function TfEntradaMercadorias.VerificarLote(const LoteNum: string): Boolean;
begin
  try
    dm.UniQuery1.Close;
    dm.UniQuery1.SQL.Clear;
    dm.UniQuery1.SQL.Add('SELECT numero_lote, data_fabricacao, data_vencimento FROM movimentacoes_estoque WHERE numero_lote = :numero_lote');
    dm.UniQuery1.ParamByName('numero_lote').AsString := LoteNum;
    dm.UniQuery1.Open;

    if not dm.UniQuery1.IsEmpty then
    begin
      ShowMessage('Lote j� cadastrado:' +
        #13#10'N�mero do Lote: ' + dm.UniQuery1.FieldByName('numero_lote').AsString +
        #13#10'Data de Fabrica��o: ' + dm.UniQuery1.FieldByName('data_fabricacao').AsString +
        #13#10'Data de Vencimento: ' + dm.UniQuery1.FieldByName('data_vencimento').AsString);
      Result := True;
    end
    else
    begin
      Result := False;
    end;
  except
    ShowMessage('Erro ao verificar o lote.');
    Result := True;
  end;
end;

procedure TfEntradaMercadorias.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfEntradaMercadorias.btnSalvarClick(Sender: TObject);
var
  IDProduto, IDLocalEstoque, Quantidade: Integer;
  ProdutoNome, LocalEstoqueNome, LoteNum: string;
begin
  ProdutoNome:= cbProduto.Text;
  LocalEstoqueNome := cbLocalEstoque.Text;
  LoteNum := eLote.Text;

  if not PermiteEntradaProduto(ProdutoNome) then
  begin
    ShowMessage('Este produto ' + ProdutoNome + ' n�o permite entrada');
    Exit;
  end;

  if not LocalEstoqueAtivo(LocalEstoqueNome) then
  begin
      ShowMessage('Este local ' + LocalEstoqueNome + ' est� inativo');
      Exit;
  end;

  if VerificarLote(LoteNum) then
  begin
    Exit;
  end;

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
      ShowMessage('Produto n�o encontrado.');
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
      ShowMessage('Local de estoque n�o encontrado.');
      Exit;
    end;


    if not TryStrToInt(eQuantidade.Text, Quantidade) then
    begin
      ShowMessage('Quantidade inv�lida.');
      Exit;
    end;

    dm.UniQuery1.Close;
    dm.UniQuery1.SQL.Clear;
    dm.UniQuery1.SQL.Add('INSERT INTO movimentacoes_estoque (id_produto, id_local_estoque, quantidade, data_hora, numero_lote, data_fabricacao, data_vencimento) ' + 'VALUES (:id_produto, :id_local_estoque, :quantidade, :data_hora, :numero_lote, :data_fabricacao, :data_vencimento)');
    dm.UniQuery1.ParamByName('id_produto').AsInteger := IDProduto;
    dm.UniQuery1.ParamByName('id_local_estoque').AsInteger := IDLocalEstoque;
    dm.UniQuery1.ParamByName('quantidade').AsInteger := Quantidade;
    dm.UniQuery1.ParamByName('data_hora').AsDateTime := Now;
    dm.UniQuery1.ParamByName('numero_lote').AsString := eLote.Text;
    dm.UniQuery1.ParamByName('data_fabricacao').AsDate := dtFabricacao.Date;
    dm.UniQuery1.ParamByName('data_vencimento').AsDate := dtVencimento.Date;
    dm.UniQuery1.ExecSQL;

    ShowMessage('Entrada de mercadorias registrada com sucesso!');
    Close;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao registrar entrada de mercadorias: ' + E.Message);
    end;
  end;
end;

procedure TfEntradaMercadorias.FormShow(Sender: TObject);
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

end.
