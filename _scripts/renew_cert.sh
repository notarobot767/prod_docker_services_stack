#!/bin/bash

cd "$(dirname "$0")" || exit 1
# ensure script will always set working dir to script location

cd ../prod_letsencrypt
docker compose pull
docker compose up renew

cd ../prod_proxy
docker compose restart rproxy