unit Teste.Default.Controller;

interface

uses
  Teste.Default.DAO;

type
  TDefaultController = class
  private
    FDefaultDAO: TDefaultDAO;
    procedure SetDefaultDAO(const Value: TDefaultDAO);
  public
    procedure StartTransaction;
    procedure ConfirmTransaction;
    procedure CancelTransaction;

    property DefaultDAO: TDefaultDAO read FDefaultDAO write SetDefaultDAO;
  end;


implementation

{ TDefaultController }

procedure TDefaultController.CancelTransaction;
begin
  FDefaultDAO.CancelTransaction;
end;

procedure TDefaultController.ConfirmTransaction;
begin
  FDefaultDAO.ConfirmTransaction;
end;

procedure TDefaultController.SetDefaultDAO(const Value: TDefaultDAO);
begin
  FDefaultDAO := Value;
end;

procedure TDefaultController.StartTransaction;
begin
  FDefaultDAO.StartTransaction;
end;

end.
