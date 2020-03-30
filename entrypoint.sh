#!/bin/sh -l

# output=$(dotnet application-insights-alerts.dll $1 $2 "$3" $4)

# echo "::set-output name=time::$output"

ls

echo "Hello $1 $2 $3 $4"
time=$(date)
echo "::set-output name=time::$time"