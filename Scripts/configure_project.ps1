$RepoRoot = Split-Path -Parent $PSScriptRoot
$DataRoot = (Resolve-Path (Join-Path $RepoRoot "Data")).Path.Replace("\", "\\")
$Target = Join-Path $RepoRoot "Dashboard/RetailPulse.SemanticModel/definition/expressions.tmdl"
$Content = Get-Content $Target -Raw
$Content = [regex]::Replace($Content, 'expression DataRoot = ".*?" meta', "expression DataRoot = `"$DataRoot`" meta")
Set-Content -Path $Target -Value $Content -Encoding utf8
Write-Host "Configured DataRoot automatically."
