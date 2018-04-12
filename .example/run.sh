#!/bin/bash

# set -e : Exit the script if any statement returns a non-true return value.
set -e

# Script path
spath="$( cd "$(dirname "$0")" ; pwd -P )"

clear

echo "**** Running containers ... ****"
echo "**** - mariadb"               && docker-compose --file $spath/mariadb/docker-compose.yml              --project-name mariadb up -d
echo "**** - nginx proxy"           && docker-compose --file $spath/proxy/docker-compose.yml                --project-name proxy up -d
echo "**** - phpmyadmin"            && docker-compose --file $spath/phpmyadmin/docker-compose.yml           --project-name phpmyadmin up -d
echo "**** - portainer"             && docker-compose --file $spath/portainer/docker-compose.yml            --project-name portainer up -d
echo "**** - pterodactyl-panel"     && docker-compose --file $spath/pterodactyl-panel/docker-compose.yml    --project-name pterodactyl-panel up -d
echo "**** - pterodactyl-daemon"    && docker-compose --file $spath/pterodactyl-daemon/docker-compose.yml   --project-name pterodactyl-daemon up
