#!/bin/bash

if [ -z "$DEV_USER" ]
#if var USER empty
then
  echo "USER enviornment variable unset!"
else
  useradd -m -s /bin/bash $DEV_USER
  usermod -aG sudo $DEV_USER
  passwd -d $DEV_USER

  echo "AllowUsers $DEV_USER" >> /etc/ssh/sshd_config
  cd /home/$DEV_USER
  mkdir .ssh
  ssh-keygen -q -t rsa -b 2048 -N '' \
    -f /home/$DEV_USER/.ssh/id_rsa \
    -C $DEV_USER@$HOSTNAME
  chmod 400 .ssh/id_rsa
  chmod 444 .ssh/id_rsa.pub
  #create user, add to sudo group, remove password
  
  if [ -z "$DEV_SSH_KEY" ]
    #if var SSH_KEY empty
  then
    echo "SSH_KEY enviornment variable unset!"
  else
    echo $DEV_SSH_KEY > .ssh/authorized_keys
    #create auth key file for pub key login
  fi

  chown -R $DEV_USER:$USER /home/$DEV_USER
  #ensure all ssh files are owned by USER
fi

/usr/sbin/sshd -D
#start ssh service in background