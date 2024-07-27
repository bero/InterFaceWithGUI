object Main: TMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 87
  ClientWidth = 187
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object lblResult: TLabel
    Left = 8
    Top = 54
    Width = 32
    Height = 15
    Caption = 'Result'
  end
  object btnResult: TButton
    Left = 8
    Top = 20
    Width = 159
    Height = 25
    Caption = 'Get result'
    TabOrder = 0
    OnClick = btnResultClick
  end
  object txtResult: TEdit
    Left = 46
    Top = 51
    Width = 121
    Height = 23
    TabOrder = 1
  end
end
