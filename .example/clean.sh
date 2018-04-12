#!/bin/bash

# set -e : Exit the script if any statement returns a non-true return value.
# set -u : Exit the script when using uninitialised variable.
set -eu

# Script path
spath="$( cd "$(dirname "$0")" ; pwd -P )"

clear

# Stop all first
sh $spath/stop.sh

echo "**** delete containers ... ***"
for container_id in $(docker ps -a -q); do docker rm $container_id; done

echo "**** delete volumes ... ***"
for volume_id in $(docker volume ls -q -f dangling=true); do docker volume rm $volume_id; done

echo "**** delete networks ... ***"
docker network prune --force    2> /dev/null
