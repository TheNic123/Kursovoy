unit ft_menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  Tftm = class(TForm)
    Image1: TImage;
    cont: TLabel;
    exit: TLabel;
    procedure contClick(Sender: TObject);
    procedure exitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ftm: Tftm;

implementation

{$R *.dfm}

uses Fight;

procedure Tftm.contClick(Sender: TObject);
begin
  ftm.close;
end;

procedure Tftm.exitClick(Sender: TObject);
begin
  ftm.close;
  ft.close;
end;

end.
