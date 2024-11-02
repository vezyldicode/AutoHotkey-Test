#Requires AutoHotkey v2.0

SendMode "InputThenPlay"

if !A_IsAdmin
    {
        Run( "*RunAs " "C:\Program Files\AutoHotkey\v2\AutoHotkey.exe" " " "G:\AutoHotkey-Data\test.ahk")
        ExitApp
    }

; Đường dẫn đến file shortcut Roblox Player trên Desktop
robloxPath := "C:\Users\pc\Desktop\Roblox Player.lnk"

; Chạy Roblox
Run "C:\Users\pc\Desktop\Roblox Player.lnk"
Sleep 1000 ; Chờ 10 giây cho Roblox mở (bạn có thể điều chỉnh nếu cần)


; ; Chuyển sang cửa sổ Roblox (có thể thay đổi nếu cần)
WinActivate('Roblox')

; Send "!{Tab}"

sleep 5000
Click
MouseGetPos &xpos, &ypos 
MsgBox "The cursor is at X" xpos " Y" ypos
Click 2
MouseMove 1000, 500, 10
MouseMove -907, -68, 100, "R" ; Toạ độ mẫu (400, 300), với tốc độ di chuyển là 20
Click
MouseGetPos &xpos, &ypos 
Click 2
MsgBox "The cursor is at X" xpos " Y" ypos
sleep 100
Click 2
MouseMove 15, 68, 100, "R" ; Toạ độ mẫu (400, 300), với tốc độ di chuyển là 20
; MouseMove 93, 432, 10, "R" ; Toạ độ mẫu (400, 300), với tốc độ di chuyển là 20
; MouseMove 200, 300, 1, "R"
Click
MouseGetPos &xpos, &ypos 
MsgBox "The cursor is at X" xpos " Y" ypos
sleep 100
Click 2
; MouseMove 108, 500, 10, "R"
ExitApp