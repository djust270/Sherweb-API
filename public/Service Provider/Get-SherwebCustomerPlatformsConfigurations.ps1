function Get-SherwebCustomerPlatformsConfigurations {
<#
.SYNOPSIS
    Retrieves a list of platforms configurations for the specified customer.

.DESCRIPTION
    The Get-SherwebCustomerPlatformsConfigurations function retrieves a list of platforms configurations for the specified customer.

.PARAMETER CustomerId
    The ID of the customer to retrieve platforms configurations for.

.EXAMPLE
    PS> Get-SherwebCustomerPlatformsConfigurations -CustomerId "00000000-0000-0000-0000-000000000000"
    Retrieves a list of platforms configurations for the specified customer.

.OUTPUTS
    PSCustomObject
    A list of platforms configurations.

.NOTES
    Reference: https://developers.sherweb.com/api-details#api=service-provider-api&operation=GetCustomerPlatformsConfigurations
#>
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$CustomerId
    )
    
    begin {
        $sherwebParams = @{
            API         = "ServiceProvider"
            Endpoint    = "customers/$CustomerId/platforms-configurations"
            Method      = "GET"
        }
    }
    
    process {
        Invoke-SherwebRequest @sherwebParams
    }
    end {}
}
