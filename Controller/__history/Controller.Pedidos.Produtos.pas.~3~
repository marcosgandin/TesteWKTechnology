unit Controller.Pedidos.Produtos;

interface

uses
  StrUtils,
  SysUtils,
  Model.Pedidos.Produtos;

type
  TControllerPedidosProdutos = class
  public
    function Salvar(const objPedProd: TPedidosProdutos): string;
  end;

implementation

{ TControllerPedidosProdutos }

function TControllerPedidosProdutos.Salvar(
  const objPedProd: TPedidosProdutos): string;
begin
  Result := EmptyStr;

  if objPedProd.Pedpro_Quantidade <= 0 then
    Result := 'Quantidade do produto é obrigatório!';

  if objPedProd.Pedpro_Vlr_Unitario <= 0 then
    Result := 'Valor unitário do produto é obrigatório!';

  if Result = EmptyStr then
    objPedProd.Salvar(objPedProd);
end;

end.
