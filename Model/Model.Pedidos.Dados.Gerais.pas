unit Model.Pedidos.Dados.Gerais;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, ComCtrls,
  Firedac.Stan.Param, FireDAC.Comp.Client, Data.DB, unit_funcoes;

type
  TPedidosDadosGerais = class
    private
      FConexao: TFdConnection;
      FId_Ped_Dados_Gerais : Integer;
      FPdg_Dt_Emissao : TDate;
      FPdg_Vl_Total : Double;
      FId_Clientes : Integer;
    public
      constructor Create( Conexao: TFdConnection);
      destructor Destroy; override;

      procedure Salvar(const objPedDadosGerais: TPedidosDadosGerais);
      function Buscar(const objPedDadosGerais: TPedidosDadosGerais): TPedidosDadosGerais;

      property Conexao: TFdConnection read FConexao write FConexao;
      property Id_Ped_Dados_Gerais : Integer read FId_Ped_Dados_Gerais write FId_Ped_Dados_Gerais;
      property Pdg_Dt_Emissao : TDate read FPdg_Dt_Emissao write FPdg_Dt_Emissao;
      property Pdg_Vl_Total : Double read FPdg_Vl_Total write FPdg_Vl_Total;
      property Id_Clientes : Integer read FId_Clientes write FId_Clientes;
  end;

var
  QryConsulta: TFDQuery;

implementation

{ TPedidosDadosGerais }

function TPedidosDadosGerais.Buscar(
  const objPedDadosGerais: TPedidosDadosGerais): TPedidosDadosGerais;
begin
  try
    FConexao.Connected := False;
    FConexao.Connected := True;

    QryConsulta.Close;
    QryConsulta.SQL.Clear;
    QryConsulta.SQL.Add('Select * ');
    QryConsulta.SQL.Add('From pedidos_dados_gerais ');
    QryConsulta.SQL.Add('Where id_ped_dados_gerais = :id_ped_dados_gerais ');
    QryConsulta.ParamByName('id_ped_dados_gerais').AsInteger := Self.Id_Ped_Dados_Gerais;
    QryConsulta.Open;
  finally
    Result := objPedDadosGerais;
  end;
end;

constructor TPedidosDadosGerais.Create(Conexao: TFdConnection);
begin
  FConexao := Conexao;

  QryConsulta := TFDQuery.Create( nil );
  QryConsulta.Connection := FConexao;
end;

destructor TPedidosDadosGerais.Destroy;
begin
  QryConsulta.Destroy;
  inherited;
end;

procedure TPedidosDadosGerais.Salvar(const objPedDadosGerais: TPedidosDadosGerais);
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
      QryInserir.SQL.Add('Insert into pedidos_dados_gerais (id_ped_dados_gerais, pdg_dt_emissao, pdg_vl_total, id_clientes) ');
      QryInserir.SQL.Add('Values (:p_id_ped_dados_gerais, :p_pdg_dt_emissao, :p_pdg_vl_total, :p_id_clientes) ');
      QryInserir.ParamByName('p_id_ped_dados_gerais').AsInteger := Self.Id_Ped_Dados_Gerais;
      QryInserir.ParamByName('p_pdg_dt_emissao').AsDate := Self.Pdg_Dt_Emissao;
      QryInserir.ParamByName('p_pdg_vl_total').AsFloat  := Self.Pdg_Vl_Total;
      QryInserir.ParamByName('p_id_clientes').AsInteger := Self.Id_Clientes;
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
