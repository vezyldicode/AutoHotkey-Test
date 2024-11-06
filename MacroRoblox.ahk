#Requires AutoHotkey v2.0


/*
Macro The final stand 2 Roblox
Author: Tuan Viet Nguyen
https://github.com/vezyldicode
Date: 07.11.2024
Description: Chương trình này chứa các hàm để thực hiện lệnh macro trong career mode game the final stand 2.

---
Convention
1 lần tiến lên (w key) được tính bằng 1 cDis, mặc định bằng 1400ms .Quãng đường di chuyển từ nhà lên đến chỗ setup mặc định là 30 cDis

---
Note when using for the first time
1. sửa lại các vị trí x, y và màu pixel theo chú thích
2. thay đổi đường dẫn roblox và file source (2 chương trình BẮT BUỘC phải chạy dưới quyền Admin, đã được tích hợp sẵn trong code)
3. 

*/




SendMode "InputThenPlay"


; chính giữa màn hình
global xct := 960
global yct := 540
global cct
; chọn game pixel màu trắng
global x1 := 250
global y1 := 1006
global c1 := 0xFFFFFF
; nút vào game màu xanh góc trên bên trái
global x2 := 485
global y2 := 246
global c2 := 0x00B06F
; bấm vào private game pixel màu trắng
global x3 := 289
global y3 := 679
global c3 := 0xFFFFFF
; bấm vào career mode màu xanh dương
global x4 := 1052
global y4 := 533
global c4 := 0x0B150D
; bấm vào tạo Private game
global x5 := 427
global y5 := 860
global c5 := 0xFFFFFF
; bấm vào nút play trong trận
global x6 := 948
global y6 := 1033
global c6 := 0xFFFFFF
; bấm nút Ready (dùng pixel màu trắng ở ngay chữ R - tránh bị trùng vào Kill)
global x7 := 1790
global y7 := 1000
global c7 := 0xA6A6A6
; bấm nút sang phải 3 lần pixel màu trắng ở mũi tên
global x8 := 1137
global y8 := 992
global c8 := 0xFFFFFF
; vị trí nhận tiền round đầu tiên pixel màu vàng
global x9 := 1018
global y9 := 659
global c9 := 0xFFB400

; 4 vị trí đặt đồ
global x10 := 934 ;864
global y10 := 690 ;690
global x11 := 1021 ;849
global y11 := 671 ;821
global x12 := 1101 ;1201
global y12 := 819 ;819
global x13 := 919 ; 1081
global y13:= 821 ;671

backwardtime := 0
global rechargeWait
SpecialGear1SetupDone := true
getroundsSurvivedvalue := 0
firsttimesetup := true
global cDis := 0

screenWidth := A_ScreenWidth
screenHeight := A_ScreenHeight
global gameGUIWidth := 405
global gameGUIHeight := 147
; Tính toán vị trí cho GUI
xPos := A_ScreenWidth / 2  - gameGUIWidth / 2 ; X tại 1/8 chiều rộng màn hình
yPos := A_ScreenHeight * (1/12) ; Y tại giữa màn hình

runRoblox(){ ;run Roblox as Administrator
    Run ("*RunAs " "C:\Users\pc\Desktop\Roblox-Player.lnk")
    LongWaitingTime
    WinActivate('Roblox')
    NormalWaitingTime
}

if !A_IsAdmin{ ; run as Administrator
    Run( "*RunAs " "C:\Program Files\AutoHotkey\v2\AutoHotkey.exe" " " "G:\AutoHotkey-Data\Macroroblox.ahk")
    ExitApp
}

ShortWaitingTime(){ ;anti-system overload
    ; Sleep 200
    global globalStopFlag

    totalSleepDuration := 200
    sleepInterval := 50
    elapsed := 0
    While (elapsed < totalSleepDuration) {
        if (GetKeyState("PgUp", "P")) {
            stopFlag := true  ; Set the flag if Page Up is pressed
            ErrorMissTime
            break  ; Exit the sleep loop
        }
        Sleep sleepInterval  ; Sleep for a short interval
        elapsed += sleepInterval  ; Increment elapsed time
    }
}

NormalWaitingTime(){ ;pause between actions
    global globalStopFlag

    totalSleepDuration := 1000
    sleepInterval := 50
    elapsed := 0
    While (elapsed < totalSleepDuration) {
        if (GetKeyState("PgUp", "P")) {
            stopFlag := true  ; Set the flag if Page Up is pressed
            ErrorMissTime
            break  ; Exit the sleep loop
        }
        Sleep sleepInterval  ; Sleep for a short interval
        elapsed += sleepInterval  ; Increment elapsed time
    }
}

LongWaitingTime(){ ;wait for system response
    global globalStopFlag

    totalSleepDuration := 5000
    sleepInterval := 50
    elapsed := 0
    While (elapsed < totalSleepDuration) {
        if (GetKeyState("PgUp", "P")) {
            stopFlag := true  ; Set the flag if Page Up is pressed
            ErrorMissTime
            break  ; Exit the sleep loop
        }
        Sleep sleepInterval  ; Sleep for a short interval
        elapsed += sleepInterval  ; Increment elapsed time
        ; Sleep (10000)
    }
}

AvgLongWaitingTime(){
    global globalStopFlag

    totalSleepDuration := 2500
    sleepInterval := 50
    elapsed := 0
    While (elapsed < totalSleepDuration) {
        if (GetKeyState("PgUp", "P")) {
            stopFlag := true  ; Set the flag if Page Up is pressed
            ErrorMissTime
            break  ; Exit the sleep loop
        }
        Sleep sleepInterval  ; Sleep for a short interval
        elapsed += sleepInterval  ; Increment elapsed time
    }
}

;time to go from corner to door
DoorTime(){ ;wait for system response
    global globalStopFlag

    totalSleepDuration := 2310
    sleepInterval := 50
    elapsed := 0
    While (elapsed < totalSleepDuration) {
        if (GetKeyState("PgUp", "P")) {
            stopFlag := true  ; Set the flag if Page Up is pressed
            ErrorMissTime
            break  ; Exit the sleep loop
        }
        Sleep sleepInterval  ; Sleep for a short interval
        elapsed += sleepInterval  ; Increment elapsed time
    }
}

;time to go from door to center
CenterTime(){ ;wait for system response
    global globalStopFlag

    totalSleepDuration := 2440
    sleepInterval := 50
    elapsed := 0
    While (elapsed < totalSleepDuration) {
        if (GetKeyState("PgUp", "P")) {
            stopFlag := true  ; Set the flag if Page Up is pressed
            ErrorMissTime
            break  ; Exit the sleep loop
        }
        Sleep sleepInterval  ; Sleep for a short interval
        elapsed += sleepInterval  ; Increment elapsed time
    }
}

;time to go from center to Placement position
PlacementWalkTime(){ ;wait for system response
    ; global globalStopFlag

    ; totalSleepDuration := 41540
    ; sleepInterval := 50
    ; elapsed := 0
    ; While (elapsed < totalSleepDuration) {
    ;     if (GetKeyState("PgUp", "P")) {
    ;         stopFlag := true  ; Set the flag if Page Up is pressed
    ;         ErrorMissTime
    ;         break  ; Exit the sleep loop
    ;     }
    ;     Sleep sleepInterval  ; Sleep for a short interval
    ;     elapsed += sleepInterval  ; Increment elapsed time
    ; }
    Loop 30 {
    MoveForward
    }
}


CloseMsgBox() { ;close dialog box automatically
    WinClose("ahk_class #32770")
    SetTimer(CloseMsgBox, 0)
}

ErrorMissTime() { ;error report, close Program
    MouseGetPos &xpos, &ypos 
    color := PixelGetColor(xpos, ypos)
    if (globalStopFlag == true){
        MsgBox("Stop by User", "Time ran out")
    } else MsgBox("unexpected color, the color code collected is: " color, "Time ran out")
    ExitApp
}
; recharge đang lỗi, tức là khi ready rồi, xong mới gọi hàm gearsetup lên, và khi đó bị kẹt trong vòng lặp vì không bấm thêm được ready nữa

ReadyUp(){ ;wait for the ready button and press (function has a waiting time of about 1 round)
    global rechargeWait
    global globalStopFlag 
    global globalDeath
    global globalAutoReady
    global roundcount
    global SpecialGear1SetupDone
    global getroundsSurvivedvalue
    if (GetKeyState("PgUp", "P")) {
        globalStopFlag := true
    }
    NormalWaitingTime
    count := 0
    While (!globalStopFlag) {
        if (GetKeyState("PgUp", "P")) {
            globalStopFlag := true
            ErrorMissTime
            break
        }
        MouseMove x7, y7
        MouseGetPos &xpos, &ypos 
        color := PixelGetColor(xpos, ypos)
        count++
        NormalWaitingTime
        if (count > 10000)
            ErrorMissTime
        if (globalDeath >0)
            break
        if (color == c7) 
        {
            if (roundcount == 16 and SpecialGear1SetupDone == false){ ;setup sau round chỉ định 1 round
                Loop backwardtime {
                    MoveForward
                }
                SpecialGear1Setup
                Loop backwardtime {
                    MoveBackward
                }
                SpecialGear1SetupDone := true
                MouseMove x7, y7
            }
            SetTimer(CloseMsgBox, 500) 
            MsgBox("bấm ready", "Thông báo")
            ShortWaitingTime
            ShortWaitingTime
            Click
            roundcount++
            SetTimer(CloseMsgBox, 1000)
            MsgBox("Hien tai dang round " roundcount, "Thông báo")
            if (!globalAutoReady || recharging)
            break
            else count := 0
        }
        if (PixelGetColor(500, 200) == 0x000000 and PixelGetColor(1500, 200) == 0x000000 and PixelGetColor(500, 900) == 0x000000 and PixelGetColor(1500, 900) == 0x000000)
            {globalDeath++
            roundcount--
            getroundsSurvivedvalue := roundcount

            SetTimer(CloseMsgBox, 1000) 
            MsgBox("so lan chet" globalDeath)
            LongWaitingTime
            LongWaitingTime
        }
        if (roundcount == 14 and rechargeWait == true){
            MoveBackward
            GearSetup
        }

        if (roundcount == 18 and rechargeWait == true){
            MoveBackward
            GearSetup
        }
        if (roundcount == 21 and rechargeWait == true){
            MoveBackward
            GearSetup
            rechargeWait := false
        }
    }
}

global recharging := false
GearSetup(){
    x13able := true
    global globalDeath
    global recharging
    global rechargeWait
    round := 2
    currentHoyKey1 := 0
    currentHotKey2 := 0
    currentHotKey3 := 0
    currentX := x10
    currentY := y10
    While (round <5 and globalDeath ==0){ ;setup đến hết round 4
        LongWaitingTime

        SendEvent "1"
        currentHoyKey1 := 0
        currentHotKey2 := 0
        currentHotKey3 := 0

        if (round == 2) { ;nếu đang round 2 thì chỉnh số lượng hiện có của các đồ cho round 2
            currentNumforHotkey1 := NumforHotkey1round2
            currentNumforHotkey2 := NumforHotkey2round2
            currentNumforHotkey3 := NumforHotkey3round2
            if (rechargeWait == false) { ;nếu không phải lần recharge thì bấm ready
                ReadyUp
            }else {
                recharging := true
                rechargeWait := false
                ; MsgBox ('tat recharge wait')
            }
        }
        if (round == 3) {
            currentNumforHotkey1 := NumforHotkey1round3
            currentNumforHotkey2 := NumforHotkey2round3
            currentNumforHotkey3 := NumforHotkey3round3
            ReadyUp
        }
        if (round == 4) {
            currentNumforHotkey1 := NumforHotkey1round4
            currentNumforHotkey2 := NumforHotkey2round4
            currentNumforHotkey3 := NumforHotkey3round4
            ReadyUp
            recharging := false
            rechargeWait := true
        }

        While (currentHoyKey1 < currentNumforHotkey1){ ;khi mà số đồ hiện có của hotkey1 bé hơn hoặc bằng số lượng đặt được trong round đấy
            currentHoyKey1++ ;cộng 1 đồ đã được đặt
            if (!x13able){
                MoveBackward
                currentX := x10
                currentY := y10
                x13able := true
            }
            SendEvent "1"
            ShortWaitingTime
            SendEvent HotKey1 ; chỉnh sang đồ thứ 1
            MouseMove currentX, currentY ;chỉnh chuột đến vị trí có thể đặt đồ
            NormalWaitingTime
            SetTimer(CloseMsgBox, 500) 
            MsgBox("Đang đặt ... " currentHoyKey1 " cho " HotKey1, "Thông báo")
            SendEvent "{Lbutton}" ;đặt đồ
            NormalWaitingTime
            NormalWaitingTime
            if (currentX == x10){ ;nếu đang đặt cho vị trí 1 thì chuyển sang vị trí 2
                currentX := x11
                currentY := y11
            }else if (currentX == x11){ ;nếu đang đặt cho vị trí 2 thì chuyển sang vị trí 3
                currentX := x12
                currentY := y12
            }else if (currentX == x12){ ;nếu đang đặt cho vị trí 3 thì chuyển sang vị trí 4
                currentX := x13
                currentY := y13
            }else if currentX == x13 and (currentHotKey2 < currentNumforHotkey2 || currentHoyKey1 < currentNumforHotkey1 || currentHotKey3 < currentNumforHotkey3){
                MoveBackward
                currentX := x10
                currentY := y10
            }else if (currentX == x13 and round <4){ ;khi còn round sau mà đã đặt đồ vào vị trí thứ 4
                x13able := false
            }  
        }
        While (currentHotKey2 < currentNumforHotkey2){ ;khi mà số đồ hiện có của hotkey2 bé hơn hoặc bằng số lượng đặt được trong round đấy
            currentHotKey2++ ;cộng 1 đồ đã được đặt
            if (!x13able){
                MoveBackward
                currentX := x10
                currentY := y10
                x13able := true
            }
            SendEvent "1"
            ShortWaitingTime
            SendEvent HotKey2 ; chỉnh sang đồ thứ 2
            MouseMove currentX, currentY ;chỉnh chuột đến vị trí có thể đặt đồ
            NormalWaitingTime
            SetTimer(CloseMsgBox, 500) 
            MsgBox("Đang đặt ... " currentHotKey2 "cho " HotKey2, "Thông báo")
            SendEvent "{Lbutton}" ;đặt đồ
            NormalWaitingTime
            NormalWaitingTime
            if (currentX == x10){ ;nếu đang đặt cho vị trí 1 thì chuyển sang vị trí 2
                currentX := x11
                currentY := y11
            }else if (currentX == x11){ ;nếu đang đặt cho vị trí 2 thì chuyển sang vị trí 3
                currentX := x12
                currentY := y12
            }else if (currentX == x12){ ;nếu đang đặt cho vị trí 3 thì chuyển sang vị trí 4
                currentX := x13
                currentY := y13
            }else if currentX == x13 and (currentHotKey2 < currentNumforHotkey2 || currentHotKey3 < currentNumforHotkey3){
                MoveBackward
                currentX := x10
                currentY := y10
            }else if (currentX == x13 and round <4){ ;khi còn round sau mà đã đặt đồ vào vị trí thứ 4
                x13able := false
            }  
        }
        While (currentHotKey3 < currentNumforHotkey3){ ;khi mà số đồ hiện có của hotkey2 bé hơn hoặc bằng số lượng đặt được trong round đấy
            currentHotKey3++ ;cộng 1 đồ đã được đặt
            if (!x13able){
                MoveBackward
                currentX := x10
                currentY := y10
                x13able := true
            }
            SendEvent "1"
            ShortWaitingTime
            SendEvent HotKey3 ; chỉnh sang đồ thứ 2
            MouseMove currentX, currentY ;chỉnh chuột đến vị trí có thể đặt đồ
            NormalWaitingTime
            SetTimer(CloseMsgBox, 500) 
            MsgBox("Đang đặt ... " currentHotKey3 "cho " HotKey3, "Thông báo")
            SendEvent "{Lbutton}" ;đặt đồ
            NormalWaitingTime
            NormalWaitingTime
            if (currentX == x10){ ;nếu đang đặt cho vị trí 1 thì chuyển sang vị trí 2
                currentX := x11
                currentY := y11
            }else if (currentX == x11){ ;nếu đang đặt cho vị trí 2 thì chuyển sang vị trí 3
                currentX := x12
                currentY := y12
            }else if (currentX == x12){ ;nếu đang đặt cho vị trí 3 thì chuyển sang vị trí 4
                currentX := x13
                currentY := y13
            }else if (currentX == x13 and currentHotKey3 < currentNumforHotkey3){
                MoveBackward
                currentX := x10
                currentY := y10
            }else if (currentX == x13 and round <4){ ;khi còn round sau mà đã đặt đồ vào vị trí thứ 4
                x13able := false
            }   
        }
        round++
    }
}




MoveBackward(){
    global backwardtime
    backwardtime++
    global cDis
    cDis--
    SendEvent("{s down}")
    NormalWaitingTime
    ShortWaitingTime
    ShortWaitingTime
    SendEvent("{s up}")
}

MoveForward(){
    global cDis
    cDis++
    SendEvent("{w down}")
    NormalWaitingTime
    ShortWaitingTime
    ShortWaitingTime
    SendEvent("{w up}")
}
SpecialGear1Setup(){
        ; ĐẶT FLAME TURRET
        global firsttimesetup
        if (NumforHotkey4 >0 and HotKey4 != 0){
            global NumforHotkey4
            global HotKey4
            SendEvent("{d down}") 
            CenterTime
            ShortWaitingTime  
            SendEvent("{d up}")
            currentHoyKey4 := 0
            currentX := x10
            currentY := y10
            
            While (currentHoyKey4 < NumforHotkey4){ ;khi mà số đồ hiện có của hotkey4 bé hơn hoặc bằng số lượng đặt được trong round đấy
                currentHoyKey4++ ;cộng 1 đồ đã được đặt
                SendEvent "1"
                ShortWaitingTime
                SendEvent HotKey4 ; chỉnh sang đồ thứ 4
                MouseMove currentX, currentY ;chỉnh chuột đến vị trí có thể đặt đồ
                NormalWaitingTime
                SetTimer(CloseMsgBox, 500) 
                MsgBox("Đang đặt ... " currentHoyKey4 " cho " HotKey4, "Thông báo")
                if (firsttimesetup){
                    SendEvent "{Lbutton}" ;đặt đồ
                    NormalWaitingTime
                    NormalWaitingTime
                    SendEvent "b"
                    firsttimesetup := false
                }else{
                    SendEvent "{Lbutton}" ;đặt đồ
                    ShortWaitingTime
                    ShortWaitingTime
                    SendEvent "{Lbutton}"
                }
                if (currentX == x10){ ;nếu đang đặt cho vị trí 1 thì chuyển sang vị trí 2
                    currentX := x11
                    currentY := y11
                }else if (currentX == x11){ ;nếu đang đặt cho vị trí 2 thì chuyển sang vị trí 3
                    currentX := x12
                    currentY := y12
                }else if (currentX == x12){ ;nếu đang đặt cho vị trí 3 thì chuyển sang vị trí 4
                    currentX := x13
                    currentY := y13
                }else if (currentX == x13){
                    MoveBackward
                    currentX := x10
                    currentY := y10
                }
            }

            SendEvent("{a down}") 
            CenterTime
            ShortWaitingTime  
            SendEvent("{a up}")
            ShortWaitingTime
        }
}

globalStopFlag := false
globalAutoReady := false
globalDeath := 0


main(){
    global globalStopFlag := false
    global globalAutoReady
    global Hotkey4
    global NumforHotkey4
    global loopCount := userInput
    global loopCurrent := 0
    global roundcount := 0
    global SpecialGear1SetupDone
    global getroundsSurvivedvalue := 0
    
    GUIingame()
    runRoblox
    if (GetKeyState("PgUp", "P")) {
        globalStopFlag := true
        ErrorMissTime
    }

    ;hover to most recent game location
    count := 0
    While (!globalStopFlag) {
        if (GetKeyState("PgUp", "P")) {
            globalStopFlag := true
            ErrorMissTime
            break
        }
        MouseMove x1, y1 
        MouseGetPos &xpos, &ypos 
        color := PixelGetColor(xpos, ypos)
        count++
        ShortWaitingTime
        if (count > 100)
            ErrorMissTime ;error report after 100 tries
        if (color == c1) 
        {
            SetTimer(CloseMsgBox, 500) 
            MsgBox("mẹ cha mấy thằng súc vật roblox dùng human checker", "Macro by Vezyl")
            Click 
            break
        }
    }

    ;generate loop number according to user data
    
    Loop loopCount { ;macro loop execution
        loopCurrent := A_Index
        if (GetKeyState("PgUp", "P")) {
            globalStopFlag := true
            ErrorMissTime
            break
        }
        if (NumforHotkey4 >0 and HotKey4 != 0){
            SpecialGear1SetupDone := false
        }else SpecialGear1SetupDone := true
        global globalDeath := 0
        global globalAutoReady := false

        ;0x00B06F
        ; bấm vào game
        count := 0
        global roundcount := 0
        While (!globalStopFlag) { ;confirm and click to join game
            if (GetKeyState("PgUp", "P")) {
                globalStopFlag := true
                break
            }
            MouseMove xct, yct
            NormalWaitingTime
            MouseMove x2, y2
            MouseGetPos &xpos, &ypos 
            color := PixelGetColor(xpos, ypos)
            count++
            ShortWaitingTime
            if (count > 300) 
                ErrorMissTime
            if (color == c2) {
                SetTimer(CloseMsgBox, 500) 
                MsgBox("bấm play", "Thông báo")
                Click 
                break
            }
        }


        ;0x2C2826
        ; địt mẹ mày vào private
        count := 0
        While (!globalStopFlag) { ;confirm and click on private game tab
            if (GetKeyState("PgUp", "P")) {
                globalStopFlag := true
                break
            }
            MouseMove x3, y3
            MouseGetPos &xpos, &ypos 
            color := PixelGetColor(xpos, ypos)
            count++
            ShortWaitingTime
            if (count > 10000)
                ErrorMissTime  ;
            if (color == c3) 
            {
                SetTimer(CloseMsgBox, 500) 
                MsgBox("Đang chọn vào private game", "Thông báo")
                Click 
                break
            }
        }


        ; vào career
        count := 0
        While (!globalStopFlag) { ;confirm and click on career mode tab
            if (GetKeyState("PgUp", "P")) {
                globalStopFlag := true
                break
            } 
            MouseMove x4, y4
            MouseGetPos &xpos, &ypos 
            color := PixelGetColor(xpos, ypos)
            count++
            ShortWaitingTime
            if (count > 100)
                ErrorMissTime  ;
            if (color == c4) 
            {
                SetTimer(CloseMsgBox, 500) 
                MsgBox("VÀO CAREER", "Thông báo")
                Click 
                break
            }}
        ; sleep 5000


        ; bấm VÀO tạo private game
        count := 0
        While (!globalStopFlag) { ;confirm and click create private game
            if (GetKeyState("PgUp", "P")) {
                globalStopFlag := true
                break
            } 
            MouseMove x5, y5
            MouseGetPos &xpos, &ypos 
            color := PixelGetColor(xpos, ypos)
            count++
            ShortWaitingTime
            if (count > 100)
                ErrorMissTime  ;
            if (color == c5) 
            {
                SetTimer(CloseMsgBox, 500) 
                MsgBox("tạo private", "Thông báo")
                Click 
                break
            }
        }


        ; bấm vào nút play
        count := 0
        While (!globalStopFlag) { ;comfirm and click play
            if (GetKeyState("PgUp", "P")) {
                globalStopFlag := true
                break
            } ;comfirm and click play
            MouseMove x6, y6
            MouseGetPos &xpos, &ypos 
            color := PixelGetColor(xpos, ypos)
            count++
            NormalWaitingTime
            if (count > 500)
                ErrorMissTime  ;
            if (color == c6) 
            {
                SetTimer(CloseMsgBox, 500) 
                MsgBox("bấm bắt đầu trận", "Thông báo")
                Click 
                break
            }
        }

        ReadyUp


        ; bấm đổi góc nhìn
        count := 0
        While (!globalStopFlag) { ;comfirm and click change character perspective
            if (GetKeyState("PgUp", "P")) {
                globalStopFlag := true
                break
            }
            MouseMove x8, y8
            MouseGetPos &xpos, &ypos 
            color := PixelGetColor(xpos, ypos)
            count++
            NormalWaitingTime
            if (count > 100)
                ErrorMissTime  ;
            if (color == c8) 
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

        
        ; khóa vị trí
        count := 0
        While (!globalStopFlag) { ;move character out of shop
            if (GetKeyState("PgUp", "P")) {
                globalStopFlag := true
                break
            } 
            MouseMove x9, y9
            MouseGetPos &xpos, &ypos 
            color := PixelGetColor(xpos, ypos)
            count++
            sleep 250
            if (count > 600)
                ErrorMissTime  ;
            if (color == c9) 
            {
                SendEvent("{w down}") 
                AvgLongWaitingTime 
                SendEvent("{w up}")
                SendEvent("{d down}")
                AvgLongWaitingTime     
                SendEvent("{d up}")
                SendEvent("{a down}")
                DoorTime     
                SendEvent("{a up}")
                ShortWaitingTime
                SendEvent "F"
                break
            }
        }


        SendEvent("{d down}") 
        CenterTime  
        SendEvent("{d up}")
        SendEvent("{w down}")
        PlacementWalkTime    
        SendEvent("{w up}")
        ShortWaitingTime

        SpecialGear1Setup



        global rechargeWait :=false
        GearSetup
        global rechargeWait := true
        global globalAutoReady := true
        ReadyUp


        if (globalDeath >0){
            SendEvent "{Esc}"
            sleep 1000
            SendEvent "L"
            sleep 1000
            SendEvent "{Enter}"
            sleep 1000
            loopCurrent++
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


;Main Graphical User Interface
global Totalhotkey1
global Totalhotkey2
global Totalhotkey3
global Totalhotkey4
global Totalhotkey5 


mainGUI := Gui()
; mainGUI.Opt("+AlwaysOnTop")
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
startButton.OnEvent("Click", onButtonClick)
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
isContinuePressed := false
global roundcount

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
    global totalMinutes := userInput * 54
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


onButtonClick(*) {
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

    if (userInput == '') {
    MsgBox('Mày đang đéo nhập gì cả', "Macro by Vezyl")
    }else if !RegExMatch(userInput, "^\d+$") {
        MsgBox('Mày cần nhập vào đúng định dạng 1 số', "Macro by Vezyl")
        isButtonClicked := false  ; Đặt lại nếu không phải là số
        return
    }else {
        if (HotKey1 == "") 
            HotKey1 := 0
        if (NumforHotkey1round2 == "") 
            NumforHotkey1round2 := 0
        if (NumforHotkey1round3 == "") 
            NumforHotkey1round3 := 0
        if (NumforHotkey1round4 == "") 
            NumforHotkey1round4 := 0
        if (HotKey2 == "") 
            HotKey2 := 0
        if (NumforHotkey2round2 == "") 
            NumforHotkey2round2 := 0
        if (NumforHotkey2round3 == "") 
            NumforHotkey2round3 := 0
        if (NumforHotkey2round4 == "") 
            NumforHotkey2round4 := 0
        if (HotKey3 == "") 
            HotKey3 := 0
        if (NumforHotkey3round2 == "") 
            NumforHotkey3round2 := 0
        if (NumforHotkey3round3 == "") 
            NumforHotkey3round3 := 0
        if (NumforHotkey3round4 == "") 
            NumforHotkey3round4 := 0
        
        global totalMinutes := userInput * 54
        hours := totalMinutes // 60
        minutes := Mod(totalMinutes, 60)
        result := " " hours "h" minutes "m"
        confirm := MsgBox("Run the program with the number of loops is " userInput "`nEstimated time :" result, "Macro by Vezyl - Press Pgup Key to force Stop", 4)  ; 4 là flag cho Yes/No
        if (confirm == 'No') {
            ExitApp  ; Nếu người dùng chọn "No", kết thúc
            isContinuePressed := false
        }
        isContinuePressed := true
        mainGUI.Hide()
        main()
    }
}

mainGUI.Show ("w623 h514")
if (!isContinuePressed) {
    return
}





global gameGUI
GUIingame() {
    
    gameGUI := Constructor()
    gameGUI.Move(xPos, yPos, gameGUIWidth, gameGUIHeight)
	
}

Constructor(){
    global totalMinutes
    global changeText := false
    global SpecialGear1SetupDone
    global cDis
    gameGUI := Gui()
    global roundcount
    gameGUI.Opt("+AlwaysOnTop -Caption")
	gameGUI.SetFont("s14", "Segoe UI")
	gameGUI.SetFont("s16", "Segoe UI")
	gameGUI.Add("Text", "x-1 y8 w407 h42 +0x200 +Center", "MACRO THE FINAL STAND 2")
	gameGUI.SetFont("s14", "Segoe UI")
	loopEdit := gameGUI.Add("Text", "x8 y96 w96 h26 +0x200 -Background", "Loop" loopCurrent "/" userInput)

	roundsSurvived := gameGUI.Add("Text", "x8 y64 w254 h23 +0x200", "Rounds survived last time: " getroundsSurvivedvalue)
	gameGUI.Add("Text", "x-8 y56 w493 h1 +0x10")
	roundEdit := gameGUI.Add("Text", "x104 y96 w176 h26 +0x200", "Current Round: " roundcount)
	timeEdit := gameGUI.Add("Text", "x288 y96 w106 h26 +0x200", "Time")
    Progressvar :=  0 ;loopCurrent / userInput *100
	gameProgress := gameGUI.Add("Progress", "x0 y128 w407 h20 -Smooth", Progressvar)
	gameGUI.OnEvent('Close', (*) => ExitApp())
	gameGUI.Title := "Press Pgup Key to cancel"
    global StartTime := A_TickCount

    ; Sử dụng SetTimer để cập nhật GUI mỗi 1000 ms (1 giây)
    SetTimer(UpdateTimer, 2000)

    ; Hàm cập nhật thời gian trong GUI
    UpdateTimer() {
        global StartTime, Gui
        global changeText
        ElapsedTime := Round((A_TickCount - StartTime) / 1000) ; Tính thời gian đã trôi qua bằng giây
        totalTime := totalMinutes *60
        mins := ElapsedTime //60
        hours := mins //60
        seconds := Mod(ElapsedTime, 60)
        
        if (!changeText){
            timeEdit.Text := hours "h " mins "m " seconds "s"
            changeText := true
        }else {
            timeEdit.Text := "Dis: " cDis
            changeText := false
    }
        roundEdit.Text := "Current Round: " roundcount
        loopEdit.Text := "Loop" loopCurrent "/" userInput
        Progressvar := ElapsedTime / totalTime * 100
        gameProgress.Value := Progressvar
        roundsSurvived.Text := "Rounds survived last time: " getroundsSurvivedvalue
    }
    
    
    
    
    gameGUI.Show
    return gameGUI
}