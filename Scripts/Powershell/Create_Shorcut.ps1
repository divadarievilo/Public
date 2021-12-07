#
# Fix Teams TaskBar Icon UserShorcut
# 

$users = Get-ChildItem -Path "C:\users\"
$WScriptShell = New-Object -ComObject WScript.Shell

foreach ($user in $users) {

$targetfile = "C:\Users\$user\AppData\Local\Microsoft\Teams\Update.exe"
$StartIn = "C:\Users\$user\AppData\Local\Microsoft\Teams"
$Argumentos = " --processStart "
$Argumentos = $argumentos + """Teams.exe"""
$IconFile = "C:\Users\$user\AppData\Local\Microsoft\Teams\Update.exe"

$ShortcutFile = "C:\Users\$user\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Microsoft Teams.lnk"
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Arguments = $Argumentos
$Shortcut.WorkingDirectory = $StartIn
$Shortcut.IconLocation = $IconFile
$Shortcut.Save()


# Shorcut 2 - ProgramData


$targetfile = "C:\Users\$user\AppData\Local\Microsoft\Teams\Update.exe"
$StartIn = "C:\Users\$user\AppData\Local\Microsoft\Teams"
$Argumentos = " --processStart "
$Argumentos = $argumentos + """Teams.exe"""
$IconFile = "C:\Users\$user\AppData\Local\Microsoft\Teams\Update.exe"

$ShortcutFile = "c:\ProgramData\EDP\ImportStartLayout\Microsoft Teams.lnk"
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Arguments = $Argumentos
$Shortcut.WorkingDirectory = $StartIn
$Shortcut.IconLocation = $IconFile
$Shortcut.Save()

}


New-item -Path "C:\ProgramData" -Name "Teams.txt" -ItemType File -Value "Shortcut Changed" -Confirm:$false -Force
