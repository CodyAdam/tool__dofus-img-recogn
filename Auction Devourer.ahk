; REQUIRE AHK 32 bits ! (64 bits version donc work because of Gdip)

#Include, initConfig.ahk
#Include, core.ahk
#Include, grid.ahk

#Include, Gdip.ahk

MsgBox % StdOutStream( "tesseract .\samples\word.png stdout --psm 7" )

StdOutStream_Callback( data, n ) {
  Static D
  ToolTip % D .= data

  if ! ( n ) {
    Tooltip % D := ""
    Return "Callback says: Hi!"
  }
}

return

#Include, events.ahk
#Include, functions.ahk