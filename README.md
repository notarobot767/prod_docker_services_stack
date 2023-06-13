# OG Networks Production Service Stack
This stack of services is used in my homelab and configured specifically to fit my needs. Feel free to use it change it for your own purposes. Each app is contained in its own folder with its own localized docker-compose.yml file. The purpose of this design decision is to grant modularity. Previous commits had a single docker file and separate files for each service. This proved to be overly complex as docker compose is not built in way at the time for scaling many apps in singe compose stack in my opinion. The apps include:

## Visual Studio Code Server
dir: code_server

## qBittorrent
dir: download

## NGINX HTTP File Server
dir: files

## PLEX and Tautulli
dir: plex

# RocketChat
dir: rocket

# NGINX WWW Server
dir: www

# Zabbix Nework Monitoring
dir: zabbix