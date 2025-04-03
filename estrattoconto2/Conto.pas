unit Conto;

interface
  uses
  System.SysUtils;

type
  TConto = class
  private
    LTotConto: Integer;
    var LVersamenti: array of array [0 .. 1] of integer; 
    var LNumVersam: integer;
  public
    property LConto: Integer read LTotConto;
    procedure Versamento();
    procedure Prelievo();   
    procedure Estratto();
    constructor Create();

  end;

implementation


procedure TConto.Versamento();
var
  LNumIn: integer;
  appo, LStrIn: String;
begin
  LNumIn := 0;
  repeat
    Writeln('Inserire importo da Versare o digita X per uscire');
    Readln(LStrIn);
    if LStrIn <> 'X' then
    begin
      try
        TryStrToInt(LStrIn, LNumIn);
        // LNumIn = LStrIn.AsInteger;
        if (LNumIn > 0) then
        begin
          LNumVersam := LNumVersam + 1;
          SetLength(LVersamenti, LNumVersam);
          LTotConto := LTotConto + LNumIn;
          LVersamenti[High(LVersamenti), 0] := LNumIn;
          LVersamenti[High(LVersamenti), 1] := 1;
          Writeln('Importo versato conrrettamente');
          Readln(appo);
        end
        else
        begin
          Writeln('Impossibile accettare un importo negativo o pari a 0');
          LNumIn := 0;
        end;
      except
        on E: Exception do
        begin
          Writeln('Importo non corretto');
          LNumIn := 0;

        end;
      end;
    end
    else
      LNumIn := 1;
  until LNumIn > 0;

end;
procedure TConto.Prelievo();
var
  LNumIn: integer;
  appo, LStrIn: String;
begin
  LNumIn := 0;
  repeat
    Writeln('Inserire importo da Prelevare o digita X per uscire');
    Readln(LStrIn);
    if LStrIn <> 'X' then
    begin
      try
        TryStrToInt(LStrIn, LNumIn);
        // LNumIn = LStrIn.AsInteger;
        if (LNumIn > 0) then
          begin
            if(LNumIn<=LTotConto)then
            begin
              LNumVersam := LNumVersam + 1;
              SetLength(LVersamenti, LNumVersam);
              LTotConto := LTotConto + LNumIn;
              LVersamenti[High(LVersamenti), 0] := LNumIn;
              LVersamenti[High(LVersamenti), 1] := 1;
              Writeln('Importo prelevato conrrettamente');
              Readln(appo);
            end
            else
            begin
              Writeln('Credito Insufficiente, Visualizzare il Conto? [S]Si [N]No');
              LNumIn := 0;
              Readln(appo);
              if(appo='S')then
              begin
                Writeln('conto pari a: '+IntToStr(LTotConto)+'$');
                Readln(appo);
              end;
            end;

          end
        else
          begin
            Writeln('Impossibile accettare un importo negativo o pari a 0');
            LNumIn := 0;
          end;
      except
        on E: Exception do
        begin
          Writeln('Importo non corretto');
          LNumIn := 0;

        end;
      end;
    end
    else
      LNumIn := 1;
  until LNumIn > 0;

end;

procedure TConto.Estratto();
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
end;

constructor TConto.Create();
begin
  LNumVersam := 0;
  LTotConto := 0;
end;

end.
