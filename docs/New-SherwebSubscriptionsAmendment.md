---
external help file: Sherweb-API-help.xml
Module Name: Sherweb-API
online version: https://developers.sherweb.com/
schema: 2.0.0
---

# New-SherwebSubscriptionsAmendment

## SYNOPSIS
Creates a new subscription amendment on Sherweb.

## SYNTAX

```
New-SherwebSubscriptionsAmendment [-CustomerId] <String> [-AmendmentBody] <Hashtable>
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
The New-SherwebSubscriptionAmendment function creates a new subscription amendment on Sherweb.

## EXAMPLES

### EXAMPLE 1
```
$body = @{
    subscriptionAmendmentParameters = @(
        @{
            subscriptionId = "string"
            newQuantity    = 0
        }
    )
}
```

New-SherwebSubscriptionAmendment -CustomerId "00000000-0000-0000-0000-000000000000" -AmendmentBody $body

## PARAMETERS

### -CustomerId
The ID of the customer to create the subscription amendment for.

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

### -AmendmentBody
The body of the subscription amendment.
This should be a hashtable containing the subscriptionAmendmentParameters property with an array of objects containing the subscriptionId and newQuantity properties.

```yaml
Type: Hashtable
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

### System.Management.Automation.PSObject[]
## NOTES
Reference: https://developers.sherweb.com/api-details#api=service-provider-api&operation=CreateSubscriptionAmendment

## RELATED LINKS
