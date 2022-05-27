
## The following four lines only need to be declared once in your script.
$yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes","Description."
$no = New-Object System.Management.Automation.Host.ChoiceDescription "&No","Description."
$cancel = New-Object System.Management.Automation.Host.ChoiceDescription "&Cancel","Description."
$options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no, $cancel)



$runDebloatScipt = '.\Windows10SysPrepDebloater.ps1'
Invoke-Expression $runDebloatScipt

Start-Sleep -Seconds 10

Write-Host " 

██████  ███████ ██████  ██       ██████   █████  ████████ ██ ███    ██  ██████  
██   ██ ██      ██   ██ ██      ██    ██ ██   ██    ██    ██ ████   ██ ██       
██   ██ █████   ██████  ██      ██    ██ ███████    ██    ██ ██ ██  ██ ██   ███ 
██   ██ ██      ██   ██ ██      ██    ██ ██   ██    ██    ██ ██  ██ ██ ██    ██ 
██████  ███████ ██████  ███████  ██████  ██   ██    ██    ██ ██   ████  ██████  
                                                                                
                                                                                "

$runActualScript = '.\Windows10DebloaterGUI.ps1'
Invoke-Expression $runActualScript

$msgBoxInput = Add-Type -AssemblyName System.Windows.Forms
[System.Windows.MessageBox]::Show('Installation Complete!') 

Start-Sleep -Seconds 5

Write-Host "

██████   ██████  ███    ██ ███████ 
██   ██ ██    ██ ████   ██ ██      
██   ██ ██    ██ ██ ██  ██ █████   
██   ██ ██    ██ ██  ██ ██ ██      
██████   ██████  ██   ████ ███████ 
                                   
                                   "