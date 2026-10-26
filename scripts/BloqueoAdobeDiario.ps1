# ============================================================================
# BloqueoAdobeDiario.ps1
# Script para detener y deshabilitar servicios de Adobe (AGSService, AdobeGCClient)
# y registrar una tarea programada diaria para ejecutar el bloqueo.
# Refactorizado: logica modular, validacion de parametros y manejo de errores.
# ============================================================================

[CmdletBinding()]
param(
    [string]$ScriptPath = "C:\Scripts\BloqueoAdobeDiario.ps1",
    [string]$TaskName = "BloqueoDiarioAdobeGenuine",
    [switch]$Force
)

# ----------------------------------------------------------------------------
# Funcion: Instalar-ScriptBloqueo
# Crea el archivo .ps1 de bloqueo en la ruta especificada.
# ----------------------------------------------------------------------------
function Instalar-ScriptBloqueo {
    param([string]$Ruta)

    if (-not (Test-Path "C:\Scripts")) {
        New-Item -Path "C:\Scripts" -ItemType Directory -Force | Out-Null
    }

    $contenido = @"
Stop-Process -Name AGSService,AdobeGCClient -Force -ErrorAction SilentlyContinue
Set-Service -Name AGSService -StartupType Disabled -ErrorAction SilentlyContinue
Stop-Service -Name AGSService -Force -ErrorAction SilentlyContinue
"@

    [System.IO.File]::WriteAllText($Ruta, $contenido, [System.Text.Encoding]::UTF8)
    Write-Host "Script de bloqueo instalado en: $Ruta"
}

# ----------------------------------------------------------------------------
# Funcion: Registrar-TareaProgramada
# Crea o actualiza la tarea programada que ejecuta el script de bloqueo.
# ----------------------------------------------------------------------------
function Registrar-TareaProgramada {
    param([string]$RutaScript, [string]$NombreTarea)

    $accion = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-ExecutionPolicy Bypass -WindowStyle Hidden -File `"$RutaScript`""
    $disparadorInicio = New-ScheduledTaskTrigger -AtStartup
    $disparadorDiario = New-ScheduledTaskTrigger -Daily -At 9:00AM

    $tareaExistente = Get-ScheduledTask -TaskName $NombreTarea -ErrorAction SilentlyContinue
    if ($tareaExistente) {
        if (-not $Force) {
            Write-Warning "La tarea '$NombreTarea' ya existe. Use -Force para sobrescribirla."
            return
        }
        Unregister-ScheduledTask -TaskName $NombreTarea -Confirm:$false | Out-Null
    }

    Register-ScheduledTask -TaskName $NombreTarea -Action $accion -Trigger $disparadorInicio, $disparadorDiario -User "NT AUTHORITY\SYSTEM" -RunLevel Highest -Force | Out-Null
    Write-Host "Tarea programada registrada: $NombreTarea"
}

# ----------------------------------------------------------------------------
# Funcion: Deshabilitar-TareasAdobe
# Deshabilita tareas programadas relacionadas con AdobeGC y Adobe-Genuine.
# ----------------------------------------------------------------------------
function Deshabilitar-TareasAdobe {
    Get-ScheduledTask -TaskName "*AdobeGC*" -ErrorAction SilentlyContinue | Disable-ScheduledTask -ErrorAction SilentlyContinue
    Get-ScheduledTask -TaskName "*Adobe-Genuine*" -ErrorAction SilentlyContinue | Disable-ScheduledTask -ErrorAction SilentlyContinue
    Write-Host "Tareas relacionadas con Adobe deshabilitadas (si existían)."
}

# ----------------------------------------------------------------------------
# Flujo principal
# ----------------------------------------------------------------------------
try {
    Instalar-ScriptBloqueo -Ruta $ScriptPath
    Registrar-TareaProgramada -RutaScript $ScriptPath -NombreTarea $TaskName -Force:$Force
    Deshabilitar-TareasAdobe
}
catch {
    Write-Error "Error durante la ejecucion: $_"
    exit 1
}