#Requires -Version 5.1
<#
.SYNOPSIS
    One-click domain updater for Flutman UI
.DESCRIPTION
    Updates all domain references across the codebase.
    Edit $OldDomain and $NewDomain variables, then run: .\update-domain.ps1
.EXAMPLE
    .\update-domain.ps1
#>

# ═══════════════════════════════════════════════════════════════
# ⚙️ CONFIGURATION - Edit these for your target domain
# ═══════════════════════════════════════════════════════════════
$OldDomain = "flutman.xyz"
$NewDomain = "flutman.vercel.app"

# ═══════════════════════════════════════════════════════════════
# 🚀 SCRIPT
# ═══════════════════════════════════════════════════════════════
$ErrorActionPreference = "Stop"
$startTime = Get-Date

Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "  Domain Updater: $OldDomain → $NewDomain" -ForegroundColor Cyan
Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

$filePatterns = @("*.ts", "*.tsx", "*.js", "*.cjs", "*.mts", "*.md", "*.mdx", "*.json", "*.txt", "*.css")
$excludeDirs = @("node_modules", ".next", ".git", "dist", "build", "out", "coverage", ".turbo", "skills")
$filesScanned = 0
$filesModified = 0
$replacementsMade = 0
$errors = @()

Write-Host "Scanning..." -ForegroundColor Yellow

$allFiles = Get-ChildItem -Path $PSScriptRoot -Recurse -File | Where-Object {
    $file = $_
    $matchesPattern = $filePatterns | Where-Object { $file.Name -like $_ }
    $inExcludedDir = $excludeDirs | Where-Object { $file.FullName -like "*\$_*" }
    $matchesPattern -and -not $inExcludedDir
}

foreach ($file in $allFiles) {
    $filesScanned++
    try {
        $content = Get-Content -Path $file.FullName -Raw -ErrorAction Stop
        $originalContent = $content
        $fileModified = $false

        # Replace https:// and http:// URLs
        $pattern = "https://" + [regex]::Escape($OldDomain)
        $newPattern = "https://" + $NewDomain
        if ($content -match $pattern) {
            $matchCount = ([regex]::Matches($content, $pattern)).Count
            $content = $content -replace $pattern, $newPattern
            $replacementsMade += $matchCount
            $fileModified = $true
        }

        # Replace bare domain
        if ($content -match $OldDomain) {
            $matchCount = ([regex]::Matches($content, $OldDomain)).Count
            $content = $content -replace $OldDomain, $NewDomain
            $replacementsMade += $matchCount
            $fileModified = $true
        }

        if ($fileModified) {
            Set-Content -Path $file.FullName -Value $content -NoNewline
            $filesModified++
            Write-Host "  ✓ $($file.FullName.Replace($PSScriptRoot, '.'))" -ForegroundColor Green
        }
    }
    catch {
        $errors += "$($file.FullName): $($_.Exception.Message)"
        Write-Host "  ✗ $($file.FullName.Replace($PSScriptRoot, '.'))" -ForegroundColor Red
    }
}


$duration = (Get-Date) - $startTime

Write-Host ""
Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "  UPDATE COMPLETE" -ForegroundColor Cyan
Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "  Files scanned:    $filesScanned" -ForegroundColor White
Write-Host "  Files modified:   $filesModified" -ForegroundColor Green
Write-Host "  Replacements:     $replacementsMade" -ForegroundColor Green
Write-Host "  Errors:           $($errors.Count)" -ForegroundColor $(if($errors.Count -gt 0){"Red"}else{"Green"})
Write-Host "  Duration:         $($duration.ToString('mm\:ss'))" -ForegroundColor White
Write-Host ""
Write-Host "  Next steps:" -ForegroundColor Yellow
Write-Host "     1. Clear cache: Remove-Item -Recurse -Force .\apps\ui\.next" -ForegroundColor White
Write-Host "     2. Regenerate llms.txt if needed" -ForegroundColor White
Write-Host "     3. Restart dev server" -ForegroundColor White
Write-Host ""
