unit Teste.Produto.DAO.SQL;

interface

const
  SQL_INSERT_PRODUTO =
    'INSERT INTO produtos (descricao, preco_venda) '+
    'VALUES (:descricao, :preco_venda)';

  SQL_UPDATE_PRODUTO =
    'UPDATE produtos SET descricao = :descricao, preco_venda = :preco_venda WHERE codigo = :ID';

  SQL_DELETE_PRODUTO = 'DELETE FROM produtos WHERE codigo = :ID';

  SQL_PRODUTO = 'SELECT codigo, descricao, preco_venda '+
                'FROM produtos '+
                'WHERE 1 = 1';

implementation

end.
