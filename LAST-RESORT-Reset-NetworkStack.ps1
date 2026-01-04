<#
Purpose: Resets Windows TCP/IP stack and Winsock catalog to resolve persistent network issues
Author: João Silva
Requires: Administrator privileges
Notes:
- This is a last-resort troubleshooting step
- A system reboot is required after execution
#>

# Reset TCP/IP stack
# Restores default network configuration for IPv4 and IPv6
netsh int ip reset

# Reset Winsock catalog
# Fixes issues with network applications and connectivity
netsh winsock reset

# Inform the user that a reboot is required
Write-Host "Network stack reset completed. Please restart the computer to apply changes." -ForegroundColor Yellow
