#!/bin/sh

# Redirect STDERR to STDOUT
exec 2>&1

# Make environnement variables accessibles
[ -r /etc/envvars ] && . /etc/envvars

# Variables
export p_path=/var/www
export p_data=/pterodactyl
export p_user=www-data
export p_group=www-data

# Save original environment variables to /etc/envvars
export > /etc/envvars
