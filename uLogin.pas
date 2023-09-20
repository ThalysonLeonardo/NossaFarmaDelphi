unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, DBAccess, Uni, MemDS, PostgreSQLUniProvider,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, IdHashMessageDigest;

type
  TfLogin = class(TForm)
    Label1: TLabel;
    TXT_login: TEdit;
    Label2: TLabel;
    TXT_password: TEdit;
    btn_logar: TButton;
    Button1: TButton;
    Image1: TImage;
    Label3: TLabel;
    Label4: TLabel;
    procedure btn_logarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    Tentativas: Integer;
    function CriptografarSenha(const senha: string): string;
    function ValidarLogin(login, senha: string): Boolean;
    procedure LimiteErrosLogin;
  public
    { Public declarations }
  end;

var
  fLogin: TfLogin;

implementation

{$R *.dfm}

uses uConexaoDB, uDM, uHome, uOperadores;

function TfLogin.CriptografarSenha(const senha: string): string;
var
  Semente, Md5: string;
  Hasher : TIdHashMessageDigest5;
begin
  Semente := 'R6#GIRO2022@';
  Hasher := TIdHashMessageDigest5.Create;

  try
    Md5 := Hasher.HashStringAsHex(senha);
  finally
    Hasher.Free;
  end;

  Result := Semente + Md5 + Semente;
end;

procedure TfLogin.Button1Click(Sender: TObject);
begin
  if fConexaoDB = nil then Application.CreateForm(TfConexaoDB, fConexaoDB);
  fConexaoDB.ShowModal;
end;

function Tflogin.ValidarLogin(login: string; senha: string): Boolean;
var
  MD5: string;

begin
  try
     MD5 := CriptografarSenha(senha);

    dm.UniQuery1.Close;
    dm.UniQuery1.SQL.Clear;
    dm.UniQuery1.SQL.Add('SELECT COUNT(*) FROM operadores WHERE login = :login AND senha_hash = :senha');
    dm.UniQuery1.ParamByName('login').AsString := login;
    dm.UniQuery1.ParamByName('senha').AsString := MD5;
    dm.UniQuery1.Open;

    Result := (dm.UniQuery1.Fields[0].AsInteger > 0);
  except
    on E: Exception do
      begin
        Result := False;
        ShowMessage('Erro ao Verificar Login: ' + E.Message);
      end;
  end;
end;

procedure TfLogin.LimiteErrosLogin;
begin
  Inc(Tentativas);
  if Tentativas >= 3 then
  begin
    ShowMessage('Você Atingiu o máximo de tentativas. Tente novamente dentro de alguns minutos.');
    Application.Terminate;
  end;
end;

procedure TfLogin.btn_logarClick(Sender: TObject);
begin
 if (txt_Login.Text = '') or (txt_Password.Text = '') then
   begin
     ShowMessage('Preencha os campos para efetuar o Login!');
     exit;
   end;


 try
  if ValidarLogin(Trim(TXT_login.Text), Trim(TXT_password.Text)) then
    begin
      ShowMessage('Login Efetuado com Sucesso!');

      if fHome = nil then Application.CreateForm(TfHome, fHome);
      fHome.Show;
      fLogin.Hide;
    end
  else
    begin
      LimiteErrosLogin;
      ShowMessage('Login ou Senha incorretos. Tente Novamente!');
    end;
 except
  on E: Exception do
    begin
      ShowMessage('Erro ao conectar ao banco de dados: ' + E.Message);
    end;

 end;


end;

end.
