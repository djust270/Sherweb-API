# Create a temporary directory
$TempDir = Join-Path -Path $env:TMPDIR -ChildPath "Sherweb-API"
New-Item -Path $TempDir -ItemType Directory -Force

# Copy only the files you need
Copy-Item -Path "$PSScriptRoot\docs" -Destination $TempDir -Recurse
Copy-Item -Path "$PSScriptRoot\private" -Destination $TempDir -Recurse
Copy-Item -Path "$PSScriptRoot\public" -Destination $TempDir -Recurse
Copy-Item -Path "$PSScriptRoot\*.psd1" -Destination $TempDir
Copy-Item -Path "$PSScriptRoot\*.psm1" -Destination $TempDir
Copy-Item -Path "$PSScriptRoot\LICENSE" -Destination $TempDir


# Publish the module from the temp directory
Publish-Module -Path $TempDir -NuGetApiKey $env:APIKEY
