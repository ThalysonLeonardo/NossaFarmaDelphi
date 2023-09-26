unit uCadastrarLocal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfCadastrarLocal = class(TForm)
    pnlFundo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    pnlTopo: TPanel;
    eNome: TEdit;
    eDescrição: TMemo;
    cbStatusEstoque: TComboBox;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    function ValidarCamposObrigatorios: Boolean;
  public
    { Public declarations }
  end;

var
  fCadastrarLocal: TfCadastrarLocal;

implementation

{$R *.dfm}

uses uDM, uConexaoDB, uListarLocais;

procedure TfCadastrarLocal.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfCadastrarLocal.btnSalvarClick(Sender: TObject);
begin
  try
  if not ValidarCamposObrigatorios then
    begin
      ShowMessage('Todos os campos são obrigatórios!');
      Exit;
    end;

    dm.UniQuery1.Close;
    dm.UniQuery1.SQL.Clear;
    dm.UniQuery1.SQL.Add('INSERT INTO locais_estoque (nome, descricao, status) VALUES (:nome, :descricao, :status)');
    dm.UniQuery1.ParamByName('nome').AsString := eNome.Text;
    dm.UniQuery1.ParamByName('descricao').AsString := eDescrição.Text;
    dm.UniQuery1.ParamByName('status').AsBoolean := cbStatusEstoque.ItemIndex = 0;
    dm.UniQuery1.ExecSQL;

    ShowMessage('Cadastro efetuado com sucesso!!');
    close;
  except
    on E: exception do
    begin
      ShowMessage('Erro ao cadastrar local: ' + E.Message);
    end;
  end;
end;

function TfCadastrarLocal.ValidarCamposObrigatorios: Boolean;
begin
  Result := (eNome.Text <> '') and (eDescrição.Text <> '') and (cbStatusEstoque.ItemIndex >= 0);
end;



end.
