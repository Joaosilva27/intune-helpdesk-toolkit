<#
Purpose: Clears Microsoft Teams cache to resolve startup, login, and sync issues
Author: João Silva
Requires: Standard user (no admin required)
Notes: Teams will be restarted automatically
#>

# Stop Microsoft Teams process if running
# This ensures cache files are not locked
Stop-Process -Name "ms-teams" -Force -ErrorAction SilentlyContinue

# Define the Teams cache path for the current user
# $env:APPDATA resolves to C:\Users\<username>\AppData\Roaming
$teamsCachePath = "$env:APPDATA\Microsoft\Teams"

# Remove all cache files and folders
# -Recurse deletes subfolders
# -Force removes hidden/system files
# -ErrorAction prevents script from stopping if files don't exist
Remove-Item -Path "$teamsCachePath\*" -Recurse -Force -ErrorAction SilentlyContinue

# Restart Microsoft Teams
# This launches Teams normally for the user
Start-Process "ms-teams:"
