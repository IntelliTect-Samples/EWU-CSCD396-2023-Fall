# EWU-CSCD378-2023-Spring

## Assignment 3

The purpose of this assignment is to solidify your learning of:

- Virtual Machines
- Container Registry
- Event Grid
- Configuration of Event Grid to Subscribe to Container Registry Events
- Using Azure PowerShell
- Azure Container Instances
- Event Hub

## Prerequistes

Please add jcurry9@ewu.edu as a contributor to your subscription, otherwise grading will not be possible.

## Instructions

Complete the following Tutorials and do not clean up resources until assignment is graded.

1. Create Virtual Machine
   https://learn.microsoft.com/en-us/azure/virtual-machines/windows/tutorial-manage-vm?source=recommendations

- Virtual Machine Created ❌✅

2. Create Container Registry
Note: Be sure you have docker desktop installed and running
   https://learn.microsoft.com/en-us/azure/container-registry/container-registry-get-started-powershell

- Container Registry Created ❌✅
- Image tagged 'hello-word:v1' is pushed to container registy ❌✅

3. Create an Event Grid and Send Container Registry Events (Event Grid System Topic) 
   https://learn.microsoft.com/en-us/azure/container-registry/container-registry-event-grid-quickstart
   https://learn.microsoft.com/en-us/azure/container-registry/container-registry-event-grid-quickstart#subscribe-to-registry-events


- Event Grid Web Viewer Endpoint Available ❌✅
- Subscribe Event Grid to Container Registry Events to Create an Event Grid System Topic ❌✅

- New Image Version Pushed to Container Registry from Step 2 ❌✅
- Event Grid Subscription is Configured to Send Events to Event Viewer Web Endpoint❌✅

4. Create a container instance
   https://learn.microsoft.com/en-us/azure/container-instances/container-instances-quickstart

- Container instance created ❌✅

5. Create Event Hub
   https://learn.microsoft.com/en-us/azure/event-hubs/event-hubs-quickstart-powershell

- Event Hub Namespace Created ❌✅
- Event Hub Created ❌✅
- Events have been sent to your Event Hub (Submit a screenshot in your PR of Events that have been sent to your Event Hub) ❌✅
  https://learn.microsoft.com/en-us/azure/event-hubs/send-and-receive-events-using-data-generator
  [Screenshot Example](https://learn.microsoft.com/en-us/azure/event-hubs/send-and-receive-events-using-data-generator#view-events-using-event-hubs-data-generator)

6. Create a PowerShell script called Assignment3.ps1 on your branch within the Assignment3 folder ❌✅

- Copy the following text into your PowerShell script and fill in your specific values for the variables
   $SubscriptionId = ""
   $ResourceGroup = ""
   $EventGridAppUrl = ""
   $VirtualMachineName = ""
   $ContainerRegistryName = ""
   $ContainerRegistryPassword = ""
   $EventHubNamespaceName = ""
   $EventHubName = ""
   $EventGridSystemTopicName = ""
   $ContainerGroupName = ""


## Script Grading
You can test if your assignment will pass by running the PS script at Scripts/Assignment3Grading.ps1. Run your Assignment3.ps1 script to set local variables first.

Be sure to install the Az Powershell modules that are listed as dependencies 


