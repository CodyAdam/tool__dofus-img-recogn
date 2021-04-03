#SingleInstance Force
#Persistent

Menu, Tray, Icon, ./assets/icon.ico
Menu, Tray, Add, Open

Menu, Tray, Default, Open
Menu, Tray, Click, Open


If !(A_PtrSize = 4){
	MsgBox, Using AHK 64 bits`nOnly AHK 32 bits version compatible
    ExitApp
    return
}

pToken := Gdip_Startup()

canLoop := True