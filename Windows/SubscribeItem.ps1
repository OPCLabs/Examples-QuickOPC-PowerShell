# $Header: $
# Copyright (c) CODE Consulting and Development, s.r.o., Plzen. All rights reserved.

#requires -Version 5.1
using namespace OpcLabs.EasyOpc.DataAccess

# The path below assumes that the current directory is [ProductDir]/Examples-NET/PowerShell/Windows .
Add-Type -Path "../../../Components/net472/OpcLabs.EasyOpcClassicCore.dll"
Add-Type -Path "../../../Components/net472/OpcLabs.EasyOpcClassic.dll"

# Create EasyOPC-DA component 
$client = New-Object EasyDAClient

# Hook events
# Note: See other examples for proper error handling  practices!
Register-ObjectEvent -InputObject $client -EventName ItemChanged -Action { Write-Host $EventArgs }

# Subscribe
$client.SubscribeItem("", "OPCLabs.KitServer.2", "Demo.Single", 1000)

# Wait for 1 minute
$stopwatch =  [System.Diagnostics.Stopwatch]::StartNew() 
while ($stopwatch.Elapsed.TotalSeconds -lt 60) {    
    Start-Sleep -Seconds 1
}

# Unsubscribe
$client.UnsubscribeAllItems

 