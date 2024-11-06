#Requires AutoHotkey v2.0
SendMode "InputthenPlay"

; Tạo GUI với một bố cục khác
MyGui := Gui(, "My Custom GUI") ; Tên GUI
MyGui.SetFont("s10", "Verdana") ; Đặt font khác và cỡ chữ nhỏ hơn
MyGui.Show("w400 h150 Center")


; Tạo các điều khiển với lệnh và cấu trúc khác
userInput := MyGui.AddEdit("w350", "") ; Tạo một vùng nhập với chiều rộng 350
MyText := MyGui.AddText("w350 Center", "Nhập vào để thay đổi nội dung" ) ; Văn bản căn giữa
userInput2 := MyGui.AddEdit("w350", "") ; Tạo một vùng nhập với chiều rộng 350
; Phát hiện nhấn phím Enter
userInput.OnEvent('Change', TimeEdit)

; Hiển thị GUI
 ; Hiển thị và căn giữa cửa sổ

TimeEdit(*) {
    if (userInput == '') {
    MyText.text := "Error"
    }else if !RegExMatch(userInput.Text, "^\d+$") {
    MyText.Text := "Error"
    }else {
    totalMinutes := userInput.Text * 45
    hours := totalMinutes // 60
    minutes := Mod(totalMinutes, 60)
    result := " " hours "h" minutes "m"
    MyText.Text := ("Estimated time :" result)
    }
}