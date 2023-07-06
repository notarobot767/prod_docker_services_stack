#!/bin/bash

echo "setting timezone from TZ environment variable..."
ln -fs /usr/share/zoneinfo/$TZ /etc/localtime
dpkg-reconfigure -f noninteractive tzdata
#reconfigure timezone from TZ environment variable

echo "starting busybox..."
busybox syslogd
#start syslogging to /var/log/messages

echo "starting tftp server..."
in.tftpd -V
#no operational purpose other than displaying to screen
  #version of tftpd
  #server is starting

in.tftpd "$@"
#allows injection of tftp args from docker-compose.yml in command field

tail -f /var/log/messages
#send to foreground the syslog file
#useful for seeing logs with console
#docker compose logs -f