;Macro The final stand 2 Roblox
; sửa lại các vị trí x, y và màu pixel
; thay đổi đường dẫn roblox và file source





#Requires AutoHotkey v2.0
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
global x10 := 964 ;864
global y10 := 690 ;690
global x11 := 1021 ;849
global y11 := 671 ;821
global x12 := 1101 ;1201
global y12 := 819 ;819
global x13 := 949 ; 1081
global y13:= 821 ;671

runRoblox(){ ;run Roblox as Administrator
    Run ("*RunAs " "C:\Users\pc\Desktop\Roblox-Player.lnk")
    LongWaitingTime
    WinActivate('Roblox')
    NormalWaitingTime
}

if !A_IsAdmin{ ; run as Administrator
    Run( "*RunAs " "C:\Program Files\AutoHotkey\v2\AutoHotkey.exe" " " "G:\AutoHotkey-Data\test3.ahk")
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
    global globalStopFlag

    totalSleepDuration := 41540
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
global rechargeWait
ReadyUp(){ ;wait for the ready button and press (function has a waiting time of about 1 round)
    global rechargeWait
    global globalStopFlag 
    global globalDeath
    global globalAutoReady
    global roundcount
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
        if (globalDeath >2)
            break
        if (color == c7) 
        {
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
            SetTimer(CloseMsgBox, 1000) 
            MsgBox("so lan chet" globalDeath)
            LongWaitingTime
            LongWaitingTime
        }
        if (roundcount == 14 and rechargeWait == true){
            MoveBackward
            GearSetup
            rechargeWait := false
        }
    }
}

global recharging := false
GearSetup(){
    global recharging
    global rechargeWait
    round := 2
    currentHoyKey1 := 0
    currentHotKey2 := 0
    currentHotKey3 := 0
    currentX := x10
    currentY := y10
    While (round <5){ ;setup đến hết round 4
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
        }

        While (currentHoyKey1 < currentNumforHotkey1){ ;khi mà số đồ hiện có của hotkey1 bé hơn hoặc bằng số lượng đặt được trong round đấy
            currentHoyKey1++ ;cộng 1 đồ đã được đặt
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
            }
        }
        While (currentHotKey2 < currentNumforHotkey2){ ;khi mà số đồ hiện có của hotkey2 bé hơn hoặc bằng số lượng đặt được trong round đấy
            currentHotKey2++ ;cộng 1 đồ đã được đặt
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
            }
        }
        While (currentHotKey3 < currentNumforHotkey3){ ;khi mà số đồ hiện có của hotkey2 bé hơn hoặc bằng số lượng đặt được trong round đấy
            currentHotKey3++ ;cộng 1 đồ đã được đặt
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
            }
        }
        round++
    }
}




MoveBackward(){
    SendEvent("{s down}")
    NormalWaitingTime
    ShortWaitingTime
    ShortWaitingTime
    SendEvent("{s up}")
}

globalStopFlag := false
globalAutoReady := false
globalDeath := 0


main(){
    global globalStopFlag := false
    global globalAutoReady
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
    loopCount := userInput
    loopCurrent := 0
    Loop loopCount { ;macro loop execution
        if (GetKeyState("PgUp", "P")) {
            globalStopFlag := true
            ErrorMissTime
            break
        }
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
            if (count > 100)
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


        ; SendEvent "2"
        ; SetTimer(CloseMsgBox, 300) 
        ; MsgBox("Đang đặt 1...", "Thông báo")
        ; MouseMove x10, y10
        ; NormalWaitingTime
        ; SendEvent "{Lbutton}"
        ; NormalWaitingTime


        ; SendEvent "3"
        ; SetTimer(CloseMsgBox, 300) 
        ; MsgBox("Đang đặt 2...", "Thông báo")
        ; MouseMove x11, y11
        ; NormalWaitingTime
        ; SendEvent "{Lbutton}"
        ; NormalWaitingTime

        ; ; đặt xong thì bấm ready
        ; ReadyUp
        

        ; ;chờ đến round thứ 3
        ; LongWaitingTime
        ; ReadyUp

        ; SendEvent "3"
        ; SendEvent "3"
        ; SetTimer(CloseMsgBox, 300) 
        ; MsgBox("Đang đặt 3...", "Thông báo")
        ; MouseMove x12, y12
        ; NormalWaitingTime
        ; SendEvent "{Lbutton}"
        ; NormalWaitingTime

        ; ;chờ đến round thứ 4
        ; LongWaitingTime
        ; ReadyUp

        ; SendEvent "3"
        ; SendEvent "3"
        ; SetTimer(CloseMsgBox, 300) 
        ; MsgBox("Đang đặt 4...", "Thông báo")
        ; MouseMove x13, y13
        ; NormalWaitingTime
        ; SendEvent "{Lbutton}"
        ; NormalWaitingTime
        global rechargeWait :=false
        GearSetup
        global rechargeWait := true
        global globalAutoReady := true
        ReadyUp

        ; SendEvent("{s down}")
        ; Sleep(32540)      
        ; SendEvent("{s up}")

        if (globalDeath >2){
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
mainGUI := Gui(, 'Home')
mainGUI.Show('w450 h350')
mainGUI.SetFont('s12','Segoe UI')
mainGUI.Add("Text", "", "Enter the number of loops you want").Move(10, 10)
textInput := mainGUI.Add('Edit', 'w400 h50' ,'')

mainGUI.Add("Text", "", "Hotkey").Move(10, 90)    ; Dòng chữ cho cột 1
mainGUI.Add("Text", "", "Round 2").Move(110, 90)   ; Dòng chữ cho cột 2
mainGUI.Add("Text", "", "Round 3").Move(210, 90)   ; Dòng chữ cho cột 3
mainGUI.Add("Text", "", "Round 4").Move(310, 90)   ; Dòng chữ cho cột 4

input1 := mainGUI.Add("Edit", "w90 h50", "")
input2 := mainGUI.Add("Edit", "w90 h50", "")
input3 := mainGUI.Add("Edit", "w90 h50", "")
input4 := mainGUI.Add("Edit", "w90 h50", "")
input5 := mainGUI.Add("Edit", "w90 h50", "")
input6 := mainGUI.Add("Edit", "w90 h50", "")
input7 := mainGUI.Add("Edit", "w90 h50", "")
input8 := mainGUI.Add("Edit", "w90 h50", "")
input9 := mainGUI.Add("Edit", "w90 h50", "")
input10 := mainGUI.Add("Edit", "w90 h50", "")
input11 := mainGUI.Add("Edit", "w90 h50", "")
input12 := mainGUI.Add("Edit", "w90 h50", "")

input1.Move(10, 120) 
input2.Move(110, 120) 
input3.Move(210, 120) 
input4.Move(310, 120) 
input5.Move(10, 180)  
input6.Move(110, 180) 
input7.Move(210, 180) 
input8.Move(310, 180) 
input9.Move(10, 240) 
input10.Move(110, 240) 
input11.Move(210, 240)
input12.Move(310, 240)

startButton := mainGUI.AddButton('w200 h30', 'Run (powered by Vezyl)')
startButton.Move(125, 300) ; Đặt nút ở giữa
startButton.OnEvent('Click', onButtonClick)
isContinuePressed := false
global roundcount
onButtonClick(*) {
    global isContinuePressed  ; Sử dụng biến toàn cục
    global userInput := textInput.Value
    global HotKey1, NumforHotkey1round2, NumforHotkey1round3, NumforHotkey1round4
    global HotKey2, NumforHotkey2round2, NumforHotkey2round3, NumforHotkey2round4
    global HotKey3, NumforHotkey3round2, NumforHotkey3round3, NumforHotkey3round4
    HotKey1 := input1.Value
    NumforHotkey1round2 := input2.Value
    NumforHotkey1round3 := input3.Value
    NumforHotkey1round4 := input4.Value
    HotKey2 := input5.Value
    NumforHotkey2round2 := input6.Value
    NumforHotkey2round3 := input7.Value
    NumforHotkey2round4 := input8.Value
    HotKey3 := input9.Value
    NumforHotkey3round2 := input10.Value
    NumforHotkey3round3 := input11.Value
    NumforHotkey3round4 := input12.Value

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
        
        totalMinutes := userInput * 33
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

if (!isContinuePressed) {
    return
}