loop(){
    global canLoop
    GuiControl, Core:Text, status, Starting the analysis
    CoordMode, Mouse, Screen
    ;BlockInput, MouseMove

    
    if !getGridPos(gridX, gridY, gridW, gridH) { 
        BlockInput, MouseMoveOff
        MsgBox, Beforehand, you need to choose the position of the grid!
        GuiControl, Core:Text, status, Beforehand, you need to choose the position of the grid!
        return
    }    

    ; Sleep, 1000
    ; getMouseInGrid(mx, my, xp, yp)
    ; Sleep, 1000
    ; PixelGetColor, color, mx, my
    ; Clipboard := xp . ", " . yp . "    " . color 

    checkAll()

    getPosFromPercent(x, y, 0.987640, 0.174877)
    Click, %x% %y%
    Sleep, 100

    getPosFromPercent(x1, y1, 0.932584, 0.198276) 
    getPosFromPercent(x2, y2, 0.379775, 0.198276) 
    getPosFromPercent(x3, y3, 0.931461, 0.365764) 
    getPosFromPercent(x4, y4, 0.924719, 0.307882) 

    waitIndex := 0
    maxWaitIndex := 10
    captureIndex := 0
    capture(captureIndex)
    SendInput, {PgDn}
    While, ( waitIndex < maxWaitIndex and canLoop) {
        Sleep, 100
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
            capture(captureIndex)
            SendInput, {PgDn}
        }
        GuiControl, Core:Text, status, Processing please wait... (Capture:%captureIndex%) (Stop:%waitIndex%/%maxWaitIndex%)
    }
    BlockInput, MouseMoveOff
    GuiControl, Core:Text, status, Finished successfully! %index%
}

checkAll(){
    ;TODO
    return
}


getGridPos(ByRef x, ByRef y, ByRef w, ByRef h){
    IniRead, gridX, settings.ini, Grid, x
    IniRead, gridY, settings.ini, Grid, y
    iniRead, gridW, settings.ini, Grid, width
    IniRead, gridH, settings.ini, Grid, height
    if (gridX == "ERROR" or gridY == "ERROR" or gridH == "ERROR" or gridW == "ERROR") {
        return False
    } else {
        x := gridX + 7
        y := gridY + 7
        w := gridW - 14
        h := gridH - 14
        return True
    }
}

getPosFromPercent(ByRef x, ByRef y, xp, yp){
    if getGridPos( guiX, guiY, guiW, guiH) {
        x := Floor(guiX + xp * guiW)
        y := Floor(guiY + yp * guiH)
        return True
    } else {
        MsgBox, getPosFromPercent() called but grid pos not found! 
        return False
    }
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

capture(index){
    getGridPos(gridX, gridY, gridW, gridH)
    getPosFromPercent(x1, y1, 0.319411, 0.16898)
    getPosFromPercent(x2, y2, 0.993445, 0.960438)
    pos := x1 . "|" . y1 . "|" x2-x1 . "|" . y2-y1
    snap := Gdip_BitmapFromScreen(pos)
    returned :=Gdip_SaveBitmapToFile(snap, "temp/captures/" . index . ".png")
    Gdip_DisposeImage(snap)
}
