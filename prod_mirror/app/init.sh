#!/bin/bash

echo "setting timezone from TZ environment variable..."
ln -fs /usr/share/zoneinfo/$TZ /etc/localtime
dpkg-reconfigure -f noninteractive tzdata
# reconfigure timezone from TZ environment variable

export GNUPGHOME=/etc/apt/keyrings/mirrorkeyring

debmirror --rsync-options "-aIL --partial --no-group --no-owner" "$@"
# allows injection of args from docker-compose.yml in scommand field
# rsync-options had to be put here bc wouldn't fuction in CMD injection
    # in docker-compose.yml. Could not read args as a single string
