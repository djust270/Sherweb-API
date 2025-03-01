function Get-SherwebPlatforms {

    [CmdletBinding()]
    [OutputType([PSCustomObject[]])]
    param()

    begin {
        $sherwebParams = @{
            API         = "ServiceProvider"
            Endpoint    = "platforms"
            Method      = "GET"
        }
    }

    process {
        (Invoke-SherwebRequest @sherwebParams).platforms
    }
}
