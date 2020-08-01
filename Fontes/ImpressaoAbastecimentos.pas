unit ImpressaoAbastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Data.SqlExpr,
  Data.DB;

type
  TFormImpressaoAbastecimentos = class(TForm)
    LabelDataInicial: TLabel;
    ToolBar: TToolBar;
    ToolButtonLimpar: TToolButton;
    ToolButtonSeparator01: TToolButton;
    ToolButtonImprimir: TToolButton;
    DateTimePickerDataInicial: TDateTimePicker;
    StatusBar: TStatusBar;
    LabelDataFinal: TLabel;
    DateTimePickerDataFinal: TDateTimePicker;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure ToolButtonLimparClick(Sender: TObject);
    procedure ToolButtonImprimirClick(Sender: TObject);
  private
    function ValidaImpressao:Boolean;
  public
    { Public declarations }
  end;

var
  FormImpressaoAbastecimentos: TFormImpressaoAbastecimentos;

implementation

{$R *.dfm}

uses Principal, Util, ImpressaoAbastecimentosa;

procedure TFormImpressaoAbastecimentos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    Action := caFree;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormImpressaoAbastecimentos.FormDestroy(Sender: TObject);
begin
  try
    FormImpressaoAbastecimentos := nil;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormImpressaoAbastecimentos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  try
    case (Key) of
      VK_F2 : ToolButtonLimpar.Click();
      VK_F7 : ToolButtonImprimir.Click();
      VK_ESCAPE : Close;
    end;
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormImpressaoAbastecimentos.FormShow(Sender: TObject);
begin
  try
    ToolButtonLimpar.Click();
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormImpressaoAbastecimentos.ToolButtonImprimirClick(Sender: TObject);
var
  Query: TSQLQuery;
  DataSource: TDataSource;
begin
  try
    if not(ValidaImpressao()) then
    begin
      Exit;
    end;

    TUtil.CriarQuery(Query);

    DataSource := TDataSource.Create(Self);
    DataSource.DataSet := Query;

    Query.SQL.Add('SELECT b.Descricao AS Bomba');
    Query.SQL.Add('      ,a.Data AS DataAbastecimento');
    Query.SQL.Add('      ,t.Descricao AS Tanque');
    Query.SQL.Add('      ,a.Valor');
    Query.SQL.Add('  FROM Abastecimento a');
    Query.SQL.Add(' INNER JOIN Bomba b');
    Query.SQL.Add('    ON a.BombaId = b.Id');
    Query.SQL.Add(' INNER JOIN Tanque t');
    Query.SQL.Add('    ON b.TanqueId = t.Id');
    Query.SQL.Add(' WHERE Data >= '''+FormatDateTime('yyyy-mm-dd',DateTimePickerDataInicial.Date)+'''');
    Query.SQL.Add('   AND Data <= '''+FormatDateTime('yyyy-mm-dd',DateTimePickerDataFinal.Date)+'''');
    Query.SQL.Add(' ORDER BY b.Descricao');

    Query.Open();

    if (Query.IsEmpty) then
    begin
      TUtil.Mensagem('Não existem abastecimentos para serem impressos nesse período.');
      TUtil.DestruirQuery(Query);
      Exit;
    end;

    if (FormImpressaoAbastecimentosa = nil) then
    begin
      Application.CreateForm(TFormImpressaoAbastecimentosa, FormImpressaoAbastecimentosa);
    end;

    FormImpressaoAbastecimentosa.RLReportAbastecimentoBombas.DataSource := DataSource;
    FormImpressaoAbastecimentosa.Query := Query;

    FormImpressaoAbastecimentosa.RLReportAbastecimentoBombas.Preview();

    Application.RemoveComponent(FormImpressaoAbastecimentosa);
    FormImpressaoAbastecimentosa.Destroy;
    FormImpressaoAbastecimentosa := nil;

    FreeAndNil(DataSource);
    TUtil.DestruirQuery(Query);
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

procedure TFormImpressaoAbastecimentos.ToolButtonLimparClick(Sender: TObject);
begin
  try
    DateTimePickerDataInicial.Date := Date();
    DateTimePickerDataFinal.Date := Date();

    DateTimePickerDataInicial.SetFocus();
  except on E: Exception do
    begin
      TUtil.Mensagem(e.Message);
    end;
  end;
end;

function TFormImpressaoAbastecimentos.ValidaImpressao: Boolean;
begin
  try
    Result := False;

    if (DateTimePickerDataInicial.Date > DateTimePickerDataFinal.Date) then
    begin
      TUtil.Mensagem('A data inicial não pode ser maior que a data final.');
      Exit;
    end;

    Result := True;
  except on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

end.
