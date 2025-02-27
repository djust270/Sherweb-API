$Public = Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -Recurse
$Public | ForEach-Object { . $_.FullName }
Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 | ForEach-Object { . $_.FullName }
Export-ModuleMember -Function $Public.BaseName