Function Connect-Sherweb {
    <#
    .SYNOPSIS
        Retrieves and stores an access token from Sherweb API using client credentials.

    .DESCRIPTION
        The Connect-Sherweb function authenticates with the Sherweb API using client credentials (Client ID and Client Secret)
        and stores an access token that can be used for subsequent API calls.

    .PARAMETER ClientId
        The Client ID provided by Sherweb for API authentication.

    .PARAMETER ClientSecret
        The Client Secret provided by Sherweb for API authentication.

    .PARAMETER GatewaySubscriptionKey
        The Gateway Subscription Key provided by Sherweb for API authentication.

    .PARAMETER AuthUri
        The URI for the Sherweb API authentication endpoint. Defaults to 'https://api.sherweb.com/auth/oidc/connect/token'.

    .PARAMETER Scope
        The scope of the access token. Valid values are 'service-provider' or 'distributor'.

    .EXAMPLE
        PS> $SecureGatewaySubscriptionKey = ConvertTo-SecureString "your-gateway-subscription-key" -AsPlainText -Force
        PS> $SecureClientSecret = ConvertTo-SecureString "your-client-secret" -AsPlainText -Force
        PS> Connect-Sherweb -ClientId "your-client-id" -ClientSecret $SecureClientSecret -GatewaySubscriptionKey $SecureGatewaySubscriptionKey
        Retrieves an access token and stores authentication information in the current session.
        
    .OUTPUTS
        None

    .LINK
        https://developers.sherweb.com/

    
    .NOTES
        Author: Bradley Wyatt
        Requires: PowerShell 5.1 or later
        Version: 1.2
#>
    [OutputType([void])]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$ClientID,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [securestring]$ClientSecret,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [securestring]$GatewaySubscriptionKey,

        [Parameter()]
        [ValidatePattern('^https://.*')]
        [string]$AuthUri = "https://api.sherweb.com/auth/oidc/connect/token",

        [Parameter(Mandatory)]
        [ValidateSet("service-provider", "distributor", ErrorMessage = "Scope is not among accepted values")]
        [string]$Scope
    )

    begin {
        switch ($PSEdition) {
            'Core' {
                $Secret = $ClientSecret | ConvertFrom-SecureString -AsPlainText
            }
            'Desktop' {
                $Secret = Convert-SecureStringToPlainText -SecureString $ClientSecret
            }
        }
        $splat = @{
            Uri         = $AuthUri
            Method      = "Post"
            Body        = @{
                client_id     = $ClientId
                client_secret = $Secret
                scope         = $scope
                grant_type    = "client_credentials"
            }
            ErrorAction = "Stop"
        }
    }

    process {
        try {
            $response = Invoke-RestMethod @splat
        }
        catch {
            $PSCmdlet.ThrowTerminatingError(
                [System.Management.Automation.ErrorRecord]::new(
                    [System.Net.WebException]::new("Failed to obtain access token: $($_.Exception.Message)"),
                    'TokenRetrievalError',
                    [System.Management.Automation.ErrorCategory]::ConnectionError,
                    $null
                )
            )
        }
    }

    end {
            $script:SherwebAccessToken = @{
                AccessToken = $response.access_token
                GatewaySubscriptionKey = $gatewaySubscriptionKey
                Expiration = (Get-Date).AddSeconds($response.expires_in)
                ClientId = $ClientId
                ClientSecret = $ClientSecret
                Scope = $Scope
        }
    }
}