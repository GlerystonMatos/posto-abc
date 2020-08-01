unit ConfiguracaoDAO;

interface

uses
  Data.SqlExpr, SysUtils, Forms, Windows, Util, Configuracao;

type
  TConfiguracaoDAO = class
  private
    { private declarations }
  public
    function ObterConfiguracao:TConfiguracao;
    procedure Salvar(Configuracao: TConfiguracao);
  end;

implementation

{ TConfiguracaoDAO }

function TConfiguracaoDAO.ObterConfiguracao: TConfiguracao;
var
  Query: TSQLQuery;
  Configuracao: TConfiguracao;
begin
  try
    TUtil.CriarQuery(Query);

    Query.SQL.Add('SELECT c.Id');
    Query.SQL.Add('      ,c.ValorLitroGasolina');
    Query.SQL.Add('      ,c.ValorLitroOleoDiesel');
    Query.SQL.Add('      ,c.ValorImposto');
    Query.SQL.Add('  FROM Configuracao c');
    Query.SQL.Add(' WHERE c.Id = 1');

    Query.Open();

    if not(Query.IsEmpty) then
    begin
      Configuracao := TConfiguracao.Create;
      Configuracao.Id := Query.FieldByName('Id').AsInteger;
      Configuracao.ValorLitroGasolina := Query.FieldByName('ValorLitroGasolina').AsCurrency;
      Configuracao.ValorLitroOleoDiesel := Query.FieldByName('ValorLitroOleoDiesel').AsCurrency;
      Configuracao.ValorImposto := Query.FieldByName('ValorImposto').AsCurrency;

      Result := Configuracao;
    end
    else
    begin
      Result := nil;
    end;

    TUtil.DestruirQuery(Query);
  except on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TConfiguracaoDAO.Salvar(Configuracao: TConfiguracao);
var
  Query: TSQLQuery;
begin
  try
    TUtil.CriarQuery(Query);

    Query.SQL.Add('UPDATE Configuracao');
    Query.SQL.Add('   SET ValorLitroGasolina = :ValorLitroGasolina');
    Query.SQL.Add('      ,ValorLitroOleoDiesel = :ValorLitroOleoDiesel');
    Query.SQL.Add('      ,ValorImposto = :ValorImposto');
    Query.SQL.Add(' WHERE Id = 1');

    Query.ParamByName('ValorLitroGasolina').AsCurrency := Configuracao.ValorLitroGasolina;
    Query.ParamByName('ValorLitroOleoDiesel').AsCurrency := Configuracao.ValorLitroOleoDiesel;
    Query.ParamByName('ValorImposto').AsCurrency := Configuracao.ValorImposto;

    Query.ExecSQL();

    TUtil.DestruirQuery(Query);
  except on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

end.

