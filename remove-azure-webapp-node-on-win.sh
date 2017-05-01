#!/bin/bash

export AZURE_RG_NAME="rg-win-webapp"

az group delete --name $AZURE_RG_NAME
