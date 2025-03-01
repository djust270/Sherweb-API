$Public = Get-ChildItem -Path $PSScriptRoot\public\*.ps1 -Recurse
$Public | ForEach-Object { . $_.FullName}
Get-ChildItem -Path $PSScriptRoot\private\*.ps1 | ForEach-Object { . $_.FullName }
Export-ModuleMember -Function $Public.BaseName