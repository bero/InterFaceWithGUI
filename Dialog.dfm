object DialogForm: TDialogForm
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Dialog'
  ClientHeight = 114
  ClientWidth = 216
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  DesignSize = (
    216
    114)
  TextHeight = 15
  object lblName: TLabel
    Left = 24
    Top = 24
    Width = 32
    Height = 15
    Caption = 'Name'
  end
  object btnOk: TButton
    Left = 42
    Top = 68
    Width = 65
    Height = 31
    Anchors = [akRight, akBottom]
    Caption = '&Ok'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object btnCancel: TButton
    Left = 129
    Top = 68
    Width = 71
    Height = 31
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object txtName: TEdit
    Left = 62
    Top = 21
    Width = 138
    Height = 23
    TabOrder = 2
    TextHint = 'Enter any name here'
  end
end
