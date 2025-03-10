function Get-SherwebReceivableCharges {
    <#
.SYNOPSIS
    Retrieves the list of receivable charges for the specified customer.

.DESCRIPTION
    The Get-SherwebReceivableCharges function retrieves the list of receivable charges for the specified customer.

.PARAMETER CustomerId
    The ID of the customer to retrieve receivable charges for.

.PARAMETER Date
    The date to retrieve the receivable charges for. If not specified, the current day is used.

.EXAMPLE
    PS> Get-SherwebReceivableCharges -CustomerId "00000000-0000-0000-0000-000000000000"
    Retrieves the list of receivable charges for the specified customer.

.EXAMPLE
    PS> Get-SherwebReceivableCharges -CustomerId "00000000-0000-0000-0000-000000000000" -Date "2022-01-01"
    Retrieves the list of receivable charges for the specified customer and date.

.OUTPUTS
    PSCustomObject[]
    A list of receivable charges.

.NOTES
    Reference: https://developers.sherweb.com/api-details#api=service-provider-api&operation=GetReceivableCharges
#>
    [CmdletBinding()]
    [OutputType([PSCustomObject[]])]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$CustomerId,

        [Parameter()]
        [datetime]$Date
    )
    
    begin {
        if ($Date) {
            $Query = "customerId=$CustomerId&date=$($Date.ToUniversalTime().ToString("yyyy-MM-dd"))"
        }
        else {
            $Query = "customerId=$CustomerId"
        }
        $sherwebParams = @{
            API         = "ServiceProvider"
            Endpoint    = "/billing/receivable-charges"
            FilterQuery = $Query
            Method      = "GET"
        }
    }
    
    process {
        Invoke-SherwebRequest @sherwebParams
    }
}
