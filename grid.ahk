; GRID
Gui, Grid:New, , Grid
Gui, +Resize +AlwaysOnTop +LastFound +Caption -E0x20
GuiControlGet, gridOpacity, Core:, gridOpacity
WinSet, TransColor, 00FF00 %gridOpacity%
Gui, Margin, 0, 0
Gui, Add, Pic, x0 y0 vimg, ./samples/panel.png
GuiControlGet, isGridVisible, Core:, isGridVisible
if isGridVisible
    Gui, Show
else
    Gui, Hide
