# $Header: $
# Copyright (c) CODE Consulting and Development, s.r.o., Plzen. All rights reserved.

#requires -Version 5.1
using namespace OpcLabs.EasyOpc.UA

# The path below assumes that the current directory is [ProductDir]/Examples-NET/PowerShell/Windows .
Add-Type -Path "../../../Components/net472/OpcLabs.EasyOpcUA.dll"

# Create EasyOPC-UA component 
$client = New-Object EasyUAClient

# Read node value and display it
# Note: An exception can be thrown from the statement below in case of failure. See other examples for proper error 
# handling  practices!
$client.ReadValue("opc.tcp://opcua.demo-this.com:51210/UA/SampleServer", "nsu=http://test.org/UA/Data/ ;i=10853")
