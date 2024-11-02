#Requires AutoHotkey v2.0


if !A_IsAdmin
    {
        Run( "*RunAs " "C:\Program Files\AutoHotkey\v2\AutoHotkey.exe" " " "G:\AutoHotkey-Data\example.ahk")
        ExitApp
    }


SendMode "InputThenPlay" ; chỉ định phương thức mặc định mà các phím bấm or ký tự gửi tới CỬA SỔ or ỨNG DỤNG khác

; MsgBox("Hello World", "Message") ; tạo một hộp thoại thông báo với nội dung HelloWorld và title Message

mainGUI := Gui(, 'Hello World')
mainGUI.SetFont('s12','Segoe UI')
textInput := mainGUI.Add('Edit', 'w400 h50' ,'')
startButton := mainGUI.AddButton('w100 h30', 'Bat dau')
mainGUI.Show('w450 h150')

startButton.OnEvent('Click', onButtonClick)


onButtonClick(*) {
    userInput := textInput.Value
    if (userInput == '') {
        MsgBox('Vui long dien thong tin')
    }else {
        mainGUI.Hide()
        Run('notepad')
        
        if WinWait('Untitled - Notepad' , , 3)
            sleep 1000
            SendText(userInput)
            ExitApp
    }
}
sleep 10000
ExitApp
; mainGUI.OnEvent('Close', (*) => ExitApp())
