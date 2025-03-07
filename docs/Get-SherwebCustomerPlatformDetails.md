---
external help file: Sherweb-API-help.xml
Module Name: Sherweb-API
online version: https://developers.sherweb.com/
schema: 2.0.0
---

# Get-SherwebCustomerPlatformDetails

## SYNOPSIS
Retrieves details of a customer's platform.

## SYNTAX

```
Get-SherwebCustomerPlatformDetails [-CustomerId] <String> [-PlatformId] <String>
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
The Get-SherwebCustomerPlatformDetails function retrieves details of a customer's platform.

## EXAMPLES

### EXAMPLE 1
```
Get-SherwebCustomerPlatformDetails -CustomerId "00000000-0000-0000-0000-000000000000" -PlatformId "00000000-0000-0000-0000-000000000000"
Retrieves the details of the specified customer's platform.
```

## PARAMETERS

### -CustomerId
The ID of the customer to retrieve the platform details for.

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
The ID of the platform to retrieve the details for.

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

### PSCustomObject
### The details of the customer's platform.
## NOTES
Reference: https://developers.sherweb.com/api-details#api=service-provider-api&operation=GetCustomerPlatformDetails

## RELATED LINKS
