#Requires Autohotkey v2
global gameGUI




GUIingame()


GUIingame() {
    
    gameGUI := Constructor()
    gameGUI.Move(10, 20, 200, 100)
	
}

Constructor(){
    gameGUI := Gui()
    ; gameGUI.Opt("+AlwaysOnTop -Caption")
	; gameGUI.SetFont("s14", "Segoe UI")
	; gameGUI.SetFont("s16", "Segoe UI")
	; gameGUI.Add("Text", "x-1 y8 w407 h42 +0x200 +Center", "MACRO THE FINAL STAND 2")
	; gameGUI.SetFont("s14", "Segoe UI")
	; gameGUI.Add("Text", "x8 y96 w96 h26 +0x200 -Background", "Loop 2/3")
	; gameGUI.Add("Text", "x8 y64 w254 h23 +0x200", "Rounds survived last time:")
	; gameGUI.Add("Text", "x-8 y56 w493 h1 +0x10")
	; gameGUI.Add("Text", "x104 y96 w176 h26 +0x200", "Current Round :")
	; gameGUI.Add("Text", "x288 y96 w106 h26 +0x200", "Time")
	; gameGUI.Add("Progress", "x0 y128 w407 h20 -Smooth", "33")
	gameGUI.OnEvent('Close', (*) => ExitApp())
	gameGUI.Title := "Press Pgup Key to cancel"
    
    gameGUI.Show
    return gameGUI
}