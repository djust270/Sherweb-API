---
external help file: Sherweb-API-help.xml
Module Name: Sherweb-API
online version:
schema: 2.0.0
---

# Get-SherwebPlatformsForSkus

## SYNOPSIS
Retrieves platforms for specified SKUs from Sherweb.

## SYNTAX

```
Get-SherwebPlatformsForSkus [-Skus] <String[]> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
This function sends a request to the Sherweb API to get the platforms associated with the provided SKUs.

## EXAMPLES

### EXAMPLE 1
```
$result = Get-SherwebPlatformsForSkus -Skus @("SKU1", "SKU2")
This will retrieve the platforms for SKU1 and SKU2 from Sherweb.
```

## PARAMETERS

### -Skus
An array of SKU strings for which platforms are to be retrieved.
This parameter is mandatory.

```yaml
Type: String[]
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

### System.Management.Automation.PSObject[]
## NOTES
See the Sherweb API documentation for more details: 
https://developers.sherweb.com/api-details#api=service-provider-api&operation=GetPlatformsForSkus

## RELATED LINKS
