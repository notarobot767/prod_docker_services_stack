#!/bin/bash

cd "$(dirname "$0")" || exit 1
# ensure script will always set working dir to script location

# update plex
cd ../prod_plex
docker compose pull; docker compose up -d

# update vs-code
cd ../prod_code
docker compose pull; docker compose up -d

# update bastion
cd ../prod_bastion
docker compose pull; docker compose up -d

# update qbittorent
cd ../prod_qbittorrent
docker compose pull; docker compose up -d

# update zabbix
#cd ../prod_zabbix
#docker compose pull; docker compose up -d

# update authentik
cd ../prod_authentik
docker compose pull; docker compose up -d

# update cloudflared tunnel
cd ../prod_cloudflared
docker compose pull; docker compose up -d