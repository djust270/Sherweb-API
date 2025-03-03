function New-SherwebSubscriptionsAmendment {
<#
.SYNOPSIS
    Creates a new subscription amendment on Sherweb.

.DESCRIPTION
    The New-SherwebSubscriptionAmendment function creates a new subscription amendment on Sherweb.

.PARAMETER CustomerId
    The ID of the customer to create the subscription amendment for.

.PARAMETER AmendmentBody
    The body of the subscription amendment. This should be a hashtable containing the subscriptionAmendmentParameters property with an array of objects containing the subscriptionId and newQuantity properties.

.EXAMPLE
    $body = @{
        subscriptionAmendmentParameters = @(
            @{
                subscriptionId = "string"
                newQuantity    = 0
            }
        )
    }

    New-SherwebSubscriptionAmendment -CustomerId "00000000-0000-0000-0000-000000000000" -AmendmentBody $body

.NOTES
    Reference: https://developers.sherweb.com/api-details#api=service-provider-api&operation=CreateSubscriptionAmendment
#>
    [CmdletBinding()]
    [OutputType([PSCustomObject[]])]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$CustomerId,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [hashtable]$AmendmentBody
    )

    begin {
        $jsonBody = ConvertTo-Json -InputObject $AmendmentBody
        $sherwebParams = @{
            API         = "ServiceProvider"
            Endpoint    = "/billing/subscriptions/amendments"
            FilterQuery = "customerId=$CustomerId"
            Method      = "POST"
            Body        = $jsonBody
        }
    }

    process {
        Invoke-SherwebRequest @sherwebParams
    }
}

