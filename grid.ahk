; GRID
GridName := "Auction Grid"
Gui, Grid:New, , %GridName%
Gui, +Resize +AlwaysOnTop +LastFound -Caption -E0x20
Gui, Add, Pic, x0 y0 vimg, ./samples/panel.png




GuiControlGet, isGridVisible, Core:, isGridVisible
if isGridVisible {
    ShowGrid()
} else
    Gui, Hide

