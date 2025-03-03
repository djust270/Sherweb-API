function New-SherwebOrderRequest {
    <#
    .SYNOPSIS
        Creates a new order request on Sherweb.

    .DESCRIPTION
        The New-SherwebOrderRequest function creates a new order request on Sherweb.

    .PARAMETER OrderBody
        The body of the order request. This should be a hashtable containing the following properties:
            - cartItems (array of objects): An array of objects containing the SKU and quantity of the items in the order.

    .EXAMPLE
        $body = @{
            cartItems = @(
                @{
                    sku     = "string"
                    quantity = 0
                }
            )
        }

        New-SherwebOrderRequest -OrderBody $body

    .NOTES
        Reference: https://developers.sherweb.com/api-details#api=service-provider-api&operation=PlaceOrder
    #>
    [CmdletBinding()]
    [OutputType([PSCustomObject[]])]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$CustomerId,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [hashtable]$OrderBody
    )

    begin {
        # Validate order request        
        $jsonBody = ConvertTo-Json -InputObject $OrderBody
        $validateOrder = @{
            API         = "ServiceProvider"
            Endpoint    = "orders/validate"
            FilterQuery = "customerId=$CustomerId"
            Method      = "POST"
            Body        = $jsonBody
            ErrorAction = 'Stop'
        }
        try {
            Invoke-SherwebRequest @validateOrder
            Write-Verbose "Order request is valid"
        }
        catch {
            Write-Error "Order request is invalid: $_"
        }
        $sherwebParams = @{
            API         = "ServiceProvider"
            Endpoint    = "orders"
            FilterQuery = "customerId=$CustomerId"
            Method      = "POST"
            Body        = $jsonBody
        }
    }

    process {
        Invoke-SherwebRequest @sherwebParams
    }
}

