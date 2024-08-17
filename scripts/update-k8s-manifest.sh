#!/bin/bash

# Enable debugging mode, which prints each command before executing it
set -x

# Set the repository URL for the Git repository
# REPO_URL="https://t2uali7mfmeyvdqrwamao5y4lvlnrwrwbvoi4sg5wwrwtidw5jjq@dev.azure.com/jasilent4/devtest/_git/devtest"
REPO_URL="https://<ACCESS-TOKEN>@dev.azure.com/<AZURE-DEVOPS-ORG-NAME>/voting-app/_git/voting-app"


# Clone the Git repository into the /tmp directory
git clone "$REPO_URL" /tmp/temp_repo

# Navigate into the cloned repository directory
cd /tmp/temp_repo

# Modify the Kubernetes manifest file(s)
# The following command updates the image tag in the specified deployment.yaml file
# $1: The deployment name
# $2: The image repository name
# $3: The image tag
# sed -i "s|image:.*|image: gvotingapp.azurecr.io/$2:$3|g" k8s-specifications/$1-deployment.yaml
sed -i "s|image:.*|image: <ACR-REGISTRY-NAME>/$2:$3|g" k8s-specifications/$1-deployment.yaml

# Stage the modified files for commit
git add .

# Commit the changes with a message
git commit -m "Update Kubernetes manifest"

# Push the committed changes back to the remote repository
git push

# Cleanup: remove the temporary directory used for the cloned repository
rm -rf /tmp/temp_repo
