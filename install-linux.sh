#!/bin/sh
echo 'installing the linux scripts'
echo 'make sure that you are not in use of root user'
sudo cp -p ./linux/etc/* /etc/
cp -p ./linux/ash/* ~/
sudo add-apt-repository $(cat ~/.backup/ppa)
sudo apt install $(cat ~/.backup/apps/ubuntu.list)
python3 ~/.userscripts/install.py
echo 'this script is only for my own, so you should edit the destination and
/etc/backup-scripts.sh
~/.shell.d/*
chsh -s /usr/bin/fish
and so on, yourself.'
