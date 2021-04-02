
ChangeServer:
    GuiControlGet, server, Core:, server
    IniWrite, %server%, settings.ini, Server, server
return

ChangeOpacity:
    GuiControlGet, gridOpacity, Core:, gridOpacity
    IniWrite, %gridOpacity%, settings.ini, Grid, opacity
    WinSet, TransColor, 00ff00 %gridOpacity%, %GridName%
return

ChangeKeybinds:
    GuiControlGet, openHK, Core:, openHK
    IniWrite, %openHK%, settings.ini, Keybinds, open
    GuiControlGet, toggleGridHK, Core:, toggleGridHK
    IniWrite, %toggleGridHK%, settings.ini, Keybinds, toggleGrid
    GuiControlGet, selectNextHK, Core:, selectNextHK
    IniWrite, %selectNextHK%, settings.ini, Keybinds, selectNext
    GuiControlGet, startHK, Core:, startHK
    IniWrite, %startHK%, settings.ini, Keybinds, start
    GuiControlGet, stopHK, Core:, stopHK
    IniWrite, %stopHK%, settings.ini, Keybinds, stop
return

ChangeGridVisible:
    GuiControlGet, isGridVisible, Core:, isGridVisible
    IniWrite, %isGridVisible%, settings.ini, Grid, visible
    if isGridVisible {
        ShowGrid()
    } else
        Gui, Grid:Hide
return

GridGuiClose:
    GuiControl, Core:, isGridVisible, 0
    Gui, Grid:Hide
return

GridGuiSize:
    ToolTip, Timed ToolTip`n Resizing!
    SetTimer, RemoveToolTip, -1000
    GuiControl, Move, img, % "W" . A_GuiWidth . " H" . A_GuiHeight
    WinGetPos, guiX, guiY, guiWidth, guiHeight, %GridName%
    IniWrite, %A_GuiWidth%, settings.ini, Grid, width
    IniWrite, %A_GuiHeight%, settings.ini, Grid, height
    IniWrite, %guiX%, settings.ini, Grid, x
    IniWrite, %guiY%, settings.ini, Grid, y
    WinSet redraw
return

RemoveToolTip:
    ToolTip
return

CoreGuiClose:
    ExitApp
return

Open:
    Gui, Core:Show
return

Hide:
    Gui Core:Hide
return