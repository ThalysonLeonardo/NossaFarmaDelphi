unit uEditarOperador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TfEditarOperador = class(TForm)
    pnlFundo: TPanel;
    Panel1: TPanel;
    Label2: TLabel;
    eNome: TEdit;
    eSobrenome: TEdit;
    eLogin: TEdit;
    ePassword: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    FOperadorCod: Integer;
    procedure PreencherDadosOperador;
    procedure AtualizarOperador;
  public
    { Public declarations }
    procedure EditarOperador(OperadorCod: Integer);
  end;

var
  fEditarOperador: TfEditarOperador;

implementation

{$R *.dfm}

uses uDM, uConexaoDB, uListarOperadores, uCadastroOperador;

procedure TfEditarOperador.PreencherDadosOperador;
begin
  if FOperadorCod > 0 then
  begin
    try

      dm.UniQuery1.Close;
      dm.UniQuery1.SQL.Clear;
      dm.UniQuery1.SQL.Add('SELECT nome, sobrenome, login, senha_hash FROM operadores WHERE codigo = :codigo');
      dm.UniQuery1.ParamByName('codigo').AsInteger := FOperadorCod;
      dm.UniQuery1.Open;

      if not dm.UniQuery1.IsEmpty then
      begin
        eNome.Text := dm.UniQuery1.FieldByName('nome').AsString;
        eSobrenome.Text := dm.UniQuery1.FieldByName('sobrenome').AsString;
        eLogin.Text := dm.UniQuery1.FieldByName('login').AsString;
        ePassword.Text := '********';
      end
      else
      begin
        ShowMessage('Operador não encontrado');
        Close;
      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro ao carregar dados do operador: ' + E.Message);
        Close;
      end;

    end;
  end
  else
  begin
    ShowMessage('ID de operador inválido.');
    Close;
  end;
end;

procedure TfEditarOperador.AtualizarOperador;
var
  CriptoPassword: string;
begin
  try

    CriptoPassword := fCadastroOperador.CriptografarSenha(ePassword.Text);

    dm.UniQuery1.Close;
    dm.UniQuery1.SQL.Clear;
    dm.UniQuery1.SQL.Add('UPDATE operadores SET nome = :nome, sobrenome = :sobrenome, login = :login, senha_hash = :senha WHERE codigo = :codigo');
    dm.UniQuery1.ParamByName('nome').AsString := eNome.Text;
    dm.UniQuery1.ParamByName('sobrenome').AsString := eSobrenome.Text;
    dm.UniQuery1.ParamByName('login').AsString := eLogin.Text;
    dm.UniQuery1.ParamByName('senha').AsString := CriptoPassword;
    dm.UniQuery1.ParamByName('codigo').AsInteger := FOperadorCod;
    dm.UniQuery1.ExecSQL;

    ShowMessage('Operador Atualizado com sucesso!!');
    Close;
  except
    on E: Exception do
      ShowMessage('Erro ao atualizar dados do operador: ' + E.Message);
  end;
end;

procedure TfEditarOperador.btnCancelarClick(Sender: TObject);
begin
  if Assigned(fListarOperadores) then
    fListarOperadores.Show
  else
    Application.CreateForm(TfListarOperadores, fListarOperadores);

  Close;
end;

procedure TfEditarOperador.btnSalvarClick(Sender: TObject);
begin
  AtualizarOperador;
end;

procedure TfEditarOperador.EditarOperador(OperadorCod: Integer);
begin
  FOperadorCod := OperadorCod;

  PreencherDadosOperador;
end;

end.
