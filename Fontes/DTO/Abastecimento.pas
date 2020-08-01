unit Abastecimento;

interface

uses Bomba;

type
  TAbastecimento = class
  private
    FBomba: TBomba;
    FValor: Currency;
    FId: Integer;
    FLitros: Currency;
    FImposto: Currency;
    FData: TDateTime;
    procedure SetBomba(const Value: TBomba);
    procedure SetData(const Value: TDateTime);
    procedure SetId(const Value: Integer);
    procedure SetImposto(const Value: Currency);
    procedure SetLitros(const Value: Currency);
    procedure SetValor(const Value: Currency);
  public
    property Id: Integer read FId write SetId;
    property Data: TDateTime read FData write SetData;
    property Bomba: TBomba read FBomba write SetBomba;
    property Litros: Currency read FLitros write SetLitros;
    property Valor: Currency read FValor write SetValor;
    property Imposto: Currency read FImposto write SetImposto;
  end;

implementation

{ TAbastecimento }

procedure TAbastecimento.SetBomba(const Value: TBomba);
begin
  FBomba := Value;
end;

procedure TAbastecimento.SetData(const Value: TDateTime);
begin
  FData := Value;
end;

procedure TAbastecimento.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TAbastecimento.SetImposto(const Value: Currency);
begin
  FImposto := Value;
end;

procedure TAbastecimento.SetLitros(const Value: Currency);
begin
  FLitros := Value;
end;

procedure TAbastecimento.SetValor(const Value: Currency);
begin
  FValor := Value;
end;

end.
