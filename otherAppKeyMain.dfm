object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'frmMain'
  ClientHeight = 819
  ClientWidth = 684
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 684
    Height = 41
    Align = alTop
    Alignment = taLeftJustify
    TabOrder = 0
    ExplicitWidth = 426
    object Button1: TButton
      Left = 11
      Top = 8
      Width = 86
      Height = 28
      Caption = 'rePOp'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button3: TButton
      Left = 584
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 1
      OnClick = Button3Click
    end
    object CheckBox4: TCheckBox
      Left = 112
      Top = 16
      Width = 97
      Height = 17
      Caption = 'Mouse hooking'
      TabOrder = 2
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 800
    Width = 684
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 50
      end>
    ExplicitTop = 364
    ExplicitWidth = 426
  end
  object PageControl1: TPageControl
    Left = 185
    Top = 41
    Width = 499
    Height = 759
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 2
    ExplicitWidth = 488
    object TabSheet1: TTabSheet
      Caption = #54589#54589#49324#50857
      object Memo2: TMemo
        Left = 0
        Top = 105
        Width = 491
        Height = 626
        Align = alClient
        Lines.Strings = (
          'Memo2')
        TabOrder = 0
        ExplicitLeft = 1
        ExplicitTop = 103
        ExplicitWidth = 480
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 491
        Height = 105
        Align = alTop
        TabOrder = 1
        ExplicitWidth = 480
        object SpeedButton1: TSpeedButton
          Left = 145
          Top = 58
          Width = 116
          Height = 34
          Caption = 'Check'
          OnClick = SpeedButton1Click
        end
        object Label1: TLabel
          Left = 15
          Top = 67
          Width = 44
          Height = 13
          Caption = #50672#49549#46041#51089
        end
        object RadioGroup1: TRadioGroup
          Left = 2
          Top = 3
          Width = 140
          Height = 49
          Caption = 'Key'
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            'Mouse'
            'Keynoard')
          TabOrder = 0
        end
        object GroupBox1: TGroupBox
          Left = 146
          Top = 0
          Width = 153
          Height = 47
          Caption = 'Position'
          TabOrder = 1
          object Label2: TLabel
            Left = 8
            Top = 20
            Width = 10
            Height = 13
            Caption = 'X:'
          end
          object Label3: TLabel
            Left = 76
            Top = 19
            Width = 10
            Height = 13
            Caption = 'Y:'
          end
          object Edit1: TEdit
            Left = 23
            Top = 16
            Width = 47
            Height = 21
            TabOrder = 0
            Text = '3115'
          end
          object Edit2: TEdit
            Left = 97
            Top = 17
            Width = 48
            Height = 21
            TabOrder = 1
            Text = '1078'
          end
        end
        object RadioGroup2: TRadioGroup
          Left = 315
          Top = 0
          Width = 147
          Height = 44
          Caption = 'Insert Key'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'right'
            'pagedown')
          TabOrder = 2
        end
        object Edit3: TEdit
          Left = 68
          Top = 62
          Width = 31
          Height = 21
          TabOrder = 3
          Text = '80'
        end
        object CheckBox1: TCheckBox
          Left = 104
          Top = 65
          Width = 31
          Height = 17
          Caption = 'C'
          TabOrder = 4
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #51088#52404#49324#50857
      ImageIndex = 1
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 491
        Height = 137
        Align = alTop
        TabOrder = 0
        ExplicitLeft = 1
        object Label4: TLabel
          Left = 206
          Top = 17
          Width = 44
          Height = 13
          Caption = #50672#49549#46041#51089
        end
        object Label5: TLabel
          Left = 171
          Top = 91
          Width = 153
          Height = 13
          Caption = 'Save Folder : now folder\Save'
        end
        object Label6: TLabel
          Left = 171
          Top = 115
          Width = 44
          Height = 13
          Caption = 'Start No:'
        end
        object LabeledEdit1: TLabeledEdit
          Left = 8
          Top = 14
          Width = 43
          Height = 21
          EditLabel.Width = 19
          EditLabel.Height = 13
          EditLabel.Caption = 'Left'
          TabOrder = 0
          Text = '40'
        end
        object LabeledEdit2: TLabeledEdit
          Left = 57
          Top = 14
          Width = 43
          Height = 21
          EditLabel.Width = 18
          EditLabel.Height = 13
          EditLabel.Caption = 'Top'
          TabOrder = 1
          Text = '228'
        end
        object LabeledEdit3: TLabeledEdit
          Left = 106
          Top = 14
          Width = 43
          Height = 21
          EditLabel.Width = 25
          EditLabel.Height = 13
          EditLabel.Caption = 'Right'
          TabOrder = 2
          Text = '1047'
        end
        object LabeledEdit4: TLabeledEdit
          Left = 155
          Top = 14
          Width = 43
          Height = 21
          EditLabel.Width = 34
          EditLabel.Height = 13
          EditLabel.Caption = 'Bottom'
          TabOrder = 3
          Text = '1645'
        end
        object Button2: TButton
          Left = 355
          Top = 14
          Width = 114
          Height = 86
          Caption = 'Start'
          TabOrder = 4
          OnClick = Button2Click
        end
        object Edit4: TEdit
          Left = 257
          Top = 13
          Width = 31
          Height = 21
          TabOrder = 5
          Text = '80'
        end
        object CheckBox2: TCheckBox
          Left = 295
          Top = 14
          Width = 31
          Height = 17
          Caption = 'C'
          TabOrder = 6
        end
        object RadioGroup3: TRadioGroup
          Left = 9
          Top = 80
          Width = 151
          Height = 50
          Caption = 'Insert Key'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'right'
            'pagedown')
          TabOrder = 7
        end
        object Edit5: TEdit
          Left = 220
          Top = 112
          Width = 42
          Height = 21
          TabOrder = 8
          Text = '1'
        end
        object CheckBox3: TCheckBox
          Left = 268
          Top = 114
          Width = 79
          Height = 17
          Caption = 'Auto Save'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 9
        end
        object Button4: TButton
          Left = 356
          Top = 106
          Width = 111
          Height = 25
          Caption = 'Save'
          Enabled = False
          TabOrder = 10
        end
        object RadioGroup4: TRadioGroup
          Left = 8
          Top = 39
          Width = 150
          Height = 43
          Caption = 'Key'
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            'Mouse'
            'Keynoard')
          TabOrder = 11
        end
        object GroupBox2: TGroupBox
          Left = 164
          Top = 40
          Width = 164
          Height = 44
          Caption = 'Position'
          TabOrder = 12
          object Label7: TLabel
            Left = 8
            Top = 20
            Width = 10
            Height = 13
            Caption = 'X:'
          end
          object Label8: TLabel
            Left = 76
            Top = 19
            Width = 10
            Height = 13
            Caption = 'Y:'
          end
          object Edit6: TEdit
            Left = 23
            Top = 16
            Width = 47
            Height = 21
            TabOrder = 0
            Text = '3115'
          end
          object Edit7: TEdit
            Left = 97
            Top = 17
            Width = 48
            Height = 21
            TabOrder = 1
            Text = '1078'
          end
        end
      end
      object ImageEnView1: TImageEnView
        Left = 85
        Top = 154
        Width = 406
        Height = 577
        Align = alClient
        TabOrder = 1
        ExplicitLeft = 91
        ExplicitTop = 112
        ExplicitHeight = 617
      end
      object ImageEnMView1: TImageEnMView
        Left = 0
        Top = 154
        Width = 85
        Height = 577
        Align = alLeft
        TabOrder = 2
        StoreType = ietNormal
        ThumbWidth = 50
        ThumbHeight = 50
        TextMargin = 0
        MultiSelectionOptions = []
        DefaultTopText = iedtNone
        DefaultInfoText = iedtNone
        DefaultBottomText = iedtNone
        ExplicitTop = 114
        ExplicitHeight = 617
      end
      object ProgressBar1: TProgressBar
        Left = 0
        Top = 137
        Width = 491
        Height = 17
        Align = alTop
        TabOrder = 3
        ExplicitLeft = 184
        ExplicitTop = 128
        ExplicitWidth = 150
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 185
    Height = 759
    Align = alLeft
    Caption = 'Panel2'
    TabOrder = 3
    ExplicitTop = 39
    object ListBox1: TListBox
      Left = 1
      Top = 1
      Width = 183
      Height = 367
      Align = alClient
      ItemHeight = 13
      TabOrder = 0
      ExplicitLeft = -40
      ExplicitTop = 41
      ExplicitWidth = 225
      ExplicitHeight = 323
    end
    object Memo1: TMemo
      Left = 1
      Top = 368
      Width = 183
      Height = 390
      Align = alBottom
      Lines.Strings = (
        'Memo1')
      TabOrder = 1
      ExplicitLeft = 0
      ExplicitTop = 363
    end
  end
end
