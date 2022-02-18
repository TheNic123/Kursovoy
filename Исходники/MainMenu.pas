unit MainMenu; //Главное меню

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.MPlayer, ShellAPI;

type
  TMM = class(TForm)
    bg: TImage;
    name: TLabel;
    play: TLabel;
    exit: TLabel;
    ngame: TLabel;
    music: TMediaPlayer;
    lhelp: TLabel;
    Timer: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    procedure exitClick(Sender: TObject);
    procedure playClick(Sender: TObject);
    procedure ngameClick(Sender: TObject);
    procedure lhelpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MM: TMM;

implementation

{$R *.dfm}

uses Fight, Mhub, Mconf, Mhelp, Mabout;

procedure TMM.FormHide(Sender: TObject);//остановка музыки
begin
  music.Stop;
  Timer.Enabled := false;
end;

procedure TMM.FormShow(Sender: TObject); //включение музыки
begin
  Timer.Enabled := true;
  music.FileName := 'music\Opening.mp3';
  music.Open;
  music.Play;
end;

procedure TMM.Label1Click(Sender: TObject); //справка
begin
ShellExecute(0,PChar('Open'),PChar('help\about.chm'),nil,nil,SW_SHOW);
end;

procedure TMM.Label2Click(Sender: TObject); //О программе
begin
  about.showmodal;
end;

procedure TMM.exitClick(Sender: TObject); //выход
begin
  MM.close;
end;

procedure TMM.ngameClick(Sender: TObject); //новая игра
begin
  conf.show;
end;

procedure TMM.playClick(Sender: TObject); //продолжить
begin
  hub.show;
  MM.hide;
end;

procedure TMM.TimerTimer(Sender: TObject);
begin
  music.Play;
end;

procedure TMM.lhelpClick(Sender: TObject); //как играть
begin
  help.showmodal;
end;

end.
