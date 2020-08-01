unit Bomba;

interface

uses Tanque;

type
  TBomba = class
  private
    FDescricao: String;
    FId: Integer;
    FTanque: TTanque;
    procedure SetDescricao(const Value: String);
    procedure SetId(const Value: Integer);
    procedure SetTanque(const Value: TTanque);
  public
    property Id: Integer read FId write SetId;
    property Descricao: String read FDescricao write SetDescricao;
    property Tanque: TTanque read FTanque write SetTanque;
  end;

implementation

{ TBomba }

procedure TBomba.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TBomba.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TBomba.SetTanque(const Value: TTanque);
begin
  FTanque := Value;
end;

end.
