#!/bin/bash

export AZURE_RG_NAME="rg-linux-webapp"
export AZURE_RG_LOCATION="westus"
export AZURE_APPSVC_PLAN_NAME="hectagon-appsvc-linux-plan"
export AZURE_APPSVC_WEB_NAME="hectagon-appsvc-node-linux-app"

export AZURE_NODE_VERSION="NODE|6.9"
export AZURE_NODE_MAIN="server.js"

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
  --number-of-workers 1 \
  --is-linux

az appservice web create \
  --name $AZURE_APPSVC_WEB_NAME \
  --resource-group $AZURE_RG_NAME \
  --plan $AZURE_APPSVC_PLAN_NAME

az appservice web config update \
  --name $AZURE_APPSVC_WEB_NAME \
  --resource-group $AZURE_RG_NAME \
  --linux-fx-version $AZURE_NODE_VERSION \
  --startup-file $AZURE_NODE_MAIN

az appservice web source-control config \
  --name $AZURE_APPSVC_WEB_NAME \
  --resource-group $AZURE_RG_NAME \
  --repo-url $GIT_REPO_URL \
  --branch $GIT_BRANCH
