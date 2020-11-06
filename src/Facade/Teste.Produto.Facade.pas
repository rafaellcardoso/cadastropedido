unit Teste.Produto.Facade;

interface

uses
  System.Generics.Collections,
  Teste.Produto.Entity,
  Teste.Produto.Controller;

type
  TProdutoFacade = class
  private
    FProdutoController: TProdutoController;

    class var FInstancia: TProdutoFacade;
  public
    class function GetInstancia: TProdutoFacade;

    procedure Insert(Produto: TProduto);
    procedure Update(Produto: TProduto);
    procedure Delete(Id: Integer);

    function FindById(const AId: Integer): TProduto;
//    function FindByDescricao(const ADesc: String): TProdutoList;
    function FindAll(const ASql: String; const AParam: Boolean = False): TObjectList<TProduto>;
    function GetDescricao(AId: Integer): String;
  end;

implementation

{ TProdutoFacade }

procedure TProdutoFacade.Update(Produto: TProduto);
begin
  try
    FProdutoController := TProdutoController.Create;
    FProdutoController.Update(Produto);
  finally
    FProdutoController.Free;
  end;
end;

procedure TProdutoFacade.Delete(Id: Integer);
begin
  try
    FProdutoController := TProdutoController.Create;
    FProdutoController.Delete(Id);
  finally
    FProdutoController.Free;
  end;
end;

function TProdutoFacade.FindAll(const ASql: String;
  const AParam: Boolean): TObjectList<TProduto>;
begin
  try
    FProdutoController := TProdutoController.Create;
    Result := FProdutoController.FindAll(ASql, AParam);
  finally
    FProdutoController.Destroy;
  end;
end;

function TProdutoFacade.FindById(const AId: Integer): TProduto;
begin
  try
    FProdutoController := TProdutoController.Create;
    Result := FProdutoController.FindById(AId);
  finally
    FProdutoController.Free;
  end;
end;

function TProdutoFacade.GetDescricao(AId: Integer): String;
begin
  try
    FProdutoController := TProdutoController.Create;
    Result := FProdutoController.GetDescricao(AId);
  finally
    FProdutoController.Free;
  end;
end;

class function TProdutoFacade.GetInstancia: TProdutoFacade;
begin
  if not( Assigned(FInstancia) ) then
    FInstancia := TProdutoFacade.Create;

  Result := FInstancia;
end;

procedure TProdutoFacade.Insert(Produto: TProduto);
begin
  try
    FProdutoController := TProdutoController.Create;
    FProdutoController.Insert(Produto);
  finally
    FProdutoController.Free;
  end;
end;

end.
