unit Teste.Cliente.Controller;

interface

uses
  System.Generics.Collections,
  Teste.Default.Controller,
  Teste.Cliente.DAO,
  Teste.Cliente.Entity;

type
  TClienteController = class(TDefaultController)
  private
    FClienteDAO: TClienteDAO;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Insert(Produto: TCliente); overload;
    procedure Update(Produto: TCliente); overload;
    procedure Delete(AId: Integer);

    function FindAll(const ASql: String; const AParam: Boolean = False): TObjectList<TCliente>;
    function FindById(const AId: Integer): TCliente;
  end;


implementation

{ TClienteController }

constructor TClienteController.Create;
begin
  FClienteDAO := TClienteDAO.Create;
  Self.DefaultDAO := FClienteDAO;
end;

procedure TClienteController.Delete(AId: Integer);
begin
  FClienteDAO.Delete(AId);
end;

destructor TClienteController.Destroy;
begin
  FClienteDAO.Free;
  inherited;
end;

function TClienteController.FindAll(const ASql: String;
  const AParam: Boolean): TObjectList<TCliente>;
begin
  Result := FClienteDAO.FindAll(ASql, AParam);
end;

function TClienteController.FindById(const AId: Integer): TCliente;
begin
  Result := FClienteDAO.FindById(AId);
end;

procedure TClienteController.Insert(Produto: TCliente);
begin
  FClienteDAO.Insert(Produto);
end;

procedure TClienteController.Update(Produto: TCliente);
begin
  FClienteDAO.Update(Produto);
end;

end.
