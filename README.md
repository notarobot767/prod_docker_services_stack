# OG Networks Production Service Stack
This stack of services is used in my homelab and configured specifically to fit my needs. Feel free to use it change it for your own purposes. Each app is contained in its own folder with its own localized docker-compose.yml file. The purpose of this design decision is to grant modularity. Previous commits had a single docker file and separate files for each service. This proved to be overly complex as docker compose is not built in way at the time for scaling many apps in singe compose stack in my opinion. The apps include:

## BIND9 DNS Server
dir: [bind9](bind9)

## Chrony NTP Server
dir: [chrony](chrony)

## Visual Studio Code Server
dir: [code_server](code_server)

## qBittorrent
dir: [download](download)

## Endless SSH (endlessh)
dir: [endlessh](endlessh)

## NGINX HTTP File Server
dir: [files](download)

## Guacamole RDP/SSH Server
dir: [guac](guac)

## PLEX and Tautulli
dir: [plex](plex)

## Portainer CE
dir: [portainer](portainer)

## RocketChat
dir: [rocket](rocket)

## NGINX WWW Server
dir: [www](www)

## Zabbix Nework Monitoring
dir: [zabbix](zabbix)