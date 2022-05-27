Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

$packageListName = 'package_list.json'
$programs = (Get-Content -Raw -Path $packageListName | ConvertFrom-Json).list
$listOk = @()
$someFailed = $false
$choice = $null

Write-Host " 
  █████   █████  ███   ██  ██████ ████████  ██   ██ ███████ ██████      ██ ███    ██ ███████ ████████  █████ ██       ██       █████████████  
██   ██ ██   ██ ████   ██ ██    ██    ██    ██   ██ ██      ██   ██     ██ ████   ██ ██         ██    ██   ██ ██      ██      ██      ██   ██ 
███████ ███████ ██ ██  ██ ██    ██    ██    ███████ █████   ██████      ██ ██ ██  ██ ███████    ██    ███████ ██      ██      █████   ██████  
██   ██ ██   ██ ██  ██ ██ ██    ██    ██    ██   ██ ██      ██   ██     ██ ██  ██ ██      ██    ██    ██   ██ ██      ██      ██      ██   ██ 
██   ██ ██   ██ ██   ████  ██████     ██    ██   ██ ███████ ██   ██     ██ ██   ████ ███████    ██    ██   ██ ███████ ███████ ███████ ██   ██ 
                                                                                                                                              
                                                                                                                                              
                                                                                                                                                 " -ForegroundColor Red

function startProccess{
    Write-Output "`nChecking packages...`n"
    foreach($i in $programs){
        $result = choco find $i
        if($result.Length -gt 2){
            $listOk = $listOk + $i
            $i + ' - Package found very poggers!' 
        }else{
            $someFailed = $true
            $i + ' - Failed to find very not poggers.'
        }
    }
    Write-Output "`n"

    if($someFailed){
        Write-Warning "Failed to find some packages"

        while ($choice -notmatch "[y|n]"){
            $choice = Read-Host "Are you sure you want to continue with the installation (y/n):"
        }
    }

    $hasUserAccepted = $null -eq $continue -or $continue -eq 'y'

    if($hasUserAccepted){
        startInstallation
    }
    else{
        Write-Error "Please verify your packages and try again!"
    }
}


function progressBar{
    param($percent)
    Write-Progress -Activity 'Installation in progress' -PercentComplete $percent
}


function install{
    param($item)
    choco install $item -y --acceptlicense --force
}


function startInstallation{
    try{
        Write-Output "Now starting installation`n"
        for ($i = 1; $i -le $listOk.length; $i++){
            progressBar(($i/$listOk.length*100))
            install($listOk[$i - 1])
        }
    }
    catch{
        Write-Error "Failure to install packages"
    }
}


startProccess