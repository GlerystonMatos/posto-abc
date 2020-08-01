unit Tanque;

interface

type
  TTipoConbustivel = (Gasolina, OleoDiesel);

  TTanque = class
  private
    FDescricao: String;
    FId: Integer;
    FTipo: TTipoConbustivel;
    procedure SetDescricao(const Value: String);
    procedure SetId(const Value: Integer);
    procedure SetTipo(const Value: TTipoConbustivel);
  public
    property Id: Integer read FId write SetId;
    property Descricao: String read FDescricao write SetDescricao;
    property Tipo: TTipoConbustivel read FTipo write SetTipo;
  end;

implementation

{ TTanque }

procedure TTanque.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TTanque.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TTanque.SetTipo(const Value: TTipoConbustivel);
begin
  FTipo := Value;
end;

end.
