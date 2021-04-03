loop(){
    GuiControl, Text, status, Starting captures
    global canLoop
    global GridName
    WinGetPos, guiX, guiY, guiW, guiH, %GridName%
    guiX := guiX + 7
    guiY := guiY + 7
    guiW := guiW - 14
    guiH := guiH - 14

    index := 1
    pos := guiX . "|" . guiY . "|" . guiW . "|" . guiH
    While, (index <= 10 and canLoop) {
        GuiControl, Text, status, Writing index %index%
        capture(pos, index)
        index := index + 1
    }

    GuiControl, Text, status, Finished captures successfully!
}


capture(pos, index){
    snap := Gdip_BitmapFromScreen(pos)
    returned :=Gdip_SaveBitmapToFile(snap, "temp/shot_" . index . ".png")
    Gdip_DisposeImage(snap)
}
