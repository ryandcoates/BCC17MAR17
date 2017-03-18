<# Windows Powershell <3 @ Boise Code Camp 2017
.FILE Demo2-AutomateTheBoringThings.ps1
.AUTHOR Ryan Coates
.LINK https://github.com/ryandcoates/BCC17MAR17

#>
# I already have Node installed, but you can deploy it with a few words
#cinst nodejs -y

# Lets make a project scaffold generator in PowerShell
function New-NodeProject {
    Param (
    [Parameter()][String]$Name
    )

    $CodeRoot = 'C:\Data\Code'
    $ProjectPath = (Join-Path -Path $CodeRoot -ChildPath $Name)

    $Modules = @(
    'bootstrap'
    'jquery'
    )
    
    If (Test-Path $ProjectPath){
        Write-Error "Path already exists, we won't mess with that"
        break
    }

    Else {
        New-Item $ProjectPath -ItemType Directory
        Set-Location $ProjectPath

        Invoke-Command {npm init -y} | Out-Null
        ForEach ($module in $Modules){
            Invoke-Command {npm install $module --silent} | Out-Null
        }
    }
    $ProjectPath
}

function Make-Code {
    Param(
    [Parameter(Mandatory=$True)][String]$Name,
    [ValidateSet('Node','Python','Ruby')]
    [Parameter(Mandatory=$True)][String]$Language
    )

    If ($Language -eq "Node"){
        $path = New-NodeProject -Name $Name
        Set-Location $path[1]
        
        invoke-command {git init}
        invoke-command {git add .}
        invoke-command {git commit -m "Initial commit"}
        $gh = New-GitHubRepository -Name $Name
        #$gh.clone = 'https://github.com/ryandcoates/test.git'

        git remote add origin $gh.clone
        git push -u origin master


    }

    Elseif ($Language -eq "Python"){
        Write-Warning "Not Done yet, code more"
    }

     Elseif ($Language -eq "Ruby"){
        Write-Warning "Not Done yet, code more"
    }
}
Set-Location C:\Data\BCC17MAR17
. ./function-New-GitHubRepo.ps1
$gitToken = Import-Clixml .\gitToken.xml
