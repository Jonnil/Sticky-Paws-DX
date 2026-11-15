# Build with a separately verified portable Zig 0.15.2. No install or PATH edit.
[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)][string]$ZigPath,
    [Parameter(Mandatory=$true)][string]$CacheRoot
)
$ErrorActionPreference = 'Stop'
$zig = (Resolve-Path -LiteralPath $ZigPath).Path
$version = (& $zig version | Out-String).Trim()
if ($LASTEXITCODE -ne 0 -or $version -ne '0.15.2') {
    throw 'This adapter build is pinned to verified Zig 0.15.2.'
}
$oldGlobal = $env:ZIG_GLOBAL_CACHE_DIR
$oldLocal = $env:ZIG_LOCAL_CACHE_DIR
try {
    $env:ZIG_GLOBAL_CACHE_DIR = Join-Path $CacheRoot 'global'
    $env:ZIG_LOCAL_CACHE_DIR = Join-Path $CacheRoot 'local'
    New-Item -ItemType Directory -Path $env:ZIG_GLOBAL_CACHE_DIR -Force | Out-Null
    New-Item -ItemType Directory -Path $env:ZIG_LOCAL_CACHE_DIR -Force | Out-Null
    $source = Join-Path $PSScriptRoot 'telemetry_crypto.c'
    $output = Join-Path $PSScriptRoot 'TelemetryCrypto_x64.dll'
    & $zig cc -target x86_64-windows-gnu -std=c11 -O2 -Wall -Wextra -Werror `
        -shared $source -lbcrypt -lpsapi -s -o $output
    if ($LASTEXITCODE -ne 0) { throw "Adapter compiler failed: $LASTEXITCODE" }
    $importLibrary = Join-Path $PSScriptRoot 'telemetry_crypto.lib'
    if (Test-Path -LiteralPath $importLibrary) {
        Move-Item -LiteralPath $importLibrary -Destination (Join-Path $CacheRoot 'TelemetryCrypto.lib') -Force
    }
    Get-FileHash -LiteralPath $output -Algorithm SHA256
}
finally {
    $env:ZIG_GLOBAL_CACHE_DIR = $oldGlobal
    $env:ZIG_LOCAL_CACHE_DIR = $oldLocal
}



