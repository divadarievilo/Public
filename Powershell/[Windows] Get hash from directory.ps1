$source = Get-ChildItem C:\Temp1\ -Recurse | Get-FileHash
$destination = Get-ChildItem C:\Temp2\ -Recurse | Get-FileHash
$i=0
foreach ($file in $source){
	if ($source.hash[$i] -eq $destination.hash[$i]){$i=$i+1} 
	else {exit 100;}
}