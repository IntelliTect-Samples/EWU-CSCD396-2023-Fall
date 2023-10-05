$SubscriptionId = "d00af0f7-1cd6-4415-b760-3ad7fc274cbf"
$ResourceGroup = "test-rg"
$EventHubEndpoint = ""
$VirtualMachineName = "assn3vm"
$ContainerRegistryName = "assn3acr"
$ContainerRegistryPassword = "OfOvuo2nsJ3/wtE3ArkfxMTR/Bjm7uJgILpDJtfMgK+ACRBs63Fn"


$RequirementsMet = 0
$TotalRequirements = 10

Connect-AzAccount
Set-AzContext -Subscription $SubscriptionId

$VmResult = Get-AzVM -Name $VirtualMachineName -ResourceGroupName $ResourceGroup
if ($VmResult) {
    $RequirementsMet++
    Write-Host "Successfully found the Virtual Machine"
}
else {
    Write-Host "Failed to find the Virtual Machine"
}

$RegistryResult = Get-AzContainerRegistry -ResourceGroupName $ResourceGroup -Name $ContainerRegistryName
if ($RegistryResult) {
    $RequirementsMet++
    Write-Host "Successfully found the Container Registry"
}
else {
    Write-Host "Failed to find the Container Registry"
}

$ConnectionResult = Connect-AzContainerRegistry -Name $ContainerRegistryName -UserName $ContainerRegistryName -Password $ContainerRegistryPassword
if ($ConnectionResult) {
    $RequirementsMet++
    Write-Host "Successfully connected to the Container Registry"
}
else {
    Write-Host "Failed to connect to the Container Registry"
}




Write-Host "Requirements Met on Assignment $RequirementsMet/$TotalRequirements"