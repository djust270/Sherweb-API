---
external help file: Sherweb-API-help.xml
Module Name: Sherweb-API
online version: https://developers.sherweb.com/
schema: 2.0.0
---

# New-SherwebOrderRequest

## SYNOPSIS
Creates a new order request on Sherweb.

## SYNTAX

```
New-SherwebOrderRequest [-CustomerId] <String> [-OrderBody] <Hashtable> [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
The New-SherwebOrderRequest function creates a new order request on Sherweb.

## EXAMPLES

### EXAMPLE 1
```
$body = @{
    cartItems = @(
        @{
            sku     = "string"
            quantity = 0
        }
    )
}
```

New-SherwebOrderRequest -OrderBody $body

## PARAMETERS

### -CustomerId
The ID of the customer to create the order request for.

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

### -OrderBody
The body of the order request.
This should be a hashtable containing the following properties:
    - cartItems (array of objects): An array of objects containing the SKU and quantity of the items in the order.

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
Reference: https://developers.sherweb.com/api-details#api=service-provider-api&operation=PlaceOrder

## RELATED LINKS
