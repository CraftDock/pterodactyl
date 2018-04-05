#!/bin/sh

# Redirect STDERR to STDOUT
exec 2>&1

# Make environnement variables accessibles
[ -r /etc/envvars ] && . /etc/envvars

# Make sure folders exist
mkdir -p ${p_data}

# Adjust file permissions
find ${p_path}/storage/*        -type d -print0 | xargs -0 chmod 755
find ${p_path}/bootstrap/cache/ -type f -print0 | xargs -0 chmod 755

# chown Directories
find ${p_path}/storage/         \( \! -user ${p_user} -o \! -group ${p_group} \) -print0 | xargs -0 -r chown ${p_user}:${p_group}
find ${p_path}/bootstrap/cache/ \( \! -user ${p_user} -o \! -group ${p_group} \) -print0 | xargs -0 -r chown ${p_user}:${p_group}

# Put files into volumes on first start
mvlink ${p_path}/bootstrap/cache    ${p_data}/cache
mvlink ${p_path}/storage            ${p_data}/storage

#
find ${p_data} \( -name ".gitkeep" -o -name ".githold" -o -name ".gitignore" \) -print0 | xargs -0 rm -rf \
