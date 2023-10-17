# Service Bus
1. Provision (az204\iac\azps\servicebus.ps1)
2. post messages ()
3. read messages
4. [bind output to function](https://learn.microsoft.com/en-us/azure/azure-functions/functions-bindings-service-bus?tabs=isolated-process%2Cextensionv5%2Cextensionv3&pivots=programming-language-csharp)
5. Trigger

# Event Grid
1. Provision and subscribe to Event Grid Trigger (az204\iac\azcli\eventgrid.ps1)
https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blob-event-quickstart?toc=/azure/event-grid/toc.json
https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blob-event-quickstart?toc=%2Fazure%2Fevent-grid%2Ftoc.json
2. Event Grid Trigger
3. 

# PowerShell fun
Create some sample joke files
1. Load jokes.json into objects
2. process each joke into a separate file for testing

# Function and EventGrid
1. Add EventGrid trigger
2. publish
3. subscribe to endpoint
auth the endpoint https://learn.microsoft.com/en-us/azure/event-grid/security-authentication

# Function and Service Bus Events
https://learn.microsoft.com/en-us/azure/service-bus-messaging/service-bus-to-event-grid-integration-function?toc=%2Fazure%2Fevent-grid%2Ftoc.json
1. Create Service Bus topic (servicebus.ps1)
2. Send messages to the topic (test-sb-t)
Passwordless role is required: https://learn.microsoft.com/en-us/azure/devops/organizations/security/get-started-stakeholder?view=azure-devops&tabs=agile-process


# Additional Info
https://go.microsoft.com/fwlink/p/?linkid=2217329&clcid=0x409
https://go.microsoft.com/fwlink/?linkid=2212360&clcid=0x409








