# OG Networks Production Service Stack
This stack of services is used in my homelab and configured specifically to fit my needs. Feel free to use it change it for your own purposes. Each app is contained in its own folder with its own localized docker-compose.yml file. The purpose of this design decision is to grant modularity. Previous commits had a single docker file and separate files for each service. This proved to be overly complex as docker compose is not built in way at the time for scaling many apps in singe compose stack in my opinion. The apps include:

## BIND9 DNS Server
The Berkeley Internet Name Domain (BIND 9) implements an Internet domain name server. BIND 9 is the most widely-used name server software on the Internet, and is supported by the Internet Software Consortium, www.isc.org.

[Reference Manual](https://bind9.readthedocs.io/en/stable/index.html)

dir: [bind9](bind9)

## Chrony NTP Server
Chrony is an implementation of the Network Time Protocol (NTP). It's an alternative to ntpd, which is a reference implementation of NTP. It runs on Unix-like operating systems (including Linux and macOS) and is released under the GNU GPL v2. It's the default NTP client and server in Red Hat Enterprise Linux 8 and SUSE Linux Enterprise Server 15, and available in many Linux distributions.

[Reference Manual](https://chrony-project.org/documentation.html)

dir: [chrony](chrony)

## Visual Studio Code Server
Visual Studio Code is a streamlined code editor with support for development operations like debugging, task running, and version control. It aims to provide just the tools a developer needs for a quick code-build-debug cycle and leaves more complex workflows to fuller featured IDEs. Code-server is VS Code running on a remote server, accessible through the browser.

[Docker Image](https://hub.docker.com/r/linuxserver/code-server)

dir: [code_server](code_server)

## qBittorrent
The [qBittorrent project](https://www.qbittorrent.org/)
aims to provide an open-source software alternative to µTorrent. qBittorrent is based on the Qt toolkit and libtorrent-rasterbar library. This implementation uses a headless web appplication from a docker container.

[Docker Image](https://hub.docker.com/r/linuxserver/qbittorrent)

dir: [download](download)

## Elasticsearch Logstash Kibana (ELK) Stack
The [Elastic Stack](https://www.elastic.co/guide/index.html)
is a fast and highly scalable set of components — Elasticsearch, Kibana, Beats, Logstash, and others — that together enable you to securely take data from any source, in any format, and then search, analyze, and visualize it. Built on a foundation of free and open, Elasticsearch and Kibana pave the way for diverse use cases that start with logging and span as far as your imagination takes you.

Guides:
[Elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html)
[Logstash](https://www.elastic.co/guide/en/logstash/current/index.html)
[Kibana](https://www.elastic.co/guide/en/kibana/current/index.html)
[Beats](https://www.elastic.co/guide/en/beats/libbeat/current/getting-started.html)

dir: [elk](elk)

## Endless SSH (endlessh)
Endlessh is an SSH tarpit that very slowly sends an endless, random SSH banner. It keeps SSH clients locked up for hours or even days at a time. The purpose is to put your real SSH server on another port and then let the script kiddies get stuck in this tarpit instead of bothering a real server.

[Docker Image](https://hub.docker.com/r/linuxserver/endlessh)

dir: [endlessh](endlessh)

## Guacamole RDP/SSH Server
[Apache Guacamole](https://guacamole.apache.org/)
is a clientless remote desktop gateway. It supports standard protocols like VNC, RDP, and SSH. It is considered clientless because no plugins or client software are required. Thanks to HTML5, once Guacamole is installed on a server, all you need to access your desktops is a web browser.

Docker Images:
[mariadb](https://hub.docker.com/_/mariadb)
[guacd](https://hub.docker.com/r/guacamole/guacd)
[guacamole](https://hub.docker.com/r/guacamole/guacamole)

dir: [guac](guac)

## Plex and Tautulli
[Plex](https://www.plex.tv/about/)
organizes video, music and photos from personal media libraries and streams them to smart TVs, streaming boxes and mobile devices.
[Tautulli](https://tautulli.com/)
is a python based web application for monitoring, analytics and notifications for Plex Media Server.

Docker Images:
[Plex](https://hub.docker.com/r/linuxserver/plex)
[Tautulli](https://hub.docker.com/r/linuxserver/tautulli)

dir: [plex](plex)

## Portainer CE
[Portainer](https://www.portainer.io/why-portainer)
is a web GUI approach to containers. It accelerates container adoption. It reduces operational complexity and addresses the security challenges of running containers in Docker, Swarm, Nomad and Kubernetes. 

[Docker Image](https://hub.docker.com/r/portainer/portainer-ce)

dir: [portainer](portainer)

## RocketChat
[Rocket.Chat](https://docs.rocket.chat/)
, a secure and customizable open-source platform, is designed for organizations with stringent data protection standards. It seamlessly integrates real-time conversations across web, desktop, and mobile devices, connecting colleagues, businesses, and customers.

Docker Images:
[Mongodb](https://hub.docker.com/_/mongo)
[RocketChat](https://github.com/RocketChat/Rocket.Chat/releases)

dir: [rocket](rocket)

## NGINX WWW Server
Nginx (pronounced "engine-x") is an open source reverse proxy server for HTTP, HTTPS, SMTP, POP3, and IMAP protocols, as well as a load balancer, HTTP cache, and a web server (origin server). The nginx project started with a strong focus on high concurrency, high performance and low memory usage. It is licensed under the 2-clause BSD-like license and it runs on Linux, BSD variants, Mac OS X, Solaris, AIX, HP-UX, as well as on other *nix flavors. It also has a proof of concept port for Microsoft Windows.

[Docker Image](https://hub.docker.com/_/nginx)

dir: [www](www)

## NGINX HTTP File Server
The [Fancy Index module](https://www.nginx.com/resources/wiki/modules/fancy_index/)
makes possible the generation of file listings, like the built-in autoindex module does, but adding a touch of style. 

dir: [files](download)

## Zabbix Nework Monitoring
[Zabbix](https://www.zabbix.com/documentation/current/en/manual/introduction/about)
is a software that monitors numerous parameters of a network and the health and integrity of servers, virtual machines, applications, services, databases, websites, the cloud and more. Zabbix uses a flexible notification mechanism that allows users to configure email based alerts for virtually any event. This allows a fast reaction to server problems. Zabbix offers excellent reporting and data visualization features based on the stored data. This makes Zabbix ideal for capacity planning.

[Docker Images](https://www.zabbix.com/container_images)

dir: [zabbix](zabbix)

## APT Mirror
[apt-mirror](https://apt-mirror.github.io/) is a small tool that provides ability to mirror any parts (or even all) of Debian and Ubuntu GNU/Linux distributions or any other apt sources which typically provided by open source developers. This is useful for local update server in a closed or limited environment.

dir [apt-mirror](apt-mirror)