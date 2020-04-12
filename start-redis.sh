#!/bin/sh

REDIS_VERSION=$1

docker run --name redis --publish 6379:6379 --detach redis:$REDIS_VERSION
