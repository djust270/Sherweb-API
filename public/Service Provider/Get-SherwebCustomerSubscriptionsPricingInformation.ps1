function Get-SherwebCustomerSubscriptionsPricingInformation {
<#
.SYNOPSIS
    Retrieves a list of pricing information for all subscriptions of the specified customer.

.DESCRIPTION
    The Get-SherwebCustomerSubscriptionPricingInformation function retrieves a list of pricing information for all subscriptions of the specified customer.

.PARAMETER CustomerId
    The ID of the customer to retrieve pricing information for.

.EXAMPLE
    PS> Get-SherwebCustomerSubscriptionPricingInformation -CustomerId "00000000-0000-0000-0000-000000000000"
    Retrieves a list of pricing information for all subscriptions of the specified customer.

.OUTPUTS
    PSCustomObject[]
    A list of pricing information.

.NOTES
    Reference: https://developers.sherweb.com/api-details#api=service-provider-api&operation=GetAllSubscriptionPricingInformation
#>    
    [CmdletBinding()]
    [OutputType([PSCustomObject[]])]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$CustomerId
    )

    begin {
        $sherwebParams = @{
            API         = "ServiceProvider"
            Endpoint    = "billing/subscriptions/pricing-information"
            FilterQuery = "customerId=$CustomerId"
            Method      = "GET"
        }
    }

    process {
        Invoke-SherwebRequest @sherwebParams
    }
    end {}
}
