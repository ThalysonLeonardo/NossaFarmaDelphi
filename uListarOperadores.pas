unit uListarOperadores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.Buttons;

type
  TfListarOperadores = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnEditarOperador: TSpeedButton;
    btnExcluirOperador: TSpeedButton;
    btnVoltar: TSpeedButton;
    gridOperadores: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnExcluirOperadorClick(Sender: TObject);
    procedure btnEditarOperadorClick(Sender: TObject);
  private
    { Private declarations }
    OperadorCod: Integer;
    procedure PreencherGrid;
  public
    { Public declarations }
  end;

var
  fListarOperadores: TfListarOperadores;

implementation

{$R *.dfm}

uses uDM, uConexaoDB, uEditarOperador;

procedure TfListarOperadores.PreencherGrid;
begin
  dm.UniQuery1.Close;
  dm.UniQuery1.SQL.Clear;
  dm.UniQuery1.SQL.Add('SELECT codigo, nome, sobrenome, login FROM operadores');
  dm.UniQuery1.Open;
end;

procedure TfListarOperadores.btnEditarOperadorClick(Sender: TObject);
begin
  if not dm.UniQuery1.IsEmpty then
  begin
    OperadorCod := dm.UniQuery1.FieldByName('codigo').AsInteger;

    if not Assigned(fEditarOperador) then
      Application.CreateForm(TfEditarOperador, fEditarOperador);

    fEditarOperador.EditarOperador(OperadorCod);

    fEditarOperador.ShowModal;

    PreencherGrid;
  end
  else
  begin
     ShowMessage('Selecione um operador para editar.');
  end;
end;

procedure TfListarOperadores.btnExcluirOperadorClick(Sender: TObject);
begin
  if not dm.UniQuery1.IsEmpty then
    begin
      if MessageDlg('Deseja realmente excluir este operador?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        OperadorCod := dm.UniQuery1.FieldByName('codigo').AsInteger;

        try
          dm.UniQuery1.Close;
          dm.UniQuery1.SQL.Clear;
          dm.UniQuery1.SQL.Add('DELETE FROM operadores WHERE codigo = :codigo');
          dm.UniQuery1.ParamByName('codigo').AsInteger := OperadorCod;
          dm.UniQuery1.ExecSQL;

          PreencherGrid;

          ShowMessage('Operador ecluido com sucesso!');
        except
          on E: exception do
            ShowMessage('Erro ao excluir o operador: ' + E.Message);
        end;
      end;
    end
    else
    begin
      ShowMessage('Selecione um operador para excluir.');
    end;
end;

procedure TfListarOperadores.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TfListarOperadores.FormShow(Sender: TObject);
begin
  PreencherGrid;
end;


end.
