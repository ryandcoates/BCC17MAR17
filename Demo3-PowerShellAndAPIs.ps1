<# Windows Powershell <3 @ Boise Code Camp 2017
.FILE Demo3-PowerShellAndAPIs.ps1
.AUTHOR Ryan Coates
.LINK https://github.com/ryandcoates/BCC17MAR17

#>
cls

#region RonSwanson
 Invoke-RestMethod -Uri 'http://ron-swanson-quotes.herokuapp.com/v2/quotes'

 Invoke-RestMethod -Uri 'http://ron-swanson-quotes.herokuapp.com/v2/quotes'

 $ronquotes = Invoke-RestMethod -Uri 'http://ron-swanson-quotes.herokuapp.com/v2/quotes/100'
 $ronquotes | Get-Random

 $ronquotes | Export-Clixml ./RonQuotes.xml

 cp ./QuoteProfile.ps1 $profile

#endregion
cls

#region New-GitHubRepo
# New-GitHubRepository function created and documented by Jeff Hicks, Powershell MVP and legend
# http://jdhitsolutions.com/blog/powershell/5373/creating-a-github-repository-from-powershell

ise .\function-New-GitHubRepo.ps1
. .\function-New-GitHubRepo.ps1

New-GitHubRepository -Name BCC17MAR17-Demo -AutoInitialize -Verbose
# Refresh your browser
#endregion
cls
