using namespace System.Net
param($Request, $TriggerMetadata)
# Purpose: Send audit logs to log analytics

# Input bindings are passed in via param block.

function GetAccessToken {
    $resourceURI = "https://monitor.azure.com/"
    $tokenAuthURI = $env:IDENTITY_ENDPOINT + "?resource=$resourceURI&api-version=2019-08-01"
    $tokenResponse = Invoke-RestMethod -Method Get -Headers @{"X-IDENTITY-HEADER" = "$env:IDENTITY_HEADER" } -Uri $tokenAuthURI
    $accessToken = $tokenResponse.access_token    
    return $accessToken
}
Write-Output "Request: $Request"
Write-Output "Body: $($Request.Body)"

$JsonBody = "[" + $($Request.Body) + "]"
Write-Host "Body:"
Write-Host $JsonBody
$responseBody = "This HTTP triggered function executed successfully."

$DceUri = "https://nng2-dcollection-4-yvsg.eastus-1.handler.control.monitor.azure.com" # ex. "https://github-dce-l6gf.centralus-1.ingest.monitor.azure.com"
$DcrImmutableId = "dcr-92f0876b029d4b8095857016d564f3e5" # ex. "dcr-f134c4e9ca004b5f889a75569073181a"
$Table = "nng2_table_4_CL" # ex. "TableName_CL"

$bearerToken = GetAccessToken

$headers = @{"Authorization" = "Bearer $bearerToken"; "Content-Type" = "application/json" }
$uri = "$DceUri/dataCollectionRules/$DcrImmutableId/streams/Custom-$Table" + "?api-version=2021-11-01-preview"
$uploadResponse = Invoke-WebRequest -Uri $uri -Method "Post" -Body $JsonBody -Headers $headers 

# Let's see how the response looks like
Write-Output $uploadResponse
Write-Output "---------------------"

# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
        StatusCode = [HttpStatusCode]::OK
        Body       = $responseBody
    })