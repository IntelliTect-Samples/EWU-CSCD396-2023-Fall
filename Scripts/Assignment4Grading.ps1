$SubscriptionId = "d00af0f7-1cd6-4415-b760-3ad7fc274cbf"
$ResourceGroup = "test-rg"
$LogAnalyticsWorkspaceName = "la-test-jc"
$LogAnalyticsTableName = "IngestionLog_CL_CL"
$DataCollectionRuleName = "DCR-jc"
$DataCollectionEndpointName = "testendpoint"
$FunctionAppName = "fn-app-jc"

$RequirementsMet = 0
$TotalRequirements = 10

az login 
Connect-AzAccount
Set-AzContext -Subscription $SubscriptionId

$LogAnalyticsResult = Get-AzOperationalInsightsWorkspace -Name $WorkspaceName -ResourceGroupName $ResourceGroup
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
if($TableObject -and $TableObject.schema.tableSubType -like "DataCollectionRuleBased"){
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

$WorkspaceGuid = (Get-AzOperationalInsightsWorkspace -Name la-test-jc -ResourceGroupName test-rg).CustomerID
$QueryResults = Invoke-AzOperationalInsightsQuery -WorkspaceId $WorkspaceGuid -Query $LogAnalyticsTableName).Results

if ($QueryResults.Count -gt 0) {
    $RequirementsMet++
    Write-Host "Successfully found Logs in your Custom Table"
}
else {
    Write-Host "Failed to find Logs in your Custom Table"
}

Write-Host "Requirements Met on Assignment $RequirementsMet/$TotalRequirements"