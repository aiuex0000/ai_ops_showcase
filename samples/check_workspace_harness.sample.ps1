# Public sample: workspace harness checker
# This is a shortened, public-facing example that shows the structure only.
# It represents the "after" shape described in check_script_evolution.md.
# In practice, one reason to keep a single entrypoint is that
# checks become hard to follow once they are scattered across many scripts.
# A unified harness makes "what do I run first?" much easier to answer.

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$repoRoot = Split-Path -Parent $PSScriptRoot
Set-Location $repoRoot

function Assert-PathExists {
    param(
        [Parameter(Mandatory = $true)]
        [string] $Path
    )

    if (-not (Test-Path -LiteralPath $Path)) {
        throw "Missing required path: $Path"
    }
}

$requiredPaths = @(
    'AGENTS.md',
    'docs/workspace_manifest/workspace_manifest.md',
    'scripts/get-current-state-materials.ps1'
)

Write-Host 'Workspace harness check started.' -ForegroundColor Cyan

foreach ($path in $requiredPaths) {
    Assert-PathExists -Path $path
}

Write-Host 'Step 1/4: Entrypoint guardrails' -ForegroundColor Cyan
& (Join-Path $repoRoot 'scripts/check-agent-entrypoints.ps1')

Write-Host 'Step 2/4: Archive harness' -ForegroundColor Cyan
& (Join-Path $repoRoot 'scripts/check-ai-archive-harness.ps1')

Write-Host 'Step 3/4: Current state materials' -ForegroundColor Cyan
& (Join-Path $repoRoot 'scripts/get-current-state-materials.ps1') | Out-Null

Write-Host 'Step 4/4: Tmp hygiene' -ForegroundColor Cyan
& (Join-Path $repoRoot 'scripts/check-tmp-hygiene.ps1')

Write-Host 'Workspace harness check passed.' -ForegroundColor Green
