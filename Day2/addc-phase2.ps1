$logpath = "C:\Windows"
$config = ".\configs\ADDC.xml"

# Install AD DC
Install-WindowsFeature -ConfigurationFilePath $config

# Configure the new domain.
Install-ADDSForest `
-CreateDnsDelegation:$false `
-DatabasePath "$logpath\NTDS" `
-DomainMode "WinThreshold" `
-DomainName "monicarose.com" `
-DomainNetbiosName "MONICAROSE" `
-ForestMode "WinThreshold" `
-InstallDns:$true `
-LogPath "$logpath\NTDS" `
-NoRebootOnCompletion:$true `
-SysvolPath "$logpath\SYSVOL" `
-Force:$true

# Inform the user that the domain is ready, reboot is necessary, and phase 3 does AD CS
Write-Host "The domain has been installed and configured successfully."
Write-Host "A reboot is required to complete the installation."
Write-Host "After a reboot, run .\addc-phase3.ps1 to complete the installation."
Write-Host "Press any key to reboot."
Read-Host
Shutdown -r -f -t 0 -m "Configured AD DC"