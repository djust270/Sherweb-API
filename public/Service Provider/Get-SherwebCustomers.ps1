function Get-SherwebCustomers {
    <#
    .SYNOPSIS
        Retrieves a list of all customers from Sherweb.

    .DESCRIPTION
        The Get-SherwebCustomers function retrieves and returns a list of all customers from the Sherweb API.

    .EXAMPLE
        PS> Get-SherwebCustomers
        Returns a list of customers in the Sherweb account.

    .OUTPUTS
        PSCustomObject[]
        A list of customers.

    .NOTES
        Reference: https://developers.sherweb.com/api-details#api=service-provider-api&operation=GetCustomers
    #>
    [CmdletBinding()]
    [OutputType([PSCustomObject[]])]
    param()

    begin {
        $sherwebParams = @{
            API         = "ServiceProvider"
            Endpoint    = "customers"
            Method      = "GET"
        }
    }

    process {
        (Invoke-SherwebRequest @sherwebParams).items
    }
}
