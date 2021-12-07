# Example:	McAfee Endpoint Security Platform
$UnInstall_Endpoint = "{B16DE18D-4D5D-45F8-92BD-8DC17225AFD8}"
Start-Process msiexec.exe -ArgumentList " /x $UnInstall_Endpoint /quiet /norestart" -NoNewWindow -Wait