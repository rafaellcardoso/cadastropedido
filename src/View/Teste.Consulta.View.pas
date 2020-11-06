unit Teste.Consulta.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ComCtrls, System.StrUtils,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, System.Generics.Collections, Teste.Produto.Entity,
  Datasnap.DBClient, Vcl.Buttons, Teste.Cliente.Entity;

CONST
  Title : Array [1..3]  of string = ('Descrição', 'Descrição', 'Data');
  SQL_C = ' AND %s = %s ';
  SQL_D = ' AND %s like %s ';
  SQL_DT = ' AND DATA BETWEEN %s AND %s ';


type
  TPesquisaForm = class(TForm)
    grid: TDBGrid;
    pnDesc: TPanel;
    lblPesquisar: TLabel;
    edNome: TEdit;
    btnConsultar: TButton;
    pnPeriodo: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    DateIni: TDateTimePicker;
    DateFim: TDateTimePicker;
    btnConsDate: TButton;
    pnPesquisar: TPanel;
    CBoxPesquisar: TComboBox;
    ds: TDataSource;
    cds: TClientDataSet;
    ButtonPanel: TPanel;
    btnUltimo: TSpeedButton;
    btnProximo: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnInicio: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnConsDateClick(Sender: TObject);
    procedure gridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CBoxPesquisarChange(Sender: TObject);
    procedure edNomeChange(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnInicioClick(Sender: TObject);
    procedure gridDblClick(Sender: TObject);
  private
    { Private declarations }
    FieldID: string;
    FieldDesc: string;
    Table: string;
    DescPesquisa: String;
    ListP: TObjectList<TProduto>;
    ListCli: TObjectList<TCliente>;
    Facade: Integer;
    procedure AtualizaDescPesquisa;
    procedure AtualizaRegistro(AParam: String = '');

    procedure ListaCliPopulaCDS;
    procedure ListaProdPopulaCDS;
    procedure PreparaFields;

  public
    { Public declarations }
    ID: Integer;

    // 1 - Produto; 2 - Pedido
    procedure Exibir(AFacade: Integer; ATable, AFieldID, AFieldDesc: String);
  end;

var
  PesquisaForm: TPesquisaForm;

implementation

uses
  Teste.Produto.Facade,
  Teste.Cliente.Facade;

{$R *.dfm}

procedure TPesquisaForm.AtualizaDescPesquisa;
begin
  lblPesquisar.Caption := 'Digite '+ CBoxPesquisar.Text + ' ' + DescPesquisa;
end;

procedure TPesquisaForm.AtualizaRegistro(AParam: String);
var
  sSQL: String;
begin
  sSQL := '';

  if ( Facade = 2 ) then
    sSQL := Format(SQL_DT, [ CHR(39)+DateToStr(DateIni.Date)+CHR(39),
                             CHR(39)+DateToStr(DateFim.Date)+CHR(39) ])
  else
    sSQL := Format(IfThen(CBoxPesquisar.ItemIndex = 0, SQL_C, SQL_D),
                    [IfThen(CBoxPesquisar.ItemIndex = 0, FieldID, FieldDesc),
                     IfThen(CBoxPesquisar.ItemIndex = 0, AParam, CHR(39)+(AParam + '%')+CHR(39) )]);


  case Facade of
    1: begin
         ListP := TObjectList<TProduto>.Create();
         ListP := TProdutoFacade.GetInstancia.FindAll(sSQL, (Length(Trim(AParam)) > 0));
         ListaProdPopulaCDS;
         ListP.Free;
       end;
    2: begin
         ListCli := TObjectList<TCliente>.Create();
         ListCli := TClienteFacade.GetInstancia.FindAll(sSQL, (Length(Trim(AParam)) > 0));
         ListaCliPopulaCDS;
         ListCli.Free;
       end;
  end;
  grid.Columns[0].FieldName     := FieldID;
  grid.Columns[1].FieldName     := FieldDesc;
  grid.Columns[1].Title.Caption := Title[Facade+1];
end;

procedure TPesquisaForm.btnAnteriorClick(Sender: TObject);
begin
  cds.Prior;
end;

procedure TPesquisaForm.btnConsDateClick(Sender: TObject);
begin
  AtualizaRegistro(DateToStr(DateIni.Date));
end;

procedure TPesquisaForm.btnConsultarClick(Sender: TObject);
begin
  if Length(Trim(edNome.Text)) > 0 then
    AtualizaRegistro(edNome.Text);
end;

procedure TPesquisaForm.btnInicioClick(Sender: TObject);
begin
  cds.First;
end;

procedure TPesquisaForm.btnProximoClick(Sender: TObject);
begin
  cds.Next;
end;

procedure TPesquisaForm.btnUltimoClick(Sender: TObject);
begin
  cds.Last;
end;

procedure TPesquisaForm.CBoxPesquisarChange(Sender: TObject);
begin
  btnConsultar.Enabled := not(CBoxPesquisar.ItemIndex > 0);
  AtualizaDescPesquisa;
end;

procedure TPesquisaForm.edNomeChange(Sender: TObject);
begin
  btnConsultar.Enabled := (Length(edNome.Text) >= 2) or not(CBoxPesquisar.ItemIndex > 0);
end;

procedure TPesquisaForm.Exibir(AFacade: Integer; ATable, AFieldID, AFieldDesc: String);
begin
  Table     := ATable;
  FieldID   := AFieldID;
  FieldDesc := AFieldDesc;
  Facade    := AFacade;

  AtualizaRegistro();
end;

procedure TPesquisaForm.FormActivate(Sender: TObject);
begin
  DateIni.Date := Now;
  DateFim.Date := Now;
  AtualizaDescPesquisa;
end;

procedure TPesquisaForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if not( key in['0'..'9',#08] ) and (CBoxPesquisar.ItemIndex = 0) then
    key:=#0;
end;

procedure TPesquisaForm.gridDblClick(Sender: TObject);
begin
  ID := ds.DataSet.Fields[0].AsInteger;
  Close;
end;

procedure TPesquisaForm.gridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if odd(ds.DataSet.RecNo) then
    grid.Canvas.Brush.Color:= clGradientInactiveCaption
  else
    grid.Canvas.Brush.Color:= clWindow;//clCream;

  TDbGrid(Sender).Canvas.font.Color:= clBlack;
  if gdSelected in State then
  with (Sender as TDBGrid).Canvas do
  begin
    Brush.Color := clHotLight;//$004080FF;
    FillRect(Rect);
    Font.Color:= clWindow;
    Font.Style := [fsbold]
  end;
  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
end;

procedure TPesquisaForm.ListaCliPopulaCDS;
var
  Cliente: TCliente;
begin
  PreparaFields;
  for Cliente in ListCli do
  begin
    cds.Append;
    cds.Fields[0].AsInteger := Cliente.Id;
    cds.Fields[1].AsString  := Cliente.Nome;
    cds.Post;
  end;
end;

procedure TPesquisaForm.ListaProdPopulaCDS;
var
  oProd: TProduto;
begin
  PreparaFields;
  for oProd in ListP do
  begin
    cds.Append;
    cds.Fields[0].AsInteger := oProd.Id;
    cds.Fields[1].AsString  := oProd.Descricao;
    cds.Post;
  end;
end;

procedure TPesquisaForm.PreparaFields;
begin
  cds.Close;
  cds.FieldDefs.Clear;
  cds.FieldDefs.Add(FieldID, ftInteger);
  cds.FieldDefs.Add(FieldDesc, ftString, 50);
  cds.CreateDataSet;
  cds.Active := True;
end;

end.
