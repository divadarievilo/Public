$install_VB = "VirtualBox-6.0.24-139119-Win.exe"
$install_VB_Args = " --silent --ignore-reboot"
Start-Process $install_VB -ArgumentList $install_VB_Args -Wait

$install_VB_Ext = "c:\program files\oracle\virtualbox\vboxmanage.exe"
$install_VB_Ext_Args = " extpack install Oracle_VM_VirtualBox_Extension_Pack-6.1.28.vbox-extpack"
Start-Process cmd.exe -ArgumentList "/c ECHO Y | $install_VB_Ext $install_VB_Ext_Args" -Wait
#Start-Process $install_VB_Ext -ArgumentList $install_VB_Ext_Args -Wait
