unit formmain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, attabs, StdCtrls, math;

type
  TForm1 = class(TForm)
    chkFlat: TCheckBox;
    chkShowPlus: TCheckBox;
    chkAngled: TCheckBox;
    chkGap: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure chkFlatClick(Sender: TObject);
    procedure chkShowPlusClick(Sender: TObject);
    procedure chkAngledClick(Sender: TObject);
    procedure chkGapClick(Sender: TObject);
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

  t.AddTab(-1, 'tab0');
  t.AddTab(-1, 'tab1');
  t.AddTab(-1, 'tab2');
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

end.
