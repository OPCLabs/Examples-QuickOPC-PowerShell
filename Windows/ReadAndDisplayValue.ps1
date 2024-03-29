# $Header: $
# Copyright (c) CODE Consulting and Development, s.r.o., Plzen. All rights reserved.

#requires -Version 5.1
using namespace OpcLabs.EasyOpc.DataAccess

# The path below assumes that the current directory is [ProductDir]/Examples-NET/PowerShell/Windows .
Add-Type -Path "../../../Components/net472/OpcLabs.EasyOpcClassicCore.dll"
Add-Type -Path "../../../Components/net472/OpcLabs.EasyOpcClassic.dll"

# Create EasyOPC-DA component 
$client = New-Object EasyDAClient

# Read item value and display it
# Note: An exception can be thrown from the statement below in case of failure. See other examples for proper error 
# handling  practices!
$client.ReadItemValue("", "OPCLabs.KitServer.2", "Demo.Single")
