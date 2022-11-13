#!/bin/bash

if [ -z "$DEV_USER" ]
#if var USER empty
then
  echo "USER enviornment variable unset!"
else
  useradd -s /bin/bash $DEV_USER
  chown $DEV_USER:$DEV_USER /app/sftp
  echo ${DEV_USER}:${DEV_PW} | chpasswd
  echo "HostKeyAlgorithms +ssh-rsa"               >> /etc/ssh/sshd_config && \
  echo "PubkeyAcceptedKeyTypes +ssh-rsa"          >> /etc/ssh/sshd_config && \
  echo "AllowUsers $DEV_USER"                     >> /etc/ssh/sshd_config
  echo "Match User $DEV_USER"                     >> /etc/ssh/sshd_config
  echo "ForceCommand internal-sftp -d /app/sftp"  >> /etc/ssh/sshd_config
  echo "PasswordAuthentication yes"               >> /etc/ssh/sshd_config
  echo "ChrootDirectory /app/"                    >> /etc/ssh/sshd_config
  echo "Match User $DEV_USER"                     >> /etc/ssh/sshd_config
  echo "PermitTunnel no"                          >> /etc/ssh/sshd_config
  echo "AllowAgentForwarding no"                  >> /etc/ssh/sshd_config
  echo "AllowTcpForwarding no"                    >> /etc/ssh/sshd_config
  echo "X11Forwarding no"                         >> /etc/ssh/sshd_config
fi
#https://serverfault.com/questions/910789/chroot-sftp-possible-to-allow-user-to-write-to-current-chroot-directory
#https://www.cyberciti.biz/faq/how-to-use-sed-to-find-and-replace-text-in-files-in-linux-unix-shell/

/usr/sbin/sshd -D
#start ssh service in background