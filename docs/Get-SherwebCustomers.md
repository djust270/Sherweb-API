---
external help file: Sherweb-API-help.xml
Module Name: Sherweb-API
online version: https://developers.sherweb.com/
schema: 2.0.0
---

# Get-SherwebCustomers

## SYNOPSIS
Retrieves a list of all customers from Sherweb.

## SYNTAX

```
Get-SherwebCustomers [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
The Get-SherwebCustomers function retrieves and returns a list of all customers from the Sherweb API.

## EXAMPLES

### EXAMPLE 1
```
Get-SherwebCustomers
Returns a list of customers in the Sherweb account.
```

## PARAMETERS

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
### A list of customers.
## NOTES
Reference: https://developers.sherweb.com/api-details#api=service-provider-api&operation=GetCustomers

## RELATED LINKS
