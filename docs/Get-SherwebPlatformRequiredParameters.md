---
external help file: Sherweb-API-help.xml
Module Name: Sherweb-API
online version:
schema: 2.0.0
---

# Get-SherwebPlatformRequiredParameters

## SYNOPSIS
Retrieves a list of required parameters for the specified platforms.

## SYNTAX

```
Get-SherwebPlatformRequiredParameters [-PlatformIds] <String[]> [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
The Get-SherwebPlatformRequiredParameters function retrieves a list of required parameters for the specified platforms from the Sherweb API.

## EXAMPLES

### EXAMPLE 1
```
Get-SherwebPlatformRequiredParameters -PlatformIds @("00000000-0000-0000-0000-000000000000", "00000000-0000-0000-0000-000000000001")
Retrieves a list of required parameters for the specified platforms.
```

## PARAMETERS

### -PlatformIds
The IDs of the platforms to retrieve the required parameters for.

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

### PSCustomObject[]
### A list of required parameters for the specified platforms.
## NOTES
Reference: https://developers.sherweb.com/api-details#api=service-provider-api&operation=GetPlatformRequiredParameters

## RELATED LINKS
