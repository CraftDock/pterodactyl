#!/bin/bash

# Script path
spath="$( cd "$(dirname "$0")" ; pwd -P )"

clear


sh $spath/clean.sh

echo "**** delete images ... ***"
for image_id in $(docker images "pterodactyldaemon_*" -q); do docker rmi $image_id -f; done
for image_id in $(docker images "pterodactylpanel_*" -q); do docker rmi $image_id -f; done
