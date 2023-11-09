# PS Module Requirements
# - Az.ApiMangement v.4.0.2
# - Az.Functions v.4.0.6
# - Az.Monitor v3.0.1
# - Az.OperationalInsights 3.2.0

$SubscriptionId = "ec5397a2-8944-4e78-b6c4-cbbc5cce0bce"
$ResourceGroup = "CSCD396-Fall"
$LogAnalyticsWorkspaceName = "396workspace"
$LogAnalyticsTableName = "Assignment4Table2_CL_CL"
$DataCollectionRuleName = "Assignment4-Rule"
$DataCollectionEndpointName = "Assignment4-Endpoint"
$FunctionAppName = "Assignment4-Func"
$ApiManagementGatewayName = "assignment4apim"

$RequirementsMet = 0
$TotalRequirements = 12
 
# You'll manually have to log in twice here (prompts should pop up in a browser and a PowerShell window)
az login 
Connect-AzAccount
Set-AzContext -Subscription $SubscriptionId

$LogAnalyticsResult = Get-AzOperationalInsightsWorkspace -Name $LogAnalyticsWorkspaceName -ResourceGroupName $ResourceGroup
if($LogAnalyticsResult){
    $RequirementsMet++
       Write-Host "Successfully found the log analytics namespace"
   }
   else {
       Write-Host "Failed to find the log analytics namespace"
}

$TableResult = az monitor log-analytics workspace table show --resource-group $ResourceGroup --workspace-name $LogAnalyticsWorkspaceName -n $LogAnalyticsTableName
if($TableResult){
    $RequirementsMet++
       Write-Host "Successfully found the log analytics custom table"
   }
   else {
       Write-Host "Failed to find the log analytics custom table"
}


$DataCollectionEndpointResult = az monitor data-collection endpoint show --name $DataCollectionEndpointName --resource-group $ResourceGroup
if($DataCollectionEndpointResult){
    $RequirementsMet++
       Write-Host "Successfully found the Data Collection Endpoint"
   }
   else {
       Write-Host "Failed to find the Data Collection Endpoint"
}

$TableObject = $TableResult | ConvertFrom-Json 
$TableObject.schema.tableSubType
if($TableObject -and ($TableObject.schema.tableSubType -like "DataCollectionRuleBased")){
    $RequirementsMet++
       Write-Host "Successfully found the log analytics table configured to use DCR"
   }
   else {
       Write-Host "Failed to find the log analytics table configured to use DCR"
}

$DataCollectionRuleResult = Get-AzDataCollectionRule -ResourceGroupName $ResourceGroup -RuleName $DataCollectionRuleName
if($DataCollectionRuleResult){
    $RequirementsMet++
       Write-Host "Successfully found the Data Collection Rule"
   }
   else {
       Write-Host "Failed to find the Data Collection Rule"
}

$FunctionAppResult = Get-AzFunctionApp -ResourceGroupName $ResourceGroup -Name $FunctionAppName
if($FunctionAppResult){
    $RequirementsMet++
       Write-Host "Successfully found the Function App"
   }
   else {
       Write-Host "Failed to find the Function App"
}

$DiagnosticSettingResult = Get-AzDiagnosticSetting -ResourceId /subscriptions/$SubscriptionId/resourceGroups/$ResourceGroup/providers/Microsoft.Web/sites/$FunctionAppName
if($DiagnosticSettingResult){
    $RequirementsMet++
       Write-Host "Successfully found the Function App Diagnostic Setting"
   }
   else {
       Write-Host "Failed to find the Function App Diagnostic Setting"
}

$IdentityResult = az resource list -n $FunctionAppName --query [*].identity
if($IdentityResult.Count -gt 0 ){
    $RequirementsMet++
       Write-Host "Successfully found the Function App Identity"
   }
   else {
       Write-Host "Failed to find the Function App Identity"
}

$spID = $(az resource list -n $FunctionAppName --query [*].identity.principalId --out tsv)
$rgId = $(az group show -n $ResourceGroup --query id --out tsv)

$MetricsRoleAssignment = az role assignment list --assignee $spID --scope $rgId --role 'Monitoring Metrics Publisher'
$ContributorRoleAssignment = az role assignment list --assignee $spID --scope $rgId --role 'Contributor'
if ($MetricsRoleAssignment  -and $ContributorRoleAssignment) {
    $RequirementsMet++
    Write-Host "Successfully found role assignments 'Monitoring Metrics Publisher' and 'Contributor' over scope of the Resource Group for FnApp Identity"
}
else {
    Write-Host "Failed to find role assignment 'Monitoring Metrics Publisher' and 'Contributor' over scope of the Resource Group for FnApp Identity"
}

$WorkspaceGuid = "2c943329-a559-4a5e-b977-d4746b1a2d4f"
$QueryResults = (Invoke-AzOperationalInsightsQuery -WorkspaceId $WorkspaceGuid -Query $LogAnalyticsTableName).Results

if ($QueryResults) {
    $RequirementsMet++
    Write-Host "Successfully found Logs in your Custom Table"
}
else {
    Write-Host "Failed to find Logs in your Custom Table"
}

$ApimResult = Get-AzApiManagement -ResourceGroupName $ResourceGroup -Name $ApiManagementGatewayName
if ($ApimResult) {
    $RequirementsMet++
    Write-Host "Successfully found APIM Gateway"
}
else {
    Write-Host "Failed to find APIM Gateway"
}

$ApiMgmtContext = New-AzApiManagementContext -ResourceGroupName $ResourceGroup -ServiceName $ApiManagementGatewayName
$ApiFunctionResult = Get-AzApiManagementApi -Context $ApiMgmtContext | Where-Object {$_.ApiId -like $FunctionAppName }

if ($ApiFunctionResult ) {
    $RequirementsMet++
    Write-Host "Successfully found Function API in API Management Gateway"
}
else {
    Write-Host "Failed to find Function API in API Management Gateway"
}

Write-Host "Requirements Met on Assignment $RequirementsMet/$TotalRequirements"