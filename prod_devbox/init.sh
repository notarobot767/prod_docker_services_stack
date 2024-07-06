#!/bin/bash

if [ -z "$DEV_USER" ]
#if var USER empty
then
  echo "USER enviornment variable unset!"
else
  useradd -m -s /bin/bash $DEV_USER
  usermod -aG sudo $DEV_USER
  passwd -d $DEV_USER
  # create user, add to sudo group, remove password

  echo "AllowUsers $DEV_USER" >> /etc/ssh/sshd_config
  cd /home/$DEV_USER
  mkdir .ssh
  # restrict ssh only to DEV_USER
  
  ssh-keygen -q -t ed25519 -N '' \
    -f /home/$DEV_USER/.ssh/id_ed25519 \
    -C ecdsa521@$HOSTNAME
  # ed25519 key
  
  ssh-keygen -q -t ecdsa -b 256 -N '' \
    -f /home/$DEV_USER/.ssh/id_ecdsa \
    -C ecdsa256@$HOSTNAME
  # ecdsa 256 key
  
  ssh-keygen -q -t rsa -b 2048 -N '' \
    -f /home/$DEV_USER/.ssh/id_rsa \
    -C rsa2048@$HOSTNAME
  # rsa 2048 key
  
  chmod 400 .ssh/id_*
  chmod 444 .ssh/id_*.pub
  # ensure proper permissions on ssh keys
  
  if [ -z "$DEV_SSH_KEY" ]
    #if var SSH_KEY empty
  then
    echo "SSH_KEY enviornment variable unset!"
  else
    echo $DEV_SSH_KEY > .ssh/authorized_keys
    # add auth key file for pub key login
  fi

  chown -R $DEV_USER:$USER /home/$DEV_USER
  # ensure all ssh files are owned by USER
fi

source /etc/bash_completion
# ensure bash completition will work

/usr/sbin/sshd -D
# start ssh service in background