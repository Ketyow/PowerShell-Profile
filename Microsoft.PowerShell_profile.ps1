$Shell = $Host.UI.RawUI
Clear-Host

if((whoami.exe /all | Select-String S-1-16-12288) -ne $null) #if admin OLD version 
#([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator") #if admin NEW vesion
{
    $Shell.WindowTitle = "!!!ADMIN!!!! "+$env:USERNAME+" PowerShell!!!"
    $shell.BackgroundColor = "DarkRed"
    $shell.ForegroundColor = "White"
    #Set the prompt to say admin
    function prompt
    {
        $(if (Test-Path variable:/PSDebugContext) { '[DBG]: ' }
        else { "ADMIN PS [$env:COMPUTERNAME] " }) + $(Get-Location) `
        + $(if ($nestedpromptlevel -ge 1) { '>>' }) + '> '
    } 
}
else #not admin
{
    $Shell.WindowTitle=$env:USERNAME+" PowerShell!!!"
    $shell.BackgroundColor = "Black"
    $shell.ForegroundColor = "White"

    $title = "Elevating"
    $message = "Do you want elevate yourself?"

    $yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", `
    "I elevating you MY MASTER!!!."

    $no = New-Object System.Management.Automation.Host.ChoiceDescription "&No", `
    "Stay as user..."

    $switchAccount = New-Object System.Management.Automation.Host.ChoiceDescription "&Switch Account", `
    "Be another person..."

    $options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no, $switchAccount)

    $result = $host.ui.PromptForChoice($title, $message, $options, 1) 

    switch ($result)
    {
        0 {Start-Process powershell.exe -Verb runas}
        1 {"You selected No."}
        2 {Start-Process powershell.exe -Credential $(Get-Credential)}
    }
}

Clear-Host