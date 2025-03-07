---
external help file: Sherweb-API-help.xml
Module Name: Sherweb-API
online version: https://developers.sherweb.com/
schema: 2.0.0
---

# Get-SherwebCustomerSubscriptionsPricingInformation

## SYNOPSIS
Retrieves a list of pricing information for all subscriptions of the specified customer.

## SYNTAX

```
Get-SherwebCustomerSubscriptionsPricingInformation [-CustomerId] <String> [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
The Get-SherwebCustomerSubscriptionPricingInformation function retrieves a list of pricing information for all subscriptions of the specified customer.

## EXAMPLES

### EXAMPLE 1
```
Get-SherwebCustomerSubscriptionPricingInformation -CustomerId "00000000-0000-0000-0000-000000000000"
Retrieves a list of pricing information for all subscriptions of the specified customer.
```

## PARAMETERS

### -CustomerId
The ID of the customer to retrieve pricing information for.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProgressAction
{{ Fill ProgressAction Description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### PSCustomObject[]
### A list of pricing information.
## NOTES
Reference: https://developers.sherweb.com/api-details#api=service-provider-api&operation=GetAllSubscriptionPricingInformation

## RELATED LINKS
