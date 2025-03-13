---
external help file: Sherweb-API-help.xml
Module Name: Sherweb-API
online version:
schema: 2.0.0
---

# Get-SherwebPayableCharges

## SYNOPSIS
Retrieves the list of payable charges for the specified date.

## SYNTAX

```
Get-SherwebPayableCharges [-Date] <DateTime> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
The Get-SherwebPayableCharges function retrieves the list of payable charges for the specified date.

## EXAMPLES

### EXAMPLE 1
```
Get-SherwebPayableCharges -Date (Get-Date -Date "2022-01-01")
Retrieves the list of payable charges for the specified date.
```

## PARAMETERS

### -Date
The date to retrieve payable charges for.

```yaml
Type: DateTime
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
### A list of payable charges.
## NOTES
Reference: https://developers.sherweb.com/api-details#api=distributor-api&operation=GetPayableCharges

## RELATED LINKS
