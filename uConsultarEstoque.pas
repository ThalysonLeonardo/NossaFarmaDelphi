unit uConsultarEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids;

type
  TfConsultarEstoque = class(TForm)
    pnlFundo: TPanel;
    pnlTopp: TPanel;
    Label1: TLabel;
    cbProduto: TComboBox;
    Label2: TLabel;
    cbLocalEstoque: TComboBox;
    chkEstoqueZerado: TCheckBox;
    Label3: TLabel;
    eEstoqueMaior: TEdit;
    Label4: TLabel;
    eEstoqueMenor: TEdit;
    btnConsultar: TSpeedButton;
    stEstoque: TStringGrid;
    btnVoltar: TSpeedButton;
    procedure btnConsultarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    SQLQuery: String;
    procedure AplicarFiltros;
  public
    { Public declarations }
  end;

var
  fConsultarEstoque: TfConsultarEstoque;

implementation

{$R *.dfm}

uses uConexaoDB, uDM;

procedure TfConsultarEstoque.AplicarFiltros;
begin
  SQLQuery := 'SELCT * FROM movimentacoes_estoque WHERE 1=1 ';

  if cbProduto.Text <> '' then
    SQLQuery := SQLQuery + 'AND id_produto = ' + QuotedStr(cbProduto.Text);

  if cbLocalEstoque.Text <> '' then
    SQLQuery := SQLQuery + 'AND id_local_estoque = ' + QuotedStr(cbLocalEstoque.Text);

  if not chkEstoqueZerado.Checked then
    SQLQuery := SQLQuery + 'AND quantidade > 0';

  if eEstoqueMaior.Text <> '' then
    SQLQuery := SQLQuery + 'AND quantidade > ' + eEstoqueMaior.Text;

  if eEstoqueMenor.Text <> '' then
    SQLQuery := SQLQuery + 'AND quantidade < ' + eEstoqueMenor.Text;
end;

procedure TfConsultarEstoque.btnConsultarClick(Sender: TObject);
var
  Row: Integer;
begin
  AplicarFiltros;

  SQLQuery := 'SELECT * FROM movimentacoes_estoque WHERE 1=1 ';

  try
    dm.UniQuery1.Close;
    dm.UniQuery1.SQL.Clear;
    dm.UniQuery1.SQL.Add(SQLQuery);
    dm.UniQuery1.Open;

    stEstoque.RowCount := 1;

    Row := 1;
    while not dm.UniQuery1.Eof do
    begin
      stEstoque.RowCount := stEstoque.RowCount + 1;
      stEstoque.Cells[0, Row] := dm.UniQuery1.FieldByName('id_produto').AsString;
      stEstoque.Cells[1, Row] := dm.UniQuery1.FieldByName('id_local_estoque').AsString;
      stEstoque.Cells[2, Row] := dm.UniQuery1.FieldByName('quantidade').AsString;
      stEstoque.Cells[3, Row] := dm.UniQuery1.FieldByName('numero_lote').AsString;
      stEstoque.Cells[4, Row] := dm.UniQuery1.FieldByName('data_vencimento').AsString;
      stEstoque.Cells[5, Row] := dm.UniQuery1.FieldByName('data_fabricacao').AsString;
      dm.UniQuery1.Next;
      Inc(Row);
    end;
  finally
    dm.UniQuery1.Close;
  end;

end;

procedure TfConsultarEstoque.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TfConsultarEstoque.FormShow(Sender: TObject);
begin
   stEstoque.ColCount := 6;

  cbProduto.Items.Clear;
  try
    dm.UniQuery1.Close;
    dm.UniQuery1.SQL.Clear;
    dm.UniQuery1.SQL.Add('SELECT id FROM produtos');
    dm.UniQuery1.Open;

    while not dm.UniQuery1.Eof do
    begin
      cbProduto.Items.Add(dm.UniQuery1.FieldByName('id').AsString);
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
    dm.UniQuery1.SQL.Add('SELECT id FROM locais_estoque');
    dm.UniQuery1.Open;

    while not dm.UniQuery1.Eof do
    begin
      cbLocalEstoque.Items.Add(dm.UniQuery1.FieldByName('id').AsString);
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


