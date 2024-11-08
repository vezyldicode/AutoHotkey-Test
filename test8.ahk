; Function to create a GUI at the desired position, unaffected by screen scaling
CreateGUI() {
    ; Get the current DPI scale factor
    dpi := GetDpiScale()
    
    ; Define the desired position and size based on DPI scaling
    ; Adjust the values below to match the desired position
    targetX := 200 * dpi  ; Adjusted X position
    targetY := 150 * dpi  ; Adjusted Y position
    width := 300 * dpi    ; Adjusted width
    height := 200 * dpi   ; Adjusted height

    ; Create and show the GUI at the scaled position and size
    Gui := Gui()
    Gui.SetFont("s12", "Tahoma")  ; Set font and size as needed
    Gui.AddText("x10 y10", "This is a DPI-aware GUI window")
    Gui.Show("x" targetX " y" targetY " w" width " h" height)
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

; Call the function to create the GUI
CreateGUI()
