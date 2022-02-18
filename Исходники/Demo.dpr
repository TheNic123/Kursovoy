program Demo;

uses
  Vcl.Forms,
  MainMenu in 'MainMenu.pas' {MM},
  Fight in 'Fight.pas' {ft},
  ft_menu in 'ft_menu.pas' {ftm},
  Mhub in 'Mhub.pas' {hub},
  Mconf in 'Mconf.pas' {conf},
  Mhelp in 'Mhelp.pas' {help},
  Mfinal in 'Mfinal.pas' {finalf},
  Mzst in 'Mzst.pas' {zst},
  Mabout in 'Mabout.pas' {about};

{$R *.res}

begin
  Application.Initialize;
  zst := Tzst.Create(Application);
  zst.Show;
  zst.Update;
  while zst.Timer1.Enabled do
    Application.ProcessMessages;
  Application.HelpFile := '';
  Application.CreateForm(TMM, MM);
  Application.CreateForm(Tabout, about);
  zst.Hide;
  zst.Free;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tft, ft);
  Application.CreateForm(Tftm, ftm);
  Application.CreateForm(Thub, hub);
  Application.CreateForm(Tconf, conf);
  Application.CreateForm(Thelp, help);
  Application.CreateForm(Tfinalf, finalf);
  Application.Run;
end.
