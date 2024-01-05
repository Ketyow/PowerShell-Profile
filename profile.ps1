Write-Verbose -Message "Set ciphers"
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType] 'Tls12, Tls13'

Write-Verbose -Message "Set proxy settings"
[System.Net.WebRequest]::DefaultWebProxy = [System.Net.WebRequest]::GetSystemWebProxy()
[System.Net.WebRequest]::DefaultWebProxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials

Write-Verbose -Message "Set shell loging history"
Start-Transcript -OutputDirectory "$env:USERPROFILE\Documents\WindowsPowerShell\history" -Append -NoClobber

