unit EstrContoImporto;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Edit,
  conto;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    BtnConf: TButton;
    TxtImporto: TEdit;
    procedure BtnConfClick(Sender: TObject);
    procedure FormCreate(Sender: TObject); virtual;
    procedure TxtImportoExit(Sender: TObject);
    var
  private
    var LTipoTrans:string;
    { Private declarations }
  public
    { Public declarations }
    var LConto:TConto;
  end;

  TFormVers = class(TForm2)
    procedure BtnConfClick(Sender: TObject); reintroduce;
    procedure FormCreate(Sender: TObject); reintroduce;
  end;
  TFormPrel = class(TForm2)
    procedure BtnConfClick(Sender: TObject); reintroduce;
    procedure FormCreate(Sender: TObject); reintroduce;
  end;

var
  Form2: TForm2;
 // LConto:TConto;

implementation

procedure TForm2.BtnConfClick(Sender: TObject);
var LAppo:integer;
begin
  LAppo:=1;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  LConto:=TConto.Create;
end;

procedure TForm2.TxtImportoExit(Sender: TObject);
begin
  try
    TxtImporto.Text:=FloatToStr(StrToFloatDef(TxtImporto.Text,0));
  except
      on Exception : EConvertError do
        ShowMessage(Exception.Message);

  end;
end;

{$R *.fmx}


procedure TFormVers.FormCreate(Sender: TObject);
begin
  Label1.Text:='Importo da versare';
end;
procedure TFormVers.BtnConfClick(Sender: TObject);
var
  LNumIn: integer;
  LEsito, LStrIn: String;
begin
  LNumIn:= StrToInt(TxtImporto.Text);
  LEsito:= LConto.Versamento(LNumIn);
  if(LEsito='1')then
  begin
    ShowMessage('transazione Completata');
    Close;
  end
  else
  begin
    ShowMessage(LEsito);
  end;

end;

procedure TFormPrel.FormCreate(Sender: TObject);
begin
  Label1.Text:='Importo da prelevare';
end;
procedure TFormPrel.BtnConfClick(Sender: TObject);
var
  LNumIn: integer;
  LEsito, LStrIn: String;
begin
  LNumIn:= StrToInt(TxtImporto.Text);
  LEsito:= LConto.Prelievo(LNumIn);
  if(LEsito='1')then
  begin
    ShowMessage('transazione Completata');
    Close;
  end
  else
  begin
    ShowMessage(LEsito);
  end;

end;

end.
