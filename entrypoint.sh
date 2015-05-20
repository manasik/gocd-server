#!/bin/sh

ssh-keygen -N "" -f /var/go/.ssh/id_rsa
sudo echo -e "Host * \n   StrictHostKeyChecking no" > $HOME/.ssh/config
sudo service go-server start
