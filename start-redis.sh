#!/bin/sh

docker_run="docker run"
docker_run="$docker_run --name redis --publish 6379:6379 --detach redis:$1"

sh -c "$docker_run"
