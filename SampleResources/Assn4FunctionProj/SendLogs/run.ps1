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
Write-Host "Request: $Request"
$Date = Get-Date -Format FileDateTime
$Body = $Request.Body | Add-Member -MemberType String -Name Timestamp -Value $Date
$JsonBody = $Body | ConvertTo-Json -AsArray
Write-Host "Body:"
Write-Host $JsonBody
$body = "This HTTP triggered function executed successfully."

$DceUri = "{Dce Uri}" # ex. "https://github-dce-l6gf.centralus-1.ingest.monitor.azure.com"
$DcrImmutableId = "{Immutable ID}" # ex. "dcr-f134c4e9ca004b5f889a75569073181a"
$Table = "{Table Name}" # ex. "TableName_CL"

$bearerToken = GetAccessToken

$body = $($Request.Body)
$headers = @{"Authorization" = "Bearer $bearerToken"; "Content-Type" = "application/json" };
$uri = "$DceUri/dataCollectionRules/$DcrImmutableId/streams/Custom-$Table" + "?api-version=2021-11-01-preview";
$uploadResponse = Invoke-RestMethod -Uri $uri -Method "Post" -Body $JsonBody -Headers $headers;

# Let's see how the response looks like
Write-Output $uploadResponse
Write-Output "---------------------"

# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
        StatusCode = [HttpStatusCode]::OK
        Body       = $body
    })