#!/usr/bin/env bash

DOCKERFILE=Dockerfile.r4se
REGISTRY=registry.cn-beijing.aliyuncs.com
NAMESPACE=licsber
REPOSITORY=github
TAG=r4se.manual

sudo docker build -t "$REGISTRY/$NAMESPACE/$REPOSITORY:$TAG" --file "$DOCKERFILE" .

