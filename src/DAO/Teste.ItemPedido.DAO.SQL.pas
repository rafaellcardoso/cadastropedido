unit Teste.ItemPedido.DAO.SQL;

interface

const
  SQL_ITEMPEDIDO =
    'SELECT codigo, numero_pedido, codigo_produto, quantidade, valor_unitario, valor_total '+
    'FROM pedido_itens '+
    'WHERE numero_pedido = :idpedido';

  SQL_INSERT_ITEMPED = 'INSERT INTO pedido_itens (numero_pedido, codigo_produto, quantidade, valor_unitario, valor_total) '+
                       'VALUES (:numero_pedido, :codigo_produto, :quantidade, :valor_unitario, :valor_total)';

implementation

end.
