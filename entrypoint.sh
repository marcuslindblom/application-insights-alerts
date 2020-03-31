#!/bin/sh -l

output=$(dotnet /app/application-insights-alerts.dll $1 $2 "$3" $4)

echo "::set-output name=time::$output"