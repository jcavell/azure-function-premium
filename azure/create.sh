#!/bin/bash

storageName=s108d99funcstorage
functionAppName=s108d99-hellofunc
resourceGroup=s108d99-func
plan=s108d99-dev-asp
location=westeurope

# Create a resource group
az group create \
  --name $resourceGroup \
  --location $location

# Create an Azure storage account
az storage account create \
  --name $storageName \
  --location $location \
  --resource-group $resourceGroup \
  --sku Standard_LRS

# Create a Premium plan with EP2
az functionapp plan create \
  --name $plan \
  --resource-group $resourceGroup \
  --location $location \
  --min-instances 3 \
  --max-burst 5 \
  --sku EP2 

# Create the Function App
az functionapp create \
  --name $functionAppName \
  --storage-account $storageName \
  --plan $plan \
  --resource-group $resourceGroup

# Create a staging slot
az functionapp deployment slot create \
  --name $functionAppName \
  --resource-group $resourceGroup \
  --slot staging

# Configure for 3 pre-warmed instances
az resource update -g $resourceGroup -n $functionAppName/config/web \
  --set properties.preWarmedInstanceCount=3 \
  --resource-type Microsoft.Web/sites

