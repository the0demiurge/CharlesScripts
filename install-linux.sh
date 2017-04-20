#!/bin/sh
echo 'installing the linux scripts'
./install-hosts.sh
sudo cp -p ./linux/etc/cron.daily/update-hosts /etc/cron.daily/
sudo cp -p ./linux/etc/hosts.add /etc/
sudo cp -p ./linux/etc/hosts.list /etc/
sudo cp -p ./linux/etc/cron.hourly/wallpaper-earthview /etc/cron.hourly/

cp -p ./linux/ash/* ~/
sudo add-apt-repository $(cat ~/.backup/ppa)
sudo apt update
sudo apt install $(cat ~/.backup/apps/ubuntu.list)
python3 ~/.userscripts/install.py
chsh -s /usr/bin/fish
echo 'all done!'
echo 'please manually edit and place ./linux/etc/cron.daily/backup-scripts to /etc/cron.daily/'
