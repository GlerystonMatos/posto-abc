unit AbastecimentoDAO;

interface

uses
  Data.SqlExpr, SysUtils, Forms, Windows, Util, Abastecimento;

type
  TAbastecimentoDAO = class
  private
    { private declarations }
  public
    procedure Salvar(Abastecimento: TAbastecimento);
  end;

implementation

{ TAbastecimentoDAO }

procedure TAbastecimentoDAO.Salvar(Abastecimento: TAbastecimento);
var
  Query: TSQLQuery;
begin
  try
    TUtil.CriarQuery(Query);

    Query.SQL.Add('INSERT INTO Abastecimento');
    Query.SQL.Add('           (Data');
    Query.SQL.Add('           ,BombaId');
    Query.SQL.Add('           ,Litros');
    Query.SQL.Add('           ,Valor');
    Query.SQL.Add('           ,Imposto)');
    Query.SQL.Add('     VALUES(:Data');
    Query.SQL.Add('           ,:BombaId');
    Query.SQL.Add('           ,:Litros');
    Query.SQL.Add('           ,:Valor');
    Query.SQL.Add('           ,:Imposto)');

    Query.ParamByName('Data').AsDateTime := Abastecimento.Data;
    Query.ParamByName('BombaId').AsInteger := Abastecimento.Bomba.Id;
    Query.ParamByName('Litros').AsCurrency := Abastecimento.Litros;
    Query.ParamByName('Valor').AsCurrency := Abastecimento.Valor;
    Query.ParamByName('Imposto').AsCurrency := Abastecimento.Imposto;

    Query.ExecSQL();

    TUtil.DestruirQuery(Query);
  except on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

end.

