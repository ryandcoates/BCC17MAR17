# Demo 1: Using PowerShell
cls

#region Cmdlet Structure
    #All the Things
    Get-Command
    $commands = Get-Command
    $commands | Measure-Object
    
    # Ok maybe not
    Get-Command -Module AzureRM.Compute
    $lesscommands = Get-Command -Module AzureRM.Compute
    $lesscommands | Measure-Object
#endregion

#region Operators
    
    # add
    1 + 2

    # multiply
    2 * 5

    # div
    10 / 10

    # subtract
    10 - 2

    # modulo
    10 % 3

    # clever stuff
    [Math]::e
    [Math]::pi

    $Area = [math]::pi * 2 * 2
    $Area

    [Math]::Pow(2,32)
#endregion

#region Loops
    #For loop, writing from 1 to 10 in console
    $Services2 = Get-Service
    for($i=1; $i -le 10; $i++){Write-Output $Services2[$i]}
    
    
    #Foreach loop, iterating all services and outputting true/false depending on each service's status
    for($service in Get-Service){
        Write-Output " $($service.name) is $($service.Status)"
        }
    
    #While loop, iterating from $val, halting when $val is 10
    $val = 0
    while($val -ne 10) { $val++ ; Write-Host $val }
    
    1 + 1 * 10
#endregion

#region Filters
    Get-Service | Where-Object{$_.Status -eq "Stopped"}
    Get-Service | ?{(($_.Status -eq "Stopped") -and ($_.StartType -eq "Automatic"))}
    Get-Service | ?{$_.name -like "r*"}
#endregion

#region Pipeline...

    Get-Service -Name 'Bits'
    Get-Service -name 'Bits' | Start-Service
    Get-Service -Name 'Bits'
    Get-Service -Name 'Bits' | Stop-Service

#endregion

#region Profile
$Profile

Test-Path $Profile

New-Item $Profile
Code $Profile

#endregion

#region fun
Add-Type -AssemblyName System.speech
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer


$speak.Speak("I'm sorry, Dave. I'm afraid I can't do that. ")


$speak.GetInstalledVoices().VoiceInfo
$speak.SelectVoice('Microsoft Zira Desktop')
$speak.Speak("The Enrichment Center promises to always provide a safe testing environment.")


#endregion``

#region Chocolatey
iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex

$apps = @(
'autohotkey'
'git'
'7zip'
)

ForEach ($app in $apps){
    cinst $app -y
}

#endregion

#region OneGet
Find-Module *Excel*
Install-Module ImportExcel

Get-PSRepository
Set-PSRepository -Name PSGallery -InstallationPolicy Untrusted
Get-PSRepository

Install-Module dbatools

#endregion

#region Excel automation
get-process | Where Company | Export-Excel `
                                -Path C:\temp\process.xlsx `
                                -Show -IncludePivotTable -PivotRows Company `
                                -PivotData @{Handles="sum"} `
                                -IncludePivotChart -ChartType PieExploded3D
#endregion