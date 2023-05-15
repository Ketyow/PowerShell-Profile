Write-Verbose -Message "Ustawienie zmiannych środowiskowych na potrzeby Proxy"
[System.Net.WebRequest]::DefaultWebProxy = [System.Net.WebRequest]::GetSystemWebProxy()
[System.Net.WebRequest]::DefaultWebProxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials

Write-Verbose -Message "Logowanie transkrypcji do pliku"
Start-Transcript -OutputDirectory $env:USERPROFILE\Documents\WindowsPowerShell\history -Append -NoClobber
