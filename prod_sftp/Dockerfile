FROM docker.io/library/ubuntu:24.04

ENV TZ="Etc/UTC"
# set timezone variable to UTC
# set actual timezone with TZ ENV variable in compose file
# https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
  apt-get update && apt-get upgrade -y && apt-get install -y tzdata \
  # set timezone with TZ var to avoid prompt with install tzdata
  # update, upgrade, set timezone
  \
  openssh-server && \
  # ssh server
  \
  rm -rf /var/lib/apt/lists/*
  # remove apt package cache

COPY ./app/init.sh /etc/init.sh
#COPY ./app/sshd /etc/ssh/sshd

RUN mkdir -p /app/sftp && \
  chmod 777 /app/sftp && \
  # root dir for sftp files
  \
  echo "PermitRootLogin no" >> /etc/ssh/sshd_config && \
  echo "UseDNS no" >> /etc/ssh/sshd_config && \
  echo "Protocol 2" >> /etc/ssh/sshd_config && \
  echo "X11Forwarding no" >> /etc/ssh/sshd_config && \
  echo "AllowTcpForwarding no" >> /etc/ssh/sshd_config && \
  echo "AllowAgentForwarding no" >> /etc/ssh/sshd_config && \
  echo "Subsystem sftp internal-sftp" >> /etc/ssh/sshd_config && \
  echo "ChrootDirectory /app" >> /etc/ssh/sshd_config && \
  echo "ForceCommand internal-sftp" >> /etc/ssh/sshd_config && \
  # ensure only sftp is allowed
  \
  chmod +x /etc/init.sh && \
  #ensure script is has execute permissions
  service ssh start
  # why do I need this?...

ENTRYPOINT ["/etc/init.sh"]

EXPOSE 22/tcp
# sftp uses tcp port 22

LABEL maintainer="human" \
  org.label-schema.name="sftp server" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2024-10-6" \
  org.label-schema.description="SFTP Server" \
  org.label-schema.url="https://www.ogrydziak.net" \
  org.label-schema.vcs-ref="https://github.com/notarobot767/prod_docker_services_stack"