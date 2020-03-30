#!/bin/sh -l

output=$(dotnet application-insights-alerts.dll $1 $2 "$3" $4)

echo "::set-output name=time::$output"