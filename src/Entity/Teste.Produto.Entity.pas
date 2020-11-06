unit Teste.Produto.Entity;

interface

type
  TProduto = class
  private
    FDescricao: String;
    FId: Integer;
    FPrecoVenda: Double;
    procedure SetDescricao(const Value: String);
    procedure SetId(const Value: Integer);
    procedure SetPrecoVenda(const Value: Double);
  public
    property Id: Integer read FId write SetId;
    property Descricao: String read FDescricao write SetDescricao;
    property PrecoVenda: Double read FPrecoVenda write SetPrecoVenda;
  end;

implementation

{ TProduto }

procedure TProduto.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TProduto.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TProduto.SetPrecoVenda(const Value: Double);
begin
  FPrecoVenda := Value;
end;

end.
