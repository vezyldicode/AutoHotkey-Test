#Requires AutoHotkey v2.0
SendMode "InputThenPlay"
; Tạo GUI
mainGUI := Gui(, 'Home')
mainGUI.SetFont("s10", "Segoe UI")

; Thêm vùng nhập số
InputBox := mainGUI.Add("Edit", "vInputBox Number", "")
InputBox.SetEvent("Change", OnInputChange)

; Thêm một Text để hiển thị nội dung
DisplayText := mainGUI.Add("Text", , "Dữ liệu nhập vào sẽ xuất hiện ở đây...")

; Hiển thị GUI
mainGUI.Show()

; Hàm xử lý sự kiện khi nội dung của vùng nhập thay đổi
OnInputChange(ctrl, info) {
    ; Lấy dữ liệu từ InputBox
    data := mainGUI.InputBox.Value
    ; Hiển thị dữ liệu ở dòng Text
    mainGUI.DisplayText.Text := data
}
MsgBox('Mày đang đéo nhập gì cả', "Macro by Vezyl")
; Chạy chương trình
return