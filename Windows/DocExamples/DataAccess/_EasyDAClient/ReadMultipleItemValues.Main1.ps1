﻿# $Header: $
# Copyright (c) CODE Consulting and Development, s.r.o., Plzen. All rights reserved.

#region Example
# This example shows how to read values of 4 items at once, and display them.
#
# Find all latest examples here: https://opclabs.doc-that.com/files/onlinedocs/OPCLabs-OpcStudio/Latest/examples.html .

#requires -Version 5.1
using namespace OpcLabs.EasyOpc.DataAccess

# The path below assumes that the current directory is [ProductDir]/Examples-NET/PowerShell/Windows .
Add-Type -Path "../../../Components/Opclabs.QuickOpc/net472/OpcLabs.EasyOpcClassicCore.dll"
Add-Type -Path "../../../Components/Opclabs.QuickOpc/net472/OpcLabs.EasyOpcClassic.dll"
Add-Type -Path "../../../Components/Opclabs.QuickOpc/net472/OpcLabs.EasyOpcClassicComponents.dll"

# Instantiate the client object.
$client = New-Object EasyDAClient

$valueResults = [IEasyDAClientExtension]::ReadMultipleItemValues($client, 
    "OPCLabs.KitServer.2", @(
        (New-Object DAItemDescriptor("Simulation.Random")),
        (New-Object DAItemDescriptor("Trends.Ramp (1 min)")),
        (New-Object DAItemDescriptor("Trends.Sine (1 min)")),
        (New-Object DAItemDescriptor("Simulation.Register_I4"))
        ))

for ($i = 0; $i -lt $valueResults.Length; $i++) {
    $valueResult = $valueResults[$i]
    if ($valueResult.Succeeded) {
        Write-Host "valueResults($($i)).Value: $($valueResult.Value)"
    }
    else {
        Write-Host "valueResults($($i)) *** Failure: $($valueResult.ErrorMessageBrief)"
    }
}


# Example output:
#
#valueResults(0).Value: 0.00125125888851588
#valueResults(1).Value: 0.732510924339294
#valueResults(2).Value: -0.993968485238202
#valueResults(3).Value: 0

#endregion Example
