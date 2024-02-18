# $Header: $
# Copyright (c) CODE Consulting and Development, s.r.o., Plzen. All rights reserved.

#region Example
# This example shows how to let the user browse for a host (computer) and
# an endpoint of an OPC-UA server residing on it.
#
# Find all latest examples here: https://opclabs.doc-that.com/files/onlinedocs/OPCLabs-OpcStudio/Latest/examples.html .

using namespace OpcLabs.EasyOpc.UA.Forms.Browsing

# The path below assumes that the current directory is [ProductDir]/Examples-NET/PowerShell/Windows .
Add-Type -Path "../../../Components/Opclabs.QuickOpc/net472/OpcLabs.EasyOpcForms.dll"

# Instantiate the dialog object.
$hostAndEndpointDialog = New-Object UAHostAndEndpointDialog
$hostAndEndpointDialog.EndpointDescriptor.Host = "opcua.demo-this.com"

$dialogResult = $hostAndEndpointDialog.ShowDialog()
if ($dialogResult -ne [System.Windows.Forms.DialogResult]::OK) {
    return
}

# Display results
$hostElement = $hostAndEndpointDialog.HostElement
if ($hostElement -ne $null) {
    Write-Host "HostElement: $($hostElement)"
}
$discoveryElement = $hostAndEndpointDialog.DiscoveryElement
if ($discoveryElement -ne $null) {
    Write-Host "DiscoveryElement: $($discoveryElement)"
}

#endregion Example
