unit Mfinal; //форма финала игры

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  Tfinalf = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Label4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  finalf: Tfinalf;

implementation

{$R *.dfm}

uses MainMenu, Mhub;

procedure Tfinalf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  hub.close;
  MM.show;
end;

procedure Tfinalf.Label4Click(Sender: TObject);
begin
  finalf.close;
end;

end.
