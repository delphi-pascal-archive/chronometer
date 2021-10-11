object Form2: TForm2
  Left = 589
  Top = 165
  BorderStyle = bsDialog
  Caption = 'Set countdown value...'
  ClientHeight = 120
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  DesignSize = (
    600
    120)
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 428
    Top = 83
    Width = 75
    Height = 28
    Anchors = [akRight, akBottom]
    Enabled = False
    TabOrder = 0
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 518
    Top = 83
    Width = 75
    Height = 28
    Anchors = [akRight, akBottom]
    TabOrder = 1
    Kind = bkCancel
  end
  object RadioGroup1: TRadioGroup
    Left = 10
    Top = 10
    Width = 401
    Height = 101
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Standard Values'
    Columns = 5
    Items.Strings = (
      '30s'
      '1min'
      '1min 30s'
      '2min'
      '2min 30s'
      '3min'
      '4min'
      '5min'
      '6min'
      '10min'
      '15min'
      '20min'
      '30min'
      '45min'
      '1h'
      '1h 30min'
      '2h'
      '3h'
      '5h'
      '10h')
    TabOrder = 2
    OnClick = RadioGroup1Click
  end
  object UpDown1: TUpDown
    Left = 460
    Top = 40
    Width = 18
    Height = 21
    Anchors = [akTop, akRight]
    Associate = Edit1
    TabOrder = 3
    OnClick = UpDown1Click
  end
  object Edit1: TEdit
    Left = 430
    Top = 40
    Width = 30
    Height = 21
    Anchors = [akTop, akRight]
    BevelKind = bkFlat
    BorderStyle = bsNone
    ReadOnly = True
    TabOrder = 4
    Text = '0'
  end
  object UpDown2: TUpDown
    Left = 516
    Top = 40
    Width = 18
    Height = 21
    Anchors = [akTop, akRight]
    Associate = Edit2
    Max = 60
    TabOrder = 5
    OnClick = UpDown1Click
  end
  object Edit2: TEdit
    Left = 486
    Top = 40
    Width = 30
    Height = 21
    Anchors = [akTop, akRight]
    BevelKind = bkFlat
    BorderStyle = bsNone
    ReadOnly = True
    TabOrder = 6
    Text = '0'
  end
  object UpDown3: TUpDown
    Left = 572
    Top = 40
    Width = 18
    Height = 21
    Anchors = [akTop, akRight]
    Associate = Edit3
    Max = 60
    TabOrder = 7
    OnClick = UpDown1Click
  end
  object Edit3: TEdit
    Left = 542
    Top = 40
    Width = 30
    Height = 21
    Anchors = [akTop, akRight]
    BevelKind = bkFlat
    BorderStyle = bsNone
    ReadOnly = True
    TabOrder = 8
    Text = '0'
  end
end
