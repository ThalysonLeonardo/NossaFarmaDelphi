unit uRetirada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls;

type
  TfRetirada = class(TForm)
    pnlFundo: TPanel;
    Label3: TLabel;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    Panel2: TPanel;
    eQuantidadeRetirada: TEdit;
    Label1: TLabel;
    eNumLote: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    dtVencimento: TDateTimePicker;
    dtFabricacao: TDateTimePicker;
    Label5: TLabel;
    eQuantidadeAtual: TEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    FNumLote: Integer;
    procedure PreencherDadosLote;
    procedure AtualizarLote;
  public
    { Public declarations }
    procedure RetiradaCalculo(NumLote: Integer);
  end;

var
  fRetirada: TfRetirada;

implementation

{$R *.dfm}

uses uDM, uConexaoDB;

procedure TfRetirada.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfRetirada.btnSalvarClick(Sender: TObject);
begin
  AtualizarLote;
end;

procedure TfRetirada.PreencherDadosLote;
begin
  if FNumLote > 0 then
  begin
    try

      dm.UniQuery1.Close;
      dm.UniQuery1.SQL.Clear;
      dm.UniQuery1.SQL.Add('SELECT numero_lote, data_vencimento, data_fabricacao, quantidade FROM movimentacoes_estoque WHERE numero_lote = :numero_lote');
      dm.UniQuery1.ParamByName('numero_lote').AsInteger := FNumLote;
      dm.UniQuery1.Open;

      if not dm.UniQuery1.IsEmpty then
      begin
        eNumLote.Text := dm.UniQuery1.FieldByName('numero_lote').AsString;
        dtVencimento.DateTime := dm.UniQuery1.FieldByName('data_vencimento').AsDateTime;
        dtFabricacao.DateTime := dm.UniQuery1.FieldByName('data_fabricacao').AsDateTime;
        eQuantidadeAtual.Text := dm.UniQuery1.FieldByName('quantidade').AsString;
      end
      else
      begin
        ShowMessage('Lote não encontrado');
        Close;
      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro ao carregar dados do lote: ' + E.Message);
        Close;
      end;
    end;
  end
  else
  begin
    ShowMessage('Número do lote inválido');
    Close;
  end;
end;

procedure TfRetirada.AtualizarLote;
var
  QuantidadeAtual, QuantidadeRetirada: Integer;
begin
  QuantidadeAtual := dm.UniQuery1.FieldByName('quantidade').AsInteger;
  QuantidadeRetirada := StrToInt(eQuantidadeRetirada.Text);
  QuantidadeAtual := QuantidadeAtual - QuantidadeRetirada;
  try
    dm.UniQuery1.Close;
    dm.UniQuery1.SQL.Clear;
    dm.UniQuery1.SQL.Add('UPDATE movimentacoes_estoque SET quantidade = :quantidade WHERE numero_lote = :numero_lote');
    dm.UniQuery1.ParamByName('quantidade').AsInteger := QuantidadeAtual;
    dm.UniQuery1.ParamByName('numero_lote').AsInteger := FNumLote;
    dm.UniQuery1.ExecSQL;

    ShowMessage('Lote Atualizado com sucesso!!');
    Close;
  except
    on E: Exception do
      ShowMessage('Erro ao atualizar dados do lote: ' + E.Message);
  end;
end;

procedure TfRetirada.RetiradaCalculo(NumLote: Integer);
begin
  FNumLote := NumLote;

  PreencherDadosLote;
end;
end.
