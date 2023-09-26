unit uSaidaMercadorias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TfSaidaMercadorias = class(TForm)
    pnlFundo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    cbProduto: TComboBox;
    cbLocalEstoque: TComboBox;
    pnlLote: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    eLote: TEdit;
    eQuantidade: TEdit;
    dtFabricacao: TDateTimePicker;
    dtVencimento: TDateTimePicker;
    Panel2: TPanel;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSaidaMercadorias: TfSaidaMercadorias;

implementation

{$R *.dfm}

uses uConexaoDB, uDM;

procedure TfSaidaMercadorias.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfSaidaMercadorias.btnSalvarClick(Sender: TObject);
var
  IDProduto, IDLocalEstoque, Quantidade: Integer;
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


    if not TryStrToInt(eQuantidade.Text, Quantidade) then
    begin
      ShowMessage('Quantidade inválida.');
      Exit;
    end;

    dm.UniQuery1.Close;
    dm.UniQuery1.SQL.Clear;
    dm.UniQuery1.SQL.Add('INSERT INTO movimentacoes_estoque (id_produto, id_local_estoque, tipo_movimentacao, quantidade, data_hora, numero_lote, data_fabricacao, data_vencimento) ' + 'VALUES (:id_produto, :id_local_estoque, :tipo_movimentacao, :quantidade, :data_hora, :numero_lote, :data_fabricacao, :data_vencimento)');
    dm.UniQuery1.ParamByName('id_produto').AsInteger := IDProduto;
    dm.UniQuery1.ParamByName('id_local_estoque').AsInteger := IDLocalEstoque;
    dm.UniQuery1.ParamByName('tipo_movimentacao').AsString := 'S';
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

end.
