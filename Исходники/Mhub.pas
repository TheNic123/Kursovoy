unit Mhub; //форма выбора локации

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.MPlayer;

type
  Thub = class(TForm)
    hub_bg: TImage;
    k_img: TImage;
    h_img: TImage;
    w_img: TImage;
    exit: TLabel;
    play: TLabel;
    lmap1: TLabel;
    lmap2: TLabel;
    lmap3: TLabel;
    cursor: TImage;
    levmap3: TLabel;
    levmap2: TLabel;
    levmap1: TLabel;
    music: TMediaPlayer;
    Timer: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure exitClick(Sender: TObject);
    procedure lmap3Click(Sender: TObject);
    procedure lmap2Click(Sender: TObject);
    procedure lmap1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure playClick(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  hub: Thub;
  load : file of byte;
  lev, did: byte;
  maps : array [0..2] of byte;

implementation

{$R *.dfm}

uses MainMenu, Fight, Mfinal;

procedure Thub.exitClick(Sender: TObject);
begin
  MM.show;
  hub.hide;
end;

procedure Thub.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MM.close;
  ft.close;
end;

procedure Thub.FormHide(Sender: TObject); //остановка музыки
begin
  music.Stop;
  Timer.Enabled := false
end;

procedure Thub.FormShow(Sender: TObject);
var save : file of byte;
    k,buf : byte;
begin
  play.Enabled := false;

  Timer.Enabled := true;  //включение музыки
  music.FileName := 'music\OST.mp3';
  music.Open;
  music.Play;

  AssignFile(load,'levels/load.dat');    //подтверждение пройденого уровня
  reset(load);
  read(load,did);
  Closefile(load);
  if did = 4 then
     begin
       maps[lev-1] :=  maps[lev-1]+1;
       AssignFile(save,'levels/save.dat');
       rewrite(save);
       for var i:=0 to 2 do
         write(save,maps[i]);
       Closefile(save);
     end;
   AssignFile(load,'levels/load.dat');
   rewrite(load);
   lev := 0;
   write(load,lev);
   Closefile(load);

  AssignFile(save,'levels\save.dat');         //отображение пройденых уровне
  k :=0;
  reset(save);
  while (not EOF(save)) do
     begin
       seek(save,k);
       read(save,buf);
       if buf>10 then buf := 10;
       maps[k] := buf;
       TLabel(FindComponent('levmap'+IntToStr(k+1))).caption := IntToStr(maps[k])+'\10';
       k := k+1;
     end;
  closefile(save);

  if (maps[0] = 10) and (maps[1] = 10) and (maps[2] = 10) then         //финал игры
    begin
      AssignFile(save,'levels/save.dat');
      rewrite(save);
      for var i:=0 to 2 do
      write(save,buf);
      Closefile(save);
      finalf.showmodal;
    end;
end;

procedure Thub.lmap1Click(Sender: TObject);      //выбор локации 1
begin
  cursor.top := lmap1.top;
  play.Enabled := true;
  lev := 1;
  AssignFile(load,'levels/load.dat');
  rewrite(load);
  write(load,lev);
  Closefile(load);
end;

procedure Thub.lmap2Click(Sender: TObject);        //2
begin
  cursor.top := lmap2.top;
  play.Enabled := true;
  lev := 2;
  AssignFile(load,'levels/load.dat');
  rewrite(load);
  write(load,lev);
  Closefile(load);
end;

procedure Thub.lmap3Click(Sender: TObject);        //3
begin
  cursor.top := lmap3.top;
  play.Enabled := true;
  lev := 3;
  AssignFile(load,'levels/load.dat');
  rewrite(load);
  write(load,lev);
  Closefile(load);
end;

procedure Thub.playClick(Sender: TObject);        //запуск боя
begin
  ft.Show;
  hub.hide;
end;

procedure Thub.TimerTimer(Sender: TObject);        // обновление музыки
begin
  music.Play;
end;

end.
