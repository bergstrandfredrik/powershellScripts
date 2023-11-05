<# Using Invoke Command to install on a remote computer #>

    # Save the credential (Variable)
$creds = Get-Credential

    # Setup winrm quickconfig on remote computer
Invoke-Command -ComputerName WinSrv -ScriptBlock{winrm quickconfig}

    # Install Notepad ++ on remote computer with winget
Invoke-Command -ComputerName WinSrv -ScriptBlock{winget install -e --id Notepad++.Notepad++}

    # Try the variable
$creds

