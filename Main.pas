unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef;

type
  TMainForm = class(TForm)
    FDConnection1: TFDConnection;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Item1: TMenuItem;
    Movimento1: TMenuItem;
    Pedido: TMenuItem;
    TopPanel: TPanel;
    ItemButton: TButton;
    PedidoButton: TButton;
    procedure Item1Click(Sender: TObject);
    procedure PedidoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  Teste.CadastroItem.View,
  Teste.CadastroPedido.View;

{$R *.dfm}

procedure TMainForm.Item1Click(Sender: TObject);
begin
  CadastroItemForm := TCadastroItemForm.Create(Application);
  try
    CadastroItemForm.ShowModal;
  finally
    CadastroItemForm.Free;
  end;
end;

procedure TMainForm.PedidoClick(Sender: TObject);
begin
  CadastroPedidoForm := TCadastroPedidoForm.Create(Application);
  try
    CadastroPedidoForm.ShowModal;
  finally
    CadastroPedidoForm.Free;
  end;
end;

end.
