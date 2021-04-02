Name := "HDV Eater"
; CORE
Gui, Core:New, , %Name%

; Settings
Gui, Font, Bold
Gui, Add, Text, x10 y10, Settings
Gui, Font, Norm

Gui, Add, DropDownList, gChangeServer vserver, Temporis 1|Temporis 2|Temporis 3|Temporis 4|Temporis 5
Gui, Add, CheckBox, gChangeGridVisible visGridVisible, Show the grid
Gui, Add, Text, , Grid opacity :
Gui, Add, Slider, gChangeOpacity vgridOpacity Range-1-255, 50
Gui, Add, Button, gHide w120, Hide this window
Gui, Add, Button, w55 h50 vstartButton, Start
GuiControlGet, startPos, Pos, startButton
Gui, Add, Button, y%startPosY% x75 w55 h50, Stop

IniRead, server, settings.ini, Server, server
GuiControl, ChooseString, server, %server%
IniRead, isGridVisible, settings.ini, Grid, visible
GuiControl, , isGridVisible, %isGridVisible%
IniRead, gridOpacity, settings.ini, Grid, gridOpacity
GuiControl, , gridOpacity, %gridOpacity%

;Keybinds
Gui, Font, Bold
Gui, Add, Text, x140 y10, Keybinds
Gui, Font, Norm

Gui, Add, Text, , Open the GUI :
Gui, Add, HotKey, gChangeKeybinds vopenHK
Gui, Add, Text, , Toggle the grid :
Gui, Add, HotKey, gChangeKeybinds vtoggleGridHK
Gui, Add, Text, , Select the next :
Gui, Add, HotKey, gChangeKeybinds vselectNextHK
Gui, Add, Text, , Start :
Gui, Add, HotKey, gChangeKeybinds vstartHK
Gui, Add, Text, , Stop :
Gui, Add, HotKey, gChangeKeybinds vstopHK

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

;Divider
Gui, Add, Text, x10 w250   h1  0x5

;Buttons
Gui, Show, x0 y0 w270 h500
