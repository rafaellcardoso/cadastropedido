unit Teste.Cliente.Facade;

interface

uses
  System.Generics.Collections,
  Teste.Cliente.Entity,
  Teste.Cliente.Controller;

type
  TClienteFacade = class
  private
    FClienteController: TClienteController;

    class var FInstancia: TClienteFacade;
  public
    class function GetInstancia: TClienteFacade;

    procedure Insert(Cliente: TCliente);
    procedure Update(Cliente: TCliente);
    procedure Delete(Id: Integer);

    function FindById(const AId: Integer): TCliente;
    function FindAll(const ASql: String; const AParam: Boolean = False): TObjectList<TCliente>;
  end;

implementation

{ TClienteFacade }

procedure TClienteFacade.Delete(Id: Integer);
begin
  try
    FClienteController := TClienteController.Create;
    FClienteController.Delete(Id);
  finally
    FClienteController.Free;
  end;
end;

function TClienteFacade.FindAll(const ASql: String;
  const AParam: Boolean): TObjectList<TCliente>;
begin
  try
    FClienteController := TClienteController.Create;
    Result := FClienteController.FindAll(ASql, AParam);
  finally
    FClienteController.Destroy;
  end;
end;

function TClienteFacade.FindById(const AId: Integer): TCliente;
begin
  try
    FClienteController := TClienteController.Create;
    Result := FClienteController.FindById(AId);
  finally
    FClienteController.Free;
  end;
end;

class function TClienteFacade.GetInstancia: TClienteFacade;
begin
  if not( Assigned(FInstancia) ) then
    FInstancia := TClienteFacade.Create;

  Result := FInstancia;
end;

procedure TClienteFacade.Insert(Cliente: TCliente);
begin
  try
    FClienteController := TClienteController.Create;
    FClienteController.Insert(Cliente);
  finally
    FClienteController.Free;
  end;
end;

procedure TClienteFacade.Update(Cliente: TCliente);
begin
  try
    FClienteController := TClienteController.Create;
    FClienteController.Update(Cliente);
  finally
    FClienteController.Free;
  end;
end;

end.
