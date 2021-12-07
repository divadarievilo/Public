net stop ccmexec
wmic /Namespace:\\root path __Namespace where Name="ccm" delete
net start ccmexec