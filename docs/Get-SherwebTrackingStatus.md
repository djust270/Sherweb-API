---
external help file: Sherweb-API-help.xml
Module Name: Sherweb-API
online version: https://developers.sherweb.com/
schema: 2.0.0
---

# Get-SherwebTrackingStatus

## SYNOPSIS
Tracks the status of a request (order, amendment, cancellation, ...).

## SYNTAX

```
Get-SherwebTrackingStatus [-CustomerId] <String> [-TrackingId] <String> [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
The Get-SherwebTrackingStatus function tracks the status of a request (order, amendment, cancellation, ...) on Sherweb.

## EXAMPLES

### EXAMPLE 1
```
Get-SherwebTrackingStatus -CustomerId "00000000-0000-0000-0000-000000000000" -TrackingId "00000000-0000-0000-0000-000000000000"
Tracks the status of a request (order, amendment, cancellation, ...) for the specified customer and tracking ID.
```

## PARAMETERS

### -CustomerId
The ID of the customer to track the request status for.

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

### -TrackingId
The tracking ID of the request to track the status for.

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

### PSCustomObject[]
### The status of the request.
## NOTES
Reference: https://api.sherweb.com/service-provider/v1/tracking/{trackingId}

## RELATED LINKS
