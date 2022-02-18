unit Mconf; //подтверждение новой игры

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  Tconf = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Label2Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  conf: Tconf;

implementation

{$R *.dfm}

uses Mhub, MainMenu;

procedure Tconf.Label1Click(Sender: TObject); //создание нового файла сохранения
var save : file of byte;
    buf : byte;
begin
  buf := 0;
  AssignFile(save,'levels/save.dat');
  rewrite(save);
  for var i:=0 to 2 do
    write(save,buf);
  Closefile(save);
  hub.show;
  MM.hide;
  conf.close;
end;

procedure Tconf.Label2Click(Sender: TObject);
begin
  conf.close;
end;

end.
