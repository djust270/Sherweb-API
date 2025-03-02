function Get-SherwebPlatforms {
<#
.SYNOPSIS
    Retrieves a list of platforms from Sherweb.

.DESCRIPTION
    The Get-SherwebPlatforms function retrieves and returns a list of platforms from the Sherweb API.

.EXAMPLE
    PS> Get-SherwebPlatforms
    Returns a list of platforms in the Sherweb account.

.OUTPUTS
    PSCustomObject[]
    A list of platforms.

.NOTES
    Reference: https://developers.sherweb.com/api-details#api=service-provider-api&operation=GetAllPlatforms
#>
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
