unit Controller.Produtos;

interface

uses
  StrUtils,
  SysUtils,
  Model.Produtos;

type
  TControllerProdutos = class
  public
    function Salvar(const objProduto: TProdutos): string;
    function GetNome(const objProduto: TProdutos): string;
    function GetVlrVenda(const objProduto: TProdutos): Currency;
  end;

implementation

{ TControllerProdutos }

function TControllerProdutos.GetNome(const objProduto: TProdutos): string;
begin
  Result := objProduto.GetNome(objProduto);
end;

function TControllerProdutos.GetVlrVenda(const objProduto: TProdutos): Currency;
begin
  Result := objProduto.GetVlrVenda(objProduto);
end;

function TControllerProdutos.Salvar(const objProduto: TProdutos): string;
begin
  Result := EmptyStr;

  if objProduto.Descricao = EmptyStr then
    Result := 'Nome do produto � obrigat�rio!';

  if objProduto.VlVenda <= 0 then
    Result := 'Valor do produto � obrigat�rio!';

  if Result = EmptyStr then
    objProduto.Salvar(objProduto);
end;

end.
