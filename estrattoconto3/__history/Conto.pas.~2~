unit Conto;

interface
  uses
  System.SysUtils,FMX.Dialogs;

type
  TConto = class
  private
    LTotConto: Integer;
    var LVersamenti: array of array [0 .. 1] of integer;
    var LNumVersam: integer;
  public
    property LConto: Integer read LTotConto;
    function Versamento(importo: integer):string;
    function Prelievo(importo: integer):string;
    //procedure Estratto();
    constructor Create();

  end;

implementation

function TConto.Versamento(importo: integer):string;
var
  LNumIn: Integer;
  appo, LStrIn: String;
begin
  LNumIn := 0;
  try
    if (importo > 0) then
    begin
      LNumVersam := LNumVersam + 1;
      SetLength(LVersamenti, LNumVersam);
      LTotConto := LTotConto + importo;
      LVersamenti[High(LVersamenti), 0] := importo;
      LVersamenti[High(LVersamenti), 1] := 1;
      //ShowMessage('Importo Versato conrrettamente');
      exit('1');
    end
    else
    begin
      //ShowMessage('Impossibile accettare un importo pari a 0');
      exit('Impossibile accettare un importo pari a 0');
    end;
  except
    on E: Exception do
    begin
      ShowMessage(E.ToString);
      exit(E.ToString);
    end;
  end;

end;

function TConto.Prelievo(importo: Integer): string;
var
  LNumIn: Integer;
  appo, LStrIn: String;
begin
  LNumIn := 0;
  try
    if (importo > 0) then
    begin
      if(importo<=LTotConto)then
      begin
          LNumVersam := LNumVersam + 1;
          SetLength(LVersamenti, LNumVersam);
          LTotConto := LTotConto - importo;
          LVersamenti[High(LVersamenti), 0] := importo;
          LVersamenti[High(LVersamenti), 1] := 2;
          //ShowMessage('Importo Prelevato conrrettamente');
          exit('1');
      end else
      begin
        exit('Credito Insufficiente');
      end;

    end
    else
    begin
      //ShowMessage('Impossibile accettare un importo pari a 0');
      exit('Impossibile accettare un importo pari a 0');
    end;
  except
    on E: Exception do
    begin
      ShowMessage(E.ToString);
      exit(E.ToString);
    end;
  end;

end;



{procedure TConto.Estratto();
var
  appo, LStrConto: string;
var
  i: integer;
begin

  Writeln('Estratto conto pari a: ' + IntToStr(LTotConto) + '$');

  i := 0;
  while i < LNumVersam do
  begin
    if LVersamenti[i, 1] = 1 then
      Writeln('Versamento:   +' + IntToStr(LVersamenti[i, 0]))
    else
      Writeln('Prelievo:     -' + IntToStr(LVersamenti[i, 0]));

    i := i + 1;
  end;
  Writeln('Totale:        ' + IntToStr(LTotConto));

  Readln(appo);
end;           }

constructor TConto.Create();
begin
  LNumVersam := 0;
  LTotConto := 0;
end;

end.
