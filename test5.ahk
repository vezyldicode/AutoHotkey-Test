#Requires Autohotkey v2

global Totalhotkey1
global Totalhotkey2
global Totalhotkey3
global Totalhotkey4
global Totalhotkey5 


	mainGUI := Gui()
	mainGUI.SetFont("s14", "Segoe UI")
	mainGUI.SetFont("s30 cBlack")
	startButton := mainGUI.Add("Button", "x544 y16 w64 h49", "▸")
    mainGUI.Title := "MACRO THE FINAL STAND 2"


    ; nhập thông tin số lần loop
	mainGUI.SetFont("s14", "Segoe UI")
	mainGUI.Add("Text", "x16 y16 w309 h34 +0x200 -Background", "Enter the number of loops you want:")
	MyText := mainGUI.Add("Text", "x400 y16 w137 h33 +0x200", "Estimated time")
	textInput := mainGUI.Add("ComboBox", "x328 y16 w62", ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20"])
	
    ;phần chữ
	mainGUI.Add("Text", "x16 y72 w120 h23 +0x200", "Gear Setting")
	mainGUI.Add("Text", "x16 y112 w112 h23 +0x200", "Hotkey")
	mainGUI.Add("Text", "x160 y112 w112 h23 +0x200", "Round 2")
	mainGUI.Add("Text", "x304 y112 w112 h23 +0x200", "Round 3")
	mainGUI.Add("Text", "x448 y112 w113 h23 +0x200", "Round 4")

    ;simple macro
    input1 := mainGUI.Add("ComboBox", "x16 y136 w112", ["1", "2", "3", "4", "5", "6", "7", "8"])
	input2 := mainGUI.Add("ComboBox", "x160 y136 w112", ["1", "2", "3", "4", "5", "6", "7", "8"])
	input3 := mainGUI.Add("ComboBox", "x304 y136 w112", ["1", "2", "3", "4", "5", "6", "7", "8"])
	input4 := mainGUI.Add("ComboBox", "x448 y136 w112", ["1", "2", "3", "4", "5", "6", "7", "8"])
	input5 := mainGUI.Add("ComboBox", "x16 y200 w112", ["1", "2", "3", "4", "5", "6", "7", "8"])
	input6 := mainGUI.Add("ComboBox", "x160 y200 w112", ["1", "2", "3", "4", "5", "6", "7", "8"])
	input7 := mainGUI.Add("ComboBox", "x304 y200 w112", ["1", "2", "3", "4", "5", "6", "7", "8"])
	input8 := mainGUI.Add("ComboBox", "x448 y200 w112", ["1", "2", "3", "4", "5", "6", "7", "8"])
	input9 := mainGUI.Add("ComboBox", "x16 y264 w112", ["1", "2", "3", "4", "5", "6", "7", "8"])
	input10 := mainGUI.Add("ComboBox", "x160 y264 w112", ["1", "2", "3", "4", "5", "6", "7", "8"])
	input11 := mainGUI.Add("ComboBox", "x304 y264 w112", ["1", "2", "3", "4", "5", "6", "7", "8"])
	input12 := mainGUI.Add("ComboBox", "x448 y264 w112", ["1", "2", "3", "4", "5", "6", "7", "8"])

    ;advanced macro
	mainGUI.Add("Text", "x16 y336 w291 h25 +0x200", "Special Gear (Non-rechargeable)")
	input13 := mainGUI.Add("ComboBox", "x16 y384 w112", ["1", "2", "3", "4", "5", "6", "7", "8"])
	input14 := mainGUI.Add("ComboBox", "x160 y384 w112", ["1", "2", "3", "4", "5", "6", "7", "8"])
	input15 := mainGUI.Add("ComboBox", "x16 y448 w112", ["1", "2", "3", "4", "5", "6", "7", "8"])
	input16 := mainGUI.Add("ComboBox", "x160 y448 w112", ["1", "2", "3", "4", "5", "6", "7", "8"])
	mainGUI.SetFont("s10")
	mainGUI.Add("Text", "x304 y384 w257 h34", "Upper right corner (recommended: Flame turret). Round 2")
	mainGUI.SetFont("s14", "Segoe UI")
	mainGUI.SetFont("s10")
	mainGUI.Add("Text", "x304 y448 w257 h34", "Bottom corner (recommended: Mortar). Round 17")
	mainGUI.SetFont("s14", "Segoe UI")


    ; thông tin total gear
    
	Totalhotkey1 := mainGUI.Add("Text", "x568 y136 w48 h33 +0x200", "0")
	Totalhotkey2 := mainGUI.Add("Text", "x568 y200 w48 h33 +0x200", "0")
	Totalhotkey3 := mainGUI.Add("Text", "x568 y264 w48 h33 +0x200", "0")
	Totalhotkey4 := mainGUI.Add("Text", "x568 y384 w48 h33 +0x200", "0")
	Totalhotkey5 := mainGUI.Add("Text", "x568 y448 w48 h33 +0x200", "0")


    ;lệnh điều khiển và chuyển trạng thái
	startButton.OnEvent("Click", OnEventHandler)
	textInput.OnEvent("Change", OnEventHandler)
	input1.OnEvent("Change", OnEventHandler)
	input2.OnEvent("Change", OnEventHandler)
	input3.OnEvent("Change", OnEventHandler)
	input4.OnEvent("Change", OnEventHandler)
	input5.OnEvent("Change", OnEventHandler)
	input6.OnEvent("Change", OnEventHandler)
	input7.OnEvent("Change", OnEventHandler)
	input8.OnEvent("Change", OnEventHandler)
	input9.OnEvent("Change", OnEventHandler)
	input10.OnEvent("Change", OnEventHandler)
	input11.OnEvent("Change", OnEventHandler)
	input12.OnEvent("Change", OnEventHandler)
	input13.OnEvent("Change", OnEventHandler)
	input14.OnEvent("Change", OnEventHandler)
	input15.OnEvent("Change", OnEventHandler)
	input16.OnEvent("Change", OnEventHandler)
	mainGUI.OnEvent('Close', (*) => ExitApp())

	
	
	OnEventHandler(*)
	{
        global isContinuePressed  ; Sử dụng biến toàn cục
        global userInput := textInput.Value
        global HotKey1 := input1.Value
        global NumforHotkey1round2 := input2.Value
        global NumforHotkey1round3 := input3.Value
        global NumforHotkey1round4 := input4.Value
        global HotKey2 := input5.Value
        global NumforHotkey2round2 := input6.Value
        global NumforHotkey2round3 := input7.Value
        global NumforHotkey2round4 := input8.Value
        global HotKey3 := input9.Value
        global NumforHotkey3round2 := input10.Value
        global NumforHotkey3round3 := input11.Value
        global NumforHotkey3round4 := input12.Value
        global Hotkey4 := input13.Value
        global NumforHotkey4 := input14.Value
        global Hotkey5 := input15.Value
        global NumforHotkey5 := input16.Value

        global Totalhotkey1
        global Totalhotkey2
        global Totalhotkey3
        global Totalhotkey4
        global Totalhotkey5

        Totalhotkey1.value := NumforHotkey1round2 + NumforHotkey1round3 + NumforHotkey1round4
        Totalhotkey2.text := NumforHotkey2round2 + NumforHotkey2round3 + NumforHotkey2round4
        Totalhotkey3.text := NumforHotkey3round2 + NumforHotkey3round3 + NumforHotkey3round4
        Totalhotkey4.text := NumforHotkey4
        Totalhotkey5.text := NumforHotkey5
        ; MsgBox(" input2 " NumforHotkey1round2)
        totalMinutes := userInput * 45
        hours := totalMinutes // 60
        minutes := Mod(totalMinutes, 60)
        result := " " hours "h" minutes "m"
        MyText.Text := (result)
		; ToolTip("Click! This is a sample action.`n"
		; . "Active GUI element values include:`n"
		; . "startButton => " startButton.Text "`n" 
		; . "textInput => " textInput.Text "`n" 
		; . "input1 => " input1.Text "`n" 
		; . "input2 => " input2.Text "`n" 
		; . "input3 => " input3.Text "`n" 
		; . "input4 => " input4.Text "`n" 
		; . "input5 => " input5.Text "`n" 
		; . "input6 => " input6.Text "`n" 
		; . "input7 => " input7.Text "`n" 
		; . "input8 => " input8.Text "`n" 
		; . "input9 => " input9.Text "`n" 
		; . "input10 => " input10.Text "`n" 
		; . "input11 => " input11.Text "`n" 
		; . "input12 => " input12.Text "`n" 
		; . "input13 => " input13.Text "`n" 
		; . "input14 => " input14.Text "`n" 
		; . "input15 => " input15.Text "`n" 
		; . "input16 => " input16.Text "`n", 77, 277)
		; SetTimer () => ToolTip(), -3000 ; tooltip timer
	}
	mainGUI.Show("w623 h514")
	return
