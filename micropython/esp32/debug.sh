#!/usr/bin/env bash

REGISTRY='registry.cn-beijing.aliyuncs.com'
NAMESPACE='licsber'
NAME='micropython-esp32'
IMAGE="$REGISTRY/$NAMESPACE/$NAME"

sudo docker run --rm -it "$IMAGE" bash
