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
    procedure FormCreate(Sender: TObject);
    procedure TxtImportoExit(Sender: TObject);
    var
  private
    var LTipoTrans:string;
    { Private declarations }
  public
    { Public declarations }
    procedure Inizia(tipo: string);
    var LConto:TConto;
  end;

var
  Form2: TForm2;
 // LConto:TConto;

implementation

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

procedure TForm2.Inizia(tipo: string);
begin
  LTipoTrans:=tipo;
   if(LTipoTrans='P')then
   begin
      Label1.Text:='Importo da prelevare';
   end else
   if(LTipoTrans='V')then
   begin
      Label1.Text:='Importo da versare';
   end;
end;



{$R *.fmx}

procedure TForm2.BtnConfClick(Sender: TObject);
var
  LNumIn: integer;
  LEsito, LStrIn: String;
begin
  LNumIn:= Round(StrToInt(TxtImporto.Text));
    if(LTipoTrans='V')then
    begin
      LEsito:= LConto.Versamento(LNumIn);
    end else
    if(LTipoTrans='P')then
    begin
      LEsito:= LConto.Prelievo(LNumIn);
    end;

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
