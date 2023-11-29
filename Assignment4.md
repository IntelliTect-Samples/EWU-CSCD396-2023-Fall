# EWU-CSCD396-2023-Fall

## Assignment 4

The purpose of this assignment is to solidify your learning of:

- Log Analytics Workspace
- Function App
- Using Data Collection Rule/Endpoint to Ingest Logs
- API Managment Instance

## Prerequisites

Please add jcurry9@ewu.edu as a contributor to your subscription, otherwise grading will not be possible.

## Instructions

Complete the following Tutorials and do not clean up resources until assignment is graded.

1. Create Log Analytics Workspace and Custom Table
   https://learn.microsoft.com/en-us/azure/azure-monitor/logs/quick-create-workspace?tabs=azure-powershell
   https://learn.microsoft.com/en-us/cli/azure/monitor/log-analytics/workspace/table?view=azure-cli-latest#az-monitor-log-analytics-workspace-table-create

- Log Analytics Workspace Created ❌✅
- Create Custom Table with columns 'TimeGenerated' (DateTime type)and 'LogLevel' (string type)❌✅

2. Create a Data Collection Rule and Endpoint
   https://learn.microsoft.com/en-us/azure/azure-monitor/logs/set-up-logs-ingestion-api-prerequisites

- Data Collection Endpoint Created ❌✅
- Custom Table is Created with Data Collection Rule ❌✅ (Using the portal, recreation is required to use DCR on the Custom Table)
- Data Collection Rule Created ❌✅


3. Create Function App
   https://learn.microsoft.com/en-us/azure/azure-functions/create-first-function-vs-code-powershell#publish-the-project-to-azure
   https://learn.microsoft.com/en-us/azure/azure-functions/functions-monitor-log-analytics?tabs=csharp#setting-up
   https://learn.microsoft.com/en-us/azure/azure-functions/functions-bindings-http-webhook-trigger?tabs=python-v2%2Cin-process%2Cfunctionsv2&pivots=programming-language-powershell

- Function App Created ❌✅
  - Use [this tutorial](https://learn.microsoft.com/en-us/azure/azure-functions/create-first-function-vs-code-powershell) to setup your function app
- Configured Function App Diagnostic setting to the previously created log analytics workspace ❌✅
- Enable System Assigned identity on Function App ❌✅
- Add Az.Accounts as a package install by editing the requirements.psd1 app file - https://learn.microsoft.com/en-us/azure/azure-functions/functions-reference-powershell?tabs=portal#dependency-management 

  - Copy SampleResources/Assn4FunctionProj/SendLogs/run.ps1 file contents to your function. Replace the values in the curly braces. The Assn4FunctionProj directory is an example step 1 of [creating your local functions project](https://learn.microsoft.com/en-us/azure/azure-functions/create-first-function-vs-code-powershell#create-an-azure-functions-project)
  - Replace table name, DCE uri, and DCR Immutable Id values in run.ps1 with your values. 
- Created PowerShell Function with Http Inbound and Outbound Bindings 
  - See SampleResources/Assn4FunctionProj/SendLogs/function.json for sample
- Assigned 'Monitoring Metrics Publisher' and 'Contributor' role to the function app managed identity over the scope of your resource group. This identity will be executing the PowerShell function. https://learn.microsoft.com/en-us/azure/azure-monitor/logs/tutorial-logs-ingestion-portal#assign-permissions-to-the-dcr ❌✅
- Executed the function through PowerShell commands: 
      $Date = Get-Date ([datetime]::UtcNow) -Format O 
      $Body = @{LogLevel='Error';TimeGenerated=$Date} | ConvertTo-Json
      Invoke-RestMethod -Method POST -Uri 'https://<Fn App Name>.azurewebsites.net/api/<Function Name>?code=<My Function API Key here>' -Body <Body> 
  - See monitor tab on the function to view requests. 
  - If this is a success, your log should be present in your custom table
- Log Found in your Created Custom Table ❌✅

4. Create API Management Instance ❌✅
   https://learn.microsoft.com/en-us/azure/api-management/get-started-create-service-instance-cli
- Import Function App as an API in your API Management Instance ❌✅
 https://learn.microsoft.com/en-us/azure/api-management/import-function-app-as-api 


5. Create a PowerShell script called Assignment4.ps1 on your branch within the Assignment4 folder ❌✅

- Copy the following text into your PowerShell script and fill in your specific values for the variables
```
$SubscriptionId = ""
$ResourceGroup = ""
$LogAnalyticsWorkspaceName = ""
$LogAnalyticsTableName = ""
$DataCollectionRuleName = ""
$DataCollectionEndpointName = ""
$FunctionAppName = ""
$ApiManagementGatewayName = ""
```

## Script Grading
You can test if your assignment will pass by running the PS script at Scripts/Assignment4Grading.ps1. Run your Assignment4.ps1 script to set local variables first.

Be sure to install the Az Powershell modules that are listed as dependencies in order to run the script

## Extra Credit

- Create Azure Queue Storage and Create a new Function that is Triggered by a Queue Storage Addition ❌✅
https://learn.microsoft.com/en-us/azure/storage/queues/storage-quickstart-queues-portal
https://learn.microsoft.com/en-us/azure/azure-functions/functions-bindings-storage-queue-trigger?tabs=python-v2%2Cisolated-process%2Cnodejs-v4%2Cextensionv5&pivots=programming-language-powershell
