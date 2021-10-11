unit WaveOut;

interface

uses
  SysUtils,MMSystem,Windows,Classes,SyncObjs,WaveBase;

type
  TWaveOut=class(TWaveBase)         //Nothing new, just overriden methods
  protected
    class function GetAPIDeviceOpenProc:TAPIDeviceOpenProc;override;
    class function GetAPIDeviceCloseProc:TAPIDeviceCloseProc;override;
    class function GetErrorMSG(ErrorID:MMResult):string;override;
    procedure DoStop;override;
    procedure DoStart;override;
    procedure DoCallBack(uMSG:UINT;dwParam1,dwParam2:DWORD);override;

    procedure PrepareBuffer(var Buffer:TWaveBuffer);override;
    procedure UnPrepareBuffer(var Buffer:TWaveBuffer);override;
    procedure AddBuffer(var Buffer:TWaveBuffer);override;
    procedure PreBuffering;override;
    procedure PostBuffering;override;
  end;

implementation

{ TWaveOut }

procedure TWaveOut.AddBuffer(var Buffer: TWaveBuffer);
begin
  MMCheck(waveOutWrite(Handle,@Buffer,SizeOf(Buffer)));
end;

procedure TWaveOut.DoCallBack(uMSG: UINT; dwParam1, dwParam2: DWORD);
begin
  case uMsg of
    WOM_DONE:begin
      TBufferEvent(PWaveHdr(dwParam1).dwUser).SetEvent;
      FCurrentServerBufferIndex:=TBufferEvent(PWaveHdr(dwParam1).dwUser).FIndex;
    end;
  end;
end;

procedure TWaveOut.DoStart;
begin
  MMCheck(WaveOutRestart(Handle));
end;

procedure TWaveOut.DoStop;
begin
//  MMCheck(WaveOutPause(Handle));
end;

class function TWaveOut.GetAPIDeviceCloseProc: TAPIDeviceCloseProc;
begin
  Result:=WaveOutClose;
end;

class function TWaveOut.GetAPIDeviceOpenProc: TAPIDeviceOpenProc;
begin
  @Result:=@WaveOutOpen;
end;

class function TWaveOut.GetErrorMSG(ErrorID: MMResult): string;
var
  p:array[0..MAXERRORLENGTH] of Char;
begin
  if WaveOutGetErrorText(ErrorID,@p,MAXERRORLENGTH)=0 then
    Result:=p
  else
    Result:='Recursive error';
end;

procedure TWaveOut.PostBuffering;
begin

end;

procedure TWaveOut.PreBuffering;
begin
  if Assigned(OnBuffer) then
    with FBuffers[FCurrentClientBufferIndex] do
      OnBuffer(lpData,dwBufferLength,BufferQueueLength);
end;

procedure TWaveOut.PrepareBuffer(var Buffer: TWaveBuffer);
begin
  MMCheck(waveOutPrepareHeader(Handle,@Buffer,SizeOf(Buffer)));
end;

procedure TWaveOut.UnPrepareBuffer(var Buffer: TWaveBuffer);
begin
  MMCheck(waveOutUnPrepareHeader(Handle,@Buffer,SizeOf(Buffer)));
end;

end.

