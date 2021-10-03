#!/bin/bash

busybox syslogd -O /var/log/dhcp/messages
touch /var/lib/dhcp/dhcpd.leases
dhcpd -4 -d
#https://linux.die.net/man/8/dhcpd