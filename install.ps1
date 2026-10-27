<#
Voice2 one-line installer (Windows 10/11 x64, no admin rights needed)

  irm https://baryonlabs.github.io/dji2note-releases/install.ps1 | iex

Downloads the latest DJI2NoteSetup.exe from GitHub Releases and installs it silently.
Files downloaded by PowerShell get no Mark-of-the-Web, so SmartScreen does not prompt.
Installs to %LOCALAPPDATA%\Baryon.DJI2Note (engine: %LOCALAPPDATA%\DJI2Note), with Start menu and desktop shortcuts.

NOTE: keep this file ASCII-only. GitHub Pages serves .ps1 without a UTF-8 charset, so `irm` would
garble non-ASCII text. Korean messages are stored as base64 UTF-8 and decoded at run time.
#>
$ErrorActionPreference = "Stop"
$ProgressPreference = "SilentlyContinue"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

function Ko([string]$b64) { [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($b64)) }

$url = "https://github.com/baryonlabs/dji2note-releases/releases/latest/download/DJI2NoteSetup.exe"
$dir = Join-Path $env:TEMP ("dji2note-setup-" + [Guid]::NewGuid().ToString("N"))
New-Item -ItemType Directory -Force -Path $dir | Out-Null
$setup = Join-Path $dir "DJI2NoteSetup.exe"

if ([Environment]::Is64BitOperatingSystem -eq $false) {
    Write-Host ((Ko "Vm9pY2Uy64qUIDY067mE7Yq4KHg2NCkgV2luZG93c+qwgCDtlYTsmpTtlanri4jri6Qu") + " / Voice2 requires 64-bit (x64) Windows.") -ForegroundColor Red
    return
}

Write-Host ((Ko "Vm9pY2UyIOuCtOugpOuwm+uKlCDspJHigKY=") + " / Downloading Voice2...")
Invoke-WebRequest -Uri $url -OutFile $setup -UseBasicParsing

Write-Host ((Ko "7ISk7LmYIOykkeKApg==") + " / Installing...")
$p = Start-Process -FilePath $setup -ArgumentList "--silent" -PassThru -Wait
Remove-Item -Recurse -Force $dir -ErrorAction SilentlyContinue

$exe = Join-Path $env:LOCALAPPDATA "Baryon.DJI2Note\current\DJI2Note.exe"
if ($p.ExitCode -eq 0 -and (Test-Path $exe)) {
    Write-Host ((Ko "7ISk7LmYIOyZhOujjCAtIOyLnOyekSDrqZTribTsl5DshJwgVm9pY2Uy66W8IOyLpO2Wie2VmOyEuOyalC4=") + " / Installed - launch Voice2 from the Start menu.") -ForegroundColor Green
    Start-Process -FilePath $exe
} else {
    Write-Host (((Ko "7ISk7LmY7ZWY7KeAIOuqu+2WiOyKteuLiOuLpCAo7L2U65OcIHswfSkuIGh0dHBzOi8vYmFyeW9ubGFicy5naXRodWIuaW8vZGppMm5vdGUtcmVsZWFzZXMvIOyXkOyEnCDsp4HsoJEg67Cb7JWEIOyjvOyEuOyalC4=") -f $p.ExitCode) + " / Install failed. Download it from https://baryonlabs.github.io/dji2note-releases/") -ForegroundColor Red
}
