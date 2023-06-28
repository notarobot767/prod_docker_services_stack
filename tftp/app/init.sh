#!/bin/bash

busybox syslogd
#start sysloging to /var/log/messages

in.tftpd -V
echo "starting tftp server..."
#no operational purpose other than displaying to screen
  #version of tftpd
  #server is starting

in.tftpd -lscv -u tftp -B 1468 /srv/tftp
#--foreground or -L is required if not tailing syslog with command below
#https://manpages.debian.org/testing/tftpd-hpa/tftpd.8.en.html

tail -f /var/log/messages
#send to foreground the syslog file
#useful for seeing logs with console
#docker compose logs -f