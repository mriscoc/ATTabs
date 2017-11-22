unit formmain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, attabs, StdCtrls, math, XPMan;

type
  TForm1 = class(TForm)
    chkFlat: TCheckBox;
    chkShowPlus: TCheckBox;
    chkAngled: TCheckBox;
    chkGap: TCheckBox;
    chkVarWidth: TCheckBox;
    chkMultiline: TCheckBox;
    Label1: TLabel;
    chkPosTop: TRadioButton;
    chkPosBtm: TRadioButton;
    chkPosLeft: TRadioButton;
    chkPosRight: TRadioButton;
    chkCenterCaption: TCheckBox;
    XPManifest1: TXPManifest;
    procedure FormCreate(Sender: TObject);
    procedure chkFlatClick(Sender: TObject);
    procedure chkShowPlusClick(Sender: TObject);
    procedure chkAngledClick(Sender: TObject);
    procedure chkGapClick(Sender: TObject);
    procedure chkVarWidthClick(Sender: TObject);
    procedure chkMultilineClick(Sender: TObject);
    procedure chkCenterCaptionClick(Sender: TObject);
    procedure chkPosTopClick(Sender: TObject);
    procedure chkPosBtmClick(Sender: TObject);
    procedure chkPosLeftClick(Sender: TObject);
    procedure chkPosRightClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    t: TATTabs;
    procedure TabPlusClick(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  t:= TATTabs.Create(Self);
  t.Parent:= Self;
  t.Align:= alTop;
  t.OptTabHeight:= 40;
  t.Height:= 50;

  t.AddTab(-1, 'tab first', nil, true, clGreen);
  t.AddTab(-1, WideString('юникод строка ')+WideChar($1020)+WideChar($2020));
  t.AddTab(-1, 'tab'#10'multiline'#10'caption', nil, false, clYellow);
  t.OnTabPlusClick:= TabPlusClick;

  t.ColorBg:= clWhite;
  t.OptMouseDragEnabled:= true;
  t.Invalidate;
end;

procedure TForm1.TabPlusClick(Sender: TObject);
begin
  t.AddTab(-1, 'tab'+IntToStr(t.TabCount));
  t.Invalidate;
end;

procedure TForm1.chkFlatClick(Sender: TObject);
begin
  t.OptShowFlat:= chkFlat.Checked;
  t.Invalidate;
end;

procedure TForm1.chkShowPlusClick(Sender: TObject);
begin
  t.OptShowPlusTab:= chkShowPlus.Checked;
  t.Invalidate;
end;

procedure TForm1.chkAngledClick(Sender: TObject);
begin
  t.OptShowAngled:= chkAngled.Checked;
  t.OptSpaceInitial:= IfThen(chkAngled.Checked, 10, 4);
  t.Invalidate;
end;

procedure TForm1.chkGapClick(Sender: TObject);
begin
  t.OptSpaceBetweenTabs:= IfThen(chkGap.Checked, 6, 0);
  t.Invalidate;
end;

procedure TForm1.chkVarWidthClick(Sender: TObject);
begin
  t.OptVarWidth:= chkVarWidth.Checked;
  t.Invalidate;
end;

procedure TForm1.chkMultilineClick(Sender: TObject);
begin
  t.OptMultiline:= chkMultiline.Checked;
  t.Invalidate;
end;

procedure TForm1.chkCenterCaptionClick(Sender: TObject);
begin
  if chkCenterCaption.Checked then
    t.OptCaptionAlignment:= taCenter
  else
    t.OptCaptionAlignment:= taLeftJustify;
  t.Invalidate;
end;

procedure TForm1.chkPosTopClick(Sender: TObject);
begin
  t.Align:= alTop;
  t.OptPosition:= atpTop;
  t.Height:= 50;
  t.Invalidate;
end;

procedure TForm1.chkPosBtmClick(Sender: TObject);
begin
  t.Align:= alBottom;
  t.OptPosition:= atpBottom;
  t.Height:= 50;
  t.Invalidate;
end;

procedure TForm1.chkPosLeftClick(Sender: TObject);
begin
  t.Align:= alLeft;
  t.OptPosition:= atpLeft;
  t.Width:= 140;
  t.Invalidate;
end;

procedure TForm1.chkPosRightClick(Sender: TObject);
begin
  t.Align:= alRight;
  t.OptPosition:= atpRight;
  t.Width:= 140;
  t.Invalidate;
end;

end.
