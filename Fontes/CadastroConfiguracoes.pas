unit CadastroConfiguracoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls;

type
  TFormCadastroConfiguracoes = class(TForm)
    ToolBar: TToolBar;
    ToolButtonSalvar: TToolButton;
    StatusBar: TStatusBar;
    LabelValorLitroGasolina: TLabel;
    EditValorLitroGasolina: TEdit;
    LabelMoeda01: TLabel;
    LabelMoeda02: TLabel;
    EditValorLitroOleoDiesel: TEdit;
    LabelValorLitroOleoDiesel: TLabel;
    LabelPercentual: TLabel;
    EditValorIimpostoAbastecimento: TEdit;
    LabelValorImpostoAbastecimento: TLabel;
    ToolButton01: TToolButton;
    ToolButtonCancelar: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure EditValorLitroGasolinaKeyPress(Sender: TObject; var Key: Char);
    procedure EditValorLitroOleoDieselKeyPress(Sender: TObject; var Key: Char);
    procedure EditValorIimpostoAbastecimentoKeyPress(Sender: TObject; var Key: Char);
    procedure ToolButtonSalvarClick(Sender: TObject);
    procedure EditValorLitroGasolinaChange(Sender: TObject);
    procedure EditValorLitroOleoDieselChange(Sender: TObject);
    procedure EditValorIimpostoAbastecimentoChange(Sender: TObject);
    procedure ToolButtonCancelarClick(Sender: TObject);
  private
    procedure CarregarConfiguracao;
    procedure SalvarConfiguracao;
    function ValidarGravacao:Boolean;
  public
    { Public declarations }
  end;

var
  FormCadastroConfiguracoes: TFormCadastroConfiguracoes;

implementation

{$R *.dfm}

uses Util, ConfiguracaoBO, Configuracao;

procedure TFormCadastroConfiguracoes.CarregarConfiguracao;
var
  ConfiguracaoBO :TConfiguracaoBO;
  Configuracao :TConfiguracao;
begin
  try
    ConfiguracaoBO := TConfiguracaoBO.Create;
    Configuracao := ConfiguracaoBO.ObterConfiguracao();
    FreeAndNil(ConfiguracaoBO);

    EditValorLitroGasolina.Text := FormatFloat('#,##0.00', Configuracao.ValorLitroGasolina);
    EditValorLitroOleoDiesel.Text := FormatFloat('#,##0.00', Configuracao.ValorLitroOleoDiesel);
    EditValorIimpostoAbastecimento.Text := FormatFloat('#,##0.00', Configuracao.ValorImposto);

    FreeAndNil(Configuracao);
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroConfiguracoes.EditValorIimpostoAbastecimentoChange(Sender: TObject);
begin
  try
    if (Trim(EditValorIimpostoAbastecimento.Text) = '') then
    begin
      EditValorIimpostoAbastecimento.Text := '0,00';
      Exit
    end;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroConfiguracoes.EditValorIimpostoAbastecimentoKeyPress(Sender: TObject; var Key: Char);
begin
  try
    if not(Key in ['0'..'9',Char(8),Char(44)]) then
    begin
      Key := #0;
    end;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroConfiguracoes.EditValorLitroGasolinaChange(Sender: TObject);
begin
  try
    if (Trim(EditValorLitroGasolina.Text) = '') then
    begin
      EditValorLitroGasolina.Text := '0,00';
      Exit
    end;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroConfiguracoes.EditValorLitroGasolinaKeyPress(Sender: TObject; var Key: Char);
begin
  try
    if not(Key in ['0'..'9',Char(8),Char(44)]) then
    begin
      Key := #0;
    end;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroConfiguracoes.EditValorLitroOleoDieselChange(Sender: TObject);
begin
  try
    if (Trim(EditValorLitroOleoDiesel.Text) = '') then
    begin
      EditValorLitroOleoDiesel.Text := '0,00';
      Exit
    end;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroConfiguracoes.EditValorLitroOleoDieselKeyPress(Sender: TObject; var Key: Char);
begin
  try
    if not(Key in ['0'..'9',Char(8),Char(44)]) then
    begin
      Key := #0;
    end;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroConfiguracoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    Action := caFree;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroConfiguracoes.FormDestroy(Sender: TObject);
begin
  try
    FormCadastroConfiguracoes := nil;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroConfiguracoes.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  try
    case (Key) of
      VK_F3 : ToolButtonSalvar.Click();
      VK_ESCAPE : Close;
    end;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroConfiguracoes.FormShow(Sender: TObject);
begin
  try
    CarregarConfiguracao();
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroConfiguracoes.SalvarConfiguracao;
var
  ConfiguracaoBO: TConfiguracaoBO;
  Configuracao: TConfiguracao;
begin
  try
    Configuracao := TConfiguracao.Create;
    Configuracao.ValorLitroGasolina := TUtil.StringEmCurrency(Trim(EditValorLitroGasolina.Text));
    Configuracao.ValorLitroOleoDiesel := TUtil.StringEmCurrency(Trim(EditValorLitroOleoDiesel.Text));
    Configuracao.ValorImposto := TUtil.StringEmCurrency(Trim(EditValorIimpostoAbastecimento.Text));

    ConfiguracaoBO := TConfiguracaoBO.Create;
    ConfiguracaoBO.Salvar(Configuracao);
    FreeAndNil(ConfiguracaoBO);
    FreeAndNil(Configuracao);
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroConfiguracoes.ToolButtonCancelarClick(Sender: TObject);
begin
  try
    CarregarConfiguracao();
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroConfiguracoes.ToolButtonSalvarClick(Sender: TObject);
begin
  try
    EditValorLitroGasolinaChange(Sender);
    EditValorLitroOleoDieselChange(Sender);
    EditValorIimpostoAbastecimentoChange(Sender);
  
    if not(ValidarGravacao()) then
    begin
      Exit;
    end;

    SalvarConfiguracao();

    TUtil.Mensagem('Configuração gravada com sucesso.');
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

function TFormCadastroConfiguracoes.ValidarGravacao: Boolean;
begin
  try
    Result := False;

    if (Trim(EditValorLitroGasolina.Text) = '0,00') or (Trim(EditValorLitroGasolina.Text) = '0') then
    begin
      TUtil.Mensagem('Informe o valor do litro da gasolina.');
      EditValorLitroGasolina.SetFocus;
      Exit;
    end;

    if (Trim(EditValorLitroOleoDiesel.Text) = '0,00') or (Trim(EditValorLitroOleoDiesel.Text) = '0') then
    begin
      TUtil.Mensagem('Informe o valor do litro do óleo diesel.');
      EditValorLitroOleoDiesel.SetFocus;
      Exit;
    end;

    if (Trim(EditValorIimpostoAbastecimento.Text) = '0,00') or (Trim(EditValorIimpostoAbastecimento.Text) = '0') then
    begin
      TUtil.Mensagem('Informe o valor do imposto sobre o abastecimento.');
      EditValorIimpostoAbastecimento.SetFocus;
      Exit;
    end;

    Result := True;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

end.
