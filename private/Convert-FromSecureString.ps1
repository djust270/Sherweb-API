function Convert-SecureStringToPlainText {
    [CmdletBinding()]
    param (
        [Security.SecureString]$SecureString
    )
        $BSTR = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecureString)
        try {
            [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)
        }
        catch {
            throw "Failed to convert SecureString to plain text: $($_.Exception.Message)"
        }
        finally {
            [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($BSTR)
        }
}