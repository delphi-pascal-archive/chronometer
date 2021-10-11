unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, IniFiles;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RadioGroup1: TRadioGroup;
    UpDown1: TUpDown;
    Edit1: TEdit;
    UpDown2: TUpDown;
    Edit2: TEdit;
    UpDown3: TUpDown;
    Edit3: TEdit;
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

const GStandardValues:array[0..19] of Integer=(
  30,
  60,
  90,
  120,
  150,
  180,
  240,
  300,
  360,
  600,

  15*60,
  20*60,
  30*60,
  45*60,
  60*60,
  90*60,
  120*60,
  180*60,
  300*60,
  600*60
);

implementation

{$R *.dfm}

procedure TForm2.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  BitBtn1.Enabled:=UpDown1.Position+UpDown2.Position+UpDown3.Position<>0;
end;

procedure TForm2.RadioGroup1Click(Sender: TObject);
begin
  UpDown1.Position:=GStandardValues[RadioGroup1.ItemIndex] div 3600;
  UpDown2.Position:=(GStandardValues[RadioGroup1.ItemIndex] div 60) mod 60;
  UpDown3.Position:=GStandardValues[RadioGroup1.ItemIndex] mod 60;
  UpDown1Click(nil,btNext);
end;

procedure TForm2.FormCreate(Sender: TObject);
var
  f:TIniFile;
begin
  f:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
  try
    UpDown1.Position:=f.ReadInteger('Value','H',0);
    UpDown2.Position:=f.ReadInteger('Value','M',0);
    UpDown3.Position:=f.ReadInteger('Value','S',0);
    UpDown1Click(nil,btNext);
  finally
    f.Destroy;
  end;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
var
  f:TIniFile;
begin
  f:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
  try
    f.WriteInteger('Value','H',UpDown1.Position);
    f.WriteInteger('Value','M',UpDown2.Position);
    f.WriteInteger('Value','S',UpDown3.Position);
  finally
    f.Destroy;
  end;
end;

end.

