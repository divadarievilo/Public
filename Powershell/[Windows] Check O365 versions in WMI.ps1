# Detection Method

$installed_version = Get-WmiObject -Class sms_installedsoftware -Namespace "root\cimv2\sms" | where {$_.Softwarecode -like "o365proplusretail*"} | select ProductVersion -ExpandProperty ProductVersion -Unique 
$o365_version = Get-WmiObject -Class office365proplusconfigurations | select VersionToReport -ExpandProperty VersionToReport -Unique 

if ($installed_version -ne $o365_version) {
return $false;
}
return $true


# Remediation

$installed_version = Get-WmiObject -Class sms_installedsoftware -Namespace "root\cimv2\sms" | where {$_.Softwarecode -like "o365proplusretail*"} | select ProductVersion -ExpandProperty ProductVersion -Unique 
$o365_version = Get-WmiObject -Class office365proplusconfigurations | select VersionToReport -ExpandProperty VersionToReport -Unique 

if ($installed_version -ne $o365_version) {
  # Iguala a versão instalada com a versão registada no O365.
   Get-WmiObject -Class office365proplusconfigurations | Set-WmiInstance -Arguments @{VersionToReport="$installed_version"}
}
