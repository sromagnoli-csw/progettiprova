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
  Form2: TForm2;
  LConto:TConto;

implementation

{$R *.fmx}

procedure TForm1.btnContoClick(Sender: TObject);
begin
  ShowMessage(IntToStr(LConto.LConto));
end;

procedure TForm1.BtnPrelClick(Sender: TObject);
begin
  Application.CreateForm(TForm2, Form2);
  Form2.Inizia('P');
  Form2.LConto:=LConto;
  Form2.Show;
  //Form1.Close;
end;

procedure TForm1.BtnVersaClick(Sender: TObject);
begin
  Application.CreateForm(TForm2, Form2);
  Form2.Inizia('V');
  Form2.LConto:=LConto;
  Form2.Show;
  //Form1.Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  LConto:=TConto.Create;
end;

end.
