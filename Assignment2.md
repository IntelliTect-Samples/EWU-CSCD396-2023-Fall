# EWU-CSCD378-2023-Spring

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
   {https://learn.microsoft.com/en-us/azure/app-service/scenario-secure-app-authentication-app-service}

- Web App Created ❌✅
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
- Key Vault Access policy created for user 'jenny.curry@IntelliTect.com' with secret 'Get' permission ❌✅
- Web App Granted Access to Key Vault ❌✅
- Reference key vault secret as an app setting on your web app where the app setting name is the secret name and the value references your secret using the secret uri ❌✅
  (https://learn.microsoft.com/en-us/azure/app-service/app-service-key-vault-references?tabs=azure-cli#source-app-settings-from-key-vault)

4. Create a PowerShell script called Assignment1.ps1 on your branch within the Assignment1 folder ❌✅

- Copy the following text into your PowerShell script and fill in your specific values for the variables
  $SuscriptionId = ""
  $ResourceGroup = ""
  $WebAppName = ""
  $webAppUrl = ""
  $KeyVault = ""
  $SecretName = ""
  $StorageAccount = ""

## Extra Credit

TBD
