program PostoABC;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {FormPrincipal},
  Util in 'Util.pas',
  ConsultaBomba in 'ConsultaBomba.pas' {FormConsultaBomba},
  BombaBO in 'BO\BombaBO.pas',
  BombaDAO in 'DAO\BombaDAO.pas',
  CadastroAbastecimento in 'CadastroAbastecimento.pas' {FormCadastroAbastecimento},
  Bomba in 'DTO\Bomba.pas',
  Tanque in 'DTO\Tanque.pas',
  TanqueBO in 'BO\TanqueBO.pas',
  TanqueDAO in 'DAO\TanqueDAO.pas',
  Configuracao in 'DTO\Configuracao.pas',
  ConfiguracaoDAO in 'DAO\ConfiguracaoDAO.pas',
  ConfiguracaoBO in 'BO\ConfiguracaoBO.pas',
  Abastecimento in 'DTO\Abastecimento.pas',
  AbastecimentoDAO in 'DAO\AbastecimentoDAO.pas',
  AbastecimentoBO in 'BO\AbastecimentoBO.pas',
  ImpressaoAbastecimentos in 'ImpressaoAbastecimentos.pas' {FormImpressaoAbastecimentos},
  ImpressaoAbastecimentosa in 'ImpressaoAbastecimentosa.pas' {FormImpressaoAbastecimentosa},
  CadastroConfiguracoes in 'CadastroConfiguracoes.pas' {FormCadastroConfiguracoes},
  CadastroTanque in 'CadastroTanque.pas' {FormCadastroTanque},
  ConsultaPadrao in 'ConsultaPadrao.pas' {FormConsultaPadrao},
  CadastroBomba in 'CadastroBomba.pas' {FormCadastroBomba};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'PostoABC';
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
