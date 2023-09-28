# EWU-CSCD378-2023-Spring

## Assignment 1

The purpose of this assignment is to solidify your learning of:

- Using Git to make a PR
- Set up your Azure subscription
- Create Resource Group
- Create a storage account in the resource group
- Create a script to list the resources in the subscription
- Create an action that runs the script and lists the resources in the action's log

## Instructions

1. Fork class repository ✅
2. Create Assignment 1 Branch and Sync branch from class repo ✅
3. Clone your repo/branch to your computer 
5. Set Up Azure following SettingUpAzure.md ✅
6. Create a script called Assignment1.ps1 in the Assignment1 folder ✅
   - Set a variable named subscription_id in your PowerShell file and set the value as a string your subscription ID. ✅
8. Create an App ID with a property of your repo name ✅
9. Add the App ID as a contributor to your subscription ✅
10. Create Assignment1.yml Action (in the workflows folder) ✅
   - Authenticate to Azure ✅
   - List resources in the subscription ✅
11. Commit your changes and create a PR against the class repository.  ✅
12. Provide Screenshots of the Following Screens ✅

- OIDC Federated Credential Configuration
- Log of GitHub actions successfully ran with oidc login and subscription resources listed

## Extra Credit

From the script, create a resource in Azure and have it be part of the list, then delete the resource.
