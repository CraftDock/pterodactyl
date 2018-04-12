#!/bin/bash

# Script path
spath="$( cd "$(dirname "$0")" ; pwd -P )"

clear

echo "**** Stop running containers ... ***"
docker stop proxy               2> /dev/null
docker stop phpmyadmin          2> /dev/null
docker stop portainer           2> /dev/null
docker stop pterodactyl-panel   2> /dev/null
docker stop pterodactyl-nginx   2> /dev/null
docker stop pterodactyl-daemon  2> /dev/null
docker stop mariadb             2> /dev/null
docker stop redis               2> /dev/null

