function Get-SherwebPlatformsForSkus {
<#
    .SYNOPSIS
    Retrieves platforms for specified SKUs from Sherweb.

    .DESCRIPTION
    This function sends a request to the Sherweb API to get the platforms associated with the provided SKUs.

    .PARAMETER Skus
    An array of SKU strings for which platforms are to be retrieved. This parameter is mandatory.

    .EXAMPLE
    $result = Get-SherwebPlatformsForSkus -Skus @("SKU1", "SKU2")
    This will retrieve the platforms for SKU1 and SKU2 from Sherweb.

    .NOTES
    See the Sherweb API documentation for more details: 
    https://developers.sherweb.com/api-details#api=service-provider-api&operation=GetPlatformsForSkus
#>
    [CmdletBinding()]
    [OutputType([PSCustomObject[]])]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string[]]$Skus
    )

    begin {
        $jsonBody = ConvertTo-Json -InputObject $Skus
        $sherwebParams = @{
            API         = "ServiceProvider"
            Endpoint    = "platforms/platforms-for-skus"
            Method      = "POST"
            Body        = $jsonBody
        }
    }

    process {
        Invoke-SherwebRequest @sherwebParams
    }
}