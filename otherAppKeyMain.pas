unit otherAppKeyMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.ComCtrls, System.ImageList, Vcl.ImgList, hyiedefs, hyieutils,
  iexBitmaps, iesettings, iexLayers, iexRulers, iexToolbars, iexUserInteractions, imageenio, imageenproc, iexProcEffects, ieview, imageenview, iemio,
  iemview;

type
  MouseLLHookStruct = record
    pt          : TPoint;
    mouseData   : cardinal;
    flags       : cardinal;
    time        : cardinal;
    dwExtraInfo : cardinal;
  end;

  TfrmMain = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    ListBox1: TListBox;
    Memo1: TMemo;
    Memo2: TMemo;
    Panel3: TPanel;
    ImageEnView1: TImageEnView;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    Button2: TButton;
    Panel4: TPanel;
    RadioGroup1: TRadioGroup;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    RadioGroup2: TRadioGroup;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Edit3: TEdit;
    CheckBox1: TCheckBox;
    Label4: TLabel;
    Edit4: TEdit;
    CheckBox2: TCheckBox;
    RadioGroup3: TRadioGroup;
    ImageEnMView1: TImageEnMView;
    Button3: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Edit5: TEdit;
    CheckBox3: TCheckBox;
    Button4: TButton;
    CheckBox4: TCheckBox;
    ProgressBar1: TProgressBar;
    RadioGroup4: TRadioGroup;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    aHandle: array[0..99] of HWND;
  end;

function LowLevelMouseHookProc(nCode, wParam, lParam : integer) : integer; stdcall;

var
  frmMain: TfrmMain;
  mHook : cardinal;

implementation

{$R *.dfm}

function LowLevelMouseHookProc(nCode, wParam, lParam : integer) : integer; stdcall;
// possible wParam values: WM_LBUTTONDOWN, WM_LBUTTONUP, WM_MOUSEMOVE, WM_MOUSEWHEEL, WM_RBUTTONDOWN, WM_RBUTTONUP
var
  info : ^MouseLLHookStruct absolute lParam;
  ned: word;
begin
  ned := 0;
  if not frmMain.CheckBox4.Checked then
     exit;

  result := CallNextHookEx(mHook, nCode, wParam, lParam);
  with info^ do begin
    frmMain.StatusBar1.Panels[0].text := '   X: '+IntToStr(pt.x)+'  Y: '+ IntToStr(pt.y);
    //frmMain.Edit1.Text := pt.x.ToString;
    //frmMain.Edit2.Text := pt.y.ToString;
    case wParam of
      wm_lbuttondown : begin frmMain.Memo1.Lines.Append(format('pressed left button (%d, %d)'    , [pt.x, pt.y])); ned := 1; end;
      wm_lbuttonup   : begin frmMain.Memo1.Lines.Append(format('released left button (%d, %d)'   , [pt.x, pt.y])); ned := 1; end;
      wm_mbuttondown : begin frmMain.Memo1.Lines.Append(format('pressed middle button (%d, %d)'  , [pt.x, pt.y])); ned := 0; end;
      wm_mbuttonup   : begin frmMain.Memo1.Lines.Append(format('released middle button (%d, %d)' , [pt.x, pt.y])); ned := 0; end;
      wm_rbuttondown : begin frmMain.Memo1.Lines.Append(format('pressed right button (%d, %d)'   , [pt.x, pt.y])); ned := 2; end;
      wm_rbuttonup   : begin frmMain.Memo1.Lines.Append(format('released right button (%d, %d)'  , [pt.x, pt.y])); ned := 2; end;
      wm_mousewheel  : begin
                         if smallInt(mouseData shr 16) > 0
                         then frmMain.Memo1.Lines.Append('scrolled wheel (up)')
                         else frmMain.Memo1.Lines.Append('scrolled wheel (down)');
                       end;
    end;
    {if ned = 1 then
    begin
      frmMain.LabeledEdit1.Text := pt.x.ToString;
      frmMain.LabeledEdit2.Text := pt.Y.ToString;
    end else
    if ned = 2 then
    begin
      frmMain.LabeledEdit3.Text := pt.x.ToString;
      frmMain.LabeledEdit4.Text := pt.Y.ToString;
    end;}
  end;
end;

function EnumWindowProc(hWindow: HWND; lParam: LPARAM): Boolean; stdcall;
  {function GetIcon(hWindow: HWND): HICON;
  begin
    Result := SendMessage(hWindow, WM_GETICON, ICON_SMALL2, 0);
    if Result = 0 then
    begin
      Result := SendMessage(hWindow, WM_GETICON, ICON_SMALL, 0);
      if Result = 0 then
        Result := GetClassLong(hWindow, GCL_HICONSM);
    end;
  end;}
Var
  WndText : string;
  AItem   : TListItem;
  //AIcon   : TIcon;
begin
  Result := True;
  if not IsWindowVisible(hWindow) then
     Exit; //보여지고 있는 프로그램만 리스트뷰에 추가합니다.

  SetLength(WndText, MAX_PATH);
  if GetWindowText(hWindow, PChar(WndText), MAX_PATH) > 0 then
  begin
    SetLength(WndText, StrLen(PChar(WndText)));
    frmMain.ListBox1.Items.Add(WndText);
    frmMain.aHandle[frmMain.ListBox1.Items.Count-1] := hWindow;
    {AIcon := TIcon.Create;
    try
      AItem := frmMain.ListView1.Items.Add;
      AItem.Caption := WndText;
      AIcon.Handle     := GetIcon(hWindow); //아이콘의 이미지 정보를 가져옵니다.
      AItem.ImageIndex := frmMain.ImageList1.AddIcon(AIcon);
    finally
      FreeAndNil(AIcon);
    end;}
  end;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  ListBox1.Items.Clear;
  //ImageList1.Clear;
  EnumWindows(Addr(EnumWindowProc), 0); //실행되고 있는 최상위 프로그램을 가져옵니다.
end;

procedure TfrmMain.Button2Click(Sender: TObject);
var
  TempBitmap : TBitmap;
  hHandle : HWND;
  hWin:HWND;
  hDC:HWND;  ///HDC
  i,x1,y1,x2,y2,xlen,ylen,xmax,ninx,nf1,x,y: integer;
  cdir,cfile:string;
  mbmp: TIEBitmap;
begin
  cdir := ExtractFilePath(paramstr(0)) + 'Save\';
  if not DirectoryExists(cdir) then mkdir(cdir);
  nInx := ListBox1.ItemIndex;
  x1 := strtoint(LabeledEdit1.Text);
  y1 := strtoint(LabeledEdit2.Text);
  x2 := strtoint(LabeledEdit3.Text);
  y2 := strtoint(LabeledEdit4.Text);
  xlen := x2-x1;
  ylen := y2-y1;
  x := strtoint(edit6.Text);
  y := strtoint(edit7.Text);
  ImageEnMView1.Clear;
  if nInx >= 0 then
  begin
    mbmp := TIEBitmap.Create;
    TempBitmap := TBitmap.Create;
    try
      xMax := strtointdef(edit4.Text,50);
      if not CheckBox2.Checked then
         xMax := 1;
      ProgressBar1.Max := xMax;
      for i := 1 to xMax do
      begin
        nf1 := strtoint(Edit5.Text) + (i-1);
        hWIn := aHandle[nInx];
        ShowWindow(hWin,SW_SHOW);
        SetForegroundWindow(hWin);
        //------------------------------
        TempBitmap.PixelFormat := pf32bit;
        TempBitmap.Width  := xlen;
        TempBitmap.Height := ylen;
        //hHandle := GetWindowDC(GetDeskTopWindow); //윈도우 화면의 핸들을 가져옵니다.
        //BitBlt(TempBitmap.Canvas.Handle, 0, 0, xlen, ylen, hHandle, 0, 0, SRCCOPY);
        hHandle := GetWindowDC(0); //GetDC(hWin); //윈도우 화면의 핸들을 가져옵니다.
        BitBlt(TempBitmap.Canvas.Handle, 0, 0, xlen, ylen, hHandle, x1, y1, SRCCOPY);
        //2~4번째 파라미터 : TempBitmap에 이미지가 복사될 위치와 크기를 정합니다.
        //7~8번째 파라미터 : 윈도우 화면에서 복사를 시작할 위치를 정합니다.
        //9번째 파라미터 : 복사방식을 정합니다.
        //참조 -> https://docs.microsoft.com/en-us/windows/desktop/api/wingdi/nf-wingdi-bitblt
        ReleaseDC(0, hHandle);
        //-----------------------------------------
        if RadioGroup4.ItemIndex = 0 then
        begin
          SetCursorPos(X, Y);
          mouse_event( MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0 );
          mouse_event( MOUSEEVENTF_LEFTUP, 0, 0, 0, 0 );
        end else
        begin
          hWIn := aHandle[nInx];
          ShowWindow(hWin,SW_SHOW);
          SetForegroundWindow(hWin);
          if RadioGroup2.ItemIndex = 0 then
             PostMessage(hWin, WM_KEYDOWN, VK_RIGHT, 0)
          else
             PostMessage(hWin, WM_KEYDOWN, VK_NEXT, 0);
        end;
{       if RadioGroup3.ItemIndex = 0 then
           PostMessage(hWin, WM_KEYDOWN, VK_RIGHT, 0)
        else
           PostMessage(hWin, WM_KEYDOWN, VK_NEXT, 0);}
        //keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), 0, 0);
        ImageEnView1.Bitmap.Assign(TempBitmap);
        ImageEnView1.fit;
        ImageEnView1.update;
        mbmp.Assign(ImageEnView1.IEBitmap);
        mbmp.Resample(100,100);
        ImageEnMView1.AppendImage(mbmp);
        sleep(2000);
        ProgressBar1.Position := i;
        application.ProcessMessages;
        cfile := cdir + 'cap' + FormatFloat('0000', nf1) + '.jpg';
        ImageEnView1.io.SaveToFileJpeg(cfile);
        if not CheckBox2.Checked then
           break;
      end;
    finally
      FreeAndNil(TempBitmap);
      FreeAndNil(mbmp);
    end;
  end;
end;

procedure TfrmMain.Button3Click(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
const
  WH_MOUSE_LL = 14;
begin
  mHook := SetWindowsHookEx(WH_MOUSE_LL, @LowLevelMouseHookProc, hInstance, 0);
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  UnhookWindowsHookEx(mHook);
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  ListBox1.Items.Clear;
  //ImageList1.Clear;
  EnumWindows(Addr(EnumWindowProc), 0); //실행되고 있는 최상위 프로그램을 가져옵니다.
end;

procedure TfrmMain.SpeedButton1Click(Sender: TObject);
var
  x,y,i,nInx,xinx,xMax: integer;
  hWin:HWND;
begin
  x := strtoint(edit1.Text);
  y := strtoint(edit2.Text);
  //SetCursorPos(X, Y);
  //mouse_event( MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0 );
  //mouse_event( MOUSEEVENTF_LEFTUP, 0, 0, 0, 0 );
  //exit;
  for I := 0 to ListBox1.Items.Count-1 do
  begin
    if ListBox1.Items[i] = '픽픽' then
       xInx := xinx;
  end;
  nInx := ListBox1.ItemIndex;
  if nInx >= 0 then
  begin
    xMax := strtointdef(edit3.Text,50);
    if not CheckBox1.Checked then
       xMax := 1;
    for i := 1 to xMax do
    begin
      if RadioGroup1.ItemIndex = 0 then
      begin
        SetCursorPos(X, Y);
        mouse_event( MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0 );
        mouse_event( MOUSEEVENTF_LEFTUP, 0, 0, 0, 0 );
      end else
      begin
        hWIn := aHandle[nInx];
        ShowWindow(hWin,SW_SHOW);
        SetForegroundWindow(hWin);
        if RadioGroup2.ItemIndex = 0 then
           PostMessage(hWin, WM_KEYDOWN, VK_RIGHT, 0)
        else
           PostMessage(hWin, WM_KEYDOWN, VK_NEXT, 0);
        //keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), 0, 0);
      end;
      sleep(1000);
      {if xInx >= 0 then
      begin
        hwnd := aHandle[xInx];
        PostMessage(hWnd, WM_KEYDOWN, VK_RIGHT, 0);
      end;}
      keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), 0, 0);
      keybd_event(Ord('A'), MapVirtualKey(Ord('A'), 0), 0, 0);
      //-------------------------
      Keybd_Event(Ord('A'), MapVirtualKey(Ord('A'), 0), KEYEVENTF_KEYUP, 0);
      Keybd_Event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0);
      //----------------------------------------------------------------------
      if CheckBox1.Checked then
         sleep(2000);
      StatusBar1.Panels[1].Text := 'page:' + i.ToString;
      application.ProcessMessages;
    end;
  end;
end;

end.
