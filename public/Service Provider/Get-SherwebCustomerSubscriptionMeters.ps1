function Get-SherwebCustomerSubscriptionMeters {
<#
.SYNOPSIS
    Retrieves the list of subscriptions meters for one of your customers.

.DESCRIPTION
    The Get-SherwebCustomerSubscriptionMeters function retrieves the list of subscriptions meters for one of your customers.

.PARAMETER CustomerId
    The ID of the customer to retrieve subscriptions for.

.PARAMETER PlatformId
    The ID of the platform to retrieve subscriptions for.

.EXAMPLE
    PS> Get-SherwebCustomerSubscriptionMeters -CustomerId "00000000-0000-0000-0000-000000000000" -PlatformId "00000000-0000-0000-0000-000000000000"
    Retrieves the list of subscriptions meters for the specified customer/platform.

.OUTPUTS
    PSCustomObject[]
    A list of subscriptions meters.

.NOTES
    Reference: https://developers.sherweb.com/api-details#api=service-provider-api&operation=GetCustomerSubscriptionMeters
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
            Endpoint    = "billing/subscriptions/meters"
            FilterQuery = "customerId=$CustomerId&platformId=$PlatformId"
            Method      = "GET"
        }
    }

    process {
        Invoke-SherwebRequest @sherwebParams
    }
}
