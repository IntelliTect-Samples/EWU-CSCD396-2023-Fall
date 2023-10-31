# PS Module Requirements
# - Az.Accounts v.2.12.2
# - Az.EventHub v2.1.0
# - Az.EventGrid 1.6.0
# - Az.ContainerRegistry v3.0.0
# - Az.ContainerInstance v2.1.0

$SubscriptionId = "60c417aa-8e31-4d83-91a9-ce7319e2ee87"
$ResourceGroup = "rg3"
$EventGridAppUrl = "https://r3sit.azurewebsites.net/" 
$VirtualMachineName = "r3VM" 
$ContainerRegistryName = "rg3reg95"
$ContainerRegistryPassword = "EnUca4dZdNrmD4hvJSIkZcoh0CzRwG9Ge0iO2aXNth+ACRAmSyRo"
$EventHubNamespaceName = "r3namespace"
$EventHubName = "r3eventhub"
$EventGridSystemTopicName = "r3reg95-bfe0fd34-bca8-4015-8a1e-676771208312"
$ContainerGroupName = "r3quest4container"


$RequirementsMet = 0
$TotalRequirements = 10

Connect-AzAccount
Set-AzContext -Subscription $SubscriptionId
$token = (Get-AzAccessToken).Token

$VmResult = Get-AzVM -Name $VirtualMachineName -ResourceGroupName $ResourceGroup
if ($VmResult) {
    $RequirementsMet++
    Write-Host "Successfully found the Virtual Machine 1/10"
}
else {
    Write-Host "Failed to find the Virtual Machine"
}

$RegistryResult = Get-AzContainerRegistry -ResourceGroupName $ResourceGroup -Name $ContainerRegistryName
if ($RegistryResult) {
    $RequirementsMet++
    Write-Host "Successfully found the Container Registry 2/10"
}
else {
    Write-Host "Failed to find the Container Registry Q2"
}

$ConnectionResult = Connect-AzContainerRegistry -Name $ContainerRegistryName -UserName $ContainerRegistryName -Password $ContainerRegistryPassword
if ($ConnectionResult) { 
    Write-Host "Successfully connected to the Container Registry 3/10"
}
else {
    Write-Host "Failed to connect to the Container Registry Q3"
}
$headers = @{
    "Authorization" = "Bearer $token"
}

$AcrServer = "$ContainerRegistryName.azurecr.io"
$ImagePullV1Result = docker pull $AcrServer/hello-world:v1
if ($ImagePullV1Result -Like "*v1: Pulling from hello-world*") {
    $RequirementsMet++
    Write-Host "Successfully pulled hello-word:v1 image 4/10"
}
else {
    Write-Host "Failed to pull hello-word:v1 image Q4"
}

$headers = @{
    "Authorization" = "Bearer $token"
}
$WebResult = Invoke-WebRequest -Uri $EventGridAppUrl -Headers $headers
# Check the response

if ($WebResult.StatusCode -eq 200) {
    Write-Host "Successfully accessed the Event Grid Web App URL. 5/10"
    # You can access the content of the response using $response.Content
    $RequirementsMet++
}
else {
    Write-Host "Failed to access the Event Grid Web App URL. Status code: $($response.StatusCode) Q5"
    # You can handle errors as needed
}

$EventGridSystemTopicResult = Get-AzEventGridSystemTopic -ResourceGroup $ResourceGroup -Name $EventGridSystemTopicName
if ($EventGridSystemTopicResult) {
    $RequirementsMet++
    Write-Host "Successfully found the event grid system topic 6/10"
}
else {
    Write-Host "Failed to find the event grid system topic Q6"
}

$ImagePullV2Result = docker pull $AcrServer/hello-world:v2
if ($ImagePullV2Result -Like "*v2: Pulling from hello-world*") {
    $RequirementsMet++
    Write-Host "Successfully pulled hello-word:v1 image 7/10"
}
else {
    Write-Host "Failed to pull hello-word:v2 image Q7"
}

$EventSubscriptionResult = Get-AzEventGridSystemTopicEventSubscription -ResourceGroup $ResourceGroup -SystemTopicName $EventGridSystemTopicName
if($EventSubscriptionResult-AND $EventSubscriptionResult.PsEventSubscriptionsList[0].Endpoint -like "*azurewebsites.net/api/updates*") {
    $RequirementsMet++
    Write-Host "Successfully found the correctly configured event grid event subscription 8/10"
}
else {
    Write-Host "Failed to find the correctly configured event grid event subscription Q8"
}

$ContainerGroupResult = Get-AzContainerGroup -ResourceGroupName $ResourceGroup -Name $ContainerGroupName
if($ContainerGroupResult){
 $RequirementsMet++
    Write-Host "Successfully found the container group 9/10"
}
else {
    Write-Host "Failed to find the container group Q9"
}

$EventHubNamespaceResult = Get-AzEventHubNamespace -ResourceGroupName $ResourceGroup -NamespaceName $EventHubNamespaceName 
if($EventHubNamespaceResult){
    $RequirementsMet++
       Write-Host "Successfully found the event hub namespace 10/10"
   }
   else {
       Write-Host "Failed to find the event hub namespace Q10"
}

$EventHubResult = Get-AzEventHub -ResourceGroupName $ResourceGroup -NamespaceName $EventHubNamespaceName -EventHubName $EventHubName
if($EventHubResult){
    $RequirementsMet++
       Write-Host "Successfully found the event hub within the namespace 11/10"
   }
   else {
       Write-Host "Failed to find the event hub within the namespace Q 11"
}

Write-Host "Requirements Met on Assignment $RequirementsMet/$TotalRequirements"