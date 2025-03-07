---
external help file: Sherweb-API-help.xml
Module Name: Sherweb-API
online version: https://developers.sherweb.com/
schema: 2.0.0
---

# Get-SherwebCustomerSubscriptionMeters

## SYNOPSIS
Retrieves the list of subscriptions meters for one of your customers.

## SYNTAX

```
Get-SherwebCustomerSubscriptionMeters [-CustomerId] <String> [-PlatformId] <String>
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
The Get-SherwebCustomerSubscriptionMeters function retrieves the list of subscriptions meters for one of your customers.

## EXAMPLES

### EXAMPLE 1
```
Get-SherwebCustomerSubscriptionMeters -CustomerId "00000000-0000-0000-0000-000000000000" -PlatformId "00000000-0000-0000-0000-000000000000"
Retrieves the list of subscriptions meters for the specified customer/platform.
```

## PARAMETERS

### -CustomerId
The ID of the customer to retrieve subscriptions for.

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

### -PlatformId
The ID of the platform to retrieve subscriptions for.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
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
### A list of subscriptions meters.
## NOTES
Reference: https://developers.sherweb.com/api-details#api=service-provider-api&operation=GetCustomerSubscriptionMeters

## RELATED LINKS
