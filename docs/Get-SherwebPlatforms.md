---
external help file: Sherweb-API-help.xml
Module Name: Sherweb-API
online version: https://developers.sherweb.com/
schema: 2.0.0
---

# Get-SherwebPlatforms

## SYNOPSIS
Retrieves a list of platforms from Sherweb.

## SYNTAX

```
Get-SherwebPlatforms [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
The Get-SherwebPlatforms function retrieves and returns a list of platforms from the Sherweb API.

## EXAMPLES

### EXAMPLE 1
```
Get-SherwebPlatforms
Returns a list of platforms in the Sherweb account.
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
### A list of platforms.
## NOTES
Reference: https://developers.sherweb.com/api-details#api=service-provider-api&operation=GetAllPlatforms

## RELATED LINKS
