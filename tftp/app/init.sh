#!/bin/bash

busybox syslogd
#start syslogging to /var/log/messages

in.tftpd -V
echo "starting tftp server..."
#no operational purpose other than displaying to screen
  #version of tftpd
  #server is starting

in.tftpd "$@"
#allows injection of tftp args from docker-compose.yml in command field

tail -f /var/log/messages
#send to foreground the syslog file
#useful for seeing logs with console
#docker compose logs -f