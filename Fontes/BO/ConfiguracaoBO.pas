unit ConfiguracaoBO;

interface

uses
  Data.SqlExpr, SysUtils, Forms, Windows, Util, ConfiguracaoDAO, Configuracao;

type
  TConfiguracaoBO = class
  private
    { private declarations }
  public
    function ObterConfiguracao:TConfiguracao;
    procedure Salvar(Configuracao: TConfiguracao);
  end;

implementation

{ TConfiguracaoBO }

function TConfiguracaoBO.ObterConfiguracao: TConfiguracao;
var
  ConfiguracaoDAO: TConfiguracaoDAO;
begin
  try
    ConfiguracaoDAO := TConfiguracaoDAO.Create;
    Result := ConfiguracaoDAO.ObterConfiguracao();
    FreeAndNil(ConfiguracaoDAO);
  except on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TConfiguracaoBO.Salvar(Configuracao: TConfiguracao);
var
  ConfiguracaoDAO: TConfiguracaoDAO;
begin
  try
    ConfiguracaoDAO := TConfiguracaoDAO.Create;
    ConfiguracaoDAO.Salvar(Configuracao);
    FreeAndNil(ConfiguracaoDAO);
  except on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

end.
