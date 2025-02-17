#!/bin/bash

echo "setting timezone from TZ environment variable..."
ln -fs /usr/share/zoneinfo/$TZ /etc/localtime
dpkg-reconfigure -f noninteractive tzdata
# reconfigure timezone from TZ environment variable

iperf3 "$@" >> /logs/iperf3.log
# allows injection of args from compose.yml in command field