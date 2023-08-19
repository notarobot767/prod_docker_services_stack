#!/bin/bash

#install custom ubuntu mirror

APT_SOURCE=/etc/apt/sources.list
UBUNTU_MIRROR=http://apt-mirror.ogrydziak.net/ubuntu

echo "deb $UBUNTU_MIRROR jammy main restricted universe multiverse" > $APT_SOURCE
echo "deb $UBUNTU_MIRROR jammy-updates main restricted universe multiverse" >> $APT_SOURCE
echo "deb $UBUNTU_MIRROR jammy-backports main restricted universe multiverse" >> $APT_SOURCE
echo "deb $UBUNTU_MIRROR jammy-security main restricted universe multiverse" >> $APT_SOURCE