function Get-SherwebCustomerCatalogItemsPricingInformation {
    <#
    .SYNOPSIS
        Retrieves a list of pricing information for the specified customer and catalog items.

    .DESCRIPTION
        The Get-SherwebCustomerCatalogItemsPricingInformation function retrieves a list of pricing information for the specified customer and catalog items.

    .PARAMETER CustomerId
        The ID of the customer to retrieve pricing information for.

    .PARAMETER SkuList
        The list of SKUs to retrieve pricing information for.

    .EXAMPLE
        PS> Get-SherwebCustomerCatalogItemsPricingInformation -CustomerId "00000000-0000-0000-0000-000000000000" -SkuList @("sku1", "sku2")
        Retrieves a list of pricing information for the specified customer and catalog items.

    .OUTPUTS
        PSCustomObject[]
        A list of pricing information.

    .NOTES
        Reference: https://developers.sherweb.com/api-details#api=service-provider-api&operation=GetCustomerCatalogItemsPricingInformation
    #>
    [CmdletBinding()]
    [OutputType([PSCustomObject[]])]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$CustomerId,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string[]]$SkuList
    )

    begin {
        # Validate order request
        $jsonBody = ConvertTo-Json -InputObject $SkuList
        $sherwebParams = @{
            API         = "ServiceProvider"
            Endpoint    = "customer-catalogs/{customerId}/catalog-items-pricing"
            Method      = "POST"
            Body        = $jsonBody
        }
    }

    process {
        Invoke-SherwebRequest @sherwebParams
    }
}