program Tea;

uses
  Forms,
  Controls,
  Windows,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  if Form2.ShowModal=mrOk then begin
    with Application do
      SetWindowLong(Handle,GWL_EXSTYLE,GetWindowLong(Handle,GWL_EXSTYLE) or WS_EX_TOOLWINDOW and not WS_EX_APPWINDOW);
    with Form2 do
      GTotalTime:=1000*(UpDown1.Position*3600+UpDown2.Position*60+UpDown3.Position);
    Form1.FFirstTick:=GetTickCount;
    Form1.Timer1.Enabled:=True;
    Form1.Timer1Timer(nil);
    Application.Run;
  end;
end.

