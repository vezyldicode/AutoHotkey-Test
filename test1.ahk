#Requires AutoHotkey v2.0

MsgBox("Hello World", "Message")

mainGUI := Gui(, 'Hello World')
mainGUI.SetFont('s12','Segoe UI')
text := mainGUI.Add('Edit', 'w400 h50' ,'')
startButton := mainGUI.AddButton('w100 h30'. 'Bat dau')
mainGUI.Show('w450 h150')

mainGUI.OnEvent ('Close', (*) => ExitApp())
