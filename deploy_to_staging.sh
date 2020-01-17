#!/bin/bash

functionAppName=splitfuncprem

func azure functionapp publish $functionAppName --slot staging --force
