#Requires AutoHotkey v2.0

; Biến toàn cục để kiểm soát việc thực thi
isButtonClicked := false

mainGUI := Gui(, 'Hello World')
mainGUI.SetFont('s12', 'Segoe UI')
textInput := mainGUI.Add('Edit', 'w400 h50', '')
startButton := mainGUI.AddButton('w100 h30', 'Bat dau')
mainGUI.Show('w450 h150')

startButton.OnEvent('Click', onButtonClick)

onButtonClick(*) {
    global isButtonClicked  ; Sử dụng biến toàn cục
    isButtonClicked := true  ; Đánh dấu rằng nút "Bắt đầu" đã được bấm

    userInput := textInput.Value

    if (userInput == '') {
        MsgBox('Vui long dien thong tin')
        return
    }

    ; Kiểm tra nếu người dùng nhập vào một số
    if !RegExMatch(userInput, "^\d+$") {
        MsgBox('Vui long nhap vao mot so')
        return
    }

    ; Hiện hộp thoại xác nhận
    confirm := MsgBox("Ban co chac muon tiep tuc?", "Xac nhan", 4)  ; 4 là flag cho Yes/No
    if (confirm == 'No') {
        isButtonClicked := false  ; Đặt lại nếu người dùng không muốn tiếp tục
        return  ; Nếu người dùng chọn "No", kết thúc
    }

    mainGUI.Hide()  ; Ẩn GUI sau khi người dùng xác nhận

    ; Hiện thông báo yêu cầu người dùng bấm "OK" để tiếp tục
    MsgBox("Vui long thuc hien thao tac va nhan OK de tiep tuc")

    ; Sau khi người dùng nhấn "OK", mở Notepad
    Run('notepad')

    if WinWait('Untitled - Notepad', , 3) {
        ; Chuyển sang cửa sổ Notepad
        WinActivate('Untitled - Notepad')
        ; Gửi nội dung người dùng đã nhập
        SendText(userInput)

        ; Đợi người dùng đóng Notepad trước khi thoát chương trình
        WinWaitClose('Untitled - Notepad')
        ExitApp
    }
}

; Các lệnh nằm ngoài onButtonClick sẽ không chạy nếu isButtonClicked == false
if (!isButtonClicked) {
    return  ; Kết thúc chương trình nếu nút "Bắt đầu" chưa được bấm
}

; Các lệnh khác nằm bên dưới sẽ chỉ chạy nếu nút "Bắt đầu" đã được bấm
; Ví dụ, thêm các hành động hoặc lệnh khác
MsgBox("Cac lenh khac da chay vi nut Bat Dau da duoc bam")
