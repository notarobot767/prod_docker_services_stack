#!/bin/bash

#install docker gpg key, add apt source, install docker
#https://docs.docker.com/engine/install/ubuntu/

DOCKER_MIRROR="https://apt-mirror.ogrydziak.net/docker"
DOCKER_GPG_KEY="https://apt-mirror.ogrydziak.net/_support_scripts/docker.gpg"
CODENAME=jammy
#specify mirrors and codename

sudo apt update
sudo apt install -y ca-certificates curl gnupg
#install necessary tools

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL $DOCKER_GPG_KEY | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
#install docker key


echo "deb [arch="$(dpkg --print-architecture)" \
  signed-by=/etc/apt/keyrings/docker.gpg] \
  $DOCKER_MIRROR $CODENAME stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  #add docker repo

sudo apt update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
#update repo and install docker