<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Haider Naqvi
    LinkedIn        : https://www.linkedin.com/in/haidernaqvi313/
    GitHub          : https://github.com/HaiderNaqvi313
    Date Created    : 2025-05-03
    Last Modified   : 2024-05-03
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\_(STIG-ID-WN10-AU-000500).ps1 
#>

# Powershell Code for Remediation


# Define variables
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$valueName = "MaxSize"
$desiredSize = 32768

# Create the registry path if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the MaxSize value
Set-ItemProperty -Path $regPath -Name $valueName -Value $desiredSize -Type DWord

# Confirm the change
Get-ItemProperty -Path $regPath -Name $valueName




