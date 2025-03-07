---
external help file: Sherweb-API-help.xml
Module Name: Sherweb-API
online version: https://developers.sherweb.com/
schema: 2.0.0
---

# New-SherwebSubscriptionsCancellationRequest

## SYNOPSIS
Creates a new cancellation request for a subscription(s) on Sherweb.

## SYNTAX

```
New-SherwebSubscriptionsCancellationRequest [-CustomerId] <String> [-SubscriptionIds] <String[]>
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
The New-SherwebSubscriptionsCancellationRequest function creates a new cancellation request for a subscription(s) on Sherweb.

## EXAMPLES

### EXAMPLE 1
```
New-SherwebSubscriptionsCancellationRequest -CustomerId "00000000-0000-0000-0000-000000000000" -SubscriptionIds @("00000000-0000-0000-0000-000000000000", "00000000-0000-0000-0000-000000000001")
```

Creates a new cancellation request for the specified customer and subscriptions.

## PARAMETERS

### -CustomerId
The ID of the customer to create the cancellation request for.

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

### -SubscriptionIds
The IDs of the subscriptions to cancel.

```yaml
Type: String[]
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

### PSCustomObject
### The cancellation request.
## NOTES
Reference: https://developers.sherweb.com/api-details#api=service-provider-api&operation=CancelSubscriptions

## RELATED LINKS
