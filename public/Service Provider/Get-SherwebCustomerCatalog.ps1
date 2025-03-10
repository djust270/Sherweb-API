function Get-SherwebCustomerCatalog {
    <#
    .SYNOPSIS
        Retrieves a list of customer catalogs from Sherweb.

    .DESCRIPTION
        The Get-SherwebCustomers function retrieves a list of customer catalogs from the Sherweb API.

    .PARAMETER CustomerId
        The ID of the customer to retrieve the catalogs for.

    .EXAMPLE
        PS> Get-SherwebCustomers -CustomerId "00000000-0000-0000-0000-000000000000"
        Retrieves a list of customer catalogs for the specified customer.

    .OUTPUTS
        PSCustomObject[]
        A list of customer catalogs.

    .NOTES
        Reference: https://developers.sherweb.com/api-details#api=service-provider-api&operation=GetCustomerCatalog
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
            Endpoint    = "customer-catalogs/$CustomerId"
            Method      = "GET"
        }
    }

    process {
        Invoke-SherwebRequest @sherwebParams
    }
}

