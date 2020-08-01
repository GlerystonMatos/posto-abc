unit TanqueBO;

interface

uses
  Data.SqlExpr, SysUtils, Forms, Windows, Util, TanqueDAO, Tanque;

type
  TTanqueBO = class
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

{ TTanqueBO }

procedure TTanqueBO.Excluir(Tanque: TTanque);
var
  TanqueDAO: TTanqueDAO;
begin
  try
    TanqueDAO := TTanqueDAO.Create;
    TanqueDAO.Excluir(Tanque);
    FreeAndNil(TanqueDAO);
  except on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

function TTanqueBO.ObterListaTanques(Descricao: String = ''): TSQLQuery;
var
  TanqueDAO: TTanqueDAO;
begin
  try
    TanqueDAO := TTanqueDAO.Create;
    Result := TanqueDAO.ObterListaTanques(Descricao);
    FreeAndNil(TanqueDAO);
  except on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

function TTanqueBO.ObterTanquePorId(Id :Integer): TTanque;
var
  TanqueDAO: TTanqueDAO;
begin
  try
    TanqueDAO := TTanqueDAO.Create;
    Result := TanqueDAO.ObterTanquePorId(Id);
    FreeAndNil(TanqueDAO);
  except on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TTanqueBO.Salvar(Tanque: TTAnque);
var
  TanqueDAO: TTanqueDAO;
begin
  try
    TanqueDAO := TTanqueDAO.Create;
    TanqueDAO.Salvar(Tanque);
    FreeAndNil(TanqueDAO);
  except on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

function TTanqueBO.UltimoTanque: TTanque;
var
  TanqueDAO: TTanqueDAO;
begin
  try
    TanqueDAO := TTanqueDAO.Create;
    Result := TanqueDAO.UltimoTanque();
    FreeAndNil(TanqueDAO);
  except on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

end.
