#!/bin/sh -l

output=`dotnet /app/application-insights-alerts.dll $1 $2 "$3" $4`

# output=`cat test.json`

count=`echo $output | jq '. | length'`

if [ $count -gt 0 ]
then
  timestamp=`echo $output | jq -r '.[0] .timeStamp'`
  exceptionType=`echo $output | jq -r '.[0] .exceptionType'`
  method=`echo $output | jq -r '.[0] .method'`
  message=`echo $output | jq -r '.[0] .message'`
  assembly=`echo $output | jq -r '.[0] .assembly'`

  printf "\n* Since last run we have detected $count new exceptions:\n\n"
  printf "|  Timestamp:             %s\t\n" "$timestamp"
  printf "|  ExceptionType:         %s\t\n" "$exceptionType"
  printf "|  Method:                %s\t\n" "$method"
  printf "|  Message:               %s\t\n" "$message"
  printf "|  Assembly:              %s\t\n" "$assembly"
  printf "\n"

  echo "::set-output name=count::$count"
  echo "::set-output name=timestamp::$timestamp"
  echo "::set-output name=exceptionType::$exceptionType"
  echo "::set-output name=method::$method"
  echo "::set-output name=message::$message"
  echo "::set-output name=assembly::$assembly"

  exit 0
else
  exit 0
fi