unit BombaBO;

interface

uses
  Data.SqlExpr, SysUtils, Forms, Windows, Util, BombaDAO, Bomba;

type
  TBombaBO = class
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

{ TBombaBO }

procedure TBombaBO.Excluir(Bomba: TBomba);
var
  BombaDAO: TBombaDAO;
begin
  try
    BombaDAO := TBombaDAO.Create;
    BombaDAO.Excluir(Bomba);
    FreeAndNil(BombaDAO);
  except on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

function TBombaBO.ObterBombaPorId(Id :Integer): TBomba;
var
  BombaDAO: TBombaDAO;
begin
  try
    BombaDAO := TBombaDAO.Create;
    Result := BombaDAO.ObterBombaPorId(Id);
    FreeAndNil(BombaDAO);
  except on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

function TBombaBO.ObterListaBombas(Descricao: String = ''): TSQLQuery;
var
  BombaDAO: TBombaDAO;
begin
  try
    BombaDAO := TBombaDAO.Create;
    Result := BombaDAO.ObterListaBombas(Descricao);
    FreeAndNil(BombaDAO);
  except on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TBombaBO.Salvar(Bomba: TBomba);
var
  BombaDAO: TBombaDAO;
begin
  try
    BombaDAO := TBombaDAO.Create;
    BombaDAO.Salvar(Bomba);
    FreeAndNil(BombaDAO);
  except on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

function TBombaBO.UltimaBomba: TBomba;
var
  BombaDAO: TBombaDAO;
begin
  try
    BombaDAO := TBombaDAO.Create;
    Result := BombaDAO.UltimaBomba();
    FreeAndNil(BombaDAO);
  except on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

end.
