unit uCadastroProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TfCadastroProdutos = class(TForm)
    pnlFundo: TPanel;
    pnlTopo: TPanel;
    Label1: TLabel;
    eNome: TEdit;
    Label2: TLabel;
    eDescrição: TMemo;
    Label3: TLabel;
    cbEstoqueNegativo: TComboBox;
    Label4: TLabel;
    cbEntrada: TComboBox;
    Label5: TLabel;
    cbSaida: TComboBox;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    Label6: TLabel;
    ePreco: TEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    function ValidarCamposObrigatorios: Boolean;
  public
    { Public declarations }
  end;

var
  fCadastroProdutos: TfCadastroProdutos;

implementation

{$R *.dfm}

uses uDM, uConexaoDB, uHome;

function TfCadastroProdutos.ValidarCamposObrigatorios: Boolean;
begin
  Result := (eNome.Text <> '') and (eDescrição.Text <> '') and (cbEstoqueNegativo.ItemIndex >= 0) and
            (cbEntrada.ItemIndex >= 0) and (cbSaida.ItemIndex >= 0);
end;

procedure TfCadastroProdutos.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfCadastroProdutos.btnSalvarClick(Sender: TObject);
begin
  try
  if not ValidarCamposObrigatorios then
    begin
      ShowMessage('Todos os campos são obrigatórios!');
      Exit;
    end;

    dm.UniQuery1.Close;
    dm.UniQuery1.SQL.Clear;
    dm.UniQuery1.SQL.Add('INSERT INTO produtos (nome, descricao, estoque_negativo, status_entrada, status_saida, preco) VALUES (:nome, :descricao, :estoque_negativo, :status_entrada, :status_saida, :preco)');
    dm.UniQuery1.ParamByName('nome').AsString := eNome.Text;
    dm.UniQuery1.ParamByName('descricao').AsString := eDescrição.Text;
    dm.UniQuery1.ParamByName('estoque_negativo').AsBoolean := cbEstoqueNegativo.ItemIndex = 0;
    dm.UniQuery1.ParamByName('status_entrada').AsBoolean := cbEntrada.ItemIndex = 0;
    dm.UniQuery1.ParamByName('status_saida').AsBoolean := cbSaida.ItemIndex = 0;
    dm.UniQuery1.ParamByName('preco').AsFloat := StrToFloat(ePreco.Text);

    dm.UniQuery1.ExecSQL;

    ShowMessage('Cadastro efetuado com sucesso!!');
    close;
  except
    on E: exception do
    begin
      ShowMessage('Erro ao cadastrar produto: ' + E.Message);
    end;
  end;
end;

end.
