#!/bin/sh
echo 'installing the linux scripts'
echo 'make sure that you are not in use of root user'
sudo cp -p ./linux/etc/* /etc/
cp -p ./linux/ash/* ~/
echo 'this script is only for my own, so you should edit the destination and
/etc/backup-scripts.sh
~/.shell.d/*
~/.zshrc
and so on, yourself.'
