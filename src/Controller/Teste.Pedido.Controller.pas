unit Teste.Pedido.Controller;

interface

uses
  System.Generics.Collections,
  Teste.Default.Controller,
  Teste.Pedido.DAO,
  Teste.Pedido.Entity;

type
  TPedidoController = class(TDefaultController)
  private
    FPedidoDAO: TPedidoDAO;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Insert(Pedido: TPedido); overload;
    procedure Update(Pedido: TPedido); overload;
    procedure Delete(AId: Integer);

    function FindAll(const ASql: String; const AParam: Boolean = False): TObjectList<TPedido>;
    function FindById(const AId: Integer): TPedido;
  end;

implementation

{ TPedidoController }

constructor TPedidoController.Create;
begin
  FPedidoDAO := TPedidoDAO.Create;
  Self.DefaultDAO := FPedidoDAO;
end;

procedure TPedidoController.Delete(AId: Integer);
begin
  FPedidoDAO.Delete(AId);
end;

destructor TPedidoController.Destroy;
begin
  FPedidoDAO.Free;
  inherited;
end;

function TPedidoController.FindAll(const ASql: String;
  const AParam: Boolean): TObjectList<TPedido>;
begin
  Result := FPedidoDAO.FindAll(ASql, AParam);
end;

function TPedidoController.FindById(const AId: Integer): TPedido;
begin
  Result := FPedidoDAO.FindById(AId);
end;

procedure TPedidoController.Insert(Pedido: TPedido);
begin
  FPedidoDAO.Insert(Pedido);
end;

procedure TPedidoController.Update(Pedido: TPedido);
begin
  FPedidoDAO.Update(Pedido);
end;

end.
