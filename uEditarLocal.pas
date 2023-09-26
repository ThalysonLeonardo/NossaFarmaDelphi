unit uEditarLocal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfEditarLocal = class(TForm)
    pnlFundo: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    Panel2: TPanel;
    eNome: TEdit;
    eDescricao: TMemo;
    cbStatusEstoque: TComboBox;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    FLocalID: Integer;
    procedure PreencherDadosLocal;
    procedure AtualizarLocal;
  public
    { Public declarations }
    procedure EditarLocal(LocalID: Integer);
  end;

var
  fEditarLocal: TfEditarLocal;

implementation

{$R *.dfm}

uses uDM, uCadastrarLocal, uConexaoDB, uListarLocais;

procedure TfEditarLocal.PreencherDadosLocal;
begin
  if FLocalID > 0 then
  begin
    try

      dm.UniQuery1.Close;
      dm.UniQuery1.SQL.Clear;
      dm.UniQuery1.SQL.Add('SELECT nome, descricao, status FROM locais_estoque WHERE id = :id');
      dm.UniQuery1.ParamByName('id').AsInteger := FLocalID;
      dm.UniQuery1.Open;

      if not dm.UniQuery1.IsEmpty then
      begin
        eNome.Text := dm.UniQuery1.FieldByName('nome').AsString;
        eDescricao.Text := dm.UniQuery1.FieldByName('descricao').AsString;
      end
      else
      begin
        ShowMessage('Local não encontrado');
        Close;
      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro ao carregar dados do local: ' + E.Message);
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

procedure TfEditarLocal.AtualizarLocal;
begin
  try
    dm.UniQuery1.Close;
    dm.UniQuery1.SQL.Clear;
    dm.UniQuery1.SQL.Add('UPDATE locais_estoque SET nome = :nome, descricao = :descricao, status = :status WHERE id = :id');
    dm.UniQuery1.ParamByName('nome').AsString := eNome.Text;
    dm.UniQuery1.ParamByName('descricao').AsString := eDescricao.Text;
    dm.UniQuery1.ParamByName('status').AsBoolean := cbStatusEstoque.ItemIndex = 0;
    dm.UniQuery1.ParamByName('id').AsInteger := FLocalID;
    dm.UniQuery1.ExecSQL;

    ShowMessage('Local Atualizado com sucesso!!');
    Close;
  except
    on E: Exception do
      ShowMessage('Erro ao atualizar dados do local: ' + E.Message);
  end;
end;

procedure TfEditarLocal.btnCancelarClick(Sender: TObject);
begin
  if Assigned(fLocaisEstoque) then
    fLocaisEstoque.Show
  else
    Application.CreateForm(TfLocaisEstoque, fLocaisEstoque);

  Close;
end;

procedure TfEditarLocal.btnSalvarClick(Sender: TObject);
begin
  AtualizarLocal;
end;

procedure TfEditarLocal.EditarLocal(LocalID: Integer);
begin
  FlocalID := LocalID;

  PreencherDadosLocal;
end;

end.
