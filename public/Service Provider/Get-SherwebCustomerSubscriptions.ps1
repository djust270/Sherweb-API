function Get-SherwebCustomerSubscriptions {
<#
.SYNOPSIS
    Retrieves a list of subscriptions for the specified customer.

.DESCRIPTION
    The Get-SherwebCustomerSubscriptions function retrieves a list of subscriptions from the Sherweb API for the specified customer.

.PARAMETER CustomerId
    The ID of the customer to retrieve subscriptions for.

.EXAMPLE
    PS> Get-SherwebCustomerSubscriptions -CustomerId "00000000-0000-0000-0000-000000000000"
    Retrieves a list of subscriptions for the specified customer.

.OUTPUTS
    PSCustomObject[]
    A list of subscriptions.

.NOTES
    Reference: https://developers.sherweb.com/api-details#api=service-provider-api&operation=GetCustomerSubscriptionsDetails
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
            Endpoint    = "/billing/subscriptions/details"
            FilterQuery = "customerId=$CustomerId"
            Method      = "GET"
        }
    }

    process {
        (Invoke-SherwebRequest @sherwebParams).items
    }
}
