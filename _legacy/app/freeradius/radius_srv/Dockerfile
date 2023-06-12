FROM docker.io/library/ubuntu:latest

LABEL maintainer="notarobot" \
  org.label-schema.name="FreeRadius Server" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2021-06-26" \
  org.label-schema.description="Radius server using FreeRadius on Ubuntu" \
  org.label-schema.url="https://www.ogrydziak.net" \
  org.label-schema.vcs-ref="https://github.com/notarobot767/fa26a-docker-services"

ENV TZ=America/New_York
#set timezone variable
#https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

RUN export DEBIAN_FRONTEND=noninteractive && \
  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
  apt-get update -y && apt-get upgrade -y && apt-get install -y tzdata && \
  dpkg-reconfigure --frontend noninteractive tzdata
#update, upgrade, set timezone

RUN apt-get update -y && apt-get install -y \
    freeradius \
    freeradius-mysql \
    freeradius-utils
#install freeradius packages

COPY ./app/. /etc/freeradius/3.0/
#copy custom config into image
#ensure files are not globally writable before copy

EXPOSE 1812/udp
EXPOSE 1813/udp
#radius uses UDP ports 1812 for authorization and 1813 for authenticaion
#https://en.wikipedia.org/wiki/RADIUS

CMD ["freeradius", "-f"]
#-f	Do not fork, stay running as a foreground process
#-X	Debugging mode. When trying to understand how the server works
#https://freeradius.org/radiusd/man/radiusd.html