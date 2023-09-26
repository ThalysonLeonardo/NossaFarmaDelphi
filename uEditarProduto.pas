unit uEditarProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Data.DB;

type
  TfEditarProduto = class(TForm)
    pnlFundo: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    eNome: TEdit;
    Label1: TLabel;
    eDescricao: TMemo;
    Label2: TLabel;
    ePreco: TEdit;
    Label4: TLabel;
    cbEstoqueNegativo: TComboBox;
    Label5: TLabel;
    cbEntrada: TComboBox;
    Label6: TLabel;
    cbSaida: TComboBox;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    FProdutoID: Integer;
    procedure PreencherDadosProduto;
    procedure AtualizarProduto;
  public
    { Public declarations }
    procedure EditarProduto(ProdutoID: Integer);
  end;

var
  fEditarProduto: TfEditarProduto;

implementation

{$R *.dfm}

uses uDM, uConexaoDB, uListarProdutos, uCadastroProdutos;

procedure TfEditarProduto.PreencherDadosProduto;
begin
  if FProdutoID > 0 then
  begin
    try

      dm.UniQuery1.Close;
      dm.UniQuery1.SQL.Clear;
      dm.UniQuery1.SQL.Add('SELECT nome, descricao, preco, status_entrada, status_saida, estoque_negativo FROM produtos WHERE id = :id');
      dm.UniQuery1.ParamByName('id').AsInteger := FProdutoID;
      dm.UniQuery1.Open;

      if not dm.UniQuery1.IsEmpty then
      begin
        eNome.Text := dm.UniQuery1.FieldByName('nome').AsString;
        eDescricao.Text := dm.UniQuery1.FieldByName('descricao').AsString;
        ePreco.Text := dm.UniQuery1.FieldByName('preco').AsString;
      end
      else
      begin
        ShowMessage('Produto não encontrado');
        Close;
      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro ao carregar dados do produto: ' + E.Message);
        Close;
      end;

    end;
  end
  else
  begin
    ShowMessage('ID do produto inválido.');
    Close;
  end;
end;

procedure TfEditarProduto.AtualizarProduto;
begin
  try
    dm.UniQuery1.Close;
    dm.UniQuery1.SQL.Clear;
    dm.UniQuery1.SQL.Add('UPDATE produtos SET nome = :nome, descricao = :descricao, preco = :preco, status_entrada = :status_entrada, status_saida = :status_saida, estoque_negativo = :estoque_negativo WHERE id = :id');
    dm.UniQuery1.ParamByName('nome').AsString := eNome.Text;
    dm.UniQuery1.ParamByName('descricao').AsString := eDescricao.Text;
    dm.UniQuery1.ParamByName('preco').AsFloat := StrToFloat(ePreco.Text);
    dm.UniQuery1.ParamByName('status_entrada').AsBoolean := cbEntrada.ItemIndex = 0;
    dm.UniQuery1.ParamByName('status_saida').AsBoolean := cbSaida.ItemIndex = 0;
    dm.UniQuery1.ParamByName('estoque_negativo').AsBoolean := cbEstoqueNegativo.ItemIndex = 0;
    dm.UniQuery1.ParamByName('id').AsInteger := FProdutoID;
    dm.UniQuery1.ExecSQL;

    ShowMessage('Produto Atualizado com sucesso!!');
    Close;
  except
    on E: Exception do
      ShowMessage('Erro ao atualizar dados do produto: ' + E.Message);
  end;
end;

procedure TfEditarProduto.btnCancelarClick(Sender: TObject);
begin
if Assigned(fListarProdutos) then
    fListarProdutos.Show
  else
    Application.CreateForm(TfListarProdutos, fListarProdutos);

  Close;
end;

procedure TfEditarProduto.btnSalvarClick(Sender: TObject);
begin
  AtualizarProduto;
end;

procedure TfEditarProduto.EditarProduto(ProdutoID: Integer);
begin
  FProdutoID := ProdutoID;

  PreencherDadosProduto;
end;

end.
