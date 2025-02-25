Function Invoke-SherwebRequest {
    [OutputType([PSCustomObject[]], [PSCustomObject], [Void])]
    [CmdletBinding()]
    Param(
        [Parameter()]
        [string]$FilterQuery,

        [Parameter(Mandatory)]
        [ValidateSet("ServiceProvider", "Distributor")]
        [string]$API,

        [Parameter()]
        [ValidatePattern('^https?://[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,}/?.*$')]
        [string]$GatewayBaseURL = 'https://api.sherweb.com',

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$Endpoint,

        [Parameter()]
        [int]$MaxRetries = 3,

        [Parameter()]
        [int]$InitialRetryDelaySeconds = 3,

        [Parameter(Mandatory)]
        [ValidateSet("GET", "POST", "PATCH", "DELTE")]
        [String]$Method,

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
                ClientSecret = $script:SherwebAccessToken.ClientSecret
                Scope        = $script:SherwebAccessToken.Scope
            }
            Connect-Sherweb @connectSplat
        }
        Write-Verbose "Beginning Invoke-SherwebRequest Process"

        # Remove leading slash from endpoint if present
        Write-Verbose "Removing leading slash from endpoint if present"
        $Endpoint = $Endpoint.TrimStart('/')

        # Build base URL
        Write-Verbose "Building base URL"
        $Uri = "$GatewayBaseURL/$Scope/v1/$Endpoint"
        Write-Verbose "Base URL: $Uri"

        # Add filter query if present
        if ($filterQuery) {
            $filterQuery = $filterQuery.TrimStart('?')
            Write-Verbose "Filter Query: $filterQuery"
            $Uri = "$Uri`?$filterQuery"
            Write-Verbose "URL with Filter Query: $Uri"
        }

        $InvokeRestMethodParams = @{
            Headers     = @{
                "Ocp-Apim-Subscription-Key" = $script:SherwebAccessToken.GatewaySubscriptionKey
                "Authorization"             = "Bearer $($script:SherwebAccessToken.AccessToken)"
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
        Write-Verbose "Performing REST method invocation"
        $retryCount = 0
        $success = $false

        do {
            try {
                $response = Invoke-RestMethod @InvokeRestMethodParams
                $success = $true
            }
            catch {
                $errorResponse = $_.ErrorDetails.Message | ConvertFrom-Json -ErrorAction SilentlyContinue

                if ($_.Exception.Response.StatusCode -eq 429) {
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
                
                # If we're here, either it's not a rate limit error or we've exceeded retries
                throw
            }
        } while (-not $success -and $retryCount -le $MaxRetries)
    }

    End {
        $response
    }
}