unit Teste.CadastroPadrao.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB;

type
  TCadastroPadraoForm = class(TForm)
    lblID: TLabel;
    EdID: TEdit;
    pnBtn: TPanel;
    btnFechar: TSpeedButton;
    btnConsultar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnIncluir: TSpeedButton;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FAlteracao: Boolean;
    procedure HabilitaBotoes(State: TDataSetState);
    procedure HabilitarCampos(AHabilitar: Boolean);
    procedure LimparCampos;
  end;

var
  CadastroPadraoForm: TCadastroPadraoForm;

implementation

{$R *.dfm}

{ TCadastroPadraoForm }

procedure TCadastroPadraoForm.btnAlterarClick(Sender: TObject);
begin
  btnAlterar.Enabled := False;
  HabilitaBotoes(dsEdit);
  HabilitarCampos(True);
  FAlteracao := True;
end;

procedure TCadastroPadraoForm.btnCancelarClick(Sender: TObject);
begin
  HabilitaBotoes(dsBrowse);
  btnAlterar.Enabled := False;
  btnExcluir.Enabled := False;
  LimparCampos;
  HabilitarCampos(False);
end;

procedure TCadastroPadraoForm.btnConsultarClick(Sender: TObject);
begin
  LimparCampos;
  HabilitaBotoes(dsBrowse);
  HabilitarCampos(False);
  btnAlterar.Enabled := True;
  btnExcluir.Enabled := True;
//  if Length(Trim(edCodigo.Text)) > 0 then
//    LimparCampos;
end;

procedure TCadastroPadraoForm.btnExcluirClick(Sender: TObject);
begin
  HabilitaBotoes(dsBrowse);
  HabilitarCampos(False);
  LimparCampos;
end;

procedure TCadastroPadraoForm.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TCadastroPadraoForm.btnIncluirClick(Sender: TObject);
begin
  HabilitaBotoes(dsInsert);
  LimparCampos;
  HabilitarCampos(True);
  FAlteracao := False;
end;

procedure TCadastroPadraoForm.btnSalvarClick(Sender: TObject);
begin
  HabilitaBotoes(dsBrowse);
  HabilitarCampos(False);
  LimparCampos;
end;

procedure TCadastroPadraoForm.FormActivate(Sender: TObject);
begin
  FAlteracao := False;
end;

procedure TCadastroPadraoForm.FormCreate(Sender: TObject);
begin
  HabilitaBotoes(dsBrowse);
end;

procedure TCadastroPadraoForm.HabilitaBotoes(State: TDataSetState);
begin
  btnIncluir.Enabled := State in [dsBrowse, dsInactive];
  btnConsultar.Enabled := State in [dsBrowse];
  btnAlterar.Enabled := False;
  btnSalvar.Enabled := State in [dsEdit, dsInsert];
  btnExcluir.Enabled := False;
  btnCancelar.Enabled := State in [dsEdit, dsInsert];
  btnFechar.Enabled := State in [dsBrowse, dsInactive];
end;

procedure TCadastroPadraoForm.HabilitarCampos(AHabilitar: Boolean);
var
  I : Integer;
begin
  for I := 1 to ComponentCount -1 do
  begin
    if (Components[I] is Tedit) and not(Components[I].Name = 'edCodigo') then
      (Components[I] as TEdit).Enabled := AHabilitar;
    if Components[I] is TMemo then
      (Components[I] as TMemo).Enabled := AHabilitar;
    if (Components[I] is TComboBox) then
      (Components[I] as TComboBox).Enabled := AHabilitar;
    if (Components[I] is TCheckBox) then
      (Components[I] as TCheckBox).Enabled := AHabilitar;
  end;
  EdID.Enabled := False;
end;

procedure TCadastroPadraoForm.LimparCampos;
var
  I : Integer;
begin
  for I := 1 to ComponentCount -1 do
  begin
    if Components[I] is TEdit then
      (Components[I] as TEdit).clear;
    if Components[I] is TMemo then
      (Components[I] as TMemo).clear;
    if Components[I] is TCheckBox then
      (Components[I] as TCheckBox).Checked := False;
//    if Components[I] is TComboBox then
//      (Components[I] as TComboBox).Clear;
  end;
end;

end.
