unit Fight; //Форма боя

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.MPlayer;

type
  Tft = class(TForm)
    bg: TImage;
    console: TImage;
    ftm_img: TImage;
    Knight_l: TLabel;
    Wizzard_l: TLabel;
    Hiller_l: TLabel;
    hp_l1: TLabel;
    hp_l2: TLabel;
    hp_l3: TLabel;
    mp_l1: TLabel;
    mp_l2: TLabel;
    mp_l3: TLabel;
    k_icon: TImage;
    w_icon: TImage;
    h_icon: TImage;
    k_hp: TLabel;
    k_mp: TLabel;
    w_hp: TLabel;
    w_mp: TLabel;
    h_hp: TLabel;
    h_mp: TLabel;
    inf_l: TLabel;
    inf: TMemo;
    skill1: TSpeedButton;
    skill2: TSpeedButton;
    skill3: TSpeedButton;
    skill4: TSpeedButton;
    next: TImage;
    en_l: TLabel;
    en_icon1: TImage;
    en_icon3: TImage;
    en_icon5: TImage;
    en_icon2: TImage;
    en_icon4: TImage;
    en_icon6: TImage;
    h_img: TImage;
    w_img: TImage;
    k_img: TImage;
    en_img1: TImage;
    en_img2: TImage;
    en_img3: TImage;
    en_img4: TImage;
    en_img6: TImage;
    en_img5: TImage;
    cursor1: TImage;
    cursor2: TImage;
    cursor3: TImage;
    roundl: TLabel;
    Timer1: TTimer;
    Timer2: TTimer;
    skills_l: TLabel;
    bhp: TImage;
    bmp: TImage;
    music: TMediaPlayer;
    Timer3: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ftm_imgClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure en_icon1Click(Sender: TObject);
    procedure en_icon2Click(Sender: TObject);
    procedure en_icon3Click(Sender: TObject);
    procedure en_icon5Click(Sender: TObject);
    procedure en_icon4Click(Sender: TObject);
    procedure en_icon6Click(Sender: TObject);
    procedure skill1Click(Sender: TObject);
    procedure skill2Click(Sender: TObject);
    procedure skill3Click(Sender: TObject);
    procedure skill4Click(Sender: TObject);
    procedure nextClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure bhpClick(Sender: TObject);
    procedure bmpClick(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type pers = record       //запись героев
  code : byte;
  hp : integer;
  mp : integer;
end;

var
  ft: Tft;

  col : byte;   //переменные мобов
  enhp : array [0..5] of integer;
  enind : array [0..5] of byte;
  mp, hp, en :integer;
  en1:string[2];
  main_spr1 : string[11];
  spr1 : string[13];
  motion, hero_attack, target, round, res1, res2, lev : byte;
  pers_file : file of pers;
  hero : pers;
  hpp, mhp, mpp, mmp: array [0..2] of integer;
  load : file of byte;
  procedure heroes_stats(index : integer);

implementation

{$R *.dfm}

uses MainMenu, ft_menu, Mhub;

procedure heroes_stats(index : integer);
var k:byte;
begin
  AssignFile(pers_file,'pers\pers_demo.dat');
  k := 0;
  reset(pers_file);
  while (not EOF(pers_file)) do
     begin
       seek(pers_file,k);
       read(pers_file,hero);
       if  index = hero.code then
        begin
         hp := hero.hp;
         mp := hero.mp;
         break;
       end;
       k := k+1;
     end;
  close(pers_file);
end;

procedure Tft.bhpClick(Sender: TObject);        //выбор хилки hp
begin
  if res1=0 then
    begin
      cursor2.Top := bhp.Top+25;
      cursor2.left := bhp.left-35;
      hero_attack := 4;
      inf.Lines.LoadFromFile('inf\bhp.txt');
    end;
end;

procedure Tft.bmpClick(Sender: TObject);
begin
  if res2=0 then
    begin
      cursor2.Top := bmp.Top+25;
      cursor2.left := bmp.Left-35;
      hero_attack := 5;
      inf.Lines.LoadFromFile('inf\bmp.txt');
    end;
end;

procedure Tft.en_icon1Click(Sender: TObject);           //выбор цели 1
begin
  if enhp[0] >0 then
  begin
    cursor3.left := en_icon1.left-30;
    cursor3.top := en_icon1.top+30;
    target := 0;
    next.Enabled := true;
  end;
end;

procedure Tft.en_icon2Click(Sender: TObject);            //2
begin
  if enhp[1] >0 then
  begin
    cursor3.left := en_icon2.left-30;
    cursor3.top := en_icon2.top+30;
    target := 1;
    next.Enabled := true;
  end;
end;

procedure Tft.en_icon3Click(Sender: TObject);            //3
begin
  if enhp[2] >0 then
  begin
    cursor3.left := en_icon3.left-30;
    cursor3.top := en_icon3.top+30;
    target := 2;
    next.Enabled := true;
  end;
end;

procedure Tft.en_icon4Click(Sender: TObject);            //4
begin
  if enhp[3] >0 then
  begin
    cursor3.left := en_icon4.left-30;
    cursor3.top := en_icon4.top+30;
    target := 3;
    next.Enabled := true;
  end;
end;

procedure Tft.en_icon5Click(Sender: TObject);            //5
begin
  if enhp[4] >0 then
  begin
    cursor3.left := en_icon5.left-30;
    cursor3.top := en_icon5.top+30;
    target := 4;
    next.Enabled := true;
  end;
end;

procedure Tft.en_icon6Click(Sender: TObject);            //6
begin
  if enhp[5] >0 then
  begin
    cursor3.left := en_icon6.left-30;
    cursor3.top := en_icon6.top+30;
    target := 5;
    next.Enabled := true;
  end;
end;

procedure Tft.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  hub.show;
  ft.hide;
end;

procedure Tft.FormHide(Sender: TObject);
begin
  music.Stop;
  Timer3.Enabled := false;
end;

procedure Tft.FormShow(Sender: TObject);
var mobhp: textfile;
    mob_main_spr : textfile;
    k : integer;
begin
  motion := 0;
  round := 1;
  hero_attack := 0;
  cursor1.Top := Knight_l.Top;
  cursor2.Top := skill1.Top;
  cursor2.Left := skill1.left-40;
  cursor3.left := en_icon1.left-30;
  cursor3.top := en_icon1.top+30;
  next.Enabled := false;
  Timer2.Enabled := false;

  Timer3.Enabled := true;
  music.FileName := 'music\Battle Scene.mp3';
  music.Open;
  music.Play;

  AssignFile(load,'levels/load.dat');
  reset(load);
  read(load,lev);
  Closefile(load);

  bg.Picture.LoadFromFile('spr\ft_bg'+IntToStr(lev)+'.png');

  roundl.Caption := 'Раунд 1';
  Timer1.Enabled := true;

    for var i := 0 to 2 do    //занесение данных персонажей и их статов
      begin
        heroes_stats(i);
        hpp[i] := hp;
        mpp[i] := mp;
        mhp[i] := hp;
        mmp[i] := mp;
      end;
    k_hp.Caption := IntToStr(hpp[0])+'/'+ IntToStr(mhp[0]);
    w_hp.Caption := IntToStr(hpp[1])+'/'+ IntToStr(mhp[1]);
    h_hp.Caption := IntToStr(hpp[2])+'/'+ IntToStr(mhp[2]);

    k_mp.Caption := IntToStr(mpp[0])+'/'+ IntToStr(mmp[0]);
    w_mp.Caption := IntToStr(mpp[1])+'/'+ IntToStr(mmp[1]);
    h_mp.Caption := IntToStr(mpp[2])+'/'+ IntToStr(mmp[2]);

    col := random(6);                                              //рандом мобов
    for var i := 0 to col do
      begin
        k := random(15);
        enind[i] := k;
           AssignFile(mobhp,'mobs\enemies_hp.txt');
           reset(mobhp);
           for var o := 0 to 14 do
           begin
             if o = k then
             begin
               readln(mobhp,en1);
               break;
             end;
             readln(mobhp,en1);
           end;
           enhp[i] := StrToInt(en1);
           closefile(mobhp);

           AssignFile(mob_main_spr,'mobs\enemies_main_spr.txt');
           reset(mob_main_spr);
           for var o := 0 to 14 do
           begin
             if o = k then
             begin
               readln(mob_main_spr,main_spr1);
               break;
             end;
             readln(mob_main_spr,main_spr1);
           end;
           TImage(FindComponent('en_img'+IntToStr(i+1))).Picture.LoadFromFile(main_spr1);
           closefile(mob_main_spr);

           AssignFile(mob_main_spr,'mobs\enemies_spr.txt');
           reset(mob_main_spr);
           for var o := 0 to 14 do
           begin
             if o = k then
             begin
               readln(mob_main_spr,spr1);
               break;
             end;
             readln(mob_main_spr,spr1);
           end;
           TImage(FindComponent('en_icon'+IntToStr(i+1))).Picture.LoadFromFile(spr1);
           closefile(mob_main_spr);
      end;
end;

procedure Tft.ftm_imgClick(Sender: TObject);
begin
  ftm.showmodal;
end;

procedure Tft.nextClick(Sender: TObject);        //атака персонажей
var mobhp: textfile;
    mob_main_spr : textfile;
    k : integer;
begin
  cursor2.Top := skill1.Top;
  cursor2.Left := skill1.left-40;
  cursor3.left := en_icon1.left-30;
  cursor3.top := en_icon1.top+30;

  if res1>0 then //откат хилки hp
  begin
    res1 := res1-1;
  end;

  if res2>0 then //откат хилки mp
  begin
    res2 := res2-1;
  end;

  if (motion = 0) and (hpp[0]>0) then
  begin
    if hero_attack = 0 then
    begin
      enhp[target] := enhp[target]-(15+random(5));
    end
    else if hero_attack = 1 then
    begin
      enhp[target] := enhp[target]-(25+random(10));
      mpp[0] := mpp[0]-20;
    end
    else if hero_attack = 2 then
    begin
      enhp[target] := enhp[target]-(20+random(5));
      mpp[0] := mpp[0]-10;
    end
    else if hero_attack = 3 then
    begin
      enhp[target] := enhp[target]-(35+random(10));
      mpp[0] := mpp[0]-30;
    end
    else if hero_attack = 4 then
    begin
      hpp[0] := hpp[0]+50;
      if hpp[0]>mhp[0] then hpp[0] := mhp[0];
      k_hp.Caption := IntToStr(hpp[0])+'/'+ IntToStr(mhp[0]);
      res1 := 8;
    end
    else if hero_attack = 5 then
    begin
      mpp[0] := mpp[0]+50;
      if mpp[0]>mmp[0] then mpp[0] := mmp[0];
      res2 := 8;
    end;
    k_mp.Caption := IntToStr(mpp[0])+'/'+ IntToStr(mmp[0]);
  end
  else if (motion = 1) and (hpp[1]>0) then
  begin
    if hero_attack = 0 then
    begin
      enhp[target] := enhp[target]-(10+random(5));
    end
    else if hero_attack = 1 then
    begin
      enhp[target] := enhp[target]-(25+random(30));
      mpp[1] := mpp[1]-30;
    end
    else if hero_attack = 2 then
    begin
      enhp[target] := enhp[target]-(35+random(5));
      mpp[1] := mpp[1]-40;
    end
    else if hero_attack = 3 then
    begin
      enhp[target] := enhp[target]-(40+random(10));
      mpp[1] := mpp[1]-60;
    end
    else if hero_attack = 4 then
    begin
      hpp[1] := hpp[1]+50;
      if hpp[1]>mhp[1] then hpp[1] := mhp[1];
      w_hp.Caption := IntToStr(hpp[1])+'/'+ IntToStr(mhp[1]);
      res1 := 8;
    end
    else if hero_attack = 5 then
    begin
      mpp[1] := mpp[1]+50;
      if mpp[1]>mmp[1] then mpp[1] := mmp[1];
      res2 := 8;
    end;
    w_mp.Caption := IntToStr(mpp[1])+'/'+ IntToStr(mmp[1]);
  end
  else if (motion = 2) and (hpp[2]>0) then
  begin
    if hero_attack = 0 then
    begin
      enhp[target] := enhp[target]-(10+random(5));
    end
    else if hero_attack = 1 then
    begin
      for var i := 0 to 2 do
      begin
        hpp[i] := hpp[i]+25;
        if hpp[i]>mhp[i] then hpp[i] := mhp[i];
      end;
      mpp[2] := mpp[2]-30;
      k_hp.Caption := IntToStr(hpp[0])+'/'+ IntToStr(mhp[0]);
      w_hp.Caption := IntToStr(hpp[1])+'/'+ IntToStr(mhp[1]);
      h_hp.Caption := IntToStr(hpp[2])+'/'+ IntToStr(mhp[2]);
    end
    else if hero_attack = 2 then
    begin
      for var i := 0 to 2 do
      begin
        mpp[i] := mpp[i]+25;
        if mpp[i]>mmp[i] then mpp[i] := mmp[i];
      end;
      mpp[2] := mpp[2]-15;
      k_mp.Caption := IntToStr(mpp[0])+'/'+ IntToStr(mmp[0]);
      w_mp.Caption := IntToStr(mpp[1])+'/'+ IntToStr(mmp[1]);
    end
    else if hero_attack = 3 then
    begin
      for var i := 0 to 2 do
      begin
        hpp[i] := hpp[i]+50;
        if hpp[i]>mhp[i] then hpp[i] := mhp[i];
      end;
      mpp[2] := mpp[2]-45;
      k_hp.Caption := IntToStr(hpp[0])+'/'+ IntToStr(mhp[0]);
      w_hp.Caption := IntToStr(hpp[1])+'/'+ IntToStr(mhp[1]);
      h_hp.Caption := IntToStr(hpp[2])+'/'+ IntToStr(mhp[2]);
    end
    else if hero_attack = 4 then
    begin
      hpp[2] := hpp[2]+50;
      if hpp[2]>mhp[2] then hpp[2] := mhp[2];
      h_hp.Caption := IntToStr(hpp[2])+'/'+ IntToStr(mhp[2]);
      res1 := 8;
    end
    else if hero_attack = 5 then
    begin
      mpp[2] := mpp[2]+50;
      if mpp[2]>mmp[2] then mpp[2] := mmp[2];
      res2 := 8;
    end;
    h_mp.Caption := IntToStr(mpp[2])+'/'+ IntToStr(mmp[2]);
  end;

  inf.Lines.Clear;
  hero_attack := 0;

  for var i := 0 to 5 do                         //убийство мобов
    begin
      if enhp[i]<=0 then
      begin
        TImage(FindComponent('en_icon'+IntToStr(i+1))).Picture := nil;
        TImage(FindComponent('en_img'+IntToStr(i+1))).Picture := nil;
      end;
    end;

  if (enhp[0]<=0) and (enhp[1]<=0) and (enhp[2]<=0) and (enhp[3]<=0) and (enhp[4]<=0) and (enhp[5]<=0) then
  begin
    if round = 3 then
    begin
      AssignFile(load,'levels/load.dat');   //     победа
      rewrite(load);
      lev := 4;
      write(load,lev);
      Closefile(load);
      next.Enabled := false;
      roundl.Caption := 'Ты выиграл!';
      Timer2.Enabled := true;
    end
    else                                       //смена раунда
    begin
      round := round+1;
      col := random(6);

      roundl.Caption := 'Раунд '+ IntToStr(round);
      Timer1.Enabled := true;
                                                    //рандом мобов
     for var i := 0 to col do
       begin
         k := random(15);
         enind[i] := k;
            AssignFile(mobhp,'mobs\enemies_hp.txt');
            reset(mobhp);
            for var o := 0 to 14 do
            begin
              if o = k then
              begin
                readln(mobhp,en1);
                break;
              end;
              readln(mobhp,en1);
            end;
            enhp[i] := StrToInt(en1);
            closefile(mobhp);

            AssignFile(mob_main_spr,'mobs\enemies_main_spr.txt');
            reset(mob_main_spr);
             for var o := 0 to 2 do
              begin
               if o = k then
               begin
                readln(mob_main_spr,main_spr1);
                break;
               end;
              readln(mob_main_spr,main_spr1);
              end;
              TImage(FindComponent('en_img'+IntToStr(i+1))).Picture.LoadFromFile(main_spr1);
              closefile(mob_main_spr);

              AssignFile(mob_main_spr,'mobs\enemies_spr.txt');
              reset(mob_main_spr);
              for var o := 0 to 2 do
              begin
               if o = k then
               begin
                 readln(mob_main_spr,spr1);
                 break;
               end;
               readln(mob_main_spr,spr1);
              end;
             TImage(FindComponent('en_icon'+IntToStr(i+1))).Picture.LoadFromFile(spr1);
              closefile(mob_main_spr);
       end;
    end;
  end;

  motion := motion+1;                          //переход хода
  if (motion = 0) and (hpp[motion] = 0) then
    motion := motion+1;
  if (motion = 1) and (hpp[motion] = 0) then
    motion := motion+1;
  if (motion = 2) and (hpp[motion] = 0) then
    motion := motion+1;

  if motion >= 3 then
  begin
    motion := 0 ;

    for var i := 0 to 5 do
    begin
      if enhp[i]>0 then
      begin
        k := random(3);
        hpp[k] := hpp[k]-(10+random(20));
        if hpp[k]<0 then hpp[k] := 0
      end;
    end;

    k_hp.Caption := IntToStr(hpp[0])+'/'+ IntToStr(mhp[0]);
    w_hp.Caption := IntToStr(hpp[1])+'/'+ IntToStr(mhp[1]);
    h_hp.Caption := IntToStr(hpp[2])+'/'+ IntToStr(mhp[2]);

    if hpp[0]=0 then k_img.Picture := nil;           //смерть персонажей
    if hpp[1]=0 then w_img.Picture := nil;
    if hpp[2]=0 then h_img.Picture := nil;

    if (hpp[0]=0) and (hpp[1]=0) and (hpp[2]=0) then
    begin
      next.Enabled := false;
      roundl.Caption := 'Ты проиграл!';
      Timer2.Enabled := true;
    end;
  end;

  if motion = 0 then
  begin
    cursor1.Top := Knight_l.Top;
  end
  else if motion = 1 then
  begin
    cursor1.Top := Wizzard_l.Top;
  end
  else if motion = 2 then
  begin
    cursor1.Top := Hiller_l.Top;
  end;


  next.Enabled := false;
end;

procedure Tft.skill1Click(Sender: TObject);     // выбор скила 1
begin
  if motion = 0 then
  begin
     if mpp[0] >= 0 then
     begin
       cursor2.Top := skill1.Top;
       cursor2.Left := skill1.left-40;
       hero_attack := 0;
       inf.Lines.LoadFromFile('inf\k1.txt');
     end;
  end
  else if motion = 1 then
  begin
    if mpp[1] >= 0 then
     begin
       cursor2.Top := skill1.Top;
       cursor2.Left := skill1.left-40;
       hero_attack := 0;
       inf.Lines.LoadFromFile('inf\w1.txt');
     end;
  end
  else if motion = 2 then
  begin
     if mpp[2] >= 0 then
     begin
       cursor2.Top := skill1.Top;
       cursor2.Left := skill1.left-40;
       hero_attack := 0;
       inf.Lines.LoadFromFile('inf\h1.txt');
     end;
  end;
end;

procedure Tft.skill2Click(Sender: TObject);       //2
begin
  if motion = 0 then
  begin
     if mpp[0] >= 20 then
     begin
       cursor2.Top := skill2.Top;
       cursor2.Left := skill2.left-40;
       hero_attack := 1;
       inf.Lines.LoadFromFile('inf\k2.txt');
     end;
  end
  else if motion = 1 then
  begin
    if mpp[1] >= 30 then
     begin
       cursor2.Top := skill2.Top;
       cursor2.Left := skill2.left-40;
       hero_attack := 1;
       inf.Lines.LoadFromFile('inf\w2.txt');
     end;
  end
  else if motion = 2 then
  begin
     if mpp[2] >= 30 then
     begin
       cursor2.Top := skill2.Top;
       cursor2.Left := skill2.left-40;
       hero_attack := 1;
       inf.Lines.LoadFromFile('inf\h2.txt');
     end;
  end;
end;

procedure Tft.skill3Click(Sender: TObject);       //3
begin
  if motion = 0 then
  begin
     if mpp[0] >= 10 then
     begin
       cursor2.Top := skill3.Top;
       cursor2.Left := skill3.left-40;
       hero_attack := 2;
       inf.Lines.LoadFromFile('inf\k3.txt');
     end;
  end
  else if motion = 1 then
  begin
    if mpp[1] >= 40 then
     begin
       cursor2.Top := skill3.Top;
       cursor2.Left := skill3.left-40;
       hero_attack := 2;
       inf.Lines.LoadFromFile('inf\w3.txt');
     end;
  end
  else if motion = 2 then
  begin
     if mpp[2] >= 15 then
     begin
       cursor2.Top := skill3.Top;
       cursor2.Left := skill3.left-40;
       hero_attack := 2;
       inf.Lines.LoadFromFile('inf\h3.txt');
     end;
  end;
end;

procedure Tft.skill4Click(Sender: TObject);     //4
begin
  if motion = 0 then
  begin
     if mpp[0] >= 30 then
     begin
       cursor2.Top := skill4.Top;
       cursor2.Left := skill4.left-40;
       hero_attack := 3;
       inf.Lines.LoadFromFile('inf\k4.txt');
     end;
  end
  else if motion = 1 then
  begin
    if mpp[1] >= 70 then
     begin
       cursor2.Top := skill4.Top;
       cursor2.Left := skill4.left-40;
       hero_attack := 3;
       inf.Lines.LoadFromFile('inf\w4.txt');
     end;
  end
  else if motion = 2 then
  begin
     if mpp[2] >= 45 then
     begin
       cursor2.Top := skill4.Top;
       cursor2.Left := skill4.left-40;
       hero_attack := 3;
       inf.Lines.LoadFromFile('inf\h4.txt');
     end;
  end;
end;

procedure Tft.Timer1Timer(Sender: TObject);
begin
  roundl.Caption := '';
end;

procedure Tft.Timer2Timer(Sender: TObject);
begin
  ft.Close;
  Timer2.Enabled := false;
end;

procedure Tft.Timer3Timer(Sender: TObject);
begin
  music.Play;
end;

end.
