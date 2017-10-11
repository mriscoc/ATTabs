unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  attabs;

type

  { TForm1 }

  TForm1 = class(TForm)
    chkPosTop: TRadioButton;
    chkPosBottom: TRadioButton;
    chkPosLeft: TRadioButton;
    chkPosRight: TRadioButton;
    procedure chkPosBottomChange(Sender: TObject);
    procedure chkPosLeftChange(Sender: TObject);
    procedure chkPosRightChange(Sender: TObject);
    procedure chkPosTopChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure TabPlusClick(Sender: TObject);

  public
    t: TATTabs;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

const
  cSizeX = 150;
  cSizeY = 33;

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  t:= TATTabs.Create(Self);
  t.Parent:= Self;
  t.Align:= alTop;

  t.OnTabPlusClick:=@TabPlusClick;

  t.AddTab(-1, 'tab0');
  t.AddTab(-1, 'tab1');
  t.AddTab(-1, 'tab2');

end;

procedure TForm1.TabPlusClick(Sender: TObject);
begin
  t.AddTab(-1, 'tab'+IntToStr(t.TabCount));
end;

procedure TForm1.chkPosTopChange(Sender: TObject);
begin
  t.Align:= alTop;
  t.OptPosition:= tabPositionTop;
  t.Height:= cSizeY;
  t.Invalidate;
end;

procedure TForm1.chkPosBottomChange(Sender: TObject);
begin
  t.Align:= alBottom;
  t.OptPosition:= tabPositionBottom;
  t.Height:= cSizeY;
  t.Invalidate;
end;

procedure TForm1.chkPosLeftChange(Sender: TObject);
begin
  t.Align:= alLeft;
  t.OptPosition:= tabPositionLeft;
  t.Width:= cSizeX;
  t.Invalidate;
end;

procedure TForm1.chkPosRightChange(Sender: TObject);
begin
  t.Align:= alRight;
  t.OptPosition:= tabPositionRight;
  t.Width:= cSizeX;
  t.Invalidate;
end;

end.

