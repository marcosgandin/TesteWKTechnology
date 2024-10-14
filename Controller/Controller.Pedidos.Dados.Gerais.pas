unit Controller.Pedidos.Dados.Gerais;

interface

uses
  StrUtils,
  SysUtils,
  Model.Pedidos.Dados.Gerais;

type
  TControllerPedidosDadosGerais = class
  public
    procedure Salvar(const objPedDadosGerais: TPedidosDadosGerais);
    function Buscar(const objPedDadosGerais: TPedidosDadosGerais): TPedidosDadosGerais;
  end;

implementation

{ TControllerPedidosDadosGerais }

function TControllerPedidosDadosGerais.Buscar(
  const objPedDadosGerais: TPedidosDadosGerais): TPedidosDadosGerais;
begin
  Result := objPedDadosGerais.Buscar(objPedDadosGerais);
end;

procedure TControllerPedidosDadosGerais.Salvar(
  const objPedDadosGerais: TPedidosDadosGerais);
begin
  objPedDadosGerais.Salvar(objPedDadosGerais);
end;

end.
