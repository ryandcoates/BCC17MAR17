# Demo 2: System monitoring
cls

#region Easy Stuff

Get-Host
#endregion

#region WMI
Get-WMIObject -Class Win32_OperatingSystem | Select CSName, SerialNumber, Name
#endregion


#region Beautification

#end region


