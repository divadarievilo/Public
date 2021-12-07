<#
.SYNOPSIS
 	<PS to check all or dedicate DP Package Distributionsstate WMI and Content Lib State>
.DESCRIPTION
	<>
.PARAMETER <Parameter_Name>
	<
		$DPType (DPALL, DPSingle)		Parameter for ALL DP or only one dedicate DP
		$SiteServer						Parameter for SCCM Primary or CAS Server (use FQDN)		
		$SiteCode						Parameter for SCCM Primary or CAS Server Site Code, 3 Letters
		$DPFQDN							optional Parameter for Single DP, only if DPType=DPSingle
		$DefaultContentLibDriveLetter 	optional to check the DP Content Lib Volume (Default is set to D:)
		$LogFile 						optional to set the logfile, Default is set to "C:\windows\temp\DP_CleanUP_Action_Log"
		$GridView						optional to set to summary to gridview 
	>
.INPUTS
	<>
.OUTPUTS
	<Log File, Default C:\windows\temp\DP_CleanUP_Action_Log_%ExecutionTime.log>
.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.160
	 Created on:   	29.03.2019 13:56
	 Created by:   	Klaus Bilger (Klaus.Bilger@C-S-L.BIZ)
	 Organization: 	C-S-L K.Bilger
	 Filename:     	Check-SCCMDPState.ps1
	===========================================================================
#>
#---------------------------------------------------------[Initialisations]--------------------------------------------------------
[cmdletbinding()]
param
(
	[ValidateSet('DPALL', 'DPSingle')]
	[Parameter(Mandatory = $true, HelpMessage = "Please enter the the DP Type 'DPALL-/-DPSingle'")]
	[ValidateNotNullOrEmpty()]
	[String]$DPType,
	[Parameter(Mandatory = $true)]
	[ValidateNotNullOrEmpty()]
	[String]$SiteServer,
	[Parameter(Mandatory = $true)]
	[ValidateNotNullOrEmpty()]
	[String]$SiteCode,
	[parameter(Mandatory = $False)]
	[switch]$GridView,
	[Parameter(Mandatory = $true)]
	[string]$DPFQDN,
	[Parameter(Mandatory = $false)]
	$DefaultContentLibDriveLetter = "D:"
)
switch ($DPType)
{
	'DPALL' { $DPSearch = "select * from SMS_DistributionPointInfo where ResourceType = 'Windows NT Server'" }
	'DPSingle' { $DPSearch = "select * from SMS_DistributionPointInfo where Name like '" + $DPFQDN + "'" }
}
#endregion
#---------------------------------------------------------[Declarations]-----------------------------------------------------------
#region Declarations

$Namespace = "root\SMS\Site_" + $SiteCode
$LogFile = $LogFile + "_" + (Get-Date -Format "yyyy_MM_dd_HH_MM") + ".log"
$DPResults = @()
[string]$global:scriptName = $MyInvocation.MyCommand.Name.Replace(".ps1", "") + "_" + $((Get-Date -format "yyyy_mm_dd")) + ".log";
[string]$global:LOG_FILE = $PSScriptRoot + "\" + $global:scriptName
[boolean]$global:Debug = $true

#endregion



#region Functions


function Write-Log
{
	param
	(
		[ValidateSet('Debug', 'Start', 'End', 'Trap', 'Warn', 'Error', 'Info')]
		[Parameter(Mandatory = $true, HelpMessage = "Please enter the log type [Debug/Start/End/Trap/Warn/Error/Info]")]
		[ValidateNotNullOrEmpty()]
		[String]$MsgType,
		[Parameter(Mandatory = $True)]
		[string]$Message,
		[Parameter(Mandatory = $False)]
		[string]$MessageID
		
	)
	$local:TIMESTAMP = Get-Date -f "yyyy-MM-dd HH:mm:ss";
	if ($MessageID)
	{ $local:LOGLINE = ("{0} [ {1} ] => {2} || MsgID {3}" -f $local:TIMESTAMP, $MsgType, $Message, $MessageID) }
	else
	{ $local:LOGLINE = ("{0} [ {1} ] => {2}" -f $local:TIMESTAMP, $MsgType, $Message) }
	
	$global:Trace += "$local:LOGLINE `r`n"
	
	switch ($MsgType)
	{
		'debug' {
			Write-Debug  $local:LOGLINE
			if ($global:Debug -eq $true) { "$local:LOGLINE" | Add-Content $global:LOG_FILE; }
		}
		'Warn'{
			Write-Warning $local:LOGLINE
			"$local:LOGLINE" | Add-Content $global:LOG_FILE;
		}
		'Error' {
			Write-Error "$local:LOGLINE"
			"$local:LOGLINE" | Add-Content $global:LOG_FILE;
		}
		default {
			write-host  "$local:LOGLINE"
			"$local:LOGLINE" | Add-Content $global:LOG_FILE;
		}
	}
}
#endregion 





#---------------------------------------------------------[Execution]--------------------------------------------------------------



Write-Log -MsgType Start -Message "starting PowerShell Script [$($MyInvocation.MyCommand.Name)]"


## check Powershell Version 
if ($PSVersionTable.PSVersion.Major -lt 3)
{
	$errmsg = "wrong Powershell Version. Version = [" + $PSVersionTable.PSVersion.Major + "], Powershell Version 3.0 is required !!"
	Write-Log -MsgType Error -Message  $errmsg -MessageID 9999
	Exit 9999
}


## start working
## Start-Transcript -Path $LogFile -Force -IncludeInvocationHeader
if ([string]::IsNullOrEmpty($DPFQDN) -and ($DPType -eq "DPSingle"))
{
	$errmsg = "FQDN for Single DP missing, please use the parameter -$DPFQDN 'your DP FQDN'"
	Write-Log -MsgType Error -Message $errmsg -MessageID 9999
	Exit 9999
}

## $DPSearch = "select * from SMS_DistributionPointInfo where ResourceType = 'Windows NT Server'"
$DistributionPoints = Get-WMIObject -ComputerName $SiteServer -Namespace $Namespace -Query $DPSearch -ErrorAction SilentlyContinue
if ([string]::IsNullOrEmpty($DistributionPoints))
{
	$errmsg = "List of Distributionsserver is empty !!"
	Write-Log -MsgType Error -Message $errmsg -MessageID 9999
	Exit 9999
}

if ($DPType -eq "DPSingle"){$DPTotalCount = 1 }
else {$DPTotalCount = $DistributionPoints.count}
Write-Log -MsgType Info -Message " "
Write-Log -MsgType Info -Message "getting all valid distribution points... "  
Write-Log -MsgType Info -Message " [$($DPTotalcount)] distribution points found."  
Write-Log -MsgType Info -Message " "

## loop trough List of DP's
foreach ($DistributionPoint in $DistributionPoints)
{
	$DistributionPointName = $DistributionPoint.ServerName
	if (-not (Test-Connection $DistributionPointName -Quiet -Count 1))
	{
		Write-Log -MsgType Error -Message "Could not connect to DistributionPoint $DistributionPoint - Skipping this server..." -MessageID 9999
	}
	else
	{
		$List_of_Missing_Pkg_WMI = ""
		$List_of_too_mmuch_Pkg_WMI = ""
		$List_of_Missing_Pkg_ContenLib = ""
		$List_of_too_much_Pkg_ContenLib = ""
		$ValidPackagesforDP = ""
		$Search4DistributionPoint = "%" + $DistributionPointName + "%"
		
		## load all Pkg from central DB
		$ValidPackagesforDP = Get-WMIObject -ComputerName $SiteServer -Namespace $Namespace -Query "select distinct PackageID from SMS_PackageStatus where PkgServer like '$Search4DistributionPoint'" | Select -ExpandProperty PackageID | Sort-Object
		Write-Log -MsgType Info -Message " "
		Write-Log -MsgType Info -Message "working on DP [$($DistributionPointName)],# total:$($DPTotalCount)"
		Write-Log -MsgType Info -Message "$DistributionPointName is online."  
		Write-Log -MsgType Info -Message " +-- $($ValidPackagesforDP.count) packages found for DP $($DistributionPointName)."
		Write-Log -MsgType Info -Message  " +-- Getting packages from $($DistributionPointName)"
		$WMIPkgList = Get-WmiObject -ComputerName $DistributionPointName -Namespace Root\SCCMDP -Class SMS_PackagesInContLib | Select -ExpandProperty PackageID | Sort-Object
		
		if ($WMIPkgList)
		{
			## load the Content Disk Info, some DP are not set by default "G:\"
			$ContentLib = Invoke-Command -ComputerName $DistributionPointName { (Get-ItemProperty -path HKLM:SOFTWARE\Microsoft\SMS\DP -Name ContentLibraryPath) }
			$PkgLibPath = ($ContentLib.ContentLibraryPath) + "\PkgLib"
			Write-Log -MsgType Info -Message  " +-- path to the local content lib $($PkgLibPath)"
			if ($PkgLibPath -notmatch $DefaultContentLibDriveLetter) { Write-Log -MsgType Info -Message " +-- **** content lib path wrong ****" }
			$ScriptBlockContent = { $PkgLibPath = $args[0]; Get-ChildItem $PkgLibPath | Select -ExpandProperty Name | Sort-Object | ForEach-Object { $_.replace(".INI", "") } }
			$PkgLibList = Invoke-Command -ComputerName $DistributionPointName -ScriptBlock $ScriptBlockContent -ArgumentList $PkgLibPath
			
			Write-Log -MsgType Info -Message " +-- $($WMIPkgList.count) packages found WMI DP $DistributionPointName."
			Write-Log -MsgType Info -Message " +-- $($PkgLibList.count) packages found Content LIB DP $DistributionPointName."
			
			# compare 
			$List_of_Missing_Pkg_WMI = Compare-Object -ReferenceObject $ValidPackagesforDP -DifferenceObject $WMIPkgList -PassThru | Where-Object { $_.SideIndicator -eq "<=" }
			$List_of_too_mmuch_Pkg_WMI = Compare-Object -ReferenceObject $ValidPackagesforDP -DifferenceObject $WMIPkgList -PassThru | Where-Object { $_.SideIndicator -eq "=>" }
			$List_of_Missing_Pkg_ContenLib = Compare-Object -ReferenceObject $ValidPackagesforDP -DifferenceObject $PkgLibList -PassThru | Where-Object { $_.SideIndicator -eq "<=" }
			$List_of_too_much_Pkg_ContenLib = Compare-Object -ReferenceObject $ValidPackagesforDP -DifferenceObject $PkgLibList -PassThru | Where-Object { $_.SideIndicator -eq "=>" }
			
			
			## check for $NULL 
			if ([string]::IsNullOrEmpty($List_of_Missing_Pkg_WMI)) { $List_of_Missing_Pkg_WMI = "no" }
			if ([string]::IsNullOrEmpty($List_of_too_mmuch_Pkg_WMI)) { $List_of_too_mmuch_Pkg_WMI = "no" }
			if ([string]::IsNullOrEmpty($List_of_Missing_Pkg_ContenLib)) { $List_of_Missing_Pkg_ContenLib = "no" }
			if ([string]::IsNullOrEmpty($List_of_too_much_Pkg_ContenLib)) { $List_of_too_much_Pkg_ContenLib = "no" }
			
			# Add to a PS object
			$DPResult = New-Object psobject
			Add-Member -InputObject $DPResult -MemberType NoteProperty -Name "DP FQDN Name" -Value $DistributionPointName
			Add-Member -InputObject $DPResult -MemberType NoteProperty -Name "WMI missing values" -Value $List_of_Missing_Pkg_WMI
			Add-Member -InputObject $DPResult -MemberType NoteProperty -Name "WMI to much Values" -Value $List_of_too_mmuch_Pkg_WMI
			Add-Member -InputObject $DPResult -MemberType NoteProperty -Name "Content Lib missing values" -Value $List_of_Missing_Pkg_ContenLib
			Add-Member -InputObject $DPResult -MemberType NoteProperty -Name "Content Lib to much Values" -Value $List_of_too_much_Pkg_ContenLib
			$DPResults += $DPResult
		}
		else
		{
			Write-Log -MsgType Error -Message "WMI ERROR; Result for DP $($DistributionPointName) is empty. please check the Server and your permissions (Firewall, Admin Rights..)"
			
		}
	}
}


Write-Log -MsgType End -Message " **** DONE ****"  


if ($GridView)
{
	if ($DPResults -ne $null)
	{ $DPResults | Out-GridView -Title "ConfigMgr Failed Package Distributions" }
	Else { Write-Log -MsgType Warn -Message "No results were returned!" }
}
else
{
	if ($DPResults -ne $null)
	{ $DPResults | ft -AutoSize }
	Else { Write-Log -MsgType Warn -Message  "No results were returned!" }
}