function Get-SherwebPayableCharges {
    <#
    .SYNOPSIS
        Retrieves the list of payable charges for the specified date.

    .DESCRIPTION
        The Get-SherwebPayableCharges function retrieves the list of payable charges for the specified date.

    .PARAMETER Date
        The date to retrieve payable charges for.

    .EXAMPLE
        PS> Get-SherwebPayableCharges -Date (Get-Date -Date "2022-01-01")
        Retrieves the list of payable charges for the specified date.

    .OUTPUTS
        PSCustomObject[]
        A list of payable charges.
    
    .NOTES
        Reference: https://developers.sherweb.com/api-details#api=distributor-api&operation=GetPayableCharges
    #>
        [CmdletBinding()]
        [OutputType([PSCustomObject[]])]
        param(
            [Parameter(Mandatory)]
            [ValidateNotNullOrEmpty()]
            [DateTime]$Date
        )
    
        begin {
            $UDate = Get-Date -Date $Date -Format "u"
            $sherwebParams = @{
                API         = "Distributor"
                Endpoint    = "billing/payable-charges"
                FilterQuery = "[$UDate]"
                Method      = "GET"
            }
        }
    
        process {
            Invoke-SherwebRequest @sherwebParams
        }
    }
    