# Pterodactyl Daemon

The server control and management daemon built specifically for Pterodactyl Panel.

## Usage

The Pterodactyl Daemon needs to have access to the docker host filesystem and the daemon to work correctly.  
Refer to the main repository link for all information regarding running the pterodactyl panel within docker.

## Required Mounts
`/srv/daemon-data` - Server Data  
`/tmp/pterodactyl` - Temp folder required when creating server  
`/var/run/docker.sock` - Requires the docker daemon socket to operate  
**All mounts are recommended to be mirrored exactly**.

## Optional Mount
`/daemon` - Contains config, data, logs and packs folders  
