Param(
  [string]$MySqlExe = "mysql",          # ruta al cliente mysql si no está en PATH
  [string]$SqlFile = ".\db_create_with_user.sql",
  [string]$RootUser = "root"
)

if (-not (Test-Path $SqlFile)) {
  Write-Error "No se encontró $SqlFile en $(Get-Location)."
  exit 1
}

# pedir contraseña root interactiva (no se muestra)
$secure = Read-Host -AsSecureString "Contraseña MySQL para $RootUser"
$RootPass = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($secure))

Write-Host "Ejecutando $SqlFile con $RootUser..."
# Construir comando seguro; este método expone la contraseña en la línea de comando en algunos entornos.
# Alternativa: ejecutar mysql sin -p para que pida la contraseña interactivamente.
$cmd = "$MySqlExe -u$RootUser -p$RootPass < `"$SqlFile`""
Invoke-Expression $cmd

if ($LASTEXITCODE -eq 0) {
  Write-Host "Script ejecutado correctamente."
} else {
  Write-Error "Error ejecutando el script. Código de salida: $LASTEXITCODE"
}
  Write-Error "Error ejecutando el script. Código de salida: $LASTEXITCODE"
}
