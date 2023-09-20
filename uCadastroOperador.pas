unit uCadastroOperador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,  IdHashMessageDigest;

type
  TfCadastroOperador = class(TForm)
    pnlCadastroOperador: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    eNome: TEdit;
    Label4: TLabel;
    eLogin: TEdit;
    Label5: TLabel;
    ePassword: TEdit;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    Label6: TLabel;
    eSobrenome: TEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    function CriptografarSenha(const senha: string): string;
    function VerificarLoginExistente(login: string): Boolean;
    function ValidarCamposObrigatorios: Boolean;
    function ValidarSenha: Boolean;
  public
    { Public declarations }
  end;

var
  fCadastroOperador: TfCadastroOperador;

implementation

{$R *.dfm}

uses uHome, uDM;

const
  Semente = 'R6#GIRO2022@';

function TfCadastroOperador.CriptografarSenha(const senha: string): string;
var
  Hasher : TIdHashMessageDigest5;
begin
  Hasher := TIdHashMessageDigest5.Create;

  try
    Result := Semente + Hasher.HashStringAsHex(senha) + Semente;
  finally
    Hasher.Free;
  end;
end;

function TfCadastroOperador.VerificarLoginExistente(login: string): Boolean;
begin
  try
    dm.UniQuery1.Close;
    dm.UniQuery1.SQL.Clear;
    dm.UniQuery1.SQL.Add('SELECT COUNT(*) FROM operadores WHERE login = :login');
    dm.UniQuery1.ParamByName('login').AsString := login;
    dm.UniQuery1.Open;

    Result := (dm.UniQuery1.Fields[0].AsInteger > 0);
  except
    on E: Exception do
    begin
      Result := False;
      ShowMessage('Erro ao verificar login: ' + E.Message);
    end;
  end;
end;

function TfCadastroOperador.ValidarCamposObrigatorios: Boolean;
begin
   Result := (eNome.Text <> '') and (eSobrenome.Text <> '') and (eLogin.Text <> '') and (ePassword.Text <> '');
end;

function TfCadastroOperador.ValidarSenha: Boolean;
begin
  Result := (Length(ePassword.Text) >= 8) and (pos(' ', eLogin.Text) = 0) and (Pos(' ', ePassword.Text) = 0);
end;

procedure TfCadastroOperador.btnCancelarClick(Sender: TObject);
begin
  if Assigned(fHome) then
    fHome.Show
  else
    Application.CreateForm(TfHome, fHome);

  Close;
end;

procedure TfCadastroOperador.btnSalvarClick(Sender: TObject);
var
  CriptoPassword: string;
begin
  try
    if not ValidarCamposObrigatorios then
    begin
      ShowMessage('Todos os campos são obrigatórios!');
      Exit;
    end;

    if not ValidarSenha then
    begin
      ShowMessage('A senha deve possuir pelo menos 8 caracteres e não pode conter espaços em branco.');
      Exit;
    end;

    if VerificarLoginExistente(eLogin.Text) then
    begin
      ShowMessage('Já existe um cadastro com esse login.');
      Exit;
    end;

    CriptoPassword := CriptografarSenha(ePassword.Text);


    dm.UniQuery1.Close;
    dm.UniQuery1.SQL.Clear;
    dm.UniQuery1.SQL.Add('INSERT INTO operadores (nome, sobrenome, login, senha_hash) VALUES (:nome, :sobrenome, :login, :senha)');
    dm.UniQuery1.ParamByName('nome').AsString := eNome.Text;
    dm.UniQuery1.ParamByName('sobrenome').AsString := eSobrenome.Text;
    dm.UniQuery1.ParamByName('login').AsString := eLogin.Text;
    dm.UniQuery1.ParamByName('senha').AsString := CriptoPassword;

    dm.UniQuery1.ExecSQL;

    ShowMessage('Cadastro efetuado com sucesso!!');
    close;

  except
    on E: exception do
    begin
      ShowMessage('Erro ao cadastrar operador: ' + E.Message);
    end;
  end;
end;


end.