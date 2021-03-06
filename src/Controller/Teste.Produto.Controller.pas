unit Teste.Produto.Controller;

interface

uses
  System.Generics.Collections,
  Teste.Default.Controller,
  Teste.Produto.DAO,
  Teste.Produto.Entity;

type
  TProdutoController = class(TDefaultController)
  private
    FProdutoDAO: TProdutoDAO;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Insert(Produto: TProduto); overload;
    procedure Update(Produto: TProduto); overload;
    procedure Delete(AId: Integer);

    function FindAll(const ASql: String; const AParam: Boolean = False): TObjectList<TProduto>;
    function FindByName(const AValue: string): TObjectList<TProduto>;
    function FindById(const AId: Integer): TProduto;
    function GetDescricao(Id: Integer): String;
  end;

implementation

{ TProdutoController }

constructor TProdutoController.Create;
begin
  FProdutoDAO := TProdutoDAO.Create;
  Self.DefaultDAO := FProdutoDAO;
end;

procedure TProdutoController.Delete(AId: Integer);
begin
  FProdutoDAO.Delete(AId);
end;

destructor TProdutoController.Destroy;
begin
  FProdutoDAO.Free;
  inherited;
end;

function TProdutoController.FindAll(const ASql: String;
  const AParam: Boolean): TObjectList<TProduto>;
begin
  Result := FProdutoDAO.FindAll(ASql, AParam);
end;

function TProdutoController.FindById(const AId: Integer): TProduto;
begin
  Result := FProdutoDAO.FindById(AId);
end;

function TProdutoController.FindByName(
  const AValue: string): TObjectList<TProduto>;
begin
  Result := nil;
end;

function TProdutoController.GetDescricao(Id: Integer): String;
begin
  Result := FProdutoDAO.GetDescricao(Id);
end;

procedure TProdutoController.Insert(Produto: TProduto);
begin
  FProdutoDAO.Insert(Produto);
end;

procedure TProdutoController.Update(Produto: TProduto);
begin
  FProdutoDAO.Update(Produto);
end;

end.
