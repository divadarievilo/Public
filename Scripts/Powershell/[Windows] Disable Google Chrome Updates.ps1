# *******************************************
#
# Mod by: David
# Mod on: 2021.10.20
# Mod y?: Disable Google Chrome AutoUpdates
# Original Source Script: https://gist.github.com/absynce/7667bd32e632e72f406f 
#
# *******************************************

# Log method
# if (! (test-path function:Log)) { function Log { Param([string]$message) Write-Host $message; } }


# Variables and Constants
$Value_0 = 0
$Value_1 = 1
$GoogleRegPath = "HKLM:\SOFTWARE\Policies\Google"
$GoogleUpdateRegPath = "HKLM:\SOFTWARE\Policies\Google\Update"
$GoogleUpdateRegPath_x64 = "HKLM:\SOFTWARE\WOW6432Node\Policies\Google\Update"

# RegKeys to disable message
Write-Host "Disabling Google Chrome AutoUpdates..." -BackgroundColor Black -ForegroundColor Gray

# Create Folder structure if not exist
if (! (Test-Path $GoogleRegPath )) {New-Item -Path $GoogleRegPath -name Update -value $Value_0 -Force  |  Out-Null}
if (! (Test-Path $GoogleUpdateRegPath )) {New-Item -Path $GoogleRegPath -name Update -value $Value_0 -Force | Out-Null  }
if (! (Test-Path $GoogleUpdateRegPath_x64 )) {New-Item -Path $GoogleRegPath -name Update -value $Value_0 -Force | Out-Null  }

# x86
New-ItemProperty -Path $GoogleUpdateRegPath -type dword -name AutoUpdateCheckPeriodMinutes -value $Value_0 -Force | Out-Null
New-ItemProperty -Path $GoogleUpdateRegPath -type dword -name DisableAutoUpdateChecksCheckboxValue -value $Value_1 -Force | Out-Null
New-ItemProperty -Path $GoogleUpdateRegPath -type dword -name UpdateDefault -value $Value_0 -Force | Out-Null

# x64
New-ItemProperty -Path $GoogleUpdateRegPath_x64 -type dword -name AutoUpdateCheckPeriodMinutes -value $Value_0 -Force | Out-Null
New-ItemProperty -Path $GoogleUpdateRegPath_x64 -type dword -name DisableAutoUpdateChecksCheckboxValue -value $Value_1 -Force | Out-Null
New-ItemProperty -Path $GoogleUpdateRegPath_x64 -type dword -name UpdateDefault -value $Value_0 -Force | Out-Null

# RegKeys disabled message
Write-Host "Google Chrome AutoUpdates disabled successfully." -BackgroundColor Black -ForegroundColor Green


# Stop Google Update Services
if ((Get-Service gupdate) -or (Get-Service gupdatem)) {
    Write-Host "Stopping Google Update Service(s)..." -BackgroundColor Black -ForegroundColor Gray
    Stop-Service gupdate  | Out-Null
    Stop-Service gupdatem | Out-Null
    Write-Host "Google Update Services(s) stopped successfully." -BackgroundColor Black -ForegroundColor Green
    # Disable Google Update Services
    Write-Host "Disabling Google Update Service(s)..." -BackgroundColor Black -ForegroundColor Gray
    Get-Service -name gupdate | Set-Service -StartupType Disabled
    Get-Service -name gupdatem | Set-Service -StartupType Disabled
    Write-Host "Google Update Services(s) disabled successfully." -BackgroundColor Black -ForegroundColor Green
}

# Rename GoogleUpdate.exe

$old = "C:\Program Files (x86)\Google\Update\GoogleUpdate.exe"
$new = "GoogleUpdate.exe_disabled"
Rename-Item $old -NewName $new -Force
Write-Host "GoogleUpdate.exe renamed successfully." -BackgroundColor Black -ForegroundColor Green
