#!/bin/sh

ssh-keygen -N "" -f /var/go/.ssh/id_rsa
echo "Host * \n   StrictHostKeyChecking no" > $HOME/.ssh/config
service go-server start
