OptButtonLayout: string
======

This is str of few chars. One char is one button at left or right side. Comma separates buttons for left/right, e.g. `"<>,v+"` is 2 buttons `<>` on left and 2 buttons `v+` on right.

* `<` - scroll tabs left
* `>` - scroll tabs right
* `v` - show dropdown menu of all tabs
* `+` - plus button, does the same as plus pseudo-tab
* `0`..`4` - user buttons; they are owner drawn and handled in event OnTabClickUserButton


OptButtonSize: integer
======

Width of one button, from OptButtonLayout.

OptTabHeight: integer
======

Height of tab-rect area. Usually smaller than control height to show indents on top/bottom.

OptTabWidthNormal: integer
======

Normal width of a tab, when small count of tabs is created.

OptTabWidthMinimal: integer
======

Smallest width of a tab, used when lot of tabs is created (and tabs are shrinked).

OptTabWidthMinimalHidesX: integer
======

When real width of a tab becomes smaller than option, X mark hides on all tabs.

OptTabAngle: integer
======

Sets angled tabs, if value>0. Tabs paint much faster, if option is 0. It is not angle in radians, it is one side of triangle. 

Even on Linux, 10 tabs with angles paint slowly, when mouse moves fast over control.
Also don't use angled tabs on macOS, they paint bad.

OptUseAngleForMaxTabs: integer
======

When count of tabs becomes >= option, tabs become non-angled. To paint faster.

OptSpaceBetweenTabs: integer
======

Indent (pixels) between nearest tabs.

OptSpaceInitial: integer
======

Indent (pix) before 1st tab.

OptSpaceBeforeText: integer
======

Indent (pix) between tab caption edge and tab rect. When caption is long, indent is smaller.

OptSpaceOnTop: integer
======

Indent (pix) between tab rects and top edge of control.

OptSpaceXRight: integer
======

Indent (pix) between X icon edge and right side of tab rect.

OptSpaceXInner: integer
======

Indent (pix) between X icon edge and X lines.

OptSpaceXSize: integer
======

Size (pix) of X icon lines.

OptColoredBandSize: integer
======

Width of colored band, which is shown on top of colored tab (color is set via TATTabData field).

OptArrowSize: integer
======

Size of left/right/dropdown arrows.

OptScrollMarkSizeX: integer
======

Size of scroll mark, horizontal. Mark is shown when lot of tabs created, and some tabs don't fit.

OptScrollMarkSizeY: integer
======

Size of scroll mark, vertical.

OptDropMarkSize: integer
======

Width of drag-drop (red) mark. It is shown when you drag a tab to another pos, in the same control.

OptShowAtBottom: boolean
======

If true, control paints in bottom-style. Use if you placed control on bottom of a form.

OptShowScrollMark: boolean
======

Allow to show scroll mark. If lot of tabs created.

OptShowDropMark: boolean
======

Allow to show drop mark. When drag-drop is active.

OptShowXButtons: TATTabShowClose
======

Allow to show X icons on tabs. Several variants here: show all, none, for active tab, for mouse-over tab.

OptShowPlusTab: boolean
======

Allow to show "plus" pseudo-tab on right. It generates event on click.

OptShowArrowsNear: boolean
======

Show left/right scroll arrows near to each other. Usually they are shown in the centers of buttons, not near.

OptShowModifiedText: TATTabString
======



OptShowBorderActiveLow: boolean
======



OptShowEntireColor: boolean
======



OptShowNumberPrefix: TATTabString
======



OptMouseMiddleClickClose: boolean
======



OptMouseDoubleClickClose: boolean
======



OptMouseDoubleClickPlus: boolean
======



OptMouseDragEnabled: boolean
======



OptMouseDragOutEnabled: boolean
======



    
