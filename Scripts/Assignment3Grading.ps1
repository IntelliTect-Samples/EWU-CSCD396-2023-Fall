# PS Module Requirements
# - Az.Accounts v.2.12.2
# - Az.EventHub v2.1.0
# - Az.EventGrid 1.6.0
# - Az.ContainerRegistry v3.0.0
# - Az.ContainerInstance v2.1.0

# $SubscriptionId = ""
# $ResourceGroup = ""
# $EventGridAppUrl = ""
# $VirtualMachineName = ""
# $ContainerRegistryName = ""
# $ContainerRegistryPassword = ""
# $EventHubNamespaceName = ""
# $EventHubName = ""
# $EventGridSystemTopicName = ""
# $ContainerGroupName = ""


$RequirementsMet = 0
$TotalRequirements = 10


# You'll manually have to log in twice here (prompt should pop up in a browser)
Connect-AzAccount
Set-AzContext -Subscription $SubscriptionId
$token = (Get-AzAccessToken).Token

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
    Write-Host "Successfully connected to the Container Registry"
}
else {
    Write-Host "Failed to connect to the Container Registry"
}
$headers = @{
    "Authorization" = "Bearer $token"
}

$AcrServer = "$ContainerRegistryName.azurecr.io"
$ImagePullV1Result = docker pull $AcrServer/hello-world:v1
if ($ImagePullV1Result -Like "*v1: Pulling from hello-world*") {
    $RequirementsMet++
    Write-Host "Successfully pulled hello-word:v1 image"
}
else {
    Write-Host "Failed to pull hello-word:v1 image"
}

$headers = @{
    "Authorization" = "Bearer $token"
}
$WebResult = Invoke-WebRequest -Uri $EventGridAppUrl -Headers $headers
# Check the response

if ($WebResult.StatusCode -eq 200) {
    Write-Host "Successfully accessed the Event Grid Web App URL."
    # You can access the content of the response using $response.Content
    $RequirementsMet++
}
else {
    Write-Host "Failed to access the Event Grid Web App URL. Status code: $($response.StatusCode)"
    # You can handle errors as needed
}

$EventGridSystemTopicResult = Get-AzEventGridSystemTopic -ResourceGroup $ResourceGroup -Name $EventGridSystemTopicName
if ($EventGridSystemTopicResult) {
    $RequirementsMet++
    Write-Host "Successfully found the event grid system topic"
}
else {
    Write-Host "Failed to find the event grid system topic"
}

$ImagePullV2Result = docker pull $AcrServer/hello-world:v2
if ($ImagePullV2Result -Like "*v2: Pulling from hello-world*") {
    $RequirementsMet++
    Write-Host "Successfully pulled hello-word:v2 image"
}
else {
    Write-Host "Failed to pull hello-word:v2 image"
}

$EventSubscriptionResult = Get-AzEventGridSystemTopicEventSubscription -ResourceGroup $ResourceGroup -SystemTopicName $EventGridSystemTopicName
if($EventSubscriptionResult-AND $EventSubscriptionResult.PsEventSubscriptionsList[0].Endpoint -like "*azurewebsites.net/api/updates*") {
    $RequirementsMet++
    Write-Host "Successfully found the correctly configured event grid event subscription"
}
else {
    Write-Host "Failed to find the correctly configured event grid event subscription"
}

$ContainerGroupResult = Get-AzContainerGroup -ResourceGroupName $ResourceGroup -Name $ContainerGroupName
if($ContainerGroupResult){
 $RequirementsMet++
    Write-Host "Successfully found the container group"
}
else {
    Write-Host "Failed to find the container group"
}

$EventHubNamespaceResult = Get-AzEventHubNamespace -ResourceGroupName $ResourceGroup -NamespaceName $EventHubNamespaceName 
if($EventHubNamespaceResult){
    $RequirementsMet++
       Write-Host "Successfully found the event hub namespace"
   }
   else {
       Write-Host "Failed to find the event hub namespace"
}

$EventHubResult = Get-AzEventHub -ResourceGroupName $ResourceGroup -NamespaceName $EventHubNamespaceName -EventHubName $EventHubName
if($EventHubResult){
    $RequirementsMet++
       Write-Host "Successfully found the event hub within the namespace"
   }
   else {
       Write-Host "Failed to find the event hub within the namespace"
}

Write-Host "Requirements Met on Assignment $RequirementsMet/$TotalRequirements"