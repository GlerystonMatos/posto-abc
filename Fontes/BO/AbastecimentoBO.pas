unit AbastecimentoBO;

interface

uses
  Data.SqlExpr, SysUtils, Forms, Windows, Util, AbastecimentoDAO, Abastecimento;

type
  TAbastecimentoBO = class
  private
    { private declarations }
  public
    procedure Salvar(Abastecimento: TAbastecimento);
  end;

implementation

{ TAbastecimentoBO }

procedure TAbastecimentoBO.Salvar(Abastecimento: TAbastecimento);
var
  AbastecimentoDAO: TAbastecimentoDAO;
begin
  try
    AbastecimentoDAO := TAbastecimentoDAO.Create;
    AbastecimentoDAO.Salvar(Abastecimento);
    FreeAndNil(AbastecimentoDAO);
  except on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

end.
