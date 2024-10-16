unit Model.Pedidos.Produtos;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, ComCtrls,
  Firedac.Stan.Param, FireDAC.Comp.Client, Data.DB, unit_funcoes;

type
  TPedidosProdutos = class
    private
      FConexao: TFdConnection;
      FId_Pedidos_Produtos : Integer;
      FPedpro_Quantidade : Integer;
      FPedpro_Vlr_Unitario : Double;
      FPedpro_Vlr_Total : Double;
      FId_Ped_Dados_Gerais : Integer;
      FId_Produtos : Integer;
    public
      constructor Create( Conexao: TFdConnection);
      destructor Destroy; override;

      procedure Salvar(const objPedProd: TPedidosProdutos);

      property Conexao: TFdConnection read FConexao write FConexao;
      property Id_Pedidos_Produtos : Integer read FId_Pedidos_Produtos write FId_Pedidos_Produtos;
      property Pedpro_Quantidade :Integer read FPedpro_Quantidade write FPedpro_Quantidade;
      property Pedpro_Vlr_Unitario : Double read FPedpro_Vlr_Unitario write FPedpro_Vlr_Unitario;
      property Pedpro_Vlr_Total : Double read FPedpro_Vlr_Total write FPedpro_Vlr_Total;
      property Id_Ped_Dados_Gerais : Integer read FId_Ped_Dados_Gerais write FId_Ped_Dados_Gerais;
      property Id_Produtos : Integer read FId_Produtos write FId_Produtos;
  end;

var
  QryConsulta: TFDQuery;

implementation

{ TPedidosProdutos }

constructor TPedidosProdutos.Create(Conexao: TFdConnection);
begin
  FConexao := Conexao;

  QryConsulta := TFDQuery.Create( nil );
  QryConsulta.Connection := FConexao;
end;

destructor TPedidosProdutos.Destroy;
begin
  QryConsulta.Destroy;
  inherited;
end;

procedure TPedidosProdutos.Salvar(const objPedProd: TPedidosProdutos);
begin
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
      QryInserir.SQL.Add('Insert into pedidos_produtos (id_pedidos_produtos, pedpro_quantidade, pedpro_vlr_unitario, ');
      QryInserir.SQL.Add('   pedpro_vlr_total, id_id_ped_dados_gerais, id_produtos) ');
      QryInserir.SQL.Add('Values (:p_id_pedidos_produtos, :p_pedpro_quantidade, p_pedpro_vlr_unitario, ');
      QryInserir.SQL.Add(' :p_pedpro_vlr_total, :p_id_id_ped_dados_gerais, :p_id_produtos) ');
      QryInserir.ParamByName('p_id_pedidos_produtos').AsInteger := fnc_proximo_codigo('pedidos_produtos','id_pedidos_produtos');
      QryInserir.ParamByName('p_pedpro_quantidade').AsInteger   := Self.Pedpro_Quantidade;
      QryInserir.ParamByName('p_pedpro_vlr_unitario').AsFloat   := Self.Pedpro_Vlr_Unitario;
      QryInserir.ParamByName('p_pedpro_vlr_total').AsFloat      := Self.Pedpro_Vlr_Total;
      QryInserir.ParamByName('p_id_ped_dados_gerais').AsInteger := Self.Id_Ped_Dados_Gerais;
      QryInserir.ParamByName('p_id_produtos').AsInteger         := Self.Id_Produtos;
      QryInserir.ExecSQL;
    except
      on E : Exception do
        raise Exception.Create(E.Message);
    end;
  finally
    QryInserir.Destroy;
  end;
end;
end;

end.
