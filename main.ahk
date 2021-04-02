#Include, initConfig.ahk
#Include, core.ahk
#Include, grid.ahk
Run tesseract ./samples/word.png stdout, , , output
MsgBox, %output%
return
#Include, events.ahk
