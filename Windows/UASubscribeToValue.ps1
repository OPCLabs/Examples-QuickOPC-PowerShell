# $Header: $
# Copyright (c) CODE Consulting and Development, s.r.o., Plzen. All rights reserved.

#requires -Version 5.1
using namespace OpcLabs.EasyOpc.UA

# The path below assumes that the current directory is [ProductDir]/Examples-NET/PowerShell/Windows .
Add-Type -Path "../../../Components/net472/OpcLabs.EasyOpcUA.dll"

# Create EasyOPC-UA component 
$client = New-Object EasyUAClient

# Hook events
# Note: See other examples for proper error handling  practices!
Register-ObjectEvent -InputObject $client -EventName DataChangeNotification -Action { Write-Host $EventArgs }

# Subscribe
$handle = $client.SubscribeDataChange("opc.tcp://opcua.demo-this.com:51210/UA/SampleServer", "nsu=http://test.org/UA/Data/ ;i=10853", 100)

# Process events
$stopwatch =  [System.Diagnostics.Stopwatch]::StartNew() 
while ($stopwatch.Elapsed.TotalSeconds -lt 20) {    
    Start-Sleep -Seconds 1
}

# Unsubscribe from monitored item changes
$client.UnsubscribeMonitoredItem($handle)
