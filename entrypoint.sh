#!/bin/sh -l

echo "run this fucker"

ls -al

output=$(dotnet "application-insights-alerts.dll" $1 $2 "$3" $4)

echo "::set-output name=time::$output"

#echo "Hello $1 $2 $3 $4"
#time=$(date)
#echo "::set-output name=time::$time"