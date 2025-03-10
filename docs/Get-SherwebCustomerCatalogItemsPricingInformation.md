---
external help file: Sherweb-API-help.xml
Module Name: Sherweb-API
online version:
schema: 2.0.0
---

# Get-SherwebCustomerCatalogItemsPricingInformation

## SYNOPSIS
Retrieves a list of pricing information for the specified customer and catalog items.

## SYNTAX

```
Get-SherwebCustomerCatalogItemsPricingInformation [-CustomerId] <String> [-SkuList] <String[]>
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
The Get-SherwebCustomerCatalogItemsPricingInformation function retrieves a list of pricing information for the specified customer and catalog items.

## EXAMPLES

### EXAMPLE 1
```
Get-SherwebCustomerCatalogItemsPricingInformation -CustomerId "00000000-0000-0000-0000-000000000000" -SkuList @("sku1", "sku2")
Retrieves a list of pricing information for the specified customer and catalog items.
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

### -SkuList
The list of SKUs to retrieve pricing information for.

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

### PSCustomObject[]
### A list of pricing information.
## NOTES
Reference: https://developers.sherweb.com/api-details#api=service-provider-api&operation=GetCustomerCatalogItemsPricingInformation

## RELATED LINKS
