unit Controller.Clientes;

interface

uses
  StrUtils,
  SysUtils,
  Model.Clientes;

type
  TControllerClientes = class
  public
    procedure Salvar(const objClientes: TClientes);
    function GetNome(const objClientes: TClientes): string;
  end;

implementation

{ TControllerClientes }

function TControllerClientes.GetNome(const objClientes: TClientes): string;
begin
  result := objClientes.GetNome(objClientes);
end;

procedure TControllerClientes.Salvar(const objClientes: TClientes);
begin
  objClientes.Salvar(objClientes);
end;

end.
