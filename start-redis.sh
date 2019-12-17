#!/bin/sh

sh -c "docker run -p 6379:6379 -d redis:$INPUT_REDIS_VERSION"
