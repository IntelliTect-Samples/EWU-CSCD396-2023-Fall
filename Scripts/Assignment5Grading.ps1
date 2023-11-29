# PS Module Requirements
# - Az.Accounts v.2.14.1
# - Az.CosmosDB v.1.5.0
# - Az.Network v6.2.0
# - Az.RedisCache v1.8.0
# - Az.ServiceBus v3.0.0

$SubscriptionId = "4b0e8ef1-c58c-47af-a570-74e48f584391"
$ResourceGroup = "Assignment5"
$VnetName = "Gandalf"
$CosmosDbAccountName = "elrond"
$CosmosPrivateEndpointName = "rivendale"
$WebAppName = "the-fellowship"
$WebAppPrivateEndpointName = "smeagle"
$RedisCacheName = "galadriel"
$RedisCachePrivateEndpointName = "prancing-pony"
$ServiceBusNamespaceName = "gondor"
$ServiceBusTopicName = "third-age"
$ServiceBusSubscriptionName = "rohan"

$RequirementsMet = 0
$TotalRequirements = 13
 
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

if($CosmosEndpointResult -and $CosmosEndpointConnectionResult.Name -like $CosmosPrivateEndpointName  + "*"){
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

$RedisCacheResult = Get-AzRedisCache -Name $RedisCacheName -ResourceGroupName $ResourceGroup
if($RedisCacheResult) {
    $RequirementsMet++
       Write-Host "Successfully found the Redis Cache"
   }
   else {
       Write-Host "Failed to find the Redis Cache"
}

$WebAppResult = az webapp show -n $WebAppName --resource-group $ResourceGroup --query name -o tsv
if ($WebAppResult) {
    $RequirementsMet++
    Write-Host "Successfully found the Azure Web App through az cli"
}
else {
    Write-Host "Failed to find the Azure Web App through az cli"
}
$expectedValue = $RedisCacheName + ".redis.cache.windows.net,abortConnect=false,ssl=true,allowAdmin=true,password=*"

$appSettingResult = az webapp config appsettings list -n $WebAppName --resource-group $ResourceGroup | ConvertFrom-Json 
$appSettingValue = $appSettingResult | Where-Object { $_.name -like 'CacheConnection' } | Select-Object -ExpandProperty value
if ($appSettingValue -like $expectedValue ) {
    $RequirementsMet++
    Write-Host "Successfully found web app setting with redis cache reference"
}
else {
    Write-Host "Failed to find web app setting with redis cache reference"
}

$WebAppEndpointResult = Get-AzPrivateEndpoint -Name $WebAppPrivateEndpointName -ResourceGroupName $ResourceGroup
$WebAppEndpointConnectionResult = Get-AzPrivateEndpointConnection -PrivateLinkResourceId "/subscriptions/$SubscriptionId/resourceGroups/$ResourceGroup/providers/Microsoft.Web/sites/$WebAppName"

if($WebAppEndpointResult -and $WebAppEndpointConnectionResult.Name -like $WebAppPrivateEndpointName + "*"){
    $RequirementsMet++
       Write-Host "Successfully found the Web App Private Endpoint"
   }
   else {
       Write-Host "Failed to find the Web App Private Endpoint"
}

$WebAppPublicAccessResult = az resource show --resource-group $ResourceGroup --name $WebAppName --resource-type "Microsoft.Web/sites" --query properties.publicNetworkAccess -o tsv
if ($WebAppPublicAccessResult -like "Disabled") {
    Write-Host "Successfully found web app public access set to disabled"
    $RequirementsMet++
}
else {
    Write-Host "Failed to find web app public access set to disabled"
}

$RedisCacheEndpointResult = Get-AzPrivateEndpoint -Name $RedisCachePrivateEndpointName -ResourceGroupName $ResourceGroup
$RedisCacheEndpointConnectionResult = Get-AzPrivateEndpointConnection -PrivateLinkResourceId "/subscriptions/$SubscriptionId/resourceGroups/$ResourceGroup/providers/Microsoft.Cache/Redis/$RedisCacheName"

if($RedisCacheEndpointResult -and $RedisCacheEndpointConnectionResult.Name -like $RedisCachePrivateEndpointName  + "*"){
    $RequirementsMet++
       Write-Host "Successfully found the Redis Cache Private Endpoint"
   }
   else {
       Write-Host "Failed to find the Redis Cache Private Endpoint"
}

$ServiceBusNamespaceResult = Get-AzServiceBusNamespace -NamespaceName $ServiceBusNamespaceName -ResourceGroupName $ResourceGroup
if ($ServiceBusNamespaceResult) {
    $RequirementsMet++
    Write-Host "Successfully found the Service Bus Namespace"
}
else {
    Write-Host "Failed to find the Service Bus Namespace"
}

$ServiceBusTopicResult = Get-AzServiceBusTopic -ResourceGroupName $ResourceGroup -NamespaceName $ServiceBusNamespaceName -TopicName $ServiceBusTopicName
if ($ServiceBusTopicResult) {
    $RequirementsMet++
    Write-Host "Successfully found the Service Bus Topic"
}
else {
    Write-Host "Failed to find the Service Bus Topic"
}

$ServiceBusSubscriptionResult = Get-AzServiceBusSubscription -ResourceGroupName $ResourceGroup -NamespaceName $ServiceBusNamespaceName -TopicName $ServiceBusTopicName -Name $ServiceBusSubscriptionName
if ($ServiceBusSubscriptionResult) {
    $RequirementsMet++
    Write-Host "Successfully found the Service Bus Topic Subscription"
}
else {
    Write-Host "Failed to find the Service Bus Topic Subscription"
}

Write-Host "Requirements Met on Assignment $RequirementsMet/$TotalRequirements"