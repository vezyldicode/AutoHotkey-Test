#Requires AutoHotkey v2.0


SendMode "InputThenPlay"

if !A_IsAdmin
    {
        Run( "*RunAs " "C:\Program Files\AutoHotkey\v2\AutoHotkey.exe" " " "G:\AutoHotkey-Data\test3.ahk")
        ExitApp
    }

robloxPath := "C:\Users\pc\Desktop\Roblox Player.lnk"

CloseMsgBox() {
    WinClose("ahk_class #32770") ; Đóng hộp thoại (class của MsgBox)
    SetTimer(CloseMsgBox, 0) ; Tắt bộ đếm thời gian
}

Dung() {
    MouseGetPos &xpos, &ypos 
    MsgBox ("màu không đúng, màu đúng là " PixelGetColor(xpos, ypos), "Time ran out")
    ExitApp
}

Run ("*RunAs " "C:\Users\pc\Desktop\Roblox Player.lnk")
Sleep 5000
WinActivate('Roblox')
sleep 1000





; di chuột đến vị trí game
MouseMove 250, 1006 
; nếu đang chọn được game thì bấm vào
MouseGetPos &xpos, &ypos 
color := PixelGetColor(xpos, ypos)
count := 0
Loop{
MouseGetPos &xpos, &ypos 
color := PixelGetColor(xpos, ypos)
    count++
    sleep 100
    if (count > 100)
        Dung ;
    if (color == "0xFFFFFF") 
    {
        SetTimer(CloseMsgBox, 500) 
        MsgBox("mẹ cha mấy thằng súc vật roblox dùng human checker", "Thông báo")
        Click 
        break
    }}
; SetTimer(CloseMsgBox, 1000) 
; MsgBox("vào game sau 1s", "Thông báo")
; Click





cnt := 0

Loop{
    if (cnt >1){
        break
    }
    ;0x00B06F
    ; nếu đã chọn được game thì bấm play
    MouseMove 485, 246
    count := 0
    Loop{
        MouseGetPos &xpos, &ypos 
        color := PixelGetColor(xpos, ypos)
        count++
        sleep 100
        if (count > 300) 
            Dung
        if (color == "0x00B06F") 
        {
            SetTimer(CloseMsgBox, 500) 
            MsgBox("bấm play", "Thông báo")
            Click 
            break
        }
        
    }
    ; sleep 10000









    ;0x2C2826
    ; địt mẹ mày vào private
    MouseMove 289, 679 
    MouseGetPos &xpos, &ypos 
    color := PixelGetColor(xpos, ypos)
    count := 0
    Loop{
    MouseGetPos &xpos, &ypos 
    color := PixelGetColor(xpos, ypos)
        count++
        sleep 100
        if (count > 100)
            Dung  ;
        if (color == "0xFFFFFF") 
        {
            SetTimer(CloseMsgBox, 500) 
            MsgBox("mẹ cha mấy thằng súc vật roblox dùng human checker", "Thông báo")
            Click 
            break
        }}
    ; sleep 5000


    ;0x172A1A
    ; vào career
    MouseMove 1052, 533
    MouseGetPos &xpos, &ypos 
    color := PixelGetColor(xpos, ypos)
    count := 0
    Loop{
    MouseGetPos &xpos, &ypos 
    color := PixelGetColor(xpos, ypos)
        count++
        sleep 100
        if (count > 100)
            Dung  ;
        if (color == "0x0B150D") 
        {
            SetTimer(CloseMsgBox, 500) 
            MsgBox("VÀO CAREER", "Thông báo")
            Click 
            break
        }}
    ; sleep 5000


    ;0x1B1B1B
    ; bấm VÀO tạo private game
    MouseMove 427, 860 
    MouseGetPos &xpos, &ypos 
    color := PixelGetColor(xpos, ypos)
    count := 0
    Loop{
    MouseGetPos &xpos, &ypos 
    color := PixelGetColor(xpos, ypos)
        count++
        sleep 100
        if (count > 100)
            Dung  ;
        if (color == "0xFFFFFF") 
        {
            SetTimer(CloseMsgBox, 500) 
            MsgBox("tạo private", "Thông báo")
            Click 
            break
        }}






    ;0xFFFFFF
    ; bấm vào nút play
    MouseMove 948, 1033

    count := 0
    Loop{
        MouseGetPos &xpos, &ypos 
        color := PixelGetColor(xpos, ypos)
        count++
        sleep 1000
        if (count > 100)
            Dung  ;
        if (color == "0xFFFFFF") 
        {
            SetTimer(CloseMsgBox, 500) 
            MsgBox("bấm bắt đầu trận", "Thông báo")
            Click 
            break
        }}


    ;0xFFFFFF
    ; bấm ready
    MouseMove 1790, 1000
    count := 0
    Loop{
        MouseGetPos &xpos, &ypos 
        color := PixelGetColor(xpos, ypos)
        count++
        sleep 1000
        if (count > 100)
            Dung  ;
        if (color == "0xA6A6A6") 
        {
            SetTimer(CloseMsgBox, 500) 
            MsgBox("bấm ready", "Thông báo")
            sleep 100
            Click 
            break
        }}



    ; bấm đổi góc nhìn
    MouseMove 1137, 992
    count := 0
    Loop{
        MouseGetPos &xpos, &ypos 
        color := PixelGetColor(xpos, ypos)
        count++
        sleep 1000
        if (count > 100)
            Dung  ;
        if (color == "0xFFFFFF") 
        {
            SetTimer(CloseMsgBox, 500) 
            MsgBox("bấm đổi góc nhìn", "chọn màu thành công")
            Click
            sleep 100
            Click
            sleep 100
            Click
            sleep 100
            break
        }}

    sleep 1000
    SendEvent "+"
    sleep 100
    SendEvent "+"

    ; sleep 80000
    ; SetTimer(CloseMsgBox, 500) 
    ;         MsgBox("bấm đổi góc nhìn", "chọn màu thành công")
    ; SendEvent("{w down}") ; Giữ phím W
    ; Sleep(2000)      ; Chờ 2 giây (2000 milliseconds)
    ; SendEvent("{w up}")


    
    ; khóa vị trí
    MouseMove 1018, 659
    count := 0
    Loop{
        MouseGetPos &xpos, &ypos 
        color := PixelGetColor(xpos, ypos)
        count++
        sleep 250
        if (count > 600)
            Dung  ;
        if (color == "0xFFB400") 
        {
            SendEvent("{w down}") 
            Sleep(2500)  
            SendEvent("{w up}")
            SendEvent("{d down}")
            Sleep(2500)      
            SendEvent("{d up}")
            SendEvent("{a down}")
            Sleep(2310)      
            SendEvent("{a up}")
            sleep 100
            SendEvent "F"

            break
        }}



    SendEvent("{d down}") 
    Sleep(2440)  
    SendEvent("{d up}")
    SendEvent("{w down}")
    Sleep(32540)      
    SendEvent("{w up}")


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



    ; đặt xong thì bấm ready
    MouseMove 1790, 1000
    count := 0
    Loop{
        MouseGetPos &xpos, &ypos 
        color := PixelGetColor(xpos, ypos)
        count++
        sleep 1000
        if (count > 10000)
            Dung  ;
        if (color == "0xA6A6A6") 
        {
            SetTimer(CloseMsgBox, 500) 
            MsgBox("bấm ready", "Thông báo")
            sleep 100
            Click 
            break
        }}
    ;chờ đến round thứ 3
    MouseMove 1790, 1000
    sleep 3000
    count := 0
    Loop{
        MouseGetPos &xpos, &ypos 
        color := PixelGetColor(xpos, ypos)
        count++
        sleep 1000
        if (count > 100)
            Dung  ;
        if (color == "0xA6A6A6") 
        {
            SetTimer(CloseMsgBox, 500) 
            MsgBox("bấm ready", "Thông báo")
            sleep 100
            Click 
            break
        }}

    SendEvent "3"
    SendEvent "3"
    SetTimer(CloseMsgBox, 300) 
    MsgBox("Đang đặt 3...", "Thông báo")
    MouseMove 1201, 819
    sleep 1000
    SendEvent "{Lbutton}"
    sleep 1000

    ;chờ đến round thứ 4
    MouseMove 1790, 1000
    sleep 3000
    count := 0
    Loop{
        MouseGetPos &xpos, &ypos 
        color := PixelGetColor(xpos, ypos)
        count++
        sleep 1000
        if (count > 100)
            Dung  ;
        if (color == "0xA6A6A6") 
        {
            SetTimer(CloseMsgBox, 500) 
            MsgBox("bấm ready", "Thông báo")
            sleep 100
            Click 
            break
        }}

    SendEvent "3"
    SendEvent "3"
    SetTimer(CloseMsgBox, 300) 
    MsgBox("Đang đặt 4...", "Thông báo")
    MouseMove 1081, 671
    sleep 1000
    SendEvent "{Lbutton}"
    sleep 1000
    death := 0
    count := 0


    Loop{
        MouseMove 1790, 1000
        MouseGetPos &xpos, &ypos 
        color := PixelGetColor(xpos, ypos)
        count++
        sleep 1000
        if (death >2)
            break
        if (count > 1000)
            Dung  ;
        if (color == "0xA6A6A6") 
        {
            SetTimer(CloseMsgBox, 500) 
            MsgBox("bấm ready", "Thông báo")
            sleep 100
            Click 
            count := 0
        }
        if (PixelGetColor(500, 200) == 0x000000 and PixelGetColor(1500, 200) == 0x000000 and PixelGetColor(500, 900) == 0x000000 and PixelGetColor(1500, 900) == 0x000000)
            {death++
            SetTimer(CloseMsgBox, 1000) 
            MsgBox ("so lan chet" death)
            sleep 8000
        }
    }

    ; SendEvent("{s down}")
    ; Sleep(32540)      
    ; SendEvent("{s up}")

    if (death >2){
        SendEvent "{Esc}"
        sleep 1000
        SendEvent "L"
        sleep 1000
        SendEvent "{Enter}"
        sleep 1000
        cnt++
    }
}
SetTimer(CloseMsgBox, 3000) 
MsgBox("Chạy thành công", "Thông báo")
ExitApp