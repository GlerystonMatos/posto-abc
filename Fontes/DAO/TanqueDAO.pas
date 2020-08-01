unit TanqueDAO;

interface

uses
  Data.SqlExpr, SysUtils, Forms, Windows, Util, Tanque;

type
  TTanqueDAO = class
  private
    { private declarations }
  public
    function ObterListaTanques(Descricao: String = ''):TSQLQuery;
    function ObterTanquePorId(Id :Integer):TTanque;
    function UltimoTanque:TTanque;
    procedure Salvar(Tanque: TTAnque);
    procedure Excluir(Tanque: TTanque);
  end;

implementation

{ TTanqueDAO }

procedure TTanqueDAO.Excluir(Tanque: TTanque);
var
  Query: TSQLQuery;
begin
  try
    TUtil.CriarQuery(Query);

    Query.SQL.Add('DELETE FROM Tanque');
    Query.SQL.Add(' WHERE Id = :Id');

    Query.ParamByName('Id').AsInteger := Tanque.Id;

    Query.ExecSQL();

    TUtil.DestruirQuery(Query);
  except on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

function TTanqueDAO.ObterListaTanques(Descricao: String = ''): TSQLQuery;
var
  Query: TSQLQuery;
begin
  try
    TUtil.CriarQuery(Query);

    Query.SQL.Add('SELECT t.Id');
    Query.SQL.Add('      ,t.Descricao');
    Query.SQL.Add('      ,t.Tipo');
    Query.SQL.Add('  FROM Tanque t');

    if (Trim(Descricao) <> '') then
    begin
      Query.SQL.Add(' WHERE t.Descricao LIKE ''%'+Trim(Descricao)+'%''');
    end;

    Query.SQL.Add(' ORDER BY t.Id');

    Query.Open();

    if not(Query.IsEmpty) then
    begin
      Result := Query;
    end
    else
    begin
      Result := nil;
      TUtil.DestruirQuery(Query);
    end;
  except on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

function TTanqueDAO.ObterTanquePorId(Id: Integer): TTanque;
var
  Query: TSQLQuery;
  Tanque: TTanque;
begin
  try
    TUtil.CriarQuery(Query);

    Query.SQL.Add('SELECT t.Id');
    Query.SQL.Add('      ,t.Descricao');
    Query.SQL.Add('      ,t.Tipo');
    Query.SQL.Add('  FROM Tanque t');
    Query.SQL.Add(' WHERE t.Id = :Id');

    Query.ParamByName('Id').AsInteger := Id;

    Query.Open();

    if not(Query.IsEmpty) then
    begin
      Tanque := TTanque.Create;
      Tanque.Id := Query.FieldByName('Id').AsInteger;
      Tanque.Descricao := Trim(Query.FieldByName('Descricao').AsString);

      case (Query.FieldByName('Tipo').AsInteger) of
        0 : Tanque.Tipo := Gasolina;
        1 : Tanque.Tipo := OleoDiesel;
      end;

      Result := Tanque;
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

procedure TTanqueDAO.Salvar(Tanque: TTAnque);
var
  Query: TSQLQuery;
begin
  try
    TUtil.CriarQuery(Query);

    if (Tanque.Id = 0) then
    begin
      Query.SQL.Add('INSERT INTO Tanque');
      Query.SQL.Add('           (Descricao');
      Query.SQL.Add('           ,Tipo)');
      Query.SQL.Add('     VALUES(:Descricao');
      Query.SQL.Add('           ,:Tipo)');
    end
    else
    begin
      Query.SQL.Add('UPDATE Tanque');
      Query.SQL.Add('   SET Descricao = :Descricao');
      Query.SQL.Add('      ,Tipo = :Tipo');
      Query.SQL.Add(' WHERE Id = :Id');

      Query.ParamByName('Id').AsInteger := Tanque.Id;
    end;

    Query.ParamByName('Descricao').AsString := Tanque.Descricao;

    case (Tanque.Tipo) of
      Gasolina : Query.ParamByName('Tipo').AsInteger := 0;
      OleoDiesel : Query.ParamByName('Tipo').AsInteger := 1;
    end;

    Query.ExecSQL();

    TUtil.DestruirQuery(Query);
  except on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

function TTanqueDAO.UltimoTanque: TTanque;
var
  Query: TSQLQuery;
  Tanque: TTanque;
begin
  try
    TUtil.CriarQuery(Query);

    Query.SQL.Add('SELECT t.Id');
    Query.SQL.Add('      ,t.Descricao');
    Query.SQL.Add('      ,t.Tipo');
    Query.SQL.Add('  FROM Tanque t');
    Query.SQL.Add(' WHERE t.Id = (SELECT MAX(Id)');
    Query.SQL.Add('                 FROM Tanque)');

    Query.Open();

    if not(Query.IsEmpty) then
    begin
      Tanque := TTanque.Create;
      Tanque.Id := Query.FieldByName('Id').AsInteger;
      Tanque.Descricao := Trim(Query.FieldByName('Descricao').AsString);

      case (Query.FieldByName('Tipo').AsInteger) of
        0 : Tanque.Tipo := Gasolina;
        1 : Tanque.Tipo := OleoDiesel;
      end;

      Result := Tanque;
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

end.

