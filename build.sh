#!/usr/bin/env bash

PLATFORMS="linux/amd64,linux/arm64,linux/arm/v7"
GIT_TAG=`git log --pretty=format:'%h' -n 1`

docker buildx build -t"tlrasor/tailon:latest" \
                    -t "tlrasor/tailon:$GIT_TAG" \
                    -f Dockerfile \
                    --push --platform $PLATFORMS .

