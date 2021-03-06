unit Teste.ItemPedido.Entity;

interface

uses
  System.Generics.Collections,
  Teste.Produto.Entity;

type
  TItemPedido = class
  private
    FQtd: Integer;
    FIdProduto: Integer;
    FId: Integer;
    FValorTotal: Currency;
    FIdPedido: Integer;
    FValorItem: Currency;
    FProduto: TProduto;
    procedure SetId(const Value: Integer);
    procedure SetIdPedido(const Value: Integer);
    procedure SetIdProduto(const Value: Integer);
    procedure SetQtd(const Value: Integer);
    procedure SetValorItem(const Value: Currency);
    procedure SetValorTotal(const Value: Currency);
    procedure SetProduto(const Value: TProduto);
  public
    constructor Create;
    destructor Destroy; override;
  published
    property Id: Integer read FId write SetId;
    property IdPedido: Integer read FIdPedido write SetIdPedido;
    property IdProduto: Integer read FIdProduto write SetIdProduto;
    property Qtd: Integer read FQtd write SetQtd;
    property ValorItem: Currency read FValorItem write SetValorItem;
    property ValorTotal: Currency read FValorTotal write SetValorTotal;
    property Produto: TProduto read FProduto write SetProduto;
  end;

implementation

{ TItemPedido }

constructor TItemPedido.Create;
begin
  FProduto := TProduto.Create;
end;

destructor TItemPedido.Destroy;
begin
  FProduto.Free;
  inherited;
end;

procedure TItemPedido.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TItemPedido.SetIdPedido(const Value: Integer);
begin
  FIdPedido := Value;
end;

procedure TItemPedido.SetIdProduto(const Value: Integer);
begin
  FIdProduto := Value;
end;

procedure TItemPedido.SetProduto(const Value: TProduto);
begin
  FProduto := Value;
end;

procedure TItemPedido.SetQtd(const Value: Integer);
begin
  FQtd := Value;
end;

procedure TItemPedido.SetValorItem(const Value: Currency);
begin
  FValorItem := Value;
end;

procedure TItemPedido.SetValorTotal(const Value: Currency);
begin
  FValorTotal := Value;
end;

end.
