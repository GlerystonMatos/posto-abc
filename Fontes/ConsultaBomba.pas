unit ConsultaBomba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Data.SqlExpr;

type
  TFormConsultaBomba = class(TForm)
    LabelBombasCombustivel: TLabel;
    ListViewBombas: TListView;
    BitBtnIniciarAbastecimento: TBitBtn;
    StatusBar: TStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtnIniciarAbastecimentoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ListViewBombasDblClick(Sender: TObject);
  private
    procedure ConsultarBombas;
    procedure ListarBombas(Query: TSQLQuery);
  public
    { Public declarations }
  end;

var
  FormConsultaBomba: TFormConsultaBomba;

implementation

{$R *.dfm}

uses Util, BombaBO, CadastroAbastecimento;

procedure TFormConsultaBomba.BitBtnIniciarAbastecimentoClick(Sender: TObject);
begin
  try
    if (ListViewBombas.Selected = nil) then
    begin
      TUtil.Mensagem('Selecione uma bomba para iniciar o abastecimento.');
      Exit;
    end;

    if (FormCadastroAbastecimento = nil) then
    begin
      Application.CreateForm(TFormCadastroAbastecimento, FormCadastroAbastecimento);
    end;

    FormCadastroAbastecimento.BombaId := StrToInt(Trim(ListViewBombas.Selected.Caption));
    FormCadastroAbastecimento.ShowModal();
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormConsultaBomba.ConsultarBombas;
var
  BombaBO: TBombaBO;
  Query: TSQLQuery;
begin
  try
    BombaBO := TBombaBO.Create;
    Query := BombaBO.ObterListaBombas();
    FreeAndNil(BombaBO);

    if (Query = nil) then
    begin
      TUtil.Mensagem('Não existem bombas para serem usadas no abastecimento.');
      Exit;
    end;

    ListarBombas(Query);
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormConsultaBomba.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    Action := caFree;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormConsultaBomba.FormDestroy(Sender: TObject);
begin
  try
    FormConsultaBomba := nil;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormConsultaBomba.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  try
    case (Key) of
      VK_ESCAPE : Close;
    end;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormConsultaBomba.FormShow(Sender: TObject);
begin
  try
    ConsultarBombas();
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormConsultaBomba.ListarBombas(Query: TSQLQuery);
var
  Item :TListItem;
begin
  try
    while not(Query.Eof) do
    begin
      Item := ListViewBombas.Items.Add();
      Item.Caption := Trim(Query.FieldByName('Id').AsString);
      Item.SubItems.Add(Trim(Query.FieldByName('Descricao').AsString));

      case (Query.FieldByName('Tipo').AsInteger) of
        0 : Item.SubItems.Add('Gasolina');
        1 : Item.SubItems.Add('Óleo Diesel');
      end;

      Query.Next();
    end;

    TUtil.DestruirQuery(Query);
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormConsultaBomba.ListViewBombasDblClick(Sender: TObject);
begin
  try
    if (ListViewBombas.Selected = nil) then
    begin
      TUtil.Mensagem('Selecione uma bomba para iniciar o abastecimento.');
      Exit;
    end;

    if (FormCadastroAbastecimento = nil) then
    begin
      Application.CreateForm(TFormCadastroAbastecimento, FormCadastroAbastecimento);
    end;

    FormCadastroAbastecimento.BombaId := StrToInt(Trim(ListViewBombas.Selected.Caption));
    FormCadastroAbastecimento.ShowModal();
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

end.
