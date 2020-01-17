#!/bin/bash

functionAppName=splitfuncprem
resourceGroup=stopresgrpprem

az functionapp deployment slot swap  -g $resourceGroup -n $functionAppName --slot staging --target-slot production
