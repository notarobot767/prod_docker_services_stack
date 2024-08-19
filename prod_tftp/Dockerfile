FROM docker.io/library/ubuntu:24.04

ENV TZ="Etc/UTC"
#set timezone variable
#https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

#ADD http://mirror.ogrydziak.net/ubuntu-24.04.sources /etc/apt/sources.list.d/ubuntu.sources
# add local mirror faster package downloads

COPY ./app/init.sh /etc/init.sh

RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
  apt-get update && apt-get upgrade -y && apt-get install -y tzdata \
  # set timezone with TZ var to avoid prompt with install tzdata
  # update, upgrade, set timezone
    \
    busybox tftpd-hpa && \
    # busybox to capture syslog
    # tftp server
  \
  rm -rf /var/lib/apt/lists/* && \
  # remove apt package cache
  \
  chown tftp:tftp /srv/tftp && \
  #set folder owner to tftp
  \
  chmod 777 /srv/tftp && \
  #give write permissions to the folder too
  \
  chmod +x /etc/init.sh
  #ensure script is has execute permissions

ENTRYPOINT ["/etc/init.sh"]

EXPOSE 69/udp
#tftp uses udp port 69

LABEL maintainer="human" \
  org.label-schema.name="tftpd-hpa server" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2023-06-20" \
  org.label-schema.description="TFTP Server" \
  org.label-schema.url="https://www.ogrydziak.net" \
  org.label-schema.vcs-ref="https://github.com/notarobot767/prod_docker_services_stack"