;Macro The final stand 2 Roblox

#Requires AutoHotkey v2.0
SendMode "InputThenPlay"


; chọn game pixel màu trắng
global xct := 960
global yct := 540
; chọn game pixel màu trắng
global x1 := 250
global y1 := 1006
; nút vào game màu xanh góc trên bên trái
global x2 := 485
global y2 := 246
; bấm vào private game pixel màu trắng
global x3 := 289
global y3 := 679
; bấm vào career mode đang lỗi
global x4 := 1052
global y4 := 533
; bấm vào tạo Private game
global x5 := 427
global y5 := 860
; bấm vào nút play trong trận
global x6 := 948
global y6 := 1033
; bấm nút Ready (dùng pixel màu trắng ở ngay chữ R - tránh bị trùng vào Kill)
global x7 := 1790
global y7 := 1000
; bấm nút sang phải 3 lần pixel màu trắng ở mũi tên
global x8 := 1137
global y8 := 992
; vị trí nhận tiền round đầu tiên pixel màu vàng
global x9 := 1018
global y9 := 659


ShortWaitingTime(){ ;anti-system overload
    Sleep 200
}

NormalWaitingTime(){ ;pause between actions
    Sleep 1000
}

LongWaitingTime(){ ;wait for system response
    Sleep 5000
}

runRoblox(){ ;run Roblox as Administrator
    Run ("*RunAs " "C:\Users\pc\Desktop\Roblox-Player.lnk")
    LongWaitingTime
    WinActivate('Roblox')
    NormalWaitingTime
}

CloseMsgBox() { ;close dialog box automatically
    WinClose("ahk_class #32770")
    SetTimer(CloseMsgBox, 0)
}

ErrorMissTime() { ;error report, close Program
    MouseGetPos &xpos, &ypos 
    MsgBox ("unexpected color, the color code collected is: " PixelGetColor(xpos, ypos), "Time ran out")
    ExitApp
}

if !A_IsAdmin{ ; run as Administrator
    Run( "*RunAs " "C:\Program Files\AutoHotkey\v2\AutoHotkey.exe" " " "G:\AutoHotkey-Data\test3.ahk")
    ExitApp
}


;Main Graphical User Interface
mainGUI := Gui(, 'Enter the number of loops you want')
mainGUI.SetFont('s12','Segoe UI')
textInput := mainGUI.Add('Edit', 'w400 h50' ,'')
startButton := mainGUI.AddButton('w200 h30', 'Run (powered by Vezyl)')
mainGUI.Show('w450 h150')
startButton.OnEvent('Click', onButtonClick)
isContinuePressed := false  ; Biến để kiểm tra trạng thái

onButtonClick(*) {
    global isContinuePressed  ; Sử dụng biến toàn cục
    global userInput := textInput.Value
    if (userInput == '') {
    MsgBox('Mày đang đéo nhập gì cả', "Macro by Vezyl")
    }else if !RegExMatch(userInput, "^\d+$") {
        MsgBox('Mày cần nhập vào đúng định dạng 1 số', "Macro by Vezyl")
        isButtonClicked := false  ; Đặt lại nếu không phải là số
        return
    }else {
        result := userInput * 20  ; Nhân biến userInput với 20
        confirm := MsgBox("Run the program with the number of loops is " userInput "`nEstimated time (minutes) :" result, "Macro by Vezyl", 4)  ; 4 là flag cho Yes/No
        if (confirm == 'No') {
            ExitApp  ; Nếu người dùng chọn "No", kết thúc
            isContinuePressed := false
        }
        isContinuePressed := true
        mainGUI.Hide()
        main()
    }
}
if (!isContinuePressed) {
    return
}

isRunning := true
PgUp::{
isRunning := false
}
main(){
    runRoblox


    ;hover to most recent game location
    MouseMove x1, y1 
    count := 0
    Loop{ ;confirm and click on the most recent game
    MouseGetPos &xpos, &ypos 
    color := PixelGetColor(xpos, ypos)
        count++
        ShortWaitingTime
        if (count > 100)
            ErrorMissTime ;error report after 100 tries
        if (color == "0xFFFFFF") 
        {
            SetTimer(CloseMsgBox, 500) 
            MsgBox("mẹ cha mấy thằng súc vật roblox dùng human checker", "Macro by Vezyl")
            Click 
            break
        }}

    ;generate loop number according to user data
    loopCount := userInput
    loopCurrent := 0
    stopFlag := false

    Loop loopCount { ;macro loop execution
        if (GetKeyState("PgUp", "P")) {
            stopFlag := true
            break  ; Exit the loop if Page Up is pressed
        }
        
        ;0x00B06F
        MouseMove x2, y2
        count := 0
        While (!stopFlag) { ;confirm and click to join game
            if (GetKeyState("PgUp", "P")) {
                stopFlag := true  ; Set the flag if Page Up is pressed
                break  ; Break out of the While loop
            }
            MouseGetPos &xpos, &ypos 
            color := PixelGetColor(xpos, ypos)
            count++
            ShortWaitingTime
            if (count > 300) 
                ErrorMissTime
            if (color == "0x00B06F") {
                SetTimer(CloseMsgBox, 500) 
                MsgBox("bấm play", "Thông báo")
                Click 
                break
            }
        }


        ;0x2C2826
        ; địt mẹ mày vào private
        MouseMove x3, y3 
        MouseGetPos &xpos, &ypos 
        color := PixelGetColor(xpos, ypos)
        count := 0
        Loop{ ;confirm and click on private game tab
            MouseGetPos &xpos, &ypos 
            color := PixelGetColor(xpos, ypos)
            count++
            ShortWaitingTime
            if (count > 100)
                ErrorMissTime  ;
            if (color == "0xFFFFFF") 
            {
                SetTimer(CloseMsgBox, 500) 
                MsgBox("Đang chọn vào private game", "Thông báo")
                Click 
                break
            }
        }


        ;0x172A1A
        ; vào career
        MouseMove x4, y4
        count := 0
        Loop{ ;confirm and click on career mode tab
            MouseGetPos &xpos, &ypos 
            color := PixelGetColor(xpos, ypos)
            count++
            ShortWaitingTime
            if (count > 100)
                ErrorMissTime  ;
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
        MouseMove x5, y5
        count := 0
        Loop{ ;confirm and click create private game
            MouseGetPos &xpos, &ypos 
            color := PixelGetColor(xpos, ypos)
            count++
            ShortWaitingTime
            if (count > 100)
                ErrorMissTime  ;
            if (color == "0xFFFFFF") 
            {
                SetTimer(CloseMsgBox, 500) 
                MsgBox("tạo private", "Thông báo")
                Click 
                break
            }
        }


        ;0xFFFFFF
        ; bấm vào nút play
        MouseMove x6, y6
        count := 0
        Loop{
            MouseGetPos &xpos, &ypos 
            color := PixelGetColor(xpos, ypos)
            count++
            NormalWaitingTime
            if (count > 100)
                ErrorMissTime  ;
            if (color == "0xFFFFFF") 
            {
                SetTimer(CloseMsgBox, 500) 
                MsgBox("bấm bắt đầu trận", "Thông báo")
                Click 
                break
            }
        }


        ;0xFFFFFF
        ; bấm ready
        NormalWaitingTime
        MouseMove x7, y7
        count := 0
        Loop{
            MouseGetPos &xpos, &ypos 
            color := PixelGetColor(xpos, ypos)
            count++
            NormalWaitingTime
            if (count > 100)
                ErrorMissTime  ;
            if (color == "0xA6A6A6") 
            {
                SetTimer(CloseMsgBox, 500) 
                MsgBox("bấm ready", "Thông báo")
                sleep 100
                Click 
                break
            }
        }



        ; bấm đổi góc nhìn
        MouseMove x8, y8
        count := 0
        Loop{
            MouseGetPos &xpos, &ypos 
            color := PixelGetColor(xpos, ypos)
            count++
            NormalWaitingTime
            if (count > 100)
                ErrorMissTime  ;
            if (color == "0xFFFFFF") 
            {
                SetTimer(CloseMsgBox, 500) 
                MsgBox("bấm đổi góc nhìn", "chọn màu thành công")
                Click
                ShortWaitingTime
                Click
                ShortWaitingTime
                Click
                ShortWaitingTime
                break
            }
        }

        ; sleep 1000
        ; SendEvent "+"
        ; sleep 100
        ; SendEvent "+"

        ; sleep 80000
        ; SetTimer(CloseMsgBox, 500) 
        ;         MsgBox("bấm đổi góc nhìn", "chọn màu thành công")
        ; SendEvent("{w down}") ; Giữ phím W
        ; Sleep(2000)      ; Chờ 2 giây (2000 milliseconds)
        ; SendEvent("{w up}")


        
        ; khóa vị trí
        MouseMove x9, y9
        count := 0
        Loop{ ;move character out of shop
            MouseGetPos &xpos, &ypos 
            color := PixelGetColor(xpos, ypos)
            count++
            sleep 250
            if (count > 600)
                ErrorMissTime  ;
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
            }
        }


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
        MouseMove x7, y7
        count := 0
        Loop{
            MouseMove x7, y7
            MouseGetPos &xpos, &ypos 
            color := PixelGetColor(xpos, ypos)
            count++
            sleep 1000
            if (count > 10000)
                ErrorMissTime  ;
            if (color == "0xA6A6A6") 
            {
                SetTimer(CloseMsgBox, 500) 
                MsgBox("bấm ready", "Thông báo")
                sleep 100
                Click 
                break
            }}
        ;chờ đến round thứ 3
        MouseMove x7, y7
        sleep 3000
        count := 0
        Loop{
            MouseMove x7, y7
            MouseGetPos &xpos, &ypos 
            color := PixelGetColor(xpos, ypos)
            count++
            sleep 1000
            if (count > 100)
                ErrorMissTime  ;
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
        MouseMove xct, yct
        sleep 3000
        count := 0
        Loop{
            MouseMove x7, y7
            MouseGetPos &xpos, &ypos 
            color := PixelGetColor(xpos, ypos)
            count++
            sleep 1000
            if (count > 1000)
                ErrorMissTime  ;
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
            if (!isRunning) ; Kiểm tra trạng thái biến
                break ;
            MouseMove x7, y7
            MouseGetPos &xpos, &ypos 
            color := PixelGetColor(xpos, ypos)
            count++
            sleep 1000
            if (death >2)
                break
            if (count > 1000)
                ErrorMissTime  ;
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
                sleep 10000
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

        ; loop count notification
        loopCurrent := A_Index
        LoopRemaining := loopCount - loopCurrent
        SetTimer(CloseMsgBox, 1000)
        MsgBox("complete the loop: " loopCurrent "`nremaining loop : " LoopRemaining)
    }
    SetTimer(CloseMsgBox, 3000) 
    MsgBox("Chạy thành công", "Thông báo")
    ExitApp
}