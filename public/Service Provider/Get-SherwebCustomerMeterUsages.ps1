function Get-SherwebCustomerMeterUsages {
<#
.SYNOPSIS
    Retrieves the list of meter usages for the specified customer/platform.

.DESCRIPTION
    The Get-SherwebCustomerMeterUsages function retrieves the list of meter usages for the specified customer/platform.

.PARAMETER CustomerId
    The ID of the customer to retrieve meter usages for.

.PARAMETER PlatformId
    The ID of the platform to retrieve meter usages for.

.EXAMPLE
    PS> Get-SherwebCustomerMeterUsages -CustomerId "00000000-0000-0000-0000-000000000000" -PlatformId "00000000-0000-0000-0000-000000000000"
    Retrieves the list of meter usages for the specified customer/platform.

.OUTPUTS
    PSCustomObject[]
    A list of subscription meters.

.NOTES
    Reference: https://developers.sherweb.com/api-details#api=service-provider-api&operation=GetCustomerMeterUsages
#>
    [CmdletBinding()]
    [OutputType([PSCustomObject[]])]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$CustomerId,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$PlatformId
    )

    begin {
        $sherwebParams = @{
            API         = "ServiceProvider"
            Endpoint    = "customers/$CustomerId/platforms/$PlatformId/meter-usages"
            Method      = "GET"
        }
    }

    process {
        Invoke-SherwebRequest @sherwebParams
    }
}
