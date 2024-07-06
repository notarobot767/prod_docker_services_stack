#!/bin/bash

echo "setting timezone from TZ environment variable..."
ln -fs /usr/share/zoneinfo/$TZ /etc/localtime
dpkg-reconfigure -f noninteractive tzdata
#reconfigure timezone from TZ environment variable

nginx "$@"
#allows injection of tftp args from docker-compose.yml in command field