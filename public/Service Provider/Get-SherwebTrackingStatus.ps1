function Get-SherwebTrackingStatus {
    <#
    .SYNOPSIS
        Tracks the status of a request (order, amendment, cancellation, ...).

    .DESCRIPTION
        The Get-SherwebTrackingStatus function tracks the status of a request (order, amendment, cancellation, ...) on Sherweb.

    .PARAMETER CustomerId
        The ID of the customer to track the request status for.

    .PARAMETER TrackingId
        The tracking ID of the request to track the status for.

    .EXAMPLE
        PS> Get-SherwebTrackingStatus -CustomerId "00000000-0000-0000-0000-000000000000" -TrackingId "00000000-0000-0000-0000-000000000000"
        Tracks the status of a request (order, amendment, cancellation, ...) for the specified customer and tracking ID.

    .OUTPUTS
        PSCustomObject[]
        The status of the request.

    .NOTES
        Reference: https://api.sherweb.com/service-provider/v1/tracking/{trackingId}
    #>
    [CmdletBinding()]
    [OutputType([PSCustomObject[]])]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$CustomerId,
    
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$TrackingId
    )

    begin {
        $sherwebParams = @{
            API         = "ServiceProvider"
            Endpoint    = "tracking/$TrackingId"
            Method      = "GET"
        }
    }

    process {
        Invoke-SherwebRequest @sherwebParams
    }
}
