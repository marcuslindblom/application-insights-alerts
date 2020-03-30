#!/bin/sh -l

output=$(dotnet run -- $1 $2 "$3" $4)

echo "::set-output name=time::$output"