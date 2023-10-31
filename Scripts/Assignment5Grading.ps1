# PS Module Requirements
# - Az.ApiMangement v.4.0.2
# - Az.Functions v.4.0.6
# - Az.Monitor v3.0.1
# - Az.OperationalInsights 3.2.0

$SubscriptionId = "d00af0f7-1cd6-4415-b760-3ad7fc274cbf"
$ResourceGroup = "test-rg"
$VnetName = ""
$CosmosDbAccountName = "cosmosassn5"
$CosmosPrivateEndpointName = "cosmos-pe"
$ServiceBusNamespaceName = "sbjcassn5"
$ServiceBusTopicName = "tst-topic"
$ServiceBusSubscriptionName = "tst-sub"


$RequirementsMet = 0
$TotalRequirements = 12
 
# You'll manually have to log in twice here (prompts should pop up in a browser and a PowerShell window)
az login 
Connect-AzAccount
Set-AzContext -Subscription $SubscriptionId

$VnetResult = Get-AzVirtualNetwork -Name $VnetName -ResourceGroupName $ResourceGroup 
if($VnetResult){
    $RequirementsMet++
       Write-Host "Successfully found the Virtual Network"
   }
   else {
       Write-Host "Failed to find the Virtual Network"
}

$CosmosDbAccountResult = Get-AzCosmosDBAccount -ResourceGroupName $ResourceGroup -Name $CosmosDbAccountName
if($CosmosDbAccountResult){
    $RequirementsMet++
       Write-Host "Successfully found the Cosmos Db Account"
   }
   else {
       Write-Host "Failed to find the Cosmos Db Account"
}

$CosmosEndpointResult = Get-AzPrivateEndpoint -Name $CosmosPrivateEndpointName -ResourceGroupName $ResourceGroup
$CosmosEndpointConnectionResult = Get-AzPrivateEndpointConnection -PrivateLinkResourceId "/subscriptions/$SubscriptionId/resourceGroups/$ResourceGroup/providers/Microsoft.DocumentDB/databaseAccounts/$CosmosDbAccountName"

if($CosmosEndpointResult -and $CosmosEndpointConnectionResult.Name -like $CosmosPrivateEndpointName){
    $RequirementsMet++
       Write-Host "Successfully found the Cosmos Db Account Private Endpoint"
   }
   else {
       Write-Host "Failed to find the Cosmos Db Account Private Endpoint"
}

if($CosmosDbAccountResult.PublicNetworkAccess -like "Disabled"){
    $RequirementsMet++
       Write-Host "Successfully found that the Cosmos Db Account is private"
   }
   else {
       Write-Host "Failed to find that the Cosmos Db Account is private"
}

Write-Host "Requirements Met on Assignment $RequirementsMet/$TotalRequirements"