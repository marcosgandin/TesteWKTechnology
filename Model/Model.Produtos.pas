unit Model.Produtos;

interface

uses
  Windows, SysUtils, Dialogs, Classes, Controls, Forms, ComCtrls,
  Firedac.Stan.Param, FireDAC.Comp.Client, Data.DB, unit_funcoes;

type
  TProdutos = class
    private
      FConexao: TFdConnection;
      FIdProdutos : Integer;
      FDescricao : string;
      FVlrVenda : Double;
    public
      constructor Create( Conexao: TFdConnection);
      destructor Destroy; override;

      procedure Salvar(const objProduto: TProdutos);
      function GetNome(const objProduto: TProdutos): string;
      function GetVlrVenda(const objProduto: TProdutos): Currency;

      property Conexao: TFdConnection read FConexao write FConexao;
      property IdProduto : Integer read FIdProdutos write FIdProdutos;
      property Descricao : string read FDescricao write FDescricao;
      property VlVenda: double read FVlrVenda write FVlrVenda;
  end;

var
  QryConsulta: TFDQuery;

implementation

{ TProdutos }

constructor TProdutos.Create(Conexao: TFdConnection);
begin
  FConexao := Conexao;

  QryConsulta := TFDQuery.Create( nil );
  QryConsulta.Connection := FConexao;
end;

destructor TProdutos.Destroy;
begin
  QryConsulta.Destroy;
  inherited;
end;

function TProdutos.GetNome(const objProduto: TProdutos): string;
begin
  try
    FConexao.Connected := False;
    FConexao.Connected := True;

    QryConsulta.Close;
    QryConsulta.SQL.Clear;
    QryConsulta.SQL.Add('Select pro_descricao ');
    QryConsulta.SQL.Add('From produtos ');
    QryConsulta.SQL.Add('Where id_produtos = :id_produtos ');
    QryConsulta.ParamByName('id_produtos').AsInteger := Self.IdProduto;

    QryConsulta.Open;
  finally
    Result := QryConsulta.FieldByName('pro_descricao').AsString;
  end;
end;

function TProdutos.GetVlrVenda(const objProduto: TProdutos): Currency;
begin
  try
    FConexao.Connected := False;
    FConexao.Connected := True;

    QryConsulta.Close;
    QryConsulta.SQL.Clear;
    QryConsulta.SQL.Add('Select pro_vlr_venda ');
    QryConsulta.SQL.Add('From produtos ');
    QryConsulta.SQL.Add('Where id_produtos = :id_produtos ');
    QryConsulta.ParamByName('id_produtos').AsInteger := Self.IdProduto;

    QryConsulta.Open;
  finally
    Result := QryConsulta.FieldByName('pro_vlr_venda').AsCurrency;
  end;
end;

procedure TProdutos.Salvar(const objProduto: TProdutos);
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
      QryInserir.SQL.Add('Insert into produtos (pro_descricao, pro_vlr_venda) ');
      QryInserir.SQL.Add('Values (:p_pro_descricao, :p_pro_vlr_venda) ');
      QryInserir.ParamByName('p_pro_descricao').AsString := Self.Descricao;
      QryInserir.ParamByName('p_pro_vlr_venda').AsFloat  := Self.VlVenda;
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
