---
external help file: Sherweb-API-help.xml
Module Name: Sherweb-API
online version: https://developers.sherweb.com/
schema: 2.0.0
---

# Connect-Sherweb

## SYNOPSIS
Retrieves and stores an access token from Sherweb API using client credentials.

## SYNTAX

```
Connect-Sherweb [-ClientID] <String> [-ClientSecret] <String> [-GatewaySubscriptionKey] <String>
 [[-AuthUri] <String>] [-Scope] <String> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
The Connect-Sherweb function authenticates with the Sherweb API using client credentials (Client ID and Client Secret)
and stores an access token that can be used for subsequent API calls.

## EXAMPLES

### EXAMPLE 1
```
Connect-Sherweb -ClientId "your-client-id" -ClientSecret "your-client-secret"
Returns an access token string that can be used for Sherweb API authentication.
```

## PARAMETERS

### -ClientID
The Client ID provided by Sherweb for API authentication.

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

### -ClientSecret
The Client Secret provided by Sherweb for API authentication.

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

### -GatewaySubscriptionKey
The Gateway Subscription Key provided by Sherweb for API authentication.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AuthUri
The URI for the Sherweb API authentication endpoint.
Defaults to 'https://api.sherweb.com/auth/oidc/connect/token'.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: Https://api.sherweb.com/auth/oidc/connect/token
Accept pipeline input: False
Accept wildcard characters: False
```

### -Scope
The scope of the access token.
Valid values are 'service-provider' or 'distributor'.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 5
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

### None
## NOTES
Author: Bradley Wyatt
Requires: PowerShell 5.1 or later
Version: 1.2

## RELATED LINKS

[https://developers.sherweb.com/](https://developers.sherweb.com/)

