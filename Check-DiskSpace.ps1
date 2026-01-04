<#
Purpose: Checks available disk space on the system drive (C:)
Author: João Silva
Requires: Standard user (no admin required)
Notes:
- Useful for troubleshooting performance, update, and M365 issues
- Flags low disk space conditions
#>

# Get disk information for drive C:
# Get-PSDrive returns capacity and free space information
$disk = Get-PSDrive -Name C

# Convert bytes to gigabytes for readability
$totalGB = [math]::Round($disk.Used / 1GB + $disk.Free / 1GB, 2)
$freeGB  = [math]::Round($disk.Free / 1GB, 2)

# Calculate free space percentage
$freePercent = [math]::Round(($disk.Free / ($disk.Used + $disk.Free)) * 100, 2)

# Output results to the console
Write-Host "Drive C: Total Space: $totalGB GB"
Write-Host "Drive C: Free Space : $freeGB GB ($freePercent%)"

# Warn if disk space is low
if ($freePercent -lt 10) {
    Write-Host "WARNING: Low disk space detected!" -ForegroundColor Red
}
