#!/bin/bash

cd /disk2/docker/prod

docker pull ubuntu
docker-compose pull
docker-compose up -d plex plexstats
