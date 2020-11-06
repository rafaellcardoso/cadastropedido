unit Teste.Pedido.DAO.SQL;

interface

const
  SQL_INSERT_PEDIDO =
    'INSERT INTO pedidos (data_emissao, codigo_cliente, valor_total) '+
    'VALUES (:data_emissao, :codigo_cliente, :valor_total)';

  SQL_UPDATE_PEDIDO =
    'UPDATE pedidos SET codigo_cliente = :codigo_cliente, valor_total = :valor_total WHERE numero_pedido = :ID';

  SQL_DELETE_PEDIDO = 'DELETE FROM pedidos WHERE numero_pedido = :ID';

  SQL_DELETE_ITPEDIDO = 'DELETE FROM pedidoitens WHERE numero_pedido = :ID';

  SQL_PEDIDO = 'SELECT p.numero_pedido, p.data_emissao, p.codigo_cliente, c.nome, p.valor_total '+
               'FROM pedidos p '+
               'LEFT JOIN clientes c on c.codigo = p.codigo_cliente '+
               'WHERE 1 = 1 ';


  SQL_MAX_PEDIDO = 'SELECT MAX(numero_pedido) FROM pedidos';

implementation

end.
