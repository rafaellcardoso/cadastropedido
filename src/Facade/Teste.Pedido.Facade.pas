unit Teste.Pedido.Facade;

interface

uses
  System.Generics.Collections,
  Teste.Pedido.Entity,
  Teste.Pedido.Controller;

type
  TPedidoFacade = class
  private
    FPedidoController: TPedidoController;

    class var FInstancia: TPedidoFacade;
  public
    class function GetInstancia: TPedidoFacade;

    procedure Insert(Pedido: TPedido);
    procedure Update(Pedido: TPedido);
    procedure Delete(Id: Integer);

    function FindById(const AId: Integer): TPedido;
    function FindAll(const ASql: String; const AParam: Boolean = False): TObjectList<TPedido>;
  end;


implementation

{ TPedidoFacade }

procedure TPedidoFacade.Delete(Id: Integer);
begin
  try
    FPedidoController := TPedidoController.Create;
    FPedidoController.Delete(Id);
  finally
    FPedidoController.Free;
  end;
end;

function TPedidoFacade.FindAll(const ASql: String;
  const AParam: Boolean): TObjectList<TPedido>;
begin
  try
    FPedidoController := TPedidoController.Create;
    Result := FPedidoController.FindAll(ASql, AParam);
  finally
    FPedidoController.Destroy;
  end;
end;

function TPedidoFacade.FindById(const AId: Integer): TPedido;
begin
  try
    FPedidoController := TPedidoController.Create;
    Result := FPedidoController.FindById(AId);
  finally
    FPedidoController.Free;
  end;
end;

class function TPedidoFacade.GetInstancia: TPedidoFacade;
begin
  if not( Assigned(FInstancia) ) then
    FInstancia := TPedidoFacade.Create;

  Result := FInstancia;
end;

procedure TPedidoFacade.Insert(Pedido: TPedido);
begin
  try
    FPedidoController := TPedidoController.Create;
    FPedidoController.Insert(Pedido);
  finally
    FPedidoController.Free;
  end;
end;

procedure TPedidoFacade.Update(Pedido: TPedido);
begin
  try
    FPedidoController := TPedidoController.Create;
    FPedidoController.Update(Pedido);
  finally
    FPedidoController.Free;
  end;
end;

end.
