function New-SherwebSubscriptionsCancellationRequest {
    <#
    .SYNOPSIS
        Creates a new cancellation request for a subscription(s) on Sherweb.

    .DESCRIPTION
        The New-SherwebSubscriptionsCancellationRequest function creates a new cancellation request for a subscription(s) on Sherweb.

    .PARAMETER CustomerId
        The ID of the customer to create the cancellation request for.

    .PARAMETER SubscriptionIds
        The IDs of the subscriptions to cancel.

    .EXAMPLE
        PS> New-SherwebSubscriptionsCancellationRequest -CustomerId "00000000-0000-0000-0000-000000000000" -SubscriptionIds @("00000000-0000-0000-0000-000000000000", "00000000-0000-0000-0000-000000000001")

        Creates a new cancellation request for the specified customer and subscriptions.

    .OUTPUTS
        PSCustomObject
        The cancellation request.

    .NOTES
        Reference: https://developers.sherweb.com/api-details#api=service-provider-api&operation=CancelSubscriptions
    #>
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$CustomerId,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string[]]$SubscriptionIds
    )

    begin {
        $body = @{
            subscriptionIds = $SubscriptionIds
        }
        $jsonBody = ConvertTo-Json -InputObject $body
        $sherwebParams = @{
            API         = "ServiceProvider"
            Endpoint    = "billing/subscriptions/cancellations"
            FilterQuery = "customerId=$CustomerId"
            Method      = "POST"
            Body        = $jsonBody
        }
    }

    process {
        Invoke-SherwebRequest @sherwebParams
    }
}
    
    