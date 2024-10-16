unit Model.Clientes;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, ComCtrls,
  Firedac.Stan.Param, FireDAC.Comp.Client, Data.DB, unit_funcoes;

type
  TClientes = class
    private
      FConexao: TFdConnection;
      FIdClientes : Integer;
      FNome : string;
      FCidade : string;
      FUF : string;
    public
      constructor Create( Conexao: TFdConnection);
      destructor Destroy; override;

      procedure Salvar(const objClientes: TClientes);
      function GetNome(const objClientes: TClientes): string;

      property Conexao: TFdConnection read FConexao write FConexao;
      property IdCliente : Integer read FIdClientes write FIdClientes;
      property Nome: string read FNome write FNome;
      property Cidade: string read FCidade write FCidade;
      property UF: string read FUF write FUF;
  end;

var
  QryConsulta: TFDQuery;

implementation

{ TClientes }

constructor TClientes.Create(Conexao: TFdConnection);
begin
  FConexao := Conexao;

  QryConsulta := TFDQuery.Create( nil );
  QryConsulta.Connection := FConexao;
end;

destructor TClientes.Destroy;
begin
  QryConsulta.Destroy;
  inherited;
end;

function TClientes.GetNome(const objClientes: TClientes): string;
begin
  try
    FConexao.Connected := False;
    FConexao.Connected := True;

    QryConsulta.Close;
    QryConsulta.SQL.Clear;
    QryConsulta.SQL.Add('Select cli_nome ');
    QryConsulta.SQL.Add('From clientes ');
    QryConsulta.SQL.Add('Where id_clientes = :id_clientes ');
    QryConsulta.ParamByName('id_clientes').AsInteger := Self.IdCliente;

    QryConsulta.Open;
  finally
    Result := QryConsulta.FieldByName('cli_nome').AsString;
  end;
end;

procedure TClientes.Salvar(const objClientes: TClientes);
var
  QryInserir: TFDQuery;
begin
  FConexao.Connected := False;
  FConexao.Connected := True;

  QryInserir := TFDQuery.Create( nil );
  QryInserir.Connection := FConexao;

  try
    try
      QryInserir.Close;
      QryInserir.SQL.Clear;
      QryInserir.SQL.Add('Insert into clientes (id_clientes, cli_nome, cli_cidade, cli_uf) ');
      QryInserir.SQL.Add('Values (:p_id_clientes, :p_cli_nome, :p_cli_cidade, :p_cli_uf) ');
      QryInserir.ParamByName('p_id_clientes').AsInteger := fnc_proximo_codigo('clientes','id_clientes');
      QryInserir.ParamByName('p_cli_nome').AsString   := Self.Nome;
      QryInserir.ParamByName('p_cli_cidade').AsString := Self.Cidade;
      QryInserir.ParamByName('p_cli_uf').AsString     := Self.UF;
      QryInserir.ExecSQL;
    except
      on E : Exception do
        raise Exception.Create(E.Message);
    end;
  finally
    QryInserir.Destroy;
  end;
end;
end.
