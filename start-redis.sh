#!/bin/sh

REDIS_IMAGE=$1
REDIS_VERSION=$2
REDIS_PORT=$3
REDIS_PASSWORD=$4
REDIS_CONTAINER_NAME=$5
REDIS_REMOVE_CONTAINER=$6

if [ -z "$REDIS_VERSION" ]; then
  echo "Missing Redis version in the [redis-version] input. Received value: $REDIS_VERSION"
  echo "Falling back to Redis version [latest]"
  REDIS_VERSION='latest'
fi

DOCKER_RUN_ARGS="--name $REDIS_CONTAINER_NAME --publish $REDIS_PORT:6379 --detach $REDIS_IMAGE:$REDIS_VERSION"

if [ -n "$REDIS_PASSWORD" ] ; then
  DOCKER_RUN_ARGS="$DOCKER_RUN_ARGS redis-server --requirepass $REDIS_PASSWORD"
fi

if [ "$REDIS_REMOVE_CONTAINER" == "true" ] ; then
  DOCKER_RUN_ARGS="$DOCKER_RUN_ARGS --rm"
fi

echo "Starting single-node Redis instance: $DOCKER_RUN_ARGS"
docker run $DOCKER_RUN_ARGS
