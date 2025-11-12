#!/bin/sh

REDIS_IMAGE=$1
REDIS_VERSION=$2
REDIS_PORT=$3
REDIS_PASSWORD=$4
REDIS_CONTAINER_NAME=$5
REDIS_REMOVE_CONTAINER_ON_EXIT=$6

# 🛡️ Default version fallback
if [ -z "$REDIS_VERSION" ]; then
  echo "Missing Redis version in the [redis-version] input. Received value: $REDIS_VERSION"
  echo "Falling back to Redis version [latest]"
  REDIS_VERSION='latest'
fi

# 🛠️ Build docker run args
DOCKER_RUN_ARGS="--name $REDIS_CONTAINER_NAME --publish $REDIS_PORT:6379 --detach"

# 🗑️ If remove flag is true, run container with --rm (auto-remove on exit)
if [ "$REDIS_REMOVE_CONTAINER_ON_EXIT" = "true" ]; then
  DOCKER_RUN_ARGS="--rm $DOCKER_RUN_ARGS"
fi

# 🔐 Add password if provided
if [ -n "$REDIS_PASSWORD" ]; then
  DOCKER_RUN_ARGS="$DOCKER_RUN_ARGS $REDIS_IMAGE:$REDIS_VERSION redis-server --requirepass $REDIS_PASSWORD"
else
  DOCKER_RUN_ARGS="$DOCKER_RUN_ARGS $REDIS_IMAGE:$REDIS_VERSION"
fi

# 🚀 Start Redis
echo "Starting single-node Redis instance: $DOCKER_RUN_ARGS"
docker run $DOCKER_RUN_ARGS
