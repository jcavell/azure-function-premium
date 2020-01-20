#!/bin/bash

functionAppName=s108d99-hellofunc
resourceGroup=s108d99-func

az functionapp deployment slot swap  -g $resourceGroup -n $functionAppName --slot staging --target-slot production
