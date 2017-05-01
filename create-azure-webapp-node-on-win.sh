#!/bin/bash

export AZURE_RG_NAME="rg-win-webapp"
export AZURE_RG_LOCATION="westus"
export AZURE_APPSVC_PLAN_NAME="hectagon-appsvc-win-plan"
export AZURE_APPSVC_WEB_NAME="hectagon-appsvc-node-win-app"

export GIT_REPO_URL="https://github.com/nickward13/node-scratch.git"
export GIT_BRANCH="master"

az group create \
  --name $AZURE_RG_NAME \
  --location $AZURE_RG_LOCATION

az appservice plan create \
  --name $AZURE_APPSVC_PLAN_NAME \
  --resource-group $AZURE_RG_NAME \
  --location $AZURE_RG_LOCATION \
  --sku S1 \
  --number-of-workers 1

az appservice web create \
  --name $AZURE_APPSVC_WEB_NAME \
  --resource-group $AZURE_RG_NAME \
  --plan $AZURE_APPSVC_PLAN_NAME

az appservice web source-control config \
  --name $AZURE_APPSVC_WEB_NAME \
  --resource-group $AZURE_RG_NAME \
  --repo-url $GIT_REPO_URL \
  --branch $GIT_BRANCH
