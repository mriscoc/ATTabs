OptButtonLayout: string
======

String of few chars, one char is one button at left or right side. Comma separates buttons for left/right, e.g. `"<>,v+"` is 2 buttons `<`, `>` on left and 2 buttons `v`, `+` on right. If value is empty, buttons not painted at all, this gives more space for tabs for left/right OptPosition.

* `<` - scroll tabs left
* `>` - scroll tabs right
* `v` - show dropdown menu of all tabs
* `+` - plus button, does the same as plus pseudo-tab
* `x` - close button, does the same as x icon on active tab
* `0`..`4` - user buttons; they are owner drawn and handled in event OnTabClickUserButton

OptButtonSize: integer
======

Width of one button, from OptButtonLayout. Height of buttons is OptTabHeight.

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

Height of tab-rect area. Usually smaller than control height to show indents above/below tabs.

OptTabWidthNormal: integer
======

Normal width of a tab, when small count of tabs is created.

OptTabWidthMinimal: integer
======

Smallest width of a tab, used when lot of tabs is created (so some tabs don't fit).

OptTabWidthMinimalHidesX: integer
======

When current tab width (for top/bottom OptPosition) becomes smaller than option, X mark hides on all tabs.

OptSpaceBetweenTabs: integer
======

Indent (pixels) between nearest tabs.

OptSpaceBetweenIconCaption: integer
======

Indent (pixels) between icon (from ImageList) and caption. For all icon positions.

OptSpaceInitial: integer
======

Indent before first tab.
For left/right OptPosition, it's used only if OptButtonLayout is empty.

OptSpaceBeforeText: integer
======

Indent between tab caption edge and tab rect. When caption is long, indent is smaller.

OptSpacer: integer
======

Indent between tab rects and edge of control (one of edges, depends on OptPosition).

OptSpacer2: integer
======

Only for left/right OptPosition. Indent between tab rects and another side of control. For top/bottom OptPosition, such indent is auto-calculated.

OptSpaceXRight: integer
======

Indent between X icon edge and right side of tab rect.

OptSpaceXInner: integer
======

Indent between X icon edge and X lines.

OptSpaceXSize: integer
======

Size of X icon lines.

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

OptShowAngled: boolean
======

Show angled sides for tabs. Only for top/bottom OptPosition. 
For angled tabs, you must also set OptSpaceInitial to positive value, or angled sides will paint over edges. And must set OptSpaceBetweenTabs, or angled sides will be not nice between tabs.

OptShowAngleTangent: single
======

Sets angle for OptShowAngled. It is tangent for angle, good value here is about 1..10, default is 2.x.

OptShowFlat: boolean
======

Activates flat look: in this mode tab edges and bottom lines are not painted, and tabs have the same BG color as control's BG color.

OptShowScrollMark: boolean
======

Allow to show scroll mark. If lot of tabs created.

OptShowDropMark: boolean
======

Allow to show drop mark. When drag-drop is active.

OptShowXButtons: enum
======

How to show X icons on tabs.
Several variants: show all, don't show, show for active tab, show for mouse-over tab.

OptShowPlusTab: boolean
======

Allow to show "plus" pseudo-tab. It generates event on click.

OptShowArrowsNear: boolean
======

Show left/right scroll arrows near to each other. Usually they are shown in the center of buttons, not near.

OptShowModifiedText: string
======

String to shown before tab caption, for modified tab. Modified: bool field in the TATTabData.

OptShowBorderActiveLow: boolean
======

Allow to show horiz line, below active tab (top/bottom OptPosition). Usually not needed.

OptShowEntireColor: boolean
======

Allow to colorize full tab rect, for colored tabs. Color of tab: field in the TATTabData.

OptShowNumberPrefix: TATTabString
======

String with `%d`, which makes numbered prefix for all tabs. Eg, `'%d) '` makes prefix with number and bracket. If empty, no prefix used.

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
