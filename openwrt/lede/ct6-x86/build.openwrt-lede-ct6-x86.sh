#!/usr/bin/env bash

DOCKERFILE=Dockerfile.openwrt-lede-ct6-x86
REGISTRY=registry.cn-beijing.aliyuncs.com
NAMESPACE=licsber
REPOSITORY=github
TAG=openwrt-lede-ct6-x86-manual

IMAGE="$REGISTRY/$NAMESPACE/$REPOSITORY:$TAG"
sudo docker build -t "$IMAGE" --file "$DOCKERFILE" .
sudo docker push "$IMAGE"
