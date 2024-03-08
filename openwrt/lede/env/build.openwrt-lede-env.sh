#!/usr/bin/env bash

DOCKERFILE=Dockerfile.openwrt-lede-env
REGISTRY=registry.cn-beijing.aliyuncs.com
NAMESPACE=licsber
REPOSITORY=github
TAG=openwrt-lede-env-manual

IMAGE="$REGISTRY/$NAMESPACE/$REPOSITORY:$TAG"
sudo docker build -t "$IMAGE" --file "$DOCKERFILE" .
sudo docker push "$IMAGE"
