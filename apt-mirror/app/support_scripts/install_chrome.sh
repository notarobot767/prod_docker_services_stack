#!/bin/bash

#install docker gpg key, add apt source, install docker
#https://docs.docker.com/engine/install/ubuntu/

CHROME_MIRROR="http://apt-mirror.ogrydziak.net/mirrors/dl.google.com/linux/chrome/deb"
CHROME_GPG_KEY="http://apt-mirror.ogrydziak.net/_support_scripts/chrome.gpg"

sudo apt update
sudo apt install -y ca-certificates curl gnupg
#install necessary tools

wget -q -O $CHROME_GPG_KEY | sudo apt-key add -
#install docker key

echo "deb [arch=amd64] $CHROME_MIRROR $CODENAME stable main"

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
#update repo and install docker