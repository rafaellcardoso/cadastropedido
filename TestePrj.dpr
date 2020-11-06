program TestePrj;

uses
  Vcl.Forms,
  Main in 'Main.pas' {MainForm},
  Teste.Produto.Entity in 'src\Entity\Teste.Produto.Entity.pas',
  Teste.Default.DAO in 'src\DAO\Teste.Default.DAO.pas',
  Teste.Produto.DAO in 'src\DAO\Teste.Produto.DAO.pas',
  Teste.Produto.DAO.SQL in 'src\DAO\Teste.Produto.DAO.SQL.pas',
  Teste.CadastroPadrao.View in 'src\View\Teste.CadastroPadrao.View.pas' {CadastroPadraoForm},
  Teste.CadastroItem.View in 'src\View\Teste.CadastroItem.View.pas' {CadastroItemForm},
  Teste.Default.Controller in 'src\Controller\Teste.Default.Controller.pas',
  Teste.Produto.Controller in 'src\Controller\Teste.Produto.Controller.pas',
  Teste.Produto.Facade in 'src\Facade\Teste.Produto.Facade.pas',
  Teste.Consulta.View in 'src\View\Teste.Consulta.View.pas' {PesquisaForm},
  Teste.Pedido.Entity in 'src\Entity\Teste.Pedido.Entity.pas',
  Teste.ItemPedido.Entity in 'src\Entity\Teste.ItemPedido.Entity.pas',
  Teste.CadastroPedido.View in 'src\View\Teste.CadastroPedido.View.pas' {CadastroPedidoForm},
  Teste.Pedido.Facade in 'src\Facade\Teste.Pedido.Facade.pas',
  Teste.Pedido.Controller in 'src\Controller\Teste.Pedido.Controller.pas',
  Teste.Pedido.DAO in 'src\DAO\Teste.Pedido.DAO.pas',
  Teste.Pedido.DAO.SQL in 'src\DAO\Teste.Pedido.DAO.SQL.pas',
  Teste.ItemPedido.DAO in 'src\DAO\Teste.ItemPedido.DAO.pas',
  Teste.ItemPedido.DAO.SQL in 'src\DAO\Teste.ItemPedido.DAO.SQL.pas',
  Teste.ItemPedido.Controller in 'src\Controller\Teste.ItemPedido.Controller.pas',
  Teste.ItemPedido.Facade in 'src\Facade\Teste.ItemPedido.Facade.pas',
  Teste.ConsultaPedido.View in 'src\View\Teste.ConsultaPedido.View.pas' {ConsultaPedidoForm},
  Teste.Cliente.Entity in 'src\Entity\Teste.Cliente.Entity.pas',
  Teste.Cliente.DAO in 'src\DAO\Teste.Cliente.DAO.pas',
  Teste.Cliente.Controller in 'src\Controller\Teste.Cliente.Controller.pas',
  Teste.Cliente.Facade in 'src\Facade\Teste.Cliente.Facade.pas',
  Teste.FactoryMySQL.DAO in 'src\DAO\Teste.FactoryMySQL.DAO.pas',
  Teste.Cliente.DAO.SQL in 'src\DAO\Teste.Cliente.DAO.SQL.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
