<#
Purpose : Reset Windows Print Spooler and clear stuck print jobs
Author  : João Silva
Requires: Administrator privileges
Notes   : Stops spooler, deletes all jobs, restarts spooler
#>

# Stop Print Spooler
Stop-Service -Name Spooler -Force

# Clear print queue files
$spoolPath = "C:\Windows\System32\spool\PRINTERS"
Remove-Item -Path "$spoolPath\*" -Force -ErrorAction SilentlyContinue

# Start Print Spooler
Start-Service -Name Spooler

