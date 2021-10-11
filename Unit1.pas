unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, WaveBase, WaveOut, IniFiles;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure WaveOut1Buffer(Buffer: Pointer; Length: Cardinal;
      BufferQueueLength: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
  public
    FFirstTick,FDeltaSound,FSoundIntensity:Integer;
    FFlash:Boolean;
    WaveOut1: TWaveOut;
  end;

var
  Form1: TForm1;
  GTotalTime:Integer;

const
  GMillisecondsPerDay=3600*1000*24;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  f:TIniFile;
  h1,h2:HRGN;
const
  Rounding=15;
begin
  WaveOut1:=TWaveOut.Create(Self);
  WaveOut1.Bits16:=True;
  WaveOut1.BufferSize:=2048;
  WaveOut1.DeviceID:=-1;
  WaveOut1.OnBuffer:=WaveOut1Buffer;
  h1:=CreateRoundRectRgn(0,0,ClientWidth+1,ClientHeight+1,Rounding,Rounding);
  with SpeedButton1.BoundsRect do
    h2:=CreateRectRgn(Left,Top,Right,Bottom);
  CombineRgn(h1,h1,h2,RGN_OR);
  DeleteObject(h2);
  SetWindowRgn(Handle,h1,False);
  DeleteObject(h1);
  f:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
  try
    Left:=f.ReadInteger('Position','X',0);
    Top:=f.ReadInteger('Position','Y',0);
  finally
    f.Destroy;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  t,u:Integer;
begin
  t:=Integer(GetTickCount)-FFirstTick;
  u:=GTotalTime-t;
  if u<6000 then
    WaveOut1.Start;
  if u<0 then begin
    FFlash:=not FFlash;
    if FFlash then
      Label1.Color:=clRed
    else
      Label1.Color:=0;
    u:=0;
  end;
  Label1.Caption:=TimeToStr(u/GMillisecondsPerDay);
  Label2.Caption:='Total time: '+TimeToStr(t/GMillisecondsPerDay);
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=27 then
    Close;
end;

procedure TForm1.WaveOut1Buffer(Buffer: Pointer; Length: Cardinal;
  BufferQueueLength: Integer);
type
  TSmallintArray=array[0..$FFFFFF] of Smallint;
  PSmallintArray=^TSmallintArray;
var
  p:PSmallintArray;
  i:Integer;

  function Signal(x:Single):Smallint;
  begin
    if Frac(x/3000)<0.8 then
      Result:=0
    else begin
      if Cos(x)>0 then
        Result:=FSoundIntensity
      else
        Result:=-FSoundIntensity;
    end;
  end;

begin
  p:=Buffer;
  Length:=Length div 2;
  for i:=0 to Length-1 do
    p[i]:=Signal(0.3*(i+FDeltaSound));
  FDeltaSound:=FDeltaSound+Integer(Length);
  Inc(FSoundIntensity,5+FSoundIntensity div 20);
  if FSoundIntensity>32000 then
    FSoundIntensity:=32000;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  f:TIniFile;
begin
  f:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
  try
    f.WriteInteger('Position','X',Left);
    f.WriteInteger('Position','Y',Top);
  finally
    f.Destroy;
  end;
end;

procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SYSCOMMAND,$f012,0);
end;

end.

