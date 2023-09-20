unit uConexaoDB;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfConexaoDB = class(TForm)
    Button1: TButton;
    TXT_ipserver: TEdit;
    TXT_user: TEdit;
    TXT_password: TEdit;
    TXT_dbname: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConfiguraBancoOffline;
  end;

var
  fConexaoDB: TfConexaoDB;

implementation

{$R *.dfm}

uses uDM;

procedure TfConexaoDB.Button1Click(Sender: TObject);
begin


  try
    dm.UniConnection1.Disconnect;
    dm.UniConnection1.Server := TXT_ipserver.Text;
    dm.UniConnection1.Username := TXT_user.Text;
    dm.UniConnection1.Password := TXT_password.Text;
    dm.UniConnection1.Database := TXT_dbname.Text;
    dm.UniConnection1.Connect;
  except
  on E: Exception do
  begin
    ShowMessage('Erro ao conectar ao banco de dados: ' + E.Message);
  end;

  end;
end;

procedure TfConexaoDB.ConfiguraBancoOffline;
begin
try
    dm.UniConnection1.Disconnect;
    dm.UniConnection1.Server := 'localhost';
    dm.UniConnection1.Username := 'postgres';
    dm.UniConnection1.Password := 'x82x45ss';
    dm.UniConnection1.Database := 'NossaFarmaDB';
    dm.UniConnection1.Connect;
  except
  on E: Exception do
  begin
    ShowMessage('Erro ao conectar ao banco de dados: ' + E.Message);
  end;

  end;
end;

end.
