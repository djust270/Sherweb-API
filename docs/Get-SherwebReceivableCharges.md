---
external help file: Sherweb-API-help.xml
Module Name: Sherweb-API
online version:
schema: 2.0.0
---

# Get-SherwebReceivableCharges

## SYNOPSIS
Retrieves the list of receivable charges for the specified customer.

## SYNTAX

```
Get-SherwebReceivableCharges [-CustomerId] <String> [[-Date] <DateTime>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
The Get-SherwebReceivableCharges function retrieves the list of receivable charges for the specified customer.

## EXAMPLES

### EXAMPLE 1
```
Get-SherwebReceivableCharges -CustomerId "00000000-0000-0000-0000-000000000000"
Retrieves the list of receivable charges for the specified customer.
```

### EXAMPLE 2
```
Get-SherwebReceivableCharges -CustomerId "00000000-0000-0000-0000-000000000000" -Date "2022-01-01"
Retrieves the list of receivable charges for the specified customer and date.
```

## PARAMETERS

### -CustomerId
The ID of the customer to retrieve receivable charges for.

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

### -Date
The date to retrieve the receivable charges for.
If not specified, the current day is used.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
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
### A list of receivable charges.
## NOTES
Reference: https://developers.sherweb.com/api-details#api=service-provider-api&operation=GetReceivableCharges

## RELATED LINKS
