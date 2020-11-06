unit Teste.Cliente.DAO.SQL;

interface

const
  SQL_INSERT_CLIENTE =
    'INSERT INTO clientes (nome, cidade, uf) '+
    'VALUES (:nome, :cidade, :uf)';

  SQL_UPDATE_CLIENTE =
    'UPDATE clientes SET nome = :nome, cidade = :cidade, uf = :uf WHERE codigo = :ID';

  SQL_DELETE_CLIENTE = 'DELETE FROM clientes WHERE codigo = :ID';

  SQL_CLIENTE =  'SELECT codigo, nome, cidade, uf '+
                 'FROM clientes '+
                 'WHERE 1 = 1';

implementation

end.
