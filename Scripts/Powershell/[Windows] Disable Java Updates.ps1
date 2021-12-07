# *******************************************
#
# Mod by: David
# Mod on: 2021.10.20
# Mod y?: Disable Java AutoUpdates
#
# *******************************************

# Log method
# if (! (test-path function:Log)) { function Log { Param([string]$message) Write-Host $message; } }


# Variables and Constants
$Value_0 = 0   # disable
#$Value_1 = 1  # enable

$JavaRegPath = "HKLM:\SOFTWARE\JavaSoft\Java Update"
$JavaRegPath_x64 = "HKLM:\SOFTWARE\WOW6432Node\JavaSoft\Java Update"

$JavaUpdateRegPath_x86 = "HKLM:\SOFTWARE\JavaSoft\Java Update\Policy"
$JavaUpdateRegPath_x64 = "HKLM:\SOFTWARE\WOW6432Node\JavaSoft\Java Update\Policy"

$key = "EnableJavaUpdate"


# RegKeys to disable message
Write-Host "Disabling Java AutoUpdates..." -BackgroundColor Black -ForegroundColor Gray


# Create Folder structures if not exist
# x86 folders
if (! (Test-Path "HKLM:\SOFTWARE\JavaSoft" )) {New-Item -Path "HKLM:\SOFTWARE" -name "JavaSoft" -value $Value_0 -Force  |  Out-Null}
#if (! (Test-Path $JavaRegPath )) {New-Item -Path $JavaRegPath -name "Java Update" -value $Value_0 -Force  |  Out-Null}
if (! (Test-Path "$JavaRegPath\Policy" )) {New-Item -Path $JavaRegPath -name "Policy" -value $Value_0 -Force  |  Out-Null}
# x64 folders
if (! (Test-Path "HKLM:\SOFTWARE\WOW6432Node\JavaSoft" )) {New-Item -Path "HKLM:\SOFTWARE\WOW6432Node" -name "JavaSoft" -value $Value_0 -Force  |  Out-Null}
if (! (Test-Path $JavaRegPath_x64 )) {New-Item -Path $JavaRegPath_x64 -name "Java Update" -value $Value_0 -Force  |  Out-Null}
if (! (Test-Path "$JavaRegPath_x64\Policy" )) {New-Item -Path $JavaRegPath_x64 -name "Policy" -value $Value_0 -Force  |  Out-Null}


# x86 keys
New-ItemProperty -Path $JavaUpdateRegPath_x86 -type dword -name $key -value $Value_0 -Force | Out-Null
# x64
New-ItemProperty -Path $JavaUpdateRegPath_x64 -type dword -name $key -value $Value_0 -Force | Out-Null

# RegKeys disabled message
Write-Host "Java AutoUpdates disabled successfully." -BackgroundColor Black -ForegroundColor Green
