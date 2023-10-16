#!/usr/bin/env bash

REGISTRY='registry.cn-beijing.aliyuncs.com'
NAMESPACE='licsber'
NAME='micropython-esp32'
# 2023-01-22-1415-CST
TAG=`date +%F-%H%M-CST`

IMAGE="$REGISTRY/$NAMESPACE/$NAME"
echo "$IMAGE:$TAG"
sudo docker build -t "$IMAGE:$TAG" .
sudo docker push "$IMAGE:$TAG"
sudo docker tag "$IMAGE:$TAG" "$IMAGE:latest"
sudo docker rmi "$IMAGE:$TAG"
sudo docker push "$IMAGE:latest"
