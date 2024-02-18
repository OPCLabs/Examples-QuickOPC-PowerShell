# $Header: $
# Copyright (c) CODE Consulting and Development, s.r.o., Plzen. All rights reserved.

#region Example
# This example shows how to let the user browse for an OPC-UA data node
# (a Data Variable or a Property).
#
# Find all latest examples here: https://opclabs.doc-that.com/files/onlinedocs/OPCLabs-OpcStudio/Latest/examples.html .

using namespace OpcLabs.EasyOpc.UA.Forms.Browsing

# The path below assumes that the current directory is [ProductDir]/Examples-NET/PowerShell/Windows .
Add-Type -Path "../../../Components/Opclabs.QuickOpc/net472/OpcLabs.EasyOpcForms.dll"

# Instantiate the dialog object.
$dataDialog = New-Object UADataDialog
$dataDialog.EndpointDescriptor.UrlString = "http://opcua.demo-this.com:51211/UA/SampleServer"
$dataDialog.UserPickEndpoint = $true

$dialogResult = $dataDialog.ShowDialog()
if ($dialogResult -ne [System.Windows.Forms.DialogResult]::OK) {
    return
}

# Display results
Write-Host "EndpointDescriptor: $($dataDialog.EndpointDescriptor)"
Write-Host "NodeElement: $($dataDialog.NodeElement)"

#endregion Example
