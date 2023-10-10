#!/bin/bash

#additional files required for apt-mirror to function correctly

mirror=http://archive.ubuntu.com/ubuntu
cd /nfs/media/apt-mirror/archive.ubuntu.com/ubuntu/dists

for dist in jammy jammy-updates jammy-security jammy-backports; do
  for comp in main restricted universe multiverse; do

    #icons
    for size in 48 64 128; do
      wget $mirror/dists/${dist}/${comp}/dep11/icons-${size}x${size}@2.tar.gz -O ${dist}/${comp}/dep11/icons-${size}x${size}@2.tar.gz; 
    done
    
    #cnf
    mkdir -p ${dist}/${comp}/cnf
    wget $mirror/dists/${dist}/${comp}/cnf/Commands-amd64.xz -O ${dist}/${comp}/cnf/Commands-amd64.xz; 

    #binary-i386
    #mkdir -p ${dist}/${comp}/binary-i386
    #wget $mirror/dists/${dist}/${comp}/binary-i386/Packages.xz -O ${dist}/${comp}/binary-i386/Packages.xz; 
  
  done
done