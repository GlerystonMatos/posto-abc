unit Configuracao;

interface

type
  TConfiguracao = class
  private
    FValorImposto: Currency;
    FValorLitroOleoDiesel: Currency;
    FValorLitroGasolina: Currency;
    FId: Integer;
    procedure SetId(const Value: Integer);
    procedure SetValorImposto(const Value: Currency);
    procedure SetValorLitroGasolina(const Value: Currency);
    procedure SetValorLitroOleoDiesel(const Value: Currency);
  public
    property Id: Integer read FId write SetId;
    property ValorLitroGasolina: Currency read FValorLitroGasolina write SetValorLitroGasolina;
    property ValorLitroOleoDiesel: Currency read FValorLitroOleoDiesel write SetValorLitroOleoDiesel;
    property ValorImposto: Currency read FValorImposto write SetValorImposto;
  end;

implementation

{ TConfiguracao }

procedure TConfiguracao.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TConfiguracao.SetValorImposto(const Value: Currency);
begin
  FValorImposto := Value;
end;

procedure TConfiguracao.SetValorLitroGasolina(const Value: Currency);
begin
  FValorLitroGasolina := Value;
end;

procedure TConfiguracao.SetValorLitroOleoDiesel(const Value: Currency);
begin
  FValorLitroOleoDiesel := Value;
end;

end.
