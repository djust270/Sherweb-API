function Get-SherwebPlatformRequiredParameters {
    <#
    .SYNOPSIS
        Retrieves a list of required parameters for the specified platforms.

    .DESCRIPTION
        The Get-SherwebPlatformRequiredParameters function retrieves a list of required parameters for the specified platforms from the Sherweb API.

    .PARAMETER PlatformIds
        The IDs of the platforms to retrieve the required parameters for.

    .EXAMPLE
        PS> Get-SherwebPlatformRequiredParameters -PlatformIds @("00000000-0000-0000-0000-000000000000", "00000000-0000-0000-0000-000000000001")
        Retrieves a list of required parameters for the specified platforms.

    .OUTPUTS
        PSCustomObject[]
        A list of required parameters for the specified platforms.

    .NOTES
        Reference: https://developers.sherweb.com/api-details#api=service-provider-api&operation=GetPlatformRequiredParameters
    #>
    [CmdletBinding()]
    [OutputType([PSCustomObject[]])]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string[]]$PlatformIds
    )
    
    begin {
        $jsonBody = ConvertTo-Json -InputObject $PlatformIds
        $sherwebParams = @{
            API         = "ServiceProvider"
            Endpoint    = "platforms/required-parameters"
            Method      = "POST"
            Body        = $jsonBody
        }
    }
    
    process {
        Invoke-SherwebRequest @sherwebParams
    }
}