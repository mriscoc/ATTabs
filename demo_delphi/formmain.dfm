object Form1: TForm1
  Left = 195
  Top = 260
  Width = 805
  Height = 384
  Caption = 'ATTabs demo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object chkFlat: TCheckBox
    Left = 72
    Top = 104
    Width = 97
    Height = 17
    Caption = 'flat tabs'
    TabOrder = 0
    OnClick = chkFlatClick
  end
end
