unit CadastroAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls;

type
  TFormCadastroAbastecimento = class(TForm)
    LabelBomba: TLabel;
    EditBomba: TEdit;
    LabelTipo: TLabel;
    EditTipo: TEdit;
    Bevel01: TBevel;
    LabelMoeda01: TLabel;
    EditTotalPagar: TEdit;
    LabelTotalPagar: TLabel;
    LabelLitros: TLabel;
    EditLitros: TEdit;
    LabelMoeda02: TLabel;
    LabelPrecoLitro: TLabel;
    EditlPrecoLitro: TEdit;
    ComboBoxForma: TComboBox;
    Bevel1: TBevel;
    BitBtnNovoAbastecimento: TBitBtn;
    BitBtnIniciarAbastecimento: TBitBtn;
    StatusBar: TStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure ComboBoxFormaChange(Sender: TObject);
    procedure BitBtnNovoAbastecimentoClick(Sender: TObject);
    procedure EditLitrosKeyPress(Sender: TObject; var Key: Char);
    procedure EditTotalPagarKeyPress(Sender: TObject; var Key: Char);
    procedure EditLitrosChange(Sender: TObject);
    procedure EditTotalPagarChange(Sender: TObject);
    procedure BitBtnIniciarAbastecimentoClick(Sender: TObject);
  private
    FBombaId: Integer;
    procedure SetBombaId(const Value: Integer);

    procedure CarregarInformacoesBomba;
    procedure Abastecer;
    function ValidarAbastecimento:Boolean;
  public
    property BombaId: Integer read FBombaId write SetBombaId;
  end;

var
  FormCadastroAbastecimento: TFormCadastroAbastecimento;

implementation

{$R *.dfm}

uses Util, BombaBO, Bomba, Tanque, ConfiguracaoBO, Configuracao, Abastecimento,
  AbastecimentoBO;

procedure TFormCadastroAbastecimento.Abastecer;
var
  BombaBO :TBombaBO;

  ConfiguracaoBO :TConfiguracaoBO;
  Configuracao :TConfiguracao;

  AbastecimentoBO :TAbastecimentoBO;
  Abastecimento :TAbastecimento;
begin
  try
    BombaBO := TBombaBO.Create;

    ConfiguracaoBO := TConfiguracaoBO.Create;
    Configuracao := ConfiguracaoBO.ObterConfiguracao();
    FreeAndNil(ConfiguracaoBO);

    Abastecimento := TAbastecimento.Create;
    Abastecimento.Data := Date;
    Abastecimento.Bomba := BombaBO.ObterBombaPorId(BombaId);
    Abastecimento.Litros := TUtil.StringEmCurrency(Trim(EditLitros.Text));
    Abastecimento.Valor := TUtil.StringEmCurrency(Trim(EditTotalPagar.Text));
    Abastecimento.Imposto := ((Configuracao.ValorImposto * Abastecimento.Valor) / 100);

    AbastecimentoBO := TAbastecimentoBO.Create;
    AbastecimentoBO.Salvar(Abastecimento);
    FreeAndNil(AbastecimentoBO);

    FreeAndNil(BombaBO);
    FreeAndNil(Abastecimento);
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroAbastecimento.BitBtnIniciarAbastecimentoClick(Sender: TObject);
begin
  try
    if not(ValidarAbastecimento()) then
    begin
      Exit;
    end;

    Abastecer();

    TUtil.Mensagem('Abastecimento realizado com sucesso.');

    if not(TUtil.Confirmacao('Deseja realizar outro abastecimento?')) then
    begin
      Close;
    end;

    BitBtnNovoAbastecimentoClick(Sender);
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroAbastecimento.BitBtnNovoAbastecimentoClick(Sender: TObject);
begin
  try
    if (Sender = BitBtnNovoAbastecimento) then
    begin
      if not(TUtil.Confirmacao('Confirmar início de um novo abastecimento?')) then
      begin
        Exit;
      end;
    end;

    ComboBoxForma.ItemIndex := 0;
    ComboBoxFormaChange(Sender);
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroAbastecimento.CarregarInformacoesBomba;
var
  BombaBO: TBombaBO;
  Bomba :TBomba;
  ConfiguracaoBO :TConfiguracaoBO;
  Configuracao :TConfiguracao;
begin
  try
    BombaBO := TBombaBO.Create;
    Bomba := BombaBO.ObterBombaPorId(BombaId);
    FreeAndNil(BombaBO);

    ConfiguracaoBO := TConfiguracaoBO.Create;
    Configuracao := ConfiguracaoBO.ObterConfiguracao();
    FreeAndNil(ConfiguracaoBO);

    EditBomba.Text := Trim(Bomba.Descricao);

    case (Bomba.Tanque.Tipo) of
      Gasolina : begin
                   EditTipo.Text := 'Gasolina';
                   EditlPrecoLitro.Text := FormatFloat('#,##0.00',Configuracao.ValorLitroGasolina);
                 end;
      OleoDiesel : begin
                     EditTipo.Text := 'Óleo Diesel';
                     EditlPrecoLitro.Text := FormatFloat('#,##0.00',Configuracao.ValorLitroOleoDiesel);
                   end;
    end;

    FreeAndNil(Bomba);
    FreeAndNil(Configuracao);
    ComboBoxForma.SetFocus;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroAbastecimento.ComboBoxFormaChange(Sender: TObject);
begin
  try
    case (ComboBoxForma.ItemIndex) of
      0 : begin
            EditTotalPagar.Enabled := False;
            EditTotalPagar.Color := clBtnFace;
            EditTotalPagar.Text := '0,00';

            EditLitros.Enabled := False;
            EditLitros.Color := clBtnFace;
            EditLitros.Text := '0,00';

            ComboBoxForma.SetFocus;
          end;
      1 : begin
            EditTotalPagar.Enabled := False;
            EditTotalPagar.Color := clBtnFace;
            EditTotalPagar.Text := '0,00';

            EditLitros.Enabled := True;
            EditLitros.Color := clWindow;
            EditLitros.Text := '0,00';

            EditLitros.SetFocus();
          end;
      2 : begin
            EditTotalPagar.Enabled := True;
            EditTotalPagar.Color := clWindow;
            EditTotalPagar.Text := '0,00';

            EditLitros.Enabled := False;
            EditLitros.Color := clBtnFace;
            EditLitros.Text := '0,00';

            EditTotalPagar.SetFocus();
          end;
    end;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroAbastecimento.EditLitrosChange(Sender: TObject);
begin
  try
    if not(EditLitros.Enabled) then
    begin
      Exit;
    end;

    if (Trim(EditLitros.Text) = '') then
    begin
      EditLitros.Text := '0,00';
      EditTotalPagar.Text := '0,00';
      Exit;
    end;

    EditTotalPagar.Text := FormatFloat('#,##0.00', TUtil.StringEmCurrency(Trim(EditLitros.Text)) * TUtil.StringEmCurrency(Trim(EditlPrecoLitro.Text)));
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroAbastecimento.EditLitrosKeyPress(Sender: TObject; var Key: Char);
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

procedure TFormCadastroAbastecimento.EditTotalPagarChange(Sender: TObject);
begin
  try
    if not(EditTotalPagar.Enabled) then
    begin
      Exit;
    end;

    if (Trim(EditTotalPagar.Text) = '') then
    begin
      EditLitros.Text := '0,00';
      EditTotalPagar.Text := '0,00';
      Exit
    end;

    EditLitros.Text := FormatFloat('#,##0.00', TUtil.StringEmCurrency(Trim(EditTotalPagar.Text)) / TUtil.StringEmCurrency(Trim(EditlPrecoLitro.Text)));
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroAbastecimento.EditTotalPagarKeyPress(Sender: TObject; var Key: Char);
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

procedure TFormCadastroAbastecimento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    Action := caFree;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroAbastecimento.FormDestroy(Sender: TObject);
begin
  try
    FormCadastroAbastecimento := nil;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroAbastecimento.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  try
    case (Key) of
      VK_ESCAPE : Close;
    end;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroAbastecimento.FormShow(Sender: TObject);
begin
  try
    CarregarInformacoesBomba();
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormCadastroAbastecimento.SetBombaId(const Value: Integer);
begin
  FBombaId := Value;
end;

function TFormCadastroAbastecimento.ValidarAbastecimento: Boolean;
begin
  try
    Result := False;

    if (ComboBoxForma.ItemIndex = 0) then
    begin
      TUtil.Mensagem('Selecione a forma do abastecimento.');
      ComboBoxForma.SetFocus;
      Exit;
    end;

    case (ComboBoxForma.ItemIndex) of
      1 : begin
            if (Trim(EditLitros.Text) = '0,00') then
            begin
              TUtil.Mensagem('Informe a quantidade de litros do abastecimento.');
              EditLitros.SetFocus;
              Exit;
            end;
          end;
      2 : begin
            if (Trim(EditTotalPagar.Text) = '0,00') then
            begin
              TUtil.Mensagem('Informe o valor a pagar do abastecimento.');
              EditTotalPagar.SetFocus;
              Exit;
            end;
          end;
    end;

    Result := True;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

end.
