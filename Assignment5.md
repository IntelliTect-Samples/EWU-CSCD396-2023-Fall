# EWU-CSCD396-2023-Fall

## Assignment 5

The purpose of this assignment is to solidify your learning of:

- Cosmos Db
- Redis Cache
- Virtual Networks and Subnets
- Private Endpoint
- Service Bus

## Prerequisites

- Install C# VS Code Extension

## Instructions

Complete the following Tutorials and do not clean up resources until assignment is graded.

1. Create a Virtual Network ✅
2. Create Azure Cosmos DB Account ✅
   https://learn.microsoft.com/en-us/azure/cosmos-db/nosql/quickstart-portal

   - Create Private Endpoint for Cosmos Db Account and add the endpoint on the Cosmos Db Account✅
     https://learn.microsoft.com/en-us/azure/cosmos-db/how-to-configure-private-endpoints?bc=%2Fazure%2Fcosmos-db%2Fbreadcrumb%2Ftoc.json&toc=%2Fazure%2Fcosmos-db%2Ftoc.json#create-a-private-endpoint-by-using-the-azure-portal 
   - Disable Public Access on the Cosmos Db Account ✅

3. Create a Redis Cache ✅
   https://learn.microsoft.com/en-us/azure/azure-cache-for-redis/cache-web-app-howto

   - Create ASP.NET App and deploy app service from the above tutorial ✅
   - Add App Service setting to reference the cache ✅
     https://learn.microsoft.com/en-us/azure/azure-cache-for-redis/cache-web-app-howto#add-the-app-setting-for-the-cache
     - Create Private endpoint for app service ✅
     - App Service configured with public access disabled ✅
   - Make a Private Endpoint for Redis Cache using your existing virtual network to create the Private Endpoint ✅

4. Create Service Bus 
- Create Service Bus Namespace ✅
- Create Service Bus Topic ✅
- Create a Service Bus subscription ✅
https://learn.microsoft.com/en-us/azure/service-bus-messaging/service-bus-tutorial-topics-subscriptions-cli

5. Create a PowerShell script called Assignment5.ps1 on your branch within the Assignment5 folder ✅

- Copy the following text into your PowerShell script and fill in your specific values for the variables
```
$SubscriptionId = ""
$ResourceGroup = "g"
$VnetName = ""
$CosmosDbAccountName = ""
$CosmosPrivateEndpointName = ""
$WebAppName = ""
$WebAppPrivateEndpointName = ""
$RedisCacheName = ""
$RedisCachePrivateEndpointName = ""
$ServiceBusNamespaceName = ""
$ServiceBusTopicName = ""
$ServiceBusSubscriptionName = ""
```

## Script Grading
You can test if your assignment will pass by running the PS script at Scripts/Assignment5Grading.ps1. Run your Assignment5.ps1 script to set local variables first.

Be sure to install the Az Powershell modules that are listed as dependencies in order to run the script.

## Extra Credit

Deploy Azure CDN ❌✅
https://learn.microsoft.com/en-us/azure/cdn/scripts/cli/cdn-azure-cli-create-endpoint?toc=%2Fazure%2Ffrontdoor%2FTOC.json