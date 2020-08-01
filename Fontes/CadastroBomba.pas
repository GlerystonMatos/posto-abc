unit CadastroBomba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ToolWin, Util, Bomba, BombaBO,
  Vcl.Buttons;

type
  TFormCadastroBomba = class(TForm)
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
    LabelTanque: TLabel;
    EditCodigoTanque: TEdit;
    EditDescricaoTanque: TEdit;
    BitBtnConsultarTanque: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure ToolButtonNovoClick(Sender: TObject);
    procedure ToolButtonSalvarClick(Sender: TObject);
    procedure ToolButtonCancelarClick(Sender: TObject);
    procedure ToolButtonPesquisarClick(Sender: TObject);
    procedure ToolButtonExcluirClick(Sender: TObject);
    procedure BitBtnConsultarTanqueClick(Sender: TObject);
  private
    UltimoIdVisualizado :Integer;
    procedure ExibirUltimoRegistro;
    procedure ExibirRegistro(Bomba: TBomba);
    procedure SalvarBomba;
    function ValidarGravacao:Boolean;
  public
    { Public declarations }
  end;

var
  FormCadastroBomba: TFormCadastroBomba;

implementation

{$R *.dfm}

uses TanqueBO, ConsultaPadrao, Principal;

procedure TFormCadastroBomba.BitBtnConsultarTanqueClick(Sender: TObject);
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
      EditCodigoTanque.Text := Trim(IdSelecionado);
      EditDescricaoTanque.Text := Trim(DescricaoSelecionada);
    end;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroBomba.ExibirRegistro(Bomba: TBomba);
begin
  try
    if (Bomba <> nil) then
    begin
      UltimoIdVisualizado := Bomba.Id;
      EditCodigo.Text := IntToStr(Bomba.Id);
      EditDescricao.Text := Bomba.Descricao;
      EditCodigoTanque.Text := IntToStr(Bomba.Tanque.Id);
      EditDescricaoTanque.Text := Bomba.Tanque.Descricao;
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

procedure TFormCadastroBomba.ExibirUltimoRegistro;
var
  BombaBO: TBombaBO;
  Bomba: TBomba;
begin
  try
    BombaBO := TBombaBO.Create();
    Bomba := BombaBO.UltimaBomba();
    ExibirRegistro(Bomba);
    FreeAndNil(Bomba);
    FreeAndNil(BombaBO);
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroBomba.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    Action := caFree;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroBomba.FormDestroy(Sender: TObject);
begin
  try
    FormCadastroBomba := nil;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroBomba.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TFormCadastroBomba.FormShow(Sender: TObject);
begin
  try
    ExibirUltimoRegistro();
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroBomba.SalvarBomba;
var
  TanqueBO: TTanqueBO;
  BombaBO: TBombaBO;
  Bomba: TBomba;
begin
  try
    Bomba := TBomba.Create;

    if (Trim(EditCodigo.Text) = '') then
    begin
      Bomba.Id := 0;
    end
    else
    begin
      Bomba.Id := StrToInt(Trim(EditCodigo.Text));
    end;

    Bomba.Descricao := Trim(EditDescricao.Text);

    TanqueBO := TTanqueBO.Create;
    Bomba.Tanque := TanqueBO.ObterTanquePorId(StrToInt(Trim(EditCodigoTanque.Text)));
    FreeAndNil(TanqueBO);

    BombaBO := TBombaBO.Create;
    BombaBO.Salvar(Bomba);
    FreeAndNil(BombaBO);
    FreeAndNil(Bomba);
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroBomba.ToolButtonCancelarClick(Sender: TObject);
var
  BombaBO: TBombaBO;
  Bomba: TBomba;
begin
  try
    BombaBO := TBombaBO.Create();
    Bomba := BombaBO.ObterBombaPorId(UltimoIdVisualizado);
    ExibirRegistro(Bomba);
    FreeAndNil(Bomba);
    FreeAndNil(BombaBO);
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroBomba.ToolButtonExcluirClick(Sender: TObject);
var
  BombaBO: TBombaBO;
  Bomba: TBomba;
begin
  try
    if (Trim(EditCodigo.Text) = '') then
    begin
      TUtil.Mensagem('Selecione um bomba para poder realizar a exclusão');
      Exit;
    end;

    if not(TUtil.Confirmacao('Tem certeza que deseja excluir a bomba?')) then
    begin
      Exit;
    end;

    BombaBO := TBombaBO.Create();
    Bomba := TBomba.Create();
    Bomba.Id := StrToInt(Trim(EditCodigo.Text));
    BombaBO.Excluir(Bomba);
    FreeAndNil(Bomba);
    FreeAndNil(BombaBO);

    ExibirUltimoRegistro();
    TUtil.Mensagem('Bomba excluida com sucesso.');
  except on E: Exception do
    begin
      if (Pos('FK',UpperCase(E.Message)) > 0) then
      begin
        TUtil.Mensagem('A bomba não pode ser excluída pois a mesma possui referencias.');
      end
      else
      begin
        TUtil.Mensagem(e.Message);
      end;
    end;
  end;
end;

procedure TFormCadastroBomba.ToolButtonNovoClick(Sender: TObject);
begin
  try
    EditCodigo.Clear();
    EditDescricao.Clear();
    EditCodigoTanque.Clear();
    EditDescricaoTanque.Clear();
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroBomba.ToolButtonPesquisarClick(Sender: TObject);
var
  BombaBO: TBombaBO;
  Bomba: TBomba;
begin
  try
    if (FormConsultaPadrao = nil) then
    begin
      Application.CreateForm(TFormConsultaPadrao, FormConsultaPadrao);
    end;

    FormConsultaPadrao.TipoConsulta := ConsultaBomba;
    FormConsultaPadrao.ShowModal();

    if (Trim(IdSelecionado) <> '') then
    begin
      BombaBO := TBombaBO.Create();
      Bomba := BombaBO.ObterBombaPorId(StrToInt(IdSelecionado));
      ExibirRegistro(Bomba);
      FreeAndNil(Bomba);
      FreeAndNil(BombaBO);
    end;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroBomba.ToolButtonSalvarClick(Sender: TObject);
begin
  try
    if not(ValidarGravacao()) then
    begin
      Exit;
    end;

    SalvarBomba();

    if (Trim(EditCodigo.Text) = '') then
    begin
      ExibirUltimoRegistro();
    end;

    TUtil.Mensagem('Bomba gravada com sucesso.');
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

function TFormCadastroBomba.ValidarGravacao: Boolean;
begin
  try
    Result := False;

    if (Trim(EditDescricao.Text) = '') then
    begin
      TUtil.Mensagem('Informe a descrição da bomba.');
      EditDescricao.SetFocus;
      Exit;
    end;

    if (Trim(EditCodigoTanque.Text) = '') then
    begin
      TUtil.Mensagem('Selecione o tanque de combustível da bomba.');
      BitBtnConsultarTanque.SetFocus;
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
