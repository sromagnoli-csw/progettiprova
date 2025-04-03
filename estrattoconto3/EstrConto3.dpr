program EstrConto3;

uses
  FMX.Forms,
  EstrContoMenu in 'EstrContoMenu.pas' {Form1},
  EstrContoImporto in 'EstrContoImporto.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
