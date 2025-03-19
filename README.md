# Sherweb-API
PowerShell Module for interacting with the Sherweb API

## Get Started

Install from the PowerShell Gallery

```PowerShell
Install-Module -Name Sherweb-API
```

Run Connect-Sherweb to get connected. Provide your API credentials.

Example:
```PowerShell
$SecureGatewaySubscriptionKey = ConvertTo-SecureString "your-gateway-subscription-key" -AsPlainText -Force
$SecureClientSecret = ConvertTo-SecureString "your-client-secret" -AsPlainText -Force
Connect-Sherweb -ClientId "your-client-id" -ClientSecret $SecureClientSecret -GatewaySubscriptionKey $SecureGatewaySubscriptionKey
```

## Available Commands
* [Connect-Sherweb](docs/Connect-Sherweb.md)
* [Get-SherwebCustomerMeterUsages](docs/Get-SherwebCustomerMeterUsages.md)
* [Get-SherwebCustomerPlatformDetails](docs/Get-SherwebCustomerPlatformDetails.md)
* [Get-SherwebCustomerPlatformsConfigurations](docs/Get-SherwebCustomerPlatformsConfigurations.md)
* [Get-SherwebCustomers](docs/Get-SherwebCustomers.md)
* [Get-SherwebCustomerSubscriptionMeters](docs/Get-SherwebCustomerSubscriptionMeters.md)
* [Get-SherwebCustomerSubscriptions](docs/Get-SherwebCustomerSubscriptions.md)
* [Get-SherwebCustomerSubscriptionsPricingInformation](docs/Get-SherwebCustomerSubscriptionsPricingInformation.md)
* [Get-SherwebPlatforms](docs/Get-SherwebPlatforms.md)
* [Get-SherwebTrackingStatus](docs/Get-SherwebTrackingStatus.md)
* [New-SherwebOrderRequest](docs/New-SherwebOrderRequest.md)
* [New-SherwebSubscriptionsAmendment](docs/New-SherwebSubscriptionsAmendment.md)
* [New-SherwebSubscriptionsCancellationRequest](docs/New-SherwebSubscriptionsCancellationRequest.md)
* [Get-CustomerCatalogItemsPricingInformation](docs/Get-CustomerCatalogItemsPricingInformation.md)
* [Get-SherwebCustomerCatalog](docs/Get-SherwebCustomerCatalog.md)
* [Get-SherwebReceivableCharges](docs/Get-SherwebReceivableCharges.md)