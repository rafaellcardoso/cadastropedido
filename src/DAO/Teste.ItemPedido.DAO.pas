unit Teste.ItemPedido.DAO;

interface

uses
  System.SysUtils,
  FireDAC.Comp.Client,
  System.Generics.Collections,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet,
  Teste.Default.DAO,
  Teste.ItemPedido.Entity;

type
  TItemPedidoDAO = class(TDefaultDAO)
  private
    function PopularItemPedido(AQuery: TFDQuery): TItemPedido;
  public
//    procedure Insert(Pedido: TItemPedido);
//    procedure Update(Pedido: TItemPedido);
//    procedure Delete(Id: Integer);

    //function FindAll(const ASql: String; const AParam: Boolean = False): TObjectList<TPedido>;
    //function FindById(const Id: Integer): TPedido;
    function FindItensByIdPedido(const IdPedido: Integer): TObjectList<TItemPedido>;
  end;


implementation

uses
  Teste.ItemPedido.DAO.SQL;

{ TPedidoDAO }

function TItemPedidoDAO.FindItensByIdPedido(
  const IdPedido: Integer): TObjectList<TItemPedido>;
var
  lQry: TFDQuery;
begin
  try
    Result := TObjectList<TItemPedido>.Create();
    lQry := GetQuery;
    lQry.Close;
    lQry.SQL.Clear;
    lQry.SQL.Add(SQL_ITEMPEDIDO);
    lQry.Params[0].AsInteger := IdPedido;
    lQry.Open;
    if not (lQry.IsEmpty) then
    begin
      while not lQry.Eof do
      begin
        Result.Add(PopularItemPedido(lQry));
        lQry.Next;
      end;
    end;
  finally
    lQry.Free;
  end;
end;

function TItemPedidoDAO.PopularItemPedido(AQuery: TFDQuery): TItemPedido;
begin
  Result            := TItemPedido.Create;
  Result.Id         := AQuery.Fields[0].AsInteger;
  Result.IdPedido   := AQuery.Fields[1].AsInteger;
  Result.IdProduto  := AQuery.Fields[2].AsInteger;
  Result.Qtd        := AQuery.Fields[3].AsInteger;
  Result.ValorItem  := AQuery.Fields[4].AsCurrency;
  Result.ValorTotal := AQuery.Fields[5].AsCurrency;
end;

end.
