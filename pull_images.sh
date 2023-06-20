#!/bin/bash

cd "${0%/*}"/bind9
for d in code_server download endlessh guac plex portainer rocket_chat zabbix
do
    cd ../$d
    sudo docker compose pull
done

for image in ubuntu:22.04 internetsystemsconsortium/bind9:9.18
do
    sudo docker pull $image
    echo
done