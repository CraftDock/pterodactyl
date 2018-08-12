#!/bin/sh

# set -e : Exit the script if any statement returns a non-true return value.
set -e

# Make environnement variables accessibles
[ -r /etc/envvars ] && . /etc/envvars

# search for the panel url
[ -n "$DOCKER_HOST_IP" -a -n "$PANEL_URL" -a -z "$(grep \"$PANEL_URL\" /etc/hosts)" ] && echo "$DOCKER_HOST_IP $PANEL_URL" >> /etc/hosts
