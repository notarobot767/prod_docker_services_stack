#!/bin/bash

echo "setting timezone from TZ environment variable..."
ln -fs /usr/share/zoneinfo/$TZ /etc/localtime
dpkg-reconfigure -f noninteractive tzdata
# reconfigure timezone from TZ environment variable

if [ -z "$DEV_USER" ]
# if var USER empty
then
  echo "USER enviornment variable unset!"
else
  useradd -M -s /sbin/nologin $DEV_USER
  echo -e "$DEV_PASSWORD\n$DEV_PASSWORD\n" | passwd $DEV_USER
  # create user & set password
fi

/usr/sbin/sshd "$@"
# start ssh service and pass paramaters in compose.yml