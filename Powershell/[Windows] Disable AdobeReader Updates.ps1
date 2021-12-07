# *******************************************
#
# Mod by: David
# Mod on: 2021.10.27
# Mod y?: Disable Adobe Reader AutoUpdates
#
# *******************************************

# Log method
# if (! (test-path function:Log)) { function Log { Param([string]$message) Write-Host $message; } }


# Stop Adobe Reader Update Services
if (Get-Service AdobeARMService) {
    Write-Host "Stopping Adobe Reader Update Service(s)..." -BackgroundColor Black -ForegroundColor Gray
    Stop-Service AdobeARMService  | Out-Null
    Write-Host "Adobe Reader Update Services(s) stopped successfully." -BackgroundColor Black -ForegroundColor Green
    # Disable Adobe Reader Update Services
    Write-Host "Disabling Adobe Reader Update Service(s)..." -BackgroundColor Black -ForegroundColor Gray
    Get-Service -name AdobeARMService | Set-Service -StartupType Disabled
    Write-Host "Adobe Reader Update Services(s) disabled successfully." -BackgroundColor Black -ForegroundColor Green
}