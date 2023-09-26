unit uListarProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls;

type
  TfListarProdutos = class(TForm)
    pnlFundo: TPanel;
    pnlTopo: TPanel;
    gridProdutos: TDBGrid;
    btnVoltar: TSpeedButton;
    btnExcluirProduto: TSpeedButton;
    btnNovo: TSpeedButton;
    btnEditarProduto: TSpeedButton;
    procedure btnNovoClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirProdutoClick(Sender: TObject);
    procedure btnEditarProdutoClick(Sender: TObject);
  private
    { Private declarations }
    ProdutoID : Integer;
    procedure PreencherGrid;
  public
    { Public declarations }
  end;

var
  fListarProdutos: TfListarProdutos;

implementation

{$R *.dfm}

uses uConexaoDB, uDM, uCadastroProdutos, uEditarProduto;

procedure TfListarProdutos.PreencherGrid;
begin
  dm.UniQuery1.Close;
  dm.UniQuery1.SQL.Clear;
  dm.UniQuery1.SQL.Add('SELECT id, nome, descricao, preco FROM produtos');
  dm.UniQuery1.Open;
end;

procedure TfListarProdutos.btnEditarProdutoClick(Sender: TObject);
begin
  if not dm.UniQuery1.IsEmpty then
  begin
    ProdutoID := dm.UniQuery1.FieldByName('id').AsInteger;

    if not Assigned(fEditarProduto) then
      Application.CreateForm(TfEditarProduto, fEditarProduto);

    fEditarProduto.EditarProduto(ProdutoID);

    fEditarProduto.ShowModal;

    PreencherGrid;
  end
end;

procedure TfListarProdutos.btnExcluirProdutoClick(Sender: TObject);
begin
  if not dm.UniQuery1.IsEmpty then
    begin
      if MessageDlg('Deseja realmente excluir este produto?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        ProdutoID := dm.UniQuery1.FieldByName('id').AsInteger;

        try
          dm.UniQuery1.Close;
          dm.UniQuery1.SQL.Clear;
          dm.UniQuery1.SQL.Add('DELETE FROM produtos WHERE id = :id');
          dm.UniQuery1.ParamByName('id').AsInteger := ProdutoID;
          dm.UniQuery1.ExecSQL;

          PreencherGrid;

          ShowMessage('Produto excluido com sucesso!');
        except
          on E: exception do
            ShowMessage('Erro ao excluir o Produto: ' + E.Message);
        end;
      end;
    end
    else
    begin
      ShowMessage('Selecione um produto para excluir.');
    end;
end;

procedure TfListarProdutos.btnNovoClick(Sender: TObject);
begin
  if not Assigned(fCadastroProdutos) then
    Application.CreateForm(TfCadastroProdutos, fCadastroProdutos);

  fCadastroProdutos.ShowModal;

  PreencherGrid;
end;

procedure TfListarProdutos.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TfListarProdutos.FormShow(Sender: TObject);
begin
   PreencherGrid;
end;

end.
