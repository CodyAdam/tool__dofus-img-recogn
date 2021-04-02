ShowGrid()
{
    iniRead, gridWidth, settings.ini, Grid, width
    IniRead, gridHeight, settings.ini, Grid, height
    IniRead, gridX, settings.ini, Grid, x
    IniRead, gridY, settings.ini, Grid, y
    if (gridX == "ERROR" or gridY == "ERROR" or gridHeight == "ERROR" or gridWidth == "ERROR") {
        Gui, Grid:Show
    } else {
        Gui, Grid:Show, x%gridX% y%gridY% h%gridHeight% w%gridWidth%
    }
}