
# Overview
Simple scenario 
informed by real world
Demonstrate using services togehter to build a solution

# Solution Overview
Joke Service with Web Front End

- Get Jokes either via Web Site or API
- Add jokes
  - New jokes must be approved by Grant
  - Submissions are queued for review

## Services
- Function provides API to get a joke and submit a joke
- Logic App to notify on joke submission and/or approval
- Static Web App or App Service?
- CDN for global distribution
- API Management to control who gets jokes, or to filter jokes. API Key scenario
- CosmosDB to store jokes
- Redis Cache to cache jokes
- K8S or Container App to scale
 
## Stretches
- Jokebot
- AI to generate joke
- ML to guage joke sentiment




CosmosDB
 API to get a joke

