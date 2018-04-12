#!/bin/bash

# Script path
spath="$( cd "$(dirname "$0")" ; pwd -P )"

clear

echo "**** Create networks ... ****"
[ -z "$(docker network ls -q -f ""name=database"")" ]        && docker network create --driver bridge database
[ -z "$(docker network ls -q -f ""name=proxy"")" ]           && docker network create --driver bridge proxy
[ -z "$(docker network ls -q -f ""name=pterodactyl_nw"")" ]  && docker network create --driver bridge pterodactyl_nw


echo "**** Create data folders ... ****"
mkdir -p /srv/mariadb/db                 # Database folder
mkdir -p /srv/mariadb/backup             # Database backup
mkdir -p /srv/proxy/conf.d               # Nginx proxy config files
mkdir -p /srv/portainer                  # Portainer data files
mkdir -p /srv/panel-data                 # Panel files:
mkdir -p /srv/daemon-data                # daemon data files:
mkdir -p /srv/daemon/config              # daemon config files:

cp "$spath/pterodactyl-daemon/core.json" "/srv/daemon/config/core.json"

echo "**** Building containers ****"
echo "**** - mariadb"               && docker-compose --file $spath/mariadb/docker-compose.yml              --project-name mariadb build --pull
echo "**** - nginx proxy"           && docker-compose --file $spath/proxy/docker-compose.yml                --project-name proxy build --pull
echo "**** - phpmyadmin"            && docker-compose --file $spath/phpmyadmin/docker-compose.yml           --project-name phpmyadmin build --pull
echo "**** - portainer"             && docker-compose --file $spath/portainer/docker-compose.yml            --project-name portainer build --pull
echo "**** - pterodactyl-panel"     && docker-compose --file $spath/pterodactyl-panel/docker-compose.yml    --project-name pterodactyl-panel build --pull
echo "**** - pterodactyl-daemon"    && docker-compose --file $spath/pterodactyl-daemon/docker-compose.yml   --project-name pterodactyl-daemon build --pull


# remove dangling containers
for container_id in $(docker images -q -f dangling=true); do docker rmi $container_id; done
