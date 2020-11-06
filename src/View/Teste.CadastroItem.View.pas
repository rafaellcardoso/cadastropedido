unit Teste.CadastroItem.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Teste.CadastroPadrao.View, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.StdCtrls, Teste.Produto.Entity;

type
  TCadastroItemForm = class(TCadastroPadraoForm)
    lblDescricao: TLabel;
    EdDescricao: TEdit;
    edPrecoVenda: TEdit;
    lblPrecoVenda: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
  private
    { Private declarations }
    FProduto: TProduto;
    procedure PopularCampos(AProduto: TProduto);
  public
    { Public declarations }
  end;

var
  CadastroItemForm: TCadastroItemForm;

implementation

uses
  Teste.Produto.Facade,
  Teste.Consulta.View;

{$R *.dfm}

procedure TCadastroItemForm.btnConsultarClick(Sender: TObject);
begin
  inherited;
  try
    PesquisaForm := TPesquisaForm.Create(Application);
    PesquisaForm.pnPeriodo.Visible := False;
    PesquisaForm.pnDesc.Visible := True;
    PesquisaForm.Exibir(1, 'PRODUTOS', 'CODIGO', 'DESCRICAO');
    //
    PesquisaForm.ShowModal;
    if PesquisaForm.ID > 0 then
      PopularCampos(TProdutoFacade.GetInstancia.FindById(PesquisaForm.ID));
  finally
    PesquisaForm.Release;
  end;
end;

procedure TCadastroItemForm.btnExcluirClick(Sender: TObject);
begin
  if Application.messageBox('Deseja excluir esse produto?',
                            'Confirma��o',
                            mb_YesNo+mb_IconInformation+mb_DefButton2) = IDYES then
  begin
    TProdutoFacade.GetInstancia.Delete(StrToInt(EdID.Text));
    inherited;
  end;
end;

procedure TCadastroItemForm.btnIncluirClick(Sender: TObject);
begin
  inherited;
  EdDescricao.SetFocus;
end;

procedure TCadastroItemForm.btnSalvarClick(Sender: TObject);
begin
  if not(Length(Trim(EdDescricao.Text)) > 0) then
    raise Exception.Create('Campo descri��o tem preenchimento obrigat�rio!');

  FProduto.Descricao  := EdDescricao.Text;
  FProduto.PrecoVenda := StrToFloat(edPrecoVenda.Text);
  if FAlteracao then
  begin
    FProduto.Id := StrToInt(EdID.Text);
    TProdutoFacade.GetInstancia.Update(FProduto);
  end
  else
    TProdutoFacade.GetInstancia.Insert(FProduto);

  inherited;
end;

procedure TCadastroItemForm.FormCreate(Sender: TObject);
begin
  inherited;
  FProduto := TProduto.Create;
end;

procedure TCadastroItemForm.FormDestroy(Sender: TObject);
begin
  FProduto.Free;
  inherited;
end;

procedure TCadastroItemForm.PopularCampos(AProduto: TProduto);
begin
  EdID.Text := IntToStr(AProduto.Id);
  EdDescricao.Text := AProduto.Descricao;
end;

end.
