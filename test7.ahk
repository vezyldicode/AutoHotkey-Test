
#Requires Autohotkey v2
global myGui
; Lấy kích thước màn hình
screenWidth := A_ScreenWidth
screenHeight := A_ScreenHeight
myGUIWidth := 405
myGUIHeight := 147
; Tính toán vị trí cho GUI
xPos := A_ScreenWidth / 2  - myGUIWidth / 2 ; X tại 1/8 chiều rộng màn hình
yPos := A_ScreenHeight * (1/12) ; Y tại giữa màn hình



	myGui := Constructor()
    myGui.Move(10, 20, 200, 100) ;Move(xPos, yPos, myGUIWidth, myGUIHeight)

Constructor()
{	
	myGui := Gui()
    
	; myGui.Opt("+AlwaysOnTop -Caption")
	; myGui.SetFont("s14", "Segoe UI")
	; myGui.SetFont("s16", "Segoe UI")
	; myGui.Add("Text", "x-1 y8 w407 h42 +0x200 +Center", "MACRO THE FINAL STAND 2")
	; myGui.SetFont("s14", "Segoe UI")
	; myGui.Add("Text", "x8 y96 w96 h26 +0x200 -Background", "Loop 2/3")
	; myGui.Add("Text", "x8 y64 w254 h23 +0x200", "Rounds survived last time:")
	; myGui.Add("Text", "x-8 y56 w493 h1 +0x10")
	; myGui.Add("Text", "x104 y96 w176 h26 +0x200", "Current Round :")
	; myGui.Add("Text", "x288 y96 w106 h26 +0x200", "Time")
	; myGui.Add("Progress", "x0 y128 w407 h20 -Smooth", "33")
	myGui.OnEvent('Close', (*) => ExitApp())
	myGui.Title := "Press Pgup Key to cancel"
    ; myGui.Move(800, 200, myGUIWidth, myGUIHeight)
    myGui.Show
	
	return myGui
}