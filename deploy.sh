#!/bin/bash
set -e

if [[ "$BRANCH_NAME" == "dev" ]]; then
    echo "Deploying to Dev Server"
    ssh user@dev-server "docker pull your-dockerhub-username/app:dev && docker run -d -p 3000:3000 your-dockerhub-username/app:dev"
elif [[ "$BRANCH_NAME" == "stage" ]]; then
    echo "Deploying to Staging Server"
    ssh user@stage-server "docker pull your-dockerhub-username/app:stage && docker run -d -p 3000:3000 your-dockerhub-username/app:stage"
elif [[ "$BRANCH_NAME" == "prod" ]]; then
    echo "Deploying to Production Server"
    ssh user@prod-server "docker pull your-dockerhub-username/app:prod && docker run -d -p 3000:3000 your-dockerhub-username/app:prod"
else
    echo "Unknown branch. No deployment."
fi
