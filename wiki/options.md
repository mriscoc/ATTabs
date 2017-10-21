OptButtonLayout: string
======

This is str of few chars. One char is one button at left or right side. Comma separates buttons for left/right, e.g. `"<>,v+"` is 2 buttons `<>` on left and 2 buttons `v+` on right.

* `<` - scroll tabs left
* `>` - scroll tabs right
* `v` - show dropdown menu of all tabs
* `+` - plus button, does the same as plus pseudo-tab
* `x` - close button, does the same as x icon on active tab
* `0`..`4` - user buttons; they are owner drawn and handled in event OnTabClickUserButton

OptButtonSize: integer
======

Width of one button, from OptButtonLayout.

OptPosition: enum
======

One of view styles: top/bottom/left/right.
If top - control should have Align=alTop; if bottom - Align=alBottom; etc.
In left/right styles, tab text is painted horizontally anyway.

OptIconPosition: enum
======

Position of icon (from ImageList) relative to caption of tab.
You can set icon above text, icon below text, etc.

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

OptSpaceBetweenIconCaption: integer
======
Indent (pixels) between icon (from ImageList) and caption. Both horz and vert.

OptSpaceInitial: integer
======

Indent (pix) before 1st tab.

OptSpaceBeforeText: integer
======

Indent (pix) between tab caption edge and tab rect. When caption is long, indent is smaller.

OptSpacer: integer
======

Indent (pix) between tab rects and edge of control (one of edges, depends on OptPosition).

OptSpacer2: integer
======

Only for left/right OptPosition. Indent between tab rects and another side of control. For top/bottom OptPosition, indent is auto-calculated.

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

OptShowFlat: boolean
======

Activates flat look: in this mode tab edges and bottom lines are not painted, and tabs have the same BG color as control's BG color.

OptPosition: TATTabPosition
======

Enum, one of visual kinds for tabs: at top, at bottom (at left/right - not implemented yet).

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

Show left/right scroll arrows near to each other. Usually they are shown in the center of buttons, not near.

OptShowModifiedText: TATTabString
======

Str, which is shown with tab caption, for modified tab. (Modified: bool field in the TATTabData).

OptShowBorderActiveLow: boolean
======

Allow to show horiz line, below active tab. Usually not needed.

OptShowEntireColor: boolean
======

Allow to colorize full tab rect, for colored tabs. (Color of tab: field in the TATTabData).

OptShowNumberPrefix: TATTabString
======

String with `%d`, which makes numbered prefix for all tabs. Eg, `'%d) '` makes prefix with number and bracket. If empty, no prefix.

OptMouseMiddleClickClose: boolean
======

Allow to close tabs by middle mouse click.

OptMouseDoubleClickClose: boolean
======

Allow to close tabs by double click.

OptMouseDoubleClickPlus: boolean
======

Allow to call OnTabPlusClick by double click on empty area.

OptMouseDragEnabled: boolean
======

Enable drag-drop of tabs.

OptMouseDragOutEnabled: boolean
======

Also enable drag-drop to/from another ATTabs control.
