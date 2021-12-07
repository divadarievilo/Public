<#
# Mod by: David
# Mod on: 2021.11.04
# Mod st: Disable MS Edge AutoUpdates
#>


# Stop Edge Update Service
$proc = "MicrosoftEdgeUpdate.exe"
if (Get-Process -Name $proc -ErrorAction SilentlyContinue) { Get-Process -Name $proc | Stop-Service }

# Remove Edge Update Folder (and all contents)
Remove-Item -Path "C:\Program Files (x86)\Microsoft\EdgeUpdate\" -Recurse -Force -Confirm:$false

# Delete Reg Keys Structure
Remove-Item -Path "HKLM:\SYSTEM\ControlSet001\Services\edgeupdate\" -Recurse -Force -Confirm:$false
Remove-Item -Path "HKLM:\SYSTEM\ControlSet001\Services\edgeupdatem\" -Recurse  -Force -Confirm:$false

# Disable Scheduled Tasks
Disable-ScheduledTask -TaskName "MicrosoftEdgeUpdateTaskMachineCore"
Disable-ScheduledTask -TaskName "MicrosoftEdgeUpdateTaskMachineUA"

