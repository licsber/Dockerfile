#!/usr/bin/env bash

DOCKERFILE=Dockerfile.r4se.3-pack
REGISTRY=registry.cn-beijing.aliyuncs.com
NAMESPACE=licsber
REPOSITORY=github
TAG=r4se.3-pack

IMAGE="$REGISTRY/$NAMESPACE/$REPOSITORY:$TAG"
sudo docker build -t "$IMAGE" --file "$DOCKERFILE" .
sudo docker push "$IMAGE"

