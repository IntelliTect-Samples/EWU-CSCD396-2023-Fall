
# Overview
- simplistic scenario 
- informed by real world
- Demonstrate using services togehter to build a solution

## Joke Service with Web Front End
- Get Jokes either via Web Site or API
    - web displays jokes from API
- Submit jokes
  - Submissions are queued for review
  - New jokes must be approved by Grant
  - Evaluate jokes for cleanliness and corniness
- Add Jokes
  - via uploading to storage
  - via api
- Joke of the day

## Services
- Function provides API to get a joke and submit a joke
- Logic App to notify on joke submission and/or approval
- Static Web App or App Service?
- CDN for global distribution
- API Management to control who gets jokes, or to filter jokes. API Key scenario
- CosmosDB to store jokes
- Redis Cache to cache Joke of the Day
- Migrate API backed to K8S or Container App to scale
- Add App Configuration and [feature flags](https://learn.microsoft.com/en-us/azure/azure-app-configuration/manage-feature-flags)
- Redis Cache serving the joke of the day
- going global: latency checks, serving local, 


## Stretches
- Jokebot
- AI to generate joke
- ML to measure joke sentiment/cleanliness?
- thumb up/down the joke of the day
- take joke comments or feedback


