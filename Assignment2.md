# EWU-CSCD396-2023-Fall

## Assignment 2

The purpose of this assignment is to solidify your learning of:

- Web App
- Storage Account
- Key Vault
- Using Azure CLI

## Prerequisites

- Install VSCode Extension 'Azure App Service'

## Instructions

Complete the following Tutorials and do not clean up resources until assignment is graded.

1. Create Web App
   {https://learn.microsoft.com/en-us/azure/app-service/quickstart-dotnetcore?tabs=net70&pivots=development-environment-cli}
   Note: Deploy application code using az cli, not the VSCode extension

- Web App Created ❌✅
  (You can use the below steps to publish your app OR use the 'az webapp up' command in the above tutorial)

  - Run command from your terminal 'dotnet publish SampleApp/MyFirstAzureWebApp'. This builds the application and files are genearted in SampleApp/MyFirstAzureWebApp/bin/Debug/net7.0/publish folder
  - Zip the items in your created publish folder
  - Use 'az webapp deploy' command to deploy your zip file to the application

- Url Accessible ❌✅

2. Create and Connect Storage Account - Using Azure CLI when option is available
   {https://learn.microsoft.com/en-us/azure/app-service/scenario-secure-app-access-storage?tabs=azure-cli}

- Enabled Managed Identity on Web App ❌✅
- Created Storage Account ❌✅
- Web App Granted Access to Storage Account ❌✅

3. Create a Key Vault
   https://learn.microsoft.com/en-us/azure/key-vault/general/quick-create-cli
   https://learn.microsoft.com/en-us/azure/app-service/app-service-configuration-references#granting-your-app-access-to-referenced-key-vaults
   https://learn.microsoft.com/en-us/azure/app-service/app-service-key-vault-references?tabs=azure-cli

- Key Vault Created ❌✅
- Key Vault Secret Created ❌✅
- Key Vault Access policy created for user 'jcurry9@ewu.edu' with secret 'Get' permission ❌✅
- Web App Granted Access to Key Vault ❌✅
- Reference key vault secret as an app setting on your web app where the app setting name is the secret name and the value references your secret using the secret uri ❌✅
  (https://learn.microsoft.com/en-us/azure/app-service/app-service-key-vault-references?tabs=azure-cli#source-app-settings-from-key-vault)

4. Create a PowerShell script called Assignment2.ps1 on your branch within the Assignment2 folder ❌✅

- Copy the following text into your PowerShell script and fill in your specific values for the variables
```
$SubscriptionId = ""
$ResourceGroup = ""
$WebAppName = ""
$WebAppUrl = ""
$KeyVault = ""
$SecretName = ""
$StorageAccount = ""
```
- You can test if your assignment will pass by running the PS script at Scripts/Assignment2Grading.ps1. Run your Assignment2.ps1 script to set local variables first.

5. Please add jcurry9@ewu.edu as a contributor to your subscription, otherwise grading will not be possible.


## Extra Credit

TBD
