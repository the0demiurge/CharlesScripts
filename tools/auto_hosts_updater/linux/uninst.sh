#!/bin/sh
echo "127.0.0.1 " `cat /etc/hostname`|sudo tee /etc/hosts
sudo rm /etc/hosts
