loop(){
    global canLoop
    GuiControl, Core:Text, status, Processing...
    BlockInput, MouseMove


    
    if !getGridPos(gridX, gridY, gridW, gridH) { 
        BlockInput, MouseMoveOff
        MsgBox, Beforehand, you need to choose the position of the grid!
        GuiControl, Core:Text, status, Beforehand, you need to choose the position of the grid!
        return
    }    

    ; Sleep, 2000
    ; getMouseInGrid(_, _, xp, yp)
    ; Clipboard := (xp . ", " . yp)

    CoordMode, Click, Screen
    getPosFromPercent(x, y, 0.9725, 0.1731) 
    Click, %x% %y%
    Sleep, 100

    getPosFromPercent(x1, y1, 0.344408, 0.299031) 
    PixelGetColor, px1, x1, y1
    getPosFromPercent(x2, y2, 0.920266, 0.188862) 
    PixelGetColor, px2, x2, y2
    getPosFromPercent(x3, y3, 0.347730, 0.417676) 
    PixelGetColor, px3, x3, y3
    getPosFromPercent(x4, y4, 0.337763, 0.192494) 
    PixelGetColor, px4, x4, y4

    waitIndex := 0
    captureIndex := 0
    ; pos := gridX . "|" . gridY . "|" . gridW . "|" . gridH
    ; capture(pos, index)
    SendInput, {PgDn}
    While, ( waitIndex < 40 and canLoop) {
        Sleep, 30
        waitIndex := waitIndex +1 
        PixelGetColor, px1check, x1, y1
        PixelGetColor, px2check, x2, y2
        PixelGetColor, px3check, x3, y3
        PixelGetColor, px4check, x4, y4
        if (px1check == px1 and px2check == px2 and px3check == px3 and px4check == px4) {
            waitIndex := waitIndex + 1
        } else {
            waitIndex := 0
            captureIndex := captureIndex + 1
            px1 := px1check
            px2 := px2check 
            px3 := px3check
            px4 := px4check
            ; pos := gridX . "|" . gridY . "|" . gridW . "|" . grid
            ; capture(pos, captureIndex)
            SendInput, {PgDn}
            GuiControl, Core:Text, status, Scrolling down...
        }
    }

    BlockInput, MouseMoveOff
    GuiControl, Core:Text, status, Finished successfully! %index%
}


getGridPos(ByRef x, ByRef y, ByRef w, ByRef h){
    iniRead, gridW, settings.ini, Grid, width
    IniRead, gridH, settings.ini, Grid, height
    IniRead, gridX, settings.ini, Grid, x
    IniRead, gridY, settings.ini, Grid, y
    if (gridX == "ERROR" or gridY == "ERROR" or gridH == "ERROR" or gridW == "ERROR") {
        return False
    } else {
        global GridName
        WinGetPos, guiX, guiY, guiW, guiH, %GridName% ; TODO change if window is hidden
        x := guiX + 7
        y := guiY + 7
        w := guiW - 14
        h := guiH - 14
        return True
    }
}

getPosFromPercent(ByRef x, ByRef y, xp, yp){
    getGridPos( guiX, guiY, guiW, guiH) 
    x := Floor(guiX + xp * guiW)
    y := Floor(guiY + yp * guiH)
    return
}

getMouseInGrid(ByRef x, ByRef y, ByRef xp, ByRef yp) {
    getGridPos( guiX, guiY, guiW, guiH)
    CoordMode, Mouse, Screen
    MouseGetPos, screenX, screenY
    x := screenX-guiX
    y := screenY-guiY
    xp := (screenX-guiX) / guiW
    yp := (screenY-guiY) / guiH
    return
}

capture(pos, index){
    snap := Gdip_BitmapFromScreen(pos)
    returned :=Gdip_SaveBitmapToFile(snap, "temp/shot_" . index . ".png")
    Gdip_DisposeImage(snap)
}
