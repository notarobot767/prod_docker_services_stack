#!/bin/bash

if [ -z "$DEV_USER" ]
  #if var USER empty
then
  echo "USER enviornment variable unset!"
else
  if id -u $DEV_USER &> /dev/null; then
    echo "User exists, starting SSH immediately!"
  else
    #if user does not exist
    echo "Creating user and running scipt!"
    useradd -M -s /bin/false $DEV_USER
      #-M create user without home folder
      #-s specify shell to none
    chown $DEV_USER:$DEV_USER /app/sftp
      #ensure dir sftp is writable
      #dir is created/mapped from service yml file
    echo ${DEV_USER}:${DEV_PW} | chpasswd
      #change passowrd from var in secrets
    #echo "HostKeyAlgorithms +ssh-rsa"               >> /etc/ssh/sshd_config
    #echo "PubkeyAcceptedKeyTypes +ssh-rsa"          >> /etc/ssh/sshd_config
      #enable legacy support for cisco devices
      #might not need
    echo "AllowUsers $DEV_USER"                     >> /etc/ssh/sshd_config
      #ensure DEV_USER is only user allowed for ssh
    echo "Match User $DEV_USER"                     >> /etc/ssh/sshd_config
      #next command only apply to DEV_USER
    echo "ForceCommand internal-sftp"               >> /etc/ssh/sshd_config
      #force use of SFTP. User cannot ssh
    echo "PasswordAuthentication yes"               >> /etc/ssh/sshd_config
    echo "ChrootDirectory /app/"                    >> /etc/ssh/sshd_config
      #restrict root dir to /app
      #app is owed by root, but /app/sftp is owned by DEV_USER
      #DEV_USER can write in /app/sftp
      #https://serverfault.com/questions/910789/chroot-sftp-possible-to-allow-user-to-write-to-current-chroot-directory
    echo "PermitTunnel no"                          >> /etc/ssh/sshd_config
    echo "AllowAgentForwarding no"                  >> /etc/ssh/sshd_config
    echo "AllowTcpForwarding no"                    >> /etc/ssh/sshd_config
    echo "X11Forwarding no"                         >> /etc/ssh/sshd_config
      #turn off since not using
  fi
fi

/usr/sbin/sshd -D
#start ssh service in background