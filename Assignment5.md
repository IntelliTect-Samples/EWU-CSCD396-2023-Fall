# EWU-CSCD378-2023-Spring

## Assignment 4

The purpose of this assignment is to solidify your learning of:

- Cosmos Db
- SQL Server
- Redis Cache
- Vnets/Subnets
- Private Endpoint

## Prerequisites

- Install C# VS Code Extension

## Instructions

Complete the following Tutorials and do not clean up resources until assignment is graded.

1. Create a Virtual Network ❌✅
2. Create Azure Cosmos DB Account ❌✅
   https://learn.microsoft.com/en-us/azure/cosmos-db/nosql/quickstart-portal

   - Create Private Endpoint for Cosmos Db Account and add the endpoint on the Cosmos Db Account❌✅
     https://learn.microsoft.com/en-us/azure/cosmos-db/how-to-configure-private-endpoints?bc=%2Fazure%2Fcosmos-db%2Fbreadcrumb%2Ftoc.json&toc=%2Fazure%2Fcosmos-db%2Ftoc.json#create-a-private-endpoint-by-using-the-azure-portal 
   - Disable Public Access on the Cosmos Db Account ❌✅

3. Create SQL Server Managed Instance ❌✅
   https://learn.microsoft.com/en-us/azure/azure-sql/managed-instance/create-configure-managed-instance-powershell-quickstart?view=azuresql

- Add Private Endpoint ❌✅
  https://learn.microsoft.com/en-us/azure/azure-sql/managed-instance/private-endpoint-overview?view=azuresql&tabs=separate-vnets
- Make private ❌✅

4. Create a Redis Cache ❌✅
   https://learn.microsoft.com/en-us/azure/azure-cache-for-redis/cache-web-app-howto

   - Create ASP.NET App and deploy app service from the above tutorial ❌✅
   - Add App Service setting to reference the cache ❌✅
     https://learn.microsoft.com/en-us/azure/azure-cache-for-redis/cache-web-app-howto#add-the-app-setting-for-the-cache
   - Make Private Endpoint using the same Vnet as the Cosmos Db Private Endpoint ❌✅
   - Make Private ❌✅

5. Configure App Service from previous step

   - Create Private endpoint for app service ❌✅
   - Make Private ❌✅

6. Create Service Bus 
- Create Service Bus Namespace ❌✅
- Create Service Bus Topic ❌✅
- Create a Service Bus subscription ❌✅
https://learn.microsoft.com/en-us/azure/service-bus-messaging/service-bus-tutorial-topics-subscriptions-cli

## Extra Credit

Insert CDN task