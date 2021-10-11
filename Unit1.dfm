object Form1: TForm1
  Left = 241
  Top = 139
  BorderStyle = bsNone
  ClientHeight = 74
  ClientWidth = 265
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clLime
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = True
  ScreenSnap = True
  SnapBuffer = 30
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnMouseDown = FormMouseDown
  DesignSize = (
    265
    74)
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 265
    Height = 55
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = '00:00:00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -47
    Font.Name = 'Lucida Console'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
    OnMouseDown = FormMouseDown
  end
  object SpeedButton1: TSpeedButton
    Left = 246
    Top = 0
    Width = 19
    Height = 18
    Anchors = [akTop, akRight]
    Caption = 'x'
    Flat = True
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clSkyBlue
    Font.Height = -25
    Font.Name = 'Wingdings'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton1Click
  end
  object Label2: TLabel
    Left = 0
    Top = 47
    Width = 265
    Height = 27
    Align = alBottom
    Alignment = taCenter
    AutoSize = False
    Caption = 'Total time: 00:00:00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clAqua
    Font.Height = -20
    Font.Name = 'Lucida Console'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    OnMouseDown = FormMouseDown
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 10
    Top = 10
  end
end
