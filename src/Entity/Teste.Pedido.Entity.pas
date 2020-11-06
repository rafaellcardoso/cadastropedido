unit Teste.Pedido.Entity;

interface

uses
  System.Generics.Collections,
  Teste.ItemPedido.Entity;

type
  TPedido = class
  private
    FCliente: string;
    FId: Integer;
    FData: TDate;
    FNumeroPedido: Integer;
    FItemList: TObjectList<TItemPedido>;
    FIdCliente: Integer;
    FValorTotal: Double;
    procedure SetData(const Value: TDate);
    procedure SetId(const Value: Integer);
    procedure SetNumeroPedido(const Value: Integer);
    procedure SetItemList(const Value: TObjectList<TItemPedido>);
    procedure SetCliente(const Value: string);
    procedure SetIdCliente(const Value: Integer);
    procedure SetValorTotal(const Value: Double);
  public
    constructor Create;
    destructor Destroy; override;

    property Id: Integer read FId write SetId;
    property Data: TDate read FData write SetData;
    property NumeroPedido: Integer read FNumeroPedido write SetNumeroPedido;
    property IdCliente: Integer read FIdCliente write SetIdCliente;
    property Cliente: string read FCliente write SetCliente;
    property ItemList: TObjectList<TItemPedido> read FItemList write SetItemList;
    property ValorTotal: Double read FValorTotal write SetValorTotal;
  end;

implementation

{ TPedido }

constructor TPedido.Create;
begin
  FItemList := TObjectList<TItemPedido>.Create;
end;

destructor TPedido.Destroy;
begin
  FItemList.Free;
  inherited;
end;

procedure TPedido.SetCliente(const Value: string);
begin
  FCliente := Value;
end;

procedure TPedido.SetData(const Value: TDate);
begin
  FData := Value;
end;

procedure TPedido.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TPedido.SetIdCliente(const Value: Integer);
begin
  FIdCliente := Value;
end;

procedure TPedido.SetItemList(const Value: TObjectList<TItemPedido>);
begin
  FItemList := Value;
end;

procedure TPedido.SetNumeroPedido(const Value: Integer);
begin
  FNumeroPedido := Value;
end;

procedure TPedido.SetValorTotal(const Value: Double);
begin
  FValorTotal := Value;
end;

end.
