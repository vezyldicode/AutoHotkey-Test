#Requires AutoHotkey v2.0
global mainGui
; Function to create a GUI positioned in the center horizontally and 1/12 vertically from the top
CreatemainGui() {
    ; Get the current DPI scale factor
    dpi := GetDpiScale()

    ; Get screen dimensions
    screenWidth := A_ScreenWidth
    screenHeight := A_ScreenHeight

    ; Calculate position and size based on screen dimensions and DPI
    targetX := (screenWidth - (405 * dpi)) / 2  ; Center horizontally on the X-axis
    targetY := screenHeight / 12                ; Position 1/12 down on the Y-axis
    width := 405     ; Adjusted width
    height := 147  ; Adjusted height

    ; Create and show the mainGui at the scaled position and size
    mainGui := Gui()
    mainGui.SetFont("s12", "Tahoma")  ; Set font and size as needed
    mainGui.AddText("x10 y10", "This is a DPI-aware mainGui window " dpi)
    mainGui.Show("x" targetX " y" targetY " w" width " h" height)
}

; Function to get the main screen's DPI scale factor
GetDpiScale() {
    ; Retrieve the DPI of the main screen
    hdc := DllCall("GetDC", "ptr", 0)
    dpi := DllCall("GetDeviceCaps", "ptr", hdc, "int", 88, "int") ; LOGPIXELSX
    DllCall("ReleaseDC", "ptr", 0, "ptr", hdc)
    
    ; Calculate the scaling factor based on DPI (96 is the default DPI)
    return dpi / 96
}

; Call the function to create the mainGui
CreatemainGui()
