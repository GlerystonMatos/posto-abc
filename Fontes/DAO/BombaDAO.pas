unit BombaDAO;

interface

uses
  Data.SqlExpr, SysUtils, Forms, Windows, Util, Bomba, TanqueBO;

type
  TBombaDAO = class
  private
    { private declarations }
  public
    function ObterListaBombas(Descricao: String = ''):TSQLQuery;
    function ObterBombaPorId(Id :Integer):TBomba;
    function UltimaBomba:TBomba;
    procedure Salvar(Bomba: TBomba);
    procedure Excluir(Bomba: TBomba);
  end;

implementation

{ TBombaDAO }

procedure TBombaDAO.Excluir(Bomba: TBomba);
var
  Query: TSQLQuery;
begin
  try
    TUtil.CriarQuery(Query);

    Query.SQL.Add('DELETE FROM Bomba');
    Query.SQL.Add(' WHERE Id = :Id');

    Query.ParamByName('Id').AsInteger := Bomba.Id;

    Query.ExecSQL();

    TUtil.DestruirQuery(Query);
  except on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

function TBombaDAO.ObterBombaPorId(Id: Integer): TBomba;
var
  Query: TSQLQuery;
  TanqueBO :TTanqueBO;
  Bomba: TBomba;
begin
  try
    TUtil.CriarQuery(Query);

    Query.SQL.Add('SELECT b.Id');
    Query.SQL.Add('      ,b.Descricao');
    Query.SQL.Add('      ,b.TanqueId');
    Query.SQL.Add('  FROM Bomba b');
    Query.SQL.Add(' WHERE b.Id = :Id');

    Query.ParamByName('Id').AsInteger := Id;

    Query.Open();

    if not(Query.IsEmpty) then
    begin
      TanqueBO := TTanqueBO.Create;

      Bomba := TBomba.Create;
      Bomba.Id := Query.FieldByName('Id').AsInteger;
      Bomba.Descricao := Trim(Query.FieldByName('Descricao').AsString);
      Bomba.Tanque := TanqueBO.ObterTanquePorId(Query.FieldByName('TanqueId').AsInteger);

      FreeAndNil(TanqueBO);
      Result := Bomba;
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

function TBombaDAO.ObterListaBombas(Descricao: String = ''): TSQLQuery;
var
  Query: TSQLQuery;
begin
  try
    TUtil.CriarQuery(Query);

    Query.SQL.Add('SELECT b.Id');
    Query.SQL.Add('      ,b.Descricao');
    Query.SQL.Add('      ,t.Tipo');
    Query.SQL.Add('  FROM Bomba b');
    Query.SQL.Add(' INNER JOIN Tanque t');
    Query.SQL.Add('    ON b.TanqueId = t.Id');

    if (Trim(Descricao) <> '') then
    begin
      Query.SQL.Add(' WHERE b.Descricao LIKE ''%'+Trim(Descricao)+'%''');
    end;

    Query.SQL.Add(' ORDER BY b.Id');

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

procedure TBombaDAO.Salvar(Bomba: TBomba);
var
  Query: TSQLQuery;
begin
  try
    TUtil.CriarQuery(Query);

    if (Bomba.Id = 0) then
    begin
      Query.SQL.Add('INSERT INTO Bomba');
      Query.SQL.Add('           (Descricao');
      Query.SQL.Add('           ,TanqueId)');
      Query.SQL.Add('     VALUES(:Descricao');
      Query.SQL.Add('           ,:TanqueId)');
    end
    else
    begin
      Query.SQL.Add('UPDATE Bomba');
      Query.SQL.Add('   SET Descricao = :Descricao');
      Query.SQL.Add('      ,TanqueId = :TanqueId');
      Query.SQL.Add(' WHERE Id = :Id');

      Query.ParamByName('Id').AsInteger := Bomba.Id;
    end;

    Query.ParamByName('Descricao').AsString := Bomba.Descricao;
    Query.ParamByName('TanqueId').AsInteger := Bomba.Tanque.Id;

    Query.ExecSQL();

    TUtil.DestruirQuery(Query);
  except on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

function TBombaDAO.UltimaBomba: TBomba;
var
  Query: TSQLQuery;
  TanqueBO :TTanqueBO;
  Bomba: TBomba;
begin
  try
    TUtil.CriarQuery(Query);

    Query.SQL.Add('SELECT b.Id');
    Query.SQL.Add('      ,b.Descricao');
    Query.SQL.Add('      ,b.TanqueId');
    Query.SQL.Add('  FROM Bomba b');
    Query.SQL.Add(' WHERE b.Id = (SELECT MAX(Id)');
    Query.SQL.Add('                 FROM Bomba)');

    Query.Open();

    if not(Query.IsEmpty) then
    begin
      TanqueBO := TTanqueBO.Create;

      Bomba := TBomba.Create;
      Bomba.Id := Query.FieldByName('Id').AsInteger;
      Bomba.Descricao := Trim(Query.FieldByName('Descricao').AsString);
      Bomba.Tanque := TanqueBO.ObterTanquePorId(Query.FieldByName('TanqueId').AsInteger);

      FreeAndNil(TanqueBO);
      Result := Bomba;
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
