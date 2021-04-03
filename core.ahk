CoreName := "Auction Devourer"
Gui, Core:New, +AlwaysOnTop, %CoreName%

; #################################################################
; Settings

Gui, Font, Bold
Gui, Add, Text, x10 y10, Settings
Gui, Font, Norm

Gui, Add, DropDownList, gChangeServer vserver, Temporis 1|Temporis 2|Temporis 3|Temporis 4|Temporis 5
Gui, Add, CheckBox, h25 gChangeGridVisible visGridVisible, Show the grid
Gui, Add, Text, , Grid opacity :
Gui, Add, Slider, h20 gChangeOpacity vgridOpacity Range1-255, 50
Gui, Add, Button, gHide h20 w120, Hide this window
Gui, Add, Button, gOnStart w55 h30 vstartButton, Start
Gui, Font, Bold
Gui, Add, Text, w120 h40 cGreen Center vstatus, Waiting for user actions...
Gui, Font, Norm
Gui, Add, Link,, <a href="https://github.com/CodyAdam/Dofus-HDV">Github.com/CodyAdam</a>
GuiControlGet, startPos, Pos, startButton
Gui, Add, Button, gOnStop y%startPosY% x75 w55 h30, Stop

IniRead, server, settings.ini, Server, server
server := (server == "ERROR") ? "Temporis 1" : server
GuiControl, ChooseString, server, %server%
IniRead, isGridVisible, settings.ini, Grid, visible
isGridVisible := (isGridVisible == "ERROR") ? 1 : isGridVisible
GuiControl, , isGridVisible, %isGridVisible%
IniRead, opacity, settings.ini, Grid, opacity
opacity := (opacity == "ERROR") ? 100 : opacity
GuiControl, , gridOpacity, %opacity%

; #################################################################
; Keybinds

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
; #################################################################
; Selections

Gui, Show, x0 y0 w270 h280
