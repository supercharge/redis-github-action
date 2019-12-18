#!/bin/sh -l

docker run --name redis --publish 6379:6379 --detach redis:$1
