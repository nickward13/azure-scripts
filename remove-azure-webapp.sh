#!/bin/bash

export AZURE_RG_NAME="rg-linux-webapp"

az group delete --name $AZURE_RG_NAME
