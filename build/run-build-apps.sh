#!/bin/bash

outDir=$1
echo "sources dir: $(pwd)"
echo "output dir: $outDir"
echo "nuget cache dir: $(readlink -f ~/.nuget)"
echo "npm cache dir: $(readlink -f ~/.npm)"
echo "yarn cache dir: $(readlink -f ~/.cache)"

docker run --rm \
    -v $(pwd):/src \
    -v $outDir:/output \
    -v "$(readlink -f ~/.nuget)":/root/.nuget \
    -v "$(readlink -f ~/.npm)":/root/.npm \
    -v "$(readlink -f ~/.cache)":/root/.cache \
    microsoft/dotnet:2.1.403-sdk /src/build/build-apps.sh "/src/src" "Release" "/output"
