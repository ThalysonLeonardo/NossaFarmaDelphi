unit uEditarOperador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TfEditarOperador = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
    EditarOperador: Integer;
  end;

var
  fEditarOperador: TfEditarOperador;

implementation

{$R *.dfm}

end.
