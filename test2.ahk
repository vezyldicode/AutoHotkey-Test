#Requires AutoHotkey v2.0
SendMode "InputThenPlay"
if !A_IsAdmin
    {
        Run( "*RunAs " "C:\Program Files\AutoHotkey\v2\AutoHotkey.exe" " " "G:\AutoHotkey-Data\test2.ahk")
        ExitApp
    }


CloseMsgBox() {
    WinClose("ahk_class #32770") ; Đóng hộp thoại (class của MsgBox)
    SetTimer(CloseMsgBox, 0) ; Tắt bộ đếm thời gian
}








sleep 5000

SendEvent "2"
SetTimer(CloseMsgBox, 300) 
MsgBox("Đang đặt 1...", "Thông báo")
MouseMove 864, 690
sleep 1000
SendEvent "{Lbutton}"
sleep 1000



SendEvent "3"
SetTimer(CloseMsgBox, 300) 
MsgBox("Đang đặt 2...", "Thông báo")
MouseMove 849, 821
sleep 1000
SendEvent "{Lbutton}"
sleep 1000


SendEvent "3"
SendEvent "3"
SetTimer(CloseMsgBox, 300) 
MsgBox("Đang đặt 3...", "Thông báo")
MouseMove 1201, 819
sleep 1000
SendEvent "{Lbutton}"
sleep 1000

SendEvent "3"
SendEvent "3"
SetTimer(CloseMsgBox, 300) 
MsgBox("Đang đặt 4...", "Thông báo")
MouseMove 1081, 671
sleep 1000
SendEvent "{Lbutton}"
sleep 1000



ExitApp