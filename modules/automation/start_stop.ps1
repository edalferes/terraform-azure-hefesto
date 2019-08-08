Param(
 [string]$VmName,
 [string]$ResourceGroupName,
 [ValidateSet("Start", "Stop")]
 [string]$VmAction
)
# Authenticate to automation account
$Conn = Get-AutomationConnection -Name AzureRunAsConnection
Add-AzureRMAccount -ServicePrincipal -Tenant $Conn.TenantID `
-ApplicationID $Conn.ApplicationID -CertificateThumbprint $Conn.CertificateThumbprint
# Start VM
IF ($VmAction -eq "Start") {
    Start-AzureRmVM -Name $VmName -ResourceGroupName $ResourceGroupName
}
# Stop VM
IF ($VmAction -eq "Stop") {
    Stop-AzureRmVM -Name $VmName -ResourceGroupName $ResourceGroupName -Force
}