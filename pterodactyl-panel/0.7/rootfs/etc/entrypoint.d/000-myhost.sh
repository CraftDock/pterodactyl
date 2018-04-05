#!/bin/sh

# set -e : Exit the script if any statement returns a non-true return value.
set -e

# Make environnement variables accessibles
[ -r /etc/envvars ] && . /etc/envvars

# search for the daemon url
[ -n "$DOCKER_HOST_IP" -a -n "$DAEMON_URL" -a -z "$(grep \"$DAEMON_URL\" /etc/hosts)" ] && echo "$DOCKER_HOST_IP $DAEMON_URL" >> /etc/hosts
