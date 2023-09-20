unit uOperadores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  DBAccess, Uni, MemDS, Vcl.StdCtrls;

type
  TfOperadores = class(TForm)
    Label1: TLabel;
    UniConnection1: TUniConnection;
    UniQuery1: TUniQuery;
    UniDataSource1: TUniDataSource;
    DBGrid1: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fOperadores: TfOperadores;

implementation

{$R *.dfm}
end.
