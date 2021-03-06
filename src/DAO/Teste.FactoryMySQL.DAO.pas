unit Teste.FactoryMySQL.DAO;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  System.SysUtils, VCL.Forms;

type
  TFactoryMySQL = class
  private
    class var FConnection: TFDConnection;
  protected
    function GetQuery: TFDQuery;
  public
    constructor Create;
    destructor Destroy; override;

    procedure CancelTransaction;
    procedure ConfirmTransaction;
    procedure StartTransaction;

    function GetConnection: TFDConnection;
  end;

implementation

{ TFactoryMySQL }

procedure TFactoryMySQL.CancelTransaction;
begin
  if FConnection.InTransaction then
    FConnection.RollbackRetaining;
end;

procedure TFactoryMySQL.ConfirmTransaction;
begin
  if FConnection.InTransaction then
    FConnection.CommitRetaining;
end;

constructor TFactoryMySQL.Create;
begin
  try
    FConnection := TFDConnection.Create(Application);
    FConnection.ConnectionName := 'ConnectionObj';
    FConnection.DriverName := 'MYSQL';
    FConnection.LoginPrompt := False;
    FConnection.Connected := False;
    FConnection.Params.Values['DataBase'] := 'dados';
    FConnection.Params.Values['User_Name'] := 'root';
    FConnection.Params.Values['Password'] := '';
    FConnection.Params.Values['Server'] := '';
    FConnection.Params.Values['DriverID'] := 'MYSQL';
    FConnection.Connected := True;
  except
    raise Exception.Create('Erro ao conectar o banco de dados!');
  end;
end;

destructor TFactoryMySQL.Destroy;
begin
  FConnection.Free;
  inherited;
end;

function TFactoryMySQL.GetConnection: TFDConnection;
begin
  Result := FConnection;
end;

function TFactoryMySQL.GetQuery: TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  Result.Connection := FConnection;
end;

procedure TFactoryMySQL.StartTransaction;
begin
  if not(FConnection.InTransaction) then
    FConnection.StartTransaction;
end;

end.
