
IniRead, server, settings.ini, Server, server
GuiControl, ChooseString, server, %server%
IniRead, isGridVisible, settings.ini, Grid, visible
GuiControl, , isGridVisible, %isGridVisible%
IniRead, gridOpacity, settings.ini, Grid, gridOpacity
GuiControl, , gridOpacity, %gridOpacity%

IniRead, openHK, settings.ini, Keybinds, open
GuiControl, , openHK, %openHK%
IniRead, toggleGridHK, settings.ini, Keybinds, toggleGrid
GuiControl, , toggleGridHK, %toggleGridHK%
IniRead, selectNextHK, settings.ini, Keybinds, selectNext
GuiControl, , selectNextHK, %selectNextHK%
IniRead, startHK, settings.ini, Keybinds, start
GuiControl, , startHK, %startHK%
IniRead, stopHK, settings.ini, Keybinds, stop
GuiControl, , stopHK, %stopHK%
