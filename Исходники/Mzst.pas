unit Mzst; //заставка

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls;

type
  Tzst = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  zst: Tzst;

implementation

{$R *.dfm}

procedure Tzst.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
end;

end.
