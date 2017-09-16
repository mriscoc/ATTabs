unit DemoForm;

interface

uses
  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, attabs, LCLProc, LCLType;

type
  { TForm1 }
  TForm1 = class(TForm)
    btnAdd: TButton;
    btnDel: TButton;
    btnColor: TButton;
    btnLeft: TButton;
    btnRight: TButton;
    btnStress: TButton;
    chkShowScroll: TCheckBox;
    chkShowArrowDown: TCheckBox;
    comboShowX: TComboBox;
    EditInfo: TEdit;
    chkShowPlus: TCheckBox;
    Label1: TLabel;
    chkNums: TCheckBox;
    Label4: TLabel;
    labStatus: TLabel;
    btnModify: TButton;
    Label2: TLabel;
    chkShowFullColor: TCheckBox;
    Label3: TLabel;
    procedure btnStressClick(Sender: TObject);
    procedure chkNumsChange(Sender: TObject);
    procedure chkShowArrowDownChange(Sender: TObject);
    procedure chkShowFullColorChange(Sender: TObject);
    procedure chkShowPlusChange(Sender: TObject);
    procedure chkShowScrollChange(Sender: TObject);
    procedure comboShowXChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnColorClick(Sender: TObject);
    procedure btnLeftClick(Sender: TObject);
    procedure btnRightClick(Sender: TObject);
    procedure EditInfoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnModifyClick(Sender: TObject);
  private
    { Private declarations }
    LockEdit: boolean;
    procedure TabCloseEvent(Sender: TObject; ATabIndex: Integer; var ACanClose,
      ACanContinue: boolean);
    procedure TabMove(Sender: TObject; NFrom, NTo: Integer);
    procedure TabClick(Sender: TObject);
    procedure TabPlusClick(Sender: TObject);
    procedure TabClose(Sender: TObject; ATabIndex: Integer;
      var ACanClose, ACanContinie: boolean);
    procedure TabDrawAfter(Sender: TObject;
      AType: TATTabElemType; ATabIndex: Integer;
      C: TCanvas; const ARect: TRect; var ACanDraw: boolean);
    procedure TabDrawBefore(Sender: TObject;
      AType: TATTabElemType; ATabIndex: Integer;
      C: TCanvas; const ARect: TRect; var ACanDraw: boolean);
  public
    { Public declarations }
    t, t0, t1: TATTabs;
  end;

var
  Form1: TForm1;

implementation

uses
  Math, StrUtils;

{$R *.lfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  //avoid drag on click arrows
  DragManager.DragImmediate:= false;

  //default tabs
  t:= TATTabs.Create(Self);
  t.Parent:= Self;
  t.Align:= alTop;
  t.OnTabClick:= TabClick;
  t.OnTabPlusClick:= TabPlusClick;
  t.OnTabClose:= TabClose;
  t.OnTabMove:= TabMove;
  t.OnTabClose:= TabCloseEvent;
  t.OptMouseDoubleClickPlus:= true;
  t.OptShowXButtons:= tbShowAll;
  t.OptTabAngle:= 0;
  t.DragMode:= dmAutomatic; //enable drag-drop

  t.AddTab(-1, 'Tab');
  t.AddTab(-1, 'Tab middle len', nil, false, clGreen);
  t.AddTab(-1, 'Tab ____________', nil, false, clBlue);
  t.AddTab(-1, 'I');
  t.AddTab(-1, 'I');
  t.AddTab(-1, 'I');
  t.AddTab(-1, 'I');
  t.AddTab(-1, 'I');

  //-----------------------------------
  //angle tabs below
  t1:= TATTabs.Create(Self);
  t1.Parent:= Self;
  t1.Align:= alBottom;
  t1.Font.Size:= 12;
  t1.Height:= 56;
  t1.OnTabDrawBefore:= TabDrawBefore;
  t1.OnTabDrawAfter:= TabDrawAfter;
  t1.ColorBg:= $F9EADB;

  t1.OptTabAngle:= 4;
  t1.OptTabHeight:= 30;
  t1.OptTabWidthNormal:= 170;
  t1.OptSpaceOnTop:= 20;
  t1.OptSpaceXSize:= 15;
  t1.OptSpaceXInner:= 3;
  t1.OptShowAtBottom:= true;

  t1.AddTab(-1, 'Owner-draw', nil, false, clNone);
  t1.AddTab(-1, 'Tab wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww', nil, false, clGreen);
  t1.AddTab(-1, 'Last');

  //-----------------------------------
  //Firefox rectangle tabs
  t0:= TATTabs.Create(Self);
  t0.Parent:= Self;
  t0.Align:= alBottom;
  t0.Font.Size:= 8;

  t0.Height:= 42;
  t0.OptTabAngle:= 0;
  t0.OptSpaceBetweenTabs:= 2;
  t0.OptSpaceInitial:= 2;
  t0.OptSpaceOnTop:= 4;
  t0.OptSpaceXSize:= 13;
  t0.OptMouseDragEnabled:= false;
  t0.OptShowScrollArrows:= false;

  t0.Font.Color:= clBlack;
  t0.ColorBg:= $F9EADB;
  t0.ColorBorderActive:= $ACA196;
  t0.ColorBorderPassive:= $ACA196;
  t0.ColorTabActive:= $FCF5ED;
  t0.ColorTabPassive:= $E0D3C7;
  t0.ColorTabOver:= $F2E4D7;
  t0.ColorCloseBg:= clNone;
  t0.ColorCloseBgOver:= $D5C9BD;
  t0.ColorCloseBorderOver:= $B0B0B0;
  t0.ColorCloseX:= $7B6E60;
  t0.ColorArrow:= $5C5751;
  t0.ColorArrowOver:= t0.ColorArrow;

  t0.AddTab(-1, 'Firefox');
  t0.AddTab(-1, 'A tab _____________________________________________________', nil, false, clGreen);
  t0.AddTab(-1, 'Tab middle len', nil, false, clBlue);
end;

procedure TForm1.btnStressClick(Sender: TObject);
var
  i: integer;
begin
  for i:= t.TabCount-1 downto 1 do
    t.DeleteTab(i, false, false);
  for i:= 1 to 600 do
    t.AddTab(-1, IntToStr(i));
end;

procedure TForm1.chkNumsChange(Sender: TObject);
begin
  t1.OptShowNumberPrefix:= IfThen(chkNums.Checked, '%d. ', '');
  t1.Invalidate;
end;

procedure TForm1.chkShowArrowDownChange(Sender: TObject);
begin
  t.OptShowArrowMenu:= chkShowArrowDown.Checked;
  t.Invalidate;
end;

procedure TForm1.chkShowFullColorChange(Sender: TObject);
begin
  t.OptShowEntireColor:= chkShowFullColor.Checked;
  t.Invalidate;
end;

procedure TForm1.chkShowPlusChange(Sender: TObject);
begin
  t.OptShowPlusTab:= chkShowPlus.Checked;
  t.Invalidate;
end;

procedure TForm1.chkShowScrollChange(Sender: TObject);
begin
  t.OptShowScrollArrows:= chkShowScroll.Checked;
  t.Invalidate;
end;

procedure TForm1.comboShowXChange(Sender: TObject);
begin
  t.OptShowXButtons:= TATTabShowClose(comboShowX.ItemIndex);
  t.Invalidate;
end;

procedure TForm1.btnAddClick(Sender: TObject);
begin
  t.AddTab(t.TabIndex+1, 'test '+StringOfChar('n', Random(20)), nil, false, Random(65000));
end;

procedure TForm1.btnDelClick(Sender: TObject);
begin
  t.DeleteTab(1, true, false);
end;

procedure TForm1.btnColorClick(Sender: TObject);
var
  d: TATTabData;
begin
  d:= t.GetTabData(t.tabindex);
  d.TabColor:= Random(60000);
  t.Invalidate;
end;

procedure TForm1.btnLeftClick(Sender: TObject);
begin
  t.tabIndex:= t.TabIndex-1;
end;

procedure TForm1.btnRightClick(Sender: TObject);
begin
  t.tabIndex:= t.TabIndex+1;
end;

procedure TForm1.TabClick(Sender: TObject);
var
  d: TATTabData;
begin
  d:= t.GetTabData(t.TabIndex);
  LockEdit:= true;
  if Assigned(d) then
    EditInfo.Text:= d.TabCaption
  else
    EditInfo.Text:= '';
  LockEdit:= false;
end;

procedure TForm1.TabPlusClick(Sender: TObject);
begin
  btnAdd.Click;
end;


procedure TForm1.TabClose(Sender: TObject; ATabIndex: Integer;
  var ACanClose, ACanContinie: boolean);
{
var
  d: TATTabData;
  s: string;
  }
begin
  {
  d:= (Sender as TATTabs).GetTabData(ATabIndex);
  if d=nil then Exit;
  s:= d.TabCaption;
  ACanClose:= Pos('Tab', s)>0;
  }
  ACanClose:= true;
end;

procedure TForm1.EditInfoChange(Sender: TObject);
var
  d: TATTabData;
begin
  d:= t.GetTabData(t.tabIndex);
  if d=nil then Exit;
  if LockEdit then Exit;

  d.TabCaption:= EditInfo.Text;
end;


procedure TForm1.FormShow(Sender: TObject);
begin
end;

procedure TForm1.TabDrawAfter(Sender: TObject;
  AType: TATTabElemType; ATabIndex: Integer;
  C: TCanvas; const ARect: TRect; var ACanDraw: boolean);
begin
  if ATabIndex<0 then Exit;
  C.Font.Name:= 'Arial';
  C.Font.Size:= 9;
  C.Font.Color:= clBlue;
  C.TextOut((ARect.Left+ARect.Right) div 2 - 8, ARect.Top+1, Inttostr(ATabIndex));
end;

procedure TForm1.TabDrawBefore(Sender: TObject;
  AType: TATTabElemType; ATabIndex: Integer;
  C: TCanvas; const ARect: TRect; var ACanDraw: boolean);
var
  NColor: TColor;
  R: TRect;
begin
  case AType of
    {
    aeBackground:
    begin
      NColor:= C.Brush.Color;
      //C.Brush.Style:= bsFDiagonal;
      C.Brush.Color:= clNavy;
      C.FillRect(ARect);
      C.Brush.Color:= NColor;
      C.Brush.Style:= bsSolid;
      ACanDraw:= false;
    end;
    }
    aeXButton,
    aeXButtonOver:
    begin
      NColor:= C.Pen.Color;
      C.Pen.Width:= 2;
      C.Pen.Color:= IfThen(AType=aeXButton, clLtGray, clNavy);
      R:= Rect(ARect.Left+2, ARect.Top+2, ARect.Right-2, ARect.Bottom-2);
      C.Rectangle(R);
      C.Pen.Color:= NColor;
      C.Pen.Width:= 1;
      ACanDraw:= false;
    end;
  end;  
end;

procedure TForm1.TabMove(Sender: TObject; NFrom, NTo: Integer);
var s: string;
begin
  if NFrom=-1 then s:= 'add at index '+IntToStr(NTo) else
    if NTo=-1 then s:= 'delete at index '+IntToStr(NFrom) else
      s:= Format('move from %d to %d', [NFrom, NTo]);
  labStatus.Caption:= 'Status: '+s;
end;

procedure TForm1.btnModifyClick(Sender: TObject);
var
  d: TATTabData;
begin
  d:= t.GetTabData(t.tabIndex);
  if d=nil then Exit;

  d.TabModified:= not d.TabModified;
  t.Invalidate;
end;

procedure TForm1.TabCloseEvent(Sender: TObject; ATabIndex: Integer;
  var ACanClose, ACanContinue: boolean);
begin
  ACanClose:= Application.MessageBox('Close this tab?', 'Demo',
    MB_OKCANCEL+MB_ICONQUESTION) = ID_OK;
end;

end.
