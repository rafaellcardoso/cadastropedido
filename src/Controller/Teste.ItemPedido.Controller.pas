unit Teste.ItemPedido.Controller;

interface

uses
  System.Generics.Collections,
  Teste.Default.Controller,
  Teste.ItemPedido.DAO,
  Teste.ItemPedido.Entity;

type
  TItemPedidoController = class(TDefaultController)
  private
    FItemPedidoDAO: TItemPedidoDAO;
  public
    constructor Create;
    destructor Destroy; override;

    function FindItensByIdPedido(const IdPedido: Integer): TObjectList<TItemPedido>;
  end;

implementation

{ TItemPedidoController }

constructor TItemPedidoController.Create;
begin
  FItemPedidoDAO := TItemPedidoDAO.Create;
  Self.DefaultDAO := FItemPedidoDAO;
end;

destructor TItemPedidoController.Destroy;
begin
  FItemPedidoDAO.Free;

  inherited;
end;

function TItemPedidoController.FindItensByIdPedido(
  const IdPedido: Integer): TObjectList<TItemPedido>;
begin
  Result := FItemPedidoDAO.FindItensByIdPedido(IdPedido);
end;

end.
