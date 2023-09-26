# EWU-CSCD378-2023-Spring

## Assignment 4

The purpose of this assignment is to solidify your learning of:

- Log Analytics Workspace
- Function App
- Using Data Collection Rule/Endpoint to Ingest Logs
- API Managment Instance

## Prerequisites

- Install Azure Function VS Code Extension

## Instructions

Complete the following Tutorials and do not clean up resources until assignment is graded.

1. Create Log Analytics Workspace and Custom Table
   https://learn.microsoft.com/en-us/azure/azure-monitor/logs/quick-create-workspace?tabs=azure-powershell
   https://learn.microsoft.com/en-us/cli/azure/monitor/log-analytics/workspace/table?view=azure-cli-latest#az-monitor-log-analytics-workspace-table-create

- Log Analytics Workspace Created ❌✅
- Create Custom Table using az cli command ❌✅
  - Give the new table columns TimeGenerated, LogLevel, Tags ❌✅

2. Create an Data Collection Rule and Endpoint
   https://learn.microsoft.com/en-us/azure/container-registry/container-registry-event-grid-quickstart
   https://learn.microsoft.com/en-us/azure/container-registry/container-registry-event-grid-quickstart#subscribe-to-registry-events

- Data Collection Rule Created ❌✅

3. Create Function App
   https://learn.microsoft.com/en-us/azure/azure-functions/create-first-function-vs-code-powershell#publish-the-project-to-azure
   https://learn.microsoft.com/en-us/azure/azure-functions/functions-monitor-log-analytics?tabs=csharp#setting-up
   https://learn.microsoft.com/en-us/azure/azure-functions/functions-bindings-http-webhook-trigger?tabs=python-v2%2Cin-process%2Cfunctionsv2&pivots=programming-language-powershell

- Function App Created ❌✅
  - Use [this tutorial](https://learn.microsoft.com/en-us/azure/azure-functions/create-first-function-vs-code-powershell) to setup your function app
- Configured Function App Diagnostic settings to the previously created log analytics workspace ❌✅
- Add Az.Accounts as a package install by editing the requirements.psd1 app file - https://learn.microsoft.com/en-us/azure/azure-functions/functions-reference-powershell?tabs=portal#dependency-management ❌✅
  - Copy SampleResources/Assn4FunctionProj/SendLogs/run.ps1 file contents to your function. Replace the values in the curly braces. The Assn4FunctionProj directory is an example step 1 of [creating your local functions project](https://learn.microsoft.com/en-us/azure/azure-functions/create-first-function-vs-code-powershell#create-an-azure-functions-project)
  - Replace table name, DCE uri, and DCR Immutable Id values in run.ps1 with your values.
- Created PowerShell Function with Http Inbound and Outbound Bindings ❌✅
  - See SampleResources/Assn4FunctionProj/SendLogs/function.json for sample
- Assigned 'Monitoring Metrics Publisher' and 'Contributor' role to the function app managed identity over the scope of your reosurce group. This identity will be executing the PowerShell function. https://learn.microsoft.com/en-us/azure/azure-monitor/logs/tutorial-logs-ingestion-portal#assign-permissions-to-the-dcr ❌✅
- Executed function with PowerShell command : Invoke-RestMethod -Uri 'https://<Fn App Name>.azurewebsites.net/api/<Function Name>?code=<My API Key here>' -Body <Body> ❌✅
  - See monitor tab on the function to view requests.

4. Create API Management Instance ❌✅
   https://learn.microsoft.com/en-us/azure/api-management/get-started-create-service-instance-cli

## Extra Credit
