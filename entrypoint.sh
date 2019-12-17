#!/bin/sh

sh -c "docker run -d -p 6379:6379 redis:$INPUT_REDIS_VERSION"
