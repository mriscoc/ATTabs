
- `OnTabClick: TNotifyEvent` - called when normal tab activates
- `OnTabPlusClick: TNotifyEvent` - called when "plus" tab activates
- `OnTabClose: TATTabCloseEvent` - called when "x" mark clicked (you can disable default tab deletion and show confirmation)
- `OnTabMenu: TATTabMenuEvent` - called when "down arrow" clicked (you can disable default menu)
- `OnTabDrawBefore: TATTabDrawEvent` - called before painting a tab on canvas (you can disable default painting)
- `OnTabDrawAfter: TATTabDrawEvent` - called after painting a tab on canvas
- `OnTabEmpty: TNotifyEvent` - called after control has no tabs anymore (after deleting last tab)
- `OnTabOver: TATTabOverEvent` - called when mouse moves over the control (tab index is passed to event)
- `OnTabMove: TATTabMoveEvent` - called after adding/deleting/moving tabs. Passed 2 indexes: nfrom, nto. nfrom=-1 for adding, nto=-1 for deleting, both are >= 0 to moving.
