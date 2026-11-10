# ============================================================================
# AdobeServiceBlocker.ps1
# Script to stop and disable Adobe services (AGSService, AdobeGCClient)
# and register a daily scheduled task to run the blocker.
# Refactored: modular logic, parameter validation, and error handling.
# ============================================================================

[CmdletBinding()]
param(
    [string]$ScriptPath = "C:\Scripts\AdobeServiceBlocker.ps1",
    [string]$TaskName = "AdobeGenuineDailyBlocker",
    [switch]$Force
)

# ----------------------------------------------------------------------------
# Function: Install-BlockingScript
# Creates the blocking .ps1 file at the specified path.
# ----------------------------------------------------------------------------
function Install-BlockingScript {
    param([string]$Path)

    if (-not (Test-Path "C:\Scripts")) {
        New-Item -Path "C:\Scripts" -ItemType Directory -Force | Out-Null
    }

    $content = @"
Stop-Process -Name AGSService,AdobeGCClient -Force -ErrorAction SilentlyContinue
Set-Service -Name AGSService -StartupType Disabled -ErrorAction SilentlyContinue
Stop-Service -Name AGSService -Force -ErrorAction SilentlyContinue
"@

    [System.IO.File]::WriteAllText($Path, $content, [System.Text.Encoding]::UTF8)
    Write-Host "Blocker script installed at: $Path"
}

# ----------------------------------------------------------------------------
# Function: Register-ScheduledTask
# Creates or updates the scheduled task that runs the blocking script.
# ----------------------------------------------------------------------------
function Register-ScheduledTask {
    param([string]$ScriptPath, [string]$TaskName)

    $action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-ExecutionPolicy Bypass -WindowStyle Hidden -File `"$ScriptPath`""
    $startupTrigger = New-ScheduledTaskTrigger -AtStartup
    $dailyTrigger = New-ScheduledTaskTrigger -Daily -At 9:00AM

    $existingTask = Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue
    if ($existingTask) {
        if (-not $Force) {
            Write-Warning "The task '$TaskName' already exists. Use -Force to overwrite it."
            return
        }
        Unregister-ScheduledTask -TaskName $TaskName -Confirm:$false | Out-Null
    }

    Register-ScheduledTask -TaskName $TaskName -Action $action -Trigger $startupTrigger, $dailyTrigger -User "NT AUTHORITY\SYSTEM" -RunLevel Highest -Force | Out-Null
    Write-Host "Scheduled task registered: $TaskName"
}

# ----------------------------------------------------------------------------
# Function: Disable-AdobeTasks
# Disables Adobe-related scheduled tasks.
# ----------------------------------------------------------------------------
function Disable-AdobeTasks {
    Get-ScheduledTask -TaskName "*AdobeGC*" -ErrorAction SilentlyContinue | Disable-ScheduledTask -ErrorAction SilentlyContinue
    Get-ScheduledTask -TaskName "*Adobe-Genuine*" -ErrorAction SilentlyContinue | Disable-ScheduledTask -ErrorAction SilentlyContinue
    Write-Host "Adobe-related tasks disabled (if they existed)."
}

# ----------------------------------------------------------------------------
# Main flow
# ----------------------------------------------------------------------------
try {
    Install-BlockingScript -Path $ScriptPath
    Register-ScheduledTask -ScriptPath $ScriptPath -TaskName $TaskName -Force:$Force
    Disable-AdobeTasks
}
catch {
    Write-Error "Error during execution: $_"
    exit 1
}