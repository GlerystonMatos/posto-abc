unit CadastroTanque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Util, Tanque, TanqueBO;

type
  TFormCadastroTanque = class(TForm)
    ToolBar: TToolBar;
    ToolButtonNovo: TToolButton;
    ToolButton01: TToolButton;
    ToolButtonSalvar: TToolButton;
    ToolButtonCancelar: TToolButton;
    ToolButton02: TToolButton;
    ToolButtonPesquisar: TToolButton;
    ToolButton03: TToolButton;
    ToolButtonExcluir: TToolButton;
    LabelCodigo: TLabel;
    EditCodigo: TEdit;
    LabelDescricao: TLabel;
    EditDescricao: TEdit;
    StatusBar: TStatusBar;
    LabelTipoConbustivel: TLabel;
    ComboBoxTipo: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure ToolButtonNovoClick(Sender: TObject);
    procedure ToolButtonSalvarClick(Sender: TObject);
    procedure ToolButtonCancelarClick(Sender: TObject);
    procedure ToolButtonPesquisarClick(Sender: TObject);
    procedure ToolButtonExcluirClick(Sender: TObject);
  private
    UltimoIdVisualizado :Integer;
    procedure ExibirUltimoRegistro;
    procedure ExibirRegistro(Tanque: TTanque);
    procedure SalvarTanque;
    function ValidarGravacao:Boolean;
  public
    { Public declarations }
  end;

var
  FormCadastroTanque: TFormCadastroTanque;

implementation

{$R *.dfm}

uses ConsultaPadrao, Principal;

procedure TFormCadastroTanque.ExibirRegistro(Tanque: TTanque);
begin
  try
    if (Tanque <> nil) then
    begin
      UltimoIdVisualizado := Tanque.Id;
      EditCodigo.Text := IntToStr(Tanque.Id);
      EditDescricao.Text := Tanque.Descricao;

      case (Tanque.Tipo) of
        Gasolina : ComboBoxTipo.ItemIndex := 1;
        OleoDiesel : ComboBoxTipo.ItemIndex := 2;
      end;
    end
    else
    begin
      ToolButtonNovo.Click();
    end;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroTanque.ExibirUltimoRegistro;
var
  TanqueBO: TTanqueBO;
  Tanque: TTanque;
begin
  try
    TanqueBO := TTanqueBO.Create();
    Tanque := TanqueBO.UltimoTanque();
    ExibirRegistro(Tanque);
    FreeAndNil(Tanque);
    FreeAndNil(TanqueBO);
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroTanque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    Action := caFree;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroTanque.FormDestroy(Sender: TObject);
begin
  try
    FormCadastroTanque := nil;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroTanque.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  try
    case (Key) of
      VK_F2 : ToolButtonNovo.Click();
      VK_F3 : ToolButtonSalvar.Click();
      VK_F4 : ToolButtonCancelar.Click();
      VK_F5 : ToolButtonPesquisar.Click();
      VK_F6 : ToolButtonExcluir.Click();
      VK_ESCAPE : Close;
    end;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroTanque.FormShow(Sender: TObject);
begin
  try
    ExibirUltimoRegistro();
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroTanque.SalvarTanque;
var
  TanqueBO: TTanqueBO;
  Tanque: TTanque;
begin
  try
    Tanque := TTanque.Create;

    if (Trim(EditCodigo.Text) = '') then
    begin
      Tanque.Id := 0;
    end
    else
    begin
      Tanque.Id := StrToInt(Trim(EditCodigo.Text));
    end;

    Tanque.Descricao := Trim(EditDescricao.Text);

    case (ComboBoxTipo.ItemIndex) of
      1 : Tanque.Tipo := Gasolina;
      2 : Tanque.Tipo := OleoDiesel;
    end;  

    TanqueBO := TTanqueBO.Create;
    TanqueBO.Salvar(Tanque);
    FreeAndNil(TanqueBO);
    FreeAndNil(Tanque);
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroTanque.ToolButtonCancelarClick(Sender: TObject);
var
  TanqueBO: TTanqueBO;
  Tanque: TTanque;
begin
  try
    TanqueBO := TTanqueBO.Create();
    Tanque := TanqueBO.ObterTanquePorId(UltimoIdVisualizado);
    ExibirRegistro(Tanque);
    FreeAndNil(Tanque);
    FreeAndNil(TanqueBO);
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroTanque.ToolButtonExcluirClick(Sender: TObject);
var
  TanqueBO: TTanqueBO;
  Tanque: TTanque;
begin
  try
    if (Trim(EditCodigo.Text) = '') then
    begin
      TUtil.Mensagem('Selecione um tanque para poder realizar a exclusão');
      Exit;
    end;

    if not(TUtil.Confirmacao('Tem certeza que deseja excluir o tanque?')) then
    begin
      Exit;
    end;

    TanqueBO := TTanqueBO.Create();
    Tanque := TTanque.Create();
    Tanque.Id := StrToInt(Trim(EditCodigo.Text));
    TanqueBO.Excluir(Tanque);
    FreeAndNil(Tanque);
    FreeAndNil(TanqueBO);

    ExibirUltimoRegistro();
    TUtil.Mensagem('Tanque excluido com sucesso.');
  except on E: Exception do
    begin
      if (Pos('FK',UpperCase(E.Message)) > 0) then
      begin
        TUtil.Mensagem('O tanque não pode ser excluído pois o mesmo possui referencias.');
      end
      else
      begin      
        TUtil.Mensagem(e.Message);
      end;
    end;
  end;
end;

procedure TFormCadastroTanque.ToolButtonNovoClick(Sender: TObject);
begin
  try
    EditCodigo.Clear();
    EditDescricao.Clear();
    ComboBoxTipo.ItemIndex := 0;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroTanque.ToolButtonPesquisarClick(Sender: TObject);
var
  TanqueBO: TTanqueBO;
  Tanque: TTanque;
begin
  try
    if (FormConsultaPadrao = nil) then
    begin
      Application.CreateForm(TFormConsultaPadrao, FormConsultaPadrao);
    end;

    FormConsultaPadrao.TipoConsulta := ConsultaTanque;
    FormConsultaPadrao.ShowModal();

    if (Trim(IdSelecionado) <> '') then
    begin
      TanqueBO := TTanqueBO.Create();
      Tanque := TanqueBO.ObterTanquePorId(StrToInt(IdSelecionado));
      ExibirRegistro(Tanque);
      FreeAndNil(Tanque);
      FreeAndNil(TanqueBO);
    end;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroTanque.ToolButtonSalvarClick(Sender: TObject);
begin
  try
    if not(ValidarGravacao()) then
    begin
      Exit;
    end;

    SalvarTanque();

    if (Trim(EditCodigo.Text) = '') then
    begin
      ExibirUltimoRegistro();
    end;

    TUtil.Mensagem('Tanque gravado com sucesso.');
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

function TFormCadastroTanque.ValidarGravacao: Boolean;
begin
  try
    Result := False;

    if (Trim(EditDescricao.Text) = '') then
    begin
      TUtil.Mensagem('Informe a descrição do tanque.');
      EditDescricao.SetFocus;
      Exit;
    end;

    if (ComboBoxTipo.ItemIndex = 0) then
    begin
      TUtil.Mensagem('Selecione o tipo de combustível do tanque.');
      ComboBoxTipo.SetFocus;
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
