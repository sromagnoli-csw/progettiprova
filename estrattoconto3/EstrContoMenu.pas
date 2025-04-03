unit EstrContoMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs,
  EstrContoImporto,conto;


type
  TForm1 = class(TForm)
    BtnPrel: TButton;
    btnConto: TButton;
    BtnVersa: TButton;
    procedure BtnPrelClick(Sender: TObject);
    procedure BtnVersaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnContoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  Form1: TForm1;
  LFormPrel: TFormPrel;
  LFormVers: TFormVers;
  LConto:TConto;

implementation

{$R *.fmx}

procedure TForm1.btnContoClick(Sender: TObject);
begin
  ShowMessage(IntToStr(LConto.LConto));
end;

procedure TForm1.BtnPrelClick(Sender: TObject);
begin
  Application.CreateForm(TFormPrel, LFormPrel);
  LFormPrel.LConto:=LConto;
  LFormPrel.Show;
  //Form1.Close;
end;

procedure TForm1.BtnVersaClick(Sender: TObject);
begin
  Application.CreateForm(TFormVers, LFormVers);
  LFormVers.LConto:=LConto;
  LFormVers.Show;
  //Form1.Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  LConto:=TConto.Create;
end;

end.
