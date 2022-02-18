unit Mhelp; //как играть

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  Thelp = class(TForm)
    Image1: TImage;
    menu: TLabel;
    Hub: TLabel;
    ft: TLabel;
    Label1: TLabel;
    procedure menuClick(Sender: TObject);
    procedure HubClick(Sender: TObject);
    procedure ftClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  help: Thelp;

implementation

{$R *.dfm}

procedure Thelp.ftClick(Sender: TObject);
begin
  image1.Picture.LoadFromFile('help\HFT.png');
end;

procedure Thelp.HubClick(Sender: TObject);
begin
  image1.Picture.LoadFromFile('help\HHub.png');
end;


procedure Thelp.Label1Click(Sender: TObject);
begin
  help.close;
end;

procedure Thelp.menuClick(Sender: TObject);
begin
  image1.Picture.LoadFromFile('help\HMM.png');
end;

end.
