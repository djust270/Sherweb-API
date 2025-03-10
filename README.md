# Sherweb-API
PowerShell Module for interacting with the Sherweb API

## Get Started
Run Connect-Sherweb to get connected. Provide your API credentials.

Example:
```PowerShell
$SecureGatewaySubscriptionKey = ConvertTo-SecureString "your-gateway-subscription-key" -AsPlainText -Force
$SecureClientSecret = ConvertTo-SecureString "your-client-secret" -AsPlainText -Force
Connect-Sherweb -ClientId "your-client-id" -ClientSecret $SecureClientSecret -GatewaySubscriptionKey $SecureGatewaySubscriptionKey
```

## Available Commands
* Connect-Sherweb
* Get-SherwebCustomerMeterUsages
* Get-SherwebCustomerPlatformDetails
* Get-SherwebCustomerPlatformsConfigurations
* Get-SherwebCustomers
* Get-SherwebCustomerSubscriptionMeters
* Get-SherwebCustomerSubscriptions
* Get-SherwebCustomerSubscriptionsPricingInformation
* Get-SherwebPlatforms
* Get-SherwebTrackingStatus
* New-SherwebOrderRequest
* New-SherwebSubscriptionsAmendment
* New-SherwebSubscriptionsCancellationRequest
