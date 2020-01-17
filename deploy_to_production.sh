#!/bin/bash

functionAppName=splitfuncprem

func azure functionapp publish $functionAppName --force
