unit Teste.ItemPedido.Facade;

interface

uses
  System.Generics.Collections,
  Teste.ItemPedido.Entity,
  Teste.ItemPedido.Controller;

type
  TItemPedidoFacade = class
  private
    FItemPedidoController: TItemPedidoController;

    class var FInstancia: TItemPedidoFacade;
  public
    class function GetInstancia: TItemPedidoFacade;

    function FindItensByIdPedido(const IdPedido: Integer): TObjectList<TItemPedido>;
  end;


implementation

{ TPedidoFacade }

function TItemPedidoFacade.FindItensByIdPedido(
  const IdPedido: Integer): TObjectList<TItemPedido>;
begin
  try
    FItemPedidoController := TItemPedidoController.Create;
    Result := FItemPedidoController.FindItensByIdPedido(IdPedido);
  finally
    FItemPedidoController.Free;
  end;
end;

class function TItemPedidoFacade.GetInstancia: TItemPedidoFacade;
begin
  if not( Assigned(FInstancia) ) then
    FInstancia := TItemPedidoFacade.Create;

  Result := FInstancia;
end;

end.
