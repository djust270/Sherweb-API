Function Invoke-SherwebRequest {
<#
    .SYNOPSIS
        Sends API requests to Sherweb endpoints with automatic authentication token management and rate limiting handling.

    .DESCRIPTION
        This function sends HTTP requests to Sherweb API endpoints, managing authentication tokens automatically.
        It handles rate limiting with exponential backoff retry logic and automatically refreshes expired tokens.
    
    .PARAMETER FilterQuery
        Optional query string to filter the API results. Do not include the leading '?' character.

    .PARAMETER API
        Mandatory parameter to specify which Sherweb API to use. Valid values are 'ServiceProvider' or 'Distributor'.

    .PARAMETER GatewayBaseURL
        Base URL of the Sherweb API gateway. Defaults to 'https://api.sherweb.com'.

    .PARAMETER Endpoint
        Mandatory parameter specifying the API endpoint to call (without the base URL).

    .PARAMETER MaxRetries
        Maximum number of retry attempts when rate limited. Defaults to 3.

    .PARAMETER InitialRetryDelaySeconds
        Initial delay in seconds before the first retry attempt. Defaults to 3 seconds.
        Actual delay will increase exponentially with each retry.

    .PARAMETER Method
        Mandatory HTTP method to use for the request. Valid values are 'GET', 'POST', 'PATCH', or 'DELTE'.

    .PARAMETER Body
        Optional JSON body to include with the request for POST, PATCH operations.

    .EXAMPLE
        Invoke-SherwebRequest -API ServiceProvider -Endpoint 'customers' -Method GET
    
        Retrieves all customers using the Service Provider API.

    .EXAMPLE
        Invoke-SherwebRequest -API ServiceProvider -Endpoint 'billing/subscriptions' -Method GET -FilterQuery 'customerId=c4c56db-03fe-4564-a5b9-173453453'
    
        Gets the subscriptions for a customer with id of 'c4c56db-03fe-4564-a5b9-173453453' using the Service Provider API.

    .NOTES
        Before using this function, you must authenticate using Connect-Sherweb.
        The function will automatically refresh the token if it has expired.

     .LINK
        https://developers.sherweb.com/

#>
    [OutputType([PSCustomObject[]], [PSCustomObject], [Void])]
    [CmdletBinding()]
    Param(

        [Parameter(Mandatory)]
        [ValidateSet("ServiceProvider", "Distributor")]
        [string]$API,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$Endpoint,

        [Parameter(Mandatory)]
        [ValidateSet("GET", "POST", "PATCH", "DELETE")]
        [string]$Method,

        [Parameter()]
        [ValidatePattern('^https?://[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,}/?.*$')]
        [string]$GatewayBaseURL = 'https://api.sherweb.com',

        [Parameter()]
        [int]$MaxRetries = 3,

        [Parameter()]
        [ValidatePattern('^[^?].*|^$')]
        [string]$FilterQuery,

        [Parameter()]
        [int]$InitialRetryDelaySeconds = 3,

        [Parameter()]
        [string]$Body
    )

    Begin {
        if ($null -eq $script:SherwebAccessToken){
            $PSCmdlet.ThrowTerminatingError(
                [System.Management.Automation.ErrorRecord]::new(
                    [System.ArgumentException]::new('No access token found. Run Connect-Sherweb first.'),
                    'NoAccessTokenFound',
                    [System.Management.Automation.ErrorCategory]::AuthenticationError,
                    $null
                )
            )
        }
        elseif ([DateTime]::Now -gt $script:SherwebAccessToken.Expiration) {
            $connectSplat = @{
                ClientId     = $script:SherwebAccessToken.ClientId
                ClientSecret = (Convert-SecureStringToPlainText -SecureString $script:SherwebAccessToken.ClientSecret)
                Scope        = $script:SherwebAccessToken.Scope
            }
            Connect-Sherweb @connectSplat
        }
        Write-Verbose -Message  "Beginning Invoke-SherwebRequest Process"

        # Remove leading slash from endpoint if present
        Write-Verbose -Message  "Removing leading slash from endpoint if present"
        $Endpoint = $Endpoint.TrimStart('/')

        $Scope = switch ($API){
            "ServiceProvider" { "service-provider" }
            "Distributor" { "distributor" }
        }

        # Build base URL
        Write-Verbose -Message  "Building base URL"
        $Uri = "$GatewayBaseURL/$Scope/v1/$Endpoint"
        Write-Verbose -Message  "Base URL: $Uri"

        # Add filter query if present
        if ($FilterQuery) {
            Write-Verbose -Message  "Filter Query: $FilterQuery"
            $Uri = "$Uri`?$FilterQuery"
            Write-Verbose -Message  "URL with Filter Query: $Uri"
        }

        $InvokeRestMethodParams = @{
            Headers     = @{
                'Ocp-Apim-Subscription-Key' = (Convert-SecureStringToPlainText -SecureString $script:SherwebAccessToken.GatewaySubscriptionKey)
                'Authorization'             = "Bearer $($script:SherwebAccessToken.AccessToken)"
                'Content-Type'              = 'application/json'
            }
            Method      = $Method
            URI         = $uri
            ErrorAction = "Stop"  # Changed to Stop to ensure we catch errors
        }
        if ($Null -ne $Body){
            $InvokeRestMethodParams.Body = $Body
        }
    }

    Process {
        Write-Verbose -Message  "Performing REST method invocation"
        [int]$retryCount = 0
        [bool]$success = $false

        do {
            try {
                $response = Invoke-RestMethod @InvokeRestMethodParams
                $success = $true
            }
            catch {
                $errorMessage = $_.Exception.Message
                $statusCode = $_.Exception.Response.StatusCode
                $errorResponse = $_.ErrorDetails.Message | ConvertFrom-Json -ErrorAction SilentlyContinue

                if ($statusCode -eq 429) {
                    $retryCount++
                    
                    # Extract retry delay from error message if available
                    $retryDelay = $InitialRetryDelaySeconds
                    if ($errorResponse.detail -match "Try again in (\d+) seconds") {
                        $retryDelay = [int]$matches[1]
                    }

                    # Apply exponential backoff
                    $waitTime = $retryDelay * [Math]::Pow(2, ($retryCount - 1))
                    
                    if ($retryCount -le $MaxRetries) {
                        Write-Warning "Rate limit exceeded. Waiting $waitTime seconds before retry $retryCount of $MaxRetries..."
                        Start-Sleep -Seconds $waitTime
                        continue
                    }
                }
                else {
                    if ($errorResponse.detail){
                        $errorMessage = $errorResponse.detail
                    }
                    throw "Error Code ${statusCode}: $errorMessage"
                }        
            }
        } while (-not $success -and $retryCount -le $MaxRetries)
    }

    End {
        $response
    }
}