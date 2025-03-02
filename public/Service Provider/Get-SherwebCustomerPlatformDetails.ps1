function Get-SherwebCustomerPlatformDetails {
<#
.SYNOPSIS
    Retrieves details of a customer's platform.

.DESCRIPTION
    The Get-SherwebCustomerPlatformDetails function retrieves details of a customer's platform.

.PARAMETER CustomerId
    The ID of the customer to retrieve the platform details for.

.PARAMETER PlatformId
    The ID of the platform to retrieve the details for.

.EXAMPLE
    PS> Get-SherwebCustomerPlatformDetails -CustomerId "00000000-0000-0000-0000-000000000000" -PlatformId "00000000-0000-0000-0000-000000000000"
    Retrieves the details of the specified customer's platform.

.OUTPUTS
    PSCustomObject
    The details of the customer's platform.

.NOTES
    Reference: https://developers.sherweb.com/api-details#api=service-provider-api&operation=GetCustomerPlatformDetails
#>
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
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
            Endpoint    = "customers/$CustomerId/platforms/$PlatformId/details"
            Method      = "GET"
        }
    }
    
    process {
        Invoke-SherwebRequest @sherwebParams
    }
    end {}
}