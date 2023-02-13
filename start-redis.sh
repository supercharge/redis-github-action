#!/bin/sh

REDIS_IMAGE=$1
REDIS_VERSION=$2
REDIS_PORT=$3
REDIS_CONTAINER_NAME=$4

if [ -z "$REDIS_VERSION" ]; then
  echo "Missing Redis version in the [redis-version] input. Received value: $REDIS_VERSION"
  echo "Falling back to Redis version [latest]"
  REDIS_VERSION='latest'
fi

echo "Starting single-node Redis instance"
docker run --name $REDIS_CONTAINER_NAME --publish $REDIS_PORT:6379 --detach $REDIS_IMAGE:$REDIS_VERSION
