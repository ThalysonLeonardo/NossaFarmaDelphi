program Project1;

uses
  Vcl.Forms,
  uLogin in 'uLogin.pas' {fLogin},
  uHome in 'uHome.pas' {fHome},
  uDM in 'uDM.pas' {DM: TDataModule},
  uConexaoDB in 'uConexaoDB.pas' {fConexaoDB},
  uCadastroOperador in 'uCadastroOperador.pas' {fCadastroOperador};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfLogin, fLogin);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfCadastroOperador, fCadastroOperador);
  Application.Run;
end.
