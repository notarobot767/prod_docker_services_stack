#!/bin/bash

if [ -z "$USER" ]
#if var USER empty
then
  echo "USER enviornment variable unset!"
else
  useradd -m -s /bin/bash $USER
  usermod -aG sudo $USER
  passwd -d $USER

  echo "AllowUsers $USER" >> /etc/ssh/sshd_config
  cd /home/$USER
  mkdir .ssh
  ssh-keygen -q -t rsa -b 2048 -N '' \
    -f /home/$USER/.ssh/id_rsa \
    -C $USER@$HOSTNAME
  chmod 400 .ssh/id_rsa
  chmod 444 .ssh/id_rsa.pub
  #create user, add to sudo group, remove password
  
  if [ -z "$SSH_KEY" ]
    #if var SSH_KEY empty
  then
    echo "SSH_KEY enviornment variable unset!"
  else
    echo $SSH_KEY > .ssh/authorized_keys
    #create auth key file for pub key login
  fi

  chown -R $USER:$USER /home/$USER
  #ensure all ssh files are owned by USER
fi

/usr/sbin/sshd -D
#start ssh service in background