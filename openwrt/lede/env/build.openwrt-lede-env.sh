#!/usr/bin/env bash

DOCKERFILE=Dockerfile.r4se.1-build-env
REGISTRY=registry.cn-beijing.aliyuncs.com
NAMESPACE=licsber
REPOSITORY=github
TAG=openwrt-lede-env

IMAGE="$REGISTRY/$NAMESPACE/$REPOSITORY:$TAG"
sudo docker build -t "$IMAGE" --file "$DOCKERFILE" .
sudo docker push "$IMAGE"
