#!/bin/bash

#additional files required for apt-mirror to function correctly

mirror=https://download.docker.com/linux/ubuntu
cd /nfs/media/apt-mirror/download.docker.com/linux/ubuntu/dists

for dist in jammy; do
  #binary-amd64
  for comp in stable; do
    mkdir -p ${dist}/${comp}/binary-amd64
    wget $mirror/dists/${dist}/${comp}/binary-amd64/Packages.gz -O ${dist}/${comp}/binary-amd64/Packages.gz; 
  done
done