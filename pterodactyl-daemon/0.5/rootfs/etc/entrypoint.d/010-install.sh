#!/bin/sh

# Redirect STDERR to STDOUT
exec 2>&1

# Make environnement variables accessibles
[ -r /etc/envvars ] && . /etc/envvars

# Create data, config, logs and packs folders
mkdir -p "/srv/daemon-data"
mkdir -p "/srv/daemon/config"
mkdir -p "/srv/daemon/logs"
mkdir -p "/srv/daemon/packs"

# destroy link and recreate it
mvlink /srv/daemon/config /daemon/config
mvlink /srv/daemon/logs /daemon/logs
mvlink /srv/daemon/packs /daemon/packs

# pterodactyl user used for server containers
$(grep -q "^pterodactyl:" /etc/group) || addgroup -S pterodactyl
$(grep -q "^pterodactyl:" /etc/passwd) || adduser -S -D -G pterodactyl pterodactyl

# Adjust foders owner
chown -R pterodactyl:pterodactyl /srv/daemon-data
chown -R pterodactyl:pterodactyl /daemon/config
chown -R pterodactyl:pterodactyl /daemon/logs
chown -R pterodactyl:pterodactyl /daemon/packs
