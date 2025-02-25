function Get-SherwebCustomers {
    [CmdletBinding()]
    param()
    begin {
        $sherwebParams = @{
            API         = "ServiceProvider"
            Endpoint    = "customers"
            Method      = "GET"
        }
    }
    process {
        (Invoke-SherwebRequest -API "ServiceProvider" -Endpoint "customers" -Method GET).items
    }
}