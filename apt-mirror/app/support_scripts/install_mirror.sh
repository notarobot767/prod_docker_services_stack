#!/bin/bash

#install custom ubuntu mirror
#add/replace mirrors in file or just run this script
#/etc/apt/sources.list

#deb [arch=amd64] http://apt-mirror.ogrydziak.net/mirrors/archive.ubuntu.com/ubuntu jammy           main restricted universe multiverse
#deb [arch=amd64] http://apt-mirror.ogrydziak.net/mirrors/archive.ubuntu.com/ubuntu jammy-updates   main restricted universe multiverse
#deb [arch=amd64] http://apt-mirror.ogrydziak.net/mirrors/archive.ubuntu.com/ubuntu jammy-backports main restricted universe multiverse
#deb [arch=amd64] http://apt-mirror.ogrydziak.net/mirrors/archive.ubuntu.com/ubuntu jammy-security  main restricted universe multiverse

echo "deb [arch=amd64] http://apt-mirror.ogrydziak.net/mirrors/archive.ubuntu.com/ubuntu jammy           main restricted universe multiverse" > /etc/apt/sources.list
echo "deb [arch=amd64] http://apt-mirror.ogrydziak.net/mirrors/archive.ubuntu.com/ubuntu jammy-updates   main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb [arch=amd64] http://apt-mirror.ogrydziak.net/mirrors/archive.ubuntu.com/ubuntu jammy-backports main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb [arch=amd64] http://apt-mirror.ogrydziak.net/mirrors/archive.ubuntu.com/ubuntu jammy-security  main restricted universe multiverse" >> /etc/apt/sources.list