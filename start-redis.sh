#!/bin/sh

REDIS_VERSION=$1

if [ -z "$REDIS_VERSION" ]; then
  echo "Missing Redis version in the [redis-version] input. Received value: $REDIS_VERSION"
  echo "Falling back to Redis version [latest]"
  REDIS_VERSION='latest'
fi

echo "Starting single-node Redis instance"
docker run --name redis --publish 6379:6379 --detach redis:$REDIS_VERSION
