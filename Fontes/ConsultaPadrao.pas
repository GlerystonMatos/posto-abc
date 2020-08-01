unit ConsultaPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Principal, Vcl.ComCtrls, Vcl.ToolWin, Data.SqlExpr, Vcl.StdCtrls;

type
  TTipoConsulta = (ConsultaTanque, ConsultaBomba);

  TFormConsultaPadrao = class(TForm)
    ToolBar: TToolBar;
    ToolButtonPesquisar: TToolButton;
    EditDescricao: TEdit;
    ListViewDados: TListView;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure ToolButtonPesquisarClick(Sender: TObject);
    procedure ListViewDadosDblClick(Sender: TObject);
    procedure EditDescricaoKeyPress(Sender: TObject; var Key: Char);
  private
    FTipoConsulta: TTipoConsulta;
    procedure SetarCaptionTela;
    procedure SetTipoConsulta(const Value: TTipoConsulta);
    procedure ListarDados(Query: TSQLQuery);
  public
    property TipoConsulta :TTipoConsulta read FTipoConsulta write SetTipoConsulta;
  end;

var
  FormConsultaPadrao: TFormConsultaPadrao;

implementation

{$R *.dfm}

uses Util, BombaBO, TanqueBO, Tanque, Bomba;

procedure TFormConsultaPadrao.EditDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
  try
    if (Key = #13) then
    begin
      ToolButtonPesquisar.Click();
    end;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;  
end;

procedure TFormConsultaPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    Action := caFree;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormConsultaPadrao.FormDestroy(Sender: TObject);
begin
  try
    FormConsultaPadrao := nil;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormConsultaPadrao.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  try
    case (Key) of
      VK_F5 : ToolButtonPesquisar.Click();
      VK_ESCAPE : Close;
    end;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormConsultaPadrao.FormShow(Sender: TObject);
begin
  try
    IdSelecionado := '';
    DescricaoSelecionada := '';
    SetarCaptionTela();

    EditDescricao.SetFocus();
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormConsultaPadrao.ListarDados(Query: TSQLQuery);
var
  Item :TListItem;
begin
  try
    while not(Query.Eof) do
    begin
      Item := ListViewDados.Items.Add();
      Item.Caption := Trim(Query.FieldByName('Id').AsString);
      Item.SubItems.Add(Trim(Query.FieldByName('Descricao').AsString));

      Query.Next();
    end;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormConsultaPadrao.ListViewDadosDblClick(Sender: TObject);
begin
  if (ListViewDados.Selected <> nil) then
  begin
    IdSelecionado := Trim(ListViewDados.Selected.Caption);
    DescricaoSelecionada := Trim(ListViewDados.Selected.SubItems[0]);
    Close;
  end;
end;

procedure TFormConsultaPadrao.SetarCaptionTela;
begin
  try
    case (TipoConsulta) of
      ConsultaTanque : FormConsultaPadrao.Caption := 'Consulta de Tanques';
      ConsultaBomba : FormConsultaPadrao.Caption := 'Consulta de Bombas';
    end;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormConsultaPadrao.SetTipoConsulta(const Value: TTipoConsulta);
begin
  FTipoConsulta := Value;
end;

procedure TFormConsultaPadrao.ToolButtonPesquisarClick(Sender: TObject);
var
  TanqueBO: TTanqueBO;
  BombaBO: TBombaBO;
  Query: TSQLQuery;
begin
  try
    case (TipoConsulta) of
      ConsultaTanque : begin
                         TanqueBO := TTanqueBO.Create;
                         Query := TanqueBO.ObterListaTanques(Trim(EditDescricao.Text));
                         FreeAndNil(TanqueBO);
                       end;
      ConsultaBomba : begin
                        BombaBO := TBombaBO.Create;
                        Query := BombaBO.ObterListaBombas(Trim(EditDescricao.Text));
                        FreeAndNil(BombaBO);
                      end;
    end;

    ListViewDados.Items.Clear();
    ListarDados(Query);
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

end.
