#!/bin/sh
echo 'installing the linux scripts'
./install-hosts.sh
sudo cp -p ./linux/etc/* /etc/
cp -p ./linux/ash/* ~/
sudo add-apt-repository $(cat ~/.backup/ppa)
sudo apt update
sudo apt install $(cat ~/.backup/apps/ubuntu.list)
python3 ~/.userscripts/install.py
chsh -s /usr/bin/fish
echo 'all done!'
