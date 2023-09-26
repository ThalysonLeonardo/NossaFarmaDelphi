unit uListarLocais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  TfLocaisEstoque = class(TForm)
    Panel1: TPanel;
    btnVoltar: TSpeedButton;
    gridLocais: TDBGrid;
    Panel2: TPanel;
    btnNovoLocal: TSpeedButton;
    btnEditarLocal: TSpeedButton;
    btnExcluirLocal: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnExcluirLocalClick(Sender: TObject);
    procedure btnNovoLocalClick(Sender: TObject);
    procedure btnEditarLocalClick(Sender: TObject);
  private
    { Private declarations }
    LocalID : Integer;
    procedure PreencherGrid;
  public
    { Public declarations }
  end;

var
  fLocaisEstoque: TfLocaisEstoque;

implementation

{$R *.dfm}

uses uDM, uConexaoDB, uCadastrarLocal, uEditarLocal;

procedure TfLocaisEstoque.btnEditarLocalClick(Sender: TObject);
begin
  if not dm.UniQuery1.IsEmpty then
  begin
    LocalID := dm.UniQuery1.FieldByName('id').AsInteger;

    if not Assigned(fEditarLocal) then
      Application.CreateForm(TfEditarLocal, fEditarLocal);

    fEditarLocal.EditarLocal(LocalID);

    fEditarLocal.ShowModal;

    PreencherGrid;
  end
end;

procedure TfLocaisEstoque.btnExcluirLocalClick(Sender: TObject);
begin
  if not dm.UniQuery1.IsEmpty then
    begin
      if MessageDlg('Deseja realmente excluir este local?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        LocalID := dm.UniQuery1.FieldByName('id').AsInteger;

        try
          dm.UniQuery1.Close;
          dm.UniQuery1.SQL.Clear;
          dm.UniQuery1.SQL.Add('DELETE FROM locais_estoque WHERE id = :id');
          dm.UniQuery1.ParamByName('id').AsInteger := LocalID;
          dm.UniQuery1.ExecSQL;

          PreencherGrid;

          ShowMessage('Local excluido com sucesso!');
        except
          on E: exception do
            ShowMessage('Erro ao excluir o Local: ' + E.Message);
        end;
      end;
    end
    else
    begin
      ShowMessage('Selecione um local para excluir.');
    end;
end;

procedure TfLocaisEstoque.btnNovoLocalClick(Sender: TObject);
begin
  if not Assigned(fCadastrarLocal) then
    Application.CreateForm(TfCadastrarLocal, fCadastrarLocal);

  fCadastrarLocal.ShowModal;

  PreencherGrid;
end;

procedure TfLocaisEstoque.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TfLocaisEstoque.FormShow(Sender: TObject);
begin
  PreencherGrid;
end;

procedure TfLocaisEstoque.PreencherGrid;
begin
  dm.UniQuery1.Close;
  dm.UniQuery1.SQL.Clear;
  dm.UniQuery1.SQL.Add('SELECT id, nome, descricao, status FROM locais_estoque');
  dm.UniQuery1.Open;
end;

end.
