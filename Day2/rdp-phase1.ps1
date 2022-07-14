# Go ahead and list the adapters
Get-NetAdapter -Name *

# Reassign the network settings for the adapter
$index = Read-Host -Prompt "Enter the index of the adapter to configure: "
New-NetIPAddress -InterfaceIndex 1 -IPAddress "172.20.2.5" -AddressFamily IPv4 -PrefixLength 16 -DefaultGateway 172.20.0.1
Set-DnsClientServerAddress -InterfaceIndex 1 -ServerAddresses ("172.20.2.3","172.20.2.4")

# Reassign the hostname (Thanks Microsoft Technet)
# First: Get the current hostname
$ComputerName = Get-WmiObject Win32_ComputerSystem

# Second: New hostname
$NewHostName = Read-Host -Prompt "Enter the new hostname: " -Default

# Third: Assign the new hostname
$ComputerName.Rename($NewHostName)

# Inform of the changes and what to do next
Write-Host "The network adapter has been reconfigured to a static IP address."
Write-Host "Additionally, the hostname has been changed to $NewHostName."
Write-Host "Please restart the computer to complete the changes."
Write-Host "Next, run ./addc-phase2.ps1 to create the domain controller."
Write-Host "Press any key to continue..."
Read-Host

# Reboot to apply all the new settings
Shutdown -r -f -t 0 -m "Reboot to apply network settings and hostname"