#!/bin/sh

# Redirect STDERR to STDOUT
exec 2>&1

# Make environnement variables accessibles
[ -r /etc/envvars ] && . /etc/envvars

# Make sure folders exist
mkdir -p "/srv/daemon-data"

# Create data, config, logs and packs folders
mkdir -p "/srv/daemon/config"
mkdir -p "/srv/daemon/logs"
mkdir -p "/srv/daemon/packs"

# destroy link and recreate it
mvlink /srv/daemon-data /daemon/data
mvlink /srv/daemon/config /daemon/config
mvlink /srv/daemon/logs /daemon/logs
mvlink /srv/daemon/packs /daemon/packs
