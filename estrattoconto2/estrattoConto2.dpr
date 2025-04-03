program estrattoConto2;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  Conto in 'Conto.pas';

var
  LInput: String;
  LVersamenti: array of array [0 .. 1] of integer;
  LNumVersam: integer;
  LConto: TConto;

begin
  LConto:= TConto.Create;
  try
    repeat

      Writeln('selezionare una scelta');
      Writeln('[A] Versamento');
      Writeln('[B] Prelievo');
      Writeln('[C] Vis. Conto');
      Writeln('[X] Esci');
      Readln(LInput);

      { case LInput of
        'A': Versamento;
        end; }
      if LInput = 'A' then
        LConto.Versamento
      else if LInput = 'B' then
        LConto.Prelievo()
      else if LInput = 'C' then
        LConto.Estratto();
      Writeln('');
      Writeln('');
      Writeln('');
      Writeln('');
    until LInput = 'X';
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
