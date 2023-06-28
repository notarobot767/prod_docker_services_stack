FROM docker.io/library/ubuntu:22.04

ENV TZ="US/Hawaii"
#set timezone variable
#https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
  #set local timezone
  \
  apt-get update && apt-get upgrade -y && apt-get install -y tzdata \
    #update, upgrade, and set time
    \
    busybox \
    #busybox to see syslog
    \
    tftpd-hpa && \
    #install tftp server
  \
  chown tftp:tftp /srv/tftp && \
  #set folder owner to tftp
  chmod 777 /srv/tftp
  #give write permissions to the folder too

COPY ./app/init.sh /etc/init.sh
RUN chmod +x /etc/init.sh

CMD ["/etc/init.sh"]  
#https://manpages.debian.org/testing/tftpd-hpa/tftpd.8.en.html
#on cisco router, ensure
#ip tftp blocksize 1468
#ip tftp source-interface [interface]

EXPOSE 69/udp
#tftp uses udp port 69

LABEL maintainer="human" \
  org.label-schema.name="tftpd-hpa server" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2023-06-20" \
  org.label-schema.description="TFTP Server" \
  org.label-schema.url="https://www.ogrydziak.net" \
  org.label-schema.vcs-ref="https://github.com/notarobot767/prod_docker_services_stack"